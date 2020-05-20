Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA6C1DAF67
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 11:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgETJwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 05:52:41 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:49178 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726650AbgETJwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 05:52:40 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 04K9pZjj016025;
        Wed, 20 May 2020 12:51:35 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id E12D3639C0; Wed, 20 May 2020 12:51:34 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        andriy.shevchenko@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH v11 0/3] i2c: npcm7xx: add NPCM i2c controller driver
Date:   Wed, 20 May 2020 12:51:10 +0300
Message-Id: <20200520095113.185414-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch set adds i2c controller support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

NPCM7xx includes 16 I2C controllers. This driver operates the controller.
This module also includes a slave mode.

---
v11 -> v10:
	- Fix according to maintainer comments.
	- Init clk simplified.
	- Comments in c99
	- Split master irq function.
	- debugfs not mandatory.
	- yaml file fix.

v10 -> v9:
	- Fix according to maintainer comments.
	- binding file changed to yaml format.
	- Shorten recovery flow.
	- Add support for health monitoring counters.

v9 -> v8:
	- Fix according to maintainer comments.
	- Split lines of iowrite..(ioread..) to separate lines.
	- Use readx_poll_timeout_atomic
	- resolve various style issues.
	 
v8 -> v7:
	- Split to two commits, one for master, one for slave.
	- Rename smb to i2c.
	- Remove global vars.

v7 -> v6:
	- Rebased on Linux 5.4-rc8  (was Linux 5.4-rc7).
	- Fix issue found by kbuild test robot (redundant include).
	- Note: left a warning related to fall through. This fall through is
	  intentional.
	
v6 -> v5:
	- Update documentation

v5 -> v4:
	- support recovery
	- master-slave switch support needed for IPMB

v4 -> v3:
	- typo on cover letter.

v3 -> v2:
	- fix dt binding: compatible name: omit "bus"

v2 -> v1:
	- run check patch in strict mode.
	- use linux crc.
	- define regs in constant offset without base.
	- remove debug prints.
	- no declarations for local functions.
	
v1: initial version

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>

---
Tali Perry (3):
  dt-bindings: i2c: npcm7xx: add NPCM I2C controller documentation
  i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
  i2c: npcm7xx: Add support for slave mode for Nuvoton NPCM BMC I2C
    controller driver.

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |   62 +
 drivers/i2c/busses/Kconfig                    |    9 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c              | 2480 +++++++++++++++++
 4 files changed, 2552 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c


base-commit: b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
-- 
2.22.0

