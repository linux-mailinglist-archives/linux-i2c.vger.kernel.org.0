Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE56334A15
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 22:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhCJVso (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 16:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbhCJVsk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 16:48:40 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D727C061574
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 13:48:40 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6E1C0891AE;
        Thu, 11 Mar 2021 10:48:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615412916;
        bh=2Y40yV20kTz+uP8WJOd2zRY2ZK37UuSTQye56QXyLdQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=zItC4lNaMAuEdg9ohspna/PZidFL62L3E2Zz+vs565vG2MOekEjAnSrcCzKHz/VVM
         ISseRsweCb70Q6ueWshQrsAOouaSTJwcyE/RX2Ul9sRGRTueW4QpgbVqDfsL0Wmng3
         8rbLFfiQaMPMA1vA5on4O1MIPG3QcwigXBK2gXvRK3UKKxmEHLrqGegRYlDrz70H0W
         lBRReMk35Zl6YgwOgPnXr90Sx46F+cCXE61Jrsh11cwOetmTSz9jR4gor0JmoUrf5v
         1CzS2E7zesLrBR2lU8WJL8lA6n7/+XNitiEUHNjeJA4Y/YC7y5+nQ+H7PM/BPpRpu1
         3i1TyMRv515gQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60493eb40001>; Thu, 11 Mar 2021 10:48:36 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 10:48:36 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Thu, 11 Mar 2021 10:48:36 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54A=
Date:   Wed, 10 Mar 2021 21:48:35 +0000
Message-ID: <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
 <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
 <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
In-Reply-To: <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE669EFBE8218F4B972E00D4598F3679@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DsQoB13+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=NNP4SLs9GTR1jxPQxVAA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMC8wMy8yMSA2OjA2IHBtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiAzLzkvMjEg
NjoxOSBQTSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IE9uIDkvMDMvMjEgOToyNyBhbSwgQ2hy
aXMgUGFja2hhbSB3cm90ZToNCj4+PiBPbiA4LzAzLzIxIDU6NTkgcG0sIEd1ZW50ZXIgUm9lY2sg
d3JvdGU6DQo+Pj4+IE90aGVyIHRoYW4gdGhhdCwgdGhlIG9ubHkgb3RoZXIgcmVhbCBpZGVhIEkg
aGF2ZSB3b3VsZCBiZSB0byBtb25pdG9yDQo+Pj4+IHRoZSBpMmMgYnVzLg0KPj4+IEkgYW0gaW4g
dGhlIGZvcnR1bmF0ZSBwb3NpdGlvbiBvZiBiZWluZyBhYmxlIHRvIGdvIGludG8gdGhlIG9mZmlj
ZSBhbmQNCj4+PiBldmVuIGhhcHBlbiB0byBoYXZlIHRoZSBleHBlbnNpdmUgc2NvcGUgYXQgdGhl
IG1vbWVudC4gTm93IEkganVzdCBuZWVkDQo+Pj4gdG8gZmluZCBhIHRhbWUgSFcgZW5naW5lZXIg
c28gSSBkb24ndCBidXJuIG15c2VsZiB0cnlpbmcgdG8gYXR0YWNoIHRoZQ0KPj4+IHByb2Jlcy4N
Cj4+IE9uZSB0aGluZyBJIHNlZSBvbiB0aGUgc2NvcGUgaXMgdGhhdCB3aGVuIHRoZXJlIGlzIGEg
Q1BVIGxvYWQgdGhlcmUNCj4+IGFwcGVhcnMgdG8gYmUgc29tZSBjbG9jayBzdHJldGNoaW5nIGdv
aW5nIG9uIChTQ0wgaXMgaGVsZCBsb3cgc29tZQ0KPj4gdGltZXMpLiBJIGRvbid0IHNlZSBpdCB3
aXRob3V0IHRoZSBDUFUgbG9hZC4gSXQncyBoYXJkIHRvIGNvcnJlbGF0ZSBhDQo+PiBjbG9jayBz
dHJldGNoaW5nIGV2ZW50IHdpdGggYSBiYWQgcmVhZCBvciBlcnJvciBidXQgaXQgaXMgb25lIGFy
ZWEgd2hlcmUNCj4+IHRoZSBTTUJVUyBzcGVjIGhhcyBhIG1heGltdW0gdGhhdCBtaWdodCBjYXVz
ZSB0aGUgZGV2aWNlIHRvIGdpdmUgdXAgd2FpdGluZy4NCj4+DQo+IERvIHlvdSBoYXZlIENPTkZJ
R19QUkVFTVBUIGVuYWJsZWQgaW4geW91ciBrZXJuZWwgPyBCdXQgZXZlbiB3aXRob3V0DQo+IHRo
YXQgaXQgaXMgcG9zc2libGUgdGhhdCB0aGUgaG90IGxvb3BzIGF0IHRoZSBiZWdpbm5pbmcgYW5k
IGVuZCBvZg0KPiBlYWNoIG9wZXJhdGlvbiBtZXNzIHVwIHRoZSBkcml2ZXIgYW5kIGNhdXNlIGl0
IHRvIHNsZWVwIGxvbmdlcg0KPiB0aGFuIGludGVuZGVkLiBEaWQgeW91IHRyeSB1c2xlZXBfcmFu
Z2UoKSA/DQoNCkkndmUgYmVlbiBydW5uaW5nIHdpdGggYW5kIHdpdGhvdXQgQ09ORklHX1BSRUVN
UFQuIFRoZSBmYWlsdXJlcyBoYXBwZW4gDQp3aXRoIGJvdGguDQoNCkkgZGlkIHRyeSB1c2xlZXBf
cmFuZ2UoKSBhbmQgc3RpbGwgc2F3IGZhaWx1cmVzLg0KDQo+IE9uIGEgc2lkZSBub3RlLCBjYW4g
eW91IHNlbmQgbWUgYSByZWdpc3RlciBkdW1wIGZvciB0aGUgbG04MSA/DQo+IEl0IHdvdWxkIGJl
IHVzZWZ1bCBmb3IgbXkgbW9kdWxlIHRlc3QgY29kZS4NCg0KSGVyZSB5b3UgZ28gdGhpcyBpcyBm
cm9tIGEgbGFyZ2VseSB1bmNvbmZpZ3VyZWQgTE04MQ0KDQogwqDCoMKgwqAgMMKgIDHCoCAywqAg
M8KgIDTCoCA1wqAgNsKgIDfCoCA4wqAgOcKgIGHCoCBiwqAgY8KgIGTCoCBlwqAgZiAwMTIzNDU2
Nzg5YWJjZGVmDQowMDogNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcgNDcg
NDcgNDcgR0dHR0dHR0dHR0dHR0dHRw0KMTA6IDQ3IDgxIDI0IDAzIDk0IDAwIDAwIDAwIDAwIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIEc/JD8/Li4uLi4uLi4uLi4NCjIwOiBiZiBjYiBjMSAwMCBjMCA0
NyBlYyAyNCBmZiBmZiA2NSBmZiAwMCBmZiAwMCBmZiA/Pz8uP0c/JC4uZS4uLi4uDQozMDogMDAg
ZmYgMDAgZmYgMDAgZmYgMDAgNzEgYTkgN2YgN2YgZmYgZmYgNTggMDEgMDQgLi4uLi4uLnE/Pz8u
Llg/Pw0KNDA6IDAxIDA4IDAwIDAwIDAwIDAwIDAwIDUwIDJmIDgwIDgwIDAxIDQ0IDAwIDAwIDAw
ID8/Li4uLi5QLz8/P0QuLi4NCjUwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAuLi4uLi4uLi4uLi4uLi4uDQo2MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgLi4uLi4uLi4uLi4uLi4uLg0KNzA6IDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIC4uLi4uLi4uLi4uLi4uLi4N
CjgwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAuLi4u
Li4uLi4uLi4uLi4uDQo5MDogMDAgODEgMjQgMDMgOTQgMDAgMDAgMDAgMDAgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgLj8kPz8uLi4uLi4uLi4uLg0KYTA6IGJmIGNiIGMxIDAwIGMwIDQ3IGVjIDI0IGZm
IGZmIDY1IGZmIDAwIGZmIDAwIGZmID8/Py4/Rz8kLi5lLi4uLi4NCmIwOiAwMCBmZiAwMCBmZiAw
MCBmZiAwMCA3MSBhOSA3ZiA3ZiBmZiBmZiA1OCAwMSAwNCAuLi4uLi4ucT8/Py4uWD8/DQpjMDog
MDEgMDAgMDAgMDAgMDAgMDAgMDAgNTAgMmYgODAgODAgMDEgNDQgMDAgMDAgMDAgPy4uLi4uLlAv
Pz8/RC4uLg0KZDA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIC4uLi4uLi4uLi4uLi4uLi4NCmUwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAuLi4uLi4uLi4uLi4uLi4uDQpmMDogMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgLi4uLi4uLi4uLi4uLi4uLg0KDQpUaGlzIGlz
IGZyb20gYSBMTTgxIHRoYXQncyBiZWVuIGNvbmZpZ3VyZWQgYnkgb3VyIGFwcGxpY2F0aW9uIFNX
IHdpdGggDQpsaW1pdHMgYXBwcm9wcmlhdGUgZm9yIHRoZSBwbGF0Zm9ybS4NCg0KIMKgwqDCoMKg
IDDCoCAxwqAgMsKgIDPCoCA0wqAgNcKgIDbCoCA3wqAgOMKgIDnCoCBhwqAgYsKgIGPCoCBkwqAg
ZcKgIGYgMDEyMzQ1Njc4OWFiY2RlZg0KMDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIC4uLi4uLi4uLi4uLi4uLi4NCjEwOiBmZiA4MSAyNCAwMyA5NCAw
MCAwMCAwMCAwMCBmZiBmZiBmZiBmZiBmZiBmZiBmZiAuLiQuLi4uLi4uLi4uLi4uDQoyMDogYmYg
Y2MgYzEgMDAgYzAgNDcgZWMgMWMgZmYgZmYgNjUgZGMgYjQgZmYgYzAgZDMgLi4uLi5HLi4uLmUu
Li4uLg0KMzA6IGFkIGZmIDAwIGQzIGFkIDRlIDQwIDcxIGE5IDRiIDQ2IGZmIGZmIDU4IDAxIDA0
IC4uLi4uTkBxLktGLi5YLi4NCjQwOiAwMSAwOCAwMCAwMCAwMCAwMCAwMCBmMCAyZiA4MCA4MCA4
MSA0NCA4MCA4MCA4MCAuLi4uLi4uLi8uLi5ELi4uDQo1MDogODAgODAgODAgODAgODAgODAgODAg
ODAgODAgODAgODAgODAgODAgODAgODAgODAgLi4uLi4uLi4uLi4uLi4uLg0KNjA6IDgwIDgwIDgw
IDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIC4uLi4uLi4uLi4uLi4uLi4N
CjcwOiA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCAuLi4u
Li4uLi4uLi4uLi4uDQo4MDogODAgODAgODAgODAgODAgODAgODAgODAgODAgODAgODAgODAgODAg
ODAgODAgODAgLi4uLi4uLi4uLi4uLi4uLg0KOTA6IDgwIDgxIDI0IDAzIDk0IDAwIDAwIDAwIDAw
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIC4uJC4uLi4uLi4uLi4uLi4NCmEwOiBiZiBjYyBjMSAwMCBj
MCA0NyBlYyAxYyBmZiBmZiA2NSBkYyBiNCBmZiBjMCBkMyAuLi4uLkcuLi4uZS4uLi4uDQpiMDog
YWQgZmYgMDAgZDMgYWQgNGUgNDAgNzEgYTkgNGIgNDYgZmYgZmYgNTggMDEgMDQgLi4uLi5OQHEu
S0YuLlguLg0KYzA6IDAxIDAwIDAwIDAwIDAwIDAwIDAwIGYwIDJmIDgwIDgwIDgxIDQ0IDgwIDgw
IDgwIC4uLi4uLi4uLy4uLkQuLi4NCmQwOiA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4MCA4
MCA4MCA4MCA4MCA4MCA4MCAuLi4uLi4uLi4uLi4uLi4uDQplMDogODAgODAgODAgODAgODAgODAg
ODAgODAgODAgODAgODAgODAgODAgODAgODAgODAgLi4uLi4uLi4uLi4uLi4uLg0KZjA6IDgwIDgw
IDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIDgwIC4uLi4uLi4uLi4uLi4u
Li4NCg==
