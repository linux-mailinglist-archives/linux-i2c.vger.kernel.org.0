Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112AA4D21F4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Mar 2022 20:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350087AbiCHTvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Mar 2022 14:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350081AbiCHTvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Mar 2022 14:51:21 -0500
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F7E3EB96;
        Tue,  8 Mar 2022 11:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUUHfkWG/qiG70YzNmZA+kjid3BjeFUoDIDQN6ur3nVFChL7qtjdLF5IpEp65p21HzPntNoaH+fZGa1qmt3oYM3TBMUcvQZ17X2GrOPnpukZqIUbbN1+oXWHkuQ1EeisM1KoP8nlRsjfomqDG+Uwjo+Zf7jnucAPmNxYeMzMx2Djyd00pOYAY1uOUl/MFGlFilplIkWjbX+xErCTJdD/zpvxc7T6RZQwfD057FrbNNEtafclTwlIbBbdM0dRrAXwHSocqEHDIllsCslW3VdRdmRVYqMEnLvhavI7xZjMqOPyd/aRP/Js54YltLMtoQK2Yh0zdqMokvNSDFB6asw7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BauGMmcFV6nOTP7nCHJQ9Dx/TSMt7p8NOwTZxAC0LBE=;
 b=CK4zbWR1PHkdIAY+iCzFECpPH9uJfHVtr4a4+eQ9I75S4BpImOf2MjFExTQFUw4jd+RX9IlTjn0ivlsF1Ygp3ZU875h1qpeoRgaBgYGopMvUlCCL1Hl8kaYFxSgCpQxYy/+fzr40FzCfBlu/itBTeWa/leyDIZ3MJQL5Cgf+8UnIR+M/2IZfqYU6fmG6uoPxsHwXHKG4JJ+ZkUxKt+fRjrogzRjAU+uou/oe5l6Pb71cfMNyMklGX5FiAMNrJcXwNFGS8Qz3nbeoI234au6cLSnefcpIfYutwq3C43v1h6C5Jv3PBOjaFZD7lEWotq/ttDQuxXInYnx7zBAEpj0Hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BauGMmcFV6nOTP7nCHJQ9Dx/TSMt7p8NOwTZxAC0LBE=;
 b=covDre2xQNqnSBOOXkFiaBQH55lY5rLvRK4KVgbg/8uCROl5iuzUwuCXRuRAMDuzKpalSyyvCadMD54Wq4BzSUHS0TwU0dAr1aXEzRd1pjZJuMeBO65Pt/kKUSPA7KmpRquUgTpikpezSOCU9HlVNs2NBTtbSspbCApp4ycDCoUjCk+lZW6AEeCamQxXnLxJz7e+aYY5JYAqqhkR5uUQrxLgKDh1R4t7CtWj8c8Gg7dJVw8AWwkeZYpBrVLxWd9yhDArqkD+t0fXoi30d+qV+pDJXcS2cTkRZL9suF4qpR+W42UVussKD+NtE4hP7RRQWcgjdah5BQcCgqHE6nPCaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by AM6PR10MB2902.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 19:50:20 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551%7]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 19:50:20 +0000
