Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48C4D052F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 18:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbiCGR2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 12:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239259AbiCGR2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 12:28:45 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64E02251C;
        Mon,  7 Mar 2022 09:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUFnU+KsaEQyOYOxa50PcdcigK1VRmKoDJqgt7b7knVdaZAhhW3ZOmv0S9Z6+UO5u6rR3rdjYv2E+j6pvcOUOXTJYs37pUu/9EInQckXoUIMxVrWvYaibLHmteDIjzv/z5kfsYNZC5rtu8p3gFZn+XHjeyh6FYKzwWuMgePP6JdUg5GUqrD8JH96GeMVtHFjZ4ywvvgQRFqA4AoQz/OZy5kdJBZHKoMMfRUqb/FxxL+bA/q12p1GGeWddsWtr6rMG9FdSHHushqJUdbdHX6h7b3nov4mg0IeePejkB9JNB1K64A6TvCx2/Ljgw4xFPCSVEpKQ0t0+LWaIxS6qI9eqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgJY0fKefCFYKRI7bk1w274tk/w2DcZqkzct3PQ2Xsw=;
 b=NpU06qdGwM94aa0zD0VZCC0+gUmoys37bkCEqd3iv68GGb+bAYoBhJGuvcsXPKoS+YiCmaXWzmF9zEV5PF4qc5GJLXi8OpL3hjE1ZvX3iHcXPlPtrKmkpVlIlNtIHY+2Dpb549Wda3c2ACKAEApOQoUnsbUPV1EYIJakAxbble5o6D0QzuNJpH6Ok+UmhUiU6moD7eZGu9FPBy7OTyqktXZuanABSnNJNIsKvZSA5lgOU3Ex7tg7tqO7dPex40tbPzsbN7KnBpgJVEXfhCbJWRobWTZrP7/VV9j4Y2KD/gh9LHBvyqlvNahz1Mo0g/2CfVYHXxhv3DND5DfdHnRI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgJY0fKefCFYKRI7bk1w274tk/w2DcZqkzct3PQ2Xsw=;
 b=KeqItT6V+JqhDAIoL2RWDSQ0iw5EGuHRIWMZx6F6UxE1J1zOuZGZEGvlffHXndcvw/QdSNFMMJkhNNic/g86HuSlF0axbGvoYiqfi78Ea+Wr46dDXzVs7Vt1Q0VxWBpDADd0bfvFYwVts/tR79VN+PJPPrpLSAcy8GMg5MUpoUbma4MXWeNRpj4sXUlWptwfs2X4bf/n99adchSU8Spx7rV6icFtfJ1L9a8XishYNivTGhvBa95BqN3IADVguDrqU5pBnG4OFHEFIYxZCpRWLtFErAXPszmHMxIwDk1gV1vjWoUKx427qLm5a8LWjBs05ukb7MlhlHSmZ/lVqguTiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by DB8PR10MB3658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 17:27:45 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:27:45 +0000
