Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40877B3178
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 13:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjI2Ld4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 07:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2Ldz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 07:33:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4535594;
        Fri, 29 Sep 2023 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695987234; x=1727523234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uinJ3e3V0VeMeHgBBOWV/JQ07AcsyIv6OF+MkFOPxMc=;
  b=a0EdJUTMhKTw5MRAB5oO8ZRFC1p2YW8klH3Qz8pdnbN6HZRa9/VUQGbr
   9QtyCtY9J57TWi8L5rLNLPFOfo3qwRXJP6c6D8Tq05jZLcKELDTTp29BU
   hp4WscM4lnfyfunJlRoj+CjXlt+rLTNA7163Kue86/GSK38zxNalg6Mma
   z+0XoN33n9LAkFJyNwHBL+xb0CC28SV2otL5X+WPftUVmH0Mv8AzSNWNt
   mg4okA0ik60fv0lYcE24iQINXakO6gU7DNLkV5PXKC3MOvKtEMGMOcshx
   xfBP279U+zUKMygnm0gR5TVIsXlvw5BfNC4c26eap8qHimLzN+XHail2t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3852706"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="3852706"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 04:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="831985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Sep 2023 04:33:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 04:33:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 04:33:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 04:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOVKKAl2rsKguEGlw6INOXSaFkpXDXa+9bmE/eMVFBOebLVGYMNHISYISQjGZ7GzAtDluoRViW0O6YH3S8MW1B41G60ochPFGzYcRhagM0vHHBe6spkUtb12abCnR5tdWnmMFrRRpQZtx7NpmuahPocbXZA+J3lgqMVl1ET6W88nL8GvE1rHI92PhHbnyjwP1mBnY2gmN0d0G1vl/Iqo3YU0cwNE9L9VruzrSAdmSihxylgKMe+UoEmJc940ULwAoBSDB2gssBwgYNR0aMlNiLid7tDEwV3LRmt/mYuG9rXaTEofLFd+vAre5DKRX9J9NhsgzvsjNDaaSD1HvwunNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPn8YhMDk51xfWnV9g267pLZdtlPq8C5YAmxfZuzl/w=;
 b=OeKStQFbVKGtReE9SAovSNFc5qN4v2Ci/qQARYISRwzn8Bl9s1zry4z6EwRcED2qCzzul1etwH/MPcKIi0fFVCXXCDLLSg3TAAh1zsAT68rLi7KKRi3j4NQ26s3RNM+yKiOVcVZmyCvCQdpVjxGWgh79ZQgp3p1ApMq6zQemAePQa/xZgF8OOPmiJZq05+/+vuJdgZAyOwPoHsL2hJnHNCAmWczw4s7Kj16Ps8EwrgIAkAT+bssFX8QUU2bu3/sTyF18WSXki52ZQTv5xvV7o5f/Uq4t2I4kF/AxMhMBl4jB8z62cRLmn9pqs01LLM/5lxj1gC+0qH5ytPUP/mXtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 29 Sep
 2023 11:33:43 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 11:33:43 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v19 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v19 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Index: AQHZ6M80YQLhbG9Bu0uQZJMBewOctrAwW0uAgAAEEMA=
Date:   Fri, 29 Sep 2023 11:33:43 +0000
Message-ID: <DM6PR11MB4316DB0A0F797812EF558E458DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-5-git-send-email-wentong.wu@intel.com>
 <2023092804-cider-viscosity-03b6@gregkh>
