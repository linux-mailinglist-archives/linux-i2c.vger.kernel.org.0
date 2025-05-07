Return-Path: <linux-i2c+bounces-10848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0EBAAD772
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604DF3A3DB9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AD32248BF;
	Wed,  7 May 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LPbgTH1Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544AF224224;
	Wed,  7 May 2025 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602036; cv=none; b=sklUoeX0K3gKM3MKZlWO1ZUg+uSm1BrAJA6DCxzQdYnHwz8AynHZtoUPpCwMOpxl/vO/A8+JqOjk4Xbp5ldkMxJkahhkDXykN6utm0QIkpW4MbAi285YP8jaMw2G4pRk+DgdQiy2a3CIPQ5jUMoSg+9tks6KtVGZo7gBE3T/Q0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602036; c=relaxed/simple;
	bh=Q8Jr7gEUlgnBJ4DWG9K6+ebJ5hUNVMHsWhNsydq/l3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggm+Maj89EGBwK02FYTI2pRFQxstjbZfSP5CmCHC5ZBQshTgINkuDvdchlzjTx70UajyEp7kZMAk6wiPK2bXnLmAH8Us43y3OJKOCcViRjvvH1sNn6qTwp2bNBZFPKS9CEawEX82P3XkfdN2jSYsGX4/58aUhzB6bjhFq7utmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LPbgTH1Y; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 8E07343B5E;
	Wed,  7 May 2025 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kCyedwKlclPXWFakTIMdbfTCP/xp1VL2PMtgtkts9U=;
	b=LPbgTH1Y2HVN9S4wvdRtYOBK9w+2G3ia4wYPJU8oBkSMWsurfeynjdg9yPXIDpCk8nf9Se
	8b6Lt/R5/he9zv22lPeE8ZA89vvk73Ns7CzuKR2SXIQKPk3DXmJ1NzsZVBonXdz9k2SQfb
	CllxBA0Dpw38So/lvJpIY19ShX8LCHCjPDfCH4S+ceB4zLQUcWl6pSWwWqmwa//E8uIbY3
	9YkjOon6iwXM70R7IQr+F1yOMuzwfptVmzfiyQ96NHYmT44o1JnjOHzdn+jfJRivzOWUKQ
	QhfC/Jed6JSquw+XtOhqnlXt3n8Z9imQEQXMnrbZp3sFFlucWUmuEQKsBpHXqg==
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
Subject: [PATCH v2 13/26] PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge node
Date: Wed,  7 May 2025 09:12:55 +0200
Message-ID: <20250507071315.394857-14-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

During the instantiation of devices described by a device-tree overlay
applied on a PCI device, devlink displays the following kind of debug
messages instead of creating the expected links:
   'Not linking xxxx - might never become dev'

Without those expected links, the device removal order cannot be
correct.

Those debug traces are printed by fw_devlink_create_devlink(). In our
use case, they are all printed because the supplier of the link has at
least one of its ancestor with its fwnode flag FWNODE_FLAG_INITIALIZED
set.

The culprit ancestor is the PCI root bridge.

The fwnode related to the PCI root bridge is created dynamically by the
of_pci_make_host_bridge_node() function. During this creation
fwnode_dev_initialized() is called which set the FWNODE_FLAG_INITIALIZED
flag.

Calling fwnode_dev_initialized() tells devlink that the device related
to this node is handled out of the driver core. This is not correct in
our case. Indeed the device related to this firmware node is handled
using driver core mechanisms and is fully compliant devlink
expectations.

Simply remove the fwnode_dev_initialized() call. With that done, the
devlink debug messages are no more displayed and links that were missing
are correctly created.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/pci/of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index ab19bfaaeab2..06670bcf7067 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -811,7 +811,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 */
 	of_node_set_flag(np, OF_POPULATED);
 	fw_devlink_set_device(&np->fwnode, &bridge->dev);
-	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
 	if (ret)
-- 
2.49.0


