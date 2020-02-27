Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661681717B1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 13:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgB0MmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Feb 2020 07:42:19 -0500
Received: from mx.socionext.com ([202.248.49.38]:5371 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728964AbgB0MmT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Feb 2020 07:42:19 -0500
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 27 Feb 2020 21:42:17 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id BF33C180105;
        Thu, 27 Feb 2020 21:42:17 +0900 (JST)
Received: from 10.213.24.1 (10.213.24.1) by m-FILTER with ESMTP; Thu, 27 Feb 2020 21:42:17 +0900
Received: from SOC-EX01V.e01.socionext.com (10.213.24.21) by
 SOC-EX01V.e01.socionext.com (10.213.24.21) with Microsoft SMTP Server (TLS)
 id 15.0.995.29; Thu, 27 Feb 2020 21:42:17 +0900
Received: from SOC-EX01V.e01.socionext.com ([10.213.24.21]) by
 SOC-EX01V.e01.socionext.com ([10.213.24.21]) with mapi id 15.00.0995.028;
 Thu, 27 Feb 2020 21:42:17 +0900
From:   <yamada.masahiro@socionext.com>
To:     <andriy.shevchenko@linux.intel.com>, <wsa@the-dreams.de>,
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
        <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <patrice.chotard@st.com>,
        <ardb@kernel.org>, <ldewangan@nvidia.com>, <digetx@gmail.com>
Subject: RE: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
Thread-Topic: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
Thread-Index: AQHV7Wh+ALGfX6T31kGn1pv2mz+CdKgu+xfA
Date:   Thu, 27 Feb 2020 12:42:16 +0000
Message-ID: <e713926d87564555af67723dce092c2f@SOC-EX01V.e01.socionext.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.6.1
x-shieldmailcheckerpolicyversion: POLICY200130
x-originating-ip: [10.213.24.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5keSwgV29sZnJhbSwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiANClNlbnQ6
IFRodXJzZGF5LCBGZWJydWFyeSAyNywgMjAyMCA5OjIxIFBNDQpUbzogV29sZnJhbSBTYW5nIDx3
c2FAdGhlLWRyZWFtcy5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCkNjOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT47IFRob3IgVGhheWVy
IDx0aG9yLnRoYXllckBsaW51eC5pbnRlbC5jb20+OyBFbGllIE1vcmlzc2UgPHN5bml1cmdlQGdt
YWlsLmNvbT47IE5laGFsIFNoYWggPG5laGFsLWJha3VsY2hhbmRyYS5zaGFoQGFtZC5jb20+OyBT
aHlhbSBTdW5kYXIgUyBLIDxzaHlhbS1zdW5kYXIucy1rQGFtZC5jb20+OyBCcmVuZGFuIEhpZ2dp
bnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+OyBLcnp5c3p0b2YgQWRhbXNraSA8a3J6eXN6
dG9mLmFkYW1za2lAbm9raWEuY29tPjsgRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFp
bC5jb20+OyBSYXkgSnVpIDxyanVpQGJyb2FkY29tLmNvbT47IFNjb3R0IEJyYW5kZW4gPHNjb3R0
LmJyYW5kZW5AYnJvYWRjb20uY29tPjsgTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54
LmNvbT47IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT47
IEphcmtrbyBOaWt1bGEgPGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgQmFydWNoIFNp
YWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD47IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD47IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+OyBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgT2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPjsgVmxh
ZGltaXIgWmFwb2xza2l5IDx2ekBtbGVpYS5jb20+OyBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlh
cy5iZ2dAZ21haWwuY29tPjsgR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1lbnRAYm9vdGxp
bi5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBBbmRyZWFz
IEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+OyBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2
YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPjsgQW5keSBHcm9zcyA8YWdyb3NzQGtlcm5lbC5v
cmc+OyBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPjsgQ2hyaXMg
QnJhbmR0IDxjaHJpcy5icmFuZHRAcmVuZXNhcy5jb20+OyBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPjsgQmFycnkgU29uZyA8YmFvaHVhQGtlcm5lbC5vcmc+OyBPcnNvbiBaaGFpIDxv
cnNvbnpoYWlAZ21haWwuY29tPjsgQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nN0BnbWFpbC5jb20+
OyBDaHVueWFuIFpoYW5nIDx6aGFuZy5seXJhQGdtYWlsLmNvbT47IFBpZXJyZS1ZdmVzIE1PUkRS
RVQgPHBpZXJyZS15dmVzLm1vcmRyZXRAc3QuY29tPjsgTWF4aW1lIENvcXVlbGluIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPjsgQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBz
dC5jb20+OyBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+OyBBcmQgQmll
c2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPjsgTGF4bWFuIERld2FuZ2FuIDxsZGV3YW5nYW5AbnZp
ZGlhLmNvbT47IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT47IFlhbWFkYSwgTWFz
YWhpcm8v5bGx55SwIOecn+W8mCA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQpTdWJq
ZWN0OiBbUEFUQ0ggdjIgMy8zXSBpMmM6IGRyaXZlcnM6IFVzZSBnZW5lcmljIGRlZmluaXRpb25z
IGZvciBidXMgZnJlcXVlbmNpZXMNCg0KU2luY2Ugd2UgaGF2ZSBnZW5lcmljIGRlZmluaXRpb25z
IGZvciBidXMgZnJlcXVlbmNpZXMsIGxldCdzIHVzZSB0aGVtLg0KDQpDYzogVGhvciBUaGF5ZXIg
PHRob3IudGhheWVyQGxpbnV4LmludGVsLmNvbT4NCkFja2VkLWJ5OiBFbGllIE1vcmlzc2UgPHN5
bml1cmdlQGdtYWlsLmNvbT4NCkFja2VkLWJ5OiBOZWhhbCBTaGFoIDxuZWhhbC1iYWt1bGNoYW5k
cmEuc2hhaEBhbWQuY29tPg0KQ2M6IFNoeWFtIFN1bmRhciBTIEsgPHNoeWFtLXN1bmRhci5zLWtA
YW1kLmNvbT4NClJldmlld2VkLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdv
b2dsZS5jb20+DQpDYzogS3J6eXN6dG9mIEFkYW1za2kgPGtyenlzenRvZi5hZGFtc2tpQG5va2lh
LmNvbT4NCkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCkNjOiBS
YXkgSnVpIDxyanVpQGJyb2FkY29tLmNvbT4NCkFja2VkLWJ5OiBTY290dCBCcmFuZGVuIDxzY290
dC5icmFuZGVuQGJyb2FkY29tLmNvbT4NCkNjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4
aWxpbnguY29tPg0KUmV2aWV3ZWQtYnk6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJn
QGxpbnV4LmludGVsLmNvbT4NCkFja2VkLWJ5OiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4NCkFja2VkLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNv
LmlsPg0KUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCkNj
OiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPg0KQ2M6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyemtAa2VybmVsLm9yZz4NCkNjOiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCkNjOiBTYXNjaGEgSGF1ZXIg
PHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQpBY2tlZC1ieTogT2xla3NpaiBSZW1wZWwgPG8ucmVt
cGVsQHBlbmd1dHJvbml4LmRlPg0KQWNrZWQtYnk6IFZsYWRpbWlyIFphcG9sc2tpeSA8dnpAbWxl
aWEuY29tPg0KQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQpD
YzogR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1lbnRAYm9vdGxpbi5jb20+DQpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KQ2M6ICJBbmRy
ZWFzIEbDpHJiZXIiIDxhZmFlcmJlckBzdXNlLmRlPg0KUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+DQpDYzogQW5keSBH
cm9zcyA8YWdyb3NzQGtlcm5lbC5vcmc+DQpDYzogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRl
cnNzb25AbGluYXJvLm9yZz4NClJldmlld2VkLWJ5OiBDaHJpcyBCcmFuZHQgPGNocmlzLmJyYW5k
dEByZW5lc2FzLmNvbT4NCkNjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPg0KQ2M6
IEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwub3JnPg0KQ2M6IE9yc29uIFpoYWkgPG9yc29uemhh
aUBnbWFpbC5jb20+DQpSZXZpZXdlZC1ieTogQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nN0BnbWFp
bC5jb20+DQpDYzogQ2h1bnlhbiBaaGFuZyA8emhhbmcubHlyYUBnbWFpbC5jb20+DQpDYzogUGll
cnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJldEBzdC5jb20+DQpDYzogTWF4aW1l
IENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPg0KQ2M6IEFsZXhhbmRyZSBUb3Jn
dWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPg0KQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQHN0LmNvbT4NCkFja2VkLWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwu
b3JnPg0KQ2M6IExheG1hbiBEZXdhbmdhbiA8bGRld2FuZ2FuQG52aWRpYS5jb20+DQpDYzogRG1p
dHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPg0KQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFt
YWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQoNClBsZWFzZSByZXBsYWNlIENjIHdpdGggbXkN
Cg0KQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5j
b20+DQoNClRoYW5rcy4NCg0KLS0tDQp2MjoNCiAgc3F1YXNoIHRvIG9uZSBwYXRjaCAoV29sZnJh
bSkNCiAgdXNlZCBNQVggaW4gdGhlIGRlZmluaXRpb24gbmFtZXMgKFdvbGZyYW0pDQogIGRyb3Bw
ZWQgSFpfUEVSXyoNCiAgYWRkZWQgY29sbGVjdGVkIHRhZ3MNCg0K
