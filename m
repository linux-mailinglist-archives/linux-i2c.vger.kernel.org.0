Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB40E377899
	for <lists+linux-i2c@lfdr.de>; Sun,  9 May 2021 23:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhEIVJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 May 2021 17:09:45 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43633 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhEIVJp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 May 2021 17:09:45 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8D174891B0;
        Mon, 10 May 2021 09:08:36 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620594516;
        bh=gwyWwlOedwTZ6Qk1pSQVLv+Osb7HqVKaJ97ijXxKaUk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=YlfHPHTZd6J0Owo+q8RJBiCk/EmQuAuXBv5ec1Xh+gv7hjOg/ctIewnqPbjWDLxQa
         H1qBgwK0CeA7YsSAVsvvYq6tj8K/BrwgN+r5gIS7gFT1Nr5cWOaBbA/iOLakuuehRJ
         LiXq0v/+y00hKn+wu+FxJr+j2MqdvMLNGMLL5kGIOKMBzKG8MuaEgXTtAiQI2Flf+Z
         7DdKmaI5qE2NvzO0/Xnjk4yC0qdTUlfmQ6sb/7FQOQv6nZfHa0p2u7QqLXdIwobM/D
         zLpi28dquCQ43X72qJlGlO0J2F19V0VoIqiALgs+pBJBbSThTy9Q2yqV8Fy5b8sBej
         RumlAF3/MrqiQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60984f540001>; Mon, 10 May 2021 09:08:36 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 10 May 2021 09:08:36 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Mon, 10 May 2021 09:08:36 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447
 flag
Thread-Topic: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add
 fsl,i2c-erratum-a004447 flag
Thread-Index: AQHXQtmffNncPI25V0+wQHr03rbg2qrXxuAAgAMZNIA=
Date:   Sun, 9 May 2021 21:08:35 +0000
Message-ID: <c5d6f8d0-9b8a-b3bf-b7c3-884f03f7ecee@alliedtelesis.co.nz>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
 <20210507214936.GA2944698@robh.at.kernel.org>
