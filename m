Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08AD26AB4C5
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 03:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCFC4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Mar 2023 21:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCFC4E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Mar 2023 21:56:04 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E17812851;
        Sun,  5 Mar 2023 18:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678071361; x=1709607361;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HCT82k5YR2FALXMhilWWoQvkCBQ12T9j7FKyPybWG4Y=;
  b=dYY6MObFM+xBfOItFw1t8PU9p6uVEAQ0Mc4fmDWIcIz2mbCUk0bUUHOD
   Ur3aQLtb+WmSGM7z6TD2oGoYgqIdD3oQ4iriW2HGZLoDegGIGHy9lc4st
   7src9CRLSLNlT+/9yVhENoq1G6M++KbXbd/98YQvJOvZOA8G4gYAeLwmg
   cQU9DL3bhvu6jJRnMpflGL8AJAoyby8bpQQdeCS2M/irY5VIhbGl2BwCr
   hr6ClwSUrS8JwuqUTuNRpuKTbCxw6HpqiYB1JT/OnYqr9RtONfZ8oHt9F
   1d7MsSkV6SNfM9knh0BGGv7Gje2sx06gGrcO2VMF+oy/okqq2RRPuMqsq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="334176203"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="334176203"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 18:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="740166894"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="740166894"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 05 Mar 2023 18:56:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 5 Mar 2023 18:56:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 5 Mar 2023 18:56:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 5 Mar 2023 18:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jO0tWtggnjzkgzm09lOJP62YBNiMSOnfNEoSPgMDp+KuUCtVFg7HLOut3VUasDxfqXW6Sx2zvx5COYsW6Xkn4UN0OcsnEJnjwYIgXUPQ0kOG7y/tGi8iunOfhhwm69hINwhI/ZHVahRS87wDaPlnhic1ZcI5x8/ChU5GdAHAm4DGvEKJeys+fNFQxCoUZESIwUNOEDoAfzpuFqyH4pLuyF8NutjSkAOJ/LwrVAt/tS9i4aRhgPal2+NuxCpAPUwnvx4qdohVI+f2gHiuGXwkU4UyB1xduM/BjKel4/WIzpzx30mEWPW4APClJkdcSmUEeBXTfPID7RYcmPY32lh0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNbZ4DYY7BfwbL42BCMuzHqJXEUcNF1bNPOPx5faRb8=;
 b=QzvRiMRhWvlaIsLS5DgW7dzUv7+9dKsVHUZf7qA1KNBbPcGZ3H9gQim4Vl70MkjS0kwZjDZyWcjZITUsDWpo3BS2JCRdoHpm0G9hX77dpROkSK+a0CWTR2Pe2Bi/J1414T5dhHKVflkR1rajN3uh/b+QtlgZXWK3In6SGUM9lcDH3L3hjnYChfTVTaLUdYBBe9PIl8BE08sxpDydHbINrkKE123SxEcgy+nGjfeVOsf0q3a/wHNEUmgY1eWl1LGfrqhaJ7yZuIq6PcSqsRTZKgz+amgGXkzes0CkyEaLmfwUk1a7w4cA6tcLn2rP43tsNZri8lDJowN0xny+SEKuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 BL1PR11MB5350.namprd11.prod.outlook.com (2603:10b6:208:31c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 02:55:53 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 02:55:53 +0000
Date:   Mon, 6 Mar 2023 10:55:46 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Lee Jones <lee@kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>,
        "Mark Brown" <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, <linux-usb@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <srinivas.pandruvada@intel.com>, <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAVWMp2LyxY7w6N0@ye-NUC7i7DNHE>
References: <20230219183059.1029525-1-xiang.ye@intel.com>
 <20230219183059.1029525-2-xiang.ye@intel.com>
 <20230305103456.GF2574592@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230305103456.GF2574592@google.com>
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|BL1PR11MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 371538ce-892c-44c3-8c8c-08db1dee4ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KidT9H+4X4yyMqLOivB/pm/FFpP/k1maTqhya5MgfG5WAWtlvMGDvFUoBUyV+NOR6oMFqGFj5O6JpkyNLo0t0V8pZRJY5KIPK5K+OdyAlUiBSNn2ehckfRaB+/360EwStzestIaAMLxuMoeHMcUmL6sQHkuQ+nJvv+aepUdmkq1py+QZoiT+UWvfL4JsbzTOLuxjWPA3wlzfE+hPF7YYRQK1l6F5wwCQtG27NcKoomyera3grewK1G9LD9FJ6tF9mY3oaz7vNxrYKw6aMEnaM0koWfVR89kjJIG1WfZOj9yACjckQzLIprxqJUS6Kt48qpYdTfCZVb/kV5ilIf4vqKRAt2ww9ZZ4SBwLrj5lK7iAxMM3vOuJlBuizTCiO/2m4so7PkAjhTdMGDz79vNs+57dun4yGGLUFhNKWOOOfn0BFhmxT0ggo9y4fUwKNj0f01lVTTK99Lw8S1T4VURpFBI8f0EEhVwi7FB6XmTz9vp9wvJbGj3Pnph/oXETKDgxX/dFXjFmQ5Ej1Oz6Sfq0oahdLacuM+rLCZlh/VAfL7FkxQ13vtN4ghhTPBpkxzghXFAFaQcAP6Sw4xwb1hSgOJM3ZPQDkS0PAHl3tDrBCL64o0u/ku7LSlCTjwyjJyl93kg8t/w/TnwH2BklM76JZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199018)(8936002)(7416002)(5660300002)(66476007)(41300700001)(66556008)(66946007)(2906002)(8676002)(4326008)(6916009)(54906003)(316002)(478600001)(6666004)(26005)(6506007)(6512007)(6486002)(33716001)(186003)(86362001)(82960400001)(83380400001)(38100700002)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0N2S2VReHFqcXdBVndmdkZHZ29icFJ0cmJraW8zMlVDWjFDOFlNTjY2cXZT?=
 =?utf-8?B?L20vV25jOGl1NkJrdlAydTV2V1ZOTktBQXVZZEVxYWV0VUdobEU3dnRhdXNB?=
 =?utf-8?B?eTJPR3I0dCtoQWJmM0pSWjNmUkdWY3RtNmJlbE1pZStIOUwvU1c0KzZPYzl4?=
 =?utf-8?B?a1J3SVQwY05wOGtWNmJlUFIwY1QzYnJCVjA5Zm1MSFg4bEJGOUw4Wko0V1Bz?=
 =?utf-8?B?UElGaGVTeWtlNEtWQ2JucXJQK001WTA3dHdYMU10eUlRcVZzN084d256T2da?=
 =?utf-8?B?U3ozenRmWEU4cUNFV0Z4MDJkM1ljdEorL0ErejBPTVJuaUtLS2JPSFFCUUxh?=
 =?utf-8?B?U3haWHErNnpNRkZGMDB0Mm4wVllCcDQ2c2Z6UG9nNjZIWVdwTVQrNFpyd0xK?=
 =?utf-8?B?N1BZWHo4N0h5dE02b0JCKzIwb0NVZzdkeDZwZ3Nlcis1VmxRMUVUN2NqY2R4?=
 =?utf-8?B?WjBpMUdyMTgxRjQwSW1GOG42cXRWR1pIKzdaVkxtS3RkZGRrVzFkTWx1RXhT?=
 =?utf-8?B?M1ZqMjJKbXZxdk5POGszVWNkNmN0ZHgzV2c1c1c5TnIvamNsdE5XeXBlYktN?=
 =?utf-8?B?SlNLOGUxTXpwcFlueXpOUlh1TEhVV1dqb0hJVkEreklMMjd3VW96TmNEMUx1?=
 =?utf-8?B?ZVdxVEhCa1AxRFovVGlySmN4Ri9KSzdhSlJMdmpVTEtuMnJqZXMyamRsdWxl?=
 =?utf-8?B?OUlwNDZkcW14S3dhSEJLTUdSNm1ZL2YxYnI2T3pwNGxmcTlDdHV0VnZPaUdM?=
 =?utf-8?B?OFpRVGRiSzZITlgzcmdFWkRmUCszaHVKMTQ0MkFkUjg1RUkxdVZQZjVjMUZP?=
 =?utf-8?B?V1A4SVNTS3dJVUc1K21PNE8ySzh6dTFDZUI2amN3MFJjaWIrZUZPWmJnZi9j?=
 =?utf-8?B?U3BHTEZqaWZXVVBhbUUrSzNhVHdNY1N6TStFNVkzSllLZjBSY3UxTzIyYzdP?=
 =?utf-8?B?d1RGOEo1alZwMTZQRENoOWVvUm1KRlVuS3J4R1N4YnFQZ0M3SFkzYllybW43?=
 =?utf-8?B?SUtYeVJiVlo0TVFpQVRJTVAxRitLQUNrRnQ5akhoNnhLUU55blhuNU9zR3h0?=
 =?utf-8?B?MzB6eGY2NU1LTTJmN0NZK1BNaFNyeWVtTFRhZ2JzVFI1VU8wTUg0QnhQc0pX?=
 =?utf-8?B?RUJ6KzVGdFBETHV5NDlrYlRQdGRMblUrWml2NWNVbGZKUkhRcU85ZVloeEla?=
 =?utf-8?B?WS9QdE9KYVFSVjNIVFRsWHR0TkZSV0hsbm1FcnNNQkYxMGtZY0Y1Z0owM1JZ?=
 =?utf-8?B?VGZ3TSt3dGYzTzNGdWw2c1JKZkxKK2oycUVJNDJkd0dkcC85VWlaaG1Semk2?=
 =?utf-8?B?SDZTOU1YNUFUSCtXY1lXWmZmRWltV2tvMkpyNzhqSWt0UkJBVFh3MllGd0d3?=
 =?utf-8?B?bXZBbDdJSWtSajBkSXdKSGNTLzBmWlNYR2w5MjB1VHJvL0w1ekY5cnF5eGs3?=
 =?utf-8?B?VzJUOVlGdzI0RjQvdE1mZ05hWGI3aTJYdlhiUWVnMWVxSVJKYjVwZ1oyZVFX?=
 =?utf-8?B?bjVGQVVaV0piMzVkdWdSaG4zVDJXelNidG1QNUo4MWMrTU9iL3E0a21OMldq?=
 =?utf-8?B?YzFwSGtuTHJySFZMSVlqcGh4Yy9qTHdva0F0ejlLOS9LZFZxZ3hoYzhEU2pK?=
 =?utf-8?B?T2JjSFZ2UWV1R3BzQzlWTlZiaEZKOTlaZmlUTlFnbGFVUjVhTVR1V3BDTTI1?=
 =?utf-8?B?K2o0cmY2MmNsSzE3ZSttNFUwMzI4OHkwZnpNVjZCMXlzYmpNZ1RYYkFEK0ti?=
 =?utf-8?B?TndrR0EzdDVCNnd5MGRnL1pJRnIwU0ZzOHVmMngyQ3pueHJvWEJocnJKdVFB?=
 =?utf-8?B?RnJnbkdWN0crcjdQSmY4SWx3dXAxLzZ0Y2pTWkRKcmFRY3d2K2kwZnJLb0Vx?=
 =?utf-8?B?U214MExjT0FLakgwcWVSRkVoZ2M0b1R2alRGTXdyVTM2d08rMGpRNHd2SUZy?=
 =?utf-8?B?Zis4dUgycFpyRHNic2xpa3pEWWVjZ0pGVTBoTW55cFVPNDIxZ3lLdkVwNzY2?=
 =?utf-8?B?RXpIR3ZIVm9KUG9LREdUWmdiM012bkNnaE9oTWtGSFNVc3Era3JZNlZpMFdP?=
 =?utf-8?B?VW0xYXljOE9JdXcvUS9xWU96YlVudG9qcW40WU5VbGp0b0NSSWhlclcycUZs?=
 =?utf-8?Q?6fpxEc/ZX1zPDrjs40YpAb3I8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371538ce-892c-44c3-8c8c-08db1dee4ce9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 02:55:53.5353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQALXBoVKDaICIcMFIfOHfDw8MYc9QMMfvV1XE9hMuxRK4sYPbfDoBBUFB18DrWzeyR1h4YRPVjg0VnKtefcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5350
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

Thanks for the review.
On Sun, Mar 05, 2023 at 10:34:56AM +0000, Lee Jones wrote:
> On Mon, 20 Feb 2023, Ye Xiang wrote:
> 
> > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA).
> 
> The "USB part" should live in drivers/usb.
What about putting ljca.c to drivers/usb/misc?
> 
> You can use MFD to register each of the components, but all of the USB
> functionality needs moving somewhere else.
Ok, Now the USB functionality drivers have already been put to related driver
folders: spi-ljca in drivers/spi, i2c-ljca in drivers/i2c, and gpio-ljca
in drivers/gpio.
>  
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
> > ---
> >  drivers/mfd/Kconfig      |  13 +
> >  drivers/mfd/Makefile     |   1 +
> >  drivers/mfd/ljca.c       | 977 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/ljca.h |  95 ++++
> >  4 files changed, 1086 insertions(+)
> >  create mode 100644 drivers/mfd/ljca.c
> >  create mode 100644 include/linux/mfd/ljca.h
> 
> -- 
> Lee Jones [李琼斯]
