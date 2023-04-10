Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C71B6DC5D6
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Apr 2023 12:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjDJKok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Apr 2023 06:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDJKoj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Apr 2023 06:44:39 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592DB2D49;
        Mon, 10 Apr 2023 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681123478; x=1712659478;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uMDZf5kfQ8PiqQdt72D2Yy7AMh7+FC7V4a40vfjDfS0=;
  b=Ljlz7SZFo0ROsx9hfNNMtik7/m5OaCwRakfMvGYln5P5k9ckO/GjRY3m
   9UWXqTmkFsP4oEbOGPsaimWNELnGs2BUB4fNcMleFGJxl7NADZVd/av7u
   dNoIAP9yDCeAJvuKqEMNDG0wC+eT7/ifx305pKsoViNYicR5U14LbKRR2
   bGEGbkWSPD9zbpapcJXN/F6dVYlRQlKLJp+QyCOYWFutb/YhTBgUloo2J
   SEUeWW7BplX4qnXLvfSHK5Qgj5Xm6UDb1SYfRQAxYL401u+RUxAI69W9U
   4I06ot02/m7Wrmvk6IylGmGbYIv2Xm5NaXTp7bDFZqURSKgJGQl8Mpjjc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="342095271"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="342095271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 03:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="752724044"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="752724044"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 03:44:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 03:44:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 03:44:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 03:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiZf6n8rzWso0mxMuq1BT9XLtXB4dr9IQD0fQu/+3tjexyMVhTBhLW9et+6pSxT1ZpxRupsPpa+5gGKEjUJL1riZcz0fdhnPdFxYPn/hkrtaPWLw+iPYFBzu/CvdCtUf49lxtNPk8AOcCdD1AfHm/olSFVoFIdGSpQzTt4VR1E2GpVI/7gqCno8nPpfLctgGPAjHntOFNnLnkISkccTX6epR4n3q3Ktsgj1TVOZbY928T4dGRcEADGzp6VqsMTAXLFWqSC9bKcJFnPRmq36b9/xP/7s76ONu/xlAK9qk79tjuvUJk8fa0iW5u/M87Y13QQNH48qr8WmsRbjOnw3atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwiGe7EvpS53Vyw6MOvKdXn+w+pw24z05Ux3gH6wOcc=;
 b=a6aPXhVmqvK6N03fkib8OsQF5jSRFeehqju2GXco1YZKgpf+PncPfhT6bOkZk6We6E5hjM5ddo9AGgDZuuIblQKrcPbNpk5SqdVEejLbK2pJgfHFRoIMx0rM9ori6MCVy1qSUybOJyuRAuVegcJ5qGpSFvnm5WcmHfftx1KQJfrZ/NTC+N82kquqPcnafK5Jtvwdo3XrpQyNyh2XsEnS2Xq4bDOHn7a69FtQG/hzORI/4euPDoh5tXNAabeO2mpDei5yt+7D8+1pZsV6uFAXgGgbBW68ecHj+uvWo9QLMDMJtrBrrLEJC/tCk+7nrFKEwmf8TzItpeAUrx7AZA49Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.34; Mon, 10 Apr 2023 10:44:34 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::3d44:4cb0:ccca:2afd]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::3d44:4cb0:ccca:2afd%7]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 10:44:34 +0000
Date:   Mon, 10 Apr 2023 18:44:34 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
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
Subject: Re: [PATCH v7 3/6] Documentation: Add ABI doc for attributes of LJCA
 device
