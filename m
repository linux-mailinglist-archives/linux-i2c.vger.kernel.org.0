Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AAC585E93
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Jul 2022 12:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbiGaKzv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Jul 2022 06:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiGaKzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 31 Jul 2022 06:55:50 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AB4D7A
        for <linux-i2c@vger.kernel.org>; Sun, 31 Jul 2022 03:55:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 02EB15CB51;
        Sun, 31 Jul 2022 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1659264949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=GUSeKXGPI8rlPBa7IDeW9UYCuRWEQwk6iIALEn6J3yg=;
        b=ZrXZyEdLb7Zg9NMM+zj6g2tZn/NxWy5MuHY1CnYrcopcNpc/ms4ndjq7RGxA9Teu9X0jVU
        U/u0fxn8DGG9vlTIkbqHaS5veRE5xKMmWr7coF+R47vLzisgxCnELcUVKoXQrE0L8GVCnd
        DkakEnr32cN3tapq3vVRn4gUmPEtlb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1659264949;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=GUSeKXGPI8rlPBa7IDeW9UYCuRWEQwk6iIALEn6J3yg=;
        b=rsXe7sMP5CgBMHqa9uNCtvSXIoC6KYxHHD7dG3DwJCAGBFwxVORb5hyo54IsgN3NHRTO+Y
        gG+lZgnn3eHIZBDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D058113754;
        Sun, 31 Jul 2022 10:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id zalCMbRf5mJ1QQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 31 Jul 2022 10:55:48 +0000
Date:   Sun, 31 Jul 2022 12:55:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Peter Rosin <peda@axentia.se>
Subject: [PATCH] i2c: muxes: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20220731125547.358ec18e@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/muxes/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
Jean Delvare
SUSE L3 Support
