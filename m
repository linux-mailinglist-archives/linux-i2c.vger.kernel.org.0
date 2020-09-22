Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD08E274C72
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIVWty (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:49:54 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48123 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726662AbgIVWty (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:49:54 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from kblaiech@mellanox.com)
        with SMTP; 23 Sep 2020 01:49:49 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 08MMnmtG017246;
        Tue, 22 Sep 2020 18:49:48 -0400
Received: (from kblaiech@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 08MMnlSi019584;
        Tue, 22 Sep 2020 18:49:47 -0400
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v11 0/2] i2c: add driver for Mellanox BlueField SoC
Date:   Tue, 22 Sep 2020 18:49:36 -0400
Message-Id: <cover.1600804577.git.kblaiech@mellanox.com>
X-Mailer: git-send-email 2.1.2
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Khalil Blaiech <kblaiech@mellanox.com>


Add I2C SMBus driver and device tree bindings documentation.

The Mellanox BlueField is a System-on-Chip (SoC) that combines
Arm cores and ConnectX network adapter technology intended to
accelerate storage network solutions. The Mellanox BlueField
incorporates various I2C devices that are accessed using SMBus
protocol, a variant of the I2C protocol. On storage controllers,
the BlueField SoC is connected to a management controller board,
e.g., BMC via an I2C bus.

An I2C driver running on the Arm side is needed to manage the
hardware I2C controllers. The driver enables a master function
to transfer data back and forth from/to I2C devices, such as
EEPROM parts and implements a slave function to handle the BMC
controller requests.
---
v10->v11:
	- Fixing checkpatch (--strict) warnings.
	- Fixing sparse warnings.
v9->v10:
	- Fixing compile issue when building with gcc 9.3.0
	and Werror enabled; remove unused variable in
	mlxbf_slave_enable().
v8->v9:
	- Fixing implicit declaration of devm_ioremap_nocache
	and ioremap_nocache build error.
v7->v8:
	- Updating the dependency expression in Kconfig.
	- Fixing an implicit fallthrough build error.
v6->v7:
	- Fixing kernel coding style issues as suggested by
	Mellanox internal code reviewers.
	- Updating the dependency expression in Kconfig.
	- Fixing various device driver bugs.
	- Adding an entry to MAINTAINERS file.
v5->v6:
	- Fixing kernel coding style issues detected using
	'--strict' flag.
	- Updating the device binding documentation to add
	support for BlueField-2 SoCs.
v4->v5:
	- Fixing device driver bug.
v3->v4:
	- Review of the device binding documentation to
	fix format issue and miscellaneous cleanup.
v2->v3:
	- Various device driver changes and bug fixes.
	- Updating the device property in the device binding
	documentation and file format review.
v1->v2:
	- Various device driver changes and bug fixes.
	- Cleanup of the device binding documentation.

Khalil Blaiech (2):
  i2c: i2c-mlxbf: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   42 +
 MAINTAINERS                                        |    6 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlxbf.c                     | 2506 ++++++++++++++++++++
 5 files changed, 2568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlxbf.c

-- 
2.1.2

