Return-Path: <linux-i2c+bounces-13504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9888BDCD96
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20FE3E05DF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9422BD59C;
	Wed, 15 Oct 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zlqpXhXG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7A2BE021;
	Wed, 15 Oct 2025 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512521; cv=none; b=QMA2fpnHTmobKYk5DO160WElZipTJr0Z51cTPoR6VcnnpZzh/xdpHf2mml8k5+aMpr8PX8swesT47eR99l4SM1Wl+B1XIUGX/6aY9giEv/cUE5a7lH4+uz+1Baf9XXpjeAHg+OvTamUt/PQK6L0V6T/BdY5fBn/MoNdTuh02SEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512521; c=relaxed/simple;
	bh=tHBL8LZQ/EzxCXyj4Rc5BBYpjFDtYhbliv5BSEcWpUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ROejG08p+6UwZnzspKhVgei7mjs37Vf/zhApMC2AJk5p4a0VDkkJmTIKwL+PyvnW8/p34Z87hf6aYGeP07HD+a7hZpjYyZhQtmUgHLLmtOOzLptrufU4ovQHVdDV499X8zS8M1ZnNLo0rPOLxCiWmoQQ1NlX5IAZzTNPLUqdymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zlqpXhXG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8510EC09FAA;
	Wed, 15 Oct 2025 07:14:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84434606FA;
	Wed, 15 Oct 2025 07:15:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4E7102F22AF;
	Wed, 15 Oct 2025 09:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3j60UDCwsR+fx7dgGrkveclozQFJiothgCwXrWCeZ/Y=;
	b=zlqpXhXGF42GZ/lA/4uYP53YSSloszkjeYT4xh7RfHT9miTqIJdGrh0yMpPMsFDCMffSh/
	krak6VQp10Bg9KxMIfb1nodOuz2bnRSTbPT19jBrX7Vaa24qGRY3MAeK4apukHjfPf0KXS
	P7oTsGuPzNiy5RrDCeiZ1wXWTCvmrqJKka3DMzKd2DsT4AdfyZx2DslcwxY1twu/iiRTps
	AyB67kGJnLx5WpV4L7oIS3FzKn+oN8VEjG934SHa7MPJXZHcWyW++MQG5EvdoExjVN/wEm
	1o3I4irjoA6bnsYBSzPPJenH2Zj+3BJSV3GhX/sLzTMxEF2JPBTzWX1wOpQKAQ==
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
Subject: [PATCH v4 00/29] lan966x pci device: Add support for SFPs
Date: Wed, 15 Oct 2025 09:13:47 +0200
Message-ID: <20251015071420.1173068-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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
[0]. I just rebased them on top of v6.18-rc1 and added patch 2 in order
to take into account feedback received on the series sent by Saravana.

Those modification were not sufficient in our case and so, on top of
that, patches 4 to 7 fix some more issues related to fw_devlink.

Patches 8 to 13 introduce and use fw_devlink_set_device() in already
existing code.

Patches 14 and 15 are related also to fw_devlink but specific to PCI and
the device-tree nodes created during enumeration.

Patches 16, 17 and 18 are related fw_devlink too but specific to I2C
muxes. Patches purpose is to correctly set a link between an adapter
supplier and its consumer. Indeed, an i2c mux adapter's parent is not
the i2c mux supplier but the adapter the i2c mux is connected to. Adding
a new link between the adapter supplier involved when i2c muxes are used
avoid a freeze observed during device removal.

Patch 19 adds support for fw_delink on x86. fw_devlink is needed to have
the consumer/supplier relationship between devices in order to ensure a
correct device removal order. Adding fw_devlink support for x86 has been
tried in the past but was reverted [1] because it broke some systems.
Instead of enabling fw_devlink on *all* x86 system, enable it on *all*
x86 except on those where it leads to issue.

Patches 20 and 21 allow to build clock and i2c controller used by the
LAN966x PCI device when the LAN966x PCI device is enabled.

Patches 22 to 26 are specific to the LAN966x. They touch the current
dtso, split it in dtsi/dtso files, rename the dtso and improve the
driver to allow easier support for other boards.

The next patch (patch 27) update the LAN966x device-tree overlay itself
to have the SPF ports and devices they depends on described.

The last two patches (patches 28 and 29) sort the existing drivers in
the needed driver list available in the Kconfig help and add new drivers
in this list keep the list up to date with the devices described in the
device-tree overlay.

We believe some items from the above list can be merged separately, with
no build dependencies. We expect:

 - Patches 1 to 7 to be taken by driver core maintainers

 - Patches 8 to 13 to be taken by driver core maintainers

 - Patches 14 and 15 to be taken by driver core or PCI maintainers
  (depend on patch 8)

 - Patches 16 to 18 to be taken by I2C maintainers

 - Patch 19 to be taken by driver core or OF maintainers

 - Patch 20 to be taken by clock maintainers

 - Patch 21 to be taken by I2C maintainers

 - Patches 22 to 29 to be taken by misc maintainers

Once again, this series gives the big picture and can be split if
needed. Let me know.

[0] https://lore.kernel.org/lkml/20240411235623.1260061-1-saravanak@google.com/
[1] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/

Compare to previous iteration, this v4 series mainly:
 - Introduce simple-platform-bus driver instead of modifying the
   simple-bus driver (modifying the simple-bus driver could lead to
   regressions).
 - Use some device-tree properties to filter out x86 systems that do not
   support fw_devlink instead of using kconfig symbols.
 - Add '{Reviewed,Acked}-by'

Best regards,
Hervé

