Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E9D4D999C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Mar 2022 11:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347154AbiCOKwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Mar 2022 06:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347663AbiCOKwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Mar 2022 06:52:14 -0400
X-Greylist: delayed 123 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Mar 2022 03:49:42 PDT
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EA5532D7
        for <linux-i2c@vger.kernel.org>; Tue, 15 Mar 2022 03:49:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="73190388"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 15 Mar 2022 02:45:41 -0800
IronPort-SDR: 1jJ2My7mhtJ2dSPnlQ+bdjsDlR6OJzFZ6SZ2XxzjFr/fMqlVbVtpK41Xn/JwiwlSFuQITOQQwz
 U3Uc4tAEt0Lb6pzvJbOHowJvEnBN40s9VUOu2hLdNy0wBfbfzZ43OEoplv+rty/lhGnBE3vnFL
 W+1ffFgj3rWSa9A+D2GFNGBvW25B6kFRKv+MhCpd7YKOD+KRASN/hTr0aGGi+hcm8O/EHb7DNY
 Zra/fQCwo5RTNzbhdyAq8iNzgejh30JitjIdqJY7I5OboqXOs1SzQ12QKzN2wHtpCwHyciljGc
 qiA=
From:   "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>
Subject: RE: [PATCH v2] i2c: rcar: add SMBus block read support
Thread-Topic: [PATCH v2] i2c: rcar: add SMBus block read support
Thread-Index: AQHXut9FT2mP5NnGkki6tztrKBL//6yY9+mAgAEAdYCAJ0KC0A==
Date:   Tue, 15 Mar 2022 10:45:37 +0000
Message-ID: <b59f222400c54ffdbdd3f70aea153b1b@SVR-IES-MBX-03.mgc.mentorg.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com> <Yg6ls0zyTDe7LQbK@kunai>
 <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
