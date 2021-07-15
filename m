Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458A83C95E8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 04:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhGOCdH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 22:33:07 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:57242 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232468AbhGOCdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 22:33:06 -0400
X-UUID: 0c4999ccd5c74a128802c41cc0105383-20210715
X-UUID: 0c4999ccd5c74a128802c41cc0105383-20210715
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1927793962; Thu, 15 Jul 2021 10:30:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:30:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 10:30:08 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>
Subject: [PATCH 0/8] Due to changes in hardware design, add patch to
Date:   Thu, 15 Jul 2021 10:29:09 +0800
Message-ID: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

1. In order to facilitate the review, the two series of patches submitted
   before have been integrated together.
2. Resubmit a patch to fixing the incorrect register value.
3. Add modify bus speed calculation formula patch

Kewei Xu (8):
  dt-bindings: i2c: update bindings for MT8195 SoC
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  i2c: mediatek: fixing the incorrect register offset
  i2c: mediatek: Reset the handshake signal between i2c and dma
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  dt-bindings: i2c: add attribute default-timing-adjust
  i2c: mediatek: Isolate speed setting via dts for special devices
  i2c: mediatek: modify bus speed calculation formula

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   3 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 229 +++++++++++++++++++--
 2 files changed, 217 insertions(+), 15 deletions(-)

--
1.9.1

