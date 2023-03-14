Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F376B9A08
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 16:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjCNPmE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 11:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjCNPlu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 11:41:50 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EC562853;
        Tue, 14 Mar 2023 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678808473; x=1710344473;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GSWWwdgpQuYFubJgAXPNchR1pmhOvmSZYSEJqiEvYuI=;
  b=m4vwR2AMlBjDize6PqrZkAtMKTGhElZ/3Y3fc53h3G+OktmQK26luXUX
   qf6oPYVQckujcr3sctZyQJC85TLM3Nrifou9TQR8HphWqPxZj6ep12HUf
   M9RO0qGElE/WADUm9fu2PybjvnpW+H9gUNWZMMUpDCsIM/W0NekjLo86r
   O02oJyQcBbuix9O/OoHd+TOnnFJc8PkuYSzu9shvfoSP4eH6ziUNEtx7A
   YJE6HCf7sycC+3j9jdj0Du++bKhVJjYviGBn6LQY90GLuOolqxY1ijl5h
   4vXSCD5NKbmYQp3IxLbPQ+5G4xh2DGdcJvulXwVX7DZmpOZRGvN0GwlHq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365130624"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365130624"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="802912816"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="802912816"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 08:38:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:38:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 08:38:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 08:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnePVkSxY2174Dn8fAA4gq0b+1AZGRbe247zbTUCeJ2MUTS3gQV/H4wOzGPUisuTscK+/oZ26UPSEpjWGdrmdcqK1Xc/WNgiggkq+lRJuFP6DGfUDgivV8cEeorlQEPEaJGblUj+e0K/7WnU+jpnfU/XDRgO9A6yEF5sgUVH5RKBLNhwZO2a1DRIWfhxzPdnT5qkyKaaRxkXyI+PlVIyWZzQBxVOo5SHsSaVdc391aWhP154p+W0qIiF6m7bY463IksDJFruzV5A3ht6dn1rvzN0T7OHDFa+WqJ4MTPznTT8CGQs2um9bO4lrYM//Nq8OcvGjH6eqKC7C4id+tqTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he6E6vjooxIe1R+s1Ycd0r+KufPTTWXuK/QZBHxIIbE=;
 b=bnznG3RglIBPnUHqo+2y+xv6K8neLdtT7pce6J6DZUfgQgWWmYh/aMT4lp+vKdQ2REsQshdf1ds6iy/Wfnx0piuBcGq7AfVjcfjew5BI/Ut9rHySYYXYxNU50N75mCIBmNFUnbprvvQcenbrcdnLwlo/mI7yN2bXH1R59iG0XaomhECmWVQ/b6N1JaBWA0XLxHSxFDjBwmq9ZOVgQwrdcXf2iXO2fbigQoSKicztgytpE+JHHoyvr1QyywL1/RitEGEejaqQ4diO3tQOkKXyS5FKX5Sd8gTBrPBrTtxI7+8w+7MwIoNgZO2RcjP2tlaBWIERM9gaqoZfwSw6ZWlxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 14 Mar
 2023 15:38:21 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:38:21 +0000