Date:   Tue, 8 Mar 2022 20:50:16 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v4 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::26) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34239209-7079-46c7-c4cb-08da013ce045
X-MS-TrafficTypeDiagnostic: AM6PR10MB2902:EE_
X-Microsoft-Antispam-PRVS: <AM6PR10MB2902614339348065812C823B85099@AM6PR10MB2902.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcOEEc7MxJXqhPx9ibzhVfGGL6EKXUIdFezZ7KtPx65GQ/QDx1BAic9pfIZdVyeK/9nyqv75VtwM0osUEekool2kXWTgeZDUyVAljIvatV/D4x7gcvus6W6NcDFavk9OLI7iZzbGwhGmpwEGQkdtcJ2Y6mBaxSZywcJ/hlDppWDaj8ozaSh3r/JF2Km+bN0diS3ta9FgwsIQOVBichPQfRwyfRw2mbOO8nkWrBULHTw5YYyKPEhPGrr59nn1VOKfn4ko+rfFr0RU9S8wH3WvMlP3Gftzlgfd/soFO7YlXaKzk7H/ziEH4arm+7UOtQ8TfJRSTT58RMbhaOsUr7/MrNfzmowplFZoBFOqwA3IQRx4jGCsiIOcBFKtxWoFmDC/LN7wiBCqbJyXDLMuJon32GfZd7Ujp27jbdFx4u0Tq3kQJ1MkrV/Fpwq1DXXF0uWRmwIjr+iyORueeCLNqXLeEYK7SJe0Y5OtKnG1wRDIEQ5PbpjyZmLplfqFHNxAG/m7TR2wL6w4vj3U6dcM1tOwuDyKsHkCrndAfeY5OfJDemeU9UcurXyNL528IrRfbpfOtrhLo9aQ1BWFlRa9/3Q1kujJky27hyr632gRvqMa0mImpQwejyw+5L1Mbm8Qbc7c8QUL3Y3yBJcbs4OJJNscjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(316002)(8676002)(44832011)(38100700002)(66946007)(66556008)(66476007)(5660300002)(7416002)(1076003)(86362001)(9686003)(6512007)(83380400001)(186003)(8936002)(6486002)(54906003)(6916009)(6666004)(6506007)(508600001)(82960400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OrgvmHROX9OOO2PWbeddvmmKo/iO+z4+IYaQFaV+/fFobIvS4Y3BREUfc2j6?=
 =?us-ascii?Q?tsZwZetYwyAQ4aK5hTNselt0mV0yC7TjZz9J7eTu4XYHkcCoc9M+o/d9V+6V?=
 =?us-ascii?Q?Avcc2rl/J2Q9IzzS5RWcwRit3gy0O9g797T+0t9o6hr4D6XEZnci2JKlhWI/?=
 =?us-ascii?Q?eg8h2aYDnkixHy+2BpOeiY/iDJ2QYx6yYmtxLKJ/MhifMEBRYZ3PM1JbjLQp?=
 =?us-ascii?Q?RCTkZDt/4Ga5LdMVFXLaTJ3ukNHGgMHoyTjXNE+CTx0jnUm3giQKyczUadjP?=
 =?us-ascii?Q?jhwO9uLM2Pzsv8mZ0njk5JnOxCnUWB6eJuvQKp6QMmGQjFihkIwrIAWmAFVg?=
 =?us-ascii?Q?w1FL9ThjFYnDycruMDP2v/rgA2qyfBYvFkLwcx51gSn18Ch+SluqRZAmBjvM?=
 =?us-ascii?Q?8WWIgV5RdSISdo4YiPHOp8f2V4xvDySm4Z+FZP2GLk11xLtnucKbpznx2b+F?=
 =?us-ascii?Q?NSe6f1fMX9gP7NxwWVl2t+3DYHnXU4UcvQXoltqXWCYoYh3PoPBsaqslnuKK?=
 =?us-ascii?Q?CyYyo2u/E1AOzy1m4jR78bRpfmMh+DSoy4vMr1Ny7SmqKpp0atOu5LZ8C0t3?=
 =?us-ascii?Q?WMXFBqNmV6yhdQ70waXcRJEydqdl1Bn5gGFIyKB0zxKga4bafVpNzZdWR1y5?=
 =?us-ascii?Q?rL4EolU87lscWTn0wbRmQqCv58jZraFJYAjek23wVATlnt8Oh3ETTamDf2wb?=
 =?us-ascii?Q?mJ+eV13fi4OE3SoyjOlCwKosKYOsW2PDxjZu8Qkw+91O/d66CGngV9mPOCU/?=
 =?us-ascii?Q?ZC9jrPNT65OkahpU9NqSbSMBixk5ZwtBLbkdmmpVBpkx6SJ7hpyuHVH/lc1S?=
 =?us-ascii?Q?CjIsSYPHdZG7+MT35avdwjyLYwBcv+bXkk+g15kRcIZNagkeN9FNzGal+aQE?=
 =?us-ascii?Q?kKDcE+wJozG3xeGdCs2CkfJlI9vcQxhkhSEoo+q1CIx1oQgN1KtzOIVRBCj3?=
 =?us-ascii?Q?f5jyH1oB06DKAUEpdn/qD/V18CB5Yl+7eHlGd1HWFJXHOJdRwQ4/djTYVPDq?=
 =?us-ascii?Q?O6ST0/KbDwBkxDpe+LH0tE13kOZDb3hgRHL/R/XLzCfNNN0fL9A55DWN0CyC?=
 =?us-ascii?Q?hooW7eTMKeqxkhK2QdLw9bpWav+Zpgaf8RQ8YSIFQYel4rj7IjaLY2wATBOf?=
 =?us-ascii?Q?RtAFAsXZNzuYRKzRo2jEvxRcVIbm55SEnuvzsLnZBFvl6C1agBfTU5vFvTLD?=
 =?us-ascii?Q?M/Eyrx0g2bCaaJZSnkEiW2HvR5GiU14HmL9fhbbiv3IDjS/eJkeTuI9km/sa?=
 =?us-ascii?Q?X0fHP9uk2bT/uhTpVy1mq96uOMEALkcIZyR9cTMviH0fATGEN7tJ3qQGSOWG?=
 =?us-ascii?Q?OEkS7xmDBOAV8xMX/upptn3fb4k7HCEInyBBLEHlYChgjEomLfiReeBGvSww?=
 =?us-ascii?Q?QXicy+fwsxoJnAjoR3Otw7UH7hSQLP10UsRSvkdKHrfzr7faFoQOviRsYePY?=
 =?us-ascii?Q?3Lawm6/3nD5SFziE9469wnJdHEh7bscqKzmX7Q1i3hAnnkFRtPIO2vwV6ld0?=
 =?us-ascii?Q?dT1+qzpolKlAhl2PYuYV360NN5e/RMKjYIao4wI84NUIWdrP9hXLybumKVuS?=
 =?us-ascii?Q?+HGndhF/R1XZGvu4MO0+Y5YOm63mBTw4Oq5O3U2wcs/QEaMr5meyge2JnLvw?=
 =?us-ascii?Q?gX1bXJSDNjizFBC5zFnLcF7DoOm0sOyRo3d43+Kts0WtY7d2p+Wmgw7fIsP9?=
 =?us-ascii?Q?Hf7FbdM+TQh7znekrhNF7HRA1r8xMlOiNWU+SrxNkoElfesd/BlsnSqKdJsF?=
 =?us-ascii?Q?e4gZenp6GA=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34239209-7079-46c7-c4cb-08da013ce045
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:50:20.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pGmGufhXnxRXz2Gz9K1hTmfZ5q1rTS2PN66NpijRCcrvWjowK4HWhgUvoRvehxbH8X1qmZ2TfHByDk1lUn3ulX8fY0XGmsc0tHWba6d72Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2902
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 31 Jan 2022 17:13:38 +0200
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> There are a few users and at least one more is coming (*) that would
> like to utilize P2SB mechanism of hiding and unhiding a device from
> the PCI configuration space.
> 
> Here is the series to consolidate p2sb handling code for existing
> users and provide a generic way for new comer(s).
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that bring the helper ("platform/x86/intel: Add Primary
> to Sideband (P2SB) bridge support") has a commit message that
> sheds a light on what the P2SB is and why this is needed.
> 
> The changes made in v2 do not change the main idea and the
> functionality in a big scale. What we need is probably one more
> (RE-)test done by Henning. I hope to have it merged to v5.18-rc1 that
> Siemens can develop their changes based on this series.

I did test this series and it works as expected. Only problem is that
the leds driver will not work together with the pinctrl. Because two
"in tree drivers" will try to reserve the same memory region when both
are enabled. Who wins is a matter of probing order ...

If you can take my changes into your series we will not have a problem.
Otherwise we might need to create sort of a conflict which my series
would revert when switching apl lake to gpio.

I would not know the process, let us see what the reviews bring and how
to continue here.

Thanks so much for taking care, especially the pinctrl coming up
without ACPI really improves the simatic leds on the apl lake.

In fact i will have to double check if i really need the p2sb for the
427E wdt ... but until i have an answer, p2sb works just fine.

regards,
Henning

> I have tested this on Apollo Lake platform (I'm able to see SPI NOR
> and since we have an ACPI device for GPIO I do not see any attempts
> to recreate one).
> 
> *) One in this series, and one is a due after merge in the Simatic
> IPC drivers
> 
> The series may be routed either via MFD (and I guess Lee would prefer
> that) or via PDx86, whichever seems better for you, folks. As of
> today patches are ACKed by the respective maintainers, but I2C one
> and one of the MFD.
> 
> Wolfram, can you ACK the patch against i2c-i801 driver, if you have no
> objections?
> 
> Changes in v4:
> - added tag to the entire series (Hans)
> - added tag to pin control patch (Mika)
> - dropped PCI core changes (PCI core doesn't want modifications to be
> made)
> - as a consequence of the above merged necessary bits into p2sb.c
> - added a check that p2sb is really hidden (Hans)
> - added EDAC patches (reviewed by maintainer internally)
> 
> Changes in v3:
> - resent with cover letter
> 
> Changes in v2:
> - added parentheses around bus in macros (Joe)
> - added tag (Jean)
> - fixed indentation and wrapping in the header (Christoph)
> - moved out of PCI realm to PDx86 as the best common denominator
> (Bjorn)
> - added a verbose commit message to explain P2SB thingy (Bjorn)
> - converted first parameter from pci_dev to pci_bus
> - made first two parameters (bus and devfn) optional (Henning, Lee)
> - added Intel pin control patch to the series (Henning, Mika)
> - fixed English style in the commit message of one of MFD patch (Lee)
> - added tags to my MFD LPC ICH patches (Lee)
> - used consistently (c) (Lee)
> - made indexing for MFD cell and resource arrays (Lee)
> - fixed the resource size in i801 (Jean)
> 
> Andy Shevchenko (6):
>   pinctrl: intel: Check against matching data instead of ACPI
> companion mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
>   mfd: lpc_ich: Switch to generic p2sb_bar()
>   i2c: i801: convert to use common P2SB accessor
>   EDAC, pnd2: Use proper I/O accessors and address space annotation
>   EDAC, pnd2: convert to use common P2SB accessor
> 
> Jonathan Yong (1):
>   platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
> 
> Tan Jui Nee (1):
>   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> 
>  drivers/edac/Kconfig                   |   1 +
>  drivers/edac/pnd2_edac.c               |  62 ++---
>  drivers/i2c/busses/Kconfig             |   1 +
>  drivers/i2c/busses/i2c-i801.c          |  39 +---
>  drivers/mfd/Kconfig                    |   1 +
>  drivers/mfd/lpc_ich.c                  | 136 +++++++++--
>  drivers/pinctrl/intel/pinctrl-intel.c  |  14 +-
>  drivers/platform/x86/intel/Kconfig     |  12 +
>  drivers/platform/x86/intel/Makefile    |   1 +
>  drivers/platform/x86/intel/p2sb.c      | 305
> +++++++++++++++++++++++++ include/linux/platform_data/x86/p2sb.h |
> 27 +++ 11 files changed, 500 insertions(+), 99 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/p2sb.c
>  create mode 100644 include/linux/platform_data/x86/p2sb.h
> 

