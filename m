Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02223FD6DA
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 11:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243576AbhIAJfw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 05:35:52 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:56946 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S243492AbhIAJfv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 05:35:51 -0400
X-UUID: 9b064c854c5f4758bfc1e27bf25c25bb-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=dfh2IRW0A/mFGk8MNdDMTFcvdeRY8+5m/pyHarFWllU=;
        b=UTfSc3w/oO3DgWqnZ8wJ0ZRPL7qMx3ebVOfw2gGUT5LAJHS/s6YipgNClu1/vhHF/xcGeqOqEBK6Wt5lwvCKafH/MOLXMUvxKLfaB+jvZIyyAR56yNM0M8VQO7yBid2gOyn2Rc3m9I28p6bjxPe2NCHhhD5P8XlZ4bWLuIIML3Q=;
X-UUID: 9b064c854c5f4758bfc1e27bf25c25bb-20210901
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 733951886; Wed, 01 Sep 2021 17:34:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:34:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:34:48 +0800
Message-ID: <1630488888.11251.7.camel@mhfsdcap03>
Subject: Re: [PATCH v6 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
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
Date:   Wed, 1 Sep 2021 17:34:48 +0800
In-Reply-To: <1630147859-17031-7-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-7-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTA4LTI4IGF0IDE4OjUwICswODAwLCBLZXdlaSBYdSB3cm90ZToNCj4gSW4g
dGhlIGNvbW1pdCBiZTVjZTBlOTdjYzcgKCJpMmM6IG1lZGlhdGVrOiBBZGQgaTJjIGFjLXRpbWlu
ZyBhZGp1c3QNCj4gc3VwcG9ydCIpLCB0aGUgSTJDIHRpbWluZyBjYWxjdWxhdGlvbiBoYXMgYmVl
biByZXZpc2VkIHRvIHN1cHBvcnQNCj4gYWMtdGltaW5nIGFkanVzdG1lbnQsIGhvd2V2ZXIgdGhh
dCB3aWxsIGJyZWFrIG9uIHNvbWUgSTJDIGNvbXBvbmVudHMuDQo+IEFzIGEgcmVzdWx0IHdlIHdh
bnQgdG8gaW50cm9kdWNlIGEgbmV3IHNldHRpbmcgImRlZmF1bHQtYWRqdXN0LXRpbWluZyINCj4g
c28gdGhvc2UgY29tcG9uZW50cyBjYW4gY2hvb3NlIHRvIHVzZSB0aGUgb2xkIChkZWZhdWx0KSB0
aW1pbmcgYWxnb3JpdGhtLg0KPiANCj4gRml4ZXM6IGJlNWNlMGU5N2NjNyAoImkyYzogbWVkaWF0
ZWs6IEFkZCBpMmMgYWMtdGltaW5nIGFkanVzdCBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTog
S2V3ZWkgWHUgPGtld2VpLnh1QG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW10NjV4eC5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+
DQoNCg==

