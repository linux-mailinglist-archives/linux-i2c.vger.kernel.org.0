Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E434668E60
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jan 2023 07:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240690AbjAMGyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Jan 2023 01:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240703AbjAMGyS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Jan 2023 01:54:18 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A5F809AC;
        Thu, 12 Jan 2023 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=dtNRhOphvzhEc3yBjZNq4rTFf5b7wS69sRQ0XCrAGww=; b=TQFKHYcoCTqAckj7+TMLCY7AY7
        fW1hLB4V0WDpnfzhhWLflkX5GBzRpFMVrvQWgjlJYOVn+fsPu6539OmqFBUxCoUUc+4/sVYiTwuPK
        LvkldV3SzNsx8e1KNT5k4eDgpeqaa1Mw9TaKwoeyzDjsoFGo76zk9+45PDG/ccs/RnXC/W1hN/WcE
        PMTB48s7m5pOcZOgmoRHrj8Mp4khry83mAmH+YTyWgjOhx1UD9DjkuxZUwlhmocohPXeNQsFpqKEA
        PEtPbYlypYihm/WeHnaUxUwRMqP3fVSHnK4nHnSeRR7EV3pr7gsPSyZ/Kb3pcBIlChcycDvmKzOYF
        RSRFrqJA==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pGDhW-000qHc-IN; Fri, 13 Jan 2023 06:38:06 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: rk3x: fix a bunch of kernel-doc warnings
Date:   Thu, 12 Jan 2023 22:38:05 -0800
Message-Id: <20230113063805.14457-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix multiple W=1 kernel-doc warnings in i2c-rk3x.c:

drivers/i2c/busses/i2c-rk3x.c:83: warning: missing initial short description on line:
 * struct i2c_spec_values:
drivers/i2c/busses/i2c-rk3x.c:139: warning: missing initial short description on line:
 * struct rk3x_i2c_calced_timings:
drivers/i2c/busses/i2c-rk3x.c:162: warning: missing initial short description on line:
 * struct rk3x_i2c_soc_data:
drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Generate a START condition, which triggers a REG_INT_START interrupt.
drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() instead
drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_transmit_buf() instead
drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Get timing values of I2C specification
drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Calculate divider values for desired SCL frequency
drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Calculate timing values for desired SCL frequency
drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Setup I2C registers for an I2C operation specified by msgs, num.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-rk3x.c |   44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff -- a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -80,7 +80,7 @@ enum {
 #define DEFAULT_SCL_RATE  (100 * 1000) /* Hz */
 
 /**
- * struct i2c_spec_values:
+ * struct i2c_spec_values - I2C specification values for various modes
  * @min_hold_start_ns: min hold time (repeated) START condition
  * @min_low_ns: min LOW period of the SCL clock
  * @min_high_ns: min HIGH period of the SCL cloc
@@ -136,7 +136,7 @@ static const struct i2c_spec_values fast
 };
 
 /**
- * struct rk3x_i2c_calced_timings:
+ * struct rk3x_i2c_calced_timings - calculated V1 timings
  * @div_low: Divider output for low
  * @div_high: Divider output for high
  * @tuning: Used to adjust setup/hold data time,
@@ -159,7 +159,7 @@ enum rk3x_i2c_state {
 };
 
 /**
- * struct rk3x_i2c_soc_data:
+ * struct rk3x_i2c_soc_data - SOC-specific data
  * @grf_offset: offset inside the grf regmap for setting the i2c type
  * @calc_timings: Callback function for i2c timing information calculated
  */
@@ -239,7 +239,8 @@ static inline void rk3x_i2c_clean_ipd(st
 }
 
 /**
- * Generate a START condition, which triggers a REG_INT_START interrupt.
+ * rk3x_i2c_start - Generate a START condition, which triggers a REG_INT_START interrupt.
+ * @i2c: target controller data
  */
 static void rk3x_i2c_start(struct rk3x_i2c *i2c)
 {
@@ -258,8 +259,8 @@ static void rk3x_i2c_start(struct rk3x_i
 }
 
 /**
- * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
- *
+ * rk3x_i2c_stop - Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
+ * @i2c: target controller data
  * @error: Error code to return in rk3x_i2c_xfer
  */
 static void rk3x_i2c_stop(struct rk3x_i2c *i2c, int error)
@@ -298,7 +299,8 @@ static void rk3x_i2c_stop(struct rk3x_i2
 }
 
 /**
- * Setup a read according to i2c->msg
+ * rk3x_i2c_prepare_read - Setup a read according to i2c->msg
+ * @i2c: target controller data
  */
 static void rk3x_i2c_prepare_read(struct rk3x_i2c *i2c)
 {
@@ -329,7 +331,8 @@ static void rk3x_i2c_prepare_read(struct
 }
 
 /**
- * Fill the transmit buffer with data from i2c->msg
+ * rk3x_i2c_fill_transmit_buf - Fill the transmit buffer with data from i2c->msg
+ * @i2c: target controller data
  */
 static void rk3x_i2c_fill_transmit_buf(struct rk3x_i2c *i2c)
 {
@@ -532,11 +535,10 @@ out:
 }
 
 /**
- * Get timing values of I2C specification
- *
+ * rk3x_i2c_get_spec - Get timing values of I2C specification
  * @speed: Desired SCL frequency
  *
- * Returns: Matched i2c spec values.
+ * Return: Matched i2c_spec_values.
  */
 static const struct i2c_spec_values *rk3x_i2c_get_spec(unsigned int speed)
 {
@@ -549,13 +551,12 @@ static const struct i2c_spec_values *rk3
 }
 
 /**
- * Calculate divider values for desired SCL frequency
- *
+ * rk3x_i2c_v0_calc_timings - Calculate divider values for desired SCL frequency
  * @clk_rate: I2C input clock rate
  * @t: Known I2C timing information
  * @t_calc: Caculated rk3x private timings that would be written into regs
  *
- * Returns: 0 on success, -EINVAL if the goal SCL rate is too slow. In that case
+ * Return: %0 on success, -%EINVAL if the goal SCL rate is too slow. In that case
  * a best-effort divider value is returned in divs. If the target rate is
  * too high, we silently use the highest possible rate.
  */
@@ -710,13 +711,12 @@ static int rk3x_i2c_v0_calc_timings(unsi
 }
 
 /**
- * Calculate timing values for desired SCL frequency
- *
+ * rk3x_i2c_v1_calc_timings - Calculate timing values for desired SCL frequency
  * @clk_rate: I2C input clock rate
  * @t: Known I2C timing information
  * @t_calc: Caculated rk3x private timings that would be written into regs
  *
- * Returns: 0 on success, -EINVAL if the goal SCL rate is too slow. In that case
+ * Return: %0 on success, -%EINVAL if the goal SCL rate is too slow. In that case
  * a best-effort divider value is returned in divs. If the target rate is
  * too high, we silently use the highest possible rate.
  * The following formulas are v1's method to calculate timings.
@@ -960,14 +960,14 @@ static int rk3x_i2c_clk_notifier_cb(stru
 }
 
 /**
- * Setup I2C registers for an I2C operation specified by msgs, num.
- *
- * Must be called with i2c->lock held.
- *
+ * rk3x_i2c_setup - Setup I2C registers for an I2C operation specified by msgs, num.
+ * @i2c: target controller data
  * @msgs: I2C msgs to process
  * @num: Number of msgs
  *
- * returns: Number of I2C msgs processed or negative in case of error
+ * Must be called with i2c->lock held.
+ *
+ * Return: Number of I2C msgs processed or negative in case of error
  */
 static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 {
