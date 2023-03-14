Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD16B8C64
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 09:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjCNIDs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 04:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCNIDr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 04:03:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AEA199E6;
        Tue, 14 Mar 2023 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678781024; x=1710317024;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Pe0EQEcTbScG7XzS4dh8w7MBOTEaFtzQQBZYaouDxxQ=;
  b=Q7oL8cydyyXXT0OaTTsU4eaIPCNLGIjP7iqSnFHGc+/PPMhrdAVnY1JV
   Oc+NCku7VJyD07MvXTG3rembaOZ+kpQ3x2QgCXLoEYcnSNaHyU+ec268Y
   pV+91UUPNW9gVUzR3DPuTh7m1Eqp/9A25E4pD+p62SW+GoVr63q2rhNwy
   z6Ajh6BS8qbW3PMOwPHgN8+tAE476YOQBAqO7BEUKzlGendH+g8T4pzD8
   mRLLNkiIK031+ajKQUiT7RMj6DYfXqBiJd1OKBwApkdP0bB9XoJYOebfa
   WlEi9W/G/uDQ+PwTuvo7jds6cNCUX81QvfIzYcJtc0slV4jBoqwox0zd1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="365022926"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="365022926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 01:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="709184768"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="709184768"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 01:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:03:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:03:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 01:03:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 01:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK0aS6dTe5D2Izw4mB0z8J5QZpizyLM9e/akNWZVTAGq8UlrsrZjveyB+tqLL75TlEy9WK8E/jluYd9d4b4Wf+Xob0xYJVrMD1tsGjMqJMZgllPFsnUK2xNZhXazOv3Ub3KK7CvItTLZXzbwu2tFu/ytS1dpKP643QAlIGF+U5mZ4LjdDwFHiw+pw0VLi16y/ZzsqDOWXIV+LXDbGNuR7xxf7lC8d3N+D1bE0JVuPQW8ZKrTnfPxAfb4sJ/bH5/b62FqpZsbuaYYUdwee1xZRe0t2Zx/zDpq+zJnXIaAxtRtR1VrCA1BWeo/etVa8IkI41ExBgyZsPq4BOB+Ug5nzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBb/aNVPXhY7j99xppCcxIhytaaAuUK7lgh5eCmyzMU=;
 b=PtDVyiThL88hnH0Bp9LoFlpT/C95z4ozuOU93xUSRNjCouY4lVxZbVums0x8YdXcQuWNzrvbdGhbFBzrhi6GJ313qhsF1uzOho1ZAQhTAcRPvjslxO5bYBUORT2+4ychht1TbhWkNg8qH3EpaSjhfypqkAAyBGCWfsR+1WqPwcxpVreTyduYXGK8KKB7+Cs+60x1iPI9VmfRs7knXrGiwVt7hM4CdXoHdETJ0penlOr+OsXeVVX1wRmbGYGIAdPPUhwhCW9dVk3XnLjBgzYvrS3jyL1vwr+3gnh8vxfOBWHTWVCEn5I1vkLTuXszk/X4NfKTwVBF8mq9hQD1yYJ7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Tue, 14 Mar 2023 08:03:33 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 08:03:33 +0000
