Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FF9362E1D
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 08:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhDQGrj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 02:47:39 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57882 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229629AbhDQGrj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Apr 2021 02:47:39 -0400
X-UUID: 2eee8d440e83429a8258b4b7ca98f808-20210417
X-UUID: 2eee8d440e83429a8258b4b7ca98f808-20210417
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2077237746; Sat, 17 Apr 2021 14:47:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:08 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 0/3] Add some fix patches
Date:   Sat, 17 Apr 2021 14:46:49 +0800
Message-ID: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series are based on 5.12-rc2 and we provide three i2c patches
to fix some historical issues.

Qii Wang (3):
  i2c: mediatek: Fix send master code at more than 1MHz
  i2c: mediatek: Fix wrong dma sync flag
  i2c: mediatek: Use scl_int_delay_ns to compensate clock-stretching

 drivers/i2c/busses/i2c-mt65xx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
1.9.1
