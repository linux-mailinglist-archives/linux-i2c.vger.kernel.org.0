Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9F033CFC2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 09:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbhCPIXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 04:23:42 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:56360 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234590AbhCPIXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 04:23:38 -0400
Received: from fe0vm1649.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4F05sL2SVPz1XLDRB;
        Tue, 16 Mar 2021 09:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1615883014;
        bh=V+qGlQ1mvBPi2aecRdiDARtURSXoGD2Q4Qax3CGKDC4=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=RbiI8GqcF9uu1h/y0RfsdVsPvScuRBHWqga2ayxZyt1Wk6j6MCabSd25gs2inKzb9
         24Plg45KGauLKKEunKOCdztj6+gZ4lHP2hec8hUzvkaJ2N1a4gzIZ3WmjDpFpK2TCJ
         ZTZ4gYUvgK1kkXwKxqE2Y2P/tVf2OiaY2+JqaPCk=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 4F05sL27RBz1JW;
        Tue, 16 Mar 2021 09:23:34 +0100 (CET)
X-AuditID: 0a3aad0c-963ff70000001120-ff-60506b06247e
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id E4.B8.04384.60B60506; Tue, 16 Mar 2021 09:23:34 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (fe-mbx2051.de.bosch.com [10.3.231.61])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 4F05sL0kygz6CjZP7;
        Tue, 16 Mar 2021 09:23:34 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2051.de.bosch.com (10.3.231.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Tue, 16 Mar 2021 09:23:33 +0100
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2176.009; Tue, 16 Mar 2021 09:23:33 +0100
From:   "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Adam.Thomson.Opensource@diasemi.com" 
        <Adam.Thomson.Opensource@diasemi.com>,
        "stwiss.opensource@diasemi.com" <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Subject: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHXGbkPiUXhB/LHYUaUf9+y5cOeeqqGJdGAgAASZrA=
Date:   Tue, 16 Mar 2021 08:23:33 +0000
Message-ID: <4dbc130e769547508be811e61a348255@de.bosch.com>
References: <20210315160903.799426-1-mark.jonas@de.bosch.com>
 <20210316072143.GA701493@dell>
In-Reply-To: <20210316072143.GA701493@dell>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.232.72]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsXCZbVWVpctOyDB4OxELoul75cyW9z/epTR
        ouPvF0aLy7vmsFlc/b2exWJv60Vmi7v75zI6sHus+KTvsWlVJ5vHnWt72Dw+b5ILYInisklJ
        zcksSy3St0vgytjyZgZ7wQOpijOHPrI3MHZIdTFyckgImEisOrqAsYuRi0NIYAaTxNHrN5gg
        nL2MErPufGGBcN4ySnQtOcIO4RxglFj0eSoLSD+bgJ3E/tdvgFo4OEQEVCTOvTEHqWEWuMki
        0bl0DyNIjbCAtcTJlT+hahwk1hzkgzCtJJZ/jAKpYBFQlXjd0soGEuYFqj7YXwYSFhKIk9jx
        egdYmFNAW+LjEkuQMKOArMSGDeeZQWxmAXGJTc++s0L8IiCxZA9EXEJAVOLl43+sIK0SAooS
        294UgJjMApoS63fpQ3QqSkzpfsgOYvMKCEqcnPmEZQKj+CwkQ2chdMxC0jELSccCRpZVjGJp
        qQZluQZGlgYGekVJqcVVBoZ6yfm5mxghMcmzg/FUzwe9Q4xMHIyHGCU4mJVEeD/r+CYI8aYk
        VlalFuXHF5XmpBYfYpTmYFES51Xh2RgnJJCeWJKanZpakFoEk2Xi4JRqYJq4qv3MzQ8Srm80
        Gx8WHGmsiKkyWtr9TSAzbfJBZvar1rtzDVzuu/yr2d9qecS7OO6x3kfdC6sWbTmp+j94p/Hn
        Qp3Pailngq8vmF7Jo7r8mWz31ahCocKms+bnw4t/5lxhqs3+ZhmQuJH3XMWdhcbTYqzWyyS3
        ueo6q63f0Heo8HPTTd37Ryxuf8s1Uv/t7sPu+DA8/ljkN7+w0xtKr0lcbKzwKKto8NTuOWdR
        l3b98bSucnnjvRbvyjji+ivPrDBin52ltpNTIdTRyfwn0xbjPb0GdQeiWav3vF7L0ux09cLV
        CJXeDJH9E9f/OvV5s+RjrvUBTcEOoX3B0U+9qpnlkhMOnclOsW/zXndXiaU4I9FQi7moOBEA
        wswYrTgDAAA=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGVlLA0KDQo+IENvZGUgbG9va3MgZ29vZCB0byBtZSBub3csIHRoYW5rcy4NCj4gDQo+IEhv
