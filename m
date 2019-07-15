Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9AB68286
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2019 05:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbfGODRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jul 2019 23:17:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34153 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfGODRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jul 2019 23:17:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id b13so6738113pfo.1;
        Sun, 14 Jul 2019 20:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ysHjbyM3DxdAhAzoxnVhtyjrxUMFdj0CKD28eNWjxXY=;
        b=WLCDrVfVdglAbzv2EJKkLT1Wt9PfLn30PvtZ3GZQJFbA9/IKQluiyW3R+gjm6W/2lr
         2WAfD5nXESqS/CHTxa9eo9RHeegErcTcqgJ2hzuCl4xXasGCTYtTdB9B48xxd5qkWwFx
         r23793HYK+9M9CgXocz+8w86K8/35V/9Psyv2hpuMqq1Uk+JNxXr4ZsR/P/LnCNk4WCG
         49x+HLvt3CTUF0YtlJmgxW4/kCL2KH+zndmXQ8WroUdjCCZPibZFWLfPmcyqTFwYmm9W
         vCWzDs9acE9xczfwubGiPmgPnQUcFY9XZ6X268whWea7SDSKqOoak9HKHF2QxeYnDJuP
         pu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ysHjbyM3DxdAhAzoxnVhtyjrxUMFdj0CKD28eNWjxXY=;
        b=rSF/QkHa770lBycfuL2vpwlbwBJJij3hFW1DAK2HC1Osar+IFDghQQZp/zJWHzi6RE
         plbV8MausUMCBNNhG56FuEFK70KNeE8WZ0CV2VORmsV4VWrAhU9V9533itQFjdoQnY4Z
         yl9u8avdU1gCb/346ahav7AU70ADzzSbRqGLFfUPlvGnkTCvSOu5hKk0L9vOUsufiOFY
         EyQqO3tOkOQLNA7OojTLbyCiPP9H8Y4RaMZsFjLUw/9lcptuHjk98IZ3Y7/4pxl7tvHq
         XGLGwrBlL9ieCS36QfodHL+jvyZoTFIMHX5AWYxMmD7Xo0PZZkCOWABn7c2+rk3jZfVD
         8Bsg==
X-Gm-Message-State: APjAAAWwRPXE1+ZpGgKekEEi5DXzUcKBS8FFNDQMKIjv8CGSPQzahtRs
        Ld+r5BIEBXn5xnE4N1ViH5s=
X-Google-Smtp-Source: APXvYqwHHXymqmgg5KDLkhm4YBruKsIx41vmj0lwi0bCuZJ7ZPtFeaixwPjzTRuphrdNdEVma815sA==
X-Received: by 2002:a17:90a:6097:: with SMTP id z23mr26908734pji.75.1563160665279;
        Sun, 14 Jul 2019 20:17:45 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id x128sm29099032pfd.17.2019.07.14.20.17.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jul 2019 20:17:44 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v3 06/24] i2c: ismt: Remove call to memset after dmam_alloc_coherent
Date:   Mon, 15 Jul 2019 11:17:39 +0800
Message-Id: <20190715031739.6467-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In commit 518a2f1925c3
("dma-mapping: zero memory returned from dma_alloc_*"),
dma_alloc_coherent has already zeroed the memory.
So memset is not needed.

Acked-by: Neil Horman <nhorman@tuxdriver.com>
Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v3:
  - Use actual commit rather than the merge commit in the commit message

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

