Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89EC6E085A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjDMH4f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 03:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjDMH4e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 03:56:34 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75481469E;
        Thu, 13 Apr 2023 00:56:32 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 33D7bXbY096962;
        Thu, 13 Apr 2023 15:37:33 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Apr
 2023 15:53:30 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "Phil Edworthy" <phil.edworthy@renesas.com>,
        <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/2 RESEND] Add ASPEED AST2600 I2Cv2 controller driver
Date:   Thu, 13 Apr 2023 15:53:25 +0800
Message-ID: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33D7bXbY096962
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
is new register set that have new clock divider option for more
flexiable generation. And also have separate i2c master and slave register
set for control.

The legacy register layout is mix master/slave register control together.
The following is add more detail description about new register layout.
And new feature set add for register.

-Add new clock divider option for more flexible and accurate clock rate
generation -Add tCKHighMin timing to guarantee SCL high pulse width.
-Add support dual pool buffer mode, split 32 bytes pool buffer of each
device into 2 x 16 bytes for Tx and Rx individually.
-Increase DMA buffer size to 4096 bytes and support byte alignment.
-Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
-Re-define registers for separating master and slave mode control.
-Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.

And following is new register set for package transfer sequence.
-New Master operation mode:
 S -> Aw -> P
 S -> Aw -> TxD -> P
 S -> Ar -> RxD -> P
 S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
-Bus SDA lock auto-release capability for new master DMA command mode.
-Bus auto timeout for new master/slave DMA mode.

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
Board A                                         Board B
-------------------------                       ------------------------
|i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
|i2c bus#2(master)-> tmp i2c device |          |                       |
|i2c bus#3(master)-> adc i2c device |          |                       |
-------------------------                       ------------------------

i2c-scl-clk-low-timeout-us:
For example I2C controller as slave mode, and suddenly disconnected.
Slave state machine will keep waiting for master clock in for rx/tx
transmit. So it need timeout setting to enable timeout unlock controller
state. And in another side. In Master side also need avoid suddenly
slave miss(un-plug), Master will timeout and release the SDA/SCL.

aspeed,enable-dma:
For example The bus#1 have trunk data needed for transfer,
it can enable bus dma mode transfer, it can reduce cpu utilized.
Others bus bus#2/3 use defautl buffer mode.

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

Ryan Chen (2):
  dt-bindings: i2c: aspeed: support for AST2600-i2cv2
  i2c: aspeed: support ast2600 i2c new register mode driver

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |   52 +-
 MAINTAINERS                                   |    9 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600.c              | 1602 +++++++++++++++++
 5 files changed, 1672 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1

