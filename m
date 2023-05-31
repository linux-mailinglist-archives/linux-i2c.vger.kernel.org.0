Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A19717CC9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbjEaKGH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 06:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjEaKGG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 06:06:06 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E72110B;
        Wed, 31 May 2023 03:06:01 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWPsn2Fscz6J7dw;
        Wed, 31 May 2023 18:01:01 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 11:05:58 +0100
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
Subject: [RFC PATCH v3 0/7] i2c: Enabling use of aspeed-i2c with ACPI
Date:   Wed, 31 May 2023 11:05:53 +0100
Message-ID: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

v3:
 - More improvements from Andy, called out in the individual patches.

Obviously I am sending this much quicker than would normally make sense.

Whilst Andy was kind enough to provide review I never really expected
anyone to look at these in depth, I just needed them public so I could
tell people to use them. However I don't want to loose the improvements
from Andy's review.

Hence still RFC though if people like the first 6 patches, they may be
worth picking up anyway.

I'm planning to forget about these entirely for a few weeks at least
and work on the other parts of the stack this enables and a general
huge backlog of things I've been ignoring.

From the school of dirty hacks we do to prove something works, enable
work to proceed elsewhere:

MCTP over I2C from ACPI emulated hosts (both x86 and ARM64).

The first 6 patches might be suitable for upstream inclusion, the
last one - though I hope we can move to Niyas' work on ACPI clock
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

Jonathan Cameron (7):
  i2c: acpi: set slave mode flag
  i2c: aspeed: Use platform_get_irq() instead of opencoding
  i2c: aspeed: Don't report error when optional dt bus-frequency not
    supplied
  i2c: aspeed: use a function pointer type def for clk_reg_val callback
  i2c: aspeed: switch to generic fw properties.
  i2c: aspeed: Set the fwnode for the adap->dev
  HACK: i2c: aspeed: Comment clock out and make reset optional

 drivers/i2c/busses/i2c-aspeed.c | 48 +++++++++++++++------------------
 drivers/i2c/i2c-core-acpi.c     |  3 +++
 2 files changed, 25 insertions(+), 26 deletions(-)

-- 
2.39.2

