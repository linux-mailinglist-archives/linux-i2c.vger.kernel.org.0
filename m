Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1953FD6D2
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 11:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243623AbhIAJe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 05:34:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:34560 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S243514AbhIAJe1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 05:34:27 -0400
X-UUID: f315a76fc05f4a91bf1f5641544d5f84-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qAFr462PAO/0XoeV1XxQaBZ1QKjkdT0RHzO2jPPAGlk=;
        b=PGQ6b3RaYPZy9CNt7cY9TspreIWRjwuwSdTqmPAcYsix6zhxVhjctjH8BG3tTVtbIeBjjROYyR8cjkejlL+JcA1Crrr+jn6Wb0Bfg7o1h4kcJkNgcXd7rw/1vEkDDXKAAbTNva+6+KbdBlndVU9EHc3DV34EgE3VvCTQ9tS4Eng=;
X-UUID: f315a76fc05f4a91bf1f5641544d5f84-20210901
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1821073945; Wed, 01 Sep 2021 17:33:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:33:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:33:25 +0800
Message-ID: <1630488805.11251.6.camel@mhfsdcap03>
Subject: Re: [PATCH v6 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
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
Date:   Wed, 1 Sep 2021 17:33:25 +0800
In-Reply-To: <1630147859-17031-6-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-6-git-send-email-kewei.xu@mediatek.com>
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
ZyBhZGp1c3QNCj4gc3VwcG9ydCIpLCB3ZSBtaXNzIHNldHRpbmcgT0ZGU0VUX0VYVF9DT05GIHJl
Z2lzdGVyIGlmDQo+IGkyYy0+ZGV2X2NvbXAtPnRpbWluZ19hZGp1c3QgaXMgZmFsc2UsIG5vdyBh
ZGQgaXQgYmFjay4NCj4gDQo+IEZpeGVzOiBiZTVjZTBlOTdjYzcgKCJpMmM6IG1lZGlhdGVrOiBB
ZGQgaTJjIGFjLXRpbWluZyBhZGp1c3Qgc3VwcG9ydCIpDQo+IFNpZ25lZC1vZmYtYnk6IEtld2Vp
IFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDY1eHguYyB8IDExICsrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFFpaSBXYW5nIDxx
aWkud2FuZ0BtZWRpYXRlay5jb20+DQo=