Changes:

v3 -> v4
  v3: https://lore.kernel.org/lkml/20250613134817.681832-1-herve.codina@bootlin.com/

  - Patch 1:
    No change

  - Patch 2:
    Update and fix conflicts. Indeed, since v3 iteration
    get_dev_from_fwnode() has been moved to device.h and used by
    pmdomain/core.c.

  - Patch 3:
    remove '#define get_device_from_fwnode()'

  - Patch 4:
    Fix conflict (rebase v6.17-rc6)
    Add 'Reviewed-by: Rafael J. Wysocki'
    Add 'Reviewed-by: Saravana Kannan'

  - Patch 5 (new in v4):
    Introduce simple-platform-bus (binding)

  - Patch 6 (5 in v3):
    Rework patch and introduce simple-platform-bus

  - Patch 7: (new)
    Use simple-platform-bus in LAN966x

  - Patch 8 (6 in v3):
    - No change

  - Patch 9 and 10 (7 and 8 in v3):
    Add 'Reviewed-by: Andy Shevchenko'

  - Patch 11 and 12 (9 and 10 in v3):
    Add 'Reviewed-by: Dave Jiang'

  - Patch 13 (11 in v3):
    Add 'Reviewed-by: Andy Shevchenko'

  - Patch 12 in v3:
    Patch removed.
    Adding __private tag in fwnode.dev is going to be handled in a
    dedicated series. Indeed a test robot reported an issue and more
    patches are needed (I have missed fwnode.dev users in several part
    in the kernel).

  - Patch 14 and 15 (13 and 14 in v3):
    No change

  - Patch 16 (14 in v3):
    Add 'Reviewed-by: Andi Shyti'

  - Patch 17 and 18 (16 and 17 in v3):
    No change

  - Patch 19 (18 in v3):
    Filter out support for fw_devlink on x86 based on some device-tree
    properties.
    Rewrite commit changelog
    Remove 'Reviewed-by: Andy Shevchenko' (significant modification)

  - Patch 20 (19 in v3):
    Add 'Acked-by: Stephen Boyd'

  - Patch 21 (20 in v3):
    Fix conflict (rebase v6.18-rc1)

  - Patches 22 to 24 (21 to 23 in v3):
    No change

  - Patch 25 (24 in v3):
    Fix conflict (rebase v6.18-rc1)
    Add 'Acked-by: Bjorn Helgaas'

  - Patches 26 to 29 (25 to 28 in v3):
    No change

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

Herve Codina (27):
  driver core: Rename get_dev_from_fwnode() wrapper to
    get_device_from_fwnode()
  driver core: Avoid warning when removing a device while its supplier
    is unbinding
  dt-bindings: bus: Add simple-platform-bus
  bus: Introduce simple-platorm-bus
  misc: lan966x_pci: Use simple-platform-bus
  driver core: fw_devlink: Introduce fw_devlink_set_device()
  drivers: core: Use fw_devlink_set_device()
  pinctrl: cs42l43: Use fw_devlink_set_device()
  cxl/test: Use device_set_node()
  cxl/test: Use fw_devlink_set_device()
  PCI: of: Use fw_devlink_set_device()
  PCI: of: Set fwnode device of newly created PCI device nodes
  PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge
    node
  i2c: core: Introduce i2c_get_adapter_physdev()
  i2c: mux: Set adapter physical device
  i2c: mux: Create missing devlink between mux and adapter physical
    device
  of: property: Allow fw_devlink device-tree on x86
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

 .../bindings/bus/simple-platform-bus.yaml     |  50 +++++
 MAINTAINERS                                   |   3 +-
 drivers/base/core.c                           |  99 +++++++---
 drivers/bus/imx-weim.c                        |   6 -
 drivers/bus/simple-pm-bus.c                   |  37 ++++
 drivers/clk/Kconfig                           |   2 +-
 drivers/i2c/busses/Kconfig                    |   2 +-
 drivers/i2c/i2c-core-base.c                   |  16 ++
 drivers/i2c/i2c-core-of.c                     |   5 -
 drivers/i2c/i2c-mux.c                         |  26 +++
 drivers/misc/Kconfig                          |  11 +-
 drivers/misc/Makefile                         |   2 +-
 drivers/misc/lan966x_evb_lan9662_nic.dtso     | 167 +++++++++++++++++
 drivers/misc/lan966x_pci.c                    |  30 ++-
 drivers/misc/lan966x_pci.dtsi                 | 172 +++++++++++++++++
 drivers/misc/lan966x_pci.dtso                 | 177 ------------------
 drivers/of/dynamic.c                          |   1 -
 drivers/of/overlay.c                          |  15 ++
 drivers/of/platform.c                         |   5 -
 drivers/of/property.c                         |  31 ++-
 drivers/pci/of.c                              |  10 +-
 drivers/pci/quirks.c                          |   2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c      |   2 +-
 drivers/pmdomain/core.c                       |   4 +-
 drivers/spi/spi.c                             |   5 -
 include/linux/device.h                        |   2 +-
 include/linux/fwnode.h                        |   7 +
 include/linux/i2c.h                           |   3 +
 include/linux/pci_ids.h                       |   1 +
 tools/testing/cxl/test/cxl.c                  |   4 +-
 30 files changed, 652 insertions(+), 245 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
 create mode 100644 drivers/misc/lan966x_evb_lan9662_nic.dtso
 create mode 100644 drivers/misc/lan966x_pci.dtsi
 delete mode 100644 drivers/misc/lan966x_pci.dtso

-- 
2.51.0


