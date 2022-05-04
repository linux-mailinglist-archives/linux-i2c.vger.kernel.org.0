Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BEF51A34F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 17:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351905AbiEDPNw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 11:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348700AbiEDPNv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 11:13:51 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E2A2E0A3;
        Wed,  4 May 2022 08:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOEF15WYQfBDQzK2F6BGP7Ql7ESzcdbKqtA90BSWu1N1YCXrvY5aGDlN9TSDbSL9ker4XtxczER3e1TexPitMus/Wjtgt4tCnnw+EWscD9krEecB73TO+rJxkUjgN4KmA0FEUno6UjzXNUrhs6CO7LcG73wO/8Fu2UwDLqfNdiPdlNy9OhdQGRq7o/Zb2OqMMzMGY3Pm3dX3V7GBBfTBPx6zYBWsZRU+vwfYTCMFMteQ/SEgNywDE/uDNlJzP27PDnfwDDdhc4pRBfuRmYUcoiAvOnV1PU5oAfjWt5bnkn6BPBPsIi4hryjgktsQ+XOD4WiU28/LlzNyuz+AJ5gZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg15scm8hKiLYDryfx6K9+Q3YRWzaeK1L+GqYchFJtA=;
 b=QV1tacb/Im47QaiglGZB2PLcW67M5/lfJe+SFDoVjFxO9BBRrOBXFYtEinqFgJAHVFneAFK4I3Kzj9/+hwoXyme5tzxOqlomQZqJWDDFkX6vn1XB6X8JExgMyy5bs+GdeY5tICPaMBtvBywmTPSHt17iGQOEMG3E9a69zj5HiQD/ORVBaGv92Jf6wFmrybMFn2boVYTGow0x6SPCXemo0j2BWUM+QIgH97ORpikSqqFX/rTtWZTQMj4QLeflKuCbhxF250udtAMNSS+CBNvU9ZkWB4GuE8NFT6QCAcOuelqq/gT8pDvFCNEza3hOHNOYTcR/zEeBW8ImZZk4ewyFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg15scm8hKiLYDryfx6K9+Q3YRWzaeK1L+GqYchFJtA=;
 b=CkBSVy6T1ruF0KA0voGS63rE7IsQNXqIHz8WpCSDW/K5kN7BVFbRQC5iPnqV+dC8Ne2aN2amEk6hN1fguHIBWBq2mSmokQK0qtVPMME+cQ00C5me3hwXQ69y4zEZZziaDsYc2cdZKjfci5DITSdGBoenZGixnWw8ZIusqWFgIjDwfQCbSSVZOyJsd9WRwsUVC7AvTis1M5/mNptpwuYaP0fn09suE+nfrivSuviw5xuh2kSw4uXYSWBm/LsTDrRCtwCqzuGZ0IF2GSxYJ44pmFlukyo73luDf1i83TGLBoW9PeQMQ/XCi1dixf/4IZ8WEnAbAq+aB3PQ2veRGeGG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AM9PR10MB4182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 15:10:10 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4be:8b5d:4314:c2d8]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4be:8b5d:4314:c2d8%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:10:10 +0000
Date:   Wed, 4 May 2022 17:10:07 +0200
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
Message-ID: <20220504171007.2f641098@md1za8fc.ad001.siemens.net>
In-Reply-To: <YnJ0tdGTzTRYEISn@smile.fi.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
        <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net>
        <YnJ0tdGTzTRYEISn@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::29) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a7668e-993b-464c-9b28-08da2de02e4f
