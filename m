Return-Path: <linux-i2c+bounces-10156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA701A7E3AF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2973C3ABB2E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAF61FA267;
	Mon,  7 Apr 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NCF8YrQe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569CD1EFF9D;
	Mon,  7 Apr 2025 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037774; cv=none; b=Egt1CldNbDwiXd1xulUJdp5l1eLKPqPAcMRjD3uVlzh7hrRrklg4LOabrbh5RSx1u9adrfUxVZtHWqG4lSmqsWaQq5B5cQppRx/ANb/TlbuZczpWhdz9M/bdTNh9jGH9w+Wztg16vRwxHJ/fmzl2xwyqrDng8V8Vs7hMXfpYkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037774; c=relaxed/simple;
	bh=xTj0xUFlTJ9TBmQDcwePyyDlPC9wH/C+T229Nuw/zag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnp5W4aMIZMvciPxu0pZVaLubIwdM/6ovvtcu2JrDZhkuoTvWVXbgcsJwueDMwJGTc5ICUZp+xFa1JCCXQCzsqsMmwhe+9ns+Dukz4DpucACAI28O4TuDsDH9kfjZrAZMyRNquHGqDkJtPsCiGXnLSPhgRrrTapmJmCL5tjxk34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NCF8YrQe; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 2E1D644327;
	Mon,  7 Apr 2025 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qk5GQt8I+7R2pPHJxzjfQlsZZkZxJhgSQbQsHr0o/hI=;
	b=NCF8YrQeurrOLg19iw0E0baRYjfFOrx6IjRNk2HdtyCK5rpNymla2co1/mcbptqDw16lzg
	kVOBe9mOrYsbHFLOhcDH8QBJ7/jujj2CUYFuZ9T+3wT/r6jKwQY0NbM0uN+raSl7EUv1/p
	JWipr2DsN+7bwFa5Ay7t8aDu9dmQvMV7DkJ0GOH31ZCg9LJMvh95C8mwgXobs5X7fPGyoZ
	y8cMaI6RnpaohtMh4oavzvlRDV6lS0/RWjtncwfdBtktNuC+4o78xc7CAVXaEzAcVub/tO
	YiR/icZTO5I4JqHS9sNecAECJeSDLBHdjc+kYDOiYxqrprxz68wmHzJuhsfA3g==
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
Subject: [PATCH 02/16] driver core: Rename get_dev_from_fwnode() wrapper to get_device_from_fwnode()
Date: Mon,  7 Apr 2025 16:55:31 +0200
Message-ID: <20250407145546.270683-3-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleffudeludffledviefftedtffffjeehhfeiffelteejtdeugffggfffudffheegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuv
 ghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

get_dev_from_fwnode() calls get_device() and so it acquires a reference
on the device returned.

In order to be more obvious that this wrapper is a get_device() variant,
rename it to get_device_from_fwnode().

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/base/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..f30260fd3031 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
+#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
@@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 	if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
 		return false;
 
-	dev = get_dev_from_fwnode(fwnode);
+	dev = get_device_from_fwnode(fwnode);
 	ret = !dev || dev->links.status == DL_DEV_NO_DRIVER;
 	put_device(dev);
 
@@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
 	struct device *dev;
 
 	fwnode_for_each_parent_node(fwnode, parent) {
-		dev = get_dev_from_fwnode(parent);
+		dev = get_device_from_fwnode(parent);
 		if (dev) {
 			fwnode_handle_put(parent);
 			return dev;
@@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
 		goto out;
 	}
 
-	sup_dev = get_dev_from_fwnode(sup_handle);
-	con_dev = get_dev_from_fwnode(con_handle);
+	sup_dev = get_device_from_fwnode(sup_handle);
+	con_dev = get_device_from_fwnode(con_handle);
 	/*
 	 * If sup_dev is bound to a driver and @con hasn't started binding to a
 	 * driver, sup_dev can't be a consumer of @con. So, no need to check
@@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device *con,
 	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
 		sup_dev = fwnode_get_next_parent_dev(sup_handle);
 	else
-		sup_dev = get_dev_from_fwnode(sup_handle);
+		sup_dev = get_device_from_fwnode(sup_handle);
 
 	if (sup_dev) {
 		/*
@@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 		bool own_link = true;
 		int ret;
 
-		con_dev = get_dev_from_fwnode(link->consumer);
+		con_dev = get_device_from_fwnode(link->consumer);
 		/*
 		 * If consumer device is not available yet, make a "proxy"
 		 * SYNC_STATE_ONLY link from the consumer's parent device to
-- 
2.49.0


