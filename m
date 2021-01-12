Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3732F23F0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 01:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbhALA2r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 19:28:47 -0500
Received: from mga17.intel.com ([192.55.52.151]:51763 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727892AbhALA2h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 19:28:37 -0500
IronPort-SDR: xetvEMBDZnkGNHgxVq/rR9oUmYE8eOr3KzyUSof9O+1aF77wZBbsGsNskxRWunMFGj5X5PzPcN
 hvkKMYj+RhDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157735948"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="157735948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 16:26:50 -0800
IronPort-SDR: EJU6EsyN0GHXXDNCtpRUB5+w6QCkymJDvspVoFoGCcejFiK+Picwn2jeNT8pbmd0uAqO/YyYNp
 2EwLuPDqlxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="348273482"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2021 16:26:50 -0800
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
Subject: [PATCH v2 0/4] i2c: aspeed: Add buffer and DMA modes support
Date:   Mon, 11 Jan 2021 16:37:45 -0800
Message-Id: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds buffer mode and DMA mode transfer support for the
Aspeed I2C driver. With this change, default transfer mode will be set to
buffer mode for better performance, and DMA mode can be selectively used
depends on platform configuration.

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

Changes since v1:
V1: https://lore.kernel.org/linux-arm-kernel/20191007231313.4700-1-jae.hyun.yoo@linux.intel.com/
- Removed a bug fix patch which was merged already from this patch series. 
- Removed buffer reg settings from default device tree and added the settings
  into bindings document to show the predefined buffer range per each bus.
- Updated commit message and comments.
- Refined driver code using abstract functions.

Jae Hyun Yoo (4):
  dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
  ARM: dts: aspeed: modify I2C node to support buffer mode
  i2c: aspeed: add buffer mode transfer support
  i2c: aspeed: add DMA mode transfer support

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 126 +++-
 arch/arm/boot/dts/aspeed-g4.dtsi              |  19 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |  19 +-
 drivers/i2c/busses/i2c-aspeed.c               | 553 ++++++++++++++++--
 4 files changed, 667 insertions(+), 50 deletions(-)

-- 
2.17.1

