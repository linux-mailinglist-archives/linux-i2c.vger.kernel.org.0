Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49E43FD6CB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 11:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243541AbhIAJco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 05:32:44 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:51592 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S243514AbhIAJcl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 05:32:41 -0400
X-UUID: caf9b965983f424ba271ce586f711150-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Cl1CxkkRuTGNdbKuJdSlcHskAoVdclIr+GM0mQ8xei4=;
        b=SQve7EEp055P2nhoSKCuK43yhfk7EeXmXx8iW9XpTlEX2wsPzlIS0iLE8dN2D4LjICrNTkwWrzgdzyAwp0QghKjhu7ha7deVvrOm6r68aqDOVRnHGKWtrvt0BMoTA7waJPalsCxQs38s4J0qgYMPDdUSLJCiTw8cJymVHDOXgKU=;
X-UUID: caf9b965983f424ba271ce586f711150-20210901
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 704829093; Wed, 01 Sep 2021 17:31:43 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:31:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:31:41 +0800
Message-ID: <1630488701.11251.5.camel@mhfsdcap03>
Subject: Re: [PATCH v6 3/7] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
From:   Qii Wang <qii.wang@mediatek.com>
To:     Kewei Xu <kewei.xu@mediatek.com>
CC:     <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date:   Wed, 1 Sep 2021 17:31:41 +0800
In-Reply-To: <1630147859-17031-4-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-4-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTA4LTI4IGF0IDE4OjUwICswODAwLCBLZXdlaSBYdSB3cm90ZToNCj4gV2hl
biBhIHRpbWVvdXQgZXJyb3Igb2NjdXJzIGluIGkyYyB0cmFuc3RlciwgaXQgaXMgdXN1YWxseSBy
ZWxhdGVkDQo+IHRvIHRoZSBpMmMvZG1hIElQIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uIFRoZXJl
Zm9yZSwgdGhlIHB1cnBvc2Ugb2YNCj4gdGhpcyBwYXRjaCBpcyB0byBkdW1wIHRoZSBrZXkgcmVn
aXN0ZXIgdmFsdWVzIG9mIGkyYy9kbWEgd2hlbiBhDQo+IHRpbWVvdXQgb2NjdXJzIGluIGkyYyBm
b3IgZGVidWdnaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2V3ZWkgWHUgPGtld2VpLnh1QG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwg
NTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KDQpSZXZpZXdlZC1i
eTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0K

