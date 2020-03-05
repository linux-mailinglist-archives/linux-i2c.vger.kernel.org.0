Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8401917AA86
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 17:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgCEQba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 11:31:30 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:15162 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgCEQba (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 11:31:30 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025GOI6m010492;
        Thu, 5 Mar 2020 17:29:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Y/1IjyrIz/Z5gdOL7YpWM+B/LueTN04lM7OU+fz/AMg=;
 b=BDmNxTMD1z4q6gTYc3CLJn+UhJzsBE/ETCx8FS482v632wzrAav9D4qaRrzKELx1nijS
 JhX1M0PO8OLol93a1yjNZvx2aejgThv9HHwPjY2JHJvbSn82tQwVIrncWq6lb7SGHbtC
 ZV281iXSfSQS6DF+QMjFAEedGXEGDlr12/xOv6Ve50uEXnIY6NF6/o9VgNHbrhjC5yiv
 L8pcd3NyIFX/tPLvInH8ZzU4pwtU6pTOrCJJ15HEmemk18I5kdMTUtZWJ5p2XfLQgbOr
 2n9aJRc3NO4frSinKlgTT8+FK1dJyx0ZCOl9lCK3hCmfG+5xS5rECzVZbQ2cNjSrjiIJ wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfea799kn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 17:29:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2788410002A;
        Thu,  5 Mar 2020 17:29:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B43CF2FF5C0;
        Thu,  5 Mar 2020 17:29:18 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.44) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Mar
 2020 17:29:16 +0100
Subject: Re: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
To:     <yamada.masahiro@socionext.com>,
        <andriy.shevchenko@linux.intel.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>
CC:     <thor.thayer@linux.intel.com>, <syniurge@gmail.com>,
        <nehal-bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        <brendanhiggins@google.com>, <krzysztof.adamski@nokia.com>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <scott.branden@broadcom.com>, <michal.simek@xilinx.com>,
        <mika.westerberg@linux.intel.com>, <jarkko.nikula@linux.intel.com>,
        <baruch@tkos.co.il>, <linux@roeck-us.net>, <masahiroy@kernel.org>,
        <kgene@kernel.org>, <krzk@kernel.org>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <o.rempel@pengutronix.de>, <vz@mleia.com>,
        <matthias.bgg@gmail.com>, <gregory.clement@bootlin.com>,
        <linus.walleij@linaro.org>, <afaerber@suse.de>,
        <manivannan.sadhasivam@linaro.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <chris.brandt@renesas.com>,
        <heiko@sntech.de>, <baohua@kernel.org>, <orsonzhai@gmail.com>,
        <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <patrice.chotard@st.com>, <ardb@kernel.org>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
 <e713926d87564555af67723dce092c2f@SOC-EX01V.e01.socionext.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <8ad2cba7-72f7-4a6c-ae1f-47e85272eb69@st.com>
