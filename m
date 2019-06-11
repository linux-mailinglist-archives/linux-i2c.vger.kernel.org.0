Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A743C5A8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 10:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404589AbfFKIMz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 04:12:55 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51889 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404430AbfFKIMz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 04:12:55 -0400
X-UUID: c4c1be297c0a4e678b00a52c1ae170f5-20190611
X-UUID: c4c1be297c0a4e678b00a52c1ae170f5-20190611
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1298865717; Tue, 11 Jun 2019 16:12:48 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 16:12:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 16:12:46 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>
Subject: [PATCH 0/2] Add support for AC timing adjustment
Date:   Tue, 11 Jun 2019 16:11:53 +0800
Message-ID: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series are based on 5.2-rc1, we provide two patches to
support AC timing adjustment.

Qii Wang (2):
  dt-bindings: i2c: Add MediaTek i2c AC timing binding
  i2c: mediatek: Add i2c AC timing adjust support

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   11 +++
 drivers/i2c/busses/i2c-mt65xx.c                    |   94 +++++++++++++++++---
 2 files changed, 93 insertions(+), 12 deletions(-)

-- 
1.7.9.5
