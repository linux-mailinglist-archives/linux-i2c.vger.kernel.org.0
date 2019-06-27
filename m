Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD69B58899
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 19:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfF0RhA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 13:37:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34739 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfF0Rg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 13:36:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so1592078pfc.1;
        Thu, 27 Jun 2019 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FTN0zKhDxIv8S5csTSaarzg3XpPyp/sNBzVy1DH0RIg=;
        b=rXePKL+IjbXtDVkJ9EUfBUZ6DR3JTPwmDvM/k8ZkD75XtE+/Inpj+atPRHMXh2QRG/
         zIuml+IGmozQzaTnPYUoKOChgXORE+TXqi0myqaLVHpowZMotIBWdx1sMowabgthvo4m
         XmZJcYzoKuwOcYpkBboU/N1zIZ3YyGkg+Y3X1kY6A9qFHX3oy7wqozYbf41soo65lLRT
         x4nQrW3kaq31ObvfUywo17JEiUO8R+Fj07uN8p9Ql4s6AdO6oCCk0fBb15Ec4EeT8X2D
         m46+JGE9mQwvGreQY3WpOKNfeSZpoHEzKrltKv5o5uVR/tchqWUxe/D3NiICLxhSfkU6
         b6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FTN0zKhDxIv8S5csTSaarzg3XpPyp/sNBzVy1DH0RIg=;
        b=SMC6P8H/DWOXSrSFsEq4BqiMsypRBpG1V1reXwjbka0lVtIy/ykH5nEux+BAiEyEaW
         FLZAm3SDYau3TM0/p7edCUfJrWEmY6x4+FWj7IPujYG3lGUe2wlxQIZtSPecnEE6glW2
         ddPxPAi/HGdaLoHzBGz8idmXFvv6g2Pj2qehy3vlHp0DkwLRcVl7cRgde8fqr1NFPS8j
         WlqDz5K3OKNRhN2grm2AN4/9xG8JesUV6nNWRhCasuBDImAgLOiqnlqTl1d8z7uHEg5X
         icrHQ86TydQ6x4vFbfhKFTBDmp8Xh//BJ/+vpfXCuHDaBTfhxLV0XPv/5WPbRbNMyUcC
         awPQ==
X-Gm-Message-State: APjAAAXk4R+EBsBirmXqOE7sQhxLUnskBWpkppnnXcuyvgXtBdxqk8AC
        W6y/K83d5ZaxmzMAXhPuWpg=
X-Google-Smtp-Source: APXvYqwY5e/CxXL1cLKVuyT3bZirB/EENKDOYegIv3OYDw7A8SPuZR49VmriysaQTRejJ9tMCTUyhw==
X-Received: by 2002:a17:90a:21cc:: with SMTP id q70mr7695900pjc.56.1561657018961;
        Thu, 27 Jun 2019 10:36:58 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id u21sm3657391pfm.70.2019.06.27.10.36.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 10:36:58 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/87] i2c: busses: Remove call to memset after dmam_alloc_coherent
Date:   Fri, 28 Jun 2019 01:36:51 +0800
Message-Id: <20190627173653.2833-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dmam_alloc_coherent has already zeroed the memory.
So memset is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/i2c/busses/i2c-ismt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 02d23edb2fb1..2f95e25a10f7 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -781,8 +781,6 @@ static int ismt_dev_init(struct ismt_priv *priv)
 	if (!priv->hw)
 		return -ENOMEM;
 
-	memset(priv->hw, 0, (ISMT_DESC_ENTRIES * sizeof(struct ismt_desc)));
-
 	priv->head = 0;
 	init_completion(&priv->cmp);
 
-- 
2.11.0

