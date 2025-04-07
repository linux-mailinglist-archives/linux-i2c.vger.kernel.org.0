Return-Path: <linux-i2c+bounces-10162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF6A7E341
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C880B16D180
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3AA1FECBF;
	Mon,  7 Apr 2025 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UJibLhzS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1001FE466;
	Mon,  7 Apr 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037786; cv=none; b=JrfCh9d8U6YFpWdB/s+9N4DeGcShcXBfL/4/90hRpzvCsehdtvrK62pKzo+R/9dLQCk92dUErSXcfocq6Bscy2qKYZQaqj6MQvZvhwqxXHtYsyBr7uv2cD/+T8Qf8HL9GDj+friFczy5IrQMGd0zmMmU8YWmYUjSIdIoho/SpiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037786; c=relaxed/simple;
	bh=RDAW+fwe74PiptUzUxnrAskSMUYIXh+Kc23D7ubwCJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IR/0o9nCLYeaH6Ejyhqm6ZWgfUZkOlPvD8zdhCTOOJWlDhjED6tDCOhJ1w8Ylw6rXG1/SmQIBVCixBOA2nNe2trN4IPhoUQdSVfYCI/GCU+/sSFKlJGcqXoOdnm3uz1mx38LqVxh/8aaxwuqhJS8Sr0NZVhrG1PPAdfZ7sRVWrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UJibLhzS; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id CBF4C4433C;
	Mon,  7 Apr 2025 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QbRycxm7vGCRrdBNEytaF89Hh6LdVDglF4TAZ/Eo8Q=;
	b=UJibLhzStnjURTT2XwpbZOd/6Vf219UgdhYLn+PxsXj4jnL10BOZ7x87fHKoVxidadXbhD
	nHe0+/tfmjeO8ZilO7s8/s0ghjzg+WAiMHYAjGcvqY3zzd7H6ilAGI5MsRsKvKh2oo/u/N
	P8CUVcAG4zkuJqCZ8dg0BoDQIsFr5tb/57AhOW7OUP6YwrzCiXT+GpFlJnFY9iA0v4fgPY
	/qhm3a5MlpPOocTB0z2mZrXROElCOebT5Z98DYHQbYSTlWTvym32kdm039P7EWFBRzQ7VY
	QsCjVNaYNKc7qdbSLrcN50bdnTjzbULIp7027d26L53FIMypPI0HJmgvLNXJyw==
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Date: Mon,  7 Apr 2025 16:55:37 +0200
Message-ID: <20250407145546.270683-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407145546.270683-1-herve.codina@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

The supplier device of an I2C adapter is the device that calls
i2c_add_adapter() or variants and i2c_del_adapter().

Most of the time this supplier device is the parent of the adapter dev.

Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
parent of the adapter dev points to the adapter dev the mux is connected
to instead of the supplier of this adapter.

Introduce i2c_get_adapter_supplier() and a new supplier field in the
adapter structure in order to ease the adapter supplier retrieval.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f..e3eeac0b2b49 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1917,6 +1917,22 @@ struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(i2c_get_adapter_by_fwnode);
 
+/**
+ * i2c_get_adapter_supplier() - Get the supplier of an adapter
+ * @adapter: the adapter to get the supplier from
+ *
+ * return:
+ * Look up and return the &struct device corresponding to the device supplying
+ * this adapter.
+ *
+ * The user must call put_device() once done with the supplier returned.
+ */
+struct device *i2c_get_adapter_supplier(struct i2c_adapter *adapter)
+{
+	return get_device(adapter->supplier ?: adapter->dev.parent);
+}
+EXPORT_SYMBOL(i2c_get_adapter_supplier);
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..04b85703bcd6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -746,6 +746,7 @@ struct i2c_adapter {
 	int timeout;			/* in jiffies */
 	int retries;
 	struct device dev;		/* the adapter device */
+	struct device *supplier;	/* the device that supply this adapter */
 	unsigned long locked_flags;	/* owned by the I2C core */
 #define I2C_ALF_IS_SUSPENDED		0
 #define I2C_ALF_SUSPEND_REPORTED	1
@@ -913,6 +914,8 @@ struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
 
+struct device *i2c_get_adapter_supplier(struct i2c_adapter *adap);
+
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
 
 /* Return the functionality mask */
-- 
2.49.0