Date:   Tue, 14 Mar 2023 16:03:26 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Lee Jones <lee@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
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
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230313170341.GV9667@google.com>
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f95eb48-1a7e-4b66-1f88-08db24629ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5kPSmJtRuparsMOIt8AykcieNG/PPu6zh6K9dnENaA1SUiJeus5Tx+REsl6iHFLKxXy9NnoSjlMEMJsK4R+kaf4Q7zS+bxD8tBZyAq4wgnQSDvbrYmBEops4jg9kxMQETQYTZnyjQS8QtFuO3PBeIJPomI1dRh++MFKLlsMi8xAnejzoyJTDMBTIKvzZqPxgIKG9jwiY1vRwCUdG2nCAtyklIzlTZ3R7Bw3Yds/mE/qpHFLCd6y3onici7lc0IsnmZ7gL93Aty7b1fC93endweCKVwTQp/HZOSD0Q2i+6WjA8Gnj3mDPFYkNrwlC/B2S6ycI6msYMMycESQ6BTTZjGesiG2e9anm8SKIM2v55i6WzA7Sd3x2dyuc4mslY2aLH0fhgHiAIO87x3a5SEvLn/wxRrWN+dRt89umZA24BnUFhTm0bNVsqWrkHgS7W1ci3g6lDOQ89ZcZlelD78GkZHdEniAH1AezBJfPQUu8KAkIOA6iYW7T67GpPKEn/qyOyqwJ8TWM1/4PUGB0wHLgG9nBxgA30fNxT9pv/Gyj03n0I5zDQ3iF5HipxkM4hCS57utAjYwqJJq+4Xlho9Ize0f/s5UpfasQHMRZ4s7afFNuxRJ0bBagxnqWgqqx9z67aH/Bll3MzkDc93D4bRTNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199018)(33716001)(86362001)(6916009)(9686003)(7416002)(41300700001)(6512007)(26005)(6506007)(5660300002)(4326008)(186003)(8936002)(316002)(54906003)(478600001)(6486002)(8676002)(66556008)(66476007)(66946007)(82960400001)(38100700002)(6666004)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/SBsFPj/0rGIK164l45Op8bwZyf00vuxv/+LUVIlm/nOhS5QRpTW2iZIogi?=
 =?us-ascii?Q?3pUhZQ04+LmMltdpULyoSdHWlRL5FB3pTukrDRUrfAh20NvDI6Vv4gI8ns6Z?=
 =?us-ascii?Q?hwGIkj6CTxpsV9lizh03dF7UD6l514VDFRsGX7m4AdsXFa62eGLxglR9WJA7?=
 =?us-ascii?Q?Cd9n7VoMeJnt9U7Q+ntXD/v+7hHIZF+h877ekNTFS3UHQnBCGjJyylfi1FPR?=
 =?us-ascii?Q?T9c/EGclZhXXeREtboUjBTWdgSao7wvuWK14YKJTxr8cUXK4bc29b9YcRtii?=
 =?us-ascii?Q?x+lRvvFFz71EpLUZFK1X4svTrpLWYa2Ld/YqRt+I1imtlVBF2JOo4g95bRQC?=
 =?us-ascii?Q?2XSf/CCGRYxlDU2faKh62R6MNSKDwMoSpQ3n2vmn6cxZ3Q/Azxb4hO6i/I/w?=
 =?us-ascii?Q?GaPigimuIjgQ+X7yEdt7DSkgOd2hiO3VXqBxZ+9ZHy1LRwlxTObWUsPjoSiS?=
 =?us-ascii?Q?34Z/7U6S1FEKgXMz7DrhLkvQZ3spEmuen/H/mCpkrGLdgp1TWwD0wer0Oa1J?=
 =?us-ascii?Q?HqggrWqeqpl5IxEZyVMGe8MILnXZJVxk+pFa2lXbY3ggk3DjEO8BECB/+QGo?=
 =?us-ascii?Q?L3VmmHR3snUTe2NPK/9a7DdYN8A9gPJ1mgBsgnWo4zNzzabpI9lIPOLWiuzT?=
 =?us-ascii?Q?mFmJpVEIabQPcfbxWHZDRMDpI8XfPl0o/mpu6HVEJf6ZM6XYENhcwPtm6Q2B?=
 =?us-ascii?Q?1SGFNF813PFgQgU955R3/Vy2V5zM1ks3WSQwWspZS0un6NekEaALqE520V63?=
 =?us-ascii?Q?6vQGNkPcwXecESc0msbKw/Fn0Hb6RSCSXfo7SJxGe4SrrBr6bfhgp/0K+xbK?=
 =?us-ascii?Q?bkD1xx9Y2LsC4WuUBA94j2/FcGyiwlKMLsuIZVnaNDYz2CqFobAj48grymTD?=
 =?us-ascii?Q?U5w+fqsMPC8h00AVDeC5+TG9ZDDhCnOIHzTDEbr4Dv33/RmtNed4TXgQwVV0?=
 =?us-ascii?Q?mX5uE9Y0cSitOk080PRV7V0gSMZYY39+WYpZMWTfBpnX7mEBGChcjXdvsNHf?=
 =?us-ascii?Q?lE5xduPNTWkPUMOGFnMdSZMIMA51EjpE2pRZft5DbuvnBlMNiFCY2XqeC/zu?=
 =?us-ascii?Q?vApLHWgVs2V+yILmAVCx1Ri+NDZ4fOKguC3KichOqsMqhak0f/pF7gUzs31O?=
 =?us-ascii?Q?e9vWyTSqnn59DSDkPp/2BwT90QJNx6v+0zRuG6TvNiy6hSWRM4z6o0mhjGrU?=
 =?us-ascii?Q?uiL1NhqpC/LiNg/HjGCMEiDMvTcYr4pIVouHEYnOiHDq9GMwGSduraars1JW?=
 =?us-ascii?Q?w1Q4e7fqvbt2VJ8/1mmqKff/wzCFO2kWESfB/a69X/isy17ZzXVMdcHJ4h2+?=
 =?us-ascii?Q?Vh+8ZuWsfgEwBeehdOwPtSnWsSv/ITS/mYkrP2gsafKhhU4hxK0tLPEnr2Mg?=
 =?us-ascii?Q?qNLznjK2x5DKg6ekxMeQ1S7BVBuzERRafg9VcLrgrYhkg4zfc5HbwnI2viK4?=
 =?us-ascii?Q?qDjkRKs2poKPsF64BG07/q6i5hPVopHQLNTkyxKkAjyFK9Yhbu36v9Ocm7ce?=
 =?us-ascii?Q?NAk6o8Y6Nq2Urv1fU4nJ+fXpj0Y9DD/0q4xpXsqsmBms9NogWgG6IZC9fWKC?=
 =?us-ascii?Q?jhAQyPMc9scrzl4OkzJmTSH4r8TJV7tkpz21PNoE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f95eb48-1a7e-4b66-1f88-08db24629ac6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:03:32.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf0T4zGJeiRXGqereDYVcSOnAhFLiJYwWR9flqylUQEHvvqnEeDAf+gN7gmz6ng6iQPyaQSMSnJ1LHprBvSzew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

