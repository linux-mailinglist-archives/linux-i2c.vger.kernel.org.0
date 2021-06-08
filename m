Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBE639ECEE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 05:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFHDTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 23:19:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58343 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230385AbhFHDTh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 23:19:37 -0400
X-UUID: 5a5385ac8cd84949902372274aedf1ff-20210608
X-UUID: 5a5385ac8cd84949902372274aedf1ff-20210608
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1030490013; Tue, 08 Jun 2021 11:17:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 11:17:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 11:17:38 +0800
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <kewei.xu@mediatek.com>
Subject: [PATCH 0/3] add i2c support for mt8195
Date:   Tue, 8 Jun 2021 11:16:37 +0800
Message-ID: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series are based on 5.13-rc1 and we provide three i2c patches
to support mt8195 SoC.

Kewei.Xu (3):
  dt-bindings: i2c: update bindings for MT8195 SoC
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  i2c: mediatek: Reset the handshake signal between i2c and dma

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 111 ++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

-- 
1.9.1
