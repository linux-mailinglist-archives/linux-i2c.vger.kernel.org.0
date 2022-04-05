Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF574F45B6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 00:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbiDEOIm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 10:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380267AbiDENOA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 09:14:00 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307D312343F;
        Tue,  5 Apr 2022 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649160997;
  x=1680696997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IQbFdsIycaKMPC2WtqAU6bZcJ0n+YEHMU/Uu+zlGT7I=;
  b=ae7dSkD7GoCDc2NTaNCq3XgDrTcm4p7/80S49gpON3AX+mYkUIK84gnr
   jnK5D2akK5XnMwxmSBJSt231FFA755yUKQmY1aQUTnPi9SeTtJHyHSeH6
   oGk/xBHyVyz1j12hQ7Xp41SzTa4gGfwUDk4nfaHC+xxEfhzwM2A7ypP6T
   6wdpGzTOU+WO5QoCummNdb2bJR8dtJBVNjeRYBNMFuJ6VEpDF8P/yP8We
   qLCVY+WiFMpZq2DdG73QIP4oDnbwP9A56lVtoP0WpqP3jcnKcndsP7d01
   R4wu1f2NXr88o+GsfnvzlQRc6npEroX8psnY3nyn8gyebdVTuznsxNq+T
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] i2c: add binding to prevent device detection
Date:   Tue, 5 Apr 2022 14:16:26 +0200
Message-ID: <20220405121627.1560949-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When drivers with ->detect callbacks are loaded, the I2C core does a
bunch of transactions to try to probe for these devices, regardless of
whether they are specified in the devicetree or not.  (This only happens
on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
is the case for generic drivers like i2c-gpio.)

These kinds of transactions are unnecessary on systems where the
devicetree specifies all the devices on the I2C bus, so add a property
to allow them to be disabled.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index fc3dd7ec0445..5f7bdf4851e8 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
 	this information to adapt power management to keep the arbitration awake
 	all the time, for example. Can not be combined with 'single-master'.
 
+- no-detect
+	states that the system should not attempt to automatically detect
+	devices which are not explicitly specified as child nodes.
+
 - pinctrl
 	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
 	recovery, call it "gpio" or "recovery" (deprecated) state
-- 
2.34.1