In-Reply-To: <2023092804-cider-viscosity-03b6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SA1PR11MB5921:EE_
x-ms-office365-filtering-correlation-id: a7e3edd3-83f9-40bc-6cd3-08dbc0dfefab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZEKTvrAr42fv5JIh5EdOXZ9PgBVctrYTco320GZM93ZK3fvUKgQbiPgqoOi0H/1Jxc/tmO0E4/Yec8XpB4pQgzzyaA/h3UlLQl6ZtG3mnXW+KCQEeUuapGvbCeX7FSZusgZWYXhaEJ72D95La2uXRuWGMEEmQg9MbGHW4jXnSh99GsgSnoEKDAKC8hEviRAJspKMplVMDsyDMiPXt9lYTceo97Xz/sEdzFGUotSw+06MrudspDtfp3pfAihpB6C38kUo1SJ2v9lUMh/ysVyQeTomlSuJ9C8zSo5OQE7hQ/NdQCz9V3+neMqTW/Upw2tk8px9CrNbkhn2j7/7u76VSWQreWWOBUEsAmtosYzma/vmG35+bwgf/azcVWXD6GcGMDQBpx9VdGOBp4+sgK+IGm5QUBpZz2j4KxFjWGaPXaQqtZMjyC1KjReABQ1Utj3hdcY8EPkCuG+E4E9yMU4WaVRh9241f8OpHuajFr8s8uiBz46QNWlRogLj8Pw27hcnKYbPq4fK32htZq1Tqd6PVHAa24SYv96f9Qq3/4dv8XYp88ToBTkSPsp9P2nVbdsRurGpUenBHbkG3upOKkBhxfM0QCKj5iSRuxSJXZHNqenjxtS5h3Z5TOWD7WcI7p+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(15650500001)(54906003)(316002)(5660300002)(66556008)(52536014)(8936002)(8676002)(6916009)(64756008)(76116006)(41300700001)(66946007)(2906002)(66446008)(66476007)(9686003)(478600001)(7696005)(6506007)(7416002)(71200400001)(26005)(4326008)(83380400001)(55016003)(82960400001)(86362001)(33656002)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nD/APzkxqDxY9b2WUxoNNnbbuLnnPkipCIc8PfRktngXCSskENHKeUtiFAKb?=
 =?us-ascii?Q?cDllBCFAKPdP3y5990vV4r5AE97hWBOoswATCGYMgZD/nBvwy6sy1dTVlLxi?=
 =?us-ascii?Q?vzt6LvG+b3qlA1iCLSD/nALf/Y2OsrnCxSznI8Xb57chfmEsAxoeshMzkr44?=
 =?us-ascii?Q?7GeLpBK8zEDTIElUXb7wS+BMNlp05vmDCzCa5PPX30MbWu9joCXbnH7OPR2a?=
 =?us-ascii?Q?rC8DgY6F49TYW5rlei0LcuhucASll0jd9Tn5rt3s9QxQO4OB1fz4CWQYdPu6?=
 =?us-ascii?Q?epx87axzeEeXxe8fa44BZLeilWCJBMZhAKIXZNlIcrN3n/3CHD8+ZSnoLCKS?=
 =?us-ascii?Q?aO3ymIvV60ZKuq3SQP5UgQBgAdyrjrj8Xlbp+E/2umV5PHupcDXU+/GADA16?=
 =?us-ascii?Q?VbAGwFGzN68iRGd2Py8Aise0O9KMvl9y46QwhhJlHGR6ngIPt0FT4kM39qYG?=
 =?us-ascii?Q?/9nemfgHJyKb1kV6B2qJIqjNWgGrSH6krOnGnLTKva7T3PE4y2RbSQssv4Jb?=
 =?us-ascii?Q?0G1kP+I2k9Z2g+qchRgq+rXoVGK8ViTKyfKkSo4cAl4u4LIE3QZyhkS1cvYJ?=
 =?us-ascii?Q?fC1xVdhXmu8JB/7W1SFHM8JxpWyMHa4JgQj6beAWk7bBZwXBEpbZ9vYL93fI?=
 =?us-ascii?Q?wAjrvCHfJYN60t7VIVS8Y2orltsAEUaTdWAo5twWVZ2AILXxbd43rzqEdE9t?=
 =?us-ascii?Q?u6FAB+Sae1zdrPRlMThtG9nqFnvnjGO4Z2cWibufrD45by1dgEgxUC6hoU/r?=
 =?us-ascii?Q?zsl4HY+NTOGsqTFc5+ZUh7CXm2+vJJlg2FD63rMrRmoR9kXj9Njt91X/f3qp?=
 =?us-ascii?Q?gGivgH6sKpFYb3l4DfDvauxDELyOj/3iFmebnxNl7AGo4OJhb/5uC5D3EeNn?=
 =?us-ascii?Q?FL9eP8BcUMNaS494XyVphJ147kjeYQE0bKgZxGpt7dT4fOchVUms6G/lpmX0?=
 =?us-ascii?Q?uoiXL3eo1Ec4rhKxw4jtHV2VaQDA+nutbwz0HJ2fVSYYCtqrXUhS1WyDUBts?=
 =?us-ascii?Q?enSigi4KqZjXCKHERIm3Cr5LO/eW9rpGoTRnRB5Q/pSzWCfBCX3ZYWozxslm?=
 =?us-ascii?Q?3BLknd9jMACeQSz0azUXHUXtATIECOIVVFMou2TDqeIF6FIneXqMv73CK8Q2?=
 =?us-ascii?Q?azunCQ52TYOhwfMzOL7sSHlbb9v3z+XYyQowot/9WinkoCM3vSS9qYSWFgQ7?=
 =?us-ascii?Q?aWd6oO50Q+FrPpB6DBU/DdnvoDfPSf2Zb4NCMQIEfh1I0qnBF+T8q6nI/DPw?=
 =?us-ascii?Q?DGhSphKV7FZKGUeCRvGsZIGv+1HznmQSNjeXYsHCw3PBIESm987lrSS0oUD5?=
 =?us-ascii?Q?y96OISFPka5ZV3hpFy/nQqOvbjVSRqUbeXIN6WANEeE0janunSJk5EHtQ5bZ?=
 =?us-ascii?Q?maqvnk+HwJ6KLoMqV7NPw4obVI13qWYucFGznzP4pxgJZJj+D3FWxL44iJhF?=
 =?us-ascii?Q?xCoHrNV6k7UXAxL9GZaI+xqBxJNxYy/pRGJBiD0ndr17roDeqHEhKeATwSGR?=
 =?us-ascii?Q?cHMnF/jSooFVMwwnRvRR978JF9fr1KYn3KAGRz0XYo5RD4XkhC/+9ikO7xRn?=
 =?us-ascii?Q?sVgHZf5Jjsbjorepq1RLfKBp+O1lHFzFpzIxN72M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e3edd3-83f9-40bc-6cd3-08dbc0dfefab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 11:33:43.3842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0w2QQ4SV111JQ1NkLjlYgOZWK5RITfHoDFI0VOdTlLdnZWf9wFqVs6UJSwo5eLOeE1732SiT2dZhlmDmAhvCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Greg KH
