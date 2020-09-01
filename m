Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849FF25A050
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 22:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgIAU6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 16:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgIAU6r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 16:58:47 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2683C061244
        for <linux-i2c@vger.kernel.org>; Tue,  1 Sep 2020 13:58:46 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 87A5684488;
        Wed,  2 Sep 2020 08:58:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1598993921;
        bh=pwwOTo4HjFxEhPfVBMM5/92LuLyxOWSNLA1cU8rOBYo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=02H760kZKDvRLVPFCyqHZKQ1hg4g2He0ETd5//0atDfRwCsuEkBt/HLXAGpOYegP0
         k+xsnhise8JrnjMMaWO8lSBhqVVnSNiVPcoC4ClRKo+UGG51daZFNELt8UNPsEagWG
         tk2TO2y0jDcaOekRE6AmhDTVEj/aSpNH3ngyhfgi6vP71xgwrmzTPC489NvDv9835l
         wYfDGaYF7Q2J/Egbh0n/3u8y86ISKPH0CkyjXM799srXJ42ZQc5VrevBYSXjyp+Zfq
         DDDgZMHbQDySR8umg7n2098kb2IZRO2x821q0p0vbzzBiOqPzV3rrx2GcykJkyVSpd
         6NPpyUAvaBU9Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f4eb5ff0001>; Wed, 02 Sep 2020 08:58:39 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 2 Sep 2020 08:58:41 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 2 Sep 2020 08:58:41 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: algo-pca: Reapply i2c bus settings after reset
