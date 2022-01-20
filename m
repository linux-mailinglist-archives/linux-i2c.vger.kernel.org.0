Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A3F494410
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 01:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357687AbiATARM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 19:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357668AbiATARJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 19:17:09 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BE3C061574
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 16:17:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id x11so15021341lfa.2
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 16:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ydaQOtsO8J3rEDVAHZkczUaWRrErRPN61zBPQ14lLEU=;
        b=ImedxlUnRg8MtRCbDmy8+q8XuGwTD5aK8RW+UItLhGVr+43NiR/0XeANuIL7WOj9ym
         94Ju/uivjahx2doocsOehJSqg9UyFOayGEz346h9X3nvxUF/IIITqUT52shuRHzEZPC5
         FdtjIMKCB0/zTZzVdRAq9H0E3L4i19xRTYOdMax9sNAjwjeOHLQ8dmzsLKz+wXA7KqM9
         hxr4/2z/l0hO9A0r2YOLZ4iismORGYnDGaFdJOgiubqeKpikeaxqC7XxvJ4PxKWBiUNH
         VpNHyAaXH8hDh6jLkMtg73LKkXhMVcvX8Js8CCEcQFMehU6iO7WpG5DltpqG9FaaxrOs
         l45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydaQOtsO8J3rEDVAHZkczUaWRrErRPN61zBPQ14lLEU=;
        b=dXGOKAfeA+mtTc9a9jCNcYMf3iZizz+p0W+25NMVEhiAFtacitck/HoKPdO9VxmAFS
         zmyuULCjV9FdeqI0/NvL0zuxXAMxHGWYaOwi0TIHQh+0CBpBFgjgfB+Jobl/l9E6JFEV
         3/NTgiaYZEKDk3HCxhBKud3LSUync3FAQB95FT+ZhLskUl1GZMGmn43lsxp6C1BevkIw
         skY27KgT2wVNh/mh5Vw56H/2osNdjlNeX6Qaq/rn4C77ie1TskoAjTC4S5fFfjlRrcl8
         SigIESvP+y1DYPE5fhuKuBYHluTidyymhcOsisJXj5lNuc2kbW7kEZMIXDscsqG2j9I8
         pDSA==
X-Gm-Message-State: AOAM533gKnNZF6mIUprBX4H8/Pg6ehV+yHaWzJRD/M5nGxNYvL/qgmUP
        jPubtYy4Y+TkRr/y2Li9M9cZpQ==
X-Google-Smtp-Source: ABdhPJznO21T8hInZ2c5yv092TWbO8vYWo4nos/IOZ6evScG6Y4qo9nkcoWScn03UIErNesv3XL+hw==
X-Received: by 2002:a2e:92c7:: with SMTP id k7mr24312200ljh.297.1642637827431;
        Wed, 19 Jan 2022 16:17:07 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id v27sm119564lfo.243.2022.01.19.16.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 16:17:07 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com, upstream@semihalf.com,
        jsd@semihalf.com
Subject: [PATCH 1/2] i2c: designware: Add missing locks
Date:   Thu, 20 Jan 2022 01:16:20 +0100
Message-Id: <20220120001621.705352-2-jsd@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220120001621.705352-1-jsd@semihalf.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All accesses to controller's registers should be protected on
probe, disable and xfer paths. This is needed for i2c bus controllers
that are shared with but not controller by kernel.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
 drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index bf2a4920638a..9f8574320eb2 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -578,7 +578,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 	 * Try to detect the FIFO depth if not set by interface driver,
 	 * the depth could be from 2 to 256 from HW spec.
 	 */
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
 	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
+	i2c_dw_release_lock(dev);
 	if (ret)
 		return ret;
 
@@ -607,6 +612,11 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
 void i2c_dw_disable(struct dw_i2c_dev *dev)
 {
 	u32 dummy;
+	int ret;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return;
 
 	/* Disable controller */
 	__i2c_dw_disable(dev);
@@ -614,6 +624,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 	/* Disable all interrupts */
 	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
+
+	i2c_dw_release_lock(dev);
 }
 
 void i2c_dw_disable_int(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 9177463c2cbb..1a4b23556db3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -905,7 +905,13 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
 	}
 
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
 	i2c_dw_disable_int(dev);
+	i2c_dw_release_lock(dev);
+
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
 			       dev_name(dev->dev), dev);
 	if (ret) {
-- 
2.34.1.703.g22d0c6ccf7-goog

