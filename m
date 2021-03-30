Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD99034F3FE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 00:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhC3WHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 18:07:31 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5117 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbhC3WG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 18:06:59 -0400
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F93Qk39fYzYQPV;
        Wed, 31 Mar 2021 06:05:02 +0800 (CST)
Received: from dggemm752-chm.china.huawei.com (10.1.198.58) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 31 Mar 2021 06:06:56 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemm752-chm.china.huawei.com (10.1.198.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 06:06:56 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 06:06:56 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     yangyicong <yangyicong@huawei.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sergey.Semin@baikalelectronics.ru" 
        <Sergey.Semin@baikalelectronics.ru>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "digetx@gmail.com" <digetx@gmail.com>,
        "treding@nvidia.com" <treding@nvidia.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        John Garry <john.garry@huawei.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Zengtao (B)" <prime.zeng@hisilicon.com>,
        Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Thread-Topic: [PATCH 5/5] i2c: designware: Switch over to
 i2c_freq_mode_string()
Thread-Index: AQHXJXAQhX+a0hiUXkCpTQNzS4ZJoKqdC6Iw//+Ck4CAAITk4IAAAadw
Date:   Tue, 30 Mar 2021 22:06:56 +0000
Message-ID: <7e82e13b245a4b11917a2e0191acdb1a@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
 <baa1c622040745b0b13e99e3f7bf2cd3@hisilicon.com>
 <CAHp75VdY58Tm0FDcoVDWuw0LBKUFWC_hBCb5t=4WX_MPzsLvZw@mail.gmail.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.63]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU29uZyBCYW8gSHVhIChC
