Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D257F6B1F8A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 10:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjCIJLy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 04:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjCIJL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 04:11:29 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E871CBCB;
        Thu,  9 Mar 2023 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678353065; x=1709889065;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uzSwTzYmuirE2t1RVyqqLXco8jZUtWj6cD5l5IatId4=;
  b=HRUu7iorM50LUK3QxuFcWBKh9lTgw12nak43rbSVAbAEFYYGSahWC7Zh
   Ga7x50QLkWSw8d/44DUuoNkepCi9utCHQVmuCxv6Ck1YlYz75scQPrGaU
   4dUNkp1pHSsi3zGkTaJJDCZFu6BKllrPGdnXGQpAZ0iVmenYe7Ll73qly
   xzVxcW6QqQ8d3IBzt2E2hY3kXA7dDZzHsSbRr5A8aBJHHmmM9BYde6wt6
   9SvuUjAW4BLNl0FVl+cxF1IMi6u7+xTX0EOjnRSVqWfwVW83wxwdCAlv6
   AeLPYDRPX+NHAHPZV80tAvcUm7bBtpipo6Rz2Cye/S3C9IY4QnAKk6LyR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316055525"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316055525"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654687400"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="654687400"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 01:11:03 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 01:11:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 01:11:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 01:11:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmyEJKVHFhtklESqwpNQLW/SPkZnMWr6s0m5KTicmyf/NlBRqZeGuLQtbJQwD3U6A42xDe82LlOOhusYbwTbfTTD4Bt1uKowrrGshRaGC02DTgkJilW1Xp/DNo/pPMGGb+NRB2Ul/Co7DLdIyUJu03Ti7FMa9h69cyFboxOOtEfFkWlMIw7AwLuzFP6BqoCS2Xjq3CcYch8heXXkPLVxjTtkvniAsvw5nhUXZqAjlGFpmJYNhhKVZfcVwYtyG1wnzIjFCMRJ+w65SwD6soEaiu8l3VR9qX3fKeuhfkMQqGZr52CzNaA7YzlHWpSNfVBA58EggyWt8uhpnOw3DY52ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBSPJxtZ9gMsGhVc80P/1K4G9O/GOIQGpLJDUOHkeG4=;
 b=LYPY0H0hVNStwtXCU9Tf9XTlBLyts8sL3Ocz0DIbhbyGGeN48pnHPgv6iWJuggE9YOdrf6IClFB9YB5XyE5JU0Cm12taNB1UoCskGyC82TZhqx1P6gwZfQcw3k9X+giBKuGPp6TmA0rLiId8ETK8qMP5Nt9vq2xCYd5HJnOyKDYCK6y9vOZjJClde7zTMA2ynZjkQbFlLEh80OVTX6oJLq3DQTSM+qQnnzmRL9qurOmshfVWj3pKmWOaJZS8zqLRtSsMAv09Aw1QoEP7HmPLHFxf+CQohm4ftVcxcEk63N+gaE3dXD4k+Ky0OHqWcAoJJ65Tf2Dr8MPIp07TfIOirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.18; Thu, 9 Mar 2023 09:10:56 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 09:10:56 +0000
