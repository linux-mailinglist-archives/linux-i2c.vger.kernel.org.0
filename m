Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC2333A82C
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Mar 2021 22:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCNV03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Mar 2021 17:26:29 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54052 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhCNV0S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Mar 2021 17:26:18 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CFD87891AE;
        Mon, 15 Mar 2021 10:26:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615757175;
        bh=/pKQISzfPtdvOXpOWiYF23Dqp2LL9cwgCcHmFqemZ5w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=F6TbKPGKNTDWKihXTQjv9qAMSIRJQuN5prDI5f9xlptwFBFfJOIHKevQQansF4LyJ
         a/Qer9mfDwQSO6UOSSmmQ0zx95mc+RdjwJXAQp/Cjhm6NfAo0v0HO/hBFVzr1ufqab
         PcKIdXoRNl97eBxizEtYNU2e1/EmBACGhtwbNOalMf/cxT9aYQln49YXsYtORIIPH+
         Poae46MVxaxsrbr+3iwKXRnGM5xAOz5BNd7XNliF7ycMFBhnpPmNCcqsFCRIQrensy
         OsWpuVRrqP/FIm7wE3Jo5dSh/Wd7e7wVXDuYXyTNKJ7AQVslS2jdMcxpyS9JleiN2+
         gA5DUgjWoCxJA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604e7f770001>; Mon, 15 Mar 2021 10:26:15 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Mar 2021 10:26:15 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 15 Mar 2021 10:26:15 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     David Laight <David.Laight@ACULAB.COM>,
        'Guenter Roeck' <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAAxmqAgAPuLIA=
