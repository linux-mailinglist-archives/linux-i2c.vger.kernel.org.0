Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0922649B28F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 12:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380265AbiAYLGn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 06:06:43 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:57348 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1380206AbiAYLEa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 06:04:30 -0500
X-UUID: 40ed0dc2144e41ddb22accfdde7155bd-20220125
X-UUID: 40ed0dc2144e41ddb22accfdde7155bd-20220125
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1924179466; Tue, 25 Jan 2022 19:04:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 25 Jan 2022 19:04:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 19:04:19 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
        <ryan-jh.yu@mediatek.com>
Subject: [v2 0/2] add i2c support for mt8186
Date:   Tue, 25 Jan 2022 19:04:11 +0800
Message-ID: <20220125110413.18988-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V1:
Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
MT8186 doesn't need handshake signal with apdma.

Kewei Xu (2):
  dt-bindings: i2c: update bindings for MT8186 SoC
  i2c: mediatek: Add i2c compatible for Mediatek MT8186

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

--
2.18.0

