Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6456B20D0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 11:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjCIKBc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 05:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjCIKBa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 05:01:30 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4E583155;
        Thu,  9 Mar 2023 02:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678356086; x=1709892086;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HBzKHXOMC5s2GJA5X9vO2GkVshe6hIdpNobucdbO2mA=;
  b=PTzYsmEBVILv/PGZ3hRq25+U4f3PXctYRSPapWojOwquhS6qrp7QIoUg
   dExxGuhTgoJpFOqW0Sih9w9cFXRgx7P2EyzxoV2qMQosWZ7JShuaSO7JB
   ksIJ2/fIgXx9v6X/Os/NnGFibf9kE21YPpRV2Rj9o8wKhP91YTD5taEik
   CGttot4dpbeu9MhJRgH95Ti2V+U914AuRxEMt0P+O6j9hWPXcUfWB2WU5
   j05L2q+mRMPb2vlynUPnqjdNqRJc/MgVF+k3doBB90NXBGlhLOlspb48w
   GcMOzochTfcVmTLgtx6Rdm45qL42+aqefyagmaHEsPqsH3qFe0WtEhO+4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324728263"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="324728263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654695647"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="654695647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 02:01:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 02:01:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 02:01:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 02:01:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu5eUyFcVbrJvErF5Jt3x/TY2ZlpLI7vggf85zKkBSqh0eRXRu5stFarNWMTRE5RXmNxY1q7YjkZm6BV8EI6M0otx9DTxYhKMbPZrYp795iVypeNCl0nSazZmm82IAD5o4MEP3lo0u/Nv9gn9vqeqKoN4MIoBvvwDozi0eilzWq1gvIJ4oOzUsRgSPJDI1iqxlVaEJBFVYLKhM3n5rvX035F2ZtQHzDDaI87oGOgxbfJffcI1DJBMPN8zbqQLeBgRWVc3VatK1VRIk8ytSWXfyeDxFvQgxQpXHRXPt6GSAy/9y3qj7CF8hc8RzSVz6L4OjYR/etl2na5JSMFriO6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT/qtI5NSlJF8Vfi5JWwAKM7j5GHCV8HPyfvhixstoI=;
 b=aNW9GaaHhZZuGpGumMiIqSUcVRwzJOh/6Bu4K4X1n5jS0bCg0pyoSQGWCxU67bDlgDDB8+c1g+SLCGY2x3/No1JKRvWpWhPALhgURu8bUZrzs/gMi5TDZv1gh9l1NLuqvjzbtyG3Vh5Zl5dSBOuERF682ZLkbYz4viEQoluIGQfvfrJe/fkkuI8D2MLBk9RDaQbdEsprO2226xJJ96yTb5zGA1YCv1HzMS/6G5aVLFT48WbM0JS58F4Yjq3dg4UjzUB7vVoUimyyT6dJMAv9uqSs0Mivx/LjigwKONGobLcXaiq5BXLnc+bUz0zcGyswX0zjOtxpvZWW0T6iGUOdWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19)
 by DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 10:01:07 +0000
Received: from BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79]) by BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79%6]) with mapi id 15.20.6178.018; Thu, 9 Mar 2023
 10:01:06 +0000