X-MS-TrafficTypeDiagnostic: AM9PR10MB4182:EE_
X-Microsoft-Antispam-PRVS: <AM9PR10MB41825CDCE768FEA7B2B1A1D585C39@AM9PR10MB4182.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLIvzEKjIIp/2jvNU0SPSJPCj89YsLfzAnLpaeYNO9kYQs3caNNZLcdV9DUezneMGneT1zBoC+LU+lJ2+65VM7pbobA5Vg+A1fETaWM0oEEdmjVLizXyQCzm8F/frzyA4Fug68ZXXi3L/R2JjgTCVY3xClrWEJF3qJ45LZoHnaadr4za+XPtnEoFc0u2Nir3f29ms7bgacuObDRkcOEXr9bH5PK/U8On5059bMbuDwFKCDio1blVyivzSQhh1gEeLpofPAKSgsyfiIQ9zUZRuRuZAV++1Q3Jkxo8ozdqckmcfJ7BJR4MwTdS/aOWG4AiiMMSMC0IupshTNPS7VrKiwtwVtbL9jl00AjhoFkhpk+p5NHxwMl4rMz/smClzZkMICcVvOLnHRZDahpT+lvD1k+K1h6bEYyqmmh0ugcSPLJh+2B9xpeXKz3tzrF+aupGzaKCchvHalRBJuN4rtWqBfa3q1PzQ7NkwEM4Za9hnLarD5fqAhIBeSV7aVK9uoeu/HX+jOFKJxUCwbC9qwtSvsYsPB+FBdH/kgIDleLAmpAG2L108Z8usDlQZ1f35WKDBF677PvQ745gP79YEiB/neHFTo4ABIFgMb+nVimNRO6YM5vP5GewCMh+5HdT2YBztNIgvkCwOjFjEgPqt8Bxvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(6506007)(6916009)(7416002)(5660300002)(8936002)(2906002)(83380400001)(54906003)(1076003)(316002)(186003)(6512007)(66556008)(8676002)(86362001)(4326008)(66946007)(26005)(66476007)(9686003)(508600001)(38100700002)(82960400001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U5rzZT3jHWTZejXBMjx+p64Bz+6rq5zYuWyBt6n3uK7FDPFBzVHyBjdMrkVt?=
 =?us-ascii?Q?HF8brQHzc7+bzOBwMwjLTisrFTBp1/2tOA41c8oPFLxcYSYek35jr3lbhIGP?=
 =?us-ascii?Q?BKWTmDQfqdfPFE8di58N0/zOqcMMyckukkibILD+7PK7ImL5R2oRLtu610ga?=
 =?us-ascii?Q?EDkk93YJlH7wUnOtdzJrhoVGs4zuMc91CsnKjjZZy85wx0G7keOiMBL5xOfx?=
 =?us-ascii?Q?pVhsIZ/avW4uUbnlyknc7Jb+jrn8wSXyhqCUt1EBPsYGPoxFfSm+HeHBj8T+?=
 =?us-ascii?Q?91tM6/gohW/UbJ2LuPcv+Jsx7Fd/ALgN14kQ/ELGyE7zT4wquzrVVaCFPgVP?=
 =?us-ascii?Q?id9MrQzZsVOyoEoaH6yEgiWXTieE80KB61pFLy63SEANms5qUeWHE/RyXeto?=
 =?us-ascii?Q?99XJtWdQOXjUxfLYfbAyxqxYR3lnXVthXfC0FBOQI1b6Rw9E1rwgvbQ5BwfO?=
 =?us-ascii?Q?41aYzJ0/SmilOk8kiYHWLDfZLx1IHXBwlsndBu07/6aXzMSmaXqm1KBqExSA?=
 =?us-ascii?Q?4omt7Bhh+c/Qi3aOHn9bjA7SrVFVvwqbeCPBkpG739dI4ajtjzV3kNGLUWuG?=
 =?us-ascii?Q?tsZp/xZGlO4vDBMXGBybfR44bT+ZOuTnnOE5+qQLu0FIT0mq+z/l4pXOEgR8?=
 =?us-ascii?Q?8Akon4MRu2n55wPsmnU2wiyrSaYzfuFM+l9dlXMK79cB0uitSBfyDrVrIvD9?=
 =?us-ascii?Q?obAVqSQsXs2tFJ+W8Y+ChsQ9hLJkYM/wTG7s4LAmrMWPn3qni3XvIxXQifpS?=
 =?us-ascii?Q?9lD//egfGVZSiLBnEZaeLjXiMuFQ2hAApU4gEWI3UF5p/IKHuhVj0DaBgZlQ?=
 =?us-ascii?Q?NUhpBSKp0NsoyEziY5gNjgDCGaHIn51KVTCIa40GNfDLTuDrNvrzPU62Hw0b?=
 =?us-ascii?Q?Kk9fW7RJpZCghsqwP5jqlbH/mtm0QNZ1qAZkFPlr9awYz5M6uMKaLJ46iHaR?=
 =?us-ascii?Q?wJ7I14XbjUyJC7HmlLWK2Fouzhq8kUgSUe7h0A0tOoNPbBW1LeR62vsK0Xsf?=
 =?us-ascii?Q?Vy3/3qa2rCS2LIJNh6zTYcm8W0ky1OOQgAQxi/bNe7vxpPKwBLDGjFyocFma?=
 =?us-ascii?Q?UvLerdKr+/+RPp6PyJyNOuaUrKRT2OFQph/KsMhQqFhZfz6qw6g7VqKnkyFU?=
 =?us-ascii?Q?MEvaUotBVI4a8rnSWaMjEh+UnKHBoe0d8BxX6Z6PmWfBP9ElRlYVCV/sZXvY?=
 =?us-ascii?Q?baf6Q1BRWnm2ckQT1iarmFd/eZkjSFkXGPVX8Y/Iri7h/31L+oVfyp6cxBYk?=
 =?us-ascii?Q?i9OXRZCsddmj/PWPGvKdsJAYDyA8SgDJ9sji4WgIcXNWqJPekYO8Ykx+zhsj?=
 =?us-ascii?Q?nCUlF7Ghc7Y9X7eDL/tHgHb810SKU5kgOSKj4eIdf27AoMNad2XdCJ6YEucV?=
 =?us-ascii?Q?/iiKhddkaitFNTjfZMTbYSvj8soNnUgBwFFEt0hLjwTGzqh83CK0onparuZG?=
 =?us-ascii?Q?FhrP0hTdTclXEcSVn0v2uv+YnUkmUpI+VQaERAX9NL0pMizYHBUeCkLevg1L?=
 =?us-ascii?Q?VMKee83fDemb2qMWUQzNmOn0xUG8iKw4TvU2WIyrXfouIDrXhelmDQXNZ3DD?=
 =?us-ascii?Q?MTV14RiIfXosh/p58DmfbAxA31vfVY2NN4TLgy6vnPEAKsq0yLUMNKHPyLsx?=
 =?us-ascii?Q?6t5b/W7UYV7OfYVkFKdtNAZk98FfRG+sHsSuTW4TFpMm5USPDTelBJD9QjY0?=
 =?us-ascii?Q?UEz85owbmW0Va669Ngq+eOMZewTKYy7WrAjsKyIPNDihPpBLlqwfesV+WRLI?=
 =?us-ascii?Q?gNtjwFOvWVQoPZqnopVMJUshwRtqxOps1svh121IXk00Lsr6nyk8?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a7668e-993b-464c-9b28-08da2de02e4f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 15:10:10.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydLYIETtQDmkplkWLufx3ZlatX3kfuW87QE87/3mAlHOd3btrnMpJg4btumBmWE8A59I7pxJ/74dksBtKUKpqOmTWsaYI0Zoux+a0uRe2QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4182
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Wed, 4 May 2022 15:42:29 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> On Tue, Mar 08, 2022 at 08:50:16PM +0100, Henning Schild wrote:
> > Am Mon, 31 Jan 2022 17:13:38 +0200
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> >   
> > > There are a few users and at least one more is coming (*) that
> > > would like to utilize P2SB mechanism of hiding and unhiding a
> > > device from the PCI configuration space.
> > > 
> > > Here is the series to consolidate p2sb handling code for existing
> > > users and provide a generic way for new comer(s).
> > > 
> > > It also includes a patch to enable GPIO controllers on Apollo Lake
> > > when it's used with ABL bootloader w/o ACPI support.
> > > 
> > > The patch that bring the helper ("platform/x86/intel: Add Primary
> > > to Sideband (P2SB) bridge support") has a commit message that
> > > sheds a light on what the P2SB is and why this is needed.
> > > 
> > > The changes made in v2 do not change the main idea and the
> > > functionality in a big scale. What we need is probably one more
> > > (RE-)test done by Henning. I hope to have it merged to v5.18-rc1
> > > that Siemens can develop their changes based on this series.  
> > 
> > I did test this series and it works as expected. Only problem is
> > that the leds driver will not work together with the pinctrl.
> > Because two "in tree drivers" will try to reserve the same memory
> > region when both are enabled. Who wins is a matter of probing order
> > ...  
> 
> Can we have your formal Tested-by tag?

Sure. I will just put it here for you to take.

Tested-by: Henning Schild <henning.schild@siemens.com>

Let me know if you need it in another shape or form.

Henning

> 
> > If you can take my changes into your series we will not have a
> > problem.  
> 
> Yes, that's the plan, but your patches needs a bit of work I believe.
> 
> > Otherwise we might need to create sort of a conflict which my series
> > would revert when switching apl lake to gpio.
> > 
> > I would not know the process, let us see what the reviews bring and
> > how to continue here.  
> 
> I'm about to comment on the patches.
> 
> > Thanks so much for taking care, especially the pinctrl coming up
> > without ACPI really improves the simatic leds on the apl lake.  
> 
> You are welcome!
> 
> > In fact i will have to double check if i really need the p2sb for
> > the 427E wdt ... but until i have an answer, p2sb works just fine.  
> 
> Thanks!
> 
> > > I have tested this on Apollo Lake platform (I'm able to see SPI
> > > NOR and since we have an ACPI device for GPIO I do not see any
> > > attempts to recreate one).
> > > 
> > > *) One in this series, and one is a due after merge in the Simatic
> > > IPC drivers
> > > 
> > > The series may be routed either via MFD (and I guess Lee would
> > > prefer that) or via PDx86, whichever seems better for you, folks.
> > > As of today patches are ACKed by the respective maintainers, but
> > > I2C one and one of the MFD.
> > > 
> > > Wolfram, can you ACK the patch against i2c-i801 driver, if you
> > > have no objections?
> > > 
> > > Changes in v4:
> > > - added tag to the entire series (Hans)
> > > - added tag to pin control patch (Mika)
> > > - dropped PCI core changes (PCI core doesn't want modifications
> > > to be made)
> > > - as a consequence of the above merged necessary bits into p2sb.c
> > > - added a check that p2sb is really hidden (Hans)
> > > - added EDAC patches (reviewed by maintainer internally)
> > > 
> > > Changes in v3:
> > > - resent with cover letter
> > > 
> > > Changes in v2:
> > > - added parentheses around bus in macros (Joe)
> > > - added tag (Jean)
> > > - fixed indentation and wrapping in the header (Christoph)
> > > - moved out of PCI realm to PDx86 as the best common denominator
> > > (Bjorn)
> > > - added a verbose commit message to explain P2SB thingy (Bjorn)
> > > - converted first parameter from pci_dev to pci_bus
> > > - made first two parameters (bus and devfn) optional (Henning,
> > > Lee)
> > > - added Intel pin control patch to the series (Henning, Mika)
> > > - fixed English style in the commit message of one of MFD patch
> > > (Lee)
> > > - added tags to my MFD LPC ICH patches (Lee)
> > > - used consistently (c) (Lee)
> > > - made indexing for MFD cell and resource arrays (Lee)
> > > - fixed the resource size in i801 (Jean)
> > > 
> > > Andy Shevchenko (6):
> > >   pinctrl: intel: Check against matching data instead of ACPI
> > > companion mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
> > >   mfd: lpc_ich: Switch to generic p2sb_bar()
> > >   i2c: i801: convert to use common P2SB accessor
> > >   EDAC, pnd2: Use proper I/O accessors and address space
> > > annotation EDAC, pnd2: convert to use common P2SB accessor
> > > 
> > > Jonathan Yong (1):
> > >   platform/x86/intel: Add Primary to Sideband (P2SB) bridge
> > > support
> > > 
> > > Tan Jui Nee (1):
> > >   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> > > 
> > >  drivers/edac/Kconfig                   |   1 +
> > >  drivers/edac/pnd2_edac.c               |  62 ++---
> > >  drivers/i2c/busses/Kconfig             |   1 +
> > >  drivers/i2c/busses/i2c-i801.c          |  39 +---
> > >  drivers/mfd/Kconfig                    |   1 +
> > >  drivers/mfd/lpc_ich.c                  | 136 +++++++++--
> > >  drivers/pinctrl/intel/pinctrl-intel.c  |  14 +-
> > >  drivers/platform/x86/intel/Kconfig     |  12 +
> > >  drivers/platform/x86/intel/Makefile    |   1 +
> > >  drivers/platform/x86/intel/p2sb.c      | 305
> > > +++++++++++++++++++++++++ include/linux/platform_data/x86/p2sb.h |
> > > 27 +++ 11 files changed, 500 insertions(+), 99 deletions(-)
> > >  create mode 100644 drivers/platform/x86/intel/p2sb.c
> > >  create mode 100644 include/linux/platform_data/x86/p2sb.h
> > >   
> >   
> 

