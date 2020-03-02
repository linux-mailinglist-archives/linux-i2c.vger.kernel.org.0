Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B425175804
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 11:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCBKKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 05:10:41 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44698 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726874AbgCBKKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 05:10:41 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022A9WCP012739;
        Mon, 2 Mar 2020 11:09:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=m+qEFOBjY8YdkVxCC7XRRaaOlYtReGtR4bvDlj+zhXw=;
 b=gFFGShuP90ET3GbRWntIEiB9/5rkkp9GA9xFHLLLyWy0/3gpF+QdeAe6Ufa044TkRBPr
 rxFuy6Wtun7HHDUmRXFM9208fgaxu7Y+aRLR1goP4V6YdjEEDPfcgx4pNti2vndugh1F
 LqGfyy64J1q0GI4U8y5ltI7W53tVjXvM3DtoFLoEer0Heg58k6St70tbk3Q5tKDPGtWT
 WiDTLPmZko4fKCEPXey7SoywPHq8S1ujDb8j1sB+VlGoiuxImW9X3+8tQdY95XNHc8Sv
 CffzPk2AfynpnUy2x1LfQK1Vh0GD/7FAfQrS0dEboZTMjE228VW6azXdqppQb6BYa+V9 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yffqpjnn6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 11:09:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9400010003B;
        Mon,  2 Mar 2020 11:09:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 134E52B62C7;
        Mon,  2 Mar 2020 11:09:34 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 11:09:33 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Mar 2020 11:09:33 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Thor Thayer <thor.thayer@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        "Shyam Sundar S K" <shyam-sundar.s-k@amd.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        "Scott Branden" <scott.branden@broadcom.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Baruch Siach <baruch@tkos.co.il>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Kukjin Kim <kgene@kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Barry Song <baohua@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "Pierre Yves MORDRET" <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "Ard Biesheuvel" <ardb@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Dmitry Osipenko" <digetx@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
