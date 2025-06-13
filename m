Return-Path: <linux-i2c+bounces-11431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D606AD8DC2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877A31893E97
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB8A1A76AE;
	Fri, 13 Jun 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="obRNE9xQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B2433D9;
	Fri, 13 Jun 2025 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822534; cv=none; b=ncgapRVih/s9c+D7wEmrkFaH9Qu36i5GdWdC4D4Bkogs8aFiouuit3ep1nE1F+hSKjjVA6rDKQcn5Eh2XbFkcNnV/cvdoXFIY24NStj6efcZeZpUOkj+uKUIHrMWhzT8OOXMysHHHWsY25q/S8V3qnYv5l3oXGTtSJsC1eP/Dp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822534; c=relaxed/simple;
	bh=cVPZ9MNSBcXy4jY2V/QoJxE5TLvnGpX6HKiwhk0oZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BlTDfJUTAvPTSRzk7JUX5yAUE8eWicpQ6TXQE7aQT21F1vSLbf7D2C1Cza44g+hqpsci/zRPfrTK353oYx+pknWpqXedMcQtDOgesENfdH1+PG24qs2FVWPR8L3TsOovwm0aKvExM5Rk7BT+CMIxQ0/Dw6a5sGVXDg0RH3kw0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=obRNE9xQ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 512A0442CB;
	Fri, 13 Jun 2025 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=33yjs+dpfUk1ix0GN1DhjOYzUP8SmbBqY7hoYQTXKkk=;
	b=obRNE9xQdUOZJq0zBiVXDCjW6wNkOFyI8/Y/g0ox7Ng3c9P3FgfTsSA12K8SXy/Zc2LBE0
	jbYJQrBVHb1a6IEtyUIiwKNH7dw2Ef1cljLBcZGkYIYJRSCV9px0NqMlWuk8x1318CO62L
	SrhGQulxq7u+LlZPTAYFcZDj8pRISo2U5N4/fBrBCSesV57seIoaag87blM2D6z/9Dy7NE
	TXOE6a8KB/AlH6NPL42YRAN8Zs4wh7dPxPjpydUb/jpm6hi9avedRky8Y+eJbPQRS9geKO
	hSMHUTx3ghOzfmfM+N3RdxEf+CvRgj5cwIlF86x5zWwT0eaZ1TL8jJru2sI/Ig==
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
Subject: [PATCH v3 00/28] lan966x pci device: Add support for SFPs
Date: Fri, 13 Jun 2025 15:47:40 +0200
Message-ID: <20250613134817.681832-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleetudffledtvddtffegudfgjeffgeegkeehjeeigffgieevhfekffehheehieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeelpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi,

This series add support for SFPs ports available on the LAN966x PCI
device. In order to have the SFPs supported, additional devices are
needed such as clock controller and I2C.

As a reminder, the LAN966x PCI device driver use a device-tree overlay
to describe devices available on the PCI board. Adding support for SFPs
ports consists in adding more devices in the already existing
device-tree overlay.

With those devices added, the device-tree overlay is more complex and
some consumer/supplier relationship are needed in order to remove
devices in correct order when the LAN966x PCI driver is removed.

Those links are typically provided by fw_devlink and we faced some
issues with fw_devlink and overlays.

This series gives the big picture related to the SFPs support from
fixing issues to adding new devices. Of course, it can be split if
needed.

The first part of the series (patch 1, 2 and 3) fixes fw_devlink when it
is used with overlay. Patches 1 and 3 were previously sent by Saravana
[0]. I just rebased them on top of v6.15-rc1 and added patch 2 in order
to take into account feedback received on the series sent by Saravana.

Those modification were not sufficient in our case and so, on top of
that, patch 4 and 5 fix some more issues related to fw_devlink.

Patches 6 to 12 introduce and use fw_devlink_set_device() in already
existing code.

Patches 13 and 14 are related also to fw_devlink but specific to PCI and
the device-tree nodes created during enumeration.

Patches 15, 15 and 17 are related fw_devlink too but specific to I2C
muxes. Patches purpose is to correctly set a link between an adapter
supplier and its consumer. Indeed, an i2c mux adapter's parent is not
the i2c mux supplier but the adapter the i2c mux is connected to. Adding
a new link between the adapter supplier involved when i2c muxes are used
avoid a freeze observed during device removal.

