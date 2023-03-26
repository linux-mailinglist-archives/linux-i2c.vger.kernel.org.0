Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A756C9348
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Mar 2023 11:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjCZJFJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 05:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCZJFI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 05:05:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B839012;
        Sun, 26 Mar 2023 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679821507; x=1711357507;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0/qFmD8ns0gv6Rd7ojtArwSuQbek+Z7zNivdBqZqnZs=;
  b=k5Px9GuBPsUMQ586Z4hGcZMaBky6a0aeHpm1T5feSEwc+TTt8ZsBhmhW
   ja9AtsR1aZfnhL0zHH0SIv94thVBFS09mVGgWMQq10BygNe4zNBVOIk+g
   OMNrykdptkld+mFHb4PSf0RWgYcvwaO3/Rzkw5wsmGmKEHnKqEXNTTfwh
   JXGUbp89OTDZ0NAm5eTyRjT3eWCppJNEUJBKP0t9fPp5X+IoB+h1V7ar+
   jI6/mfjA/RzDEWBw4scCVEGpzRbK4/xt1Naf/OJtSC1eUVToeFQt3dtXC
   pXaAnzfsPEb/s721Fumt6CIhdLGgpiesZ5Yqjosh/EJNzkIrj2VLPXlMC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="319718471"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="319718471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 02:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="772346475"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="772346475"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 02:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 02:05:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 02:05:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 26 Mar 2023 02:05:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 26 Mar 2023 02:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdwEi/7ER13yt4q31Wp8Uynh0P9cP3tL0MvT1LCp8bB++9VMRWtpToSoSugE0W8JJ3pba81u92zKdwb8mzgkDfgqnO2DVopGXLd4+NkKubMV4wzwPeNBc7J6aNEEqXd09wmCrw3QV2sZFI3j+kABZ+qDue+tANcwUwYjIzov1MTBA8GdNgXBuWrio66BFos+TTLKfwk+t5dVjHExBCJcFLTSegjUWSxbbulsMssK98PaB8lfE50ehGqHrg5+99xjmq6xeBTjw/tnFLfiP6J1irqZsIv6A891g8c0zjAf4m3JIMufkBUfuP9/sUbj1VZrerFTDSPQ4q0fD2vllZpkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwW5YYJ2W36D2xHDSkzt9fGVgfnbjtJZtZk3QslFFX8=;
 b=GMdjIJJNT6vEyRsWmj/FAN7T0YZBkIla5c+Ay8yFollqgGLFCx4lip89WBOLf1bwhE6l9wvxpsNkILqQTGKPfXn3VROUxbg5mJCJIMKDJRvk/TVZaloUzwP6e4E96lVWmPEcNrlw7sbSbqn98D+afII1I9X1pYLKUkPLoaOafcoGJtb8KV4rCrWJsNx0H9fJE/wEpjYNntrA9iY6NQNEPrBeCxTgv78eRqiBUUhyu0ntXShIFpI6467nOBhtXnCY94FpU0MT96RNykx0hUVABAYoXoDzxuqxI7ke0NI2CZbo9/0HCxajaOKV15s/GP6LCSEQ2qvkqOltNjkqXhHZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Sun, 26 Mar 2023 09:05:03 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.041; Sun, 26 Mar 2023
 09:05:02 +0000
