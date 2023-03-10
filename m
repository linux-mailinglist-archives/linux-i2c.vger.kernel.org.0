Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAED6B377A
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 08:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjCJHjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 02:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjCJHjV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 02:39:21 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394C4F367E;
        Thu,  9 Mar 2023 23:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678433959; x=1709969959;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MJyj7t699XacKoUK18fq1loMgfhtlvSFRZ5iNtBwBLg=;
  b=dx4a0jgxiuoa9VY9eJwE/b7XOh6nzDQaVuyr+hyXLQM3A3gmwPvuLZ31
   stTRvhN5+4sN9eyB9WLcIbyMrjFR/Ab1Q/l2e/vD/BwAGv1o9vprDgjI/
   EKVGx/uDzQi2OazQqwtSE9jDfahzoehK2LXCkkVvq7Q5Uvk6TIOv8iL/t
   9qOc1rDaCD/UH4rDle4ZirxKjBxyCJ+7WqEqxkYbyPxrtq533mwkV4/2z
   E02NayZFEI1oVZkkCpGN3Y9SB4/nkX2Bs0cmrV6yz6LJO3hFobrVUGZ6D
   kFmO5pZgVZel0Mr4rOKJKOTkwC1fizI1i/HK0rtz3XIN2fj7WJ/lUEyn6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422937284"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="422937284"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 23:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923564976"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923564976"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 23:39:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 23:39:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 23:39:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 23:39:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR/eyxBwVe3OBtpc6+Gfsswr7m2I2SSsTchQK/neLg3GGCOhVRdpo5FOCP3KGfsm7PJgQOGQmF446Tt62TO0jzD7u3o+5gg7hphJ3TD3AxIcNXX+X1c/exUjZMbE9babi8b/OTTPn7G1sEXnNOqBZIEdPRFcAAkJnYYk5O9U/ryCs4G+Hg55rplo9Fou7cvNa+05vEz9amAqfpwuGHw7P6MTsygZsMhahp/3NKtK0FuUDy6YvRXqQ9mRSGVQyANqFkXDlCgAy9UdcPPNgszakeF1Iy4aNjfs8D0HjUoifnO+EsoaQm05CBuXSEFGiw6JR8k6GeUzYkAp8YS/jVVMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrKqjRkQtf4b02QJUsrW+4oOumeRggWsxsWQWmVWmrw=;
 b=dxNcCSlOm3R5Y4LNcFZN1sC73Q3h0U7RRUZn6YGk3rAlOCARlMu81MHvWaXjtWb4aOSEowX71ksDCq7qIyKW40miEGEc3DXp64dQSs3PUaTUnqLWbCD++ex8KGfjWKM9Ea0O6A3sKAI3TS9EW03AUhf0+NiXtB5kN6EgwdvmWnY6HUbRwq1yUtMjZ3KOPvcZfU5+2OfzFrL17pC8HlkJl/vhxLnQtB+J3I6H4yChcHkB7qM6brLPFxs7qdlDdC1OnRf0dZY5wn00DFVSg7OIpJS8BXgJx3D1u9MyYAQLoEhRXIgFpn1//fCEQtjmzl486DciN7f6T44bQvnbhQGOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.20; Fri, 10 Mar 2023 07:39:14 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 07:39:14 +0000
Date:   Fri, 10 Mar 2023 15:39:07 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Oliver Neukum <oneukum@suse.com>, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <ZArem5MwWrgOY2nJ@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAqyhXt9nNIE9Ej7@ye-NUC7i7DNHE>
 <ZArYCD0r6n0sJ7LI@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZArYCD0r6n0sJ7LI@kroah.com>
