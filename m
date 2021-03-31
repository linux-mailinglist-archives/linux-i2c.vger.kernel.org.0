Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EDC34FBF3
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 10:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCaIxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 04:53:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3510 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhCaIxF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 04:53:05 -0400
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F9KmD01rbzRSWg;
        Wed, 31 Mar 2021 16:51:08 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 31 Mar 2021 16:53:03 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 31 Mar 2021 16:53:02 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 16:53:02 +0800
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
Thread-Index: AQHXJXAQhX+a0hiUXkCpTQNzS4ZJoKqdC6Iw//+Ck4CAAITk4IAAAadwgAAQg4CAAKJI0A==
Date:   Wed, 31 Mar 2021 08:53:02 +0000
Message-ID: <793f587a5bc744b393cf677258bce50e@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-6-git-send-email-yangyicong@hisilicon.com>
 <baa1c622040745b0b13e99e3f7bf2cd3@hisilicon.com>
 <CAHp75VdY58Tm0FDcoVDWuw0LBKUFWC_hBCb5t=4WX_MPzsLvZw@mail.gmail.com>
 <7e82e13b245a4b11917a2e0191acdb1a@hisilicon.com>
 <CAHp75VeTj-wk3WP2-Unoti0+Cajx33b8NOUbBiSBQLmJHn=YAg@mail.gmail.com>
In-Reply-To: <CAHp75VeTj-wk3WP2-Unoti0+Cajx33b8NOUbBiSBQLmJHn=YAg@mail.gmail.com>
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

DQo+IE5vLCBwbGVhc2UgcmVhZCB0aGUgY29kZSBjYXJlZnVsbHkuDQo+IFdlIGNhbiBkdXBsaWNh
dGUgY29uZGl0aW9uYWwsIGJ1dCBpdCBicmluZ3MgYSBiaXQgb2YgaW5jb25zaXN0ZW5jeSB0byBo
b3cgdGhlIGNvdW50ZXJzIGFyZSBwcmludGVkLg0KDQpUaGFua3MgZm9yIGNsYXJpZmljYXRpb24s
IEkgYW0gc3RpbGwgY29uZnVzZWQgYXMgdGhlIG9yaWdpbmFsDQpjb2RlIHByaW50IHRoZSByZWFs
IG1vZGUgYmFzZWQgb24gZGV2LT5tYXN0ZXJfY2ZnLCB0aGUgbmV3DQpjb2RlIGlzIHByaW50aW5n
IG1vZGUgYmFzZWQgb24gZnJlcXVlbmN5Lg0KDQpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoZSBvcmln
aW5hbCBjb2RlIGNvdWxkIGZhbGwgYmFjayB0byBhIGxvd2VyDQpzcGVlZCB3aGVuIGhpZ2hlciBz
cGVlZCBtb2RlcyB3ZXJlIG5vdCBzZXQgc3VjY2Vzc2Z1bGx5LiBGb3INCmV4YW1wbGUsIGhpZ2gg
c3BlZWQgbW9kZSBmYWxscyBiYWNrIHRvIGZhc3QgbW9kZToNCg0KaWYgKChkZXYtPm1hc3Rlcl9j
ZmcgJiBEV19JQ19DT05fU1BFRURfTUFTSykgPT0NCgkJRFdfSUNfQ09OX1NQRUVEX0hJR0gpIHsN
CgkJaWYgKChjb21wX3BhcmFtMSAmIERXX0lDX0NPTVBfUEFSQU1fMV9TUEVFRF9NT0RFX01BU0sp
DQoJCQkhPSBEV19JQ19DT01QX1BBUkFNXzFfU1BFRURfTU9ERV9ISUdIKSB7DQoJCQlkZXZfZXJy
KGRldi0+ZGV2LCAiSGlnaCBTcGVlZCBub3Qgc3VwcG9ydGVkIVxuIik7DQoJCQlkZXYtPm1hc3Rl
cl9jZmcgJj0gfkRXX0lDX0NPTl9TUEVFRF9NQVNLOw0KCQkJZGV2LT5tYXN0ZXJfY2ZnIHw9IERX
X0lDX0NPTl9TUEVFRF9GQVNUOw0KCQkJZGV2LT5oc19oY250ID0gMDsNCgkJCWRldi0+aHNfbGNu
dCA9IDA7DQoJCX0NCg0KdGhlIG9yaWdpbmFsIGNvZGUgd2FzIHByaW50aW5nIHRoZSBtb2RlIGJh
c2VkIG9uIHRoZSBuZXcNCmZhbGxiYWNrIGRldi0+bWFzdGVyX2NmZyBidXQgbm90IHRoZSBtb2Rl
IGNhbGN1bGF0ZWQgZnJvbQ0KZnJlcXVlbmN5Og0KDQoJc3dpdGNoIChkZXYtPm1hc3Rlcl9jZmcg
JiBEV19JQ19DT05fU1BFRURfTUFTSykgew0KCWNhc2UgRFdfSUNfQ09OX1NQRUVEX1NURDoNCgkJ
bW9kZV9zdHIgPSAiU3RhbmRhcmQgTW9kZSI7DQoJCWJyZWFrOw0KCWNhc2UgRFdfSUNfQ09OX1NQ
RUVEX0hJR0g6DQoJCW1vZGVfc3RyID0gIkhpZ2ggU3BlZWQgTW9kZSI7DQoJCWJyZWFrOw0KCWRl
ZmF1bHQ6DQoJCW1vZGVfc3RyID0gIkZhc3QgTW9kZSI7DQoJfQ0KDQo+ID4gK8KgIMKgIMKgcmV0
dXJuIDA7DQo+ID7CoCB9DQo+ID4NCj4gPsKgIC8qKg0KPiA+IC0tDQo+ID4gMi44LjENCj4gDQo+
IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQoNCg0KLS0g
DQpXaXRoIEJlc3QgUmVnYXJkcywNCkFuZHkgU2hldmNoZW5rbw0KDQo=
