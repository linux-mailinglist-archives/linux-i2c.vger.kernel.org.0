Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06C46B2121
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 11:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjCIKSL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 05:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjCIKRw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 05:17:52 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD314E4DA4;
        Thu,  9 Mar 2023 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678357022; x=1709893022;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yeK+CKcSeZTgGrl2C1M7AGM5ukanLMocF99shhaVTVI=;
  b=Do16Ej4GQf0Bh7I88yP99wDY74ZOrjG/zo4KW/fJzhlLhX+dickiKDgw
   mVtwtHrCrEGLDE1yUZmDsyVpa4cbiVHbA1nZUt076zGrNAdHKXAXHNOYO
   HbKmQy+wKpILq/hozVSCRdAsx9uOXWbuP4cK3XvKteUuPI5ubBNOtbqtX
   E6v2XmFGQIGaee5jLqpP7it3MemIZCBNtUv2O8wuAbQkvI6YPSkfb4uFK
   mePamdfhL8KDpaJt+naXGmYWzg+xhATMdIwEd/pieWoZixIzEB3470N61
   boI/jfL6w0Fd7wWXm8UrDjwwbSgG1r1PBAchtZGaBjScKMSTSky3BSLde
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336421868"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="336421868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766376039"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="766376039"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2023 02:16:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 02:16:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 02:16:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 02:16:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 02:16:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1/3BDZ8DfRKDbiGFydsMOR2/iZi7fOJ2vr4BNsTWIsCEwm0cndD0BTeBbPN1BbOwrlC49HKZfF+WvJGRQXuk8GyBWS3WZgpQX+T5SV3bnRaSArDnRYj9BjznhVlwwfUWEzXqZfmRSzVIfN/lYwYWJwNuGgZ4gqLBqxnYEV3dEYIfvyjQKiSex2DN0HMLmrK+8d8wTVEuKIqCPXdnhQ3cnn77mnRgTNoKIp3EcuYdjzXN2lQb8xfN36aXfwq0k8yjyC/W1eVWhjIvb6jGsEqVkGcfEGVX2P4DUacSPJRz7mNzHJVtz8yJIVT9QnRos4EegMRwp5RJ5yUcGN7qLJ16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ0bUP4t3JePEQXXaSOoQ6KTfYzVGsflLOfBVYHu3i8=;
 b=a7/3C2ZWonU70vYEGdZpUFQvLm7hR/5NWoIhLryN759tlY8dUKLpUgTMlzPFjXNMODzo/I9bt+ZZ8WzKLgw5Ke0/IdQFjuH7oSVlWr9tGDRsRTcBPw1C6LHkirSh2RO1TGtzlLn9drqJG7zNrCrcL6wNei+zSIJFAdL8vmRHAg69ysGrBgpctHXMIGOqsGXCKvsbl+zQISD4zXXv2CjEv59giUU52zvCt6XyGFl5A994z+jUXVgotzm2EjFtxvSwYgi2JCIqS56yRV8bNCk76oIIOUSxbltlaigqC8LuyXKbGYcMC4cLMCbCh7xQMM1D1ekayztkMIlkH9yRek3+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 10:16:55 +0000
Received: from BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79]) by BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79%6]) with mapi id 15.20.6178.018; Thu, 9 Mar 2023
 10:16:55 +0000
