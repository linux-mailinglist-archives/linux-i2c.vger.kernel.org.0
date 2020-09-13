Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A47267FDE
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Sep 2020 17:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgIMPQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 11:16:12 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46785 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725938AbgIMPQJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 11:16:09 -0400
X-UUID: 716c3fe6aa01478f8abaa068543f7d59-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tLwz3eUexrO8VmtKUD5bwX6LfX6CNIxcQtdRTSWer2M=;
        b=jGrWJuUPURVjpcGq8PB1gpwmZGtRNXYjTMzpcIaEfwE9PUn7D38dAWaaLdGYJxc62mSMl7SdFTplv0fO7TxyKp+DvJf/ptD0ygQUzbAGL4SKOxfF/2D4nxOb9w1IN15S4rhiZAgCdmkbd5ZKbdJYYvNhb4eCsJoc6tYDaVnELUE=;
X-UUID: 716c3fe6aa01478f8abaa068543f7d59-20200913
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 131063010; Sun, 13 Sep 2020 23:15:58 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 23:15:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Sep 2020 23:15:54 +0800
Message-ID: <1600010156.3039.5.camel@mtksdaap41>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus
 frequencies
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     <qii.wang@mediatek.com>
CC:     <wsa@the-dreams.de>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Date:   Sun, 13 Sep 2020 23:15:56 +0800
In-Reply-To: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIwLTA5LTEyIGF0IDEzOjU3ICswODAwLCBxaWkud2FuZ0BtZWRpYXRlay5jb20g
d3JvdGU6DQo+IEZyb206IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBU
aGUgbWFzdGVyIGNvZGUgbmVlZHMgdG8gYmVpbmcgc2VudCB3aGVuIHRoZSBzcGVlZCBpcyBtb3Jl
IHRoYW4NCj4gSTJDX01BWF9GQVNUX01PREVfUExVU19GUkVRIGluc3RlYWQgb2YNCj4gSTJDX01B
WF9ISUdIX1NQRUVEX01PREVfRlJFUS4gRml4IGl0Lg0KDQpUaGlzIHdhcyBpbnRyb2R1Y2VkIGJ5
ICJpMmM6IGRyaXZlcnM6IFVzZSBnZW5lcmljIGRlZmluaXRpb25zIGZvciBidXMNCmZyZXF1ZW5j
aWVzIi4gWW91IHNob3VsZCBoYXZlDQpGaXhlczogOTAyMjRlNjQ2OGUxICgiaTJjOiBkcml2ZXJz
OiBVc2UgZ2VuZXJpYyBkZWZpbml0aW9ucyBmb3IgYnVzDQpmcmVxdWVuY2llcyIpDQoNCllvdSBj
YW4gaGF2ZSBteSByZXZpZXdlZCBieSBhZnRlciB5b3UgYWRkIGZpeGVzLg0KUmV2aWV3ZWQtYnk6
IFlpbmdqb2UgQ2hlbiA8eWluZ2pvZS5jaGVuQG1lZGlhdGVrLmNvbT4NCg0KSm9lLkMNCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgNiArKystLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMNCj4gaW5kZXggZWZjMTQwNC4uMGNiZGZiZSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW10NjV4eC5jDQo+IEBAIC02ODEsOCArNjgxLDggQEAgc3RhdGljIGludCBtdGtfaTJj
X2NhbGN1bGF0ZV9zcGVlZChzdHJ1Y3QgbXRrX2kyYyAqaTJjLCB1bnNpZ25lZCBpbnQgY2xrX3Ny
YywNCj4gIAl1bnNpZ25lZCBpbnQgY250X211bDsNCj4gIAlpbnQgcmV0ID0gLUVJTlZBTDsNCj4g
IA0KPiAtCWlmICh0YXJnZXRfc3BlZWQgPiBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVEpDQo+
IC0JCXRhcmdldF9zcGVlZCA9IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNfRlJFUTsNCj4gKwlpZiAo
dGFyZ2V0X3NwZWVkID4gSTJDX01BWF9ISUdIX1NQRUVEX01PREVfRlJFUSkNCj4gKwkJdGFyZ2V0
X3NwZWVkID0gSTJDX01BWF9ISUdIX1NQRUVEX01PREVfRlJFUTsNCj4gIA0KPiAgCW1heF9zdGVw
X2NudCA9IG10a19pMmNfbWF4X3N0ZXBfY250KHRhcmdldF9zcGVlZCk7DQo+ICAJYmFzZV9zdGVw
X2NudCA9IG1heF9zdGVwX2NudDsNCj4gQEAgLTc1OSw3ICs3NTksNyBAQCBzdGF0aWMgaW50IG10
a19pMmNfc2V0X3NwZWVkKHN0cnVjdCBtdGtfaTJjICppMmMsIHVuc2lnbmVkIGludCBwYXJlbnRf
Y2xrKQ0KPiAgCWZvciAoY2xrX2RpdiA9IDE7IGNsa19kaXYgPD0gbWF4X2Nsa19kaXY7IGNsa19k
aXYrKykgew0KPiAgCQljbGtfc3JjID0gcGFyZW50X2NsayAvIGNsa19kaXY7DQo+ICANCj4gLQkJ
aWYgKHRhcmdldF9zcGVlZCA+IEkyQ19NQVhfRkFTVF9NT0RFX0ZSRVEpIHsNCj4gKwkJaWYgKHRh
cmdldF9zcGVlZCA+IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNfRlJFUSkgew0KPiAgCQkJLyogU2V0
IG1hc3RlciBjb2RlIHNwZWVkIHJlZ2lzdGVyICovDQo+ICAJCQlyZXQgPSBtdGtfaTJjX2NhbGN1
bGF0ZV9zcGVlZChpMmMsIGNsa19zcmMsDQo+ICAJCQkJCQkgICAgICBJMkNfTUFYX0ZBU1RfTU9E
RV9GUkVRLA0KDQo=

