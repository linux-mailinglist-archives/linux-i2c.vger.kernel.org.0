Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BD338B692
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbhETTDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbhETTCs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:48 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCB2C061344
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:24 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id h3-20020a05600c3503b0290176f13c7715so5836281wmq.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZ7o0VkeJdaRCEBQCoylzsFR/PU7XD67806SChIDBfA=;
        b=wbPg+IuSfX0setQllon8nmJmPS/4cMhSLYh+OMtByDo5xn7lI8FHKHdoVNbV/LGIrP
         ER51hBIw9kz45SxLR+H4payGvH5vH3Xe2a1B1+JjDCJmCFgUw+a+aBLOG/F4h35D9Mh+
         lrLdT+ouYR2uAXXht4QXwLI0Vy1CSdH9ZXkxId5A68ASNvuRvGvO+d3PbD8Hfih/eq/1
         tlFN2dojL9JyyElWP7Ks/N2j2uJe5zaBYsnOJjZGIlBLbwAKGrzlX4Zv5bUpiwLXv4Lm
         Zhh9rw24DY3J90i4yH04shJ2WWIroytFFauUUHB91/Ib9LM7kHT76rgqfKPHuRgV7t7j
         K33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZ7o0VkeJdaRCEBQCoylzsFR/PU7XD67806SChIDBfA=;
        b=AX2O8WZ9KXzAOJw2fzYi9AT19mv7CDlxpTiYXSH3Trl0CgRBCMyTwL1rjmMwTjqMNA
         ia7Zar4qtoJN+o7ehDHA8o7uQbQJ3w4ABbXXBZDC0yfFPI/lkNpCSdO1Tk7mHg8s7A54
         +Mn3pjYFPWHu3vW4p8Z+3O+r9kuUAs/RiPwx2Gw7UHnzdayDWH1gkPnUdWLDfW/CP/xm
         H7PMqrsvMXO7Whc0u4TyMTO0fBbxe0JyjFxaQQECP2u4PF27f7VKqaOb2sBf8SqgOKyE
         R1C5b2+5ldkz674KC5437xfbe5Jj3B5W17hHpKN/4IWofSFr0ftm2rt6T5XeGZqp0mWc
         j54w==
X-Gm-Message-State: AOAM530ZaTPQGqqevltXjQz7g/7QsKxlTBVj+5eVQMgUbJRs9uZx98AW
        FkK7le+uU7LjGuMqC7Zc0MOhvw==
X-Google-Smtp-Source: ABdhPJzCaBtFp/3KcYEZ8YBWuCPtiaGYbMJURAiEOo9oNOZ0QSrbORhEb5JrppYxCy4bVZwNMF4jzQ==
X-Received: by 2002:a05:600c:2312:: with SMTP id 18mr5660601wmo.0.1621537283254;
        Thu, 20 May 2021 12:01:23 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Max Schwarz <max.schwarz@online.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH 12/16] i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete ones
Date:   Thu, 20 May 2021 20:01:01 +0100
Message-Id: <20210520190105.3772683-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:304: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_prepare_read'
 drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() instead
 drivers/i2c/busses/i2c-rk3x.c:335: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_fill_transmit_buf'
 drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_transmit_buf() instead
 drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/i2c/busses/i2c-rk3x.c:973: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_setup'

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Max Schwarz <max.schwarz@online.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-rk3x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 819ab4ee517e1..1dfbd1185aefc 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -238,7 +238,7 @@ static inline void rk3x_i2c_clean_ipd(struct rk3x_i2c *i2c)
 	i2c_writel(i2c, REG_INT_ALL, REG_IPD);
 }
 
-/**
+/*
  * Generate a START condition, which triggers a REG_INT_START interrupt.
  */
 static void rk3x_i2c_start(struct rk3x_i2c *i2c)
@@ -257,7 +257,7 @@ static void rk3x_i2c_start(struct rk3x_i2c *i2c)
 	i2c_writel(i2c, val, REG_CON);
 }
 
-/**
+/*
  * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
  *
  * @error: Error code to return in rk3x_i2c_xfer
@@ -297,7 +297,7 @@ static void rk3x_i2c_stop(struct rk3x_i2c *i2c, int error)
 	}
 }
 
-/**
+/*
  * Setup a read according to i2c->msg
  */
 static void rk3x_i2c_prepare_read(struct rk3x_i2c *i2c)
@@ -328,7 +328,7 @@ static void rk3x_i2c_prepare_read(struct rk3x_i2c *i2c)
 	i2c_writel(i2c, len, REG_MRXCNT);
 }
 
-/**
+/*
  * Fill the transmit buffer with data from i2c->msg
  */
 static void rk3x_i2c_fill_transmit_buf(struct rk3x_i2c *i2c)
@@ -532,7 +532,7 @@ static irqreturn_t rk3x_i2c_irq(int irqno, void *dev_id)
 }
 
 /**
- * Get timing values of I2C specification
+ * rk3x_i2c_get_spec() - Get timing values of I2C specification
  *
  * @speed: Desired SCL frequency
  *
@@ -549,7 +549,7 @@ static const struct i2c_spec_values *rk3x_i2c_get_spec(unsigned int speed)
 }
 
 /**
- * Calculate divider values for desired SCL frequency
+ * rk3x_i2c_v0_calc_timings() - Calculate divider values for desired SCL frequency
  *
  * @clk_rate: I2C input clock rate
  * @t: Known I2C timing information
@@ -710,7 +710,7 @@ static int rk3x_i2c_v0_calc_timings(unsigned long clk_rate,
 }
 
 /**
- * Calculate timing values for desired SCL frequency
+ * rk3x_i2c_v1_calc_timings() - Calculate timing values for desired SCL frequency
  *
  * @clk_rate: I2C input clock rate
  * @t: Known I2C timing information
@@ -959,8 +959,8 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
 	}
 }
 
-/**
- * Setup I2C registers for an I2C operation specified by msgs, num.
+/*
+ * rk3x_i2c_setup() - Setup I2C registers for an I2C operation specified by msgs, num.
  *
  * Must be called with i2c->lock held.
  *
-- 
2.31.1