Date:   Thu, 9 Mar 2023 18:00:57 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, <linux-usb@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <srinivas.pandruvada@intel.com>, <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAmuWS+9dtz/T5rz@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB1409:EE_|DM4PR11MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5b182f-6359-4bfa-d481-08db208532dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzwzm7+6loaraNCe7TxYYLETaIY7qf+Xj8JMbCXISf6WAJTKHD4woBwwcPIiUuzGqexZNRYlVtDlBVgFTms5LDL54uuc8YU7mLPJ1VHOW8X6Du+oNsiZpOTRSTrRiEJ9xwhMXFjHwGBerp1QQs7QWPAwr2OG69M3stqmZQk54PrCQ6coTOpXaqfsnRsa3zNO/yfZzQnEnS92dCy0/IkMVI//zYPzMldy/w26Ftb/PFtFlDDsdhIM7WJM2PlsRBsq5lw06TNNpJv7Wphu6RMDJxt/jcGSZF1JHZHT7zeBDTSMfZASkUDMt4FZDuu1EGlMWFph+eV1QRUbuVSkvWS9FqppkcIOsMEaLHxeYK2tLQ9BI5itJoq+pHn1sbzMEnOLEwVvBB7hkf8B8E2Se2zLXW48FAxfDF861S7sZh3LZ2gvl1kOwTAiBEcgN69t/rmR6ObjS24fOYp8PGxhd46BCBTCVmT4StsS8wBuTzbnN1DYo48eDdPLPKkNOveyohm0jV7gOYORQxj61DwEfhS7zLEiBwWtqyOrEPKsG7jBiix6vH3rbpbQG6622sitP7ZPBHmA8qLFa6alYxJXNGPifbQRBYhKXaYEioUR/Ppm+Tk+p4wMBAVE1HuQbntwq1A8JygcdX9ocPtIjP3qDzNkrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199018)(6666004)(7416002)(478600001)(5660300002)(86362001)(6512007)(186003)(2906002)(9686003)(6506007)(26005)(6486002)(83380400001)(33716001)(66476007)(66946007)(4326008)(6916009)(8676002)(38100700002)(66556008)(82960400001)(8936002)(316002)(41300700001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1xMudd9KJLaWnuzsyvM/X43ptYvmJqoELrVX6/2GgsOjpjBA7pWY7Cp4WsEw?=
 =?us-ascii?Q?tX4Xg6laxP5e5z0FF5JmIiXECArg7YOHjvwN9hP+Sz/Kjmw2tVNycY01A1Y+?=
 =?us-ascii?Q?cgZMHuKknE7FFAQwqgWMZnuS7WJa9phrZH1y+zf6tCWmB3I19x7bRPnR8viR?=
 =?us-ascii?Q?m3D9mKk50qLvDeZdRYVJBfuDBKG7a3oqFAnNp2bQNneSfWVMg+vjp8SHgg9v?=
 =?us-ascii?Q?MQHz+xGi9sGXcKSA84Eeza6yYUIflebFrEw7MaR2fRXfLx/hMKnzeG2MWyea?=
 =?us-ascii?Q?IbS4gM4RLEOL4BzmkHKJiLvKiK3Yr/xctfEdh/WztxzOa8AixNudfeTq/Lbt?=
 =?us-ascii?Q?3VBtbi6OgamNuWwf6tDivpYnCh/Xa4eS2y+Vt4eLJ2Jv6J9INPcYsWM8Qyfe?=
 =?us-ascii?Q?wGoL/ugkH1ExIKsGaixY/gv64R1bX2eJnpBmniCkDzqyjkbD3QLGAMFNxaNt?=
 =?us-ascii?Q?+oV12V+AsibTq3Ojrmr4U1DYRShq1/ngQjGFynyqzeylFvlTeQuz/3M5s66q?=
 =?us-ascii?Q?easl50aFpeCfFfJVmVM/oM00Dt+A37DvdggQlgegzB+WXn0cmjihQJu/mrbx?=
 =?us-ascii?Q?UIat+PBj3manUxm7Zqr5wiM9o4zMjsOq8rm/3P+4NQo8iy3lxyT9Ql0f+E9S?=
 =?us-ascii?Q?/LrkhCcvQZRbdeDVubfW0q21Tc74Y15nxMQ3o7oXcOs/WTo94BnXdgplsB0U?=
 =?us-ascii?Q?ivaYpYsqMf1GRT0WhQu+ZTeSLFsATah4dWUIdWkOtt2dEwiHwEGHDKc8BQ8q?=
 =?us-ascii?Q?9NkyPUpaj1pM05ipqJwR82ZnYB8RXWHzEVFxmZaDftzPr793r5kkyxuBVzLb?=
 =?us-ascii?Q?0icx2OJWZUmPwAoENWdwgkkJVgXKWy7/PhlA2il8VEAxS5VGHIcj+991CPPg?=
 =?us-ascii?Q?1SPXUsCvpm1tfOaVV84gSdEnuCKQSHnytFwIIlh+TKhcdvlq/CtwLrIZi8dP?=
 =?us-ascii?Q?vcZe6YUtTilmlsW9Sr11QoLZ81mzLiwF8NItSwWYvTHqpprS7dorEfKjeMkm?=
 =?us-ascii?Q?BYzZvOT4bgHLpEkZgr/pG0fhsSffQICNly3ENrFq3zU7GF8JFN6rlKyPxrMj?=
 =?us-ascii?Q?cAfgne0f/GtfnYADnrsKePsrJdfxetem0OH5oGITTW4a3r9PE8HwwWeAfui9?=
 =?us-ascii?Q?DcKbEgUU06/97/rYwESWKm7k+ATbXeuSaf9QJF26Zh4RBfkGxrknszANOAiP?=
 =?us-ascii?Q?FbHBD6EwM57jr3cbjG/jaGkmg6Tvr6VtYMJWtOFbtsmrjv8LakOZpc2L2wyE?=
 =?us-ascii?Q?MnJ45eYfbwenI5bd2QCmD61uq20/9rzel24Wv7645szYr4YbnibBYfWwTRk0?=
 =?us-ascii?Q?PDpeMMRjraKzuGPP2hI4TwOvABg4kKrBFLOnJdYMusu1r+1EdO1rsFpeJuse?=
 =?us-ascii?Q?4PkRafhtCMc482ii5qnuOVj27Yb1LNAP0D7Doj2tl1z2qshj3O5MyJe/9Mn0?=
 =?us-ascii?Q?q5V7AktYYtpIK9MRsNNDbjnYdwIz1P0SZ5WUrIf/tgZCtknvbOUE3n3VCDyP?=
 =?us-ascii?Q?tc+3sMyz/Tp3gqkTIayyM3IetHy10Q4nE/OAsqfePS7/04qvhNfuWDZm+7Qh?=
 =?us-ascii?Q?bxLQeaqPJ2sVrWtpdn29Qnk2Omw5+F8lcW9X4u/W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b182f-6359-4bfa-d481-08db208532dc
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 10:01:06.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOtOdCcPOEWXT8RHXNhLOBx70taurEgF5SWChCRUu9q1hSMwAoKLLjV5ArJtiObBIVM0+dmSGlbxcKVOZxA94Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Arnd,

