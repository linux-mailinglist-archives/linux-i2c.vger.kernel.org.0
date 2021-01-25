Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C64130361B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jan 2021 07:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbhAZGAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 01:00:45 -0500
Received: from foss.arm.com ([217.140.110.172]:49666 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730085AbhAYPim (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Jan 2021 10:38:42 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0207D1763;
        Mon, 25 Jan 2021 07:19:18 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFAB93F68F;
        Mon, 25 Jan 2021 07:19:15 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v4 10/21] dt-bindings: i2c: mv64xxx: Add H616 compatible string
Date:   Mon, 25 Jan 2021 15:18:00 +0000
Message-Id: <20210125151811.11871-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210125151811.11871-1-andre.przywara@arm.com>
References: <20210125151811.11871-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the obvious compatible name to the existing I2C binding, and pair
it with the existing A31 fallback compatible string, as the devices
are compatible.

On the way use enums to group all compatible devices together.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 5b5ae402f97a..eb72dd571def 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -18,21 +18,14 @@ properties:
           - const: allwinner,sun4i-a10-i2c
       - const: allwinner,sun6i-a31-i2c
       - items:
-          - const: allwinner,sun8i-a23-i2c
+          - enum:
+              - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-a83t-i2c
+              - allwinner,sun50i-a64-i2c
+              - allwinner,sun50i-a100-i2c
+              - allwinner,sun50i-h6-i2c
+              - allwinner,sun50i-h616-i2c
           - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun8i-a83t-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-a64-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-a100-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-h6-i2c
-          - const: allwinner,sun6i-a31-i2c
-
       - const: marvell,mv64xxx-i2c
       - const: marvell,mv78230-i2c
       - const: marvell,mv78230-a0-i2c
-- 
2.17.5

