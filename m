Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD7B34D811
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhC2T0Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:26:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhC2TZs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 15:25:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63AFC61935;
        Mon, 29 Mar 2021 19:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617045948;
        bh=npnkLQ79rDJyy4+6LPFHKiTlRgAZaJJ3FJL7hDdAky8=;
        h=From:To:Cc:Subject:Date:From;
        b=oLNb1ksD0R2RndS4hOprn1yjs90FwIQzm2AIxM7Kg5DpyRJvFrbyxLvqsxsXPa9o3
         6emAX312oj+kpZhogybO/hNDS1oaSjipxszQuxbbhef1Tnk7kSOBz069i8ez8K1IpX
         PFvjCxoX/WFkiIG/a4QYyFPj37q7HFphvboBR1hZbu70jRZMTP5DLC3YOHMvtFnFcE
         Ql28JtYAB5wkNilVpIvi9phT8YHEoqAU2fXA7vJZEglUJOh/7j1STRv06V1k3uCME9
         2nNia/YCYaV0GVZr8mxEGKHKSPq0u5zEBBU4z7H+i5BCmid/PTykNzCTo7ZeOqh/lP
         NFqwItQ7nj5Aw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: gpio: update email address in binding docs
Date:   Mon, 29 Mar 2021 21:25:41 +0200
Message-Id: <20210329192541.7451-1-wsa@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index ff99344788ab..fd040284561f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Bindings for GPIO bitbanged I2C
 
 maintainers:
-  - Wolfram Sang <wolfram@the-dreams.de>
+  - Wolfram Sang <wsa@kernel.org>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
-- 
2.29.2

