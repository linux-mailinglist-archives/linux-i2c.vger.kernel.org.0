Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4EA10281E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 16:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfKSPbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 10:31:31 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:45085 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727505AbfKSPbb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Nov 2019 10:31:31 -0500
X-Greylist: delayed 2349 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Nov 2019 10:31:29 EST
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xAJEoAiI005890;
        Tue, 19 Nov 2019 16:50:10 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id F0B8D60328; Tue, 19 Nov 2019 16:50:09 +0200 (IST)
From:   Tali Perry <tali.perry1@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        mark.rutland@arm.com, tali.perry1@gmail.com, robh@kernel.org,
        wsa@the-dreams.de, jdelvare@suse.de, jarkko.nikula@linux.intel.com,
        geert@linux-m68k.org, arnd@arndb.de, max@enpas.org,
        krzysztof.adamski@nokia.com, syniurge@gmail.com, puwen@hygon.cn,
        jfi@ssv-embedded.de, sr@denx.de, mchehab+samsung@kernel.org,
        kdasu.kdev@gmail.com, enric.balletbo@collabora.com,
        baolin.wang@linaro.org, ludovic.desroches@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] i2c: npcm7xx: new driver for I2C controller
Date:   Tue, 19 Nov 2019 16:49:28 +0200
Message-Id: <20191119144930.227241-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Nuvoton NPCM7XX I2C Controller
NPCM7xx includes 16 I2C controllers. This driver operates the controller.
This module also includes a slave mode.

---
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

---
Tali Perry (2):
  dt-bindings: i2c: npcm7xx: * add binding for i2c controller
  i2c: npcm7xx:

 .../devicetree/bindings/i2c/i2c-npcm7xx.txt   |   29 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c              | 2486 +++++++++++++++++
 4 files changed, 2527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

-- 
2.22.0

