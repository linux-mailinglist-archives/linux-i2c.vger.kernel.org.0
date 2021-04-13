Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387CB35E9B8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345449AbhDMXfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 19:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239592AbhDMXfG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 19:35:06 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F551C061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 16:34:46 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DA262891AE;
        Wed, 14 Apr 2021 11:34:43 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618356883;
        bh=yMLGMeN8aetNeb0sqPR1s+za2Wn36Ej/0WA/rd7dOGs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=X8jYB31jPdqx46XGaWLy2GpGuw835J0iwcxnpk+APq8CG8dHDW9VM5dp/00gc+u0I
         wqWx1lCFe8g0A/oWNTNljvS83kwm5utASnKE29ecSqk47QCfDeEC5A5UHqyZehTuG4
         JtyxWXb613WCDtQQXgHbuDMeNLM3DD4+YeAH2GzYVdvHUQluzNe23nP38pQ6FEYcnJ
         cPm1WAw1gT8FWRzYw5X7x/O0Q+Dlik7/TOlCWu0LBNpl7+RIpVuO7EQX70+hPYYF+g
         rn+niYXM05eCq5oZ4ZysEb91OcC/9OBA0+ybPQFyReAjG+iOqSi2GgoC1tmJSO1/px
         15RyXFQCmiXAA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60762a930002>; Wed, 14 Apr 2021 11:34:43 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 11:34:43 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 11:34:43 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 1/4] i2c: mpc: Use devm_clk_get_optional()
Thread-Topic: [PATCH v1 1/4] i2c: mpc: Use devm_clk_get_optional()
Thread-Index: AQHXMHKat1FSTMvRwES1YZkQECI/uqqyURmA
Date:   Tue, 13 Apr 2021 23:34:43 +0000
Message-ID: <f6a11495-b015-d86d-76fe-ed0db8635e2b@alliedtelesis.co.nz>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C3912B2EF2F774FAA7CAF0352E0A53A@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=WhraH14GnagzVs7hiTcA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAyOjM3IGFtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IFRoZSBwZXJp
cGhlcmFsIGNsb2NrIGlzIG9wdGlvbmFsIGFuZCB3ZSBtYXkgZ2V0IGFuIC1FUFJPQkVfREVGRVIg
ZXJyb3IgY29kZQ0KPiB3aGljaCB3b3VsZCBub3QgYmUgcHJvcGFnYXRlZCBjb3JyZWN0bHksIGZp
eCB0aGlzIGJ5IHVzaW5nDQo+IGRldm1fY2xrX2dldF9vcHRpb25hbCgpLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCg0KTm9uZSBvZiB0aGUgc3lzdGVtcyBJIGhhdmUgYWNjZXNzIHRvIG1ha2Ug
dXNlIG9mIHRoZSBjbG9ja3MgcHJvcGVydHkgc28gDQpJIGNhbid0IGRvIG11Y2ggdGVzdGluZy4g
SSBjYW4gc2F5IGl0IHN0aWxsIGhhbmRsZXMgdGhlIGFic2VuY2Ugb2YgYSANCmNsb2NrcyBwcm9w
ZXJ0eSBjb3JyZWN0bHkuDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMu
YyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBp
bmRleCAzYzhiY2RmZmY3ZTcuLjZkYzAyOWEzMWQzNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tcGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5j
DQo+IEBAIC02OTAsMTcgKzY5MCwxOCBAQCBzdGF0aWMgaW50IGZzbF9pMmNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCSAqIGVuYWJsZSBjbG9jayBmb3IgdGhlIEkyQyBw
ZXJpcGhlcmFsIChub24gZmF0YWwpLA0KPiAgIAkgKiBrZWVwIGEgcmVmZXJlbmNlIHVwb24gc3Vj
Y2Vzc2Z1bCBhbGxvY2F0aW9uDQo+ICAgCSAqLw0KPiAtCWNsayA9IGRldm1fY2xrX2dldCgmb3At
PmRldiwgTlVMTCk7DQo+IC0JaWYgKCFJU19FUlIoY2xrKSkgew0KPiAtCQllcnIgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY2xrKTsNCj4gLQkJaWYgKGVycikgew0KPiAtCQkJZGV2X2Vycigmb3AtPmRl
diwgImZhaWxlZCB0byBlbmFibGUgY2xvY2tcbiIpOw0KPiAtCQkJcmV0dXJuIGVycjsNCj4gLQkJ
fSBlbHNlIHsNCj4gLQkJCWkyYy0+Y2xrX3BlciA9IGNsazsNCj4gLQkJfQ0KPiArCWNsayA9IGRl
dm1fY2xrX2dldF9vcHRpb25hbCgmb3AtPmRldiwgTlVMTCk7DQo+ICsJaWYgKElTX0VSUihjbGsp
KQ0KPiArCQlyZXR1cm4gUFRSX0VSUihjbGspOw0KPiArDQo+ICsJZXJyID0gY2xrX3ByZXBhcmVf
ZW5hYmxlKGNsayk7DQo+ICsJaWYgKGVycikgew0KPiArCQlkZXZfZXJyKCZvcC0+ZGV2LCAiZmFp
bGVkIHRvIGVuYWJsZSBjbG9ja1xuIik7DQo+ICsJCXJldHVybiBlcnI7DQo+ICAgCX0NCj4gICAN
Cj4gKwlpMmMtPmNsa19wZXIgPSBjbGs7DQo+ICsNCj4gICAJaWYgKG9mX3Byb3BlcnR5X3JlYWRf
Ym9vbChvcC0+ZGV2Lm9mX25vZGUsICJmc2wscHJlc2VydmUtY2xvY2tpbmciKSkgew0KPiAgIAkJ
Y2xvY2sgPSBNUENfSTJDX0NMT0NLX1BSRVNFUlZFOw0KPiAgIAl9IGVsc2Ugew0KPiBAQCAtNzQ0
LDggKzc0NSw3IEBAIHN0YXRpYyBpbnQgZnNsX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpvcCkNCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+ICAgIGZhaWxfYWRkOg0KPiAtCWlmIChp
MmMtPmNsa19wZXIpDQo+IC0JCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19wZXIpOw0K
PiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19wZXIpOw0KPiAgIA0KPiAgIAlyZXR1
cm4gcmVzdWx0Ow0KPiAgIH07DQo+IEBAIC03NTYsOCArNzU2LDcgQEAgc3RhdGljIGludCBmc2xf
aTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCj4gICANCj4gICAJaTJjX2Rl
bF9hZGFwdGVyKCZpMmMtPmFkYXApOw0KPiAgIA0KPiAtCWlmIChpMmMtPmNsa19wZXIpDQo+IC0J
CWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19wZXIpOw0KPiArCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShpMmMtPmNsa19wZXIpOw0KPiAgIA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9Ow==