Thanks for the review.
On Thu, Mar 09, 2023 at 08:56:05AM +0100, Arnd Bergmann wrote:
> On Thu, Mar 9, 2023, at 08:10, Ye Xiang wrote:
> 
> > The minimum code in ASL that covers this board is
> > Scope (\_SB.PCI0.DWC3.RHUB.HS01)
> >     {
> >         Device (GPIO)
> >         {
> >             Name (_ADR, Zero)
> >             Name (_STA, 0x0F)
> >         }
> >
> >         Device (I2C)
> >         {
> >             Name (_ADR, One)
> >             Name (_STA, 0x0F)
> >         }
> >
> >         Device (SPI)
> >         {
> >             Name (_ADR, 0x02)
> >             Name (_STA, 0x0F)
> >         }
> >     }
> 
> I'm a bit confused by this bit, does that mean this only works
> if the device is integrated on the mainboard and the BIOS is
> aware of it? This won't work if  you plug it into a random
> USB port, or have no ACPI firmware, right?
LJCA can work both when there is an ACPI firmware or not.

When there is a config like "The minimum code in ASL" in DSDT, LJCA device and
its sub-devices will bind to right ACPI devices. Our current use case needs the
the ACPI binding. Because we have a camera sensor depending on this LJCA device,
We use the ACPI binding to control the probe order, making sure the camera
sensor probe after LJCA and LJCA-I2C.

When there isn't a config in DSDT, the LJCA device also can works. But
it won't have an acpi binding.

So, If you plug into a random USB port or have no ACPI binding, It just
does not have an ACPI binding.
> 
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/usb/misc/Kconfig  |  13 +
> >  drivers/usb/misc/Makefile |   1 +
> >  drivers/usb/misc/ljca.c   | 969 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/ljca.h  |  95 ++++
> 
> Why is this in driver/usb/misc? It looks like a normal
> mfd driver to me, and it evenhas the header in include/linux/mfd/
It's a mistake. I just moved it from driver/mfd and forget to move the header to right place.
It will be addressed on next version. 
> 
>      Arnd

--
Thanks
Ye Xiang
