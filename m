Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8463189E80
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 16:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgCRPBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 11:01:11 -0400
Received: from sauhun.de ([88.99.104.3]:48444 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbgCRPBI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 11:01:08 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id B29E42C2E79;
        Wed, 18 Mar 2020 16:01:05 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Date:   Wed, 18 Mar 2020 16:00:55 +0100
Message-Id: <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes, we have unknown devices in a system and still want to block
their address. For that, we allow DT nodes with only a 'reg' property.
These devices will be bound to the "dummy" driver but with the name
"reserved". That way, we can distinguish them and even hand them over to
the "dummy" driver later when they are really requested using
i2c_new_ancillary_device().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 2 --
 Documentation/devicetree/bindings/i2c/i2c.txt        | 4 +++-
 drivers/i2c/i2c-core-base.c                          | 1 +
 drivers/i2c/i2c-core-of.c                            | 8 +++-----
 drivers/i2c/i2c-core.h                               | 1 +
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 6b25a80ae8d3..fc8ea27934b3 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -50,7 +50,6 @@ Examples:
 		reg-io-width = <1>;	/* 8 bit read/write */
 
 		dummy@60 {
-			compatible = "dummy";
 			reg = <0x60>;
 		};
 	};
@@ -68,7 +67,6 @@ or
 		reg-io-width = <1>;	/* 8 bit read/write */
 
 		dummy@60 {
-			compatible = "dummy";
 			reg = <0x60>;
 		};
 	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 9a53df4243c6..989b315e09dc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -21,7 +21,9 @@ flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
 bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
 of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
 Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
-be devices ourselves.
+be devices ourselves. The 'reg' property of a child is required. The
+'compatible' property is not. Empty 'compatible' child entries can be used to
+describe unknown devices or addresses which shall be blocked for other reasons.
 
 Optional properties
 -------------------
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3d7b8a00a7d9..84464e439df5 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -854,6 +854,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
 
 static const struct i2c_device_id dummy_id[] = {
 	{ I2C_DUMMY_DRV_NAME, 0 },
+	{ I2C_RESERVED_DRV_NAME, 0 },
 	{ },
 };
 
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6787c1f71483..d8d111ad6c85 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 
 	memset(info, 0, sizeof(*info));
 
-	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
-		dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
-		return -EINVAL;
-	}
-
 	ret = of_property_read_u32(node, "reg", &addr);
 	if (ret) {
 		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
 		return ret;
 	}
 
+	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
+		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
+
 	if (addr & I2C_TEN_BIT_ADDRESS) {
 		addr &= ~I2C_TEN_BIT_ADDRESS;
 		info->flags |= I2C_CLIENT_TEN;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index fb89fabf84d3..77b3a925ed95 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -23,6 +23,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 			       unsigned int num_resources);
 
 #define I2C_DUMMY_DRV_NAME "dummy"
+#define I2C_RESERVED_DRV_NAME "reserved"
 
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
-- 
2.20.1

