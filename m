Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E123EFCED
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Aug 2021 08:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbhHRGhv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Aug 2021 02:37:51 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:33566 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238429AbhHRGhu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Aug 2021 02:37:50 -0400
X-UUID: d407091cddfc4f41afbe65d4623145eb-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eeawtNJoOTb/6/2Ic+zvEiw0QcaRQqssYptnS8RDIjE=;
        b=pOzBIOQ2Mf59UJy9p/TtFjYl62dGJOSk2YDpRMtvmEOl7SgzjRZZgJPRFUFP5guGRZZvq3Ebgsl/MCOwaQRYc9UAIZhjGDjAodEZjT7oc9KVBJ/Xa5V4s0nqgH0F0OuQ778px8wiPRvTrmlCS7nGocz0t3ksgjvqQCkUJClJ9qw=;
X-UUID: d407091cddfc4f41afbe65d4623145eb-20210818
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 722707251; Wed, 18 Aug 2021 14:37:10 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 14:37:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 14:37:08 +0800
Message-ID: <d89aa91a5231219b5da9940d659d4acfff3ded66.camel@mediatek.com>
Subject: Re: [PATCH v4 5/8] dt-bindings: i2c: add attribute
 default-timing-adjust
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
        <ot_daolong.zhu@mediatek.com>, <liguo.zhang@mediatek.com>
Date:   Wed, 18 Aug 2021 14:37:08 +0800
In-Reply-To: <20210722031016.GA3228241@robh.at.kernel.org>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
         <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
         <20210722031016.GA3228241@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIxLTA3LTIxIGF0IDIxOjEwIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gU2F0LCBKdWwgMTcsIDIwMjEgYXQgMDY6MTc6NTZQTSArMDgwMCwgS2V3ZWkgWHUgd3JvdGU6
DQo+ID4gQWRkIGF0dHJpYnV0ZSBkZWZhdWx0LXRpbWluZy1hZGp1c3QgZm9yIERULWJpbmRpbmcg
ZG9jdW1lbnQuDQo+ID4gDQo+ID4gRml4ZXM6IGJlNWNlMGU5N2NjNyAoImkyYzogbWVkaWF0ZWs6
IEFkZCBpMmMgYWMtdGltaW5nIGFkanVzdA0KPiA+IHN1cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEtld2VpIFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW10NjV4eC50eHQgfCAyICsrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXQ2NXh4LnR4dA0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXQ2NXh4LnR4
dA0KPiA+IGluZGV4IDdjNDkxNWJjNDQzOS4uN2I4MGExMWQ0ZDRjIDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW10NjV4eC50eHQNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdDY1eHgu
dHh0DQo+ID4gQEAgLTMzLDYgKzMzLDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPiAgICAt
IG1lZGlhdGVrLGhhdmUtcG1pYzogcGxhdGZvcm0gY2FuIGNvbnRyb2wgaTJjIGZvcm0gc3BlY2lh
bCBwbWljDQo+ID4gc2lkZS4NCj4gPiAgICAgIE9ubHkgbXQ2NTg5IGFuZCBtdDgxMzUgc3VwcG9y
dCB0aGlzIGZlYXR1cmUuDQo+ID4gICAgLSBtZWRpYXRlayx1c2UtcHVzaC1wdWxsOiBJTyBjb25m
aWcgdXNlIHB1c2gtcHVsbCBtb2RlLg0KPiA+ICsgIC0gbWVkaWF0ZWssZGVmYXVsdC10aW1pbmct
YWRqdXN0OiB1c2UgZGVmYXVsdCB0aW1pbmcNCj4gPiBjYWxjdWxhdGlvbiwgbm8gdGltaW5nDQo+
ID4gKyAgICBhZGp1c3RtZW50Lg0KPiANCj4gJ21lZGlhdGVrLHVzZS1kZWZhdWx0LXRpbWluZycg
cGVyaGFwcyBhcyBpdCBtZWFucyBkb24ndCBhZGp1c3QNCj4gYW55dGhpbmcuDQo+IA0KPiA+ICAN
Cj4gPiAgRXhhbXBsZToNCj4gPiAgDQo+ID4gLS0gDQo+ID4gMi4xOC4wDQo+ID4gDQpIaSBSb2Is
DQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiBXZSB3aWxsIHVzZSAibWVkaWF0ZWssdXNl
LWRlZmF1bHQtdGltaW5nIg0KaW5zdGVhZCBvZiAibWVkaWF0ZWssZGVmYXVsdC10aW1pbmctYWRq
dXN0IiBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mDQpwYXRjaC4NCg0KVGhhbmtzDQprZXdlaQ0K

