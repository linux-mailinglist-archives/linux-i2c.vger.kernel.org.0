Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6163A589B2C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Aug 2022 13:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiHDLpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Aug 2022 07:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiHDLpv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Aug 2022 07:45:51 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D84B1FCF9
        for <linux-i2c@vger.kernel.org>; Thu,  4 Aug 2022 04:45:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 35ED537800;
        Thu,  4 Aug 2022 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1659613549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KaiSefmKqKtw8wCo/u2rQez1q33TjdYWOV8rw2oqLnA=;
        b=13jGy6QOWbT9mf/hv1zq8bYmLKXQMxFvzuA1OOc8kxov601YbNXzpYeTV2yAsFQ+AErXT/
        dmVGApKMEaDoeyjq48ghF6SkDdhNNsZBfwTKcbKo7lw7AxPRpW4WRO7O8wA1G9ZdyvrXqk
        Wn6RWQP2CEXzk81h8aGAXNqZbv57E3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1659613549;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KaiSefmKqKtw8wCo/u2rQez1q33TjdYWOV8rw2oqLnA=;
        b=0Ag5TPrMZYxMAsOYpGz3pObgFpt9FnFsGkUh9wqb1mq6KfY7Fs3x1sv/6GjwXKwPqROqUX
        5BOKlXUvvRei91Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F64C13434;
        Thu,  4 Aug 2022 11:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ciKkAW2x62KNLwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 04 Aug 2022 11:45:49 +0000
Date:   Thu, 4 Aug 2022 13:45:45 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Peter Rosin <peda@axentia.se>
Subject: [PATCH v2] i2c: muxes: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20220804134545.141f464a@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Peter Rosin <peda@axentia.se>
---
Changes since v1:
 * Drop of_match_ptr() from i2c-mux-pinctrl. We know what it will
   resolve to, so we might as well save cpp some work.

 drivers/i2c/muxes/Kconfig           |    6 +++---
 drivers/i2c/muxes/i2c-mux-pinctrl.c |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

--- linux-5.18.orig/drivers/i2c/muxes/Kconfig	2022-05-22 21:52:31.000000000 +0200
+++ linux-5.18/drivers/i2c/muxes/Kconfig	2022-07-31 12:21:32.776100442 +0200
@@ -9,7 +9,7 @@ menu "Multiplexer I2C Chip support"
 config I2C_ARB_GPIO_CHALLENGE
 	tristate "GPIO-based I2C arbitration"
 	depends on GPIOLIB || COMPILE_TEST
-	depends on OF || COMPILE_TEST
+	depends on OF
 	help
 	  If you say yes to this option, support will be included for an
 	  I2C multimaster arbitration scheme using GPIOs and a challenge &
@@ -34,7 +34,7 @@ config I2C_MUX_GPIO
 config I2C_MUX_GPMUX
 	tristate "General Purpose I2C multiplexer"
 	select MULTIPLEXER
-	depends on OF || COMPILE_TEST
+	depends on OF
 	help
 	  If you say yes to this option, support will be included for a
 	  general purpose I2C multiplexer. This driver provides access to
@@ -77,7 +77,7 @@ config I2C_MUX_PCA954x
 config I2C_MUX_PINCTRL
 	tristate "pinctrl-based I2C multiplexer"
 	depends on PINCTRL
-	depends on OF || COMPILE_TEST
+	depends on OF
 	help
 	  If you say yes to this option, support will be included for an I2C
 	  multiplexer that uses the pinctrl subsystem, i.e. pin multiplexing.
--- linux-5.18.orig/drivers/i2c/muxes/i2c-mux-pinctrl.c	2022-05-22 21:52:31.000000000 +0200
+++ linux-5.18/drivers/i2c/muxes/i2c-mux-pinctrl.c	2022-08-04 13:35:50.169392003 +0200
@@ -185,7 +185,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_pinctrl_
 static struct platform_driver i2c_mux_pinctrl_driver = {
 	.driver	= {
 		.name	= "i2c-mux-pinctrl",
-		.of_match_table = of_match_ptr(i2c_mux_pinctrl_of_match),
+		.of_match_table = i2c_mux_pinctrl_of_match,
 	},
 	.probe	= i2c_mux_pinctrl_probe,
 	.remove	= i2c_mux_pinctrl_remove,


-- 
Jean Delvare
SUSE L3 Support
