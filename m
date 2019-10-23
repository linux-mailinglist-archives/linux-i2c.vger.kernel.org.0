Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC349E2644
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 00:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407771AbfJWWPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 18:15:01 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53304 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405661AbfJWWPB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 18:15:01 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from kblaiech@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Oct 2019 00:14:53 +0200
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x9NMEqVN019139;
        Wed, 23 Oct 2019 18:14:52 -0400
Received: (from kblaiech@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x9NMEpJ8006255;
        Wed, 23 Oct 2019 18:14:51 -0400
From:   Khalil Blaiech <kblaiech@mellanox.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh@kernel.org>,
        David Woods <dwoods@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org,
        arm-soc <arm@kernel.org>
Subject: [PATCH v6 0/2] i2c: added driver for Mellanox BlueField SoC
Date:   Wed, 23 Oct 2019 18:14:40 -0400
Message-Id: <cover.1571868492.git.kblaiech@mellanox.com>
X-Mailer: git-send-email 2.1.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added I2C SMBus driver and device tree bindings documentation.

Changes since v5:

* Device bindings documentation:

  - Added description of an extra resource to be consistent
    with new BlueField-2 SoCs.
  - Added an additional example of device instance.

* Driver source code:

  - Fix generic Kernel coding issues.
  - Fix coding style issues detected through --strict flag.
  - Update SPDX identifier and module license.
  - Cleanup driver code.

Khalil Blaiech (2):
  i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   42 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlx.c                       | 2568 ++++++++++++++++++++
 4 files changed, 2624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

-- 
2.1.2

