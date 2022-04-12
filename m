Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F054FDC35
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 13:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbiDLKPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 06:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351898AbiDLJmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 05:42:33 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760465548E;
        Tue, 12 Apr 2022 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649753457;
  x=1681289457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qPE0cAEK4Wc/D+HUkql/yGqGenPvs1X2rgbcrD3CHyo=;
  b=Sc8gyDZtRU4/xVNmwqKCzXG4HyM4qvQO6BdHfl4xJbPMlYgGpx865gB1
   O5jLQfpE9mTCtMfFGeua4vWx866foXTULMIAW//5S6QYOpD0k6woTP9Ez
   htF8SzsIu2vwQ57lAYcDgMvIDkP1wixqhZjl4uDNjaUNhmLU0O75ljpCX
   iK14B7ElyAO3mNzsbpjWAqZk9BVjriw0UlZFip8Nqwa70xVAfTNl7dNJe
   /uclWPIzEGVLUHSnq1DJw0uxbXRDAb9GIqhiZGof2daliJHOfgi9yj9x9
   8rSCewopVHGd4Nw84SJFBCRmZ4QiZ0zHQpMGE56UcAtaRKzsuy0xyrgbq
   g==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device detection
Date:   Tue, 12 Apr 2022 10:50:45 +0200
Message-ID: <20220412085046.1110127-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
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
to indicate that the devicetree description of the hardware is complete
and thus allow this discovery to be disabled.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v2:
    - Change subject prefix
    - Reword description of property

 Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index fc3dd7ec0445..960d1d5c9362 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
 	this information to adapt power management to keep the arbitration awake
 	all the time, for example. Can not be combined with 'single-master'.
 
+- no-detect
+	states that no other devices are present on this bus other than the
+	ones listed in the devicetree.
+
 - pinctrl
 	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
 	recovery, call it "gpio" or "recovery" (deprecated) state
-- 
2.34.1

