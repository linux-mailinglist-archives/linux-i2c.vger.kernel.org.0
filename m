Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98653BF3B4
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jul 2021 04:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhGHCGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jul 2021 22:06:24 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:35836 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhGHCGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jul 2021 22:06:24 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8EA2A80719;
        Thu,  8 Jul 2021 14:03:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1625709821;
        bh=H2n0qpZLq804nqufxLeu1ge4JZNalG2skL0EYOVf3aA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=W4D1VFmKLtyDERzMTTOOrmdyrrIUG0Yu8QWgLCIxneMZBtkvZ52op3BdQ1BJ7mLnS
         c8f5PpMPVz3B/Kj8vVZXXsAdJt5WtocADApNdHNNRlCQrVX9aRN1Hj5MBpvSFEL5A4
         /u3+2OvSQgQd952KgI8Ag1CI16HjW1VXCkBnt7rzvUVHfTn2hA88PcHGkY2Oh24NAP
         LzYPTMiUGVIE5ofzhxLeAH5DKTzqMR+9IiIDSOqX9InGv2p5dBl1odZhmpO1aXvsAO
         lxZeWRJ2W2smzKu0wbveAF3hjQGrLqDaZeVCt8EQEbKVdlhWrk2dB3sUMAdk2aRY49
         W+/xlah3jbToA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60e65cfd0000>; Thu, 08 Jul 2021 14:03:41 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 14:03:41 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.018; Thu, 8 Jul 2021 14:03:41 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "wsa@kernel.org" <wsa@kernel.org>,
        Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mpc: Restore reread of I2C status register
Thread-Topic: [PATCH] i2c: mpc: Restore reread of I2C status register
Thread-Index: AQHXbvIuwXKa1XA73E6Ny7XqDyNgF6s3k+IA
Date:   Thu, 8 Jul 2021 02:03:41 +0000
Message-ID: <95d72396-ccab-8550-806a-1b63ec383f80@alliedtelesis.co.nz>
References: <20210702032724.4370-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210702032724.4370-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <722A4ACC0DDD4649A7535BEAA9099764@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=Sr3uF8G0 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=e_q4qTt1xDgA:10 a=rpMCeZoBDoLhwE1YSUQA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyLzA3LzIxIDM6MjcgcG0sIENocmlzIFBhY2toYW0gd3JvdGU6DQo+IFByaW9yIHRvIGNv
bW1pdCAxNTM4ZDgyZjQ2NDcgKCJpMmM6IG1wYzogSW50ZXJydXB0IGRyaXZlbiB0cmFuc2ZlciIp
IHRoZQ0KPiBvbGQgaW50ZXJydXB0IGhhbmRsZXIgd291bGQgcmVyZWFkIE1QQ19JMkNfU1IgYWZ0
ZXIgY2hlY2tpbmcgdGhlIENTUl9NSUYNCj4gYml0LiBXaGVuIHRoZSBkcml2ZXIgd2FzIHJlLXdy
aXR0ZW4gdGhpcyB3YXMgcmVtb3ZlZCBhcyBpdCBzZWVtZWQNCj4gdW5uZWNlc3NhcnkuIEhvd2V2
ZXIgYXMgaXQgdHVybnMgb3V0IHRoaXMgaXMgbmVjZXNzYXJ5IGZvciBpMmMgZGV2aWNlcw0KPiB3
aGljaCBkbyBjbG9jayBzdHJldGNoaW5nIG90aGVyd2lzZSB3ZSBlbmQgdXAgdGhpbmtpbmcgdGhl
IGJ1cyBpcyBzdGlsbA0KPiBidXN5IHdoZW4gcHJvY2Vzc2luZyB0aGUgaW50ZXJydXB0Lg0KPg0K
PiBGaXhlczogMTUzOGQ4MmY0NjQ3ICgiaTJjOiBtcGM6IEludGVycnVwdCBkcml2ZW4gdHJhbnNm
ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGll
ZHRlbGVzaXMuY28ubno+DQoNCkp1c3QgYSBoZWFkcyB1cCB0aGF0IHRoaXMgaGFzbid0IHRvdGFs
bHkgZml4ZWQgdGhlIGlzc3VlLiBKdXN0IG1hZGUgaXQgDQpsZXNzIGxpa2VseSB0byBvY2N1ci4g
SSdtIG5vdyB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIGJlIHRyZWF0aW5nIE1DRiBhcyANCmEgYnVz
eSBiaXQgYW5kIHdhaXRpbmcgZm9yIGl0IHRvIGNsZWFyICh3aXRoIGFwcHJvcnByaWF0ZSB0aW1l
b3V0cykgDQppbnN0ZWFkIG9mIGp1c3QgZmxhZ2dpbmcgYW4gZXJyb3IgaW1tZWRpYXRlbHkuDQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDIgKysNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBpbmRl
eCBkY2NhOWMyMzk2ZGIuLjZkNTAxNGViYWFiNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1tcGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+
IEBAIC02MzUsNiArNjM1LDggQEAgc3RhdGljIGlycXJldHVybl90IG1wY19pMmNfaXNyKGludCBp
cnEsIHZvaWQgKmRldl9pZCkNCj4gICANCj4gICAJc3RhdHVzID0gcmVhZGIoaTJjLT5iYXNlICsg
TVBDX0kyQ19TUik7DQo+ICAgCWlmIChzdGF0dXMgJiBDU1JfTUlGKSB7DQo+ICsJCS8qIFJlYWQg
YWdhaW4gdG8gYWxsb3cgcmVnaXN0ZXIgdG8gc3RhYmlsaXNlICovDQo+ICsJCXN0YXR1cyA9IHJl
YWRiKGkyYy0+YmFzZSArIE1QQ19JMkNfU1IpOw0KPiAgIAkJd3JpdGViKDAsIGkyYy0+YmFzZSAr
IE1QQ19JMkNfU1IpOw0KPiAgIAkJbXBjX2kyY19kb19pbnRyKGkyYywgc3RhdHVzKTsNCj4gICAJ
CXJldHVybiBJUlFfSEFORExFRDs=