YXJyeSBTb25nKQ0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMxLCAyMDIxIDEwOjU0IEFNDQo+
IFRvOiAnQW5keSBTaGV2Y2hlbmtvJyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gQ2M6
IHlhbmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT47IHdzYUBrZXJuZWwub3JnOw0KPiBh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5v
cmc7DQo+IFNlcmdleS5TZW1pbkBiYWlrYWxlbGVjdHJvbmljcy5ydTsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsNCj4gZGlnZXR4QGdtYWlsLmNvbTsgdHJlZGluZ0BudmlkaWEuY29tOyBq
YXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbTsNCj4gcm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs7IEpvaG4gR2FycnkgPGpvaG4uZ2FycnlAaHVhd2VpLmNvbT47DQo+IG1pa2Eud2VzdGVyYmVy
Z0BsaW51eC5pbnRlbC5jb207IFplbmd0YW8gKEIpIDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+
Ow0KPiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRD
SCA1LzVdIGkyYzogZGVzaWdud2FyZTogU3dpdGNoIG92ZXIgdG8gaTJjX2ZyZXFfbW9kZV9zdHJp
bmcoKQ0KPiANCj4gDQo+IA0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gW21haWx0bzphbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMxLCAyMDIxIDEw
OjU3IEFNDQo+IFRvOiBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIDxzb25nLmJhby5odWFAaGlz
aWxpY29uLmNvbT4NCj4gQ2M6IHlhbmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT47IHdz
YUBrZXJuZWwub3JnOw0KPiBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGxpbnV4
LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IFNlcmdleS5TZW1pbkBiYWlrYWxlbGVjdHJvbmljcy5y
dTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gZGlnZXR4QGdtYWlsLmNvbTsgdHJl
ZGluZ0BudmlkaWEuY29tOyBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbTsNCj4gcm1rK2tl
cm5lbEBhcm1saW51eC5vcmcudWs7IEpvaG4gR2FycnkgPGpvaG4uZ2FycnlAaHVhd2VpLmNvbT47
DQo+IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IFplbmd0YW8gKEIpIDxwcmltZS56
ZW5nQGhpc2lsaWNvbi5jb20+Ow0KPiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCA1LzVdIGkyYzogZGVzaWdud2FyZTogU3dpdGNoIG92ZXIgdG8g
aTJjX2ZyZXFfbW9kZV9zdHJpbmcoKQ0KPiANCj4gDQo+IA0KPiBPbiBXZWRuZXNkYXksIE1hcmNo
IDMxLCAyMDIxLCBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpDQo+IDxzb25nLmJhby5odWFAaGlz
aWxpY29uLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IHlhbmd5aWNvbmcNCj4gPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMxLCAy
MDIxIDM6MTkgQU0NCj4gPiBUbzogd3NhQGtlcm5lbC5vcmc7IGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbTsNCj4gPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBTZXJnZXkuU2Vt
aW5AYmFpa2FsZWxlY3Ryb25pY3MucnU7DQo+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiA+IENjOiBkaWdldHhAZ21haWwuY29tOyB0cmVkaW5nQG52aWRpYS5jb207IGphcmtrby5u
aWt1bGFAbGludXguaW50ZWwuY29tOw0KPiA+IHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrOyBT
b25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpDQo+ID4gPHNvbmcuYmFvLmh1YUBoaXNpbGljb24uY29t
PjsgSm9obiBHYXJyeSA8am9obi5nYXJyeUBodWF3ZWkuY29tPjsNCj4gPiBtaWthLndlc3RlcmJl
cmdAbGludXguaW50ZWwuY29tOyB5YW5neWljb25nIDx5YW5neWljb25nQGh1YXdlaS5jb20+Ow0K
PiBaZW5ndGFvDQo+ID4gKEIpIDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+OyBMaW51eGFybSA8
bGludXhhcm1AaHVhd2VpLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggNS81XSBpMmM6IGRlc2ln
bndhcmU6IFN3aXRjaCBvdmVyIHRvIGkyY19mcmVxX21vZGVfc3RyaW5nKCkNCj4gPg0KPiA+IEZy
b206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0K
PiA+DQo+ID4gVXNlIGdlbmVyaWMgaTJjX2ZyZXFfbW9kZV9zdHJpbmcoKSBoZWxwZXIgdG8gcHJp
bnQgY2hvc2VuIGJ1cyBzcGVlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlpY29uZyBZYW5nIDx5YW5neWljb25nQGhpc2lsaWNvbi5jb20+DQo+ID4gLS0tDQo+ID7C
oCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtbWFzdGVyLmMgfCAyMCArKysrLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+wqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1kZXNpZ253YXJlLW1hc3Rlci5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2ln
bndhcmUtbWFzdGVyLmMNCj4gPiBpbmRleCBkZDI3YjlkLi5iNjRjNGM4IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYw0KPiA+IEBAIC0zNSwx
MCArMzUsMTAgQEAgc3RhdGljIHZvaWQgaTJjX2R3X2NvbmZpZ3VyZV9maWZvX21hc3RlcihzdHJ1
Y3QNCj4gZHdfaTJjX2Rldg0KPiA+ICpkZXYpDQo+ID4NCj4gPsKgIHN0YXRpYyBpbnQgaTJjX2R3
X3NldF90aW1pbmdzX21hc3RlcihzdHJ1Y3QgZHdfaTJjX2RldiAqZGV2KQ0KPiA+wqAgew0KPiA+
IC3CoCDCoCDCoGNvbnN0IGNoYXIgKm1vZGVfc3RyLCAqZnBfc3RyID0gIiI7DQo+ID7CoCDCoCDC
oCDCoHUzMiBjb21wX3BhcmFtMTsNCj4gPsKgIMKgIMKgIMKgdTMyIHNkYV9mYWxsaW5nX3RpbWUs
IHNjbF9mYWxsaW5nX3RpbWU7DQo+ID7CoCDCoCDCoCDCoHN0cnVjdCBpMmNfdGltaW5ncyAqdCA9
ICZkZXYtPnRpbWluZ3M7DQo+ID4gK8KgIMKgIMKgY29uc3QgY2hhciAqZnBfc3RyID0gIiI7DQo+
ID7CoCDCoCDCoCDCoHUzMiBpY19jbGs7DQo+ID7CoCDCoCDCoCDCoGludCByZXQ7DQo+ID4NCj4g
PiBAQCAtMTUzLDIyICsxNTMsMTAgQEAgc3RhdGljIGludCBpMmNfZHdfc2V0X3RpbWluZ3NfbWFz
dGVyKHN0cnVjdCBkd19pMmNfZGV2DQo+ID4gKmRldikNCj4gPg0KPiA+wqAgwqAgwqAgwqByZXQg
PSBpMmNfZHdfc2V0X3NkYV9ob2xkKGRldik7DQo+ID7CoCDCoCDCoCDCoGlmIChyZXQpDQo+ID4g
LcKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBvdXQ7DQo+ID4gLQ0KPiA+IC3CoCDCoCDCoHN3aXRj
aCAoZGV2LT5tYXN0ZXJfY2ZnICYgRFdfSUNfQ09OX1NQRUVEX01BU0spIHsNCj4gPiAtwqAgwqAg
wqBjYXNlIERXX0lDX0NPTl9TUEVFRF9TVEQ6DQo+ID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgbW9k
ZV9zdHIgPSAiU3RhbmRhcmQgTW9kZSI7DQo+ID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
DQo+ID4gLcKgIMKgIMKgY2FzZSBEV19JQ19DT05fU1BFRURfSElHSDoNCj4gPiAtwqAgwqAgwqAg
wqAgwqAgwqAgwqBtb2RlX3N0ciA9ICJIaWdoIFNwZWVkIE1vZGUiOw0KPiA+IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoGJyZWFrOw0KPiA+IC3CoCDCoCDCoGRlZmF1bHQ6DQo+ID4gLcKgIMKgIMKgIMKg
IMKgIMKgIMKgbW9kZV9zdHIgPSAiRmFzdCBNb2RlIjsNCj4gPiAtwqAgwqAgwqB9DQo+ID4gLcKg
IMKgIMKgZGV2X2RiZyhkZXYtPmRldiwgIkJ1cyBzcGVlZDogJXMlc1xuIiwgbW9kZV9zdHIsIGZw
X3N0cik7DQo+ID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDsNCj4gPg0KPiA+IC1v
dXQ6DQo+ID4gLcKgIMKgIMKgcmV0dXJuIHJldDsNCj4gPiArwqAgwqAgwqBkZXZfZGJnKGRldi0+
ZGV2LCAiQnVzIHNwZWVkOiAlc1xuIiwNCj4gPiBpMmNfZnJlcV9tb2RlX3N0cmluZyh0LT5idXNf
ZnJlcV9oeikpOw0KPiANCj4gPiBXZWlyZCB0aGUgb3JpZ2luYWwgY29kZSB3YXMgcHJpbnRpbmcg
Ym90aCBtb2RlIGFuZCBmcC4NCj4gPiBBbmQgeW91IGFyZSBwcmludGluZyBtb2RlIG9ubHkuDQo+
IA0KPiA+PiBTb3JyeSwgYnV0IEkgZGlkbuKAmXQgZ2V0IHdoYXQgeW91IG1lYW4gaGVyZS4gVGhl
IGNvZGUgaXMgZXF1aXZhbGVudCwgYW5kIGFjdHVhbGx5DQo+IGl0IHdpbGwgcHJpbnQgZXZlbiBt
b3JlLg0KPiANCj4gVGhlIG9yaWdpbmFsIGNvZGUgd2lsbCBwcmludCB0aGUgc3RyaW5nIGZwX3N0
cjoNCj4gJXMlc1xuIiwgbW9kZV9zdHIsIGZwX3N0cg0KPiANCj4gVGhlIG5ldyBjb2RlIGlzIHBy
aW50aW5nIG1vZGVfc3RyIG9ubHk6DQo+ICVzDQo+IA0KDQpJc24ndCBmcF9zdHIgcmVkdW5kYW50
PyBEbyB3ZSBuZWVkIHRvIGNoYW5nZQ0KDQpkZXZfZGJnKGRldi0+ZGV2LCAiRmFzdCBNb2RlOiVz
IEhDTlQ6TENOVCA9ICVkOiVkXG4iLCBmcF9zdHIuLi4pDQoNCj4gPiArwqAgwqAgwqByZXR1cm4g
MDsNCj4gPsKgIH0NCj4gPg0KPiA+wqAgLyoqDQo+ID4gLS0NCj4gPiAyLjguMQ0KPiANCj4gDQo+
IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCg0K
