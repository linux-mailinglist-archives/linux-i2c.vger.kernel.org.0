Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6716C8FBB
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 18:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjCYR1F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 13:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjCYR1E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 13:27:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32329ECE;
        Sat, 25 Mar 2023 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679765222; x=1711301222;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=WWiVMuTKEMjlLRksHPWYGwSn1I30Bad2KsrwcPqNH1Q=;
  b=XamjXMuGlz84nFF/Idr2SOCE2TH/dn4ZoAkrZizyeWxraRovZbLrOWxn
   FhWirf1jLsd2QYRTkGkLHyumjROMM+o21FbBvQUb/2wbkQHqDeh6L4mWA
   wpaBfLaeLroooqwrczW81/lc/1ZQVjBs/Z3kpqE8kvT6vjkerHl3sDbJm
   Jzpwj/G2V/ybKinxxGAts99QZ2/SXxcfliSwcTec75d7jrg7ApskeaUEN
   g6qlHffEGXaFXVCZfmPfu0QEZDa7/bEUJT0r6j3+3+a2WJa5vmggu3x4V
   NPQndpoPGuDWMMyFe/O8obQlgEnStmhmREuHUWFinxuBxCarOZt1KXDL+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="320395501"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="320395501"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 10:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="752227480"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="752227480"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 25 Mar 2023 10:27:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 10:27:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 25 Mar 2023 10:27:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 25 Mar 2023 10:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ3FBZ/3yRJ6GP07nEmL5gpMTeWfg4tv1KV/TXTFXKPf6hU29K7Tyy+ewap0oKJl7V3eZipHjBKu/19G8JVp+z+B+QcaIFCw0ANcWNQzJH9vRVNbR352oohLlwfc9J2hj1i3Fl4RKQFWgAIocRtcak8l8baW2tNAIqGAR/paW08lojNiQ3gZMY2zb/P9u7Fiaw4qla0vy+zuIcdKMQU1oQnIlDsxmrHzMB+NeNakvjTFSpzWpQ/1Bd4FI07bXL5UeczCk3UiozwEd2QQJpiiilezOPvklI2OS/Jvz9HdSXlve+7+Al18yd7gpNBukDfcM5dctA2vfDAR+/IPZWp9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cehSX5oXfhTGHarXWNIuUaQb++h/jVSkGuHFY826mOc=;
 b=Z+s+s7IEfbIWCiPVz26zF2NPdTOSyKkB/4xKGaIxkw6wBZbtMZclXYupySJ3lanm7wZGy7UWb4B92yG/jpKC0aGH+OmJELdtjRNSddHODNj+AfsUOqA8QJwAqy2bCOc94TPPHQ9KicQFJy9oK0kNcCBSHBI/x87NBKkaTXWs42gKzaoSSEtvlAMVQHLc4dX7TATAbv44/NKjU1gL6LA9IjVItM8qRPyls6ZEQx6+x/4dEGBoY9Agg3PP7OI2mdfhGpCY6FRzcPB8a3wsnisXxeEVDcJDP+dIiCAPUMzENi2RnJE8fLqkNx2ZocqKPycRE2sE4mBI+vlLjNfmOgLNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sat, 25 Mar
 2023 17:27:00 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 17:27:00 +0000
Date:   Sun, 26 Mar 2023 01:26:55 +0800
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
Subject: Re: [PATCH v7 1/6] usb: Add support for Intel LJCA device
Message-ID: <ZB8u3wWTQhg4PvQe@ye-NUC7i7DNHE>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
 <ZB8fOTpD/uuexaV1@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB8fOTpD/uuexaV1@kroah.com>