Date:   Mon, 7 Mar 2022 18:27:40 +0100
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
Message-ID: <20220307182740.78ad0a75@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0096.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::37) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c47d59a9-26af-4930-44ce-08da005fcae9
X-MS-TrafficTypeDiagnostic: DB8PR10MB3658:EE_
X-Microsoft-Antispam-PRVS: <DB8PR10MB365891356D448A0B1EB5C88D85089@DB8PR10MB3658.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vv0Zu8dQNUQirRb4KUrpdRhnZS1NshSEHbWjSaH6ZKqNlP3FHCuxleIT2BWDQQnpQqcxrA3ld1AQTolXOowjRMVyNvUWPiIgwEotGyfnP7nf23R3itPZEe2dGoL0t3n9GDdnjogFRiggpeJA7EPirDJ1PSf8hukgmeIKyWasL+Kbvc7kWn777ntSsMVkj2uRshAAe8DC/N1LvqCD00n73L3R5lhIATjUJukHNfpf17gBWTddMq25HEJkdxYj3iV+5H3jhnyRhwh9Qe+sMqOsVCneNhItj11hSdSFMKyKPA6IOB3sZAYWPtXb0u8l6ali+Ip4i6bnRPzqQUSZzWoi5qUp0McCRN4cGrvHE3YAFpEHu6vel2z4ShmE4PHCHil0nYlOPZaZ3NESsfSNGUUALxPewOoE9OerUIxNN8jSQEqsb9DyPo93JHWh08Zvt2LJh+DDCF/KVXHQTj/ggW0JE06qtNow9FfI7CbVif+6SorGf9JeawcJLam9yObgpM6keZUdrJixSDzcV04zKI6LFhundAmzG9HnU3RSZXsKO9Lo4f8i3/GPWIGlgJCcML6IBKxUJzpIVMUWE0SCF4V2IQIfpAY2yNoG443RN9RsfL1RbIfZogEq1SLCYfRpTYxiw2iYok1bNFkJsNIXK60beg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(9686003)(66476007)(66946007)(54906003)(1076003)(6506007)(186003)(26005)(6666004)(86362001)(83380400001)(6916009)(7416002)(44832011)(4326008)(8676002)(6486002)(5660300002)(8936002)(2906002)(82960400001)(316002)(508600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?efe1VJrTk9IziE9/DXcRNuu1aCWgIaXArYF75eMldoCRATN4KHFx1Dy/m24W?=
 =?us-ascii?Q?ZfSsGeNq1c852u7nRiEODlntzKgMOyYF/x7XYOqfWn6rxT56vO4H6e1WjiUZ?=
 =?us-ascii?Q?sCxaQpjQga8TSN8prsUV3Hl15DN/ztmt0z4PkzLIdXeVPkq3aZmGxYeu0WQE?=
 =?us-ascii?Q?tDeoWnDpayRptEP+u1mutD01Ytf2eU49Oe2u5GgrYdArrZzBSABt8J3VTqlX?=
 =?us-ascii?Q?mQm/YIBT9l6GL09/QrpikM9a+m6RrKY0HhJvbivROcCUd/1PUCXI1IZtAhkX?=
 =?us-ascii?Q?JyPA93EtFzKMRewFz6srr3V4WsKI0SUAdl6C2VCQiY/jDto2q2xvm2bvTdeS?=
 =?us-ascii?Q?ZCGuvg9Arv75Dq4m2HkkAgOHhafXJ5KA/sqP2Agz41DcEdDgls9uCqonldpg?=
 =?us-ascii?Q?/Dx+83RsXNaivFIsZlelyDjwXLkuE+ik+4/pDylxW9JmJr9K1ya4sFBR9mwG?=
 =?us-ascii?Q?kB1AckS55bP43wfPp52mkJUQgmuEtr/fMAqT0ULC4+A0/EyjbBJL0pY1Eeqg?=
 =?us-ascii?Q?NGtVHLF6pDbnplv7BxGyuPHCakvEnzmUncqKjcxHNiATCwCSEf29jb8CgNpY?=
 =?us-ascii?Q?ggo7YTS48pEa4ezkUYsLiLHtlBOqPwVdPAswaDvy4iAhRvF+PbA+VrFbr2a3?=
 =?us-ascii?Q?xQu1/8HVYIjmqiLZEU28rgzN+w5aBt2nS6lx4Njsv7pjaFXLQpyysgkXaiCl?=
 =?us-ascii?Q?zoxwaiuqoZ4ye2b6uyA9FYYwG4TdDV9HtgSIzB0o9R6eJM/5BvSYTv7xUj/Z?=
 =?us-ascii?Q?83LNq3wEdEvevTEOEEswFwBlR17S0YiNrJrusUYjFEi2YNO1ob8v91iNgBzQ?=
 =?us-ascii?Q?A0rVOu1GoBtr7e5XJQ296fb+IwXoiFegrOANfVT2wpzCCZZWSJ+6GdFBpRS7?=
 =?us-ascii?Q?Mn5VsXBiXV+Y6eC9qNWWeaTBTo0cmWhP48K6LzmCiYaJIrZFgL7y62nPou27?=
 =?us-ascii?Q?cN3W0LpqCUByQfYndOMa56FVIIC4AR0jdYmclJVreyv82XCgoGInuvzVXOL5?=
 =?us-ascii?Q?uVVJrabNWH0ZRK2gzKOQGT6nw66fuKxU3qNLj9dyOoXs/SkZtY3s6A2u8Iwa?=
 =?us-ascii?Q?bw2Asm0GCI4e05tWmixPv4NqWgIXoK/mf6j7PACCUtAo7n5EwXQVYXhQxTvl?=
 =?us-ascii?Q?lTYZFuc0lYpa9hNekNl9WjCpFovA8OCkkpaQqQXRzJ73C35ttZGGkshKA/vI?=
 =?us-ascii?Q?vdbZsPoWXZAPnp+W/8jcmOEE3wbskJTDTUaTqoab6M4yt+VtF2KYj/y06vZK?=
 =?us-ascii?Q?esgNC9ipthto6ufp33fB6Lp41yXCbBwcP6e6u5grvvmQq4DPdqCGufhHBIEy?=
 =?us-ascii?Q?oBadK9zMQwAa+oTNPg5OuDBO3EtwC5vbTrS9mzH7yn/RNnKDjgvTuYy/5hHw?=
 =?us-ascii?Q?l8E4+n/Xhz4+iQSzT9JpwgPUB8UiW33vcG8Nfj+yIx2xWEL7ZviVfKML43kf?=
 =?us-ascii?Q?9bLd96Cwlr+k6OOVG3yff2jhJZy59/5+1BtcTF+mBBdOTHfWerwBzhNJgRE5?=
 =?us-ascii?Q?IfwechTkXDEDb/o4F2JUl/DpkQgYSASEEIocZS1B/CcYne0e6YF7NT6zNIWu?=
 =?us-ascii?Q?peBONYLtCq0/tR9qaKxAxMBZUqZe+8J4ipD3WY/vyQ2TXGL9FjMTNMzUiEeJ?=
 =?us-ascii?Q?neWsxcg5T58skf10Fj7V2igq2inXFClOzpgXz10VGBYHo2vqvCQFQo+geYCm?=
 =?us-ascii?Q?+/+1juGz6s3DKCdjF6waK8Bxk24=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d59a9-26af-4930-44ce-08da005fcae9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:27:45.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMwLDuvwtc12+jPhNQ4XzRLLICvP4iWslSM022xq4TwoX3wI/K6ljBIhtf/T+dXI8Yee8YX1thQOIQwusyaoHPp3hMYD5cOIb5GClIxlzVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3658
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
> (RE-)test done by Henning. 

Just actually read all this the first time, sorry for that! Will take
care of testing on a few of those Simatic IPCs and write patches to
switch to P2SB ... possibly pinctrl where that might pop up without
ACPI.

I guess p5 will make pinctrl show up on what i would call a 127E ...
apollo lake.

> I hope to have it merged to v5.18-rc1 that
> Siemens can develop their changes based on this series.

Will do.

Sorry for the delay after having passed you i now seem to slow you down.

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

