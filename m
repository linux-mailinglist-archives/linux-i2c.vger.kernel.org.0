Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC947CF7A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhLVJqp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbhLVJqo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 04:46:44 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87ACC061574
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:43 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id m12so2878214ljj.6
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2tGHih4YGJNCIHIZ/+SsgvcwYH6/xP9yzl/7gHA1Cc=;
        b=SKXIemZA/gMPMfyVc2BpVQ6SYCBGaoLOQqMI/NpHIJSzJ09dAlL74OH3EJLtrapMn9
         1JAZc4EzaOCivQaKdpstW7NpLQN6MQ56uPFVL7RvhxJn1yzzzKI4vKsrEV1mI4AX3xJN
         tdUJ4Y28e3jLfwvz7VSqYJISJz1GkCUxUIHW2NRltTQHChGzRMDCgSz3ObrvMWV/DANO
         ZQo1pMGEjoymX7aRU6vXFCtWs6gKazYn8EV4b8ibZFcjwj7lYk8i/UBf3DALiKj1sIga
         3AyhdKI4MRWog/V69dzKihfJv/ibJwERaAVeVeZEpc4klxa6OR1PPgH0MGynppf1zjva
         TKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2tGHih4YGJNCIHIZ/+SsgvcwYH6/xP9yzl/7gHA1Cc=;
        b=G9RgquDcfs04SX5PfA8lQFy88wYeObot9hjopXRgwquSe0iOCBJIxpVCM3YTSv8TvY
         L01sQtcFOHtisD8ucBg8vlsbccPvrPqKyZUP/3XTO++9LJQRuZI+jYd8+i8uWQ+USCN8
         H5D+tH0jI80jK1E8Fr2oDbPM1h5I1J41+/2pWqZWJnq7aTdMJslJr6v4n5bAFQflhBlF
         mV7yLODm3Sz2EXM90/SXzZSrdJI7eWvoTfvHHa5btkesJpx09QfHVPewTTQAhXDxZgFA
         r0VcEd+GkZ2An4DFGVdtjHSvGlUcKEY3NTVDCEyWupCkQEJzK+IRVAoer0oadiSkyM+f
         HsOw==
X-Gm-Message-State: AOAM5330Ki5JXizDhc+U7NYMe4wHHMA/PdKYPwhcCubS84yeBmVRKbPD
        GRS/dBeehThN1eid1ox4nRgtNh4S7d2YFw==
X-Google-Smtp-Source: ABdhPJyL4JqyX+m/18XfFyMQBFgxaB/zw+gaRi0KZ+I0cT5EzbnaGn8YOr2jqbwHEctw6aofQG4z3Q==
X-Received: by 2002:a05:651c:154a:: with SMTP id y10mr1619675ljp.314.1640166402007;
        Wed, 22 Dec 2021 01:46:42 -0800 (PST)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id e19sm132756ljn.82.2021.12.22.01.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:46:41 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, jsd@semihalf.com, upstream@semihalf.com
Subject: [RFC 1/2] i2c: designware: Add missing locks
Date:   Wed, 22 Dec 2021 10:45:57 +0100
Message-Id: <20211222094558.2098791-2-jsd@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211222094558.2098791-1-jsd@semihalf.com>
References: <20211222094558.2098791-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All accesses to controller's registers should be protected on
probe, disable and xfer paths. This is needed for i2c bus controllers
that are shared with but not controlled by kernel.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
 drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index bf2a4920638a..3e7ddae446a0 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -578,9 +578,14 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 	 * Try to detect the FIFO depth if not set by interface driver,
 	 * the depth could be from 2 to 256 from HW spec.
 	 */
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
 	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
 	if (ret)
 		return ret;
+	i2c_dw_release_lock(dev);
 
 	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
 	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
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
index 9b08bb5df38d..3faef28a9ba9 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -902,7 +902,13 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
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
2.34.1.307.g9b7440fafd-goog

