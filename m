Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1EE1DB762
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 16:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgETOsc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 10:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgETOsc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 10:48:32 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFBAC061A0E;
        Wed, 20 May 2020 07:48:32 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so1429598plr.2;
        Wed, 20 May 2020 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lILLSAOB1y19akaMHIpOGPK9fXIEbJzoC/lpcYeaVf8=;
        b=XLqwQw7bCB2GlIFz+o3OmVInodBHHqpSzBYJ/AhTRCe4OjC/8VsZeZW5tDYTaqNJyh
         ziEO++yCJAE0vlDuvnkogopkdm+HYwxEqPymmilSp2NBl9haC+Kxv16Kp0z0oucRNV8a
         TidqwBaEg6rcQ8ygcA3v58FyRCVt9Fp/Y1LN5zbh8eU4wdLemWnZWeo5ulnovDKJQarF
         qyEreSStck2jZO27rU8l5ctqq/ZVjxxSqVesBBxw25Ag9EJWWVAs93lk2HyENuEcGOK8
         yuD7zOxRSmOSTnku2o4IYGhKmyZMa7u7KuNx5YrPMEz1VUGR3CZ5MJKUdFyksvSu+knc
         wpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lILLSAOB1y19akaMHIpOGPK9fXIEbJzoC/lpcYeaVf8=;
        b=BkpbS7uv59ZAFqmtbXpqCbgGYhPOyAGKX4IP1sef78XxhJV7ipdw7ERohVlQcpLULM
         PPkODg33FOTSdjsyfUHv1uqPtLrzrJNeQ8M5pyXAM9HtSFXB0Pi5XEWm6I5veLS+RRj4
         ZD98HsXJ+x9DbR6WZkKe85v/Qo4CTJi0ceCXCjUXaiwbPoCMSeFzFM/sb4U14xDJOGEm
         yBpfsMglq/AB/fFu1Z338g7B2Ib32MRSNACT64JfrsgvJr8mcptoePSDCmBxrOqRIpxX
         CjOC5bq9O7G25lBVPo90ZmknSlr7buUtnR3z+DmBLePRSzyKe4rJcvrerA/V45wquxnQ
         DVnQ==
X-Gm-Message-State: AOAM531ZNcCRx9qgoigc7IxIw3kamnWxEhQvLVpz7reFnUxOdlHPI6IF
        4PupRlIh0PRZ72ozU/zKSPJGQK5Y
X-Google-Smtp-Source: ABdhPJxCiQEijVU+ota3PR2AsSkgAeu2q+slT77B/2yYS3k++/tRZW+5i9vNCnVrH33V2GhFEHxSqg==
X-Received: by 2002:a17:90b:3651:: with SMTP id nh17mr6036790pjb.228.1589986111737;
        Wed, 20 May 2020 07:48:31 -0700 (PDT)
Received: from localhost ([104.160.44.15])
        by smtp.gmail.com with ESMTPSA id g9sm2074323pgj.89.2020.05.20.07.48.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 07:48:31 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     michal.simek@xilinx.com, wsa@the-dreams.de, harinik@xilinx.com,
        soren.brinkmann@xilinx.com, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2] i2c: cadence: Add an error handling for platform_get_irq()
Date:   Wed, 20 May 2020 22:48:21 +0800
Message-Id: <20200520144821.8069-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver initialization should be end immediately after found
the platform_get_irq() function return an error.

Fixes: df8eb5691c48d3b0 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- add Fixes tag.

 drivers/i2c/busses/i2c-cadence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 89d58f7d2a25..0e8debe32cea 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -912,6 +912,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(id->membase);
 
 	id->irq = platform_get_irq(pdev, 0);
+	if (id->irq < 0)
+		return id->irq;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
-- 
2.25.0