In-Reply-To: <20210507214936.GA2944698@robh.at.kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F24E3822AA20C54591FDF2772ABBD145@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=W3TmjN9C7xaUWysyWacA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA4LzA1LzIxIDk6NDkgYW0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBGcmksIE1heSAw
NywgMjAyMSBhdCAxMjo0MDo0NVBNICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gRG9j
dW1lbnQgdGhlIGZzbCxpMmMtZXJyYXR1bS1hMDA0NDQ3IGZsYWcgd2hpY2ggaW5kaWNhdGVzIHRo
ZSBwcmVzZW5jZQ0KPj4gb2YgYW4gaTJjIGVycmF0dW0gb24gc29tZSBRb3JJUSBTb0NzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy1tcGMueWFtbCB8IDcgKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4+IGluZGV4IDdiNTUzZDU1OWM4My4uOThjNmZjZjdi
ZjI2IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9pMmMtbXBjLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvaTJjLW1wYy55YW1sDQo+PiBAQCAtNDYsNiArNDYsMTMgQEAgcHJvcGVydGllczoNCj4+
ICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+PiAgICAgICAgIEkyQyBidXMgdGltZW91dCBpbiBtaWNy
b3NlY29uZHMNCj4+ICAgDQo+PiArICBmc2wsaTJjLWVycmF0dW0tYTAwNDQ0NzoNCj4+ICsgICAg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KPj4gKyAgICBkZXNj
cmlwdGlvbjogfA0KPj4gKyAgICAgIEluZGljYXRlcyB0aGUgcHJlc2VuY2Ugb2YgUW9ySVEgZXJy
YXR1bSBBLTAwNDQ0Nywgd2hpY2gNCj4+ICsgICAgICBzYXlzIHRoYXQgdGhlIHN0YW5kYXJkIGky
YyByZWNvdmVyeSBzY2hlbWUgbWVjaGFuaXNtIGRvZXMNCj4+ICsgICAgICBub3Qgd29yayBhbmQg
YW4gYWx0ZXJuYXRlIGltcGxlbWVudGF0aW9uIGlzIG5lZWRlZC4NCj4gVGhlIHByb2JsZW0gd2l0
aCBhZGRpbmcgYSBwcm9wZXJ0eSBmb3IgYW4gZXJyYXRhIGlzIHlvdSBoYXZlIHRvIHVwZGF0ZQ0K
PiB0aGUgZHRiLiBJZiB5b3UgdXNlIHRoZSBjb21wYXRpYmxlIHN0cmluZywgdGhlbiBvbmx5IGFu
IE9TIHVwZGF0ZSBpcw0KPiBuZWVkZWQuIFRoYXQgYXNzdW1lcyB5b3UgaGF2ZSBzcGVjaWZpYyBl
bm91Z2ggY29tcGF0aWJsZSBzdHJpbmdzLg0KDQpJIHdhcyBmb2xsb3dpbmcgdGhlIHN0eWxlIG9m
IHRoZSBleGlzdGluZyBmc2wsdXNiLWVycmF0dW0tYTAwNzc5MiBvciANCmZzbCxlcnJhdHVtLWEw
MDg1ODUgcHJvcGVydGllcy4gQnV0IHRoYXQncyBub3QgcmVhbGx5IGEgY29tcGVsbGluZyByZWFz
b24uDQoNClRoZSBleGlzdGluZyBjb21wYXRpYmxlIHN0cmluZyBpcyAiZnNsLWkyYyIgYW5kIGl0
J3MgdXNlZCBieSBwcmV0dHkgbXVjaCANCmV2ZXJ5IHBvd2VycGMgUW9ySVEgU29DLiBUaGVyZSBh
cmUgc29tZSBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZ3MgaW4gDQp0aGUgZHJpdmVyIGZvciBz
b21lIG9mIHRoZSBvbGRlciBtcGMgU29Dcy4gQSBtb3JlIHNwZWNpZmljIGNvbXBhdGlibGUgDQpz
dHJpbmcgd2lsbCB3b3JrIGFsdGhvdWdoIGRldGVybWluaW5nIHdoaWNoIG9uZXMgYXJlIGFmZmVj
dGVkIG1pZ2h0IGJlIGEgDQpiaXQgdHJvdWJsZXNvbWUuIFRoYXQgd2Uga25vdyBvZiB0aGUgUDIw
NDEgYW5kIFAxMDEwIGFyZSBhZmZlY3RlZCBidXQgSSANCnN1c3BlY3QgdGhlcmUgbWF5IGJlIG1v
cmUuIE9uZSBkaXNhZHZhbnRhZ2Ugb2YgdXNpbmcgdGhlIGNvbXBhdGlibGUgDQpzdHJpbmcgaXMg
dGhhdCBhcyBhZmZlY3RlZCBTb0NzIGFyZSBpZGVudGlmaWVkIHdlJ2xsIGhhdmUgdG8gdXBkYXRl
IHRoZSANCmRyaXZlciB0byBrbm93IHRoYXQgU29DIGlzIGFmZmVjdGVkIGFuZCB1cGRhdGUgdGhl
IGR0YiB0byB1c2UgaXQuIFdpdGggDQp0aGUgcHJvcGVydHkgd2UnZCBqdXN0IGhhdmUgdG8gdXBk
YXRlIHRoZSBkdGIuDQoNCkknbSBub3QgdG9vIGZ1c3NlZCBlaXRoZXIgd2F5IHNvIGlmIHRoYXQn
cyBhIGhhcmQgTkFDSyBvbiB0aGUgcHJvcGVydHkgSSANCmNhbiBzZW5kIGEgdmVyc2lvbiB0aGF0
IHVzZXMgY29tcGF0aWJsZSBzdHJpbmdzIGluc3RlYWQuDQo=