Date:   Thu, 9 Mar 2023 17:10:48 +0800
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
Message-ID: <ZAmimLMY49ktjagX@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmPjfH6rA0pbiUa@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZAmPjfH6rA0pbiUa@kroah.com>
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DM4PR11MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdeb555-8485-4769-0916-08db207e30c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4xRrCs46xElKJJN9dMt7t2MW4inRZl6UPMzRdp9DAWCBb+eOeZ9lInD3KYOElu3rsvrHscxqLxT1yIfDRJDQWKPosdkDh/DGzu5Ao8WKWQ4nVC9CZL6XzlEm+kWhBLbwfY3Oj3Wkcpn8DXORq057R9eRsa/DQYMHVVJZ3RWHRs/0alNMRUIH7Cv1cvG/igCbzci2pgDch/JJrKN8Ov6SkMoSaJ5+i5UfbqC3v6q/KAlJRzNAMTgxtOTVo6+8RxmDbnPereYx6dbzA4O02HgO9ZUeITnW1ZgXpVUjz8U/QPRAYbeBP5VHTDRUKhGtpHXZEsDA/kCdHFVdLH30bYlrv0aI1UiN1w1qa+OdcGOkCpIwTwNC/PWuajSl+xMCdsLoTyu9X8KBst8iPukoDQaw01j8aamqAtuyVgNHu0rAnplKPQYUCpYIZX7BSaOwpBzJhKgYui4XEhVdQ1zDJq1lk4LLqMa3SCeRBWdxC+KTa42+c0XogXiqOdaJ9gQYf/84Xrry/B4aHNAJZIo66CGF0VeQ4qUgCv2XPsjEKvgDJ+XLj27x/dyXPCkqJ789MdfGKsMGKBwEC7ZjjouLkBLxsubiZXR9NoRu7F+fK7r8wXzblngL0zlrgUV3r7U3DNW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(8676002)(41300700001)(66556008)(33716001)(66476007)(4326008)(66946007)(82960400001)(6916009)(2906002)(316002)(54906003)(8936002)(38100700002)(5660300002)(186003)(7416002)(9686003)(478600001)(4744005)(966005)(6486002)(6512007)(26005)(6506007)(83380400001)(6666004)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHiXBC18yZLotk+qwcrA+s1d8NX73zummMhAP31pIgyrFdBdPtrMsth5D6wA?=
 =?us-ascii?Q?TgmdwGNUNiLoJ3MPNx/irXJ9k/rpx1J5g0d9gNxvi+GRaXuJDzsEiJR2+k7x?=
 =?us-ascii?Q?kJntakFSOhsYkvMSsYD4k/1A+WQSurJzQn5bOYHblG3EXpkA7gztXJeHu145?=
 =?us-ascii?Q?RutlI+LZdhE9Zmczr8+iDEbBVJR564VULrE5YUCTW9EXknskQSrGPgswVrls?=
 =?us-ascii?Q?wYM8rCCVJ1bMh4/SuGh8AXdDjGFK0gxsUgUARmz9l6PWSxdHyQDGgUfTzcPH?=
 =?us-ascii?Q?dp97RFFYFK6wPtwQcBbdy7TwLFuZD4USrxy1toeQ2xy5PwEe5bqyEuain8UL?=
 =?us-ascii?Q?ejZwBhqrPmD5ZYzdi+P03Knbe4ghkazmATdzNmaUDLsCeyF8VNuulMLCVO9L?=
 =?us-ascii?Q?A0xrGvQLclyucDFV1n/3bzg/oIIGsKKvrAcabUzzHh51OlgBPNVewKH6uqAy?=
 =?us-ascii?Q?OaOWbFM4vfE242ojBTx8Co2WIo9Kf1fxrQas71YEqJPdk5gS+KigO91x86qz?=
 =?us-ascii?Q?O1gv9fVGOZR7AHhsg+Xjr46MqazTX4sxVlxE98MnH0Vz5zvUXOeMyZDDE/3T?=
 =?us-ascii?Q?17KwjBsz/PDmcMbYSvNnH5iOz4qA/HSMqFQGh1hTuiEE/mroTqnED7G6RQn9?=
 =?us-ascii?Q?CgLnEIuX07AVd7N5H27x7NJ+H8SVl5igpCjaMgD7lGKFygikjqbcVF+X/O9I?=
 =?us-ascii?Q?MiEFMw4Lkiv1zLePaq7OQOvj89fb4XJfMJtWxZ28znXzZF1wIce39t8Azdtw?=
 =?us-ascii?Q?JNkbGL6zdF+WlByLeibUmdNGXAdkTAug3KeFFewWDW2bcYx8bVcZn9/8g0v9?=
 =?us-ascii?Q?3KbATDFwkW2F1J+GDHIYHkVDqF4476pz95vCRMZYLoe17rFTTPFdoUmKng32?=
 =?us-ascii?Q?0Wwmfi2h/BSw3Ui+eTPyw7Fn9iM5EG5vcwtZzKmrx34PEgmei7kUv5GPfMJ9?=
 =?us-ascii?Q?BFo1b3FRxwNB/gbx8qlwLVqjfCHFsyZzgRrNWQO9VfyIyD/8oM5t9BDst5vS?=
 =?us-ascii?Q?Zi1FtlWqg0R8Ta/4EfL+kt97gQ7Bk6zHvt8wh1qYoL7HtRpGrmP78mQluPb5?=
 =?us-ascii?Q?ohEdxdCd/HciS/4xjjBVptecp/+k5g0wT9t/QtjFyrZNbMcndUEs6Ull4a9o?=
 =?us-ascii?Q?C+HgAoKKdWLReYPecTpM8Brp6mifTAnw4XbstbPt2IrI1atdCkkLqUG28KcQ?=
 =?us-ascii?Q?Kmjro3nrtvmyXgYqdiFww9GLOoMZu0SlBK3yyhpDUbz0PhuHSajzmEsXY5EK?=
 =?us-ascii?Q?Jai1yB/KACD/kJp6BMAGa9OaT0BfsOoL8mS7Ed1104YZAtp4MLq+y9kfOgeb?=
 =?us-ascii?Q?482aHlcposQXVE5FfB0MLqL0rTalYfTqc4uvhBHOyZBoWWO44ZVnLjaxOEUN?=
 =?us-ascii?Q?Oif3VsG25ZNLZEVPkl/BiGDcOHKwBNuEYcjwh1Gfh8OrwLN3xX+UdiNuF7wU?=
 =?us-ascii?Q?ge39dW8QpFyVwumnITON+UfufapVa6dqwmQzaPEABHi5RNzs6yKFL/ljX9Fj?=
 =?us-ascii?Q?mEegxg5plPq8dVhiHFz9thFQk3/WGpVsFRMrDvkpSHVoK0o3Z2jsOFWwrCdQ?=
 =?us-ascii?Q?RrNE6fwBScLBhOu/3Fq4K2EOzm9Y0znzGWrcgOb9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdeb555-8485-4769-0916-08db207e30c7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:10:56.3125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiOIrqnKd3p1XvEaG0KBCFt7SCiomyMvZp7iV3L0jX3URGTLC2QLS55qAqhsm/dyRFgfZI4M4dPYYnPi/FJRoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for the review.
On Thu, Mar 09, 2023 at 08:49:33AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA).
> 
> Then why is this called "mfd" in the subject line?
Sorry, it's a mistake. I forget to change mfd to usb in the commit message
because I just move the ljca.c from driver/mfd to drivers/usb/misc according
to previous review comments[1]. And I will address this on v5.

[1] https://www.spinics.net/lists/kernel/msg4708451.html
> 
> >  include/linux/mfd/ljca.h  |  95 ++++
> 
> Why is this .h file in the mfd directory?
It's a mistake as well. Will address it by moving include/linux/mfd/ljca.h
to include/linux/usb/ljca.h.
>
> thanks,
> 
> greg k-h

--
Thanks
Ye Xiang
