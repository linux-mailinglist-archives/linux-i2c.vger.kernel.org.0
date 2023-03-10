Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6106B35D2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 06:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjCJFBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 00:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCJFBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 00:01:24 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A47E775E;
        Thu,  9 Mar 2023 21:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678424483; x=1709960483;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RTnWnuVcJecJiNaQ+mqs7AHbX9fiAUeGlFbTCGLIRTA=;
  b=Jg3N0WYGzkB/X1hiGuFoMiIdCKYnEtHydtN0pT3tBJagsLJYfJuRtfOH
   XJbqJsTuuXbx96ptdTIk5URz186luJAltBRzARwGPnLgTFo2Y7Cuyy60i
   IrjVuRXil4rlm2zNr3Zaf/kTs5pixsd2t0KS5/q3utd/G7FXrBd2EOJem
   GPk5a1mdDCg/je/DZ3xJ4fZbUwdSbpGy5cZGfDfnq2wCAHvWQhuXFa+xx
   mQgMzz83QKyTQEP1XL9uLJt52q596Fa9v9YSKI3rxOZuhVve7CKxyajO7
   NFu+P+oF57KHQXuC6UZ13mRnX9Gu5E66OrhAxSL4eVzpwTMfOg0AQ49yz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364300089"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="364300089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 21:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820911483"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="820911483"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 21:01:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 21:01:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 21:01:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 21:01:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKWhMV1Bh7ZLrLUkdvx+eZWoDKljBXSVtSEjFv/javgB4JGpfnQSsQ2OUmJNjWVgDQ0BNTgu6qMyZrB+PPuzOElJv6zrP/w5MM6/gPrE5rkOv/X5IpSeSrMn6UP4gaiBemklD7MJgkePa1xiEToIM+16bfrLUbvGL8c89hKcv5lTI8c8IFgNAbJ/RnrnQ/tpU+m97ANPy5FixOueE5MXR5iW2J7YWwedm6aiG/tsrVKjb2DL/XSaq6WW8lTWMe1EiTsLlKctC+5P/A4M9F7qLUQCsD/Zffb/6m0RB3arp1VZo6wX3ki32g7pDNDyYyc8vW6SPG+fmgK+cxGUEi05mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InzPKqEvzvtge920vApORZLt+5RMF7liiZBkWNNWlT0=;
 b=lJJ7P4NN6eg7bbVzhI3CbCKUWrM2CfO2OIj0Flc0/GtdCcOh1vJlcNqhSCdFLj+Jy7CqkibY6VF0nDZHIZneNFi/X/3clMXa83lkUyxP1+JI7xRfZNXaD+YL0I0ETGVDX8tbJ3947fRhJudoP/Ovr6i3WB42p0v1x/7PShif4f6GlNVOg8O5xqEChFFP/HYWB2WGYbbDcHnnHbTpi9YAOw5lQw7cBvMRd5Ao4M+2Hc4NRD9zazQIa7I8Oc8cr1ESGHZ3F809QFU+EqzebqNM7AXkSc/RMDwL7MIwrbmUIbwjMHjDoGfYxZRm8frqMZL6DacjRPY66FbEOaCnJqhILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 05:01:19 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:01:18 +0000
Date:   Fri, 10 Mar 2023 13:01:11 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <srinivas.pandruvada@intel.com>,
        <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZAqyhXt9nNIE9Ej7@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