Patch 18 adds support for fw_delink on x86. fw_devlink is needed to have
the consumer/supplier relationship between devices in order to ensure a
correct device removal order. Adding fw_devlink support for x86 has been
tried in the past but was reverted [1] because it broke some systems.
Instead of enabling fw_devlink on *all* x86 system or on *all* x86
system except on those where it leads to issue, enable it only on system
where it is needed.

Patches 19 and 20 allow to build clock and i2c controller used by the
LAN966x PCI device when the LAN966x PCI device is enabled.

Patches 21 to 25 are specific to the LAN966x. They touch the current
dtso, split it in dtsi/dtso files, rename the dtso and improve the
driver to allow easier support for other boards.

The next patch (patch 26) update the LAN966x device-tree overlay itself
to have the SPF ports and devices they depends on described.

The last two patches (patches 27 and 28) sort the existing drivers in
the needed driver list available in the Kconfig help and add new drivers
in this list keep the list up to date with the devices described in the
device-tree overlay.

Once again, this series gives the big picture and can be split if
needed. Let me know.

[0] https://lore.kernel.org/lkml/20240411235623.1260061-1-saravanak@google.com/
[1] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/

Compare to previous iteration, this v3 series mainly:
 - Rebase of top of v6.16-rc1
 - Fix typos
 - Improve code and add a missing check
 - Add 'Acked-by' and 'Reviewed-by' tags

Best regards,
Hervé

Changes:

v2 -> v3
  v2: https://lore.kernel.org/all/20250507071315.394857-1-herve.codina@bootlin.com/

  - Patch 1:
    Add 'Acked-by: Mark Brown'

  - Patch 2 and 3:
    No changes

  - Patch 4:
    Rewrite the WARN_ON() condition to avoid an additional 'if'

  - Patch 5:
    Fix typos in commit log
    Update a comment
    Remove the unneeded check before calling of_platform_depopulate()

  - Patches 6 to 11:
    No changes

  - Patch 12 (new in v3)
    Tag the fwnode dev member as private

  - Patch 13 (12 in v2)
    Fix a typo in the commit log

  - Patches 14 to 16 (13 to 15 in v2)
    No changes

  - Patch 17 (16 in v2)
    Check parent_physdev for NULL

  - Patch 18 (17 in v2)
    Capitalize "Link:"
    Add 'Reviewed-by: Andy Shevchenko'

  - Patch 19 (18 in v2)
    No changes

  - Patch 20 (19 in v2)
    Add 'Acked-by: Andi Shyti'

  - Patch 21 (20 in v2)
    No changes

  - Patch 22 (21 in v2)
    Add 'Reviewed-by: Andrew Lunn'

  - Patch 23 (22 in v2)
    Add 'Reviewed-by: Andrew Lunn'

  - Patch 24 (new in v3)
    Introduce PCI_DEVICE_ID_EFAR_LAN9662, the LAN966x PCI device ID

  - Patch 25 (23 in v2)
    Add 'Reviewed-by: Andrew Lunn'
    Use PCI_DEVICE_DATA() with PCI_DEVICE_ID_EFAR_LAN9662 instead of
    PCI_VDEVICE()

  - Patch 26 to 28 (24 to 26 in v2)
    No changes

v1 -> v2
  v1: https://lore.kernel.org/lkml/20250407145546.270683-1-herve.codina@bootlin.com/

  - Patch 1 and 3
    Remove 'From' tag from the commit log

  - Patch 2
    Add 'Reviewed-by: Andy Shevchenko'
    Add 'Reviewed-by: Saravana Kannan'
    Add 'Reviewed-by: Luca Ceresoli'

  - Patch 4 and 5
    No changes

  - Patch 6 (new in v2)
    Introduce fw_devlink_set_device()

  - Patch 7 (new in v2)
    Use existing device_set_node() helper.

  - Patch 8 to 11 (new in v2)
    Use fw_devlink_set_device() in existing code.

  - Patch 12 (6 in v1)
    Use fw_devlink_add_device()

  - Patch 13 (7 in v1)
    No changes

  - Patch 14 (8 in v1)
    Update commit log
    Use 'physdev' instead of 'supplier'
    Minor fixes in i2c_get_adapter_physdev() kdoc

  - Patch 15 and 16 (9 and 10 in v1)
    Use 'physdev' instead of 'supplier' (commit log, title and code)

  - Patch 17 (11 in v2)
    Enable fw_devlink on x86 only if PCI_DYNAMIC_OF_NODES is enabled.
    Rework commit log.

  - Patch 18, 19 and 20 (12, 13 and 14 in v1)
    No changes

  - Patch 21 (new in v2)
    Split dtso in dtsi/dtso

  - Patch 22 (new in v2)
    Rename lan966x_pci.dtso using the specific board name

  - Patch 23 (new in v2)
    Improve the driver introducing board specific data to ease support
    for other boards (avoid the direct dtbo reference in the function
    loading the dtbo).

  - Patch 24 (15 in v1)
    Refactor due to dtso split in dtsi/dtso

  - Patch 25 (new in v2)
    Sort exist driver list in Kconfig help

  - Patch 26 (16 in v1)
    Keep alphanumeric order for new drivers added in Kconfig help

