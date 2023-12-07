Return-Path: <linux-i2c+bounces-643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680848082D6
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 09:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9DC1C21982
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6069B28DC8;
	Thu,  7 Dec 2023 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="byfJvpmD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC20910F4
	for <linux-i2c@vger.kernel.org>; Thu,  7 Dec 2023 00:22:13 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ce52d796d2so319754b3a.3
        for <linux-i2c@vger.kernel.org>; Thu, 07 Dec 2023 00:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1701937333; x=1702542133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjeb4b6lyrZZzJQNF0NTbIeDzIeVTA8ShffAsyhB2JI=;
        b=byfJvpmDWeAC5/FQCTQtMXSLqar5q/+1tMJQgcD/ehx7ASTCt+dpaA/N514QO+MkrG
         BnSp3bEQAV4uTMVSnaTrPyFK8pfFcgCPzmBxhwrKYOOFkk86gdvJF7KiXD7xlRXBWOi2
         ZS+hkW4xN2aq8BD9MX0urj0ozfEIoB43ka10GnTIiqgNuBpCxdgAD77ao8kw91N+Wrp3
         BQ2115EKHVv2Nbb8ZoqoH5+ErrNQznL+kg1fJtl3EjPRyp7q2+Yl/91qVRCOclJ9JreU
         ZJb34cZsAoGtWl12/oghr96PF4sMIT7hOrg/jYe+xER1YojUnM9BJVo44bnLkXjwE3Wr
         jq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701937333; x=1702542133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xjeb4b6lyrZZzJQNF0NTbIeDzIeVTA8ShffAsyhB2JI=;
        b=ZN7iB30SDbJvY57pFlGjgyip0Fu7s5qVnSA8l1gZn5uvlNS59wTM9EPVLM+OUgB1HG
         fEVBp6ZzgpZqaFaL2UcnptwCR0tiG5ZAsBOHWjvtKl5tUyr5wzzVsDYW+lwXk0U6BN7W
         FsCWT8gUBMkJ4lwVE9RL2LlDT7WIPcsWQUlIH+ntGiOPyJQK+RWQ4bYos2ObflnU/kYt
         HFlr0CM5uVaQaZGR6fhGkB6thoPsMpi5pYquu1fnRcLxF/jzUDM6R5af6LS2ENwiI2nJ
         9njCFY0bpCbflyywJZqEDawxbtWNYaE6Srr6st2P67OIoFQjxeZbg5vROhJb4KMlFIyH
         x1ZA==
X-Gm-Message-State: AOJu0YzOBE5PgplnIQ2RJmCOa7Gupt+TrKLsNf/0/YLYhvHcLuxHHD8f
	+kAW0boKMHvXtIRlWe5JgbidIA==
X-Google-Smtp-Source: AGHT+IEEurwQbxShDq9JggR47aztflJkGvMYj35SfMTSgXCbvptMap7YnxF/CHrueLnQZPyEL1pr1Q==
X-Received: by 2002:a05:6a00:2d1b:b0:6ce:4b97:b894 with SMTP id fa27-20020a056a002d1b00b006ce4b97b894mr2240031pfb.17.1701937333161;
        Thu, 07 Dec 2023 00:22:13 -0800 (PST)
Received: from jensen.next (li999-236.members.linode.com. [45.33.49.236])
        by smtp.gmail.com with ESMTPSA id o27-20020a63731b000000b005c259cef481sm696377pgc.59.2023.12.07.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:22:12 -0800 (PST)
From: Jensen Huang <jensenhuang@friendlyarm.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
Date: Thu,  7 Dec 2023 16:21:59 +0800
Message-ID: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Possible deadlock scenario (on reboot):
rk3x_i2c_xfer_common(polling)
    -> rk3x_i2c_wait_xfer_poll()
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock);
            ...
        <rk3x i2c interrupt>
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock); (deadlock here)

Store the IRQ number and disable/enable it around the polling transfer.
This patch has been tested on NanoPC-T4.

Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes in v2:
 - Add description for member 'irq' to fix build warning

 drivers/i2c/busses/i2c-rk3x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..4362db7c5789 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -178,6 +178,7 @@ struct rk3x_i2c_soc_data {
  * @clk: function clk for rk3399 or function & Bus clks for others
  * @pclk: Bus clk for rk3399
  * @clk_rate_nb: i2c clk rate change notify
+ * @irq: irq number
  * @t: I2C known timing information
  * @lock: spinlock for the i2c bus
  * @wait: the waitqueue to wait for i2c transfer
@@ -200,6 +201,7 @@ struct rk3x_i2c {
 	struct clk *clk;
 	struct clk *pclk;
 	struct notifier_block clk_rate_nb;
+	int irq;
 
 	/* Settings */
 	struct i2c_timings t;
@@ -1087,13 +1089,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 		spin_unlock_irqrestore(&i2c->lock, flags);
 
-		rk3x_i2c_start(i2c);
-
 		if (!polling) {
+			rk3x_i2c_start(i2c);
+
 			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
 						     msecs_to_jiffies(WAIT_TIMEOUT));
 		} else {
+			disable_irq(i2c->irq);
+			rk3x_i2c_start(i2c);
+
 			timeout = rk3x_i2c_wait_xfer_poll(i2c);
+
+			enable_irq(i2c->irq);
 		}
 
 		spin_lock_irqsave(&i2c->lock, flags);
@@ -1310,6 +1317,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	i2c->irq = irq;
+
 	platform_set_drvdata(pdev, i2c);
 
 	if (i2c->soc_data->calc_timings == rk3x_i2c_v0_calc_timings) {
-- 
2.42.0