d2V2ZXIsIHRoaXMgZG9lc24ndCBsb29rIGxpa2UgaXQgd291bGQgcGFzcyBjaGVja3BhdGNoLg0K
PiANCj4gSGF2ZSB5b3UgdHJpZWQgdG8gYnVpbGQgd2l0aCBXPTEgYW5kIGNoZWNrcGF0Y2g/DQoN
Clllcywgd2UgdXNlZCBjaGVja3BhdGNoLnBsLg0KDQogICAgJCAuL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAwMDAxLW1mZC1kYTkwNjMtU3VwcG9ydC1TTUJ1cy1hbmQtSTJDLW1vZGUudjUNCiAgICB0
b3RhbDogMCBlcnJvcnMsIDAgd2FybmluZ3MsIDI1IGxpbmVzIGNoZWNrZWQNCg0KICAgIDAwMDEt
bWZkLWRhOTA2My1TdXBwb3J0LVNNQnVzLWFuZC1JMkMtbW9kZS52NSBoYXMgbm8gb2J2aW91cyBz
dHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yIHN1Ym1pc3Npb24uDQoNClVzaW5nIHRoZSBv
cHRpb24gLS1zdHJpY3Qgd2UgZ2V0IGEgY2hlY2sgaGludCB0aGF0IHRoZSBicm9rZW4gbGluZSBv
ZiB0aGUgcmVnbWFwX2NsZWFyX2JpdHMoKSBpcyBub3QgYWxpZ25lZC4gV2UgdHJpZWQgYnV0IHdl
cmUgbm90IGFibGUgdG8gbWFrZSB0aGUgdG9vbCBoYXBweS4gVGhpcyBtYXRjaGVzIG91ciBleHBl
cmllbmNlIHdpdGggdGhpcyBjaGVjayBoaW50IGFuZCBwcmV2aW91cyBwYXRjaGVzLg0KIA0KQWxz
byBjb21waWxpbmcgTGludXggNS4xMC4xNCB3aXRoIG91ciBwYXRjaCBhbmQgVz0xIGRvZXMgbm90
IHlpZWxkIGEgd2FybmluZy4NCg0KICAgICQgbWFrZSBXPTENCiAgICAgIENBTEwgICAgc2NyaXB0
cy9jaGVja3N5c2NhbGxzLnNoDQogICAgICBDQUxMICAgIHNjcmlwdHMvYXRvbWljL2NoZWNrLWF0
b21pY3Muc2gNCiAgICAgIENISyAgICAgaW5jbHVkZS9nZW5lcmF0ZWQvY29tcGlsZS5oDQogICAg
ICBDQyBbTV0gIGRyaXZlcnMvbWZkL2RhOTA2My1pMmMubw0KICAgICAgTEQgW01dICBkcml2ZXJz
L21mZC9kYTkwNjMubw0KICAgICAgS2VybmVsOiBhcmNoL2FybS9ib290L0ltYWdlIGlzIHJlYWR5
DQogICAgICBLZXJuZWw6IGFyY2gvYXJtL2Jvb3QvekltYWdlIGlzIHJlYWR5DQogICAgICBNT0RQ
T1NUIE1vZHVsZS5zeW12ZXJzDQogICAgICBMRCBbTV0gIGRyaXZlcnMvbWZkL2RhOTA2My5rbw0K
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL2RhOTA2My1pMmMuYyBiL2RyaXZlcnMvbWZk
L2RhOTA2My1pMmMuYyBpbmRleA0KPiA+IDM3ODFkMGJiNzc4Ni4uZThhMDIyZTY5N2M1IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWZkL2RhOTA2My1pMmMuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL2RhOTA2My1pMmMuYw0KPiA+IEBAIC00NDIsNiArNDQyLDE2IEBAIHN0YXRpYyBpbnQgZGE5
MDYzX2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLA0KPiA+ICAJCXJldHVybiByZXQ7
DQo+ID4gIAl9DQo+ID4NCj4gPiArCS8qIElmIFNNQnVzIGlzIG5vdCBhdmFpbGFibGUgYW5kIG9u
bHkgSTJDIGlzIHBvc3NpYmxlLCBlbnRlciBJMkMgbW9kZSAqLw0KPiA+ICsJaWYgKGkyY19jaGVj
a19mdW5jdGlvbmFsaXR5KGkyYy0+YWRhcHRlciwgSTJDX0ZVTkNfSTJDKSkgew0KPiA+ICsJCXJl
dCA9IHJlZ21hcF9jbGVhcl9iaXRzKGRhOTA2My0+cmVnbWFwLA0KPiBEQTkwNjNfUkVHX0NPTkZJ
R19KLA0KPiA+ICsJCQkgIERBOTA2M19UV09XSVJFX1RPKTsNCj4gPiArCQlpZiAocmV0IDwgMCkg
ew0KPiA+ICsJCQlkZXZfZXJyKGRhOTA2My0+ZGV2LCAiRmFpbGVkIHRvIHNldCBUd28tV2lyZSBC
dXMNCj4gTW9kZS5cbiIpOw0KPiA+ICsJCQlyZXR1cm4gLUVJTzsNCj4gPiArCQl9DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICAJcmV0dXJuIGRhOTA2M19kZXZpY2VfaW5pdChkYTkwNjMsIGkyYy0+aXJx
KTsgIH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9kYTkwNjMvcmVn
aXN0ZXJzLmgNCj4gPiBiL2luY2x1ZGUvbGludXgvbWZkL2RhOTA2My9yZWdpc3RlcnMuaA0KPiA+
IGluZGV4IDFkYmFiZjFiM2NiOC4uNmUwZjY2YTJlNzI3IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvbWZkL2RhOTA2My9yZWdpc3RlcnMuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgv
bWZkL2RhOTA2My9yZWdpc3RlcnMuaA0KPiA+IEBAIC0xMDM3LDYgKzEwMzcsOSBAQA0KPiA+ICAj
ZGVmaW5lCQlEQTkwNjNfTk9OS0VZX1BJTl9BVVRPRE9XTgkweDAyDQo+ID4gICNkZWZpbmUJCURB
OTA2M19OT05LRVlfUElOX0FVVE9GTFBSVAkweDAzDQo+ID4NCj4gPiArLyogREE5MDYzX1JFR19D
T05GSUdfSiAoYWRkcj0weDEwRikgKi8NCj4gPiArI2RlZmluZSBEQTkwNjNfVFdPV0lSRV9UTwkJ
CTB4NDANCj4gPiArDQo+ID4gIC8qIERBOTA2M19SRUdfTU9OX1JFR181IChhZGRyPTB4MTE2KSAq
Lw0KPiA+ICAjZGVmaW5lIERBOTA2M19NT05fQThfSURYX01BU0sJCQkweDA3DQo+ID4gICNkZWZp
bmUJCURBOTA2M19NT05fQThfSURYX05PTkUJCTB4MDANCg0KQ2hlZXJzLA0KTWFyaw0K