Date:   Thu, 5 Mar 2020 17:29:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e713926d87564555af67723dce092c2f@SOC-EX01V.e01.socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_05:2020-03-05,2020-03-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5keQ0KDQpGb3IgaTJjLXN0bTMyZjQuYyBhbmQgaTJjLXN0bTMyZjcuYw0KDQpSZXZp
ZXdlZC1ieTogUGllcnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJldEBzdC5j
b20+DQoNClRoYW5rcw0KDQpPbiAyLzI3LzIwIDE6NDIgUE0sIHlhbWFkYS5tYXNhaGlyb0Bz
b2Npb25leHQuY29tIHdyb3RlOg0KPiBIaSBBbmR5LCBXb2xmcmFtLA0KPiANCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IA0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMjcsIDIwMjAgOToyMSBQTQ0KPiBUbzogV29sZnJhbSBTYW5nIDx3c2FAdGhlLWRyZWFt
cy5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjsgVGhvciBUaGF5ZXIgPHRo
b3IudGhheWVyQGxpbnV4LmludGVsLmNvbT47IEVsaWUgTW9yaXNzZSA8c3luaXVyZ2VAZ21h
aWwuY29tPjsgTmVoYWwgU2hhaCA8bmVoYWwtYmFrdWxjaGFuZHJhLnNoYWhAYW1kLmNvbT47
IFNoeWFtIFN1bmRhciBTIEsgPHNoeWFtLXN1bmRhci5zLWtAYW1kLmNvbT47IEJyZW5kYW4g
SGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT47IEtyenlzenRvZiBBZGFtc2tp
IDxrcnp5c3p0b2YuYWRhbXNraUBub2tpYS5jb20+OyBGbG9yaWFuIEZhaW5lbGxpIDxmLmZh
aW5lbGxpQGdtYWlsLmNvbT47IFJheSBKdWkgPHJqdWlAYnJvYWRjb20uY29tPjsgU2NvdHQg
QnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5jb20+OyBNaWNoYWwgU2ltZWsgPG1p
Y2hhbC5zaW1la0B4aWxpbnguY29tPjsgTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJl
cmdAbGludXguaW50ZWwuY29tPjsgSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3VsYUBsaW51
eC5pbnRlbC5jb20+OyBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPjsgR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsgS3VramluIEtpbSA8a2dlbmVAa2VybmVs
Lm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz47IERvbmcgQWlz
aGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBPbGVrc2lq
IFJlbXBlbCA8by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU+OyBWbGFkaW1pciBaYXBvbHNraXkg
PHZ6QG1sZWlhLmNvbT47IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+OyBHcmVnb3J5IENMRU1FTlQgPGdyZWdvcnkuY2xlbWVudEBib290bGluLmNvbT47IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEFuZHJlYXMgRsOkcmJl
ciA8YWZhZXJiZXJAc3VzZS5kZT47IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5h
bi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+OyBBbmR5IEdyb3NzIDxhZ3Jvc3NAa2VybmVsLm9y
Zz47IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+OyBDaHJp
cyBCcmFuZHQgPGNocmlzLmJyYW5kdEByZW5lc2FzLmNvbT47IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+OyBCYXJyeSBTb25nIDxiYW9odWFAa2VybmVsLm9yZz47IE9yc29u
IFpoYWkgPG9yc29uemhhaUBnbWFpbC5jb20+OyBCYW9saW4gV2FuZyA8YmFvbGluLndhbmc3
QGdtYWlsLmNvbT47IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21haWwuY29tPjsgUGll
cnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJldEBzdC5jb20+OyBNYXhpbWUg
Q29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+OyBBbGV4YW5kcmUgVG9yZ3Vl
IDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT47IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQHN0LmNvbT47IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+OyBMYXht
YW4gRGV3YW5nYW4gPGxkZXdhbmdhbkBudmlkaWEuY29tPjsgRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPjsgWWFtYWRhLCBNYXNhaGlyby/lsbHnlLAg55yf5byYIDx5YW1h
ZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDMvM10g
aTJjOiBkcml2ZXJzOiBVc2UgZ2VuZXJpYyBkZWZpbml0aW9ucyBmb3IgYnVzIGZyZXF1ZW5j
aWVzDQo+IA0KPiBTaW5jZSB3ZSBoYXZlIGdlbmVyaWMgZGVmaW5pdGlvbnMgZm9yIGJ1cyBm
cmVxdWVuY2llcywgbGV0J3MgdXNlIHRoZW0uDQo+IA0KPiBDYzogVGhvciBUaGF5ZXIgPHRo
b3IudGhheWVyQGxpbnV4LmludGVsLmNvbT4NCj4gQWNrZWQtYnk6IEVsaWUgTW9yaXNzZSA8
c3luaXVyZ2VAZ21haWwuY29tPg0KPiBBY2tlZC1ieTogTmVoYWwgU2hhaCA8bmVoYWwtYmFr
dWxjaGFuZHJhLnNoYWhAYW1kLmNvbT4NCj4gQ2M6IFNoeWFtIFN1bmRhciBTIEsgPHNoeWFt
LXN1bmRhci5zLWtAYW1kLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJyZW5kYW4gSGlnZ2lucyA8
YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4NCj4gQ2M6IEtyenlzenRvZiBBZGFtc2tpIDxr
cnp5c3p0b2YuYWRhbXNraUBub2tpYS5jb20+DQo+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxm
LmZhaW5lbGxpQGdtYWlsLmNvbT4NCj4gQ2M6IFJheSBKdWkgPHJqdWlAYnJvYWRjb20uY29t
Pg0KPiBBY2tlZC1ieTogU2NvdHQgQnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5j
b20+DQo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPg0KPiBS
ZXZpZXdlZC1ieTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50
ZWwuY29tPg0KPiBBY2tlZC1ieTogSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3VsYUBsaW51
eC5pbnRlbC5jb20+DQo+IEFja2VkLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNv
LmlsPg0KPiBSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
Pg0KPiBDYzogS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4NCj4gQ2M6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gQ2M6IERvbmcgQWlzaGVuZyA8YWlz
aGVuZy5kb25nQG54cC5jb20+DQo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5v
cmc+DQo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IEFj
a2VkLWJ5OiBPbGVrc2lqIFJlbXBlbCA8by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU+DQo+IEFj
a2VkLWJ5OiBWbGFkaW1pciBaYXBvbHNraXkgPHZ6QG1sZWlhLmNvbT4NCj4gQ2M6IE1hdHRo
aWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+IENjOiBHcmVnb3J5IENM
RU1FTlQgPGdyZWdvcnkuY2xlbWVudEBib290bGluLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gQ2M6ICJBbmRyZWFz
IEbDpHJiZXIiIDxhZmFlcmJlckBzdXNlLmRlPg0KPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4NCj4gQ2M6
IEFuZHkgR3Jvc3MgPGFncm9zc0BrZXJuZWwub3JnPg0KPiBDYzogQmpvcm4gQW5kZXJzc29u
IDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IENocmlzIEJy
YW5kdCA8Y2hyaXMuYnJhbmR0QHJlbmVzYXMuY29tPg0KPiBDYzogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvQHNudGVjaC5kZT4NCj4gQ2M6IEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwub3Jn
Pg0KPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZzdAZ21haWwuY29tPg0KPiBDYzogQ2h1bnlh
biBaaGFuZyA8emhhbmcubHlyYUBnbWFpbC5jb20+DQo+IENjOiBQaWVycmUtWXZlcyBNT1JE
UkVUIDxwaWVycmUteXZlcy5tb3JkcmV0QHN0LmNvbT4NCj4gQ2M6IE1heGltZSBDb3F1ZWxp
biA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4NCj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUg
PGFsZXhhbmRyZS50b3JndWVAc3QuY29tPg0KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAc3QuY29tPg0KPiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJA
a2VybmVsLm9yZz4NCj4gQ2M6IExheG1hbiBEZXdhbmdhbiA8bGRld2FuZ2FuQG52aWRpYS5j
b20+DQo+IENjOiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+DQo+IENjOiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPg0KPiANCj4g
UGxlYXNlIHJlcGxhY2UgQ2Mgd2l0aCBteQ0KPiANCj4gQWNrZWQtYnk6IE1hc2FoaXJvIFlh
bWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+IA0KPiBUaGFua3MuDQo+
IA0KPiAtLS0NCj4gdjI6DQo+ICAgc3F1YXNoIHRvIG9uZSBwYXRjaCAoV29sZnJhbSkNCj4g
ICB1c2VkIE1BWCBpbiB0aGUgZGVmaW5pdGlvbiBuYW1lcyAoV29sZnJhbSkNCj4gICBkcm9w
cGVkIEhaX1BFUl8qDQo+ICAgYWRkZWQgY29sbGVjdGVkIHRhZ3MNCj4gDQo=