X-ClientProxiedBy: SG2PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:4:91::21) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f7d2d4-933f-4179-8e55-08db2d5623d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmIBXK08autBXhtPbpQVNneDRyEQ4sCzqy0OBLcX/TTIBKvrsW7jRtTLdielwv8Jr/3w/mKUBvjIxaiJ6mqL55e4QXBFowWK7M8eVkKq/K+YOLhRViIdTV2cOS6dJqqL2vVfYkwNXNyMIIpItPPE4CYoL1qaUs2Ni/f/w0w2lpbnjZp5fXSHzJsPv8ZgOSuRGiH4T99vWHuWHH12PnCwciYYL93ajJEJBpXgIuQyP8jbRzmPEfNNlIDsnCzvfdy7c1D6pKItw4ZJNZUqTSzndVC+yG2WTvcE3N3uL2xhgaCXp3iFPrarsM/lZ0EnLWHm0Ctc6yQK/04wZ/VjTcU9X7AFZc2Mpb8SDjP51hDF0jr5Mva9sGneYWwYA0d6ANTA4XsHt87Tc93v07U8VfpgtYdSo6LD2uvSDF0GEQDbeD1doStXEsOFd88JHMQfjBkqKSZHNYUYWNXCC6pWriQ/mk6jpO5nXgGnO60u+a/izWVQLxoB8/V/32wT6marNL8Iy0ykDDFrSmwvQoCje7DXLwn1JeqGl/TXTTxNffau1C3TJCuStDwlHqlft1Tyl0wd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(376002)(396003)(366004)(39850400004)(346002)(451199021)(316002)(33716001)(478600001)(54906003)(6506007)(26005)(6512007)(9686003)(6666004)(6486002)(66476007)(66556008)(66946007)(8676002)(6916009)(186003)(4326008)(41300700001)(86362001)(8936002)(83380400001)(2906002)(82960400001)(38100700002)(5660300002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/yIX148P+LcbC9+FpnIS5ZlBRLHrbK/XPv5+wP1+mAALNVJ3K4gaJ5uWRka2?=
 =?us-ascii?Q?A+4JDKvh4XvNVZo6ypNfsbPYHOPfJ3aT/IJXvsgr8v13zVozF7Tf6JpzwAbz?=
 =?us-ascii?Q?qaPCG2dd/LPBY2eDXItBWgZk5uIvFa/lzWR5W9pMYPgtLjvcVvMSAGKiUIoa?=
 =?us-ascii?Q?EHYMmLj/iUgcg+BAKQu2nPGLpgGKIYVxeA5gympl4mvkUxbfdnITw0uLXjCE?=
 =?us-ascii?Q?JY2jCHIVfN2T2R+7yxmftAmEPlzemHkAIu9sGw+qwRQdCbmNIVlRYpn+tJo0?=
 =?us-ascii?Q?l/dIG6kLeO+rAZ+5gLfZ+kMqi9VyIk0awtyyDluZ0QdYvGZsm7MpepsDtizl?=
 =?us-ascii?Q?bN9JIdJf+NMeUmVFtPMOwF3iSOb2fX7vEAbvTLJbuAtVkvDmZMWDo0hq7I5R?=
 =?us-ascii?Q?xCsBtNXClOMel99/bmXzXnOy535i1I0FNivNgYVlfFHl8l9eFuccm1E+Z4Cf?=
 =?us-ascii?Q?eab9A4njgHFrxd0hj3AiQE9IEAT1O2cRcl5BpwsFyU35mAFTvrSgnu2Davuh?=
 =?us-ascii?Q?iyA5JiKf8xdm86ipk5pKSYCFmvSfZhpS5m2AZD8uEyXVTm71jXCG7gopumoi?=
 =?us-ascii?Q?E+bpJvIqKDoIEqRD++vULXDNZT0JS70nSXI2tJKAk3mASoIT/atcrtW1NHEh?=
 =?us-ascii?Q?SbUvIFrXKf7Zbd+9Zv656oNHS8awO6b+Bw7kfcGWFfpoURB/q/jB87LARLqe?=
 =?us-ascii?Q?o6Py9Jxwr/yhUH6e38itRE4Qgqnis5Fhk+AL4FmxgGwuKb/XAmSWnCyunjb8?=
 =?us-ascii?Q?Y5AjTz3scxl0CXCbfWtrO7+/4c6eIel6w9UmdOrMk9June+YGZ1TB7YmfJwf?=
 =?us-ascii?Q?dK+n9IIRVkFjHshyVjBXcF51YvJbXomjBKjXht/7DP4Hs0cbHUBvcTNkgTax?=
 =?us-ascii?Q?9O3hxDIZ+JhqLqYUBeRO5iZ67D37iEI/XwDDd00l6uGmLkhGFS5QURFdIUoD?=
 =?us-ascii?Q?Imk5sy1h+6u7if2v83fnUTet6RaXXC1tqaoLQovO23DedRUBRLuG18iHMnKl?=
 =?us-ascii?Q?wj4hc/jc6fRT3SDArWkjrMix7JlQExUAPmM3QNlngF9658AllZmSDAP52sI2?=
 =?us-ascii?Q?Qrot7JfHV8yVuYEYAUlcGVL/4Ot3YH43WFi58DUI6QVINL424jQib1X3rHKU?=
 =?us-ascii?Q?BVksRQQP3liexKbbRdkxDNxaFgaS9MkKcZR3KLHjV1iY7/evjx2UxvD4A+lv?=
 =?us-ascii?Q?cBE24n4VROYiTUf0IhG1w+YLqNFVgmmLbprCXN5+MJdWMdGtBrOYtP9ZTPZE?=
 =?us-ascii?Q?6hIN4G+UNasqVdmutSI0sAaMGiE89bkf73mk9DzW4sx9y/i8i4D4j9S0crOp?=
 =?us-ascii?Q?x31yPfEfVS9fujVsYFPABxrDGmHCwc6+15iI6oW14/ffRbcG/i7EYX29Jez5?=
 =?us-ascii?Q?+eLh/qLSd+DxTME7VobRcVl26Kw5w76mUpxU2fWhXdrYk392m6WfrElavwI8?=
 =?us-ascii?Q?VCERMKXzcbMRLbkQR5bsqp3kKv3stvyUt/3RumTGTy+lrVhqsxOH4aN23CsS?=
 =?us-ascii?Q?Ae2iPSjkkDV6V1wXGLUQJzHcAtJL2jtAYISPpfrPdWPYMt4jeiujN1q+lY0G?=
 =?us-ascii?Q?Vm3XkntJhyR22rVGBCbIFKQhCPUBzd/v5AhbPsiF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f7d2d4-933f-4179-8e55-08db2d5623d9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2023 17:26:59.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqhK7NtIbMeLMs3Y3uKe7D232EFcrwOh9Kri0evvvedGzxSYtH3Opk1l8TORtCPGvA4SEOPNmuNQ0kGfpV9sdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for the review.
On Sat, Mar 25, 2023 at 05:20:09PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Mar 25, 2023 at 11:47:06PM +0800, Ye Xiang wrote:
> > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA).
> > 
> > The communication between the various LJCA module drivers and the
> > hardware will be muxed/demuxed by this driver. Three modules (
> > I2C, GPIO, and SPI) are supported currently.
> > 
> > Each sub-module of LJCA device is identified by type field within
> > the LJCA message header.
> > 
> > The minimum code in ASL that covers this board is
> 
> As this requires ACPI, why are you not saying so in your Kconfig entry?
I would add a `depends on ACPI` item on the Kconfig entry so that the
CONFI_ACPI macro can be removed from usb-ljca, because our use case with
LJCA currently needs the ACPI binding.
> What good would this driver be without ACPI enabled?
Before, I just tried to make it compatible with other platforms that
don't support ACPI but want to use LJCA device. But, We don't have
this use case until now.

Thanks
Ye Xiang