Date:   Sun, 14 Mar 2021 21:26:15 +0000
Message-ID: <ec89dfda-a321-6ec7-9da0-b4949f1f28b5@alliedtelesis.co.nz>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
In-Reply-To: <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <44B2A31FC39980428A4AE3B88CCB8363@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=k-jolHMNAAAA:8 a=wT_217q1AAAA:8 a=paiNdLW2YxwV48QS6vYA:9 a=QEXdDO2ut3YA:10 a=yeu0PtCsVa5VB5VCVbnF:22 a=ciXDWJte_DLdwvD8y_1g:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTIvMDMvMjEgMTA6MjUgcG0sIERhdmlkIExhaWdodCB3cm90ZToNCj4gRnJvbTogTGludXhw
cGMtZGV2IEd1ZW50ZXIgUm9lY2sNCj4+IFNlbnQ6IDExIE1hcmNoIDIwMjEgMjE6MzUNCj4+DQo+
PiBPbiAzLzExLzIxIDE6MTcgUE0sIENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4gT24gMTEvMDMv
MjEgOToxOCBwbSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPj4+Pj4gQnVtbWVyLiBXaGF0IGlzIHJl
YWxseSB3ZWlyZCBpcyB0aGF0IHlvdSBzZWUgY2xvY2sgc3RyZXRjaGluZyB1bmRlcg0KPj4+Pj4g
Q1BVIGxvYWQuIE5vcm1hbGx5IGNsb2NrIHN0cmV0Y2hpbmcgaXMgdHJpZ2dlcmVkIGJ5IHRoZSBk
ZXZpY2UsIG5vdA0KPj4+Pj4gYnkgdGhlIGhvc3QuDQo+Pj4+IE9uZSBleGFtcGxlOiBTb21lIGhv
c3RzIG5lZWQgYW4gaW50ZXJydXB0IHBlciBieXRlIHRvIGtub3cgaWYgdGhleQ0KPj4+PiBzaG91
bGQgc2VuZCBBQ0sgb3IgTkFDSy4gSWYgdGhhdCBpbnRlcnJ1cHQgaXMgZGVsYXllZCwgdGhleSBz
dHJldGNoIHRoZQ0KPj4+PiBjbG9jay4NCj4+Pj4NCj4+PiBJdCBmZWVscyBsaWtlIHNvbWV0aGlu
ZyBsaWtlIHRoYXQgaXMgaGFwcGVuaW5nLiBMb29raW5nIGF0IHRoZSBUMjA4MA0KPj4+IFJlZmVy
ZW5jZSBtYW51YWwgdGhlcmUgaXMgYW4gaW50ZXJlc3RpbmcgdGltaW5nIGRpYWdyYW0gKEZpZ3Vy
ZSAxNC0yIGlmDQo+Pj4gc29tZW9uZSBmZWVscyBsaWtlIGxvb2tpbmcgaXQgdXApLiBJdCBzaG93
cyBTQ0wgbG93IGJldHdlZW4gdGhlIEFDSyBmb3INCj4+PiB0aGUgYWRkcmVzcyBhbmQgdGhlIGRh
dGEgYnl0ZS4gSSB0aGluayBpZiB3ZSdyZSBkZWxheWVkIGluIHNlbmRpbmcgdGhlDQo+Pj4gbmV4
dCBieXRlIHdlIGNvdWxkIHZpb2xhdGUgVHRpbWVvdXQgb3IgVGxvdzptZXh0IGZyb20gdGhlIFNN
QlVTIHNwZWMuDQo+Pj4NCj4+IEkgdGhpbmsgdGhhdCByZWFsbHkgbGVhdmVzIHlvdSBvbmx5IHR3
byBvcHRpb25zIHRoYXQgSSBjYW4gc2VlOg0KPj4gUmV3b3JrIHRoZSBkcml2ZXIgdG8gaGFuZGxl
IGNyaXRpY2FsIGFjdGlvbnMgKHN1Y2ggYXMgc2V0dGluZyBUWEFLLA0KPj4gYW5kIGV2ZXJ5dGhp
bmcgZWxzZSB0aGF0IG1pZ2h0IHJlc3VsdCBpbiBjbG9jayBzdHJldGNoaW5nKSBpbiB0aGUNCj4+
IGludGVycnVwdCBoYW5kbGVyLCBvciByZXdvcmsgdGhlIGRyaXZlciB0byBoYW5kbGUgZXZlcnl0
aGluZyBpbg0KPj4gYSBoaWdoIHByaW9yaXR5IGtlcm5lbCB0aHJlYWQuDQo+IEknbSBub3Qgc3Vy
ZSBhIGhpZ2ggcHJpb3JpdHkga2VybmVsIHRocmVhZCB3aWxsIGhlbHAuDQo+IFdpdGhvdXQgQ09O
RklHX1BSRUVNUFQgKHdoaWNoIGhhcyBpdHMgb3duIHNldCBvZiBuYXN0aWVzKQ0KPiBhIFJUIHBy
b2Nlc3Mgd29uJ3QgYmUgc2NoZWR1bGVkIHVudGlsIHRoZSBwcm9jZXNzb3IgaXQgbGFzdA0KPiBy
YW4gb24gZG9lcyBhIHJlc2NoZWR1bGUuDQo+IEkgZG9uJ3QgdGhpbmsgYSBrZXJuZWwgdGhyZWFk
IHdpbGwgYmUgYW55IGRpZmZlcmVudCBmcm9tIGENCj4gdXNlciBwcm9jZXNzIHJ1bm5pbmcgdW5k
ZXIgdGhlIFJUIHNjaGVkdWxlci4NCj4NCj4gSSdtIHRyeWluZyB0byByZW1lbWJlciB0aGUgc21i
dXMgc3BlYyAod2l0aG91dCByZW1lbWJlcmluZyB0aGUgSTJDIG9uZSkuDQpGb3IgdGhvc2UgZm9s
bG93aW5nIGFsb25nIHRoZSBzcGVjIGlzIGF2YWlsYWJsZSBoZXJlWzBdLiBJIGtub3cgdGhlcmUn
cyANCmEgMy4wIHZlcnNpb25bMV0gYXMgd2VsbCBidXQgdGhlIGRldmljZXMgSSdtIGRlYWxpbmcg
d2l0aCBhcmUgZnJvbSBhIDIuMCANCnZpbnRhZ2UuDQo+IFdoaWxlIGJhc2ljYWxseSBhIGNsb2Nr
K2RhdGEgYml0LWJhbmcgdGhlIHNsYXZlIGlzIGFsbG93ZWQgdG8gZHJpdmUNCj4gdGhlIGNsb2Nr
IGxvdyB0byBleHRlbmQgYSBjeWNsZS4NCj4gSXQgbWF5IGJlIGFsbG93ZWQgdG8gZG8gdGhpcyBh
dCBhbnkgcG9pbnQ/DQogRnJvbSB3aGF0IEkgY2FuIHNlZSBpdCdzIGFjdHVhbGx5IHRoZSBtYXN0
ZXIgZXh0ZW5kaW5nIHRoZSBjbG9jay4gT3IgDQptb3JlIGFjY3VyYXRlbHkgaG9sZGluZyBpdCBs
b3cgYmV0d2VlbiB0aGUgYWRkcmVzcyBhbmQgZGF0YSBieXRlcyAod2hpY2ggDQpmcm9tIHRoZSBU
MjA4MCByZWZlcmVuY2UgbWFudWFsIGxvb2tzIGV4cGVjdGVkKS4gSSB0aGluayB0aGlzIG1heSBj
YXVzZSANCmEgc3RyaWN0bHkgY29tcGxpYW50IFNNQlVTIGRldmljZSB0byBkZXRlcm1pbmUgdGhh
dCBUbG93Om1leHQgaGFzIGJlZW4gDQp2aW9sYXRlZC4NCj4gVGhlIG1hc3RlciBjYW4gZ2VuZXJh
dGUgdGhlIGRhdGEgYXQgYWxtb3N0IGFueSByYXRlIChiZWxvdyB0aGUgbWF4aW11bSkNCj4gYnV0
IEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGdvIGRvd24gdG8gemVyby4NCj4gQnV0IEkgZG8gcmVtZW1i
ZXIgb25lIG9mIHRoZSBzcGVjcyBoYXZpbmcgYSB0aW1lb3V0Lg0KPg0KPiBCdXQgSSdkIGhhdmUg
dGhvdWdodCB0aGUgc2xhdmUgc2hvdWxkIGFuc3dlciB0aGUgY3ljbGUgY29ycmVjdGx5DQo+IHJl
Z2FyZGxlc3Mgb2YgYW55ICdyYW5kb20nIGRlbGF5cyB0aGUgbWFzdGVyIGFkZHMgaW4uDQpQcm9i
YWJseSBkZXBlbmRzIG9uIHRoZSBkZXZpY2UgaW1wbGVtZW50YXRpb24uIEkndmUgZ290IG11bHRp
cGxlIG90aGVyIA0KSTJDL1NNQlVTIGRldmljZXMgYW5kIHRoZSBMTTgxIHNlZW1zIHRvIGJlIHRo
ZSBvbmUgdGhhdCBvYmplY3RzLg0KPiBVbmxlc3MgeW91IGFyZSBnZXR0aW5nIGF3YXkgd2l0aCBk
ZS1hc3NlcnRpbmcgY2hpcHNlbGVjdD8NCj4NCj4gVGhlIG9ubHkgaW1wbGVtZW50YXRpb24gSSd2
ZSBkb25lIGlzIG9uZSBhbiBGUEdBIHNvIGRvZXNuJ3QgaGF2ZQ0KPiB3b3JyeSBhYm91dCBpbnRl
cnJ1cHQgbGF0ZW5jaWVzLg0KPiBJdCBkb2Vzbid0IGFjdHVhbGx5IHN1cHBvcnQgY2xvY2sgc3Ry
ZXRjaGluZzsgaXQgd2Fzbid0IGluIHRoZQ0KPiBjb2RlIEkgc3RhcnRlZCBmcm9tIGFuZCBub25l
IG9mIHRoZSBzbGF2ZXMgd2UgbmVlZCB0byBjb25uZWN0IHRvDQo+IGV2ZXIgZG9lcyBpdC4NCj4N
Cj4gCURhdmlkDQoNClswXSAtIGh0dHA6Ly93d3cuc21idXMub3JnL3NwZWNzL3NtYnVzMjAucGRm
DQpbMV0gLSBodHRwczovL3BtYnVzLm9yZy9Bc3NldHMvUERGUy9QdWJsaWMvU01CdXNfM18wXzIw
MTQxMjIwLnBkZg0KDQo+DQo+IC0NCj4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+IFJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo+
