Return-Path: <linux-i2c+bounces-13509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D9BDCF35
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2393AF22A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17AC31A554;
	Wed, 15 Oct 2025 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mYeoej46"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD4314B7F;
	Wed, 15 Oct 2025 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512628; cv=none; b=aR6x9VJw8n+8g2qm/f0yI//0VboysUQA6WFx7LjCKbZQ+w6FGvwf/gHmusVXeSQUQFi1MCCWMGyPTX0FaurAalEN73RMwXSawwWmn0BZaUhgfFXcGTCNwkbYSDmTw3zenHG46muNYNqRGKhdqTKga27r0Iqy1y+7xGBjYvMemb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512628; c=relaxed/simple;
	bh=c59SNoKAf2jx0YBepzA6trFAjeOhj3WeCNa2+9Ie0eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6Y1KREYkQZng+wheZUC4Cn8zL5LyNBI96BoWMaXnq+zJcfGhDCIx09m+DYo6wfbZbW1poooi4/qjSMBvrobZMmW+AfRpTUT7jLv9kVky60kRRvNsdGAdUjDAhRtoV7fGxk3ZtwWuLg+VQS1u8tbBCh0WrLpqc+yQ/YeudHJAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mYeoej46; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 024A41A13AA;
	Wed, 15 Oct 2025 07:17:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC4BC606F9;
	Wed, 15 Oct 2025 07:17:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 559FC102F22BB;
	Wed, 15 Oct 2025 09:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512621; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fHuXl7R1JDrl2sFImq8rQjfFvo0Z+fh79Pfu/rIAZ88=;
	b=mYeoej46keYmE1YmeIcFkBPZxlMzp9eUgBkwIor+3ZWopE2KNgfIpzmqgOftiOTCyUMPhC
	8bPQqn9hpl0fJrJd0YLxhTgUjsg17A1UQlSFzQuAqPq8+BIfyTODPeVxIOEOF6RkpAbJnz
	+fn+4pXprFr+3uf37l5mkJSACU42hxbP+fzfHEFJaMj4wl3z1YLr5uTE1Leo1RrI6e3q7d
	uDawIcq8rVhumm1O1YEx7hbFBEMVnuGybd81f6bOFMENGzHxMivmR+oVAjB3ldd5RCvF9E
	vqNgz2a/H2eMQSRYp+iY4wrh8VSiDs+vmIh62xoQ2T6qq0ehw2WK0fC35g/MwQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
Date: Wed, 15 Oct 2025 09:13:52 +0200
Message-ID: <20251015071420.1173068-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015071420.1173068-1-herve.codina@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

A Simple Platform Bus is a transparent bus that doesn't need a specific
driver to perform operations at bus level.

Similar to simple-bus, a Simple Platform Bus allows to automatically
instantiate devices connected to this bus.

Those devices are instantiated only by the Simple Platform Bus probe
function itself.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/bus/simple-platform-bus.yaml     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/simple-platform-bus.yaml

diff --git a/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
new file mode 100644
index 000000000000..47f0b4e13c2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple Platform Bus
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  A Simple Platform Bus is a transparent bus that doesn't need a specific
+  driver to perform operations at bus level.
+
+  Similar to simple-bus, a Simple Platform Bus allows to automatically
+  instantiate devices connected to this bus. Those devices are instantiated
+  only by the Simple Platform Bus probe function itself.
+
+properties:
+  $nodename:
+    pattern: "^bus(@[0-9a-f]+)?$"
+
+  compatible:
+    const: simple-platform-bus
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+
+    bus {
+        compatible = "simple-platform-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
-- 
2.51.0


