Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF5A34D80D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhC2TYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhC2TYY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 15:24:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D265C61935;
        Mon, 29 Mar 2021 19:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617045864;
        bh=n9VVhOGJhP6WbUrBkrGGbVotK+Oq4pgl+wJGK89VE/0=;
        h=From:To:Cc:Subject:Date:From;
        b=aW8HQkjXpRYzJNIB1/QlZumINvasoVRML5mEAYOhFXa0kzKIyPt5UP72BxrQ6K0Yl
         H5khtEX5AzrlyO2fuwE5KrOn7Phs8JTJOfd9CDHDFdJePEcf1ynNGj1LOlxOziyq9Y
         h9QeZLqDJcShe/3N1boRsjosqxsfZ9F0x9VEurW2n3uef1bBpnwPsGia2P5wag7kkZ
         1KbEJQGLnSEznSLMbeAAjw3zcmzo+/roJhNIJ0tGbN5RhuYaMJdGRcy7I7E1N6tk2h
         GJvuTHP0QvHh09OOkM3F5zhYZhPZUdYyU75+z74r2V2q/j7T4fB4z5vmffH1CDbmdy
         R9FbfS3i9AS4g==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: imx: drop me as maintainer of binding docs
Date:   Mon, 29 Mar 2021 21:24:09 +0200
Message-Id: <20210329192409.7313-1-wsa@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I dunno why I got added here, but I haven't been using this driver for
years. Remove me to make space for interested parties.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index f23966b0d6c6..f33c6b29966b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
 
-maintainers:
-  - Wolfram Sang <wolfram@the-dreams.de>
-
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
-- 
2.29.2

