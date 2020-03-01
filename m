Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5301750E0
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 00:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgCAXJI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Mar 2020 18:09:08 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:38554 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726050AbgCAXJH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Mar 2020 18:09:07 -0500
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 021MWW0r010909;
        Mon, 2 Mar 2020 00:32:32 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id 61FA36032E; Mon,  2 Mar 2020 00:32:32 +0200 (IST)
From:   Tali Perry <tali.perry1@gmail.com>
To:     brendanhiggins@google.com, avifishman70@gmail.com,
        tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        wsa@the-dreams.de, andriy.shevchenko@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH v8 0/3] i2c: npcm: add NPCM i2c controller driver
Date:   Mon,  2 Mar 2020 00:31:58 +0200
Message-Id: <20200301223201.185450-1-tali.perry1@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reported-by: kbuild test robot <lkp@intel.com>

---
Tali Perry (3):
  dt-bindings: i2c: npcm7xx: add NPCM I2C controller documentation
  i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
  i2c: npcm7xx: Add support for slave mode for Nuvoton NPCM BMC I2C
    controller driver.

 .../devicetree/bindings/i2c/i2c-npcm7xx.txt   |   29 +
 drivers/i2c/busses/Kconfig                    |    9 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c              | 2490 +++++++++++++++++
 4 files changed, 2529 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c


base-commit: af42d3466bdc8f39806b26f593604fdc54140bcb
-- 
2.22.0

