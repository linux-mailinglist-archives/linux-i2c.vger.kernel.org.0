Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C1C20EF62
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 09:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbgF3Hdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 03:33:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29565 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730089AbgF3Hdn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 03:33:43 -0400
X-UUID: 12e72ae3049e47b9a3438158c2d6c3d8-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=g16KvrnbD399itfp7Gu6dbRkAnFVoPytjIcdXi66ePg=;
        b=GCeFcF1VM+46UVRBsznlnmz9AIn6xS0y/8ME5GK6bAmFktvB7BAWUBGgJjuXT3w20HWeUUsAiAzBUFemSGm9fv7jOlM9oIaQh7Byqt+zgGEYFn4P8s818+USqWByVDOy+XyFWlsxBRFEFXdSXqxqHp8oiQqng6bWHwi06EUMqDM=;
X-UUID: 12e72ae3049e47b9a3438158c2d6c3d8-20200630
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 397273363; Tue, 30 Jun 2020 15:33:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 15:33:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 15:33:39 +0800
Message-ID: <1593502419.29073.7.camel@mtksdaap41>
Subject: Re: [PATCH] i2c: mediatek: Add to support continuous mode
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qiangming Xia <qiangming.xia@mediatek.com>
CC:     <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Qii Wang" <Qii.Wang@mediatek.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date:   Tue, 30 Jun 2020 15:33:39 +0800
In-Reply-To: <20200623074245.24513-1-qiangming.xia@mediatek.com>
References: <20200623074245.24513-1-qiangming.xia@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUWlhbmdtaW5nLA0KDQpXaGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9uLCB5b3Ugc2hvdWxkDQoN
Ci0gQWRkIHZlcnNpb24gbnVtYmVyIGluIHN1YmplY3QsIHNvIHdlIGtub3cgdGhpcyBpcyBhIG5l
dyBvbmUuDQotIExpc3Qgd2hhdCdzIGNoYW5nZWQgaW4gdGhpcyBwYXRjaCBhZnRlciAtLS0sICBz
byByZXZpZXdlciBrbm93cyB3aGVyZQ0Kd2Ugc2hvdWxkIGNoZWNrLiANCg0KDQpPbiBUdWUsIDIw
MjAtMDYtMjMgYXQgMTU6NDIgKzA4MDAsIFFpYW5nbWluZyBYaWEgd3JvdGU6DQo+IEZyb206ICJx
aWFuZ21pbmcueGlhIiA8cWlhbmdtaW5nLnhpYUBtZWRpYXRlay5jb20+DQo+IA0KPiAgICAgTWVk
aWF0ZWsgaTJjIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgY29udGludW91cyBtb2RlLA0KPiBpdCBh
bGxvdyB0byB0cmFuc2ZlciBvbmNlIG11bHRpcGxlIHdyaXRpbmcgbWVzc2FnZXMgb2YgZXF1YWwN
Cj4gbGVuZ3RoLg0KPiAgICAgQSBpMmMgc2xhdmUgc29tZXRpbWVzIG5lZWQgd3JpdGUgYSBzZXJp
YWwgb2Ygbm9uLWNvbnRpbnVvdXMNCj4gb2Zmc2V0IHJhbmdlIGluIGNoaXAsZS5nLiBjYW1lcmEg
c2Vuc29yIGlteDU4NixpbXg1NzYuIEl0IG5lZWQNCj4gdHJhbnNmZXIgMjk0IHdyaXRpbmcgbWVz
c2FnZXMgd2hlbiBpbml0aWF0ZSBzZXR0aW5nLiBJdCBjYW4gdXNlDQo+IHRoaXMgbW9kZSB0byBp
bXByb3ZlIHBlcmZvcm1hbmNlLg0KPiANCj4gQ2hhbmdlLUlkOiBJZjQ3M2Q5NmQyYjc2ZTlkNTFm
MjA3NDFhOTM4MGRiNGZjYWQxNWRiZA0KDQpSZW1vdmUgdGhpcy4NCg0KDQo+IFNpZ25lZC1vZmYt
Ynk6IFFpYW5nbWluZyBYaWEgPHFpYW5nbWluZy54aWFAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCA2NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gaW5kZXggZGVlZjY5ZTU2OTA2Li4xMDhiY2ExYTQw
NDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gKysr
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiBAQCAtOTcsNiArOTcsNyBAQCBl
bnVtIG10a190cmFuc19vcCB7DQo+ICAJSTJDX01BU1RFUl9XUiA9IDEsDQo+ICAJSTJDX01BU1RF
Ul9SRCwNCj4gIAlJMkNfTUFTVEVSX1dSUkQsDQo+ICsJSTJDX01BU1RFUl9DT05USU5VT1VTX1dS
LA0KPiAgfTsNCj4gIA0KPiAgZW51bSBJMkNfUkVHU19PRkZTRVQgew0KPiBAQCAtODQ2LDYgKzg0
Nyw5IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19kb190cmFuc2ZlcihzdHJ1Y3QgbXRrX2kyYyAqaTJj
LCBzdHJ1Y3QgaTJjX21zZyAqbXNncywNCj4gIAkJCQkJICAgIE9GRlNFVF9UUkFOU0ZFUl9MRU4p
Ow0KPiAgCQl9DQo+ICAJCW10a19pMmNfd3JpdGV3KGkyYywgSTJDX1dSUkRfVFJBTkFDX1ZBTFVF
LCBPRkZTRVRfVFJBTlNBQ19MRU4pOw0KPiArCX0gZWxzZSBpZiAoaTJjLT5vcCA9PSBJMkNfTUFT
VEVSX0NPTlRJTlVPVVNfV1IpIHsNCj4gKwkJbXRrX2kyY193cml0ZXcoaTJjLCBtc2dzLT5sZW4g
LyBudW0sIE9GRlNFVF9UUkFOU0ZFUl9MRU4pOw0KPiArCQltdGtfaTJjX3dyaXRldyhpMmMsIG51
bSwgT0ZGU0VUX1RSQU5TQUNfTEVOKTsNCj4gIAl9IGVsc2Ugew0KPiAgCQltdGtfaTJjX3dyaXRl
dyhpMmMsIG1zZ3MtPmxlbiwgT0ZGU0VUX1RSQU5TRkVSX0xFTik7DQo+ICAJCW10a19pMmNfd3Jp
dGV3KGkyYywgbnVtLCBPRkZTRVRfVFJBTlNBQ19MRU4pOw0KPiBAQCAtODk2LDYgKzkwMCwyMyBA
QCBzdGF0aWMgaW50IG10a19pMmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMgKmkyYywgc3Ry
dWN0IGkyY19tc2cgKm1zZ3MsDQo+ICAJCQl3cml0ZWwocmVnXzRnX21vZGUsIGkyYy0+cGRtYWJh
c2UgKyBPRkZTRVRfVFhfNEdfTU9ERSk7DQo+ICAJCX0NCj4gIA0KPiArCQl3cml0ZWwoKHUzMil3
cGFkZHIsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfVFhfTUVNX0FERFIpOw0KPiArCQl3cml0ZWwo
bXNncy0+bGVuLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX1RYX0xFTik7DQo+ICsJfSBlbHNlIGlm
IChpMmMtPm9wID09IEkyQ19NQVNURVJfQ09OVElOVU9VU19XUikgew0KPiArCQl3cml0ZWwoSTJD
X0RNQV9JTlRfRkxBR19OT05FLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0lOVF9GTEFHKTsNCj4g
KwkJd3JpdGVsKEkyQ19ETUFfQ09OX1RYLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0NPTik7DQo+
ICsJCXdwYWRkciA9IGRtYV9tYXBfc2luZ2xlKGkyYy0+ZGV2LCBtc2dzLT5idWYsDQo+ICsJCQkJ
CW1zZ3MtPmxlbiwgRE1BX1RPX0RFVklDRSk7DQo+ICsJCWlmIChkbWFfbWFwcGluZ19lcnJvcihp
MmMtPmRldiwgd3BhZGRyKSkgew0KPiArCQkJa2ZyZWUobXNncy0+YnVmKTsNCj4gKwkJCXJldHVy
biAtRU5PTUVNOw0KPiArCQl9DQo+ICsNCj4gKwkJaWYgKGkyYy0+ZGV2X2NvbXAtPnN1cHBvcnRf
MzNiaXRzKSB7DQo+ICsJCQlyZWdfNGdfbW9kZSA9IG10a19pMmNfc2V0XzRnX21vZGUod3BhZGRy
KTsNCj4gKwkJCXdyaXRlbChyZWdfNGdfbW9kZSwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9UWF80
R19NT0RFKTsNCj4gKwkJfQ0KPiArDQo+ICAJCXdyaXRlbCgodTMyKXdwYWRkciwgaTJjLT5wZG1h
YmFzZSArIE9GRlNFVF9UWF9NRU1fQUREUik7DQo+ICAJCXdyaXRlbChtc2dzLT5sZW4sIGkyYy0+
cGRtYWJhc2UgKyBPRkZTRVRfVFhfTEVOKTsNCj4gIAl9IGVsc2Ugew0KPiBAQCAtOTc5LDYgKzEw
MDAsMTEgQEAgc3RhdGljIGludCBtdGtfaTJjX2RvX3RyYW5zZmVyKHN0cnVjdCBtdGtfaTJjICpp
MmMsIHN0cnVjdCBpMmNfbXNnICptc2dzLA0KPiAgCQkJCSBtc2dzLT5sZW4sIERNQV9GUk9NX0RF
VklDRSk7DQo+ICANCj4gIAkJaTJjX3B1dF9kbWFfc2FmZV9tc2dfYnVmKGRtYV9yZF9idWYsIG1z
Z3MsIHRydWUpOw0KPiArCX0gZWxzZSBpZiAoaTJjLT5vcCA9PSBJMkNfTUFTVEVSX0NPTlRJTlVP
VVNfV1IpIHsNCj4gKwkJZG1hX3VubWFwX3NpbmdsZShpMmMtPmRldiwgd3BhZGRyLA0KPiArCQkJ
CSBtc2dzLT5sZW4sIERNQV9UT19ERVZJQ0UpOw0KPiArDQo+ICsJCWtmcmVlKG1zZ3MtPmJ1Zik7
DQo+ICAJfSBlbHNlIHsNCj4gIAkJZG1hX3VubWFwX3NpbmdsZShpMmMtPmRldiwgd3BhZGRyLCBt
c2dzLT5sZW4sDQo+ICAJCQkJIERNQV9UT19ERVZJQ0UpOw0KPiBAQCAtMTAwOSw2ICsxMDM1LDkg
QEAgc3RhdGljIGludCBtdGtfaTJjX3RyYW5zZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwN
Cj4gIHsNCj4gIAlpbnQgcmV0Ow0KPiAgCWludCBsZWZ0X251bSA9IG51bTsNCj4gKwlpbnQgaSwg
ajsNCj4gKwl1OCAqZG1hX211bHRpX3dyX2J1ZjsNCj4gKwlzdHJ1Y3QgaTJjX21zZyBtdWx0aV9t
c2dbMV07DQo+ICAJc3RydWN0IG10a19pMmMgKmkyYyA9IGkyY19nZXRfYWRhcGRhdGEoYWRhcCk7
DQo+ICANCj4gIAlyZXQgPSBtdGtfaTJjX2Nsb2NrX2VuYWJsZShpMmMpOw0KPiBAQCAtMTAyNSw2
ICsxMDU0LDQzIEBAIHN0YXRpYyBpbnQgbXRrX2kyY190cmFuc2ZlcihzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmFkYXAsDQo+ICAJCX0NCj4gIAl9DQo+ICANCj4gKwlpZiAobnVtID4gMSAmJiAhKG1zZ3Nb
MF0uZmxhZ3MgJiBJMkNfTV9SRCkpIHsNCj4gKwkJZm9yIChpID0gMDsgaSA8IG51bSAtIDE7IGkr
Kykgew0KPiArCQkJaWYgKCEobXNnc1tpKzFdLmZsYWdzICYgSTJDX01fUkQpICYmDQo+ICsJCQkJ
KG1zZ3NbaV0uYWRkciA9PSBtc2dzW2krMV0uYWRkcikNCj4gKwkJCQkJJiYgKG1zZ3NbaV0ubGVu
ID09IG1zZ3NbaSsxXS5sZW4pKSB7DQo+ICsJCQkJY29udGludWU7DQoNCkRvbid0IG5lZWQgKCkg
Zm9yIGFkZHIvbGVuIGNoZWNrLg0KV2hlbiB3cmFwLCBwbGVhc2UgcHV0IG9wZXJhdG9yIGF0IGVu
ZCBvZiBwcmV2aW91cyBsaW5lLg0KVGhlIDJuZCBsaW5lIG9mIGlmIGlzIGF0IHRoZSBzYW1lIGlu
ZGVudCBsZXZlbCB3aXRoIGNvbnRpbnVlLCB0aGF0DQpkb2Vzbid0IGxvb2sgZ29vZC4gTGV0J3Mg
dXNlIDQgc3BhY2VzIGFzIGluZGVudCBmb3IgYWRkciBhbmQgbGVuIGNoZWNrLCANCnNvIHRoaXMg
c2hvdWxkIGJlOg0KDQoJaWYgKG51bSA+IDEgJiYgIShtc2dzWzBdLmZsYWdzICYgSTJDX01fUkQp
KSB7DQoJCWZvciAoaSA9IDA7IGkgPCBudW0gLSAxOyBpKyspIHsNCgkJCWlmICghKG1zZ3NbaSsx
XS5mbGFncyAmCUkyQ19NX1JEKSAmJiANCgkJCSAgICBtc2dzW2ldLmFkZHIgPT0gbXNnc1tpKzFd
LmFkZHIgJiYNCgkJCSAgICBtc2dzW2ldLmxlbiA9PSBtc2dzW2krMV0ubGVuKSB7DQoNCg0KSm9l
LkMNCg0K

