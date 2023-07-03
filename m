Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FB3745377
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 03:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGCBL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jul 2023 21:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGCBL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jul 2023 21:11:56 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023FE127;
        Sun,  2 Jul 2023 18:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688346714; x=1719882714;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OKMl1p9iNw4Fy3X2FdgHiqAH0wFT+RhHcK89P0q4sFQ=;
  b=HraZ1lCPfp5WpupAlgcejZZpgDNiGALqxwAUc+KPZt46+dsOZFfGMKge
   hnUk9Tcrj74lYcF3LtTy7qOyOtywPyMGWZidiqC+JMn+9GVA7RLT3Ewj/
   ooh4ySd0VY33i1Sk9yBo+99ncAItju+MQaLBQ6I/NPR0iLjAAZ+QRLmmO
   URDqwcLiLX8VsckL0jQfJ2COQjLO9U60aaFC62rm8mI1nUTr2yLmT0i5K
   OlP0c+aVcFF+H4y/CxHhUfpmONwgCesdZBH8v+cLeHEpwMnu8zbpGqGLX
   IxP3KVP1DHMRsIqntQvKc39XSsv2n0EQXCPLV6uNhonMcHJUjkGXXJL/r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="360240781"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="360240781"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 18:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="783705049"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="783705049"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jul 2023 18:11:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 2 Jul 2023 18:11:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 2 Jul 2023 18:11:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 2 Jul 2023 18:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxYUovnTmWKo36WJ2G1Iq7TSzayWAPEfebehdCk4sPuQeupUGrOwarXf/HbeI/pjIxw/Hh2jD9yjccJ8aOlXM2EuzpXjQgv9+njrpLEODYnx754K/QvrWPx2OKy409m50gvtioqY10BsNUGo/S/jkEedbC9JXNM/20D7os7cBsIw5jfsQMtd6qnTaUc8XY/6PJKsXr8670mi+kyqWs5nqEBeCzPKnGAYMcN/cqz347X2E3XXeowZkaD06b1R9PsmILmJAFlFYQWxReuyIgcnNdvtc2nnR3BGP1zzC080CvQFMo2PXkAPmUAeDzSVvWdFLLHIDpuVH4u/hLP1DxbkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+mlYbOQpIobgRDXGJS/fRxpvxW/pwqPOPOMUrZjsso=;
 b=SLh4t1949/9DLVxPDZqq1sPAuTsGDrMTHSPcCkj8U7N4WcGEJis3X8AjtSl/J0w5rl/eOZsPDM9QV5O0R28EG0Kb11kVi02aCifk8OHe+55+AwVgfhKILzHkVYh4YcUFI80Kh5P2xP1iq4gYvzjyAdgN1f0KAfj4sxdPMQzS/hC/5x9EGx7dUDn2KaTBaKk7eEXsxOwjg2+hMR/maGRjxo9cMD6BhimL6ijRnScqPsvK0na0tW9VvD9kIPnS/D4Tg/OSffl7P9PF7MGoxUhCj++Nbs9k17S+p9ESjND4dGwdEmlzZZxvwyxbrCw/bk9bmZixBcZf8QtZkkJc2a73UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 01:11:50 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 01:11:49 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "Ye, Xiang" <xiang.ye@intel.com>
