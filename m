Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A46710F64
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 17:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241754AbjEYPWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 11:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241309AbjEYPWM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 11:22:12 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB796195;
        Thu, 25 May 2023 08:22:06 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QRsFM0W2Pz67fLC;
        Thu, 25 May 2023 23:20:39 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:22:03 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>,
        <linux-acpi@vger.kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: [RFC PATCH 0/6] i2c: Enabling use of aspeed-i2c with ACPI
Date:   Thu, 25 May 2023 16:21:57 +0100
Message-ID: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From the school of dirty hacks we do to prove something works, enable
work to proceed elsewhere:

MCTP over I2C from ACPI emulated hosts (both x86 and ARM64).

The first 4 patches might be suitable for upstream inclusion, the
last two not - though I hope we can move to Niyas' work on ACPI clock
management once that is ready.

Why do this crazy thing?

Ultimately we want a standards based way to use the CXL Fabric Management
API FM-API. In real systems that is likely to be driven from a separate
'host' such as a BMC, but for test purposes it is convenient to be able
to do that from an QEMU emulated machine that is also capable of using
the CXL kernel stack.

That CXL kernel stack is currently ACPI only (and people care about
x86 for some reason). One of the defined interfaces over which FM-API
commands can be issued is MCTP.

The kernel MCTP stack has upstream drivers for MCTP over I2C.
Upstream QEMU emulates the Aspeed I2C controller with the necessary
two way support. There are patches on list adding the MCTP parts
https://lore.kernel.org/qemu-devel/20230425063540.46143-2-its@irrelevant.dk/
and I've ported an earlier CXL FMAPI EP emulator over to that.

ACPI has a 'magic' HID of PRP0001 which allows the use of a device tree binding
(mostly) with an ACPI DSDT entry.  A suitable chunk is something like

(dumped from a working x86 setup)

    Device (MCTP)
    {
        Name (_HID, "PRP0001")  // _HID: Hardware ID
        Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
        {
            ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
            Package (0x03)
            {
                Package (0x02)
                {
                     "compatible",
                     "aspeed,ast2600-i2c-bus"
                },
                Package (0x02)
                {
                    "bus-frequency",
                    0x00061A80
                },
                Package (0x02)
                {
                    "mctp-controller",
                    One
                }
            }
        })
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                0x0000000000000000, // Granularity
                0x00000004800FC080, // Range Minimum
                0x00000004800FC0FF, // Range Maximum
                0x0000000000000000, // Translation Offset
                0x0000000000000080, // Length
                ,, , AddressRangeMemory, TypeStatic)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x00000007,
            }
        })
    }
    Device (MCTS)
    {
        Name (_HID, "PRP0001")  // _HID: Hardware ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            I2cSerialBusV2 (0x0050, DeviceInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.MCTP",
                0x00, ResourceProducer, , Exclusive,
                )
        })
        Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
        {
            ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
            Package (0x01)
            {
                Package (0x02)
                {
                    "compatible",
                    "mctp-i2c-controller"
                }
            }
        })
    }

QEMU patches will follow soon and will include documentation on
how to actually poke this to do something useful. I'll post a reply
to this with the link when posted.

Cc: Niyas Sait <niyas.sait@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>
Cc: Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>

Jonathan Cameron (6):
  i2c: acpi: set slave mode flag
  i2c: aspeed: Use platform_get_irq() instead of opencoding
  i2c: aspeed: switch to generic fw properties.
  i2c: aspeed: Set the fwnode for the adap->dev
  HACK: i2c: aspeed: Comment the clock and reset out.
  HACK: i2c: aspeed: Enable build without COMPILE_TEST

 drivers/i2c/busses/Kconfig      |  1 -
 drivers/i2c/busses/i2c-aspeed.c | 36 ++++++++++++++++-----------------
 drivers/i2c/i2c-core-acpi.c     |  3 +++
 3 files changed, 20 insertions(+), 20 deletions(-)


base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
-- 
2.39.2