Message-ID: <ZDPoku+k+S65cmeQ@ye-NUC7i7DNHE>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-4-xiang.ye@intel.com>
 <b1eb8356-4519-4c95-b3ee-afc142b8d17f@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b1eb8356-4519-4c95-b3ee-afc142b8d17f@suse.com>
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|CH0PR11MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef2d7bd-d9e6-4eec-88aa-08db39b09283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCGZ5k5a4XEPd1t5DikqipA0uXMhrVOSBde0IcyWZghA5OlMdwFeq4N2uiuU6kgAAOGM75UXO0rpYOgjlk+syVFXNYZclCRA55yjERdKz8a9DtFdAjOI6ivFtaCgsQOBjcm6m8r5yW/s9YnPOvyCaF+vPl5eIe44PYrCsLYEm9sSNQeNGjZ577KbNZqIqAG/gA84EJndxsx9wZGd262cnrq2OHiTVhzylM4UXZSC+pzeZLHmgD6uzEyzkCXZAj4X/PhxoYfj9qiPJeGylcREvjlZz01nW/IPyd5bl2laPkIw7V0H7KspYym/kTfqUYA0IjFuQP+hQzaxiqGgT6uJPCmUAPE2GKeTGAR7ujxPcRs5212ErjmFq5XtPgd549qerAt2b/etbOY1G8vM7qDNlocoxkdQfc7bFWCB/o9D5iVDse55wF/LWwCntLSNCWhSKhypR0CYx/j8H3Sl7l9sxFnwq/IiknPbEPsAdsTgeIqiCmGr2queyFnFuKd5/v15i4BALZsufx9TXSojwzc8V4h0B5BEcfl1EQGZWABKGExxINBvtO+DVXttfV9A2TvT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(5660300002)(38100700002)(2906002)(7416002)(8936002)(86362001)(8676002)(66476007)(6916009)(41300700001)(66556008)(66946007)(4326008)(82960400001)(83380400001)(26005)(316002)(6512007)(9686003)(6506007)(53546011)(33716001)(6486002)(54906003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4XvPAuYxtzv5N1aaLen6s8snriIC5L/I2PAi+zVpv3p+7E7fUq1I7soUr028?=
 =?us-ascii?Q?yUFcu42Byb6ZUM8qY8moI+NxsyMzrKIRjpPbPFuazUZWPYDpYbrdxJbXYS8p?=
 =?us-ascii?Q?KoRDhTKvoai8+9H9VptVq2iTh4oJxVgp4xRcaX8gGLR6cduDsz7DMxHGDL2c?=
 =?us-ascii?Q?tVBn/+Wfbr/O6q2SIYZgIpAiWNdyf4+G26UGTaknV0+QGv1avxymEZLvlyQh?=
 =?us-ascii?Q?20G8rg7UPE2EMmVyN6viSj5Qwe3DBwDlukOTdlryczysseThLST3KXvccb8x?=
 =?us-ascii?Q?5vpyLpUCBzUHQI0Q4HI65F1PiDPHFfOd3TRZuON4RsDInFvNBpcO2IzIrj6P?=
 =?us-ascii?Q?7r4p9VIvVm6nH1EkQKOS33DYQyACvSqP4WjH6u0JyKis29axM1W7PtSBhsH8?=
 =?us-ascii?Q?cwnofWp+7UaqsqedsRTGIXkOj62abUagG5r+pkxWHLSvm8kYg+ye/Mg7OB9Y?=
 =?us-ascii?Q?y+4/poLHFpV032oOUsEHCNse9GGfZrFgBqaqJyLoO/2RHx5HS8Wnv2X5SJ6s?=
 =?us-ascii?Q?jnbMQ5MfhX9iROA5G8TwfFWTAn6sA2caS7gDTFr9y7UBIq/nVMI75qHdvIdR?=
 =?us-ascii?Q?lJ1eV7ZjXnZ9B4x8GSGlQm9j1RlS46QEXcqgujmJNncDDpHAED43uI5sMAU4?=
 =?us-ascii?Q?led77/jle6oJwf3hyut8RyxNdr8BUmKcxbIsNmuqHO6rjhdgLETcbmXUvyWE?=
 =?us-ascii?Q?04bQtf6xBaiSd9B17AaZH3228t5pv0vI8WjdsYGviFU/EKVa9eapJE454lHY?=
 =?us-ascii?Q?ZsFVoMWcJCjC+5vgDfVIJqczpvTu3Nr8HQq0PIdZ9zh3j1J5B0wT+tvlwflp?=
 =?us-ascii?Q?zoDVCLev3tqlH43N2daXNm8g3/MnhvSCOaZ1113Vex3kHvcHGtGDEA7LWf/b?=
 =?us-ascii?Q?trWLL3XGPPPOaSJNBoPYpkcKrF2wSx/dj5RKZd+NuWgCBFVup8+RNTi/Cajm?=
 =?us-ascii?Q?fJU8HPVlRtxGcoYEKajVIVwPIVwH18KkmUsLU+vsSxYx+875EBbLGhJP+GQP?=
 =?us-ascii?Q?v+mgFCBZYHxalZ1MKUXe4Dm0gELxR5xz/ll3rhRMPWGCqJPtNClNCHmq9MaV?=
 =?us-ascii?Q?TYd/9CE7BrWIfKMNyOTKJb1LegwJXRVbCZPw2HRZkp11bK37Riw6ZDiR43Cf?=
 =?us-ascii?Q?Hre+XtOiY2gCUrwHjjcbET6CZjN/7zfiXH17ntNgKVlo1YQZm9asoZO4j/jr?=
 =?us-ascii?Q?T967dU8rRqHjEQkQXUpzgOOyJHiEh1hMDDNmTPN8Rp2u43v58BmHAdJHOGFU?=
 =?us-ascii?Q?BRsZe/HIwL3tCYkhhWz0odBIPnRgmjP7pczpLc20H1cpFtBIeOztCSix8jsg?=
 =?us-ascii?Q?0vlAXvRivV8GTjeJzCyVIXj0+8labtNxKw0UQfPxTayYimEwLoslvaMqscOD?=
 =?us-ascii?Q?3pDKcxXXzdalDb1IJUS6cbKpJ3XLj8YJ+c8ijZMS3vTQEunIQfSWT+3f1Lpt?=
 =?us-ascii?Q?LeeV7zlHbTkTHx1LvOXEQQCT20ewQDr/FQNtB0kST6Qjz9YGb9XB4m3dVdQ0?=
 =?us-ascii?Q?lYw1tcH67+adcCxoUgyL6+xrQJgUIgXRaoxSGHaqFmVEuOvocxNKoK1mOcg8?=
 =?us-ascii?Q?r+YLCUN6oV1VXk/86fyrzDp8fLa00DdfJ8HIPBuy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef2d7bd-d9e6-4eec-88aa-08db39b09283
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 10:44:34.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdENQCrHpkAtK8etC5dC8hmuj3sBrDC1dUYefx6BPTCmKxxYCpBkuE74TJjwj8n+NMbLCwCkfasE/E7YyPSZVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Oliver

Thanks for the review.
On Tue, Apr 04, 2023 at 10:53:48AM +0200, Oliver Neukum wrote:
> 
> 
> On 25.03.23 16:47, Ye Xiang wrote:
> > Add sysfs attributes Documentation entries for LJCA device
> 
> Hi,
> 
> do we really want each driver to have its own attribute for that?
> It seems to me that that should be unified.
Three ABI entries are added in this patch: ljca_version, ljca_trace_level,
and ljca_enable_dfu. The first two items are specified for LJCA device and
I think they can be kept in sysfs-bus-usb-devices-ljca.

But for ljca_enable_dfu, I didn't see a unified DFU entry in sys-bus-usb.
I am not sure whether other USB devices have similar DFU mode or not.

Any suggestions?

Thanks
Ye Xiang
> 
> > +
> > +What:		/sys/bus/usb/.../ljca_enable_dfu
> > +Date:		July 2023
> > +KernelVersion:	6.4
> > +Contact:	Ye Xiang<xiang.ye@intel.com>
> > +Description:
> > +		Writing 1 to this file to force the LJCA device into DFU
> > +		mode so the firmware can be updated. After firmware
> > +		updating has been done, the device will back to normal
> > +		working mode.