Date:   Sun, 26 Mar 2023 17:04:59 +0800
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
Message-ID: <ZCAKuyNHpp9EJff8@ye-NUC7i7DNHE>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
 <ZB91Nz52TEd34IST@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB91Nz52TEd34IST@kroah.com>
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b4fd87-63cb-436d-0a90-08db2dd92ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3U77jJBkPqfs1h8P0f44ZS7naYhcJNCi2ySccHWqByBA+fHD9NqFKX/uRjpoN9j6TzE4sXQo3YTph5nuLq/dbMJVRlltn5kZeRKjt8Kjr32bNZIj2yQyKcm3ZOdOm6kYCawC5f8z+RrvOG8uEy+nLy9Y58Pxni9pk0d4CBoCXuNUrTrBKCG6293Vzf/HN0uUrtYLcK62yFedO5x2Fe/WYhQ8B58NTc/AKGMbZLa2ebM2Z+zQ7HAyJkI1j20gDdUIVuTFL+AQRxe9XKRiFdVhvXSSCVHA+7Rku2j9Ni8Miz/eCaqtu85J6nGa66gc5p6DPcUv4KNn2G0MzEYjYfLI/CYtDi08euZhMhGOKVMZK6l/kNnqRnVnJmWBJV0Dqrxo/UqNuUsY1+VFJRn+ZHidgfjRJQ5zgFaI/E1wmhq8a18UAJLInBFI/a8caJRL74RLn70pKNoQGdcY2u15QujLiCWe74XnxgWsecgxw0Y57S3IUx4TG/o1u2POkDSjVrNc2Mnw+GOZ9vRQGFBODwciOuA3mw9Ge8XzszNX7tTsG4HEok5YS8lUQFb1R4D7SCt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(6486002)(54906003)(6916009)(5660300002)(8676002)(186003)(6512007)(26005)(6506007)(7416002)(33716001)(478600001)(41300700001)(6666004)(8936002)(38100700002)(86362001)(316002)(66946007)(9686003)(66476007)(2906002)(66556008)(82960400001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NPMmLxkU0ccqVtMW/b1zeW8w/FhZ1M3jmaalBb2abdvSlppR+Yod4UAVlW9H?=
 =?us-ascii?Q?eaigChME6jqZi8q6L9FE0AfVgIY9k04PgOjL1wSfJKtg/4ekciGy4cmlIKGE?=
 =?us-ascii?Q?vl4anPdjQyundhMIy9+j5y9lsSombyAm71nxT/pud7D7wT0ZnFuMb7K6p8yY?=
 =?us-ascii?Q?C0qRIqdLV93EN3M6asEpg+tOGrMfU/JeqGHuVMTU9/IVKfhQtDdmfMPvC9kp?=
 =?us-ascii?Q?t4+V+oPmqu4E6cMyaxcQy4H8++6YdHpvk9rJRq7gY4EXRohtfwrBZBJv2xWI?=
 =?us-ascii?Q?o4IL+tQqqlIzK6qg3JzjqMF3REwuqcJ4kbhTlLMOqKSllutEqULntsHl9uZT?=
 =?us-ascii?Q?+Rq0vB1qO4TCvGiBh9Yv43bwYkC8b2tWDDFLoMbSQx+nmHWcvfVRYHLpV+kX?=
 =?us-ascii?Q?vZx+7db9Fd82ef8RqO6rUmWikxhccLSWsIlZptlzZ6ksZlx6oc3h+0i8ptjk?=
 =?us-ascii?Q?eY09z3eJ8jOc/Z8D2GvIdtqvmdqeOQJZBPx4DOnh5Zv2wbcnp4i3XlxlXsj1?=
 =?us-ascii?Q?RZ1Gy0fyPezA4ZbSVWNiJGYS3Lw2QzgIJCZkUo5552ygucVC3xN36R0K/Tvm?=
 =?us-ascii?Q?HuNJDsAT2surcG7sXw98FMiIpUmA5gAyDP6Bi39UpQeDzjejXA6k9CwUfW1y?=
 =?us-ascii?Q?LXS6Yhk+oJRJCWYlOQdN9q00+yZDjJ7bgcr+kJcu6aEa6TzZLlKY2NlvUnkg?=
 =?us-ascii?Q?b4uPc1tuA8Ba8WDI4s9iYLJRWsxOf0JWclZIFkY3DcBePmQymneuWxNrjWug?=
 =?us-ascii?Q?egkOT6ECWXDsP1I6BUK4hTmsQy26i34snG616p6x11tBiZa6eIqYfOnncUvZ?=
 =?us-ascii?Q?O1O6OP45k6ADMzn41ZEI3MK0wob2YiULdFvP/VyJp09qq76WC7HAfvxkd5XV?=
 =?us-ascii?Q?UB3q/m/E+eSEi1fHDPssvjo0KDj149PEfFv09qNmPOwFh/zlH6TsEjehc+tz?=
 =?us-ascii?Q?Zs8WH5DPhpNX85bV1bMwMbElGWmGYStYle+633wVpgH18XJvSUAHJmexlz5+?=
 =?us-ascii?Q?Kuh5r9AI8IJ2SvDFQ76HJyNmxs2uffX5M2+Er6nPvYAbMq5C5+cWk+ZDfCHC?=
 =?us-ascii?Q?Uw+nSAD4tPeh1KbeaIA1ZMlNlFgOLRfo1EfEC9faEwkUQuNvWkieeVzGxA9J?=
 =?us-ascii?Q?zlPdDCVfmEfojFU3EPeneCqvMTitErpJn7B2UIN5y4wK+WEfAfFNQ+fW9Qwk?=
 =?us-ascii?Q?+fgWGkYxMlwbVFqkjYYJRPUCh9VcufoYtX/lHOZ/VMn9jEEYanzxE3+RbZZj?=
 =?us-ascii?Q?k0Lw9cg3kkYGIzWWPclGOJHsejo5GMC0usmUjM3jYlw5Jv3OToHDMnJeW7bg?=
 =?us-ascii?Q?ST6GmBpqc3iIV21WbuEqSCdO2dTPG8TfekY/kvymcVeRYNZiEZdZHo7UcnoS?=
 =?us-ascii?Q?aq9Mu8/QIRHhGDFWzdMM2BlC1vnEz2TLMMKq/mTr14yCEt/3vIJvyVLfilIL?=
 =?us-ascii?Q?UDkIL5J1dHBFzzi1fJFCOuaNDWIMpnkXW9esRpcWOG8UWYlBCpSMnz0YtZCT?=
 =?us-ascii?Q?4j2iX2HG70JgEsasJKaz3m97egGd0kB3Q0XMpSuCyUx1wER/4XHxuBoFNS1L?=
 =?us-ascii?Q?65IvzEA8bjm9V0R1y+2ZXd3fdoT/AvmuliOb1B4Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b4fd87-63cb-436d-0a90-08db2dd92ece
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2023 09:05:02.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkDZiJX2Q5sFZNLOcGHq3+co3g/+rEAolAzml5ssS/rFc9ufOOzWtxJ1Y0sD5ZRE9VE/ZA1Nv9gVZbXOlULlng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 25, 2023 at 11:27:03PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Mar 25, 2023 at 11:47:06PM +0800, Ye Xiang wrote:
> > +static void ljca_aux_release(struct device *dev) {}
> 
> Sorry, but creating an empty release function just to shut the kernel up
> is NOT how to properly do this, you all know better.  This is totally
> broken.  The kernel was telling you what you had to do, don't think that
> you are being smarter than it by doing this, otherwise we would have
> never had the kernel spit out that error in the first place, right?
Got it. Will use the release callback to free memory used by the auxiliary
device instead.
> 
> Now I will ask you to follow the proper Intel kernel review rules and
> get proper approval for the patchset before submitting it to us again,
> as basic things like this are not supposed to be caught by us, but by
> your internal review process first.
Thanks. I will get approval on Intel's internal review first before sending
the next version out for review.

--
Thanks
Ye Xiang

