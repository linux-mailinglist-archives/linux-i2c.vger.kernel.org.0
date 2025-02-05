Return-Path: <linux-i2c+bounces-9316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CABA297C8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 18:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178B6169E76
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 17:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF368214219;
	Wed,  5 Feb 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nF14YuQU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F84211A11;
	Wed,  5 Feb 2025 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777180; cv=none; b=fEQyAuYIJ4fb1Lt7Op/xD5pYipQBYbo4zQ7YtLo6d1OQUUsGk3xAiVAOeJro7x43KGf0tSoK/N2A/o8990nLVLWr/9sOWnxZz8pbKr41gXGIS3P1NokJPOZtBaupvQTFTY152DeC6bHjXkaZBNFO9+cR2YIcOnUO2MerIsD6AR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777180; c=relaxed/simple;
	bh=S8T1PWTHvPJdjLF0VsVaxwM6hjAvUiPqNUnMf9LRpxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy8ghjMldp8Utx5bOnxsQiCZYnevsSU5MWVYm2FsdBkFwHuXeNj9aS77fE67hb4KOQwty/T1sRhtjsAcTNekrMGJroGlVAtIivizqBUwntNPwLEFMRnZWnoktU2l3XhLp0SW+sHBqo+oc8E24XIzwL3tEgwburnnRa9OKCdfngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nF14YuQU; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 90906441E9;
	Wed,  5 Feb 2025 17:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2S4G8o+owx9cCOvZeDqRa7r3ZpY37yJGMWqoecfhdQ=;
	b=nF14YuQUTJ7PColQyF8etP43/noERmZh66PSkf6itlZMZzGmsoeKwhgPLwy3QWg0MFuHdO
	LlUx1S+kyQbmMgBGGSPn+QVqR/zlN/eyG/0WpgRsx/b96gQwYBTFVRQ25j9IZ7yWLSBcna
	PduVpIdqjE66RNGqXfKT0PsGtc5/DhjcjJshYy4HAQIhjL7Rum9MaY8oAHkYoTxIWW+jak
	F6iH3PYJAe3RYOdDOSyxiWp1scQqLlOmtWXV5nD/q0N0ejfS0AefEogkj187lbZJzK99di
	6uAC8QOjXwXpZe1TQxMsBM+a7R8uOa5TJhQk9/BxNdGNYx/3TDOLYDRsXrk51A==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 3/3] i2c: i2c-core-of: Handle i2c bus extensions
Date: Wed,  5 Feb 2025 18:39:16 +0100
Message-ID: <20250205173918.600037-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegto
 hhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

i2c bus extensions were introduced to decouple i2c busses when they are
wired to connectors. Combined with devicetree overlays, they introduce
an additional level of indirection, which is needed to decouple the
overlay (describing the hardware available on addon baord) and the base
tree (describing resources provided to the addon board).

For instance, the following devicetree fragment, available once
overlays are applied, is legit:

    i2c1: i2c@abcd0000 {
        compatible = "xyz,i2c-ctrl";
        i2c-bus-extension@0 {
            reg = <0>;
            i2c-bus = <&i2c-ctrl>;
        };
        ...
    };

    connector {
        i2c-ctrl {
            i2c-parent = <&i2c1>;
            #address-cells = <1>;
            #size-cells = <0>;

            i2c-bus-extension@0 {
                reg = <0>;
                i2c-bus = <&i2c-other-connector>;
            };

            device@10 {
                compatible = "xyz,foo";
                reg = <0x10>;
            };
        };

        devices {
            other-connector {
                i2c-at-other-connector {
                    i2c-parent = <&i2c-ctrl>;
                    #address-cells = <1>;
                    #size-cells = <0>;

                    device@20 {
                       compatible = "xyz,bar";
                       reg = <0x20>;
                    };
                };
            };
        };
    };

Current processing done when a i2c adapter is registered registers
i2c clients described at the adapter node level.

With i2c bus extensions, the process needs to look also at
extensions to register devices described in those extensions and so
connected to the adapter.

Extend of_i2c_register_children() to look recursively at those
i2c bus extensions.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-of.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index b4c9db137f5a..406565beabbe 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -85,13 +85,20 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 static void of_i2c_register_children(struct i2c_adapter *adap,
 				     struct device_node *bus)
 {
+	struct device_node *node, *extension;
 	struct i2c_client *client;
-	struct device_node *node;
 
 	dev_dbg(&adap->dev, "of_i2c: walking child nodes from %pOF\n", bus);
 
-	/* Register device directly attached to this bus */
+	/*
+	 * Register device directly described in this bus node before looking
+	 * at extensions.
+	 */
 	for_each_available_child_of_node(bus, node) {
+		/* Filter out extension node */
+		if (of_node_name_eq(node, "i2c-bus-extension"))
+			continue;
+
 		if (of_node_test_and_set_flag(node, OF_POPULATED))
 			continue;
 
@@ -103,6 +110,23 @@ static void of_i2c_register_children(struct i2c_adapter *adap,
 			of_node_clear_flag(node, OF_POPULATED);
 		}
 	}
+
+	/* Look at extensions */
+	for_each_available_child_of_node(bus, node) {
+		if (!of_node_name_eq(node, "i2c-bus-extension"))
+			continue;
+
+		extension = of_parse_phandle(node, "i2c-bus", 0);
+		if (!extension)
+			continue;
+
+		/*
+		 * Register children available at this extension possibly
+		 * walking other chained extensions.
+		 */
+		of_i2c_register_children(adap, extension);
+		of_node_put(extension);
+	}
 }
 
 void of_i2c_register_devices(struct i2c_adapter *adap)
-- 
2.47.1


