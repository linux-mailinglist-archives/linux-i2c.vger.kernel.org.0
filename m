Return-Path: <linux-i2c+bounces-11443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAEBAD8E11
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5FE1BC4EA8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615532EA474;
	Fri, 13 Jun 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lHeuyzbG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF502E889F;
	Fri, 13 Jun 2025 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822558; cv=none; b=DwhWpFRuxIjLKP0PQLlY7Na25eUdfsmIZt9dNlYnqBRYI4EXt4yACcJjJh0MdibPKwdHUtyVKu/yNyENd9jIM6+jaSXb54MR74x60USLQ4EssS4TgIl+INsPo1oPSM4KnIRkHwWoU76Z9cOgW+SdlJ4LuXQSy6lObAcLP+xl5WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822558; c=relaxed/simple;
	bh=IhtJf46eylzCLE51Dj72Ej+SvqX8WNDPFZX/b2aVWJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKPh4Onjrm53ULJntf2h1Fd7wNOOSjhlqg49Ua4hSI69nIhIATqaBAVXm9LqeqzHggMje2zJGtO/wpsZjF9RNStkLX/cEeSiyHHJ+ujOc0k4jsFjQOmHKSAKWQYDPYF+OBBhWMdubUP6AUC8P6OZF0F71/E8bxnYtJVI+d+e1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lHeuyzbG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 42481442A5;
	Fri, 13 Jun 2025 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72CBHzhUbbuM1IOY+HEenpfQnU443LDQ5XSU4O8peV4=;
	b=lHeuyzbGJblqjgWJc/2lTdUV5gCIlxg9fk9WcxCgod9ekFUFjz3GdoaRB6J6+8EOv1lPUm
	YZ2E9BBbE13dBtmH8/g5lqRcKn2VPHHlvAa+5xvEIBVXO5UTkvoShiyRxeGLXoSjA+paRf
	j374OWKKMoRVrmAng9uqULrkevPj4uvdzisVJUdXsnfcfUwVHyweVw2PAJkJgBxqiPcpwt
	1dmn5Li6EUW7fSxjxgmoFIWmkhYAiFgXiAJR30rDwKVwRvRonG7MQswp3WY/NTehxJNEJs
	6QMpsU8MxeQOPzGBk2FWKLlJchoAgQbig6c3Alp5paVccbQwNnRxQ5GoIK2P6w==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
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
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 12/28] driver core: fw_devlink: Tag the fwnode dev member as private
Date: Fri, 13 Jun 2025 15:47:52 +0200
Message-ID: <20250613134817.681832-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeelpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhr
 ghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

The dev member in the fwnode structure should be accessed only by the
fwnode core. The fw_devlink_set_device() helper has been introduced to
avoid users to set this member directly. All users have been converted
and use fw_devlink_set_device() to set the field.

To avoid future abusers who might set the field directly and allow
sparse to detect them, tag the dev field as a private field.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/linux/fwnode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a1345e274125..5762914fdbf2 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -54,7 +54,7 @@ struct fwnode_handle {
 	const struct fwnode_operations *ops;
 
 	/* The below is used solely by device links, don't use otherwise */
-	struct device *dev;
+	struct device *__private dev;
 	struct list_head suppliers;
 	struct list_head consumers;
 	u8 flags;
@@ -234,7 +234,7 @@ bool fw_devlink_is_strict(void);
 static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
 					 struct device *dev)
 {
-	fwnode->dev = dev;
+	ACCESS_PRIVATE(fwnode, dev) = dev;
 }
 
 #endif
-- 
2.49.0


