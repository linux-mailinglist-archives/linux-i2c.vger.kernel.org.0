Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15B16A2072
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 18:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjBXRZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 12:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjBXRZd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 12:25:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7DC18ABF;
        Fri, 24 Feb 2023 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677259533; x=1708795533;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gOeoPUunRtqrWAPxVFi+A+bxwqPgK02CDhyAWGKSQVw=;
  b=Uy/vPuzOL/fdMOq+gMqNRV1PYgOPCfIs6XXzrxnK3AT8K5k2BwqcF9x2
   EXamMATz/4ud2VsnbVWkKceOAkeIEzCRKjDnkVrBD4ZS5D4JmdGxQFtX+
   L/ThkAk4SpYi8nCnYjKs7EJ82NM0gd5clKbNTOKGafAPjB3o5/sOYMcQO
   2kDXxsnB7j+0NO1ZxRx+X4FFy2tkvVBu2w9mHmTrd4o7YAFoq1Zz6hQTv
   wuSHFRH3W0f3jaN+/M8HW60de3dhdn1SWnNtK7nQUp3XzLQpKaLMfZpj5
   Uju52SCMMvWcW7ZCuByOTpo3a96zYdAd+mZGOysJYTZo6gmEQ0Aiq/alJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="331262670"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="331262670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 09:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741721148"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="741721148"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2023 09:25:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 09:25:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 09:25:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 09:25:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9rQjtxlpjPuphCf/GlaMjyDnFBj17EKcfE6NQjKorj2IMEtVEUm8SfnXaByjNc5K36ZyZt7klD3kSlY9PkDt2icgcioazXtLQNzwq1nvtEWqtwmQ+a1B2N2APQhpfqJIKFo+rz3gMfLLiH5ChlW7VPfrraIfBBqQ20m2Tc6XDKDqHMv2QRuDCvEHNShxQCJZfoB0Z34YziuyGoLcJJWxqiPAWUCzo/5yQ+E9AokxQ5ZYvB+tA8JQxw/q3DRsQ964i69G57U/+xqv0sUvilRk3AWLnMCNrG5cdqODX/pk2r/DQAgl9BKffo9KZ7atuz3EAo9FebaPwPLGpsnDxTE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6VY4onE9AGVasfPuknXB/O7kSyO65XKCUR3EU8Jvxk=;
 b=CvqFk1RCBmbLE4pb90+rsINaS390P89g8rkjRj9TUx9wtUN6ZydZQoiDIyV+j5C1n8V1b86NOIZZQdzNr2Zsh689EqgbzI6Re3772ZW0TuzlEkPSxAL9Ee32TYdmAFka/B/r/xDJJLK7z61NAnUwMoi3lBlYTe9182dwH6B9lBqGraBSsuyW2QirOHx7itMehhb1K+ZnKpSUFDJEYPcIQaIK9mEA7PNVSLu2CvkDOGJAxPui252xppeVO3Nw1WvBYIAwkA/M2wKzBWjydLagJZFiL+8o4Bb0PZ8v/pj/neoWlnBmU/Zlb1iXn6gjpHANGF9hrpYQetmYfdbtbcM0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19; Fri, 24 Feb 2023 17:25:28 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 17:25:28 +0000
Date:   Sat, 25 Feb 2023 01:25:18 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <srinivas.pandruvada@intel.com>, <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <Y/jy/iElbD8suxGY@ye-NUC7i7DNHE>
References: <20230219183059.1029525-1-xiang.ye@intel.com>
 <20230219183059.1029525-3-xiang.ye@intel.com>
 <CACRpkdYdDE+B=SF+kAuQBiwUi31y_xELLXuDK+9G+rqD9MQBGg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdYdDE+B=SF+kAuQBiwUi31y_xELLXuDK+9G+rqD9MQBGg@mail.gmail.com>
