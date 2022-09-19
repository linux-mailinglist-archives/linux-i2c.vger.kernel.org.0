Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73A65BD3D8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 19:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiISRgA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 13:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiISRfw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 13:35:52 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F1663AB0F;
        Mon, 19 Sep 2022 10:35:49 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 1550745125;
        Mon, 19 Sep 2022 18:56:19 +0200 (CEST)
From:   tumic@gpxsee.org
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 0/3] Digiteq Automotive MGB4 driver
Date:   Mon, 19 Sep 2022 20:55:53 +0200
Message-Id: <20220919185556.5215-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Hi,
This series of patches adds a driver for the Digiteq Automotive MGB4 grabber
card. MGB4 is a modular frame grabber PCIe card for automotive video interfaces
(FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
which already have drivers in linux are used in the design.

Except of the required xiic driver alias, the patches are split into two parts:
the XDMA driver and a "standard" v4l2 device driver. The XDMA driver is
originally based on Xilinx's sample code that can be found at:
https://github.com/Xilinx/dma_ip_drivers

The rest is a quite standard v4l2 driver, with one exception - there are
a lot of sysfs options that may/must be set before opening the v4l2 device
to adapt the card on a specific signal (see mgb4-sysfs.rst for details)
as the card must be able to work with various signal sources (or displays)
that can not be auto-detected.

I have run the driver through the v4l2-compliance test suite for both the
input and the output and the results look fine to me (I can provide the
output if required).

Changes in v2:
* Completely rewritten the original Xilinx's XDMA driver to meet kernel code
  standards.
* Added all required "to" and "cc" mail addresses.

Martin Tůma (3):
  Added platform module alias for the xiic I2C driver
  Added Xilinx XDMA IP core driver
  Added Digiteq Automotive MGB4 driver

 Documentation/admin-guide/media/mgb4-iio.rst  |   30 +
 Documentation/admin-guide/media/mgb4-mtd.rst  |   16 +
 .../admin-guide/media/mgb4-sysfs.rst          |  297 +++
 drivers/dma/Kconfig                           |    7 +
 drivers/dma/xilinx/Makefile                   |    1 +
 drivers/dma/xilinx/xilinx_xdma.c              | 2042 +++++++++++++++++
 drivers/i2c/busses/i2c-xiic.c                 |    1 +
 drivers/media/pci/Kconfig                     |    1 +
 drivers/media/pci/Makefile                    |    1 +
 drivers/media/pci/mgb4/Kconfig                |   17 +
 drivers/media/pci/mgb4/Makefile               |    6 +
 drivers/media/pci/mgb4/mgb4_cmt.c             |  243 ++
 drivers/media/pci/mgb4/mgb4_cmt.h             |   16 +
 drivers/media/pci/mgb4/mgb4_core.c            |  554 +++++
 drivers/media/pci/mgb4/mgb4_core.h            |   58 +
 drivers/media/pci/mgb4/mgb4_i2c.c             |  139 ++
 drivers/media/pci/mgb4/mgb4_i2c.h             |   35 +
 drivers/media/pci/mgb4/mgb4_io.h              |   36 +
 drivers/media/pci/mgb4/mgb4_regs.c            |   30 +
 drivers/media/pci/mgb4/mgb4_regs.h            |   35 +
 drivers/media/pci/mgb4/mgb4_sysfs.h           |   18 +
 drivers/media/pci/mgb4/mgb4_sysfs_in.c        |  750 ++++++
 drivers/media/pci/mgb4/mgb4_sysfs_out.c       |  734 ++++++
 drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |   83 +
 drivers/media/pci/mgb4/mgb4_trigger.c         |  202 ++
 drivers/media/pci/mgb4/mgb4_trigger.h         |    8 +
 drivers/media/pci/mgb4/mgb4_vin.c             |  656 ++++++
 drivers/media/pci/mgb4/mgb4_vin.h             |   64 +
 drivers/media/pci/mgb4/mgb4_vout.c            |  502 ++++
 drivers/media/pci/mgb4/mgb4_vout.h            |   58 +
 include/linux/dma/xilinx_xdma.h               |   44 +
 31 files changed, 6684 insertions(+)
 create mode 100644 Documentation/admin-guide/media/mgb4-iio.rst
 create mode 100644 Documentation/admin-guide/media/mgb4-mtd.rst
 create mode 100644 Documentation/admin-guide/media/mgb4-sysfs.rst
 create mode 100644 drivers/dma/xilinx/xilinx_xdma.c
 create mode 100644 drivers/media/pci/mgb4/Kconfig
 create mode 100644 drivers/media/pci/mgb4/Makefile
 create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
 create mode 100644 include/linux/dma/xilinx_xdma.h

-- 
2.37.2

