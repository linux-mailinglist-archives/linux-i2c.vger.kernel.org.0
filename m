Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E351E4EE0
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 22:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387589AbgE0UKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 16:10:05 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:49760 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387486AbgE0UKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 16:10:05 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 04RK91F9011491;
        Wed, 27 May 2020 23:09:01 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id B3F42639C0; Wed, 27 May 2020 23:09:01 +0300 (IDT)
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
Subject: [PATCH v14 0/3] i2c: npcm7xx: add NPCM i2c controller driver
Date:   Wed, 27 May 2020 23:08:17 +0300
Message-Id: <20200527200820.47359-1-tali.perry1@gmail.com>
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
v14 -> v13:
	- Fix yaml example: add missing include.
	- Replace all udelay to usleep_range, except one which is called from
	  irq.
	- Fix compilation error (module_platfrom_init conflict).
	- debugfs counters always updated. Counting till max value,
	  then stop counting.
	- Rename bus-frequency to clock-frequency.
	- Remove unused variables.
v13 -> v12:
	- Fix yaml example. Issue found by an updated dt_binding_check.
	- remove double spacing. indentation issues.
	- remove ifdef DEBUG_FS around __init and __exit.
	- debugfs and counters are always present in bus struct.
	- Fix npcm_i2c_write_fifo_slave flow.
	- Remove version number.
v12 -> v11:
	- Fix according to maintainer comments.
	- debugfs simplified (usedebugfs_create_u64).
	- slave read fifo split from master read fifo.
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-npcm7xx.c              | 2342 +++++++++++++++++
 4 files changed, 2414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c


base-commit: b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
-- 
2.22.0

