Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD7D58CA60
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243534AbiHHOR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243477AbiHHORy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:54 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7977E2185;
        Mon,  8 Aug 2022 07:17:48 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id D91B840021;
        Mon,  8 Aug 2022 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vse0PXbfgREFWzjPw765Sr7JMn/or8fQexoNuL2Z1o0=;
        b=JvAV4ABjljWyPhGQmfuWo0DDdGgRa7hTwWhoRFvR8yOJ/F4s2ObP8kRPNGMdQNXlMs0XAn
        HxjqQXzBDPg0hUQvu73Rc6XnEl+bOZ62B5LrGVbnOXSkt+u72GojJd9un6W/f3D5nlSkVW
        XJRbYOoxl5FAEvlhucoTh7sQQAQmctzDTvzZsMo6aYoJ3oW9HoqYeaXlX8wToM7toTa2rH
        6jaZWtBT1khCKHLqRGCNZv60HcPT7IFWLNuXFzSxhM0MuRb6CKZJnaW/UtLVFdlBuOC1BQ
        AHMasrELZKsw1Mi0XTBmjgbTNgozw+a78W+x3I55y0EVFOOSVjkcJCKmTPG5Eg==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] docs: i2c: i2c-sysfs: improve wording
Date:   Mon,  8 Aug 2022 16:17:07 +0200
Message-Id: <20220808141708.1021103-9-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Improve wording in a couple sentences.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/i2c-sysfs.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/i2c-sysfs.rst b/Documentation/i2c/i2c-sysfs.rst
index 6b68b95cd427..d816a23b80f2 100644
--- a/Documentation/i2c/i2c-sysfs.rst
+++ b/Documentation/i2c/i2c-sysfs.rst
@@ -51,11 +51,10 @@ Google Pixel 3 phone for example::
 ``i2c-2`` is an I2C bus whose number is 2, and ``2-0049`` is an I2C device
 on bus 2 address 0x49 bound with a kernel driver.
 
-Terminologies
-=============
+Terminology
+===========
 
-First, let us define a couple of terminologies to avoid confusions in the later
-sections.
+First, let us define some terms to avoid confusions in the later sections.
 
 (Physical) I2C Bus Controller
 -----------------------------
@@ -117,7 +116,7 @@ Walk through Logical I2C Bus
 
 For the following content, we will use a more complex I2C topology as an
 example. Here is a brief graph for the I2C topology. If you do not understand
-this graph at the first glance, do not be afraid to continue reading this doc
+this graph at first glance, do not be afraid to continue reading this doc
 and review it when you finish reading.
 
 ::
-- 
2.34.1