> On Sun, Sep 17, 2023 at 02:53:36AM +0800, Wentong Wu wrote:
> > This driver communicate with LJCA GPIO module with specific protocol
> > through interfaces exported by LJCA USB driver.
> > Update the driver according to LJCA USB driver's changes.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Tested-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/gpio/Kconfig     |   4 +-
> >  drivers/gpio/gpio-ljca.c | 246
> > +++++++++++++++++++++++++++--------------------
> >  2 files changed, 145 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> > 673bafb..8d5b6c3 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1312,9 +1312,9 @@ config GPIO_KEMPLD
> >
> >  config GPIO_LJCA
> >  	tristate "INTEL La Jolla Cove Adapter GPIO support"
> > -	depends on MFD_LJCA
> > +	depends on USB_LJCA
> >  	select GPIOLIB_IRQCHIP
> > -	default MFD_LJCA
> > +	default USB_LJCA
> >  	help
> >  	  Select this option to enable GPIO driver for the INTEL
> >  	  La Jolla Cove Adapter (LJCA) board.
> > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c index
> > 87863f0..7fae26d 100644
> > --- a/drivers/gpio/gpio-ljca.c
> > +++ b/drivers/gpio/gpio-ljca.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/acpi.h>
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> >  #include <linux/dev_printk.h>
> > @@ -13,19 +14,18 @@
> >  #include <linux/irq.h>
> >  #include <linux/kernel.h>
> >  #include <linux/kref.h>
> > -#include <linux/mfd/ljca.h>
> >  #include <linux/module.h>
> > -#include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <linux/usb/ljca.h>
> >
> >  /* GPIO commands */
> > -#define LJCA_GPIO_CONFIG	1
> > -#define LJCA_GPIO_READ		2
> > -#define LJCA_GPIO_WRITE		3
> > -#define LJCA_GPIO_INT_EVENT	4
> > -#define LJCA_GPIO_INT_MASK	5
> > -#define LJCA_GPIO_INT_UNMASK	6
> > +#define LJCA_GPIO_CONFIG		1
> > +#define LJCA_GPIO_READ			2
> > +#define LJCA_GPIO_WRITE			3
> > +#define LJCA_GPIO_INT_EVENT		4
> > +#define LJCA_GPIO_INT_MASK		5
> > +#define LJCA_GPIO_INT_UNMASK		6
>=20
> Why are you changing whitespace for no good reason?

This is to make all the macro value in the same column to
make them look better.

>=20
> Please don't do that, it makes finding the actual changes in this driver =
impossible
> to notice and review.

Understand, I'll follow this going forward. Thanks

Thanks
Wentong
>=20
>=20
>=20
> >
> >  #define LJCA_GPIO_CONF_DISABLE		BIT(0)
> >  #define LJCA_GPIO_CONF_INPUT		BIT(1)
> > @@ -36,45 +36,49 @@
> >  #define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
> >  #define LJCA_GPIO_INT_TYPE		BIT(7)
> >
> > -#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> > -#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> > +#define LJCA_GPIO_CONF_EDGE
> 	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> > +#define LJCA_GPIO_CONF_LEVEL
> 	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> >
> >  /* Intentional overlap with PULLUP / PULLDOWN */
> > -#define LJCA_GPIO_CONF_SET	BIT(3)
> > -#define LJCA_GPIO_CONF_CLR	BIT(4)
> > +#define LJCA_GPIO_CONF_SET		BIT(3)
> > +#define LJCA_GPIO_CONF_CLR		BIT(4)
> >
> > -struct gpio_op {
> > +#define LJCA_GPIO_BUF_SIZE		60u
>=20
> Why "u"?  What requires that?
>=20
> Odd, sorry, I know people are just getting tired of the constant churn he=
re, but
> really, you know better than making changes that are not needed, or not
> documented.
>=20
> greg k-h
