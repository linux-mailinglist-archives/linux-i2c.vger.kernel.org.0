Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C996B6792
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 16:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjCLPkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 11:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCLPkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 11:40:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C922BF3D;
        Sun, 12 Mar 2023 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678635611; x=1710171611;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XQ2JMiDRhFcB5zJ/DDEbek4aExSjxwXhq4QWVBsg2pg=;
  b=j/5DR6zW+uI0+sd6MlGxdsAYuKssPemdB5HHEntF1GVC+KPZGjYEGjND
   uQ9D0Ej0s7Nb5Nwz/tLOJY5QMsndMbCjpTyqEza7wchA28akVDLMyhJON
   /5NDckdopI4mhhlEEWR8zn9WAlXhLd0AubDugcMj48o8yPngncXFMW+gm
   WBX+TnSyW/y8z4m2UdIKn/nq2lIRqj8Lw72T3Imt3NEyZgpr6mzhlk8O/
   lkbbgbfOWqfQCwCcFjsmq0yqUzKDTNmiaOIvhmVMUJfs9p2TnCBfxa5jB
   jQWf7uWFA+wy58WI0DyfVJA7HVUpBv+D5L/LqRkVCBl+nFFu/Uo7bRYDe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="401866538"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="401866538"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 08:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="788637724"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="788637724"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2023 08:40:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 12 Mar 2023 08:40:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 12 Mar 2023 08:40:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 12 Mar 2023 08:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eksDSWbfhfEoJA1ovU6lJYotoxqke8aCxq6PP91r5RRXkVEoOY84wX+spojoJogW/27mHLNpIRGhl30njsknfQorP2PhZukIRkLwSNwMKc58AzDkOFOXF+4nB4H/ivWNrvEFI/YYD9mf5ZXWAoIwDb1DgUJOftQSUQyskN/62QPIyDYDn98sKZZVrdy1EIDGPTqRwYcwpiXCeC3wfm5Sc+L6hsQPZTjUIDhd8PzWMNcmTrlsVughgDELj0STyZmCqFtRQRDAduZBdfp+dJqbSZNcNjI4imT11FZWgXxjcQZabtSTCFo5LuUb1JONjF6Thzf9H/iW9fy7h+MshmNPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmvXnBT/dz/iK9VicpcyN4B3EYAG/ckECa6v/hZ4+X0=;
 b=MFhVHuAKMb5YwaQy3PRyfht31mhrru8OClDI7pLTKjen8OLrxoPlSovmwtsgJr+pbIzKQ2Tr476EmqPzjbxoNbr5slHAQPYiLjSTEfaFFpLkw9Qg/7YO5gOb0ZJjIg6qFAhnNlRrtwk54+AvCirWx91EvG/z3mnwo/3q2nXFQJKMZd9rQJFKaJyBZFNo/9+uM22V1HignYsQXZJGGZb/ZCmzo/ied2gwcc9DUYXWVZgZejFBGFC9piSen0P+R8hNs1kQSJpBZt6W8hxeo9zfS9NbnE/3bJSCgMGb2iHTvYwtRHGtEkSrBnfA6OhnY5WoOcYSXfueC5VJMEJPkDufVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Sun, 12 Mar 2023 15:40:07 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 15:40:07 +0000
