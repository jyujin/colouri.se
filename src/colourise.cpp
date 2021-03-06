/*
 * This file is part of the colouri.se project.
 * See the appropriate repository at http://colouri.se/.git for exact file
 * modification records.
*/

/*
 * Copyright (c) 2012, ef.gy Project Members
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
*/

#include <ef.gy/http.h>
#include <ef.gy/fractions.h>
#include <ef.gy/colour-space-hsl.h>

#include <iostream>
#include <boost/algorithm/string/replace.hpp>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/fstream.hpp>

#include <ef.gy/render-xml.h>

#include <ef.gy/continued-fractions.h>

using namespace efgy;
using namespace efgy::math;
using namespace efgy::render;
using namespace boost::filesystem; 
using namespace boost::asio;
using namespace boost;
using namespace std;

class processColourise
{
    public:
        bool operator () (efgy::net::http::session<processColourise> &a)
        {
            static const std::regex rq
                ("/generated/(x?html|svg)/("
                  "(hsl:(-?\\d+)(/(-?\\d+))?:(-?\\d+)(/(-?\\d+))?:(-?\\d+)(/(-?\\d+))?)"
                 "|(rgb:(-?\\d+)(/(-?\\d+))?:(-?\\d+)(/(-?\\d+))?:(-?\\d+)(/(-?\\d+))?)"
                 ")(.(\\d+))?");
            std::smatch matches;

            if (regex_match(a.resource, matches, rq))
            {
                ostringstream reply ("");

                unsigned long precision = 24;
                string sPrecision;

                if (matches[24].matched)
                {
                    sPrecision = matches[24];
                    precision  = atoi(sPrecision.c_str());
                    sPrecision = "<precision>" + sPrecision + "</precision>";
                }

                if (matches[3].matched) // hsl:x:y:z
                {
                    long hNumerator = atoi(string(matches[4]).c_str());
                    long sNumerator = atoi(string(matches[7]).c_str());
                    long lNumerator = atoi(string(matches[10]).c_str());
                    long hDenominator = 1;
                    long sDenominator = 1;
                    long lDenominator = 1;

                    if (matches[6].matched)
                    {
                        hDenominator = atoi(string(matches[6]).c_str());
                        if (hDenominator == 0)
                        {
                            hNumerator = 0;
                            hDenominator = 1;
                        }
                    }
                    if (matches[9].matched)
                    {
                        sDenominator = atoi(string(matches[9]).c_str());
                        if (sDenominator == 0)
                        {
                            sNumerator = 0;
                            sDenominator = 1;
                        }
                    }
                    if (matches[12].matched)
                    {
                        lDenominator = atoi(string(matches[12]).c_str());
                        if (lDenominator == 0)
                        {
                            lNumerator = 0;
                            lDenominator = 1;
                        }
                    }

                    if (hNumerator >= hDenominator)
                    {
                        hNumerator %= hDenominator;
                    }

                    math::vector<fraction,3,format::HSL> t (round(fraction(hNumerator, hDenominator), precision),
                                            round(fraction(sNumerator, sDenominator), precision),
                                            round(fraction(lNumerator, lDenominator), precision));

                    reply << "<set xmlns='http://colouri.se/2012'>";
                    if (sPrecision != "")
                    {
                        reply << sPrecision;
                    }
                    reply << XML() << render::precision(precision) << t;

                    math::vector<fraction,3,format::RGB> tr = t;
                    reply << XML() << render::precision(precision) << tr;

                    (reply << XML() << render::precision(precision)) |= tr;

                    reply << "</set>";
                }
                else if (matches[13].matched) // rgb:x:y:z
                {
                    long rNumerator = atoi(string(matches[14]).c_str());
                    long gNumerator = atoi(string(matches[17]).c_str());
                    long bNumerator = atoi(string(matches[20]).c_str());
                    long rDenominator = 1;
                    long gDenominator = 1;
                    long bDenominator = 1;

                    if (matches[16].matched)
                    {
                        rDenominator = atoi(string(matches[16]).c_str());
                        if (rDenominator == 0)
                        {
                            rNumerator = 0;
                            rDenominator = 1;
                        }
                    }
                    if (matches[19].matched)
                    {
                        gDenominator = atoi(string(matches[19]).c_str());
                        if (gDenominator == 0)
                        {
                            gNumerator = 0;
                            gDenominator = 1;
                        }
                    }
                    if (matches[22].matched)
                    {
                        bDenominator = atoi(string(matches[22]).c_str());
                        if (bDenominator == 0)
                        {
                            bNumerator = 0;
                            bDenominator = 1;
                        }
                    }

                    math::vector<fraction,3,format::RGB> t (round(fraction(rNumerator, rDenominator), precision),
                                            round(fraction(gNumerator, gDenominator), precision),
                                            round(fraction(bNumerator, bDenominator), precision));

                    reply << "<set xmlns='http://colouri.se/2012'>";
                    if (sPrecision != "")
                    {
                        reply << sPrecision;
                    }
                    reply << XML() << render::precision(precision) << t;

                    math::vector<fraction,3,format::HSL> tr = t;
                    reply << XML() << render::precision(precision) << tr;

                    (reply << XML() << render::precision(precision)) |= tr;

                    reply << "</set>";
                }
                else
                {
                    reply << string("<colour xmlns='http://colouri.se/2012'>")
                          << a.method << " " << a.resource
                          << "</colour>";
                }

                a.reply (200,
                         "Content-Type: text/xml; charset=utf-8\r\n",
                         string("<?xml version='1.0' encoding='utf-8'?>")
                         + reply.str());
            }
            else
            {
                a.reply (404,
                         "Content-Type: text/xml; charset=utf-8\r\n",
                         "<?xml version='1.0' encoding='utf-8'?>"
                         "<error xmlns='http://colouri.se/2012'>404</error>");
            }

            return true;
        }
};

int main (int argc, char* argv[])
{
    try
    {
        if (argc != 2)
        {
            std::cerr << "Usage: colourise <socket>\n";
            return 1;
        }

        boost::asio::io_service io_service;

        efgy::net::http::server<processColourise> s(io_service, argv[1]);

        io_service.run();
    }
    catch (std::exception &e)
    {
        std::cerr << "Exception: " << e.what() << "\n";
    }

    return 0;
}
