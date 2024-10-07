Return-Path: <linux-i2c+bounces-7236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B69992332
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 05:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B9F1F228FE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 03:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F7641A8F;
	Mon,  7 Oct 2024 03:52:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794FA3A8F0;
	Mon,  7 Oct 2024 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728273159; cv=none; b=fw2RT5sXuQKIPoy9/q3CIlaIDaUPn+q41QJrjLgeK59iDLlLGhMTYFx5QzRQHHjtsXUxeyn96LIpmF7rugVJVxMv5annwv2IfHObXsCdJs+KOrkA8kNdzyWEXTwTYxGTI9Lud0E3Rf7fvImmdnrb6I4KP6wwojyth5F2D2eHp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728273159; c=relaxed/simple;
	bh=L6CKKiz34rGAdgPNbpi0rBbu5qefpMBeBbhmPQSAt1U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LFqP8QsR/hJg2x/jTGvrxKmE3HooOyZ40Ai/i2qO32Im9pz9fLVEMOaSCvLnLDs8FbzrtDA186vTWwZ729Jb7uz8lNVEbXNjMVB8/o2qXdLH06f51uTL2tOL3z2G65kcS1W6vyGPjVJlXKwgBbWxx/xYGz12C5dTKtqDUKLcl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 11:52:35 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 11:52:35 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<ryan_chen@aspeedtech.com>