In-Reply-To: <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KICAgICBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgZmVlZGJhY2sgdG8g
b3VyIHJlc3BvbnNlIGF0LA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMGEwNzkwMjkw
MGJjNGVjYzg0YmQ5M2E2Yjg1YTJlMGNAc3ZyLWllcy1tYngtMDIubWdjLm1lbnRvcmcuY29tLw0K
DQpUaGFuayB5b3UsDQpSZWdhcmRzLA0KQmh1dmFuZXNoDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogR2FiYmFzb3YsIEFuZHJldyA8QW5kcmV3X0dhYmJhc292QG1lbnRvci5jb20+
IA0KU2VudDogMTggRmVicnVhcnkgMjAyMiAxNjozMw0KVG86IFdvbGZyYW0gU2FuZyA8d3NhK3Jl
bmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQpDYzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsg
U3VyYWNoYXJpLCBCaHV2YW5lc2ggPEJodXZhbmVzaF9TdXJhY2hhcmlAbWVudG9yLmNvbT4NClN1
YmplY3Q6IFJFOiBbUEFUQ0ggdjJdIGkyYzogcmNhcjogYWRkIFNNQnVzIGJsb2NrIHJlYWQgc3Vw
cG9ydA0KDQpIaSBXb2xmcmFtIQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQpTZWUg
bXkgcmVzcG9uc2VzIGJlbG93Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxNywgMjAyMiAxMDo0NSBQTQ0KPiBUbzogR2FiYmFzb3Ys
IEFuZHJldyA8QW5kcmV3X0dhYmJhc292QG1lbnRvci5jb20+DQo+IENjOiBsaW51eC1yZW5lc2Fz
LXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IA0KPiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBHZWVydCBVeXR0ZXJob2V2ZW4gDQo+IDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT47IFN1cmFjaGFyaSwgQmh1dmFuZXNoIA0KPiA8Qmh1dmFuZXNoX1N1
cmFjaGFyaUBtZW50b3IuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBpMmM6IHJjYXI6
IGFkZCBTTUJ1cyBibG9jayByZWFkIHN1cHBvcnQNCj4gDQpbc2tpcHBlZF0NCj4gDQo+ID4gVGhp
cyBwYXRjaCAoYWRhcHRlZCkgd2FzIHRlc3RlZCB3aXRoIHY0LjE0LCBidXQgZHVlIHRvIGxhY2sg
b2YgcmVhbCANCj4gPiBoYXJkd2FyZSB3aXRoIFNNQnVzIGJsb2NrIHJlYWQgb3BlcmF0aW9ucyBz
dXBwb3J0LCB1c2luZyANCj4gPiAic2ltdWxhdGlvbiIsIHRoYXQgaXMgbWFudWFsIGFuYWx5c2lz
IG9mIGRhdGEsIHJlYWQgZnJvbSBwbGFpbiBJMkMgDQo+ID4gZGV2aWNlcyB3aXRoIFNNQnVzIGJs
b2NrIHJlYWQgcmVxdWVzdC4NCj4gDQo+IFlvdSBjb3VsZCB3aXJlIHVwIHR3byBSLUNhciBJMkMg
aW5zdGFuY2VzLCBzZXQgdXAgb25lIGFzIGFuIEkyQyBzbGF2ZSANCj4gaGFuZGxlZCBieSB0aGUg
STJDIHRlc3R1bml0IGFuZCB0aGVuIHVzZSB0aGUgb3RoZXIgaW5zdGFuY2Ugd2l0aCANCj4gU01C
VVNfQkxPQ0tfUFJPQ19DQUxMIHdoaWNoIGFsc28gbmVlZHMgUkVDVl9MRU4uIENoZWNrIA0KPiBE
b2N1bWVudGF0aW9uL2kyYy9zbGF2ZS10ZXN0dW5pdC1iYWNrZW5kLnJzdCBmb3IgZGV0YWlscy4N
Cg0KWW91IG1lYW4gcGh5c2ljYWwgY29ubmVjdGlvbiBvZiB0d28gUi1DYXIgYm9hcmRzIHZpYSBJ
MkMgYnVzLCBvciBwaHlzaWNhbCBjb25uZWN0aW9uIG9mIEkyQyBidXMgd2lyZXMgb24gdGhlIHNp
bmdsZSBib2FyZCwgcmlnaHQ/DQpJdCBsb29rcyBsaWtlIGFsbCB0aGUgYm9hcmRzLCB0aGF0IEkg
aGF2ZSBhY2Nlc3MgdG8sIGRvIG5vdCBoYXZlIEkyQyBidXMgd2lyZXMgZXhwb3NlZCB0byBzb21l
IGNvbm5lY3RvcnMsIHNvIGJvdGggdmFyaWFudHMgd291bGQgcmVxdWlyZSBoYXJkd2FyZSByZS13
aXJpbmcgbW9kaWZpY2F0aW9uIG9mIHRoZSBib2FyZHMsIHdoaWNoIGlzIG5vdCBhbiBvcHRpb24g
Zm9yIG1lLiBPciBkbyBJIHVuZGVyc3RhbmQgeW91IGluY29ycmVjdGx5IGFuZCB5b3UgbWVhbiBz
b21ldGhpbmcgZGlmZmVyZW50Pw0KDQo+IEkgd29uZGVyIGEgYml0IGFib3V0IHRoZSBjb21wbGV4
aXR5IG9mIHlvdXIgcGF0Y2guIEluIG15IFdJUC1icmFuY2ggDQo+IGZvciAyNTYtYnl0ZSB0cmFu
c2ZlcnMsIEkgaGF2ZSB0aGUgZm9sbG93aW5nIHBhdGNoLiBJdCBpcyBvbmx5IG1pc3NpbmcgDQo+
IHRoZSByYW5nZSBjaGVjayBmb3IgdGhlIHJlY2VpdmVkIGJ5dGUsIGJ1dCB0aGF0IGl0IGVhc3kg
dG8gYWRkLiBEbyB5b3UgDQo+IHNlZSBhbnl0aGluZyBlbHNlIG1pc3Npbmc/IElmIG5vdCwgSSBw
cmVmZXIgdGhpcyBzaW1wbGVyIHZlcnNpb24gDQo+IGJlY2F1c2UgaXQgaXMgbGVzcyBpbnRydXNp
dmUgYW5kIHRoZSBzdGF0ZSBtYWNoaW5lIGlzIGEgYml0IGZyYWdpbGUgDQo+IChkdWUgdG8gSFcg
aXNzdWVzIHdpdGggb2xkIEhXKS4NCg0KTW9zdCBvZiBjb21wbGV4aXR5IGluIG15IHBhdGNoIGlz
IHJlbGF0ZWQgdG8gRE1BIHRyYW5zZmVycyBzdXBwb3J0LCB0aGF0IEknbSB0cnlpbmcgdG8gcmV0
YWluIGZvciBTTUJ1cyBibG9jayBkYXRhIHRyYW5zZmVycyB0b28gKGZvciB0aGUgcmVzdCBvZiBi
eXRlcyBhZnRlciB0aGUgZmlyc3QgImxlbmd0aCIgYnl0ZSkuIFlvdXIgc2ltcGxlIHBhdGNoIG1h
a2VzIHRoZSBkcml2ZXIgcGVyZm9ybSBhbGwgTV9SRUNWX0xFTiB0cmFuc2ZlcnMgaW4gUElPIG1v
ZGUgb25seSAod2l0aCBubyBETUEgYXQgYWxsKSwgd2hpY2ggaXMgcHJvYmFibHkgbm90IHF1aXRl
IGdvb2QgKGl0J3MgYSBwaXR5IHRvIGxvb3NlIGV4aXN0aW5nIEhXIGNhcGFiaWxpdHksIGFscmVh
ZHkgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIpLg0KDQpBbHNvLCBzZWUgYSBjb3VwbGUgb2YgY29t
bWVudHMgYmVsb3cuDQoNCj4gRnJvbTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVu
Z2luZWVyaW5nLmNvbT4NCj4gRGF0ZTogU3VuLCAyIEF1ZyAyMDIwIDAwOjI0OjUyICswMjAwDQo+
IFN1YmplY3Q6IFtQQVRDSF0gaTJjOiByY2FyOiBhZGQgc3VwcG9ydCBmb3IgSTJDX01fUkVDVl9M
RU4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1l
bmdpbmVlcmluZy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yY2FyLmMg
fCA3ICsrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yY2FyLmMg
DQo+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yY2FyLmMgaW5kZXggMjE3ZGVmMmQ3Y2I0Li5l
NDczZjVjMGE3MDggDQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJj
YXIuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJjYXIuYw0KPiBAQCAtNTI4LDYg
KzUyOCw3IEBAIHN0YXRpYyB2b2lkIHJjYXJfaTJjX2lycV9zZW5kKHN0cnVjdCByY2FyX2kyY19w
cml2IA0KPiAqcHJpdiwgdTMyIG1zcikgIHN0YXRpYyB2b2lkIHJjYXJfaTJjX2lycV9yZWN2KHN0
cnVjdCByY2FyX2kyY19wcml2IA0KPiAqcHJpdiwgdTMyIG1zcikgIHsNCj4gIAlzdHJ1Y3QgaTJj
X21zZyAqbXNnID0gcHJpdi0+bXNnOw0KPiArCWJvb2wgcmVjdl9sZW5faW5pdCA9IHByaXYtPnBv
cyA9PSAwICYmIG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRUNWX0xFTjsNCj4gDQo+ICAJLyogRklYTUU6
IHNvbWV0aW1lcywgdW5rbm93biBpbnRlcnJ1cHQgaGFwcGVuZWQuIERvIG5vdGhpbmcgKi8NCj4g
IAlpZiAoIShtc3IgJiBNRFIpKQ0KPiBAQCAtNTQyLDExICs1NDMsMTMgQEAgc3RhdGljIHZvaWQg
cmNhcl9pMmNfaXJxX3JlY3Yoc3RydWN0IHJjYXJfaTJjX3ByaXYgKnByaXYsIHUzMiBtc3IpDQo+
ICAJfSBlbHNlIGlmIChwcml2LT5wb3MgPCBtc2ctPmxlbikgew0KPiAgCQkvKiBnZXQgcmVjZWl2
ZWQgZGF0YSAqLw0KPiAgCQltc2ctPmJ1Zltwcml2LT5wb3NdID0gcmNhcl9pMmNfcmVhZChwcml2
LCBJQ1JYVFgpOw0KPiArCQlpZiAocmVjdl9sZW5faW5pdCkNCj4gKwkJCW1zZy0+bGVuICs9IG1z
Zy0+YnVmWzBdOw0KPiAgCQlwcml2LT5wb3MrKzsNCj4gIAl9DQo+IA0KPiAgCS8qIElmIG5leHQg
cmVjZWl2ZWQgZGF0YSBpcyB0aGUgX0xBU1RfLCBnbyB0byBuZXcgcGhhc2UuICovDQo+IC0JaWYg
KHByaXYtPnBvcyArIDEgPT0gbXNnLT5sZW4pIHsNCj4gKwlpZiAocHJpdi0+cG9zICsgMSA9PSBt
c2ctPmxlbiAmJiAhcmVjdl9sZW5faW5pdCkgew0KDQpJZiBhIG1lc3NhZ2UgY29udGFpbnMgYSBz
aW5nbGUgYnl0ZSBhZnRlciB0aGUgbGVuZ3RoIGJ5dGUsIHdoZW4gd2UgY29tZSBoZXJlIGFmdGVy
IHByb2Nlc3NpbmcgdGhlIGxlbmd0aCAoaW4gdGhlIHNhbWUgZnVuY3Rpb24gY2FsbCksICJwb3Mi
IGlzIDEsICJsZW4iIGlzIDIsIGFuZCB3ZSBpbmRlZWQgYXJlIGdvaW5nIHRvIHByb2Nlc3MgdGhl
IGxhc3QgYnl0ZS4NCkhvd2V2ZXIsICJyZWN2X2xlbl9pbml0IiBpcyBzdGlsbCAidHJ1ZSIsIGFu
ZCB3ZSBza2lwIHRoZXNlIGNvcnJlc3BvbmRpbmcgcmVnaXN0ZXIgd3JpdGVzLCB3aGljaCBpcyBw
cm9iYWJseSBpbmNvcnJlY3QuDQpUaGUgZmxhZyBpbiB0aGlzIGNhc2Ugc2hvdWxkIGJlIHJlLXNl
dCBiYWNrIHRvICJmYWxzZSIgYWZ0ZXIgbGVuZ3RoIHByb2Nlc3NpbmcgYW5kICJwb3MiIG1vdmlu
ZywgYnV0IEkgdGhpbmsgdGhlIHZhcmlhbnQgaW4gbXkgcGF0Y2ggKGxlYXZpbmcgdGhpcyAiaWYi
IHVuY2hhbmdlZCwgYnV0IHNraXBwaW5nIGl0IG9uIHRoZSBmaXJzdCBwYXNzIHdpdGggImdvdG8i
KSBtYXkgYmUgZXZlbiBzaW1wbGVyLg0KDQo+ICAJCWlmIChwcml2LT5mbGFncyAmIElEX0xBU1Rf
TVNHKSB7DQo+ICAJCQlyY2FyX2kyY193cml0ZShwcml2LCBJQ01DUiwgUkNBUl9CVVNfUEhBU0Vf
U1RPUCk7DQo+ICAJCX0gZWxzZSB7DQo+IEBAIC04ODksNyArODkyLDcgQEAgc3RhdGljIHUzMiBy
Y2FyX2kyY19mdW5jKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCkNCj4gIAkgKiBJMkNfTV9JR05P
UkVfTkFLIChhdXRvbWF0aWNhbGx5IHNlbmRzIFNUT1AgYWZ0ZXIgTkFLKQ0KPiAgCSAqLw0KPiAg
CXUzMiBmdW5jID0gSTJDX0ZVTkNfSTJDIHwgSTJDX0ZVTkNfU0xBVkUgfA0KPiAtCQkgICAoSTJD
X0ZVTkNfU01CVVNfRU1VTCAmIH5JMkNfRlVOQ19TTUJVU19RVUlDSyk7DQo+ICsJCSAgIChJMkNf
RlVOQ19TTUJVU19FTVVMX0FMTCAmIH5JMkNfRlVOQ19TTUJVU19RVUlDSyk7DQoNClRoaXMgZmxh
Z3Mgc2V0dGluZyBhZGRzIGFsc28gSTJDX0ZVTkNfU01CVVNfQkxPQ0tfUFJPQ19DQUxMIGZsYWcs
IHdoaWNoIGlzIG1pc3NlZCBpbiBteSBwYXRjaC4gTXkgcGF0Y2ggc2hvdWxkIHByb2JhYmx5IGJl
IHVwZGF0ZWQgdG8gaW5jbHVkZSBpdCB0b28gKGlmIHlvdSdsbCBhZ3JlZSB0byB0YWtlIG15IHZh
cmlhbnQgOy0pICkuDQoNCj4gDQo+ICAJaWYgKHByaXYtPmZsYWdzICYgSURfUF9IT1NUX05PVElG
WSkNCj4gIAkJZnVuYyB8PSBJMkNfRlVOQ19TTUJVU19IT1NUX05PVElGWTsNCj4gDQo+IEhhcHB5
IGhhY2tpbmcsDQo+IA0KPiAgICBXb2xmcmFtDQoNClRoYW5rcyENCg0KQmVzdCByZWdhcmRzLA0K
QW5kcmV3DQo=