Herve Codina (26):
  driver core: Rename get_dev_from_fwnode() wrapper to
    get_device_from_fwnode()
  driver core: Avoid warning when removing a device while its supplier
    is unbinding
  bus: simple-pm-bus: Populate child nodes at probe
  driver core: fw_devlink: Introduce fw_devlink_set_device()
  drivers: core: Use fw_devlink_set_device()
  pinctrl: cs42l43: Use fw_devlink_set_device()
  cxl/test: Use device_set_node()
  cxl/test: Use fw_devlink_set_device()
  PCI: of: Use fw_devlink_set_device()
  driver core: fw_devlink: Tag the fwnode dev member as private
  PCI: of: Set fwnode device of newly created PCI device nodes
  PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge
    node
  i2c: core: Introduce i2c_get_adapter_physdev()
  i2c: mux: Set adapter physical device
  i2c: mux: Create missing devlink between mux and adapter physical
    device
  of: property: Allow fw_devlink device-tree on x86 when PCI device-tree
    node creation is enabled
  clk: lan966x: Add MCHP_LAN966X_PCI dependency
  i2c: busses: at91: Add MCHP_LAN966X_PCI dependency
  misc: lan966x_pci: Fix dtso nodes ordering
  misc: lan966x_pci: Split dtso in dtsi/dtso
  misc: lan966x_pci: Rename lan966x_pci.dtso to
    lan966x_evb_lan9662_nic.dtso
  PCI: Add Microchip LAN9662 PCI Device ID
  misc: lan966x_pci: Introduce board specific data
  misc: lan966x_pci: Add dtsi/dtso nodes in order to support SFPs
  misc: lan966x_pci: Sort the drivers list in Kconfig help
  misc: lan966x_pci: Add drivers needed to support SFPs in Kconfig help

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix overlayed devices not probing because of fw_devlink

 MAINTAINERS                               |   3 +-
 drivers/base/core.c                       |  97 +++++++++---
 drivers/bus/imx-weim.c                    |   6 -
 drivers/bus/simple-pm-bus.c               |  23 +--
 drivers/clk/Kconfig                       |   2 +-
 drivers/i2c/busses/Kconfig                |   2 +-
 drivers/i2c/i2c-core-base.c               |  16 ++
 drivers/i2c/i2c-core-of.c                 |   5 -
 drivers/i2c/i2c-mux.c                     |  26 ++++
 drivers/misc/Kconfig                      |  11 +-
 drivers/misc/Makefile                     |   2 +-
 drivers/misc/lan966x_evb_lan9662_nic.dtso | 167 ++++++++++++++++++++
 drivers/misc/lan966x_pci.c                |  30 +++-
 drivers/misc/lan966x_pci.dtsi             | 172 +++++++++++++++++++++
 drivers/misc/lan966x_pci.dtso             | 177 ----------------------
 drivers/of/dynamic.c                      |   1 -
 drivers/of/overlay.c                      |  15 ++
 drivers/of/platform.c                     |   5 -
 drivers/of/property.c                     |   2 +-
 drivers/pci/of.c                          |  10 +-
 drivers/pci/quirks.c                      |   2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c  |   2 +-
 drivers/spi/spi.c                         |   5 -
 include/linux/fwnode.h                    |   9 +-
 include/linux/i2c.h                       |   3 +
 include/linux/pci_ids.h                   |   1 +
 tools/testing/cxl/test/cxl.c              |   4 +-
 27 files changed, 547 insertions(+), 251 deletions(-)
 create mode 100644 drivers/misc/lan966x_evb_lan9662_nic.dtso
 create mode 100644 drivers/misc/lan966x_pci.dtsi
 delete mode 100644 drivers/misc/lan966x_pci.dtso

-- 
2.49.0