Subject: [PATCH v15 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Date: Mon, 7 Oct 2024 11:52:32 +0800
Message-ID: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
is new register set that have new clock divider option for more flexiable
generation. And also have separate i2c controller and target register
set for control, patch #2 is i2c controller driver only, patch #3 is add
i2c target mode driver.

The legacy register layout is mix controller/target register control
together. The following is add more detail description about new register
layout. And new feature set add for register.

-Add new clock divider option for more flexible and accurate clock rate
generation -Add tCKHighMin timing to guarantee SCL high pulse width.
-Add support dual pool buffer mode, split 32 bytes pool buffer of each
device into 2 x 16 bytes for Tx and Rx individually.
-Increase DMA buffer size to 4096 bytes and support byte alignment.
-Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
-Re-define registers for separating controller and target mode control.
-Support 4 individual DMA buffers for controller Tx and Rx,
target Tx and Rx.

And following is new register set for package transfer sequence.
-New Master operation mode:
 S -> Aw -> P
 S -> Aw -> TxD -> P
 S -> Ar -> RxD -> P
 S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
-Bus SDA lock auto-release capability for new controller DMA command mode.
-Bus auto timeout for new controller/target DMA mode.

The following is two versus register layout.
Old:
{I2CD00}: Function Control Register
{I2CD04}: Clock and AC Timing Control Register
{I2CD08}: Clock and AC Timing Control Register
{I2CD0C}: Interrupt Control Register
{I2CD10}: Interrupt Status Register
{I2CD14}: Command/Status Register
{I2CD18}: Slave Device Address Register
{I2CD1C}: Pool Buffer Control Register
{I2CD20}: Transmit/Receive Byte Buffer Register
{I2CD24}: DMA Mode Buffer Address Register
{I2CD28}: DMA Transfer Length Register
{I2CD2C}: Original DMA Mode Buffer Address Setting
{I2CD30}: Original DMA Transfer Length Setting and Final Status

New Register mode
{I2CC00}: Master/Slave Function Control Register
{I2CC04}: Master/Slave Clock and AC Timing Control Register
{I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
{I2CC0C}: Master/Slave Pool Buffer Control Register
{I2CM10}: Master Interrupt Control Register
{I2CM14}: Master Interrupt Status Register
{I2CM18}: Master Command/Status Register
{I2CM1C}: Master DMA Buffer Length Register
{I2CS20}: Slave~ Interrupt Control Register
{I2CS24}: Slave~ Interrupt Status Register
{I2CS28}: Slave~ Command/Status Register
{I2CS2C}: Slave~ DMA Buffer Length Register
{I2CM30}: Master DMA Mode Tx Buffer Base Address
{I2CM34}: Master DMA Mode Rx Buffer Base Address
{I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
{I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
{I2CS40}: Slave Device Address Register
{I2CM48}: Master DMA Length Status Register
{I2CS4C}: Slave  DMA Length Status Register
{I2CC50}: Current DMA Operating Address Status
{I2CC54}: Current DMA Operating Length  Status

aspeed,global-regs:
This global register is needed, global register is setting for
new clock divide control, and new register set control.

ASPEED SOC chip is server product, i2c bus may have fingerprint
connect to another board. And also support hotplug.
The following is board-specific design example.
Board A                                       Board B
-------------------------                     ------------------------
|i2c bus#1(controller/target)<=fingerprint=>i2c bus#x (controller/target)|
|i2c bus#2(controller)-> tmp i2c device |     |                          |
|i2c bus#3(controller)-> adc i2c device |     |                          |
-------------------------                     ------------------------

i2c-scl-clk-low-timeout-us:
For example I2C controller as slave mode, and suddenly disconnected.
Slave state machine will keep waiting for controller clock in for rx/tx
transmit. So it need timeout setting to enable timeout unlock controller
state. And in another side. In Master side also need avoid suddenly
slave miss(un-plug), Master will timeout and release the SDA/SCL.

aspeed,enable-dma:
For example The bus#1 have trunk data needed for transfer,
it can enable bus dma mode transfer, it can reduce cpu utilized.
Others bus bus#2/3 use defautl buffer mode.

v15:
-i2c-ast2600.c
 -add include unaligned.h
 -rename all master -> controller, slave -> target.
 -keep multi-master to align property.
 -remove no used element in ast2600_i2c_bus.
v14:
-aspeed,i2c.yaml
 -v13 change people reviewed-by tag, v14 fixed to original people tag,
modify to Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 -struct ast2600_i2c_bus layout optimal.
 -ast2600_select_i2c_clock refine.
 -ast2600_i2c_recover_bus overridden fix.
 -dma_mapping_error() returned error code shadowed modify.
 -buffer register in a 4-byte aligned simplified
 -remove smbus alert

v13:
 -separate i2c master and slave driver to be two patchs.
 -modify include header list, add bits.h include. remove of*.h
 -modify (((x) >> 24) & GENMASK(5, 0)) to (((x) & GENMASK(29, 24)) >> 24)
 -modify ast2600_select_i2c_clock function implement.
 -modify ast2600_i2c_recover_bus function u32 claim to
u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);

v12:
-aspeed,i2c.yaml
 -add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-i2c-ast2600.c
 -update include by alphabetical order
 -make just a one TAB and put the last two lines on the single one
 -remove no used timing_table structre
 -remove enum explicit assinment
 -rewritten to avoid this and using loop in ast2600_select_i2c_clock
 -use GENMASK for most 0xffff
 -remove too many parentheses
 -use str_read_write replace read write string
 -remove redundant blank line after ast2600_i2c_bus_of_table
 -fix wrong multi-line style of the comment
 -use macro for i2c standard speeds
 -remove useless noise dev_info

v11:
-aspeed,i2c.yaml
 -no change, the same with v10.
-i2c-ast2600.c
 -modify alert_enable from int -> boolean.
 -modify dbg string recovery -> recover.
 -remove no need to init 0.
 -remove new line after break.
 -remove unneeded empty line.
 -modify dma_alloc_coherent to dmam_alloc_coherent
 -modify probe nomem return dev_err_probe
 -modify i2c_add_adapter to devm_i2c_adapter
 -modify checkpatch: Alignment should match open parenthesis
 -modify checkpatch: braces {} should be used on all arms of this statement
 -modify checkpatch: Unbalanced braces around else statement

v10:
-aspeed,i2c.yaml
 -move unevaluatedProperties after allOf.
 -remove extra one blank line.
-i2c-ast2600.c
 -no change, the same with v8.

v9:
-aspeed,i2c.yaml
 -backoff to v7.
  -no fix typo in maintainer's name and email. this would be another patch.
  -no remove address-cells, size-cells, this would be another patch.
 -use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 -fix allOf and else false properties for aspeed,ast2600-i2cv2.
-i2c-ast2600.c
 -no change, the same with v8

v8:
-aspeed,i2c.yaml
 -modify commit message.
  -Fix typo in maintainer's name and email.
 -remove address-cells, size-cells.
-i2c-ast2600.c
 -move "i2c timeout counter" comment description before property_read.
 -remove redundant code "return ret" in probe end.

v7:
-aspeed,i2c.yaml
 -Update ASPEED I2C maintainers email.
 -use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 -fix allOf and else false properties for aspeed,ast2600-i2cv2.
-i2c-ast2600.c
 -remove aspeed,xfer-mode instead of aspeed,enable-dma mode. buffer mode
is default.
 -remove aspeed,timeout instead of i2c-scl-clk-low-timeout-us for
timeout setting.

v6:
-remove aspeed,i2cv2.yaml, merge to aspeed,i2c.yaml -add support for
 i2cv2 properites.
-i2c-ast2600.c
 -fix ast2600_i2c_remove ordering.
 -remove ast2600_i2c_probe goto labels, and add dev_err_probe -remove
  redundant deb_dbg debug message.
 -rename gr_regmap -> global_regs

v5:
-remove ast2600-i2c-global.yaml, i2c-ast2600-global.c.
-i2c-ast2600.c
 -remove legacy clock divide, all go for new clock divide.
 -remove duplicated read isr.
 -remove no used driver match
 -fix probe return for each labels return.
 -global use mfd driver, driver use phandle to regmap read/write.
-rename aspeed,i2c-ast2600.yaml to aspeed,i2cv2.yaml -remove bus-frequency.
-add required aspeed,gr
-add timeout, byte-mode, buff-mode properites.

v4:
-fix i2c-ast2600.c driver buffer mode use single buffer conflit in
 master slave mode both enable.
-fix kmemleak issue when use dma mode.
-fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
-fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml

v3:
-fix i2c global clock divide default value.
-remove i2c slave no used dev_dbg info.

v2:
-add i2c global ymal file commit.
-rename file name from new to ast2600.
 aspeed-i2c-new-global.c -> i2c-ast2600-global.c
 aspeed-i2c-new-global.h -> i2c-ast2600-global.h
 i2c-new-aspeed.c -> i2c-ast2600.c
-rename all driver function name to ast2600.
Ryan Chen (3):
  dt-bindings: i2c: aspeed: support for AST2600-i2cv2
  i2c: aspeed: support AST2600 i2c new register mode driver
  i2c: aspeed: support AST2600 i2c new register target mode driver

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |   51 +-
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600.c              | 1553 +++++++++++++++++
 4 files changed, 1613 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1