X-ClientProxiedBy: SG2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:54::18) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fd8f71-34db-45e6-1050-08db21247bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j83zbujfKq86yzsSBUOVERB9WsWuMlpRaHrMItC4jZrnd1L1rc4afbiPrRw1hI6FAWq32rpbqJRrT8XvISqvsHuAcydPL/sgQddKgzgEn36QoN2Z7ESlCYLPfZFPL4VlDeY+qVOZWvPXYk+UQs64OOu7KolFO0ul0rtFhM8R2syoz8P1z9C8uCjEBj1zPTAY89vkk1qYcea/ClitNr99v4L6l7LE63Ldsj2bn8o9rbVQzof4GIZJFNgoqPgcpMPpZvlFYYRpGvZcwM/yKbEQEZwo2UhlsPkQgWDIkf01r1bX8R4aminxwsysp/s1YSrCCAy9PlX29OwDFLJMlWqeL7YW7MvaQG1jUXkX0P5XlP1cl2pprH3GbQIGmE+4XQYAE2E4mmyJtVtiEFTUCZS/KLaBw5NFhQOqXWbLHG5+fnrxUOB3GJHGTxD8KKId2l7PDSg3IGkyQ3XFk0T9qzEI1/WFJA2hgtvyl2g76TBXABgdXEm8uXlNwNCCHZ5FLaEcJ8KhtEGcJdiXbIN3VZ3KI2owuErTj6BMJUKuoc/tm8/EBZzF6E7QAbNytzGn26rwB+ddtSz7B1q2A4XGe9N1y4217+x6+Zg9h9zOjZwgqPsV+wuFc5YDXFGx6q3AX8dgiUBLVbtIdgenXyaq6IjRRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(54906003)(6486002)(5660300002)(6916009)(316002)(7416002)(66476007)(2906002)(8936002)(66946007)(66556008)(8676002)(41300700001)(4326008)(82960400001)(26005)(186003)(86362001)(9686003)(6666004)(33716001)(53546011)(6512007)(478600001)(83380400001)(6506007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBJluYeSBesbQ5KK7FdiOtC4vEop+ydfob2u5nDEVxHa3uB3osw9sjkard1T?=
 =?us-ascii?Q?SUBYCJB/0lX+bdAmjpmIVHWoQvv52fxQFKsY2RnOt3rd7V0NzDVL3HKulyzb?=
 =?us-ascii?Q?2UDTcp3n0C5o3sgeA6b9OqaY/t3/GBJ1d5IFcYm9Wk80ghmHonzK9VX4To/A?=
 =?us-ascii?Q?fLQ+viEiO7lk7RJgFoNTH3d2zCMPAXTjfwhvYRJovV9pl41zgOCVDl1xwo6L?=
 =?us-ascii?Q?282EiNHmp+tpbdYk/yXRYdxJUR4EexD4EVkqvCGZ5zNz8TFijIG74rdlDkLv?=
 =?us-ascii?Q?Y0TcYZ9Ak4USBln8ZrT8lQZ3mU6plOs89YFzXElkH6K+UFl5R/PcUK05jXD6?=
 =?us-ascii?Q?4RcC1rFekBGye+iwq6s01t5WN9V+TV9/r3FUvQInHvOpIhhWROCpp+WqRpJt?=
 =?us-ascii?Q?I48xPkkYLM23r85MTFJEyPigo8MnZovIjXFQyK1WQZ+6vC6GZvNcu8/tXRrC?=
 =?us-ascii?Q?AXSF4dgsuz2oSynfPD1LsO9+KLl6bIXJBT3C//nKseaWzr9jbmNV/SoMRh4X?=
 =?us-ascii?Q?elOVfncT5O4+YDeS2yDFjHJ3ynF4ZYyhoKbiFEHUNku2/x5kU+41iPxoG4gg?=
 =?us-ascii?Q?+0tXG+iTMz0Hyd4IGkn01Jyo0Z4+8UQtCVCZFbyeYl2U/SRCaQnDEhApOqH8?=
 =?us-ascii?Q?ACE/LDczbICvnvC5YalnHqKGNf6a+re+U5N8UjIdifnWEXAl1v68NhfkIng+?=
 =?us-ascii?Q?XKk1xtBP1tXsdC3NgYO54O4+3CS3NT7sKqjRE/DXOLyY/gZBFVCHa3NAp+si?=
 =?us-ascii?Q?qULccBDKA+m4n4NgQErnjEFAXApCfzFTfVjHLMEhVIHf0LZqF6epAiI7+dGU?=
 =?us-ascii?Q?dg8MXbo21RnaUTtjffsnz86UO+qA4t+WNXcYCneryURDAmoJ/6jvkkZpLqgy?=
 =?us-ascii?Q?QtWy71aV6oWubGKkwyJEK4y0iOAyzOtxD/Rf6qHg42SSfAuWeXXw1JXoU+l2?=
 =?us-ascii?Q?I71kzXosP81nXUMn7YjBS4NO4whnRKz3fDsP4WfS9YGqsU75kXYXeWZAObMd?=
 =?us-ascii?Q?yzh6AuEcijLU+HcjmX9PBZxw3lfvsBi/Zglq77g1Xk6krbkfueNLLgylsgVT?=
 =?us-ascii?Q?WrO6Oka7woZQVsRnvL6K9oUVAgHFiAsTryVcJRW0/LzbPZYfuoWL+YIbtEpY?=
 =?us-ascii?Q?GZinWFpui7SN0WH0exQTmKQ9ggWNYl7FkssV56r5oMXGi3kKpwsxEnqBcBkM?=
 =?us-ascii?Q?u6SzVhV7qUUWE99jli6kUOnvtKMydOpeP9Je7vwn4VxWbhV6RaHC4H6bC1X1?=
 =?us-ascii?Q?KzwsfFuvSd63GU3xG3dGW8vtuAm97dI88M63gz3dtCpBykufB8+UOEw8vd9k?=
 =?us-ascii?Q?SQez7xKUELOBpFXm7FnhQIwzYdY3Znb2a5Yrub7WZUOxgC1uX/8aNqXFmG2Y?=
 =?us-ascii?Q?DBFqiZ6v8w+vUe7fZp/JC+sKhkRFZY73WMW332BjmL+3nwD3kzsMo0k57JyT?=
 =?us-ascii?Q?WfevN9gcMHwm3BFo3o90KUgEPV6mBCkU9nbsxidjy3O9evcWwd/UzWWjDCdc?=
 =?us-ascii?Q?JpNiUKddTdCRCth3XlYqeMpoWS4PC5jnGonguZexb3Pe0pWePByDmKMs5qOl?=
 =?us-ascii?Q?+RxAw7vC3hj1tKiQNI+jQ4nsf6HPkT2/bTgwW027?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fd8f71-34db-45e6-1050-08db21247bed
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:01:18.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C70ySAh6t06/FqzkWGhDdXHzAlRZiGatV7KmYmDUqbaXeqFc/RqYwQMS4cUz0QEaCOnmVbgcbs/P4OZEBIaRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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

On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> 
> 
> On 09.03.23 08:10, Ye Xiang wrote:
> 
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
> 
> And here we have a violation of DMA coherency rules.
> Basically you cannot embed buffers into other data structures
> if they can be subject to DMA.
But obuf and ibuf does not used to do DMA transfer here.
It is actually copied from or to ljca buffer to do URB transfer.
Should it still need to follow the DMA coherency rules?
> 
> 
> 
> 
> > +static int ljca_gpio_remove(struct platform_device *pdev)
> > +{
> > +	struct ljca_gpio_dev *ljca_gpio = platform_get_drvdata(pdev);
> > +
> > +	gpiochip_remove(&ljca_gpio->gc);
> > +	ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
> > +	mutex_destroy(&ljca_gpio->irq_lock);
> > +	mutex_destroy(&ljca_gpio->trans_lock);
> 
> At this time, what has made sure that no work is scheduled?
Can't make sure of that. Could Adding cancel_work_sync(&ljca_gpio->work) before
mutex_destroy can address it?
> 
> > +	return 0;
> > +}
> 
> 

--
Thanks
Ye Xiang
