Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 309455918A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 04:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfF1CrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 22:47:18 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39824 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfF1CrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 22:47:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so2187808pfe.6;
        Thu, 27 Jun 2019 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FTN0zKhDxIv8S5csTSaarzg3XpPyp/sNBzVy1DH0RIg=;
        b=BsodeRIZe1Y83qn1ItIjPVyyDU9dbvTBDhITtZe1n6JGzbBJuiVWIoaZ9FJdwuYi07
         4YKwfofAmlRaUCNdmovZDU3S+RB/W9UTL8MeHaq1uryAbmCrDF+f7d7fJy5TCvBesng6
         JZfNesDqxSIstuxUfXbsxURosurwHlUsXND3R0rgvusgvrVcpUOOzbJRKjQviN+hYOMT
         xdJsBs7OM48WwYUbnOi3BeWWOpWzRnY/sdi05lKVsnMkkfFdeeN8imXUKu6SVVBvRlqT
         5VBh9MJP5yRJBy4yfHcyPZifl/oCjOMvgVLsVY02WkCaa2FryoXDOzU1ro2nmnnBxa2o
         RsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FTN0zKhDxIv8S5csTSaarzg3XpPyp/sNBzVy1DH0RIg=;
        b=d8+IMeAnHkSyt1k2YVE9b0RZ+Db8kB+JGRZaPLfzLuIJUH7oLUoa1CwJ1Pdhfr1cUI
         cljgthUYCgfiwnSJDMx9RIEEiRs79uf/mwx0s3d2f1cwX6T5DeB+bFcb9CBlDewBsUQO
         uOXj35MfYh2o+K7+6KYkO93Jl3oYh9RPilHJLlHr2PByGMYLX8tQJs96gSM7KZpCk0lR
         IAPN/GDpCo9C9oAcEwYDVLEAqP1emDJH0QLjLNehAadxNSqWEfChZdkSvfdZyZh80Imm
         h4rnwF3vOmtFQuDjW5JVWwe25H8Qao7YZ0beqEQI+xi/kpIYgD7e9gw1JcBBMjbFHLE4
         z4bQ==
X-Gm-Message-State: APjAAAW9KwyPPn2V6hLquGrV9CgdCKtX+E1Dujn6Xdz7tqZdmYuEl0WP
        /QSxsPeunF/pEiFRKAPgCf4=
X-Google-Smtp-Source: APXvYqyzDlz4aJe0A2U5O8Oy1Sg9aQHycbE1T8Vl3tT86xnGqpPGDT2QfeVyiA/YL19H+0WkeYde2w==
X-Received: by 2002:a63:7f07:: with SMTP id a7mr6832325pgd.26.1561690037406;
        Thu, 27 Jun 2019 19:47:17 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id c18sm449055pfc.180.2019.06.27.19.47.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 19:47:17 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/27] i2c: busses: remove memset after dmam_alloc_coherent
Date:   Fri, 28 Jun 2019 10:47:10 +0800
Message-Id: <20190628024711.15203-1-huangfq.daxian@gmail.com>
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

