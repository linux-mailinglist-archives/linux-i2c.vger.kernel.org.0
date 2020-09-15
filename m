Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626B9269B04
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 03:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgIOB0h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 21:26:37 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:30473 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725999AbgIOB0g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 21:26:36 -0400
X-UUID: 618224d777264c818e3900a54fe92d30-20200915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=v1LAQZT/+da26rpDxPw8oEAIptxIIsuOkmEvO0weCVA=;
        b=saX+E0ITo7RPpXuo6nhwQ3xxkMZViPxpWSDX9sVGN1cm7YMpkYb35kLKmnkw9WU/co5FhKV/emydW0fuMfYTSCzcuqTahtCwuvy1Nn5AO/UrnGm9xff9sWAZDMW9pYMsYg7VDLG4/YPdlv5zSn8C6Ab9sjzqjPobb1vmSxfxYM0=;
X-UUID: 618224d777264c818e3900a54fe92d30-20200915
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1807177968; Tue, 15 Sep 2020 09:26:31 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Sep
 2020 09:26:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 09:26:29 +0800
Message-ID: <1600133066.25719.9.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus
 frequencies
From:   Qii Wang <qii.wang@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Leilk Liu <leilk.liu@mediatek.com>
Date:   Tue, 15 Sep 2020 09:24:26 +0800
In-Reply-To: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
         <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72A8E3EE9FC676B4DD2AB151602F01D4F7A087AFF58CB94C603E5F97AE3294AF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIwLTA5LTE0IGF0IDE1OjQ4ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFNhdCwgU2VwIDEyLCAyMDIwIGF0IDk6MDIgQU0gPHFpaS53YW5nQG1lZGlhdGVrLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29t
Pg0KPiA+DQo+ID4gVGhlIG1hc3RlciBjb2RlIG5lZWRzIHRvIGJlaW5nIHNlbnQgd2hlbiB0aGUg
c3BlZWQgaXMgbW9yZSB0aGFuDQo+ID4gSTJDX01BWF9GQVNUX01PREVfUExVU19GUkVRIGluc3Rl
YWQgb2YNCj4gPiBJMkNfTUFYX0hJR0hfU1BFRURfTU9ERV9GUkVRLiBGaXggaXQuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgNiArKystLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IGluZGV4IGVmYzE0MDQuLjBjYmRmYmUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiBAQCAtNjgxLDggKzY4MSw4IEBAIHN0
YXRpYyBpbnQgbXRrX2kyY19jYWxjdWxhdGVfc3BlZWQoc3RydWN0IG10a19pMmMgKmkyYywgdW5z
aWduZWQgaW50IGNsa19zcmMsDQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgY250X211bDsNCj4g
PiAgICAgICAgIGludCByZXQgPSAtRUlOVkFMOw0KPiA+DQo+ID4gLSAgICAgICBpZiAodGFyZ2V0
X3NwZWVkID4gSTJDX01BWF9GQVNUX01PREVfUExVU19GUkVRKQ0KPiA+IC0gICAgICAgICAgICAg
ICB0YXJnZXRfc3BlZWQgPSBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVE7DQo+ID4gKyAgICAg
ICBpZiAodGFyZ2V0X3NwZWVkID4gSTJDX01BWF9ISUdIX1NQRUVEX01PREVfRlJFUSkNCj4gPiAr
ICAgICAgICAgICAgICAgdGFyZ2V0X3NwZWVkID0gSTJDX01BWF9ISUdIX1NQRUVEX01PREVfRlJF
UTsNCj4gDQo+IFRoYW5rcyBmb3IgZml4aW5nIHRoaXMuIEluZGVlZCwgc29tZWhvdyBJIG1lc3Nl
ZCB0aGVzZSB1cC4NCj4gDQo+ID4NCj4gPiAgICAgICAgIG1heF9zdGVwX2NudCA9IG10a19pMmNf
bWF4X3N0ZXBfY250KHRhcmdldF9zcGVlZCk7DQo+ID4gICAgICAgICBiYXNlX3N0ZXBfY250ID0g
bWF4X3N0ZXBfY250Ow0KPiA+IEBAIC03NTksNyArNzU5LDcgQEAgc3RhdGljIGludCBtdGtfaTJj
X3NldF9zcGVlZChzdHJ1Y3QgbXRrX2kyYyAqaTJjLCB1bnNpZ25lZCBpbnQgcGFyZW50X2NsaykN
Cj4gPiAgICAgICAgIGZvciAoY2xrX2RpdiA9IDE7IGNsa19kaXYgPD0gbWF4X2Nsa19kaXY7IGNs
a19kaXYrKykgew0KPiA+ICAgICAgICAgICAgICAgICBjbGtfc3JjID0gcGFyZW50X2NsayAvIGNs
a19kaXY7DQo+ID4NCj4gPiAtICAgICAgICAgICAgICAgaWYgKHRhcmdldF9zcGVlZCA+IEkyQ19N
QVhfRkFTVF9NT0RFX0ZSRVEpIHsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHRhcmdldF9zcGVl
ZCA+IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNfRlJFUSkgew0KPiANCj4gQnV0IHRoaXMgb25lIGlz
IG5vdCByZWxhdGVkLiBPcmlnaW5hbCBjb2RlIHVzZWQgdG8gaGF2ZQ0KPiANCj4gI2RlZmluZSBN
QVhfRlNfTU9ERV9TUEVFRCAgICAgICAgICAgICAgNDAwMDAwDQo+IA0KPiAgICAgICAgaWYgKHRh
cmdldF9zcGVlZCA+IE1BWF9GU19NT0RFX1NQRUVEKSB7DQo+IA0KPiBBbmQgdGhpcyBjaGFuZ2Ug
ZG9lc24ndCBmaXggdGhlIGFib3ZlIG1lbnRpb25lZCBwcm9ibGVtLg0KPiANCj4gU28sIHBsZWFz
ZSBzcGxpdCBpbnRvIHR3byBzZXBhcmF0ZSBjaGFuZ2VzLg0KPiANCg0Kb2ssIFRoYW5rIHlvdSBm
b3IgeW91ciBjb21tZW50cw0KDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLyogU2V0IG1h
c3RlciBjb2RlIHNwZWVkIHJlZ2lzdGVyICovDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gbXRrX2kyY19jYWxjdWxhdGVfc3BlZWQoaTJjLCBjbGtfc3JjLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEkyQ19NQVhfRkFT
VF9NT0RFX0ZSRVEsDQo+ID4gLS0NCj4gPiAxLjkuMQ0KPiANCj4gDQo+IA0KDQo=