Date:   Tue, 14 Mar 2023 23:38:14 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Lee Jones <lee@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <srinivas.pandruvada@intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
 <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
 <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|IA1PR11MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d9abe1-bfc6-44a3-d4e0-08db24a223bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IF5qANCIqS6DXEoCTDzn9YPfBf+9GPz8huODwrZdcW0PeTA66+YGsZ4iEyheAsAdoqf9OnNitHy4VIC1xvC7+S8rNP1RbLyPNcPPMKKAwTXhfKHwY8+eF3YNYOuLmYOy/99YaIb+jqAB/i+ekI2f0Snp5ziVGt7SCvfdmX3fynnOYcf+ggD3eC3l8jyqaP2DRFoVKyyesU1QOgeoA7d1lbbLi6gQ2BmoWcoLx78ZT7cdPWaVg+TWmvWF0GUAn/ozjPALAOfrYFWn9vwzxJp6eo2Z8PV/Q7eQZba6Ptu1zFgRVwekNLv0AxVe+GE4FCYCh+9NJrFgz7SBqzAFXyWRtZ0mvnzlHFlpPirNkxb5PgN99B1xZLegiUaMJIi530HSF29B8ACY3y6UkTOIB5kLQd4wgYTtAQiL68RtLlUsBu8XM99yxfRw1jgVQaLLj57v39k0pSx+zrP8ZYbQvwPn+B97A4fVXEBRIhtvvxgOdHj/sD3wiQKsiN0wrk9JGSLBTm8lK6H5t6WknDcCL9n2czVU9OZY3JRgAfRntxSkmRaKqowKUi/F29TSieDFoKxDHM4acku2+glLPVjoptSjTfhcon4UvHtX1OvppSdHMqiI1L77V91tAMIJtQpSHtrsEUgX+IsWrPXSkpbpO86fhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199018)(6506007)(6666004)(26005)(66476007)(6512007)(6486002)(86362001)(186003)(9686003)(38100700002)(82960400001)(33716001)(4326008)(6916009)(2906002)(8676002)(66556008)(41300700001)(8936002)(66946007)(7416002)(5660300002)(478600001)(54906003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9cmYq4Z9ZFkg5c23Z4EJ9MtEAZSiGEd7fao5+yhbbcEcV6zFp2lJxXOxJtRH?=
 =?us-ascii?Q?03V69ZFK7hTR65Y8tFQqCuBr/HSJD2XLjqH+8jeS6j+WsWly60juTbHI6us8?=
 =?us-ascii?Q?doJtgabHhnQgKD137Pta7gqkbr5g8WFfaiJ1IssevbeMKX0N0CluxD2IukbS?=
 =?us-ascii?Q?gc8w1aQMVYTTADRSulQQ1GF9WsV1eOZwCjTuOv6koyHpdDW+wOlZqr2nuzkC?=
 =?us-ascii?Q?k7v1L8MnMv5P8VUqhjXOMNQPNX7Fzjmt09R1ZEs39Em2sRjXgm5Yt+fztFYi?=
 =?us-ascii?Q?QTjqxBd8w8ycYFY00QLN4T1k5P9eycDYXVRFvLS3nTeDnEE2xbpD5hJA/CXQ?=
 =?us-ascii?Q?kv/2PDAc2SDV8UV1Uqd/kgyVhV22uiIZ6GR0Mv5lCbxy8mrrWMxH1pLJpQVH?=
 =?us-ascii?Q?vNW3LyQVkhCQanIMxCm4SklNGju/z0u5olFmJzGWxtUv4Lpsym3fGRwjv3yx?=
 =?us-ascii?Q?CGgiHWyuS4kvgjSS30CbmxIzb+9lX+ZheZjDEAPY85HldW7tpI+ggIQ5uIQL?=
 =?us-ascii?Q?3xBv5j/BWGui3VRSPJm3XclryTHbJWQ78TD8PO7IVFW2iYhG62iYRObluICj?=
 =?us-ascii?Q?ZjMSuA0LfulBRVXWhWDWoUG5Krw2DFTRhf7C15YaSKwHhZhBvWvTUpF/2JuN?=
 =?us-ascii?Q?55KZ6AXZ2xXBSnoKdAW1RDIgzcv/gEM5XscaEREfoiRW0mAQ8SY43Ktiz6f2?=
 =?us-ascii?Q?EGEA9cwXNYgNdXiiiOly3o93bzFYaPXZaSzoddQrZpV4ULy+dno+Xbt++b86?=
 =?us-ascii?Q?CUojovfu/IxhBNc8UO33Fm+Ij/hmr/uYbAebzDRMotuUoMaRKfz/IKNEW7mS?=
 =?us-ascii?Q?QohWucZldGofnG+2ibcvRft1fsApVkIpfA72ktDnUCtVEup18GprAl2df/93?=
 =?us-ascii?Q?cgJmzH3NZH+l03qXMGqG3bUFjn0TruV48z9SGyANzZZfZh1h5ndtbvQ0IVDE?=
 =?us-ascii?Q?ys6zpqelTDWctCwijp612NIRmQKzofw4zc6pMuozpEU0412YUw7bPIkd3DIQ?=
 =?us-ascii?Q?4v50VRiSww8oFSHJrxr2oPBhzLj734tBo8Fhd8YE8ClZ5ozVccxkHnGo8KEz?=
 =?us-ascii?Q?Y3I6IQZxLGrcWqKkm3gkN6cNSZWG7R3zujY5cXBJmpGXsptrmqOROmNs+Gdv?=
 =?us-ascii?Q?j6fKM2okzLbQWAEOGlSYlq1xQhUuKFJgCQFbBEsztNkLkghCUWbM7MvXMUyu?=
 =?us-ascii?Q?0YDkOPvaUYgsIYUK2doeZS23UnUqfFMGSfj8rcReoCgR4UZBND7pvwRI9o19?=
 =?us-ascii?Q?N+gezSt1VJ8J6EDKnhWD22N34YRgfrQUlfzDw1AZKxYh03m9LBVTbQefr7Oh?=
 =?us-ascii?Q?InoS3Rm9XUBZq52lxIc/m813MP3j73Pou33BGu8ygI1S+HLJe9NKRpXCXJke?=
 =?us-ascii?Q?ky9LQi51LzQfj2ke/oMUbv8Yx62uzdhO5p/eFUDIl9fx+76u5dMzXyMNvrJk?=
 =?us-ascii?Q?ZjnZqIJls+bny8d7ybyl8HCfHCcfrVQ0JPQ/F5e7TdwNQ8DGIcZLggv+USqR?=
 =?us-ascii?Q?bnXtHIdwURxF5bkkcBjhgM+S43Ac9/1mSn3xnUxLqDoisbuN2O3J8Wsbcq8j?=
 =?us-ascii?Q?H7tbxwbxyIEQEqu7cmKiM7g+/fcPVfqB1gezsjQC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d9abe1-bfc6-44a3-d4e0-08db24a223bb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:38:20.8996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk8ZB74wyJyOjacesSJ9zekyVFqvHJWKFHFBWUZGxikHPFYnDl77ZdvQdzDKU1fU+wW2XQLs2akFMtejHDTjGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
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

Hi Heikki,

Thanks for the review.
On Tue, Mar 14, 2023 at 10:36:57AM +0200, Heikki Krogerus wrote:
> Hi Xiang,
> 
> On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:
> > > Please don't use the MFD API outside of drivers/mfd.
> > > 
> > > If you wish to use the API, please do.
> > > 
> > > Strip out (only) the MFD parts and move them into drivers/mfd.
> > I have no idea about how to split MFD parts out from this driver
> > currently. The MFD part just have mfd cells filling and the call
> > mfd_add_hotplug_devices to register mfd devices. How to module them
> > as an independent driver?
> > Would you give some hints or recommendations?
> > 
> > And I am a little comfused about where this USB device driver should
> > be put to (drivers/mfd or drivers/usb).
> > 
> > As far as I know, where a driver should be put is based on what
> > it provides. This driver just do some urb package transfer to provides
> > multi-functions, such as GPIO function, I2C function, SPI function.
> > so it should be under drivers/mfd folder. Please correct me, if
> > something is wrong. Thanks
> 
> You don't really seem to get any benefit from MFD. Perhaps it would be
> more appropriate and clear if you just registered auxiliary devices in
> this driver. Check drivers/base/auxiliary.c.
Yes, it should be a work. I have a question.
MFD provides the ACPI binding for sub-devices through
struct mfd_cell_acpi_match. But I didn't see this in drivers/base/auxiliary.c.
If using auxiliary bus to implement the LJCA sub-devices, we need to do
the sub-devices acpi binding manually in ljca.c.

Something Like:
adr = LJCA_ACPI_MATCH_GPIO
adev = acpi_find_child_device(parent, adr, false);
ACPI_COMPANION_SET(&pdev->dev, adev ?: parent);

Is that acceptable?

--
Thanks
Ye Xiang