Thread-Topic: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
Thread-Index: AQHV7Wh8pVu7SmSB4EC+hUvEQtyDdag1CcKA
Date:   Mon, 2 Mar 2020 10:09:33 +0000
Message-ID: <d1993e94-13a6-f8ff-108a-ef63b8f93599@st.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D3640FBD2B7C54D8EBA10A0C37EA250@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5keQ0KDQpPbiAyLzI3LzIwIDE6MjEgUE0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4g
U2luY2Ugd2UgaGF2ZSBnZW5lcmljIGRlZmluaXRpb25zIGZvciBidXMgZnJlcXVlbmNpZXMsIGxl
dCdzIHVzZSB0aGVtLg0KPg0KPiBDYzogVGhvciBUaGF5ZXIgPHRob3IudGhheWVyQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQWNrZWQtYnk6IEVsaWUgTW9yaXNzZSA8c3luaXVyZ2VAZ21haWwuY29tPg0K
PiBBY2tlZC1ieTogTmVoYWwgU2hhaCA8bmVoYWwtYmFrdWxjaGFuZHJhLnNoYWhAYW1kLmNvbT4N
Cj4gQ2M6IFNoeWFtIFN1bmRhciBTIEsgPHNoeWFtLXN1bmRhci5zLWtAYW1kLmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4NCj4g
Q2M6IEtyenlzenRvZiBBZGFtc2tpIDxrcnp5c3p0b2YuYWRhbXNraUBub2tpYS5jb20+DQo+IENj
OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCj4gQ2M6IFJheSBKdWkg
PHJqdWlAYnJvYWRjb20uY29tPg0KPiBBY2tlZC1ieTogU2NvdHQgQnJhbmRlbiA8c2NvdHQuYnJh
bmRlbkBicm9hZGNvbS5jb20+DQo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxp
bnguY29tPg0KPiBSZXZpZXdlZC1ieTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdA
bGludXguaW50ZWwuY29tPg0KPiBBY2tlZC1ieTogSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3Vs
YUBsaW51eC5pbnRlbC5jb20+DQo+IEFja2VkLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29z
LmNvLmlsPg0KPiBSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
Pg0KPiBDYzogS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4NCj4gQ2M6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gQ2M6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+DQo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IENj
OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IEFja2VkLWJ5OiBPbGVr
c2lqIFJlbXBlbCA8by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU+DQo+IEFja2VkLWJ5OiBWbGFkaW1p
ciBaYXBvbHNraXkgPHZ6QG1sZWlhLmNvbT4NCj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRo
aWFzLmJnZ0BnbWFpbC5jb20+DQo+IENjOiBHcmVnb3J5IENMRU1FTlQgPGdyZWdvcnkuY2xlbWVu
dEBib290bGluLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4NCj4gQ2M6ICJBbmRyZWFzIEbDpHJiZXIiIDxhZmFlcmJlckBzdXNlLmRl
Pg0KPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhh
c2l2YW1AbGluYXJvLm9yZz4NCj4gQ2M6IEFuZHkgR3Jvc3MgPGFncm9zc0BrZXJuZWwub3JnPg0K
PiBDYzogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4NCj4gUmV2
aWV3ZWQtYnk6IENocmlzIEJyYW5kdCA8Y2hyaXMuYnJhbmR0QHJlbmVzYXMuY29tPg0KPiBDYzog
SGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gQ2M6IEJhcnJ5IFNvbmcgPGJhb2h1
YUBrZXJuZWwub3JnPg0KPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNvbT4NCj4g
UmV2aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZzdAZ21haWwuY29tPg0KPiBDYzog
Q2h1bnlhbiBaaGFuZyA8emhhbmcubHlyYUBnbWFpbC5jb20+DQo+IENjOiBQaWVycmUtWXZlcyBN
T1JEUkVUIDxwaWVycmUteXZlcy5tb3JkcmV0QHN0LmNvbT4NCj4gQ2M6IE1heGltZSBDb3F1ZWxp
biA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4NCj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAc3QuY29tPg0KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAc3QuY29tPg0KPiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9y
Zz4NCj4gQ2M6IExheG1hbiBEZXdhbmdhbiA8bGRld2FuZ2FuQG52aWRpYS5jb20+DQo+IENjOiBE
bWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+DQo+IENjOiBNYXNhaGlybyBZYW1hZGEg
PHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPg0KPiAtLS0NCj4gdjI6DQo+ICAgc3F1YXNo
IHRvIG9uZSBwYXRjaCAoV29sZnJhbSkNCj4gICB1c2VkIE1BWCBpbiB0aGUgZGVmaW5pdGlvbiBu
YW1lcyAoV29sZnJhbSkNCj4gICBkcm9wcGVkIEhaX1BFUl8qDQo+ICAgYWRkZWQgY29sbGVjdGVk
IHRhZ3MNCj4NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYWx0ZXJhLmMgICAgICAgICAgICAg
fCAgNiArKy0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFtZC1tcDItcGxhdC5jICAgICAg
IHwgMjcgKysrKysrKysrLS0tLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5j
ICAgICAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXh4aWEuYyAg
ICAgICAgICAgICAgfCAgNCArLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYmNtLWlwcm9j
LmMgICAgICAgICAgfCAxNCArKysrLS0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1iY20t
a29uYS5jICAgICAgICAgICB8ICA4ICsrLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWNh
ZGVuY2UuYyAgICAgICAgICAgIHwgIDcgKystLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1k
ZXNpZ253YXJlLXBsYXRkcnYuYyB8IDM3ICsrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1kaWdpY29sb3IuYyAgICAgICAgICB8ICAzICstDQo+ICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWRpb2xhbi11MmMuYyAgICAgICAgIHwgMTIgKysrLS0tLQ0KPiAgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1leHlub3M1LmMgICAgICAgICAgICB8IDE4ICsrKystLS0tLS0N
Cj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaGl4NWhkMi5jICAgICAgICAgICAgfCAxMCArKyst
LS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW1nLXNjYi5jICAgICAgICAgICAgfCAgNCAr
LS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgICAgICAgICAgfCAxNiAr
KystLS0tLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgICAgICAgICAgICAgICAg
fCAgNSArLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbHBjMmsuYyAgICAgICAgICAgICAg
fCAgNiArKy0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jICAgICAgICAgICAg
IHwgMjEgKysrKystLS0tLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyAg
ICAgICAgICAgIHwgIDYgKystLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1teHMuYyAgICAg
ICAgICAgICAgICB8ICA0ICstLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1ub21hZGlrLmMg
ICAgICAgICAgICB8ICA4ICsrLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW93bC5jICAg
ICAgICAgICAgICAgIHwgIDkgKystLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcXVwLmMg
ICAgICAgICAgICAgICAgfCAxMSArKy0tLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmNh
ci5jICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWlj
LmMgICAgICAgICAgICAgICB8ICA2ICsrLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmsz
eC5jICAgICAgICAgICAgICAgfCAxMiArKystLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXMzYzI0MTAuYyAgICAgICAgICAgIHwgIDQgKy0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXNoX21vYmlsZS5jICAgICAgICAgIHwgIDkgKystLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtc2lyZi5jICAgICAgICAgICAgICAgfCAgMyArLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1zcHJkLmMgICAgICAgICAgICAgICB8ICA5ICsrLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXN0LmMgICAgICAgICAgICAgICAgIHwgIDYgKystLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1zdG0zMmY0LmMgICAgICAgICAgICB8ICA2ICsrLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtc3RtMzJmNy5jICAgICAgICAgICAgfCAyNCArKysrKystLS0tLS0tDQo+ICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXN0dTMwMC5jICAgICAgICAgICAgIHwgIDYgKystLQ0KPiAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1zeW5xdWFjZXIuYyAgICAgICAgICB8ICA2ICsrLS0NCj4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyAgICAgICAgICAgICAgfCAxOCArKysrLS0tLS0tDQo+
ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXVuaXBoaWVyLWYuYyAgICAgICAgIHwgIDYgKystLQ0K
PiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy11bmlwaGllci5jICAgICAgICAgICB8ICA3ICsrLS0N
Cj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGxwOXh4LmMgICAgICAgICAgICAgfCAgOCArKy0t
LQ0KPiAgMzggZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKyksIDIwMiBkZWxldGlvbnMo
LSkNCg0KPiBbLi4uXQ0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0LmMNCj4gaW5kZXggNTRlMWZjOGE0OTVlLi40
OTc5NGU4ZWM4MzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3QuYw0K
PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0LmMNCj4gQEAgLTIxMyw3ICsyMTMsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgc3RfaTJjX2Nscl9iaXRzKHZvaWQgX19pb21lbSAqcmVnLCB1
MzIgbWFzaykNCj4gICAqLw0KPiAgc3RhdGljIHN0cnVjdCBzdF9pMmNfdGltaW5ncyBpMmNfdGlt
aW5nc1tdID0gew0KPiAgCVtJMkNfTU9ERV9TVEFOREFSRF0gPSB7DQo+IC0JCS5yYXRlCQkJPSAx
MDAwMDAsDQo+ICsJCS5yYXRlCQkJPSBJMkNfTUFYX1NUQU5EQVJEX01PREVfRlJFUSwNCj4gIAkJ
LnJlcF9zdGFydF9ob2xkCQk9IDQ0MDAsDQo+ICAJCS5yZXBfc3RhcnRfc2V0dXAJPSA1MTcwLA0K
PiAgCQkuc3RhcnRfaG9sZAkJPSA0NDAwLA0KPiBAQCAtMjIyLDcgKzIyMiw3IEBAIHN0YXRpYyBz
dHJ1Y3Qgc3RfaTJjX3RpbWluZ3MgaTJjX3RpbWluZ3NbXSA9IHsNCj4gIAkJLmJ1c19mcmVlX3Rp
bWUJCT0gNTE3MCwNCj4gIAl9LA0KPiAgCVtJMkNfTU9ERV9GQVNUXSA9IHsNCj4gLQkJLnJhdGUJ
CQk9IDQwMDAwMCwNCj4gKwkJLnJhdGUJCQk9IEkyQ19NQVhfRkFTVF9NT0RFX0ZSRVEsDQo+ICAJ
CS5yZXBfc3RhcnRfaG9sZAkJPSA2NjAsDQo+ICAJCS5yZXBfc3RhcnRfc2V0dXAJPSA2NjAsDQo+
ICAJCS5zdGFydF9ob2xkCQk9IDY2MCwNCj4gQEAgLTgzNSw3ICs4MzUsNyBAQCBzdGF0aWMgaW50
IHN0X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICAJaTJj
X2Rldi0+bW9kZSA9IEkyQ19NT0RFX1NUQU5EQVJEOw0KPiAgCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5wLCAiY2xvY2stZnJlcXVlbmN5IiwgJmNsa19yYXRlKTsNCj4gLQlpZiAoKCFyZXQp
ICYmIChjbGtfcmF0ZSA9PSA0MDAwMDApKQ0KPiArCWlmICghcmV0ICYmIChjbGtfcmF0ZSA9PSBJ
MkNfTUFYX0ZBU1RfTU9ERV9GUkVRKSkNCj4gIAkJaTJjX2Rldi0+bW9kZSA9IEkyQ19NT0RFX0ZB
U1Q7DQo+ICANCj4gIAlpMmNfZGV2LT5kZXYgPSAmcGRldi0+ZGV2Ow0KDQpGb3IgaTJjLXN0LmMN
Cg0KQWNrZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCg0K
VGhhbmtzDQoNCg0K
