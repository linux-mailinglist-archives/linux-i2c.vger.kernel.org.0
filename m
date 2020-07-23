Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2905522A480
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 03:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733174AbgGWBYZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 21:24:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47999 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728607AbgGWBYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 21:24:25 -0400
X-UUID: fb6f332359f340ae8025c27774f9e1a7-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=bbgQJNRcgmdZNRjAfyTf3xC6QTg1bKjqlo6CpIRT/nU=;
        b=Tst37tB1yF+kEBSzXJq7Xt8nlzX0veU2Auiqo7v1e5I+hPuMR+AytQ7+Cn52kwvwyfDqSTU0dIlQNlMsKoGkzAHhn9U2GJ/ajbzBEZAh2mleOQl2ZNGayh5HQb+D9mkbvC5aK4k7wp4fU6zSw2VVb/MdUSYwBTeOK/kzarpzxHY=;
X-UUID: fb6f332359f340ae8025c27774f9e1a7-20200723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1599116157; Thu, 23 Jul 2020 09:24:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 09:24:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 09:24:17 +0800
Message-ID: <1595467461.7332.3.camel@mtksdaap41>
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qii Wang <qii.wang@mediatek.com>
CC:     <wsa@the-dreams.de>, <qiangming.xia@mediatek.com>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 23 Jul 2020 09:24:21 +0800
In-Reply-To: <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
         <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDIwOjMxICswODAwLCBRaWkgV2FuZyB3cm90ZToNCj4gUmVw
bGFjZSAnc3VwcG9ydF8zM2JpdHMgd2l0aCAnZG1hX21heF9zdXBwb3J0JyBmb3IgRE1BIG1hc2sN
Cj4gb3BlcmF0aW9uLCBhbmQgcmVwbGFjZSAnbXRrX2kyY19zZXRfNGdfbW9kZScgd2l0aCAndXBw
ZXJfMzJfYml0cycuDQoNClRoaXMgZG9lc24ndCBleHBsYWluIHdoeSB3ZSBuZWVkIHRoaXMgcGF0
Y2guIEhvdyBhYm91dDoNCg0KTmV3ZXIgTVRLIGNoaXAgc3VwcG9ydCBtb3JlIHRoYW4gOEdCIG9m
IGRyYW0uIFJlcGxhY2Ugc3VwcG9ydF8zM2JpdHMNCndpdGggbW9yZSBnZW5lcmFsIGRtYV9tYXhf
c3VwcG9ydC4NCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAz
NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXQ2NXh4LmMNCj4gaW5kZXggZTZiOTg0YS4uZTQ3NTg3NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQo+IEBAIC0yMDksNiArMjA5LDcgQEAgc3RydWN0IG10a19pMmNfY29tcGF0aWJs
ZSB7DQo+ICAJdW5zaWduZWQgY2hhciBkbWFfc3luYzogMTsNCj4gIAl1bnNpZ25lZCBjaGFyIGx0
aW1pbmdfYWRqdXN0OiAxOw0KPiAgCXVuc2lnbmVkIGNoYXIgYXBkbWFfc3luYzogMTsNCj4gKwl1
bnNpZ25lZCBjaGFyIG1heF9kbWFfc3VwcG9ydDsNCg0Kc3VwcG9ydF8zM2JpdHMgaXMgbm8gbG9u
Z2VyIHVzZWQuIFBsZWFzZSByZW1vdmUgaXQuDQoNCkpvZS5DDQoNCg==