Date:   Thu, 9 Mar 2023 18:16:47 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
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
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAmyD9k1o4mA/VdV@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmPjfH6rA0pbiUa@kroah.com>
 <ZAmimLMY49ktjagX@ye-NUC7i7DNHE>
 <ZAmmQ/yKYnOG7xOS@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZAmmQ/yKYnOG7xOS@kroah.com>
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To BN6PR11MB1409.namprd11.prod.outlook.com
 (2603:10b6:404:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB1409:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d94fb32-a8e9-46a8-5603-08db208767ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctYLm+zll8WVi+5oHPn2umsM06r6ng5qZK5pH96ebBpLuMZdCyJQSIAOxA5lpE9DLe9rxzGj0h3ghCwJNhBe/qC0lGTh82fwTfASWSXAm2yAkEaKsAFo31c5rwCwYL2MSa8LE4QKgQYm4guS4sM+g7nAgatoMbk7IxX8tQXiD2k3s1YnwIXpKrhs75yGtakKGj2wub2cNs8bWguMBEpMDxRNyASoOuTP6Jz1uckL/XzWc6a4Y+tsiWnEbzoyr1or5kGWFQY+hdC8lXXuFM6F6IsscH3N44YbekMu93N1ml0tWvNnscv/IuQ5siCexeuzv7gm+/j1AuZKAuCh8BbUCWvtx+3ksWkj2DZI+l51Ek+FG/2NdFejXQj0IK1sY78P2my7+UeEGpagHpY1yds/cF9O7E598bs8lj1K+n60GgoOcAiMCGK3Kx8OS0vzULU5s9fim/4YxZlEASCOhqFcEmUueyeFcuzdC7KqosXM8GbylSNGS6/MlZMp8Y/SiyFKYZ7hSOL0LwYGD+Q+S+g/vup9NiwveaUVR+157hjDBUCql1bCivmCa5Cnc7LYFB9CxxWooJBbqYOvIkCTJnRDv88FoV1InDPwb3ObE8wap1BWFrx9qgpXSKcTUKDXxCID
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(54906003)(478600001)(6486002)(966005)(316002)(5660300002)(7416002)(41300700001)(2906002)(66476007)(8936002)(8676002)(66556008)(66946007)(6916009)(4326008)(82960400001)(86362001)(186003)(6666004)(9686003)(33716001)(6512007)(26005)(6506007)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWrMxNq7g+/Di+Fm5TKl7rEFPuEglkOBoG8Lq6kbQ+3yqUDfouRzDHt5IMXR?=
 =?us-ascii?Q?66s/SvYDGwwT4WVjAxfu6NO6BvxPnmMFOq1xB0vjtVoWg7IPP3VMwC6VculQ?=
 =?us-ascii?Q?N2g5KnLLhO0vOWv8/tIQyxGUqlVTbFjGi1Wbm2WbQfwX5SdGTwkkvdJcFlaV?=
 =?us-ascii?Q?sYT84NUGRTaxYVSqfN9bdHCtutaXt8xQFcq7y35K/4v4JfJu7QKLNqASb0ml?=
 =?us-ascii?Q?eMzqRecTxX2lalMLldMAr6cckAhX3FJdb9J4vn4puewbVtPpNCWyQGvvjebS?=
 =?us-ascii?Q?nmlr7qaIBMzqXw55qUK4UKVoe567NvYFFw95MIbvIXBPjNRjfd4UGJUWu302?=
 =?us-ascii?Q?HIpvEubrNf8vf1DlK4lxDT2h2t/5cwWG69pOj7PhsGqbwH+bT0xHbHcGCD1P?=
 =?us-ascii?Q?UH4ApvAUIGELwRAvQ/U1p6x4H6hg96C8xOn8YDjyNZ7xlEQ1fa6SDkxaRiE6?=
 =?us-ascii?Q?MvemzlBql7jb7M9/URfHBNevHopTebWWY7pexI3EIsSrlSLrrOpk4cXdP3Vp?=
 =?us-ascii?Q?zUhIHL4jbsUCdfDmUG2JXY1bSf/tN9ph3QF6zMKowS4c5g86a84n2u3ndkZT?=
 =?us-ascii?Q?9iGFnJmN95u61rZKYfkM7KzBUwnAXL6AnAAEFDRa0+Tqm8tqUv7HuTnFoIKl?=
 =?us-ascii?Q?jYiutNVKSIM9FXoxYU1bgQjU1+hliAIDAM7u61aQYnkY5/lnsCzF3R3lCzgL?=
 =?us-ascii?Q?+dWVCV0u95eHCXOaYPIkKx12DxbUJhhmEpUXkVD0Zphz5G/moSSQsmNTv5rH?=
 =?us-ascii?Q?kQHaepWWG5SysQ+TdtySJmSTVBY/U45uWjghi25zH0bIL2RNZqGQy5boNsiI?=
 =?us-ascii?Q?xbMNCy+VItPoeeBxwbp11fyVd+tK5kiRqHjzp2ZLykPEJqEIPH/6a9gCddy0?=
 =?us-ascii?Q?MJOEV1U2/jSYuJYAnaiL949Yx3cQSXg6jp8vO/YCNI1BTUEaRoEGUeVbVJg3?=
 =?us-ascii?Q?TZKwzZJ9/EEn4J9baDC8FZt5XOa91BHKWIvio1qt+NHErZELLJcNsjjfUzLM?=
 =?us-ascii?Q?z7TYrpfsfjJuhCOxlRaxxCf0/5SGyKlBaUHvQF94PavnxxRgCG4N5KlY+O9s?=
 =?us-ascii?Q?yKDRGaYckd9ErhldwmVUF1h48g7X8IcG+rrc3M/zKf0k0NKN9XkzW2FnHvhk?=
 =?us-ascii?Q?A38iJ2JmvFvPxN1g4o2TU5VF+pL0taMGtl6DeMFArLMEuJ046ZqqwbprLH83?=
 =?us-ascii?Q?2nxt1Jf7qfZpdtvnZKkLBS/BeaYzsc9JLjStA4cRbslh8GX59qsOx5QzoMpH?=
 =?us-ascii?Q?pflhD8ZNiSNLnll9OVBjyW5Rpjy0yeI/rUBMsapk7nvFp71Kh5cgFLLEumOM?=
 =?us-ascii?Q?ph0WVVwL3dJ0C9c528ay9rvp04NGPxx5njhPX4+fD9d0iWTNzTe57X5XEG3V?=
 =?us-ascii?Q?JOSoOra8Jt7Zf9A9i3L8xf4Ngyh13cGGFDjaBKafJ6oL+0CaY2R2ZPtY9WZp?=
 =?us-ascii?Q?4r8vHgjsmlfe33etwz8kcHo+2j6oSDNNBTFjw+6dYN2ChTXfrGpOlbWG4hO5?=
 =?us-ascii?Q?QP6C7AdwEisfJfBWZ19S97OUtxA8+Xn90v6R1yPhSmFOR9AgsWtuvdrFNaMR?=
 =?us-ascii?Q?E0NmCNHnZlwfOBaeD9aRis8OCmnSvmxhDCMcakAu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d94fb32-a8e9-46a8-5603-08db208767ec
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 10:16:54.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s60J+2kGw65o4yWjKSyYxXL9YjQXNVE5LIPz6U+gCZuEUPO0Q8URHhVFtWJX2UPAWd/51lIVP7bBTfyZhYoiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 10:26:27AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 09, 2023 at 05:10:48PM +0800, Ye, Xiang wrote:
> > Hi Greg,
> > 
> > Thanks for the review.
> > On Thu, Mar 09, 2023 at 08:49:33AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > > > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > > > device named "La Jolla Cove Adapter" (LJCA).
> > > 
> > > Then why is this called "mfd" in the subject line?
> > Sorry, it's a mistake. I forget to change mfd to usb in the commit message
> > because I just move the ljca.c from driver/mfd to drivers/usb/misc according
> > to previous review comments[1]. And I will address this on v5.
> > 
> > [1] https://www.spinics.net/lists/kernel/msg4708451.html
> > > 
> > > >  include/linux/mfd/ljca.h  |  95 ++++
> > > 
> > > Why is this .h file in the mfd directory?
> > It's a mistake as well. Will address it by moving include/linux/mfd/ljca.h
> > to include/linux/usb/ljca.h.
> 
> Why do you need a .h file at all for such a tiny .c file?  If you don't
> need it, don't have one please.
The ljca.h file is needed because there are three function driver in
this series (LJCA-SPI, LJCA-GPIO, and LJCA-I2C) which needs LJCA API
to do actual transfers. LJCA-USB can be considered as a transport driver,
and the other three function driver use LJCA API to transfer their own
packages.

--
Thanks
Ye Xiang
