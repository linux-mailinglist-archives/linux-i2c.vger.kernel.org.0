Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FECB495482
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 19:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346878AbiATS7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 13:59:01 -0500
Received: from eu-shark1.inbox.eu ([195.216.236.81]:54516 "EHLO
        eu-shark1.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243589AbiATS7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 13:59:00 -0500
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id D607B6C00731;
        Thu, 20 Jan 2022 20:58:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1642705138; bh=504oCiTJWeqX2jIHwWg0su7+30XUh6cTSgg/DGfLsnE=;
        h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:from:date:to:cc;
        b=0dRKQo4EXfmf93758hL/sxQhMycvRQ87y0cIVDnwd3q6TCE33BEm4CKHqQWDJ7soE
         ATMB9dRsgF8BgINqCH2saY/8/ArGMcJAV5ncyza3z9nsAARERwIxNSKmihguE/E2Oa
         qT4ReOhBNmP3zDyymvLl/CthVLmzXKIc4MJKutSI=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id C8CE76C006AE;
        Thu, 20 Jan 2022 20:58:58 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
        by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id r9CYafVpjFgf; Thu, 20 Jan 2022 20:58:58 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 7C0916C0049B;
        Thu, 20 Jan 2022 20:58:58 +0200 (EET)
From:   Boris Lysov <arzamas-16@mail.ee>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     qii.wang@mediatek.com
Subject: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Date:   Thu, 20 Jan 2022 21:58:51 +0300
Message-Id: <20220120185853.24266-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: 885ml41QGzuilFygRWXfAQ4r3FlEJo35mZS31AE76Hb7NCeCfEAJVBS0gR8IQDzn/iM=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This small patch series removes mt6577 support from the i2c-mt65xx driver and
devicectree binding documentation.

The existing i2c-mt65xx driver relies on DMA since it was first introduced.
mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine cannot
be used for this purpose, too, which makes this particular driver incompatible
with mt6577 and other similar SoCs with same I2C IP.

[1] see references in
https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.html

Boris Lysov (2):
  dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
  i2c: mediatek: remove compatibility with mt6577

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
 drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
 2 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.20.1