Thread-Topic: [PATCH] i2c: algo-pca: Reapply i2c bus settings after reset
Thread-Index: AQHWf/rlsLodCzGj+0ymaR+eTrtgJqlTfDYA
Date:   Tue, 1 Sep 2020 20:58:41 +0000
Message-ID: <842bf7c4-3677-4182-4def-89f198e81fb7@alliedtelesis.co.nz>
References: <20200901005713.27453-1-evan.nimmo@alliedtelesis.co.nz>
In-Reply-To: <20200901005713.27453-1-evan.nimmo@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0679069F136714B85EA9B9BBDDDDE1B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgRXZhbiwNCg0KT25lIG1pbm9yIGNvbW1lbnQgZnJvbSBtZSBiZWxvdy4gV2l0aCB0aGF0DQoN
ClJldmlld2VkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+DQoNCk9uIDEvMDkvMjAgMTI6NTcgcG0sIEV2YW4gTmltbW8gd3JvdGU6DQo+IElmIHNv
bWV0aGluZyBnb2VzIHdyb25nIChzdWNoIGFzIHRoZSBTQ0wgYmVpbmcgc3R1Y2sgbG93KSB0aGVu
IHdlIG5lZWQNCj4gdG8gcmVzZXQgdGhlIHBjYSBjaGlwLiBUaGUgaXNzdWUgd2l0aCB0aGlzIGlz
IHRoYXQgb24gcmVzZXQgd2UgbG9zZSBhbGwNCj4gY29uZmlnIHNldHRpbmdzIGFuZCB0aGUgY2hp
cCBlbmRzIHVwIGluIGEgZGlzYWJsZWQgc3RhdGUgd2hpY2ggcmVzdWx0cw0KPiBpbiBhIGxvY2sg
dXAvaGlnaCBjcHUgdXNhZ2UuIFdlIG5lZWQgdG8gcmUtYXBwbHkgYW55IGNvbmZpZ3VyYXRpb24g
dGhhdA0KPiBoYWQgcHJldmlvdXNseSBiZWVuIHNldCBhbmQgcmUtZW5hYmxlIHRoZSBjaGlwLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIE5pbW1vIDxldmFuLm5pbW1vQGFsbGllZHRlbGVzaXMu
Y28ubno+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvaTJjL2FsZ29zL2kyYy1hbGdvLXBjYS5jIHwgMzYg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2xpbnV4L2kyYy1h
bGdvLXBjYS5oICAgICB8IDE1ICsrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM5
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYWxnb3MvaTJjLWFsZ28tcGNhLmMgYi9kcml2ZXJzL2kyYy9hbGdvcy9pMmMtYWxnby1w
Y2EuYw0KPiBpbmRleCA3MTBmYmVmOWE5YzIuLjJlNGUyNzA3M2Y0MCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pMmMvYWxnb3MvaTJjLWFsZ28tcGNhLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYWxn
b3MvaTJjLWFsZ28tcGNhLmMNCj4gQEAgLTQxLDggKzQxLDIyIEBAIHN0YXRpYyB2b2lkIHBjYV9y
ZXNldChzdHJ1Y3QgaTJjX2FsZ29fcGNhX2RhdGEgKmFkYXApDQo+ICAgCQlwY2Ffb3V0dyhhZGFw
LCBJMkNfUENBX0lORFBUUiwgSTJDX1BDQV9JUFJFU0VUKTsNCj4gICAJCXBjYV9vdXR3KGFkYXAs
IEkyQ19QQ0FfSU5ELCAweEE1KTsNCj4gICAJCXBjYV9vdXR3KGFkYXAsIEkyQ19QQ0FfSU5ELCAw
eDVBKTsNCj4gKw0KPiArCQkvKiBXZSBuZWVkIHRvIGFwcGx5IGFueSBjb25maWd1cmF0aW9uIHNl
dHRpbmdzIHRoYXQNCj4gKwkJICogd2VyZSBjYWxjdWxhdGVkIGluIHRoZSBwY2FfaW5pdCBmdW5j
dGlvbi4gVGhlIHJlc2V0DQo+ICsJCSAqIHJlc3VsdHMgaW4gdGhlc2UgY2hhbmdlcyBiZWluZyBz
ZXQgYmFjayB0byBkZWZhdWx0cy4NCj4gKwkJICovDQoNCiJ0aGVzZSBjaGFuZ2VzIiBkb2Vzbid0
IHJlYWQgd2VsbC4gSG93IGFib3V0DQoNCi8qDQogwqAqIEFmdGVyIGEgcmVzZXQgd2UgbmVlZCB0
byByZS1hcHBseSBhbnkgY29uZmlndXJhdGlvbiAoY2FsY3VsYXRlZCBpbiANCnBjYV9pbml0KQ0K
IMKgKiB0byBnZXQgdGhlIGJ1cyBpbiBhIHdvcmtpbmcgc3RhdGUuDQogwqAqLw0KDQo+ICsJCXBj
YV9vdXR3KGFkYXAsIEkyQ19QQ0FfSU5EUFRSLCBJMkNfUENBX0lNT0RFKTsNCj4gKwkJcGNhX291
dHcoYWRhcCwgSTJDX1BDQV9JTkQsIGFkYXAtPmJ1c19zZXR0aW5ncy5tb2RlKTsNCj4gKwkJcGNh
X291dHcoYWRhcCwgSTJDX1BDQV9JTkRQVFIsIEkyQ19QQ0FfSVNDTEwpOw0KPiArCQlwY2Ffb3V0
dyhhZGFwLCBJMkNfUENBX0lORCwgYWRhcC0+YnVzX3NldHRpbmdzLnRsb3cpOw0KPiArCQlwY2Ff
b3V0dyhhZGFwLCBJMkNfUENBX0lORFBUUiwgSTJDX1BDQV9JU0NMSCk7DQo+ICsJCXBjYV9vdXR3
KGFkYXAsIEkyQ19QQ0FfSU5ELCBhZGFwLT5idXNfc2V0dGluZ3MudGhpKTsNCj4gKw0KPiArCQlw
Y2Ffc2V0X2NvbihhZGFwLCBJMkNfUENBX0NPTl9FTlNJTyk7DQo+ICAgCX0gZWxzZSB7DQo+ICAg
CQlhZGFwLT5yZXNldF9jaGlwKGFkYXAtPmRhdGEpOw0KPiArCQlwY2Ffc2V0X2NvbihhZGFwLCBJ
MkNfUENBX0NPTl9FTlNJTyB8IGFkYXAtPmJ1c19zZXR0aW5ncy5jbG9ja19mcmVxKTsNCj4gICAJ
fQ0KPiAgIH0NCj4gICANCj4gQEAgLTQyMywxMyArNDM3LDE1IEBAIHN0YXRpYyBpbnQgcGNhX2lu
aXQoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0KPiAgIAkJCQkiIFVzZSB0aGUgbm9taW5hbCBm
cmVxdWVuY3kuXG4iLCBhZGFwLT5uYW1lKTsNCj4gICAJCX0NCj4gICANCj4gKwkJY2xvY2sgPSBw
Y2FfY2xvY2socGNhX2RhdGEpOw0KPiArDQo+ICsJCS8qIFN0b3JlIHNldHRpbmdzIGFzIHRoZXNl
IHdpbGwgYmUgbmVlZGVkIHdoZW4gdGhlIHBjYSBjaGlwIGlzIHJlc2V0ICovDQo+ICsJCXBjYV9k
YXRhLT5idXNfc2V0dGluZ3MuY2xvY2tfZnJlcSA9IGNsb2NrOw0KPiArDQo+ICAgCQlwY2FfcmVz
ZXQocGNhX2RhdGEpOw0KPiAgIA0KPiAtCQljbG9jayA9IHBjYV9jbG9jayhwY2FfZGF0YSk7DQo+
ICAgCQlwcmludGsoS0VSTl9JTkZPICIlczogQ2xvY2sgZnJlcXVlbmN5IGlzICVka0h6XG4iLA0K
PiAgIAkJICAgICBhZGFwLT5uYW1lLCBmcmVxc1tjbG9ja10pOw0KPiAtDQo+IC0JCXBjYV9zZXRf
Y29uKHBjYV9kYXRhLCBJMkNfUENBX0NPTl9FTlNJTyB8IGNsb2NrKTsNCj4gICAJfSBlbHNlIHsN
Cj4gICAJCWludCBjbG9jazsNCj4gICAJCWludCBtb2RlOw0KPiBAQCAtNDk2LDE5ICs1MTIsMTUg
QEAgc3RhdGljIGludCBwY2FfaW5pdChzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApDQo+ICAgCQkJ
dGhpID0gdGxvdyAqIG1pbl90aGkgLyBtaW5fdGxvdzsNCj4gICAJCX0NCj4gICANCj4gKwkJLyog
U3RvcmUgc2V0dGluZ3MgYXMgdGhlc2Ugd2lsbCBiZSBuZWVkZWQgd2hlbiB0aGUgcGNhIGNoaXAg
aXMgcmVzZXQgKi8NCj4gKwkJcGNhX2RhdGEtPmJ1c19zZXR0aW5ncy5tb2RlID0gbW9kZTsNCj4g
KwkJcGNhX2RhdGEtPmJ1c19zZXR0aW5ncy50bG93ID0gdGxvdzsNCj4gKwkJcGNhX2RhdGEtPmJ1
c19zZXR0aW5ncy50aGkgPSB0aGk7DQo+ICsNCj4gICAJCXBjYV9yZXNldChwY2FfZGF0YSk7DQo+
ICAgDQo+ICAgCQlwcmludGsoS0VSTl9JTkZPDQo+ICAgCQkgICAgICIlczogQ2xvY2sgZnJlcXVl
bmN5IGlzICVkSHpcbiIsIGFkYXAtPm5hbWUsIGNsb2NrICogMTAwKTsNCj4gLQ0KPiAtCQlwY2Ff
b3V0dyhwY2FfZGF0YSwgSTJDX1BDQV9JTkRQVFIsIEkyQ19QQ0FfSU1PREUpOw0KPiAtCQlwY2Ff
b3V0dyhwY2FfZGF0YSwgSTJDX1BDQV9JTkQsIG1vZGUpOw0KPiAtCQlwY2Ffb3V0dyhwY2FfZGF0
YSwgSTJDX1BDQV9JTkRQVFIsIEkyQ19QQ0FfSVNDTEwpOw0KPiAtCQlwY2Ffb3V0dyhwY2FfZGF0
YSwgSTJDX1BDQV9JTkQsIHRsb3cpOw0KPiAtCQlwY2Ffb3V0dyhwY2FfZGF0YSwgSTJDX1BDQV9J
TkRQVFIsIEkyQ19QQ0FfSVNDTEgpOw0KPiAtCQlwY2Ffb3V0dyhwY2FfZGF0YSwgSTJDX1BDQV9J
TkQsIHRoaSk7DQo+IC0NCj4gLQkJcGNhX3NldF9jb24ocGNhX2RhdGEsIEkyQ19QQ0FfQ09OX0VO
U0lPKTsNCj4gICAJfQ0KPiAgIAl1ZGVsYXkoNTAwKTsgLyogNTAwIHVzIGZvciBvc2NpbGxhdG9y
IHRvIHN0YWJpbGlzZSAqLw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pMmMt
YWxnby1wY2EuaCBiL2luY2x1ZGUvbGludXgvaTJjLWFsZ28tcGNhLmgNCj4gaW5kZXggZDAzMDcx
NzMyZGI0Li5lYmVhZGI4MGM3OTcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaTJjLWFs
Z28tcGNhLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9pMmMtYWxnby1wY2EuaA0KPiBAQCAtNTMs
NiArNTMsMjAgQEANCj4gICAjZGVmaW5lIEkyQ19QQ0FfQ09OX1NJCQkweDA4IC8qIFNlcmlhbCBJ
bnRlcnJ1cHQgKi8NCj4gICAjZGVmaW5lIEkyQ19QQ0FfQ09OX0NSCQkweDA3IC8qIENsb2NrIFJh
dGUgKE1BU0spICovDQo+ICAgDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBpMmNfYnVzX3NldHRpbmdz
IC0gVGhlIGNvbmZpZ3VyZWQgaTJjIGJ1cyBzZXR0aW5ncw0KPiArICogQG1vZGU6IENvbmZpZ3Vy
ZWQgaTJjIGJ1cyBtb2RlIChQQ0E5NjY1KQ0KPiArICogQHRsb3c6IENvbmZpZ3VyZWQgU0NMIExP
VyBwZXJpb2QgKFBDQTk2NjUpDQo+ICsgKiBAdGhpOiBDb25maWd1cmVkIFNDTCBISUdIIHBlcmlv
ZCAoUENBOTY2NSkNCj4gKyAqIEBjbG9ja19mcmVxOiBUaGUgY29uZmlndXJlZCBjbG9jayBmcmVx
dWVuY3kgKFBDQTk1NjQpDQo+ICsgKi8NCj4gK3N0cnVjdCBpMmNfYnVzX3NldHRpbmdzIHsNCj4g
KwlpbnQgbW9kZTsNCj4gKwlpbnQgdGxvdzsNCj4gKwlpbnQgdGhpOw0KPiArCWludCBjbG9ja19m
cmVxOw0KPiArfTsNCj4gKw0KPiAgIHN0cnVjdCBpMmNfYWxnb19wY2FfZGF0YSB7DQo+ICAgCXZv
aWQgCQkJCSpkYXRhOwkvKiBwcml2YXRlIGxvdyBsZXZlbCBkYXRhICovDQo+ICAgCXZvaWQgKCp3
cml0ZV9ieXRlKQkJKHZvaWQgKmRhdGEsIGludCByZWcsIGludCB2YWwpOw0KPiBAQCAtNjQsNiAr
NzgsNyBAQCBzdHJ1Y3QgaTJjX2FsZ29fcGNhX2RhdGEgew0KPiAgIAkgKiBGb3IgUENBOTY2NSwg
dXNlIHRoZSBmcmVxdWVuY3kgeW91IHdhbnQgaGVyZS4gKi8NCj4gICAJdW5zaWduZWQgaW50CQkJ
aTJjX2Nsb2NrOw0KPiAgIAl1bnNpZ25lZCBpbnQJCQljaGlwOw0KPiArCXN0cnVjdCBpMmNfYnVz
X3NldHRpbmdzCQlidXNfc2V0dGluZ3M7DQo+ICAgfTsNCj4gICANCj4gICBpbnQgaTJjX3BjYV9h
ZGRfYnVzKHN0cnVjdCBpMmNfYWRhcHRlciAqKTs=