CC:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
Thread-Index: AQHZhDKa9RYNq2qAR0ODSRj3xTs13a+njSyg
Date:   Mon, 3 Jul 2023 01:11:49 +0000
Message-ID: <DM6PR11MB43160C970585C24E15CC85FC8D29A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-5-xiang.ye@intel.com>
In-Reply-To: <20230511175844.185070-5-xiang.ye@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB5782:EE_
x-ms-office365-filtering-correlation-id: 20029237-e990-4dc6-9b83-08db7b627a76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytZUyNM5xRVEeblwnPmNy79weDfvHlTm1jfeV4+v67TZkIA3cLG0zMqWp28vs9F2WmqLO81hfYw+U2xGh7cN/PmWDEMU61DZE9wk2jM4Spu1ZXG5tBPq5OcBS4MwVVtyc7o8mjL+O5VDMnr8qrqi1CjoLcYDGp2f4k3/G7dUrRnTAaOWyFsf0afc0i+uuhvRX+NC372mvlx4LnmaTb0HyyljcDr20JfXwBmegxMhqkpFfLCw5Yih1jMrERy6TnUdkGhbR24aIg6HxDURWmxe7mXD+fXqEoVU5Oul/CvNE1et9qxb0osj8xXQ5XKSs8XlrOZGsiv2SldeZpoQNvVaHEQKLy3/OzM3Y95qU7MrhSBT58binFhUpTKaNB1XUGFpCYwbqEK35cl1wV5Bk79tO8k++bwdOlJsynEGkOuTgpaErL71j6tO/WAULVpsiiVSSV5D1Wt/XHR+sNAXYRW/SYxZvYSbpdeRM4Uwj16MWDhUkooncfYkhPhSwtJstnJ027d2i7Lk+qQYYhq2W9gNEjY7CMSWvivzumqtgm/g5HC7km596HfFsoZZYB2txhUZ7BEJIZ1sEk8QS4Pi9VqLoVwKMOe87cMZb3m3mnQpsL/5UQxqliB8UavbqziOM626
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(38100700002)(71200400001)(33656002)(30864003)(2906002)(7696005)(8936002)(8676002)(6862004)(38070700005)(54906003)(55016003)(41300700001)(5660300002)(52536014)(7416002)(478600001)(76116006)(66946007)(66556008)(66476007)(86362001)(66446008)(64756008)(186003)(6636002)(9686003)(26005)(6506007)(4326008)(316002)(122000001)(83380400001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M3qqo6gm3ECE9Xuk4X8ZcUs5GyKlSsRRxhaBEeOp9PkyXfNG69D2bJ3OGhDg?=
 =?us-ascii?Q?xPYf83q10TNTNWurEPDRamgNYdUCjXGBcrR++F2qdWtFdlm+TzRbFNDya3rO?=
 =?us-ascii?Q?A+vkcfiL8atVNQatAUitO4m4bL9ZHF3SJ1IoXNjcNypqe5C+TGuYdFGEGQO9?=
 =?us-ascii?Q?Tl4cNAf0lvCjEdv1GwoVqwU7MEiK1L7Ioz6YKuj/6k10uXaa6xeYzbhueBNf?=
 =?us-ascii?Q?MIg5Sohwt/jCblLp8PbXGE+iAIw05olr3eQzyChK7Gp7+r0Si39L4eoQJ1QK?=
 =?us-ascii?Q?zZm30g26PVz6jlAFTeRl9Jp9s4q6vOFWkW+tMKf2jKlEkd1qacX0US5hlNu7?=
 =?us-ascii?Q?TgcQv7YcDV/h0+G23nemRq1TN22aTVmaTA35IGyMXmdIXR+8uvLv8fXHP7Hb?=
 =?us-ascii?Q?08WhzOREtM1UknYCiagAnEwe5Lt8UHy4qbIt/JiJGcwEukXDQwfHfEperjxC?=
 =?us-ascii?Q?Nww3OBy3vXJzYv4STioOxhoImnFSYs3GzS0KRY6G91dsilVwNOH7HoK6IJug?=
 =?us-ascii?Q?BXsHc/SFoClPe1KeckMhnIb6uF9WaYdT2/mRzn26+XTEfE8k2mwkdVHockQf?=
 =?us-ascii?Q?C1aje8ydJm+F8r37P0zuWpsO5YNoyI6ylMsS+rXBIW+zBFMj5ZQhdy9zGQlA?=
 =?us-ascii?Q?WCMMDe7tLVIPCyi/9pZEYmP2ImF6HyqkMwyWUeuAba21QOkBCylxh69QLQd2?=
 =?us-ascii?Q?GQgoGY6GCIIpqduyHaEDEfa1UcYNi5PTAxM2XIR2pa3Ap5uAoPMgrCYJswqX?=
 =?us-ascii?Q?GUGIY4Mw1ShTpxUfnHPVKcHhxncwoRA814cIo3g46ERJgFiN1LBijgL7MQEe?=
 =?us-ascii?Q?mZW1fMEKXX2R0NkbDMY3Pl3NagGq3A0YnWin5kLZ/sIX37ChWPlqdC5hooZw?=
 =?us-ascii?Q?BWWxtvpLRTnzjthWZk3lawqjj+fXt3pWz0fQcqoTEMwHk9tr4amPCF2iGHKz?=
 =?us-ascii?Q?Yc+UFqC8FBVrZ2JGzEMXEbJb99LxEcw5yI+vX0xWpESezyr5heChn/A8HJpe?=
 =?us-ascii?Q?Gzs94/s2xUIjqamTTzztzHfoSiNwa9gxZOXyeCy3jC9kLMlVlM92CQ/3EA8F?=
 =?us-ascii?Q?7P8Z2f8mEfgWg8Mv94JhfCrEh20O7KsxRYkfgAy9POfxrQDX8X07+iP2OJbh?=
 =?us-ascii?Q?pOamO7vcUgVSp4CU8M/6thImCb+We2cXMdnuvH99AbWu7CE4HnJLEJMXUslN?=
 =?us-ascii?Q?tZ1DBXO61AxwnjjFndgY0KqNal36VnbyyKwMK/I4+0HSmP0D1JNzhQhRBnIw?=
 =?us-ascii?Q?xSu3MWAH8IWXHIHyXw4MbZrExDz3uvLExwO8bzowVKX/BovYlFq9s1F4T82T?=
 =?us-ascii?Q?PaNsJVJhLD8mCetebadZhB6kRAT3S4s5tCalPZlMYNXLfIpvEdWJhHvAwPdB?=
 =?us-ascii?Q?/scUVg3I5VP/OCgrgvhzK5oJTdZah5ioi7KcMLTiks5aX3MxdQEACvdpijdJ?=
 =?us-ascii?Q?z6zEX0dM8R1OunbvgNGxIZxB86OvxArw8pxuEFEMBynRoF+e/NOcJ9MgeF4d?=
 =?us-ascii?Q?Lm9k/kMnHtgr7sAjS17F7eWXTCHAAsC2JuhCYwc6y1tFkK+bzIbN0OwTgCq/?=
 =?us-ascii?Q?1dSTfMzKQSw0TX8qWAlLngdCD30UBMDs0z73t9A1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20029237-e990-4dc6-9b83-08db7b627a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 01:11:49.4579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQazakc2RAw54T/uaSQFH991OJIxAaQ0E3xMA1pw45aO367GuzjHr1YuGn34LFdUH0rMac1dsJSYTkV8xFYYNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Ye, Xiang <xiang.ye@intel.com>
> Sent: Friday, May 12, 2023 1:59 AM
>=20
> Implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter device nam=
ed
> "La Jolla Cove Adapter" (LJCA). It communicate with LJCA GPIO module with
> specific protocol through interfaces exported by LJCA USB driver.
>=20
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---
>  drivers/gpio/Kconfig     |  12 +
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-ljca.c | 479 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 492 insertions(+)
>  create mode 100644 drivers/gpio/gpio-ljca.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> 13be729710f2..bbf00e157dcd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1658,6 +1658,18 @@ config GPIO_VIPERBOARD
>  	  River Tech's viperboard.h for detailed meaning
>  	  of the module parameters.
>=20
> +config GPIO_LJCA
> +	tristate "INTEL La Jolla Cove Adapter GPIO support"
> +	depends on USB_LJCA
> +	select GPIOLIB_IRQCHIP
> +	default USB_LJCA
> +	help
> +	  Select this option to enable GPIO driver for the INTEL
> +	  La Jolla Cove Adapter (LJCA) board.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called gpio-ljca.
> +
>  endmenu
>=20
>  menu "Virtual GPIO drivers"
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile index
> c048ba003367..eb59524d18c0 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+=3D gpio-
> ixp4xx.o
>  obj-$(CONFIG_GPIO_JANZ_TTL)		+=3D gpio-janz-ttl.o
>  obj-$(CONFIG_GPIO_KEMPLD)		+=3D gpio-kempld.o
>  obj-$(CONFIG_GPIO_LATCH)		+=3D gpio-latch.o
> +obj-$(CONFIG_GPIO_LJCA) 		+=3D gpio-ljca.o
>  obj-$(CONFIG_GPIO_LOGICVC)		+=3D gpio-logicvc.o
>  obj-$(CONFIG_GPIO_LOONGSON1)		+=3D gpio-loongson1.o
>  obj-$(CONFIG_GPIO_LOONGSON)		+=3D gpio-loongson.o
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c new file=
 mode
> 100644 index 000000000000..81835a21e8c0
> --- /dev/null
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel La Jolla Cove Adapter USB-GPIO driver
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/dev_printk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/kref.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/usb/ljca.h>
> +
> +/* GPIO commands */
> +#define LJCA_GPIO_CONFIG		1
> +#define LJCA_GPIO_READ			2
> +#define LJCA_GPIO_WRITE			3
> +#define LJCA_GPIO_INT_EVENT		4
> +#define LJCA_GPIO_INT_MASK		5
> +#define LJCA_GPIO_INT_UNMASK		6
> +
> +#define LJCA_GPIO_CONF_DISABLE		BIT(0)
> +#define LJCA_GPIO_CONF_INPUT		BIT(1)
> +#define LJCA_GPIO_CONF_OUTPUT		BIT(2)
> +#define LJCA_GPIO_CONF_PULLUP		BIT(3)
> +#define LJCA_GPIO_CONF_PULLDOWN		BIT(4)
> +#define LJCA_GPIO_CONF_DEFAULT		BIT(5)
> +#define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
> +#define LJCA_GPIO_INT_TYPE		BIT(7)
> +
> +#define LJCA_GPIO_CONF_EDGE
> 	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> +#define LJCA_GPIO_CONF_LEVEL
> 	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> +
> +/* Intentional overlap with PULLUP / PULLDOWN */
> +#define LJCA_GPIO_CONF_SET		BIT(3)
> +#define LJCA_GPIO_CONF_CLR		BIT(4)
> +
> +struct gpio_op {
> +	u8 index;
> +	u8 value;
> +} __packed;
> +
> +struct gpio_packet {
> +	u8 num;
> +	struct gpio_op item[];
> +} __packed;
> +
> +#define LJCA_GPIO_BUF_SIZE 60
> +struct ljca_gpio_dev {
> +	struct ljca *ljca;
> +	struct gpio_chip gc;
> +	struct ljca_gpio_info *gpio_info;
> +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> +	u8 *connect_mode;
> +	/* mutex to protect irq bus */
> +	struct mutex irq_lock;
> +	struct work_struct work;
> +	/* lock to protect package transfer to Hardware */
> +	struct mutex trans_lock;
> +
> +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> +};
> +
> +static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8
> +config) {
> +	struct gpio_packet *packet =3D (struct gpio_packet *)ljca_gpio->obuf;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->item[0].index =3D gpio_id;
> +	packet->item[0].value =3D config | ljca_gpio->connect_mode[gpio_id];
> +	packet->num =3D 1;
> +
> +	ret =3D ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, packet,
> +			    struct_size(packet, item, packet->num), NULL, NULL);
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +
> +	return ret;
> +}
> +
> +static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
> +{
> +	struct gpio_packet *packet =3D (struct gpio_packet *)ljca_gpio->obuf;
> +	struct gpio_packet *ack_packet =3D (struct gpio_packet *)ljca_gpio->ibu=
f;
> +	unsigned int ibuf_len =3D LJCA_GPIO_BUF_SIZE;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->num =3D 1;
> +	packet->item[0].index =3D gpio_id;
> +	ret =3D ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_READ, packet,
> +			    struct_size(packet, item, packet->num), ljca_gpio-
> >ibuf, &ibuf_len);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (!ibuf_len || ack_packet->num !=3D packet->num) {
> +		dev_err(&ljca_gpio->ljca->auxdev.dev,
> +			"read package error, gpio_id:%u num:%u
> ibuf_len:%d\n", gpio_id,
> +			ack_packet->num, ibuf_len);
> +		ret =3D -EIO;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +	if (ret)
> +		return ret;
> +
> +	return ack_packet->item[0].value > 0;
> +}
> +
> +static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> +int value) {
> +	struct gpio_packet *packet =3D (struct gpio_packet *)ljca_gpio->obuf;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->num =3D 1;
> +	packet->item[0].index =3D gpio_id;
> +	packet->item[0].value =3D value & 1;
> +
> +	ret =3D ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_WRITE, packet,
> +			    struct_size(packet, item, packet->num), NULL, NULL);
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +
> +	return ret;
> +}
> +
> +static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int
> +offset) {
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +
> +	return ljca_gpio_read(ljca_gpio, offset); }
> +
> +static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int
> +offset, int val) {
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +	int ret;
> +
> +	ret =3D ljca_gpio_write(ljca_gpio, offset, val);
> +	if (ret)
> +		dev_err(chip->parent, "set value failed offset:%u val:%d
> ret:%d\n", offset, val,
> +			ret);
> +}
> +
> +static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned
> +int offset) {
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +	u8 config =3D LJCA_GPIO_CONF_INPUT | LJCA_GPIO_CONF_CLR;
> +	int ret;
> +
> +	ret =3D gpio_config(ljca_gpio, offset, config);
> +	if (ret)
> +		return ret;
> +
> +	clear_bit(offset, ljca_gpio->output_enabled);
> +
> +	return 0;
> +}
> +
> +static int ljca_gpio_direction_output(struct gpio_chip *chip, unsigned
> +int offset, int val) {
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +	u8 config =3D LJCA_GPIO_CONF_OUTPUT | LJCA_GPIO_CONF_CLR;
> +	int ret;
> +
> +	ret =3D gpio_config(ljca_gpio, offset, config);
> +	if (ret)
> +		return ret;
> +
> +	ljca_gpio_set_value(chip, offset, val);
> +	set_bit(offset, ljca_gpio->output_enabled);
> +
> +	return 0;
> +}
> +
> +static int ljca_gpio_get_direction(struct gpio_chip *chip, unsigned int
> +offset) {
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +
> +	if (test_bit(offset, ljca_gpio->output_enabled))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int ljca_gpio_set_config(struct gpio_chip *chip, unsigned int off=
set,
> +				unsigned long config)
> +{
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +
> +	ljca_gpio->connect_mode[offset] =3D 0;
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		ljca_gpio->connect_mode[offset] |=3D
> LJCA_GPIO_CONF_PULLUP;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		ljca_gpio->connect_mode[offset] |=3D
> LJCA_GPIO_CONF_PULLDOWN;
> +		break;
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +	case PIN_CONFIG_PERSIST_STATE:
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ljca_gpio_init_valid_mask(struct gpio_chip *chip, unsigned lo=
ng
> *valid_mask,
> +				     unsigned int ngpios)
> +{
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(chip);
> +
> +	WARN_ON_ONCE(ngpios !=3D ljca_gpio->gpio_info->num);
> +	bitmap_copy(valid_mask, ljca_gpio->gpio_info->valid_pin_map, ngpios);
> +
> +	return 0;
> +}
> +
> +static void ljca_gpio_irq_init_valid_mask(struct gpio_chip *chip, unsign=
ed long
> *valid_mask,
> +					  unsigned int ngpios)
> +{
> +	ljca_gpio_init_valid_mask(chip, valid_mask, ngpios); }
> +
> +static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int
> +gpio_id, bool enable) {
> +	struct gpio_packet *packet =3D (struct gpio_packet *)ljca_gpio->obuf;
> +	int ret;
> +
> +	mutex_lock(&ljca_gpio->trans_lock);
> +	packet->num =3D 1;
> +	packet->item[0].index =3D gpio_id;
> +	packet->item[0].value =3D 0;
> +
> +	ret =3D ljca_transfer(ljca_gpio->ljca, enable ? LJCA_GPIO_INT_UNMASK :
> LJCA_GPIO_INT_MASK,
> +			    packet, struct_size(packet, item, packet->num), NULL,
> NULL);
> +	mutex_unlock(&ljca_gpio->trans_lock);
> +
> +	return ret;
> +}
> +
> +static void ljca_gpio_async(struct work_struct *work) {
> +	struct ljca_gpio_dev *ljca_gpio =3D container_of(work, struct
> ljca_gpio_dev, work);
> +	int gpio_id;
> +	int unmasked;
> +
> +	for_each_set_bit(gpio_id, ljca_gpio->reenable_irqs, ljca_gpio->gc.ngpio=
)
> {
> +		clear_bit(gpio_id, ljca_gpio->reenable_irqs);
> +		unmasked =3D test_bit(gpio_id, ljca_gpio->unmasked_irqs);
> +		if (unmasked)
> +			ljca_enable_irq(ljca_gpio, gpio_id, true);
> +	}
> +}
> +
> +static void ljca_gpio_event_cb(void *context, u8 cmd, const void
> +*evt_data, int len) {
> +	const struct gpio_packet *packet =3D evt_data;
> +	struct ljca_gpio_dev *ljca_gpio =3D context;
> +	int i;
> +	int irq;
> +
> +	if (cmd !=3D LJCA_GPIO_INT_EVENT)
> +		return;
> +
> +	for (i =3D 0; i < packet->num; i++) {
> +		irq =3D irq_find_mapping(ljca_gpio->gc.irq.domain, packet-
> >item[i].index);
> +		if (!irq) {
> +			dev_err(ljca_gpio->gc.parent, "gpio_id %u does not
> mapped to IRQ yet\n",
> +				packet->item[i].index);
> +			return;
> +		}
> +
> +		generic_handle_domain_irq(ljca_gpio->gc.irq.domain, irq);
> +		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
> +	}
> +
> +	schedule_work(&ljca_gpio->work);
> +}
> +
> +static void ljca_irq_unmask(struct irq_data *irqd) {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
> +	int gpio_id =3D irqd_to_hwirq(irqd);
> +
> +	gpiochip_enable_irq(gc, gpio_id);
> +	set_bit(gpio_id, ljca_gpio->unmasked_irqs); }
> +
> +static void ljca_irq_mask(struct irq_data *irqd) {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
> +	int gpio_id =3D irqd_to_hwirq(irqd);
> +
> +	clear_bit(gpio_id, ljca_gpio->unmasked_irqs);
> +	gpiochip_disable_irq(gc, gpio_id);
> +}
> +
> +static int ljca_irq_set_type(struct irq_data *irqd, unsigned int type)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
> +	int gpio_id =3D irqd_to_hwirq(irqd);
> +
> +	ljca_gpio->connect_mode[gpio_id] =3D LJCA_GPIO_CONF_INTERRUPT;
> +	switch (type) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		ljca_gpio->connect_mode[gpio_id] |=3D
> (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLUP);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		ljca_gpio->connect_mode[gpio_id] |=3D
> (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLDOWN);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		ljca_gpio->connect_mode[gpio_id] |=3D (LJCA_GPIO_CONF_EDGE
> | LJCA_GPIO_CONF_PULLUP);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		ljca_gpio->connect_mode[gpio_id] |=3D (LJCA_GPIO_CONF_EDGE
> | LJCA_GPIO_CONF_PULLDOWN);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ljca_irq_bus_lock(struct irq_data *irqd) {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
> +
> +	mutex_lock(&ljca_gpio->irq_lock);
> +}
> +
> +static void ljca_irq_bus_unlock(struct irq_data *irqd) {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
> +	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
> +	int gpio_id =3D irqd_to_hwirq(irqd);
> +	int enabled;
> +	int unmasked;
> +
> +	enabled =3D test_bit(gpio_id, ljca_gpio->enabled_irqs);
> +	unmasked =3D test_bit(gpio_id, ljca_gpio->unmasked_irqs);
> +
> +	if (enabled !=3D unmasked) {
> +		if (unmasked) {
> +			gpio_config(ljca_gpio, gpio_id, 0);
> +			ljca_enable_irq(ljca_gpio, gpio_id, true);
> +			set_bit(gpio_id, ljca_gpio->enabled_irqs);
> +		} else {
> +			ljca_enable_irq(ljca_gpio, gpio_id, false);
> +			clear_bit(gpio_id, ljca_gpio->enabled_irqs);
> +		}
> +	}
> +
> +	mutex_unlock(&ljca_gpio->irq_lock);
> +}
> +
> +static const struct irq_chip ljca_gpio_irqchip =3D {
> +	.name =3D "ljca-irq",
> +	.irq_mask =3D ljca_irq_mask,
> +	.irq_unmask =3D ljca_irq_unmask,
> +	.irq_set_type =3D ljca_irq_set_type,
> +	.irq_bus_lock =3D ljca_irq_bus_lock,
> +	.irq_bus_sync_unlock =3D ljca_irq_bus_unlock,
> +	.flags =3D IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int ljca_gpio_probe(struct auxiliary_device *auxdev,
> +			   const struct auxiliary_device_id *aux_dev_id) {
> +	struct ljca *ljca =3D auxiliary_dev_to_ljca(auxdev);
> +	struct ljca_gpio_dev *ljca_gpio;
> +	struct gpio_irq_chip *girq;
> +	int ret;
> +
> +	ljca_gpio =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio),
> GFP_KERNEL);
> +	if (!ljca_gpio)
> +		return -ENOMEM;
> +
> +	ljca_gpio->ljca =3D ljca;
> +	ljca_gpio->gpio_info =3D dev_get_platdata(&auxdev->dev);
> +	ljca_gpio->connect_mode =3D devm_kcalloc(&auxdev->dev, ljca_gpio-
> >gpio_info->num,
> +					       sizeof(*ljca_gpio->connect_mode),
> GFP_KERNEL);
> +	if (!ljca_gpio->connect_mode)
> +		return -ENOMEM;
> +
> +	mutex_init(&ljca_gpio->irq_lock);
> +	mutex_init(&ljca_gpio->trans_lock);
> +	ljca_gpio->gc.direction_input =3D ljca_gpio_direction_input;
> +	ljca_gpio->gc.direction_output =3D ljca_gpio_direction_output;
> +	ljca_gpio->gc.get_direction =3D ljca_gpio_get_direction;
> +	ljca_gpio->gc.get =3D ljca_gpio_get_value;
> +	ljca_gpio->gc.set =3D ljca_gpio_set_value;
> +	ljca_gpio->gc.set_config =3D ljca_gpio_set_config;
> +	ljca_gpio->gc.init_valid_mask =3D ljca_gpio_init_valid_mask;
> +	ljca_gpio->gc.can_sleep =3D true;
> +	ljca_gpio->gc.parent =3D &auxdev->dev;
> +
> +	ljca_gpio->gc.base =3D -1;
> +	ljca_gpio->gc.ngpio =3D ljca_gpio->gpio_info->num;
> +	ljca_gpio->gc.label =3D ACPI_COMPANION(&auxdev->dev) ?
> +			      acpi_dev_name(ACPI_COMPANION(&auxdev->dev)) :
> +			      dev_name(&auxdev->dev);
> +	ljca_gpio->gc.owner =3D THIS_MODULE;
> +
> +	auxiliary_set_drvdata(auxdev, ljca_gpio);
> +	ljca_register_event_cb(ljca, ljca_gpio_event_cb, ljca_gpio);
> +
> +	girq =3D &ljca_gpio->gc.irq;
> +	gpio_irq_chip_set_chip(girq, &ljca_gpio_irqchip);
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_simple_irq;
> +	girq->init_valid_mask =3D ljca_gpio_irq_init_valid_mask;
> +
> +	INIT_WORK(&ljca_gpio->work, ljca_gpio_async);
> +	ret =3D gpiochip_add_data(&ljca_gpio->gc, ljca_gpio);
> +	if (ret) {
> +		ljca_unregister_event_cb(ljca);
> +		mutex_destroy(&ljca_gpio->irq_lock);
> +		mutex_destroy(&ljca_gpio->trans_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static void ljca_gpio_remove(struct auxiliary_device *auxdev) {
> +	struct ljca_gpio_dev *ljca_gpio =3D auxiliary_get_drvdata(auxdev);
> +
> +	gpiochip_remove(&ljca_gpio->gc);
> +	ljca_unregister_event_cb(ljca_gpio->ljca);
> +	cancel_work_sync(&ljca_gpio->work);
> +	mutex_destroy(&ljca_gpio->irq_lock);
> +	mutex_destroy(&ljca_gpio->trans_lock);
> +}
> +
> +#define LJCA_GPIO_DRV_NAME "ljca.ljca-gpio"

The wrong name causes the probe match failed. The name should be
"usb_ljca.ljca-gpio", the same as spi and i2c.

BR,
Wentong
=20
> +static const struct auxiliary_device_id ljca_gpio_id_table[] =3D {
> +	{ LJCA_GPIO_DRV_NAME, 0 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
> +
> +static struct auxiliary_driver ljca_gpio_driver =3D {
> +	.probe =3D ljca_gpio_probe,
> +	.remove =3D ljca_gpio_remove,
> +	.id_table =3D ljca_gpio_id_table,
> +};
> +module_auxiliary_driver(ljca_gpio_driver);
> +
> +MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
> MODULE_AUTHOR("Wang
> +Zhifeng <zhifeng.wang@intel.com>"); MODULE_AUTHOR("Zhang Lixu
> +<lixu.zhang@intel.com>"); MODULE_DESCRIPTION("Intel La Jolla Cove
> +Adapter USB-GPIO driver"); MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(LJCA);
> --
> 2.34.1