Thanks for the review.
On Mon, Mar 13, 2023 at 05:03:41PM +0000, Lee Jones wrote:
> On Mon, 13 Mar 2023, Ye Xiang wrote:
> 
> > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA).
> >
> > The communication between the various LJCA module drivers and the
> > hardware will be muxed/demuxed by this driver. The sub-module of
> > LJCA can use ljca_transfer() to issue a transfer between host
> > and hardware.
> >
> > Each sub-module of LJCA device is identified by type field within
> > the LJCA message header.
> >
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
> >
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/usb/misc/Kconfig  |  13 +
> >  drivers/usb/misc/Makefile |   1 +
> >  drivers/usb/misc/ljca.c   | 998 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb/ljca.h  |  95 ++++
> >  4 files changed, 1107 insertions(+)
> >  create mode 100644 drivers/usb/misc/ljca.c
> >  create mode 100644 include/linux/usb/ljca.h
> >
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index a5f7652db7da..59ec120c26d4 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -273,6 +273,19 @@ config USB_LINK_LAYER_TEST
> >  	  Layer Test Device. Say Y only when you want to conduct USB Super Speed
> >  	  Link Layer Test for host controllers.
> >
> > +config USB_LJCA
> > +	tristate "Intel La Jolla Cove Adapter support"
> > +	select MFD_CORE
> > +	depends on USB
> > +	help
> > +	  This adds support for Intel La Jolla Cove USB-I2C/SPI/GPIO
> > +	  Master Adapter (LJCA). Additional drivers such as I2C_LJCA,
> > +	  GPIO_LJCA and SPI_LJCA must be enabled in order to use the
> > +	  functionality of the device.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called ljca.
> > +
> >  config USB_CHAOSKEY
> >  	tristate "ChaosKey random number generator driver support"
> >  	depends on HW_RANDOM
> > diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
> > index 93581baec3a8..6f6adfbe17e0 100644
> > --- a/drivers/usb/misc/Makefile
> > +++ b/drivers/usb/misc/Makefile
> > @@ -29,6 +29,7 @@ obj-$(CONFIG_USB_HUB_USB251XB)		+= usb251xb.o
> >  obj-$(CONFIG_USB_HSIC_USB3503)		+= usb3503.o
> >  obj-$(CONFIG_USB_HSIC_USB4604)		+= usb4604.o
> >  obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
> > +obj-$(CONFIG_USB_LJCA)			+= ljca.o
> >
> >  obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
> >  obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
> > diff --git a/drivers/usb/misc/ljca.c b/drivers/usb/misc/ljca.c
> > new file mode 100644
> > index 000000000000..ab98deaf0074
> > --- /dev/null
> > +++ b/drivers/usb/misc/ljca.c
> > @@ -0,0 +1,998 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Intel La Jolla Cove Adapter USB driver
> > + *
> > + * Copyright (c) 2023, Intel Corporation.
> > + */
> > +
> > +#include <linux/dev_printk.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> 
> Please don't use the MFD API outside of drivers/mfd.
> 
> If you wish to use the API, please do.
> 
> Strip out (only) the MFD parts and move them into drivers/mfd.
I have no idea about how to split MFD parts out from this driver
currently. The MFD part just have mfd cells filling and the call
mfd_add_hotplug_devices to register mfd devices. How to module them
as an independent driver?
Would you give some hints or recommendations?

And I am a little comfused about where this USB device driver should
be put to (drivers/mfd or drivers/usb).

As far as I know, where a driver should be put is based on what
it provides. This driver just do some urb package transfer to provides
multi-functions, such as GPIO function, I2C function, SPI function.
so it should be under drivers/mfd folder. Please correct me, if
something is wrong. Thanks

> 
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/usb.h>
> > +#include <linux/usb/ljca.h>
>
--
Thanks
Ye Xiang
