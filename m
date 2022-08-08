Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40E658CA5A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243282AbiHHORz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243443AbiHHORq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:46 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA55D53;
        Mon,  8 Aug 2022 07:17:45 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 23F4E40024;
        Mon,  8 Aug 2022 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BBYpbjiOzI/XSRD48IW6eqP+HMklhyXTPxaqJfq58wo=;
        b=kgTWo0N5Sd0xVauvHQmzKFDU8l0lTVplBoDkMYUqXQ1HBm21S/btifYfOGEeR3TulgccR4
        vYA1pX/fuDz4HlmrlXRtfHEUAjFf9DlNPoFvTZtn315zjHYDMG8Y1vwg70Iuc3ZSBfH542
        T2QVes6oPM8U8vAJpEHyHXrShA+gIC17vdOlhb3YV+LLhWmoZDBf+LxiW51hjBiDdhmFgX
        7bpJYMtVZPYTN4lZ5waK1xUgIueBnvKq/eF8rFG2rlQzh3QHpBXvDyQ2XPjzIgJAyoxeVO
        aLHV+Acse106gNtNSkCCkQmKKi6UEnoFmKYKYapCsa/AdCr9UVMs0kH76PB6zA==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] docs: i2c: instantiating-devices: add syntax coloring to dts and C blocks
Date:   Mon,  8 Aug 2022 16:17:04 +0200
Message-Id: <20220808141708.1021103-6-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

These blocks can be nicely coloured via Sphinx.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/instantiating-devices.rst | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 890c9360ce19..3ea056a95812 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -31,7 +31,9 @@ Declare the I2C devices via devicetree
 On platforms using devicetree, the declaration of I2C devices is done in
 subnodes of the master controller.
 
-Example::
+Example:
+
+.. code-block:: dts
 
 	i2c1: i2c@400a0000 {
 		/* ... master properties skipped ... */
@@ -71,7 +73,9 @@ code. Instantiating I2C devices via board files is done with an array of
 struct i2c_board_info which is registered by calling
 i2c_register_board_info().
 
-Example (from omap2 h4)::
+Example (from omap2 h4):
+
+.. code-block:: c
 
   static struct i2c_board_info h4_i2c_board_info[] __initdata = {
 	{
@@ -111,7 +115,9 @@ bus in advance, so the method 1 described above can't be used. Instead,
 you can instantiate your I2C devices explicitly. This is done by filling
 a struct i2c_board_info and calling i2c_new_client_device().
 
-Example (from the sfe4001 network driver)::
+Example (from the sfe4001 network driver):
+
+.. code-block:: c
 
   static struct i2c_board_info sfe4001_hwmon_info = {
 	I2C_BOARD_INFO("max6647", 0x4e),
@@ -136,7 +142,9 @@ it may have different addresses from one board to the next (manufacturer
 changing its design without notice). In this case, you can call
 i2c_new_scanned_device() instead of i2c_new_client_device().
 
-Example (from the nxp OHCI driver)::
+Example (from the nxp OHCI driver):
+
+.. code-block:: c
 
   static const unsigned short normal_i2c[] = { 0x2c, 0x2d, I2C_CLIENT_END };
 
-- 
2.34.1

