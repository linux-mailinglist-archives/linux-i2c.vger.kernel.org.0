Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AF231D00E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 19:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhBPSQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 13:16:58 -0500
Received: from mga06.intel.com ([134.134.136.31]:16470 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhBPSQ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 13:16:57 -0500
IronPort-SDR: iMJ7zl6/2a4ys8OiYHIhQVNReliFpPxXVlnuJRGxCNzR6L5EL1KTI7G9Wno4oXWLmiSg8QH9Bg
 vfVkx5hwfPwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="244445772"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="244445772"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 10:15:24 -0800
IronPort-SDR: 6pXYhCqPaIaxYtx0EOvaa965LEVjcd9ChuE5ozGOVd9YHcYUTUo89x5JgR4Yw+JjW759Ra+Xl5
 tvtzLGj8ukpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="493375887"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2021 10:15:23 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 0/4] i2c: aspeed: Add buffer and DMA modes support
Date:   Tue, 16 Feb 2021 10:27:31 -0800
Message-Id: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds buffer mode and DMA mode transfer support for the
Aspeed I2C driver. With this change, buffer mode and DMA mode can be
selectively used depend on platform configuration.

* Buffer mode
  AST2400:
    It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
    0x1e78a800 to 0x1e78afff that can be used for all busses with
    buffer pool manipulation. To simplify implementation for supporting
    both AST2400 and AST2500, it assigns each 128 Bytes per bus without
    using buffer pool manipulation so total 1792 Bytes of I2C SRAM
    buffer will be used.

  AST2500:
    It has 16 Bytes of individual I2C SRAM buffer per each bus and its
    range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
    page selection' bit field in the Function control register, and
    neither 'base address pointer' bit field in the Pool buffer control
    register it has. To simplify implementation for supporting both
    AST2400 and AST2500, it writes zeros on those register bit fields
    but it's okay because it does nothing in AST2500.

  AST2600:
    It has 32 Bytes of individual I2C SRAM buffer per each bus and its
    range is from 0x1e78ac00 to 0x1e78adff. Works just like AST2500
    does.

* DMA mode
  Only AST2500 and later versions support DMA mode under some limitations
  in case of AST2500:
    I2C is sharing the DMA H/W with UHCI host controller and MCTP
    controller. Since those controllers operate with DMA mode only, I2C
    has to use buffer mode or byte mode instead if one of those
    controllers is enabled. Also make sure that if SD/eMMC or Port80
    snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
    use DMA mode.

Please review it.

Changes since v2:
- Added SRAM resources back to default dtsi and added a mode selection
  property.
- Refined SoC family dependent xfer mode configuration functions.

Changes since v1:
V1: https://lore.kernel.org/linux-arm-kernel/20191007231313.4700-1-jae.hyun.yoo@linux.intel.com/
- Removed a bug fix patch which was merged already from this patch series. 
- Removed buffer reg settings from default device tree and added the settings
  into bindings document to show the predefined buffer range per each bus.
- Updated commit message and comments.
- Refined driver code using abstract functions.

Jae Hyun Yoo (4):
  dt-bindings: i2c: aspeed: add transfer mode support
  ARM: dts: aspeed: modify I2C node to support buffer mode
  i2c: aspeed: add buffer mode transfer support
  i2c: aspeed: add DMA mode transfer support

 .../devicetree/bindings/i2c/i2c-aspeed.txt    |  37 +-
 arch/arm/boot/dts/aspeed-g4.dtsi              |  47 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |  47 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |  32 +-
 drivers/i2c/busses/i2c-aspeed.c               | 637 ++++++++++++++++--
 5 files changed, 684 insertions(+), 116 deletions(-)

-- 
2.17.1