Date:   Sun, 12 Mar 2023 23:40:00 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Matthias Kaehlcke" <mka@chromium.org>, Lee Jones <lee@kernel.org>,
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
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZA3yUAHgZ2ATqaLd@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <89c7a6f9-5911-6613-6e58-b93d8f73be2a@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89c7a6f9-5911-6613-6e58-b93d8f73be2a@kernel.org>
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a47e3e-aee8-41e9-0df0-08db23100e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ix3hp5hmOCHGBOySrt5y5fh4aUN9PrOujVGgDNgfmdYXxRQi1+7rJravusluv54szXfyMwgQoKRqzkzkmr7cTI04UsbvoewokiluYVH8474ukl48qf1QSXZikHybTWa6Y3bHvdwfbVp/W/fIID/vLfqARNa3LeUO/Rj/3kExmxQnXv7/RHtSdYGVQ17cYpyggT8n9ezhhQ8zIEbBJU1B+SWqLshfegUmWfEz5hd9lxbIdazUz82AQDLPArP5wbPdpQC0536Fec6+cisvYKNTJpIYr7PRxvZJ2VT3ggCXTFDkSnbfwoHZVpd6bU8KGHaev2Uk/xMOrXP4251gxgVtOww/vGfNvp/m6HI5JkzH/LWjgw4dTjOlkFe4FUiBlf1y6UxFFygxUUS0vw+CXnocLV7cWr0AeQ5jwgY9eHRwZFRyKEtT8A5tjta9a8oWs7YkLIsmV8AeaTlvv9iZpgEsMrIHO8yQ4VA2bdhDw6c3AP6yMRLCnjBKe8jV04F0Cuob3P/q5X/Zf/JhNhdJPsjibeoJe3g+EmoU853cLxn7DYFDFZGrAxmnPBrxEJxLz5S0x5cffq2DAa+HkB6NPBj0eXQcoitH01N+YB9/5s+6fGMUN4vxu3oaACyJ8xRtT3ODtKs7g5n+AnpDk47RbzP7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(8936002)(7416002)(5660300002)(26005)(6506007)(33716001)(9686003)(53546011)(82960400001)(66946007)(6666004)(38100700002)(83380400001)(316002)(6916009)(6512007)(41300700001)(54906003)(66476007)(4326008)(66556008)(8676002)(86362001)(186003)(478600001)(6486002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2T+rwKwhbTCZi0ubp0lpR58cR8OGN3DIA3icGRhFz6ZIHING8OCa6Pp4CX9?=
 =?us-ascii?Q?bTT3gQhjRVW0psBItSaP+Q0twWdl++cRqqMlTAQvNaK7VN24Ue4ZPgKtQKKx?=
 =?us-ascii?Q?X6mmzaT+Ns9V3E0uHgEouqZzmoM/VgK+vaWRFxvg3Ef5le3vgj63CmUGBDAp?=
 =?us-ascii?Q?vb/TxRuJ2ERwxviZHKfRp3Sj32UZFqa/2O6Uw2Tvbylrqv7TnTOmv1nOHwnY?=
 =?us-ascii?Q?Q9dKNmemAvzCYjd5qFsV4Kw4eyy/KfSZArDsOTNOEZ87td7eB5BGxjx3QOcv?=
 =?us-ascii?Q?n+tJeqows2tE1O9OlHX7eHejlfHK3LWe3BxdVCCVrSPguzL83eeieSSU9ISt?=
 =?us-ascii?Q?VMN+sVlgOy6TllHT4cV59U4M7Ski/w5iBikM0ysJAU+5cK32M0jNdOUsCuzA?=
 =?us-ascii?Q?6E8naRUGlLEn7ihqKwebQiWff2Zoh4S+HBplawQIeBNEqByqFo1quQchkC9t?=
 =?us-ascii?Q?IoizcaZCmyGziukgQKMs0dSzJPi4zZmulcamAgv5bnfve4XO2bMA4TCcR9ty?=
 =?us-ascii?Q?3BgI1ClrupRMG1H0/lxjxjnDR3XN+ncVDrpR524TjCaTuAyojyuZKiInEzul?=
 =?us-ascii?Q?/yUKZYYPR/No4JGHE3JZCgW315jSdj0ebssb4E1mBvVRVym6Li86O4vClB2M?=
 =?us-ascii?Q?GA/HoB8q1LhFpRg33F3eKUG2x4xW3cMx+rFUpcKVY+xmas6SjcskFLT66/1D?=
 =?us-ascii?Q?7M2/xSrBYWkBwzoL08SRFbWM1/KvGHnZJHhkGq6bt9Lj7ctTyOPf3hkPzQbp?=
 =?us-ascii?Q?q4xqieOE2htsKJ/zHA464/64d5G5rcEV3udXG8p/4QaHxl0jucRPB4jAe13g?=
 =?us-ascii?Q?/ABvqSzQxIReT2k3Qjz9YIBTSbnzAusjNBW3twsaTi9QFGjbjwsHb8DavfCr?=
 =?us-ascii?Q?7ncM8fcSrQQEKqL1UMW3mmVgJLKgMHdSUAYZh/ihX9KNIeF2lD1Vf7IlO13r?=
 =?us-ascii?Q?gnj5HkPwnT0aTC5r9+nbiAToquNPiELCMhkUcDU2EhpNYkMBHpTovpx4v9PO?=
 =?us-ascii?Q?7NtDE8nz7QIiqUFexxK9f7pj8VdoO9/uPkUDCOPW6aSotabpMIGiyNLIGfFc?=
 =?us-ascii?Q?k/vPePMdAWNRJbZykLetBMMJpQQX5NENlfml9OJ2hmYy7GuvMSCXUP/WAPNt?=
 =?us-ascii?Q?p48ZF3y8KaoTeTQYhmGHOgS4fR9KOszrcCMC9E/+iN0rTKYjH2Te3MkVXZqB?=
 =?us-ascii?Q?DtJV2anJ+EArdxyaoyAcg+acseryB3gvNFo4FKPCprvjSBgZJT5aTmN4UjrC?=
 =?us-ascii?Q?7/1GQ/g9XY1Krf2ZI7UYwZ2x8oqrqELHYsYoSwp1TOdwLiahZvnPGLp7azuG?=
 =?us-ascii?Q?a6u/RFOW+RKv5Gl05eWmAQXlEfHx57bVkfvr+vOa9d9WqBvGVNZW2K91rBQ4?=
 =?us-ascii?Q?KH/e6QfKn+gkm/a5sXCXEdvgd4wWWpsDz79RePWCcAtFyy9kPdhs4/uohB8T?=
 =?us-ascii?Q?loFGL1aGOGr0aFmbReaaPul7rQZFQvmCZAfm5k5TtfH/Hl8FF/QFdsrEehcK?=
 =?us-ascii?Q?vFFqhSQ3hStaIhSs4dFsszd66LBFvMsigm43ZXZNXAsUMRI2CeILIc4JK7fH?=
 =?us-ascii?Q?ghRIuOYuCSEnvmSt+jaiYaGSyKhCBKD1JhB1UHRP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a47e3e-aee8-41e9-0df0-08db23100e6b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 15:40:07.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbnU1NH640NHb8iXtL/erNPmeVApxOTNTrqie2906Twegp7TgMOWAPIaDgrksTTdBAhc1kmDixypdeNLzXExJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

Thanks for your review.
On Sat, Mar 11, 2023 at 01:13:30PM +0100, Krzysztof Kozlowski wrote:
> On 09/03/2023 08:10, Ye Xiang wrote:
> > This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> > GPIO module with specific protocol through interfaces exported by LJCA USB
> > driver.
> > 
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpio/Kconfig     |  12 ++
> >  drivers/gpio/Makefile    |   1 +
> >  drivers/gpio/gpio-ljca.c | 454 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 467 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-ljca.c
> > 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 13be729710f2..8be697f9f621 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1253,6 +1253,18 @@ config GPIO_KEMPLD
> >  	  This driver can also be built as a module. If so, the module will be
> >  	  called gpio-kempld.
> >  
> > +config GPIO_LJCA
> > +	tristate "INTEL La Jolla Cove Adapter GPIO support"
> > +	depends on MFD_LJCA
> > +	select GPIOLIB_IRQCHIP
> > +	default MFD_LJCA
> > +	help
> > +	  Select this option to enable GPIO driver for the INTEL
> > +	  La Jolla Cove Adapter (LJCA) board.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called gpio-ljca.
> > +
> >  config GPIO_LP3943
> >  	tristate "TI/National Semiconductor LP3943 GPIO expander"
> >  	depends on MFD_LP3943
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index c048ba003367..eb59524d18c0 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -77,6 +77,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
> >  obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
> >  obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
> >  obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
> > +obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
> >  obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
> >  obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
> >  obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
> > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> > new file mode 100644
> > index 000000000000..87863f0230f5
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-ljca.c
> > @@ -0,0 +1,454 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Intel La Jolla Cove Adapter USB-GPIO driver
> > + *
> > + * Copyright (c) 2023, Intel Corporation.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kref.h>
> > +#include <linux/mfd/ljca.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +
> > +/* GPIO commands */
> > +#define LJCA_GPIO_CONFIG	1
> > +#define LJCA_GPIO_READ		2
> > +#define LJCA_GPIO_WRITE		3
> > +#define LJCA_GPIO_INT_EVENT	4
> > +#define LJCA_GPIO_INT_MASK	5
> > +#define LJCA_GPIO_INT_UNMASK	6
> > +
> > +#define LJCA_GPIO_CONF_DISABLE		BIT(0)
> > +#define LJCA_GPIO_CONF_INPUT		BIT(1)
> > +#define LJCA_GPIO_CONF_OUTPUT		BIT(2)
> > +#define LJCA_GPIO_CONF_PULLUP		BIT(3)
> > +#define LJCA_GPIO_CONF_PULLDOWN		BIT(4)
> > +#define LJCA_GPIO_CONF_DEFAULT		BIT(5)
> > +#define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
> > +#define LJCA_GPIO_INT_TYPE		BIT(7)
> > +
> > +#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> > +#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> > +
> > +/* Intentional overlap with PULLUP / PULLDOWN */
> > +#define LJCA_GPIO_CONF_SET	BIT(3)
> > +#define LJCA_GPIO_CONF_CLR	BIT(4)
> > +
> > +struct gpio_op {
> > +	u8 index;
> > +	u8 value;
> > +} __packed;
> > +
> > +struct gpio_packet {
> > +	u8 num;
> > +	struct gpio_op item[];
> > +} __packed;
> > +
> > +#define LJCA_GPIO_BUF_SIZE 60
> > +struct ljca_gpio_dev {
> > +	struct platform_device *pdev;
> > +	struct gpio_chip gc;
> > +	struct ljca_gpio_info *gpio_info;
> > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > +	u8 *connect_mode;
> > +	/* mutex to protect irq bus */
> > +	struct mutex irq_lock;
> > +	struct work_struct work;
> > +	/* lock to protect package transfer to Hardware */
> > +	struct mutex trans_lock;
> > +
> > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > +};
> > +
> > +static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
> > +{
> > +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> > +	int ret;
> > +
> > +	mutex_lock(&ljca_gpio->trans_lock);
> > +	packet->item[0].index = gpio_id;
> > +	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
> > +	packet->num = 1;
> > +
> > +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_CONFIG, packet,
> > +			    struct_size(packet, item, packet->num), NULL, NULL);
> > +	mutex_unlock(&ljca_gpio->trans_lock);
> > +	return ret;
> > +}
> > +
> > +static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
> > +{
> > +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> > +	struct gpio_packet *ack_packet = (struct gpio_packet *)ljca_gpio->ibuf;
> > +	unsigned int ibuf_len = LJCA_GPIO_BUF_SIZE;
> > +	int ret;
> > +
> > +	mutex_lock(&ljca_gpio->trans_lock);
> > +	packet->num = 1;
> > +	packet->item[0].index = gpio_id;
> > +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_READ, packet,
> > +			    struct_size(packet, item, packet->num), ljca_gpio->ibuf, &ibuf_len);
> > +	if (ret)
> > +		goto out_unlock;
> > +
> > +	if (!ibuf_len || ack_packet->num != packet->num) {
> > +		dev_err(&ljca_gpio->pdev->dev, "failed gpio_id:%u %u", gpio_id, ack_packet->num);
> > +		ret = -EIO;
> > +	}
> > +
> > +out_unlock:
> > +	mutex_unlock(&ljca_gpio->trans_lock);
> > +	if (ret)
> > +		return ret;
> > +	return ack_packet->item[0].value > 0;
> > +}
> > +
> > +static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
> > +			   int value)
> > +{
> > +	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
> > +	int ret;
> > +
> > +	mutex_lock(&ljca_gpio->trans_lock);
> > +	packet->num = 1;
> > +	packet->item[0].index = gpio_id;
> > +	packet->item[0].value = value & 1;
> > +
> > +	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_WRITE, packet,
> > +			    struct_size(packet, item, packet->num), NULL, NULL);
> > +	mutex_unlock(&ljca_gpio->trans_lock);
> 
> Everywhere you have unusual coding pattern around return. There is
> almost always line break before return. Adjust to the kernel style.
Got it. Will add a blank line before return.
> 
> > +	return ret;
> > +}
> 
> (...)
> 
> > +
> > +#define LJCA_GPIO_DRV_NAME "ljca-gpio"
> > +static const struct platform_device_id ljca_gpio_id[] = {
> > +	{ LJCA_GPIO_DRV_NAME, 0 },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(platform, ljca_gpio_id);
> 
> ljca_gpio_id is unused (except module autoloading). How do you bind your
> devices?
driver.name = LJCA_GPIO_DRV_NAME, this driver name is used to bind
with devices. 
> > +
> > +static struct platform_driver ljca_gpio_driver = {
> > +	.driver.name = LJCA_GPIO_DRV_NAME,
> > +	.probe = ljca_gpio_probe,
> > +	.remove = ljca_gpio_remove,
> 
> 
--
Thanks
Ye Xiang
