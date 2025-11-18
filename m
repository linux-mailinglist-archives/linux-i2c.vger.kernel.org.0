Return-Path: <linux-i2c+bounces-14124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B86BAC66DB1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 02:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 69EE029606
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 01:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6A82FF677;
	Tue, 18 Nov 2025 01:40:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FB26C3BE;
	Tue, 18 Nov 2025 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763430040; cv=none; b=kFcVIT9MLGiv4f60mXQ0GN25zUU9EzJkJdxCg5ztRfSDgMcnhWwuka0XXy8tuIzAuE9uESw1a9pLnclwikHHIcwvDcCpwV9hS7fzh0hj4UkWQUdRpx91t9CWZ/cHXGORqc42NI1iv2oFof4pkUo30uX0BxJHuMJgirdZHvTIGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763430040; c=relaxed/simple;
	bh=gtaAzeTVOQUxA0+efY1mKX75znyUdiJI7x9d0GURFm0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NgrLb0H7YB/GP1HiTMmWzwzvKoMO3KWiv2wrCT58Tvggu9PjauVpAHr4vt8TcZ6amW14RKlWiVKSChMHIYDfUvnniFVtZ1fQpBTInctmELckxtulm2disSyFa0hSWSL9ZlRYyz5fMV77GAH3iC+0a9rFST9tC7vqOrj/qXsH5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Nov
 2025 09:40:34 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 18 Nov 2025 09:40:34 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<andriy.shevchenko@linux.intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <jk@codeconstruct.com.au>,
	<andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v24 0/4] Add ASPEED AST2600 I2C controller driver
Date: Tue, 18 Nov 2025 09:40:30 +0800
Message-ID: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series add AST2600 i2c new register set driver.
The i2c driver is new register set that have new clock divider option
for more flexiable generation. And also have separate i2c controller
and target register set for control, patch #2 is i2c controller driver
only, patch #3 is add i2c target mode driver.

The legacy register layout is mix controller/target register control
together. The following is add more detail description about new register
layout. And new feature set add for register.

v24:
- aspeed,ast2600-i2c.yaml
 - fix make dt_binding_check blank warning.

v23:
- update typo patch (1/4) commit message.
- aspeed,ast2600-i2c.yaml
 - update reg and description.
- i2c-ast2600.c controller
 - replace ast2600_select_i2c_clock to ast2600_i2c_ac_timing_config.
- i2c-ast2600.c target
 - I2C_TARGET_MSG_BUF_SIZE 256 to 4096
 - remove blank line.
 - refine Master comment description to controller

v22:
- update patch (1/4) commit message add dts example reason.
- aspeed,ast2600-i2c.yaml @patch (1/4)
 - rename ast2600-i2c.yaml to aspeed,ast2600-i2c.yaml.
 - update reg, clock-frequency description.
- aspeed,ast2600-i2c.yaml @patch (2/4)
 - aspeed,transfer-mode, aspeed,transfer-mode add for ast2600.
- i2c-aspeed-core.c,h @patch (3/4)
 - add i2c-aspeed-core allow both old and new device trees using the
   same compatible string "aspeed,ast2600-i2c-bus".
 
v21:
- update patch (1/4) commit message
- i2c-ast2600.c
 - move rst to local variable in ast2600_i2c_probe().
 
v20:
- ast2600-i2c.yaml
 - fix warning at make dt_binding_check.

v19:
- Split AST2600 binding into its own YAML file
 - Removed `aspeed,ast2600-i2c-bus` from `aspeed,i2c.yaml`
 - Added `aspeed,global-regs` and `aspeed,transfer-mode` to AST2600 binding

v18:
- refine patch (1/3) commit message (reason for commit not list.)
- i2c-ast2600.c
 - remove redundant reset_control_deassert in driver probe.
 - remove reset_control_assert(i2c_bus->rst) in driver remove.

v17:
- move i2c new mode register and feature into driver commit message.
- aspeed,i2c.yaml
 - remove multi-master properties.
 - use aspeed,transfer-mode properties for aspeed,enable-byte/enable-dma.
-i2c-ast2600.c
 - rename dma_safe_buf to controller_dma_safe_buf.
 - fix ast2600_i2c_recover_bus return overflow warnings.
 - add ast2600_i2c_target_packet_buff_irq unhandle case.
 - add parameter "cmd" in ast2600_i2c_setup_dma_rx,
   ast2600_i2c_setup_buff_rx, ast2600_i2c_setup_byte_rx
 - use reset_control_deassert replace
   devm_reset_control_get_shared_deasserted.
 - useaspeed,transfer-mode properties for transfer mode setting.
 - change compatible = "aspeed,ast2600-i2cv2" to "aspeed,ast2600-i2c-bus".

v16:
- aspeed,i2c.yaml: add aspeed,enable-byte properties for force byte mode.
- i2c-ast2600.c
 - change include asm/unaligned.h to linux/unaligned.h.
 - add reset timeout councter when slave active timeout.
 - modify issue i2c_recovery_bus before slave re-enable.
 - add aspeed,enable-byte properties.

v15:
- i2c-ast2600.c
 - add include unaligned.h
 - rename all master -> controller, slave -> target.
 - keep multi-master to align property.
 - remove no used element in ast2600_i2c_bus.