X-ClientProxiedBy: SG2PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:4:7c::29) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DM4PR11MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f44f82-216e-4259-e50c-08db213a8b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBq11WuSHGAolKKG82CN4n6jZBD5dQRv4bRH87EihUIWkjKWRSHQj1dDRM+xenRGpU8j+2jfD/lWWJ6V2579CElQAdEGRFLab4WgQYk7M7rYR0sgB4b/LpMQBjZ62D80BkxTS0Uz6MIwnL0dVVczz4QAyvF4ro5KsfuMxbx89mq5VN6L73qhizi0hiA/WysACVWdvAWv+HBDoaCGcgQLcfxIXcNqyri8vA64+8j9Ouybif0mQH+vpN/Okx8Ki+bNehTkfE/R+w0Q+xr2D5Op6Y51KLICVLVXzvG5Ppex+UqhLVobXsKuaejuIxzCcPGc7OsxEbBJLrz4e3fEZy/4PXB0FSCay44Gno7sL175hQbUjkNnt+hUiPoclnIG26sttXEPg5UujRRs37Q1m1hcsXJlSzUFbBNOYumCblkrgZwR93sIGMh4gE7bqvMDGsFQ+WS+n3x+t5vrIfPvVkmhMXluxSoRDplwXh8LBuOkpXuoj8UBBqU8y1PXFLpnBLih1REsyUj9CtsV+BUZe3/HjHvKlzg/49282g1CjzboQqt70fGIsaTZGmWpFbja9Orrg4eaurhsqU8P5jSzETIirw9N0WPuqSzUTbr1U9g4NSvn4ioqIB6b19v6Uaut6vzzle9u6kV3EzQFztROTf2YBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199018)(4326008)(8676002)(6916009)(66946007)(66476007)(66556008)(33716001)(7416002)(5660300002)(8936002)(82960400001)(2906002)(41300700001)(26005)(6506007)(6512007)(53546011)(6666004)(9686003)(186003)(478600001)(83380400001)(54906003)(316002)(86362001)(38100700002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hMrsn4JEx5kpVZqPXVdWMMxXYsijFzTESriEzkvYqTSvfinEMxh3aut04ZCb?=
 =?us-ascii?Q?W3Eb8RWXIB0DEXbLujURDM1PGkkSwWjkMARv/MOKBag8JurHhBsSVm0Ae3pA?=
 =?us-ascii?Q?MiaEYySK8/XAxCPLAKiFIKwAPRQcP0rPgTjRI7po/aZ1mqEFvgIlzIxB7Xzs?=
 =?us-ascii?Q?Mbxeb7/SmvyHR2B/p+5o9g+O4eQpo2+Vuur7HzMRcEyQc1+vq2zJMfDhnOD1?=
 =?us-ascii?Q?Ie4peHlrBRue5uodFNr0IewTN94Fhjr5kC3VDthuAM/fMTFm+HIXgrIBoPS7?=
 =?us-ascii?Q?0qiijvcvzZK/1zV9nB7cogwp96ldso8Mk2jIfCVPJgENwMOxNTVlAVeR/Fwj?=
 =?us-ascii?Q?1IBNKFg3ol5bn6hMlSs+OqLftnKajuolgvqTL+mNc490bEQHfpnrCDLPQtKy?=
 =?us-ascii?Q?xHKWDlIbKowVFT0BAH8l/YQMBu+mqIiHMwRyvBgEbvJV2/biK8VnMImb/Szv?=
 =?us-ascii?Q?4v9sJNHevNXhEHDEiQ692jk4ugGArBDcIxDosPsSrGEJWA0KqhoVe9LYIyYw?=
 =?us-ascii?Q?JTxrDvSxBvJNmV/27WXjg1Vg6AAGrhKcUTA55Qowak+D2G1zAd8V2d018rQX?=
 =?us-ascii?Q?VoR5z1hUdO6unAxdejDaXXsJVRqfV7higFvydsmQO2GoJjIgiW5/bdcHtaIN?=
 =?us-ascii?Q?/PyjhPEO96rUC6AR2vdJSxLB5Z03xAi2XD+TT7XT7jpkjM1aKlvk7FdBtAVU?=
 =?us-ascii?Q?OclflRyJ3KY1tSiZ88CI4mVSxDSzjRpjAOlmqxLGVgy0CRTo0PpmIbbjA1k3?=
 =?us-ascii?Q?rIvIb1Xx6fLv6xgoGnefWSQxz9ujooaj368hL+Aggndb7iLaBV2CPhvApj7B?=
 =?us-ascii?Q?+U6o6p0BWk8ncpDOa4bLcTlxMAQ1Mjn8MIbKTkV8sSaeA+469ycIa4JJSasR?=
 =?us-ascii?Q?CvZaj5TySwlda1CC7RA9IuqffmFyh68Mtw61GGRFWLFBtD8XmnZKNO5n+0qK?=
 =?us-ascii?Q?XbTIKU70NzYEoRWCgopYQn8zpRvtBF3iv/fQQyX0Yg591uWsAm2VJRhF9sRX?=
 =?us-ascii?Q?BW+O9KlQsPKjSYSgCCV2opftt6kBqwABNfAC4Fq8p5F4SBQO2LkqrSwDXdjp?=
 =?us-ascii?Q?xbh8lbHdM2EwRg0Y6MwVHJdrC3Ma2Br2TXF4nApV8T+op0RdFdYbqhDuWrAZ?=
 =?us-ascii?Q?89mDgTb/7BdPUe+A+4/rRgtnLBVhExyif79G0TfALLcF2Ccuud4fD1XONlzl?=
 =?us-ascii?Q?fKQMO0rU/iltTZp47nKAoP4ElAeQwGqHdZpieb5gGY5+CA80jPP/PBeNsK12?=
 =?us-ascii?Q?wRhYz8wsNUNJuabKTugdGIxT6vT0DFBgFsG1obIUhkoIsO3h3AQuPqialgmw?=
 =?us-ascii?Q?xArML6IR9lzgke9ErZoxtEcejZqMohNqcdITVz9x+svapj+0Snf08pTiIEJX?=
 =?us-ascii?Q?A6GwfnV7E3nRMUJwd78UxNtyNaKfTKeF50KJv965pNEjnVkpwqGE6C8DM9Th?=
 =?us-ascii?Q?SlLZybCeFVenGFe8oZoRBHoAM5iysYDL8z6Lglm0d2nhxH43jf/VNJK5YfER?=
 =?us-ascii?Q?1ZN9buxTRqZmKi/FAnrRb5CMANzETdpJla5fHXTVFT1ILl6cZdnNwo8gH1gc?=
 =?us-ascii?Q?DqOmFeARhkiCUJT0GIhDEOzt3W/ESMEfK5xeKmcY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f44f82-216e-4259-e50c-08db213a8b65
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 07:39:13.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmTGWETAyuLmTxn+iiGZm8dM4wDnU7bdN4AGgIxFS8y/r3ZIXXFUzSoBgGltiaJUA1opzKnxsffH+iBpViuimQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 10, 2023 at 08:11:04AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 10, 2023 at 01:01:11PM +0800, Ye, Xiang wrote:
> > On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > > 
> > > 
> > > On 09.03.23 08:10, Ye Xiang wrote:
> > > 
> > > > +#define LJCA_GPIO_BUF_SIZE 60
> > > > +struct ljca_gpio_dev {
> > > > +	struct platform_device *pdev;
> > > > +	struct gpio_chip gc;
> > > > +	struct ljca_gpio_info *gpio_info;
> > > > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > > +	u8 *connect_mode;
> > > > +	/* mutex to protect irq bus */
> > > > +	struct mutex irq_lock;
> > > > +	struct work_struct work;
> > > > +	/* lock to protect package transfer to Hardware */
> > > > +	struct mutex trans_lock;
> > > > +
> > > > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > > 
> > > And here we have a violation of DMA coherency rules.
> > > Basically you cannot embed buffers into other data structures
> > > if they can be subject to DMA.
> > But obuf and ibuf does not used to do DMA transfer here.
> > It is actually copied from or to ljca buffer to do URB transfer.
> 
> urb transfers _ARE_ DMA transfers.
> 
> > Should it still need to follow the DMA coherency rules?
> 
> Yes, all buffers for USB urbs are required to follow those rules.
But these two buffers are not used to do USB urb transfer directly.
For the "u8 obuf[LJCA_GPIO_BUF_SIZE]",  it will be copied to ljca buffer
("header->data" as below code [1] showed) first. Then the "header" is used
to do the actual urb transfer.

And the "header" is allocated by using kmalloc. It should has met the DMA
coherency rules.

[1] """
struct ljca_msg *header;
...
header = kmalloc(msg_len, GFP_KERNEL);
if (!header)
	return -ENOMEM;

...
if (obuf)
	memcpy(header->data, obuf, obuf_len);
"""

--
Thanks
Ye Xiang
