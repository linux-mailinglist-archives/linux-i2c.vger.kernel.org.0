Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D461B7110C2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235784AbjEYQTM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 12:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjEYQTJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:19:09 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A1C1A6;
        Thu, 25 May 2023 09:19:04 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QRtRL5x2sz6J71t;
        Fri, 26 May 2023 00:14:22 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 25 May
 2023 17:18:59 +0100
Date:   Thu, 25 May 2023 17:18:55 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>,
        <linux-acpi@vger.kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        "Matt Johnston" <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        <linux-cxl@vger.kernel.org>,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: Re: [RFC PATCH 0/6] i2c: Enabling use of aspeed-i2c with ACPI
Message-ID: <20230525171844.00004e8b@huawei.com>
In-Reply-To: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 25 May 2023 16:21:57 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> From the school of dirty hacks we do to prove something works, enable
> work to proceed elsewhere:
> 
> MCTP over I2C from ACPI emulated hosts (both x86 and ARM64).
> 
> The first 4 patches might be suitable for upstream inclusion, the
> last two not - though I hope we can move to Niyas' work on ACPI clock
> management once that is ready.
> 
> Why do this crazy thing?
> 
> Ultimately we want a standards based way to use the CXL Fabric Management
> API FM-API. In real systems that is likely to be driven from a separate
> 'host' such as a BMC, but for test purposes it is convenient to be able
> to do that from an QEMU emulated machine that is also capable of using
> the CXL kernel stack.
> 
> That CXL kernel stack is currently ACPI only (and people care about
> x86 for some reason). One of the defined interfaces over which FM-API
> commands can be issued is MCTP.
> 
> The kernel MCTP stack has upstream drivers for MCTP over I2C.
> Upstream QEMU emulates the Aspeed I2C controller with the necessary
> two way support. There are patches on list adding the MCTP parts
> https://lore.kernel.org/qemu-devel/20230425063540.46143-2-its@irrelevant.dk/
> and I've ported an earlier CXL FMAPI EP emulator over to that.
> 
> ACPI has a 'magic' HID of PRP0001 which allows the use of a device tree binding
> (mostly) with an ACPI DSDT entry.  A suitable chunk is something like
> 
> (dumped from a working x86 setup)
> 
>     Device (MCTP)
>     {
>         Name (_HID, "PRP0001")  // _HID: Hardware ID
>         Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
>         {
>             ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
>             Package (0x03)
>             {
>                 Package (0x02)
>                 {
>                      "compatible",
>                      "aspeed,ast2600-i2c-bus"
>                 },
>                 Package (0x02)
>                 {
>                     "bus-frequency",
>                     0x00061A80
>                 },
>                 Package (0x02)
>                 {
>                     "mctp-controller",
>                     One
>                 }
>             }
>         })
>         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>         {
>             QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
>                 0x0000000000000000, // Granularity
>                 0x00000004800FC080, // Range Minimum
>                 0x00000004800FC0FF, // Range Maximum
>                 0x0000000000000000, // Translation Offset
>                 0x0000000000000080, // Length
>                 ,, , AddressRangeMemory, TypeStatic)
>             Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
>             {
>                 0x00000007,
>             }
>         })
>     }
>     Device (MCTS)
>     {
>         Name (_HID, "PRP0001")  // _HID: Hardware ID
>         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>         {
>             I2cSerialBusV2 (0x0050, DeviceInitiated, 0x000186A0,
>                 AddressingMode7Bit, "\\_SB.MCTP",
>                 0x00, ResourceProducer, , Exclusive,
>                 )
>         })
>         Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
>         {
>             ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
>             Package (0x01)
>             {
>                 Package (0x02)
>                 {
>                     "compatible",
>                     "mctp-i2c-controller"
>                 }
>             }
>         })
>     }
> 
> QEMU patches will follow soon and will include documentation on
> how to actually poke this to do something useful. I'll post a reply
> to this with the link when posted.

https://lore.kernel.org/linux-cxl/20230525160859.32517-1-Jonathan.Cameron@huawei.com/T/#t
https://gitlab.com/jic23/qemu cxl-2023-05-25

> 
> Cc: Niyas Sait <niyas.sait@linaro.org>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jeremy Kerr <jk@codeconstruct.com.au>
> Cc: Matt Johnston <matt@codeconstruct.com.au>
> Cc: Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>
> 
> Jonathan Cameron (6):
>   i2c: acpi: set slave mode flag
>   i2c: aspeed: Use platform_get_irq() instead of opencoding
>   i2c: aspeed: switch to generic fw properties.
>   i2c: aspeed: Set the fwnode for the adap->dev
>   HACK: i2c: aspeed: Comment the clock and reset out.
>   HACK: i2c: aspeed: Enable build without COMPILE_TEST
> 
>  drivers/i2c/busses/Kconfig      |  1 -
>  drivers/i2c/busses/i2c-aspeed.c | 36 ++++++++++++++++-----------------
>  drivers/i2c/i2c-core-acpi.c     |  3 +++
>  3 files changed, 20 insertions(+), 20 deletions(-)
> 
> 
> base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6