X-ClientProxiedBy: SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d90851b-c941-421e-88f7-08db168c1f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRg2aspXetkHULUtPFamAmObopeeahTgUP9hBi8HJ0eI4tlJm+J9F5JHZk2zLIYwqgZQeErzL9zH4O/+0nSQdFWL8HS/HEHTk7EfRIsmIMloTsPk7cgM7DdLsNSzW7bJuQ5g2BueUyVbqFo08XYvGq4yTZ1BosAbNL37PPViXVRxSRLXoZk2oRJfWxea4iJY6jinZa4Qbgmx/3sag1l/DVYoGDrXtn5Ez1LhWzswFXKjTFakKk76BifV44RyOmzCbUb7imzksUBm5PLwvy43kTuyzGT7gzgjpPdj5ZTptKNrj7ytCk+W7sFC0RXkS05M9mz9QZIHy+hF6FvKfpyf1erJ3+kEJsCo4yWoGfMqovJog5yED2/BzWwtTNVy0fAa/pLbf6KW1ytYykIe467Z2RCAhPrrWRScu7wQEOMTlpnlivME/qFDOqzgoQ/d9ZEmx1jOZfTGGhOHacEh0Yg5b0KKL9pgdUjmxJEIfr3hgWfslpUuZofY9aSmqo7Xr96V8cWoGjI7GoabseXCkb2wR7mfxN/SsrcQl/iUmm+rNAlxp0p5N5tQCI6Jg9UYbm6zNSXFgXShEgJgbto2OqtgOJfBeDBAwXzWENgm89EdHS8OZSusiDD6+FKs0MK/VhhZm5QKlhGcZQa04eYasTniRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199018)(83380400001)(6666004)(26005)(9686003)(186003)(53546011)(6512007)(6486002)(316002)(6506007)(478600001)(54906003)(2906002)(38100700002)(4326008)(8676002)(8936002)(6916009)(66946007)(66476007)(41300700001)(66556008)(82960400001)(5660300002)(7416002)(33716001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mf31/s/Zw7YYRY6OTvw5Tb2FqkGxvBURSdsxRVpDVnnCw1ky8b5u6nPZqJiL?=
 =?us-ascii?Q?Iiy/2cLC8XR+YouioHNKjojQFyYSWhkvHLAGraLR0r25ZLoVDoHcSbrsvKZV?=
 =?us-ascii?Q?KsmuGTBYwokgvWx3CTTIMxW3SSU8QEfRAvsm6wTn1VrWDUcyBVuiqgK60vfi?=
 =?us-ascii?Q?dwKKAw2dM9rAMEjBROXq+NAZHLjmxPw87UZku9P3oJDdDChUsjSKDRXeBwE2?=
 =?us-ascii?Q?Soraz7pYn8Sl34Zg8PjhBA+wErFkcee7JfHHAofWlMgCK3Al0DXqgXPFZKxH?=
 =?us-ascii?Q?iAOuyQoyl3pX28r++hgaz9EtT5BPZsiTSUzwedWAxjiUm+TYODCLdbAPFw/B?=
 =?us-ascii?Q?kR/cVsGRkeRjUe1APuTO5upncqmK3//GO3NIrj+Wda+7KHOW8LwQLsL56RST?=
 =?us-ascii?Q?KBykJsIawxsA4uTg+ljoMcYqKdXA10g6QhSDz1Y1r10R4S9ecEqIoIK1ygy7?=
 =?us-ascii?Q?bMevOSL+3vcdgbEaDDmhCZ6BK7uEyve5lgEjgmfWIfHuv32ndhRmAJlkjoyZ?=
 =?us-ascii?Q?UUNJQQPorUFAhJSE2xnFbpuSgQRrD2e8KEFhQfGuGWJRA6K9OVvi87POQJGk?=
 =?us-ascii?Q?30Yva94tRnkcA/IT4WU27WCcBQZ7wuycbysPaBETM1ww678Q0k0rlNwSkJtk?=
 =?us-ascii?Q?c6GJkAjoiJHqp8mWTVt3UiZQtHDg3h9a98PQXXn/szdtaF8T6tZrSyWCaFaq?=
 =?us-ascii?Q?GBZtRW0rE269IedRM3afwLudFXcpbT37qeTW/N3fr7sXkQFl1ujr9KPoTA8R?=
 =?us-ascii?Q?QigMci6ICi/n8DYLTAjTawq56kNopBU3m5VvJkcwlgouHaYBBDiaTd5tojY7?=
 =?us-ascii?Q?RulG10Ul6aWzu63TWL6x5EzhCJf7jgGbQMqCCGOqYN7dd9GrYNaoJ0uEzraR?=
 =?us-ascii?Q?0S3+OuAKXN0+hZVHYu69JziNKU0rVg06wz08tYUvUk/bboJUP9h9KltJoXdA?=
 =?us-ascii?Q?dO3NVwr4d74wtDZLK4Wxyw0hUOuhVK+kRumLef9ggvR469sotgMDyrJajuLW?=
 =?us-ascii?Q?yvm041HVRGdoEQ3onIRc7pXxJDK42xEp7DFk0gAhOCZoxrC8j6+WIeu98U8u?=
 =?us-ascii?Q?Tok3wZXKnNHwuGGzI4VgjjpzEyqbfIf1KLdRT1tMIbFprPSMalalzEcqi0hA?=
 =?us-ascii?Q?AhDNQtGrdJwaw+l3xoDRRxqCS5iELQjMngjW5mOShOrDQ6OgkTB94/FXndmS?=
 =?us-ascii?Q?uy9X51maZRoHKPu3T+UFCEQ40xoUbBp1FcV3f4jImbTD7A5ShXFmcQ51c5VY?=
 =?us-ascii?Q?hmnroArY1exvACfCItoSSfqSM+PSfbSjYK2vISpBeqOXHJhSWj22hWfC/tgC?=
 =?us-ascii?Q?Sk90jbEIjLOTE708WgexFsDHW8MAiiCGTxzcFj+pvlKCKJAbS++mSMHhVZ0i?=
 =?us-ascii?Q?e2vMKoh5oVF25ZyBJx/ZuhOVGai3EenHCG0aA30s4s/QgQOebmYYBFRJ1gnx?=
 =?us-ascii?Q?uebWWYJS1kvqDq/MAiUKgPkHFDiBnNZPp9ANx3ufO5cF9S9rDeWL9pLk9h/W?=
 =?us-ascii?Q?49OB0r+MgeKcJTstOTjGmwuMkpjeJj3ApXySwirC8IZu9VwWqHlpGytXFnlz?=
 =?us-ascii?Q?b3d6J/W3dWecwV6tGIJy9+ZsWdX8qgyg63XVQjyI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d90851b-c941-421e-88f7-08db168c1f70
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 17:25:28.4258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9A8S6rbJhxsvM95oDYIy4/MHKtdunyqqP3iKnFoQBcSoniG+j8VjRd3FKj7FkM6QNg/YHAVek+c5Hf0GKWUcuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Walleij,

Thanks for the review.

On Fri, Feb 24, 2023 at 11:48:08AM +0100, Linus Walleij wrote:
> Hi Ye,
> 
> thanks for your patch!
> 
> I think your colleague Andy Shevchenko will provide the most detailed
> and deep feedback, but here are some things I spotted immediately:
> 
> On Sun, Feb 19, 2023 at 7:31 PM Ye Xiang <xiang.ye@intel.com> wrote:
> 
> > This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> > GPIO module with specific protocol through interfaces exported by LJCA USB
> > driver.
> >
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> (...)
> 
> > +config GPIO_LJCA
> > +       tristate "INTEL La Jolla Cove Adapter GPIO support"
> > +       depends on MFD_LJCA
> 
> I would add
> 
>    default MFD_LJCA
> 
> so if you activate the MFD you get this subdriver by default
> as module or built-in depending on what the MFD is built
> as.
> 
> (Same goes for the other subdrivers I guess)
Agree, I will add "default MFD_LJCA" on all the LJCA subdrivers.
> 
> In addition you need:
> 
> select GPIOLIB_IRQCHIP
> 
> since you use this facility.
> 
> > +static struct irq_chip ljca_gpio_irqchip = {
> 
> static const ...
Yes, I will add "select GPIOLIB_IRQCHIP" and use "static const" here.
> 
> > +       .name = "ljca-irq",
> > +       .irq_mask = ljca_irq_mask,
> > +       .irq_unmask = ljca_irq_unmask,
> > +       .irq_set_type = ljca_irq_set_type,
> > +       .irq_bus_lock = ljca_irq_bus_lock,
> > +       .irq_bus_sync_unlock = ljca_irq_bus_unlock,
> > +       .flags = IRQCHIP_IMMUTABLE,
> > +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> 
> Yours,
> Linus Walleij

Thanks
Ye Xiang