v14:
- aspeed,i2c.yaml
 - v13 change people reviewed-by tag, v14 fixed to original people tag,
   modify to Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - struct ast2600_i2c_bus layout optimal.
 - ast2600_select_i2c_clock refine.
 - ast2600_i2c_recover_bus overridden fix.
 - dma_mapping_error() returned error code shadowed modify.
 - buffer register in a 4-byte aligned simplified
 - remove smbus alert

v13:
 - separate i2c master and slave driver to be two patchs.
 - modify include header list, add bits.h include. remove of*.h
 - modify (((x) >> 24) & GENMASK(5, 0)) to (((x) & GENMASK(29, 24)) >> 24)
 - modify ast2600_select_i2c_clock function implement.
 - modify ast2600_i2c_recover_bus function u32 claim to
   u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);

v12:
- aspeed,i2c.yaml
 - add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- i2c-ast2600.c
 - update include by alphabetical order
 - make just a one TAB and put the last two lines on the single one
 - remove no used timing_table structre
 - remove enum explicit assinment
 - rewritten to avoid this and using loop in ast2600_select_i2c_clock
 - use GENMASK for most 0xffff
 - remove too many parentheses
 - use str_read_write replace read write string
 - remove redundant blank line after ast2600_i2c_bus_of_table
 - fix wrong multi-line style of the comment
 - use macro for i2c standard speeds
 - remove useless noise dev_info

v11:
- aspeed,i2c.yaml
 - no change, the same with v10.
- i2c-ast2600.c
 - modify alert_enable from int -> boolean.
 - modify dbg string recovery -> recover.
 - remove no need to init 0.
 - remove new line after break.
 - remove unneeded empty line.
 - modify dma_alloc_coherent to dmam_alloc_coherent
 - modify probe nomem return dev_err_probe
 - modify i2c_add_adapter to devm_i2c_adapter
 - modify checkpatch: Alignment should match open parenthesis
 - modify checkpatch: braces {} should be used on all arms of this statement
 - modify checkpatch: Unbalanced braces around else statement

v10:
- aspeed,i2c.yaml
 - move unevaluatedProperties after allOf.
 - remove extra one blank line.
- i2c-ast2600.c
 - no change, the same with v8.

v9:
- aspeed,i2c.yaml
 - backoff to v7.
  - no fix typo in maintainer's name and email. this would be another patch.
  - no remove address-cells, size-cells, this would be another patch.
 - use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 - fix allOf and else false properties for aspeed,ast2600-i2cv2.
- i2c-ast2600.c
 - no change, the same with v8

v8:
- aspeed,i2c.yaml
 - modify commit message.
 - Fix typo in maintainer's name and email.
 - remove address-cells, size-cells.
- i2c-ast2600.c
 - move "i2c timeout counter" comment description before property_read.
 - remove redundant code "return ret" in probe end.

v7:
- aspeed,i2c.yaml
 - Update ASPEED I2C maintainers email.
 - use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 - fix allOf and else false properties for aspeed,ast2600-i2cv2.
- i2c-ast2600.c
 - remove aspeed,xfer-mode instead of aspeed,enable-dma mode. buffer mode
   is default.
 - remove aspeed,timeout instead of i2c-scl-clk-low-timeout-us for
   timeout setting.

v6:
- remove aspeed,i2cv2.yaml, merge to aspeed,i2c.yaml -add support for
  i2cv2 properites.
- i2c-ast2600.c
 - fix ast2600_i2c_remove ordering.
 - remove ast2600_i2c_probe goto labels, and add dev_err_probe -remove
   redundant deb_dbg debug message.
 - rename gr_regmap -> global_regs

v5:
- remove ast2600-i2c-global.yaml, i2c-ast2600-global.c.
- i2c-ast2600.c
 - remove legacy clock divide, all go for new clock divide.
 - remove duplicated read isr.
 - remove no used driver match
 - fix probe return for each labels return.
 - global use mfd driver, driver use phandle to regmap read/write.
- rename aspeed,i2c-ast2600.yaml to aspeed,i2cv2.yaml -remove bus-frequency.
- add required aspeed,gr
- add timeout, byte-mode, buff-mode properites.

v4:
- fix i2c-ast2600.c driver buffer mode use single buffer conflit in
  master slave mode both enable.
- fix kmemleak issue when use dma mode.
- fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
- fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml

v3:
- fix i2c global clock divide default value.
- remove i2c slave no used dev_dbg info.

v2:
- add i2c global ymal file commit.
- rename file name from new to ast2600.
  aspeed-i2c-new-global.c -> i2c-ast2600-global.c
  aspeed-i2c-new-global.h -> i2c-ast2600-global.h
  i2c-new-aspeed.c -> i2c-ast2600.c
- rename all driver function name to ast2600.

Ryan Chen (4):
  dt-bindings: i2c: Split AST2600 binding into a new YAML
  dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs and transfer-mode
    properties
  i2c: ast2600: Add controller driver for new register layout
  i2c: ast2600: Add target mode support

 .../bindings/i2c/aspeed,ast2600-i2c.yaml      |   94 +
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |    3 +-
 drivers/i2c/busses/Makefile                   |    2 +-
 drivers/i2c/busses/i2c-aspeed-core.c          |   89 +
 drivers/i2c/busses/i2c-aspeed-core.h          |   19 +
 drivers/i2c/busses/i2c-aspeed.c               |   43 +-
 drivers/i2c/busses/i2c-ast2600.c              | 1577 +++++++++++++++++
 7 files changed, 1790 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-aspeed-core.c
 create mode 100644 drivers/i2c/busses/i2c-aspeed-core.h
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1


