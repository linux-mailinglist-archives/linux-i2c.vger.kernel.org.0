Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A241C7A5B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgEFTeO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:13 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A75C061A0F;
        Wed,  6 May 2020 12:34:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y4so3551338wrm.11;
        Wed, 06 May 2020 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gEh6bhHeuAdoM/EB265B3gc7pO8dHOdUfXpo6OZKqxw=;
        b=TpSxpvYu8L9lYyJ8Bo4/zcn5j61LQYsjwRVFCiSjYohmbh5P+2mLSMq7qKnc7ymMuE
         ouiW1dzHGlX/Tjzi14J3d3kzHpdZZWXL50DgSZUUB9zkBrIcdVQownGuMyw/dNJgro/Q
         CtvoPRdmweEIqwRzYUVDFFwZ48e3+gewjhHBx4izGFCRYZL87OXj/M5+YSiAaFCxAlgm
         pW9AD2ONavTRRvDPzWJcLEVEWs0IFWn2pCgpzy3Kg+aj6eiffms7v4qp+eUmsnY8XkCV
         fGCOLgDPc0bu4PTOD5iVXjNug9JwESnKQ4So2MOADXoXE4FOj9H0SyRJHZB32b8/Nj83
         dw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEh6bhHeuAdoM/EB265B3gc7pO8dHOdUfXpo6OZKqxw=;
        b=Xm5vqDbD9BSFH6Ffnt2ZqhCiUzZTpTXLJm7L1JwttX1nFXTrWIjGgTaZH0jgMrUFO4
         NEbNdm1obqAT7+GUkW6zzYEB/389SDPe4szlxvV8twBfqSWRXqETasrtAa1UnJ+b54BS
         jmBoQo7jKJQjfK1F6GLrCrE/ZQ7Ip2KUhyMb0f+/3vCu7ihoSiYjyhAp0hX5weJ6ss4r
         VEK6jbpL4r+Bxbj+wOWybeBJGdB+KLAi5qkO0IpnM8UXpnS+85uDbDQk9uTT8ha67kWy
         YJ4XVJaxV4nwFuEJdYIaUgENCKNRRLHZaleNn28ZmXDOUfJfwf8601WTJCnu77p3Tfyh
         Ha2A==
X-Gm-Message-State: AGi0Puas8EAg9XBHjR8FSyW6PvDH7gJQF57YsJBZ7pHiaNDFwOQf0ewo
        HP0SOXfIceanuv/QobueTBM=
X-Google-Smtp-Source: APiQypJwySYyUIHYluM8YTJXQDMbfRwwRRhsRHHWCVSZKfaLtC9DfIz7IxrVJ0gEpk3TLh+qVPMqhw==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr7451442wrv.398.1588793652205;
        Wed, 06 May 2020 12:34:12 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id b12sm4528294wro.18.2020.05.06.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/5] i2c: tegra: Better handle case where CPU0 is busy for a long time
Date:   Wed,  6 May 2020 21:33:57 +0200
Message-Id: <20200506193358.2807244-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506193358.2807244-1-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Boot CPU0 always handle I2C interrupt and under some rare circumstances
(like running KASAN + NFS root) it may stuck in uninterruptible state for
a significant time. In this case we will get timeout if I2C transfer is
running on a sibling CPU, despite of IRQ being raised. In order to handle
this rare condition, the IRQ status needs to be checked after completion
timeout.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8d2a212db733..d504e272d9fa 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -996,14 +996,13 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 	do {
 		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-		if (status) {
+		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
 
-			if (completion_done(complete)) {
-				s64 delta = ktime_ms_delta(ktimeout, ktime);
+		if (completion_done(complete)) {
+			s64 delta = ktime_ms_delta(ktimeout, ktime);
 
-				return msecs_to_jiffies(delta) ?: 1;
-			}
+			return msecs_to_jiffies(delta) ?: 1;
 		}
 
 		ktime = ktime_get();
@@ -1030,14 +1029,18 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		disable_irq(i2c_dev->irq);
 
 		/*
-		 * There is a chance that completion may happen after IRQ
-		 * synchronization, which is done by disable_irq().
+		 * Under some rare circumstances (like running KASAN +
+		 * NFS root) CPU, which handles interrupt, may stuck in
+		 * uninterruptible state for a significant time.  In this
+		 * case we will get timeout if I2C transfer is running on
+		 * a sibling CPU, despite of IRQ being raised.
+		 *
+		 * In order to handle this rare condition, the IRQ status
+		 * needs to be checked after timeout.
 		 */
-		if (ret == 0 && completion_done(complete)) {
-			dev_warn(i2c_dev->dev,
-				 "completion done after timeout\n");
-			ret = 1;
-		}
+		if (ret == 0)
+			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
+								complete, 0);
 	}
 
 	return ret;
-- 
2.24.1

