Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23A534F3E5
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 00:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhC3WBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 18:01:34 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3323 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbhC3WBL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 18:01:11 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4F93GP6SqSz149cn;
        Wed, 31 Mar 2021 05:57:49 +0800 (CST)
Received: from dggemm751-chm.china.huawei.com (10.1.198.57) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 31 Mar 2021 06:01:08 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemm751-chm.china.huawei.com (10.1.198.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 06:01:08 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 06:01:08 +0800
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
Thread-Index: AQHXJXAQhX+a0hiUXkCpTQNzS4ZJoKqdC6Iw//+Ck4CAAITk4A==
Date:   Tue, 30 Mar 2021 22:01:08 +0000
Message-ID: <4f6313fb620d4823bacf548224a29477@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
 <baa1c622040745b0b13e99e3f7bf2cd3@hisilicon.com>
 <CAHp75VdY58Tm0FDcoVDWuw0LBKUFWC_hBCb5t=4WX_MPzsLvZw@mail.gmail.com>
In-Reply-To: <CAHp75VdY58Tm0FDcoVDWuw0LBKUFWC_hBCb5t=4WX_MPzsLvZw@mail.gmail.com>
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

DQoNCkZyb206IEFuZHkgU2hldmNoZW5rbyBbbWFpbHRvOmFuZHkuc2hldmNoZW5rb0BnbWFpbC5j
b21dIA0KU2VudDogV2VkbmVzZGF5LCBNYXJjaCAzMSwgMjAyMSAxMDo1NyBBTQ0KVG86IFNvbmcg
QmFvIEh1YSAoQmFycnkgU29uZykgPHNvbmcuYmFvLmh1YUBoaXNpbGljb24uY29tPg0KQ2M6IHlh
bmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT47IHdzYUBrZXJuZWwub3JnOyBhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IFNl
cmdleS5TZW1pbkBiYWlrYWxlbGVjdHJvbmljcy5ydTsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgZGlnZXR4QGdtYWlsLmNvbTsgdHJlZGluZ0BudmlkaWEuY29tOyBqYXJra28ubmlrdWxh
QGxpbnV4LmludGVsLmNvbTsgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs7IEpvaG4gR2Fycnkg
PGpvaG4uZ2FycnlAaHVhd2VpLmNvbT47IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207
IFplbmd0YW8gKEIpIDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+OyBMaW51eGFybSA8bGludXhh
cm1AaHVhd2VpLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggNS81XSBpMmM6IGRlc2lnbndhcmU6
IFN3aXRjaCBvdmVyIHRvIGkyY19mcmVxX21vZGVfc3RyaW5nKCkNCg0KDQoNCk9uIFdlZG5lc2Rh
eSwgTWFyY2ggMzEsIDIwMjEsIFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykgPHNvbmcuYmFvLmh1
YUBoaXNpbGljb24uY29tPiB3cm90ZToNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IHlhbmd5aWNvbmcNCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAzMSwgMjAyMSAz
OjE5IEFNDQo+IFRvOiB3c2FAa2VybmVsLm9yZzsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tOw0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBTZXJnZXkuU2VtaW5AYmFpa2Fs
ZWxlY3Ryb25pY3MucnU7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGRp
Z2V0eEBnbWFpbC5jb207IHRyZWRpbmdAbnZpZGlhLmNvbTsgamFya2tvLm5pa3VsYUBsaW51eC5p
bnRlbC5jb207DQo+IHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrOyBTb25nIEJhbyBIdWEgKEJh
cnJ5IFNvbmcpDQo+IDxzb25nLmJhby5odWFAaGlzaWxpY29uLmNvbT47IEpvaG4gR2FycnkgPGpv
aG4uZ2FycnlAaHVhd2VpLmNvbT47DQo+IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207
IHlhbmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT47IFplbmd0YW8NCj4gKEIpIDxwcmlt
ZS56ZW5nQGhpc2lsaWNvbi5jb20+OyBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDUvNV0gaTJjOiBkZXNpZ253YXJlOiBTd2l0Y2ggb3ZlciB0byBpMmNf
ZnJlcV9tb2RlX3N0cmluZygpDQo+IA0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFVzZSBnZW5lcmljIGkyY19mcmVxX21v
ZGVfc3RyaW5nKCkgaGVscGVyIHRvIHByaW50IGNob3NlbiBidXMgc3BlZWQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWWljb25nIFlhbmcgPHlhbmd5aWNvbmdAaGlzaWxpY29u
LmNvbT4NCj4gLS0tDQo+wqAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rl
ci5jIHwgMjAgKysrKy0tLS0tLS0tLS0tLS0tLS0NCj7CoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWRlc2lnbndhcmUtbWFzdGVyLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWRlc2lnbndhcmUtbWFzdGVyLmMNCj4gaW5kZXggZGQyN2I5ZC4uYjY0YzRjOCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rlci5jDQo+ICsr
KyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYw0KPiBAQCAtMzUs
MTAgKzM1LDEwIEBAIHN0YXRpYyB2b2lkIGkyY19kd19jb25maWd1cmVfZmlmb19tYXN0ZXIoc3Ry
dWN0IGR3X2kyY19kZXYNCj4gKmRldikNCj4gDQo+wqAgc3RhdGljIGludCBpMmNfZHdfc2V0X3Rp
bWluZ3NfbWFzdGVyKHN0cnVjdCBkd19pMmNfZGV2ICpkZXYpDQo+wqAgew0KPiAtwqAgwqAgwqBj
b25zdCBjaGFyICptb2RlX3N0ciwgKmZwX3N0ciA9ICIiOw0KPsKgIMKgIMKgIMKgdTMyIGNvbXBf
cGFyYW0xOw0KPsKgIMKgIMKgIMKgdTMyIHNkYV9mYWxsaW5nX3RpbWUsIHNjbF9mYWxsaW5nX3Rp
bWU7DQo+wqAgwqAgwqAgwqBzdHJ1Y3QgaTJjX3RpbWluZ3MgKnQgPSAmZGV2LT50aW1pbmdzOw0K
PiArwqAgwqAgwqBjb25zdCBjaGFyICpmcF9zdHIgPSAiIjsNCj7CoCDCoCDCoCDCoHUzMiBpY19j
bGs7DQo+wqAgwqAgwqAgwqBpbnQgcmV0Ow0KPiANCj4gQEAgLTE1MywyMiArMTUzLDEwIEBAIHN0
YXRpYyBpbnQgaTJjX2R3X3NldF90aW1pbmdzX21hc3RlcihzdHJ1Y3QgZHdfaTJjX2Rldg0KPiAq
ZGV2KQ0KPiANCj7CoCDCoCDCoCDCoHJldCA9IGkyY19kd19zZXRfc2RhX2hvbGQoZGV2KTsNCj7C
oCDCoCDCoCDCoGlmIChyZXQpDQo+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gb3V0Ow0KPiAt
DQo+IC3CoCDCoCDCoHN3aXRjaCAoZGV2LT5tYXN0ZXJfY2ZnICYgRFdfSUNfQ09OX1NQRUVEX01B
U0spIHsNCj4gLcKgIMKgIMKgY2FzZSBEV19JQ19DT05fU1BFRURfU1REOg0KPiAtwqAgwqAgwqAg
wqAgwqAgwqAgwqBtb2RlX3N0ciA9ICJTdGFuZGFyZCBNb2RlIjsNCj4gLcKgIMKgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7DQo+IC3CoCDCoCDCoGNhc2UgRFdfSUNfQ09OX1NQRUVEX0hJR0g6DQo+IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoG1vZGVfc3RyID0gIkhpZ2ggU3BlZWQgTW9kZSI7DQo+IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOw0KPiAtwqAgwqAgwqBkZWZhdWx0Og0KPiAtwqAgwqAgwqAg
wqAgwqAgwqAgwqBtb2RlX3N0ciA9ICJGYXN0IE1vZGUiOw0KPiAtwqAgwqAgwqB9DQo+IC3CoCDC
oCDCoGRldl9kYmcoZGV2LT5kZXYsICJCdXMgc3BlZWQ6ICVzJXNcbiIsIG1vZGVfc3RyLCBmcF9z
dHIpOw0KPiArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ow0KPiANCj4gLW91dDoNCj4g
LcKgIMKgIMKgcmV0dXJuIHJldDsNCj4gK8KgIMKgIMKgZGV2X2RiZyhkZXYtPmRldiwgIkJ1cyBz
cGVlZDogJXNcbiIsDQo+IGkyY19mcmVxX21vZGVfc3RyaW5nKHQtPmJ1c19mcmVxX2h6KSk7DQoN
Cj4gV2VpcmQgdGhlIG9yaWdpbmFsIGNvZGUgd2FzIHByaW50aW5nIGJvdGggbW9kZSBhbmQgZnAu
DQo+IEFuZCB5b3UgYXJlIHByaW50aW5nIG1vZGUgb25seS4NCg0KPj4gU29ycnksIGJ1dCBJIGRp
ZG7igJl0IGdldCB3aGF0IHlvdSBtZWFuIGhlcmUuIFRoZSBjb2RlIGlzIGVxdWl2YWxlbnQsIGFu
ZCBhY3R1YWxseSBpdCB3aWxsIHByaW50IGV2ZW4gbW9yZS4NCg0KVGhlIG9yaWdpbmFsIGNvZGUg
d2lsbCBwcmludCB0aGUgc3RyaW5nIGZwX3N0cjoNCiVzJXNcbiIsIG1vZGVfc3RyLCBmcF9zdHIN
Cg0KVGhlIG5ldyBjb2RlIGlzIHByaW50aW5nIG1vZGVfc3RyIG9ubHk6DQolcw0KDQo+ICvCoCDC
oCDCoHJldHVybiAwOw0KPsKgIH0NCj4gDQo+wqAgLyoqDQo+IC0tDQo+IDIuOC4xDQoNCg0KLS0g
DQpXaXRoIEJlc3QgUmVnYXJkcywNCkFuZHkgU2hldmNoZW5rbw0KDQo=
