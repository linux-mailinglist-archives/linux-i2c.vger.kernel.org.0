Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEC4649516
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 17:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiLKQc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 11:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiLKQc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 11:32:56 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8748B2729;
        Sun, 11 Dec 2022 08:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670776368; x=1702312368;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=pyc5ucN9QhqzOquINF0jlljgiZIk080uorPYDPpOon0=;
  b=g7HzBRdgTsa0irJ6kIu1wckoOg6cidYB+Ktr+7kEupjVU11DJ7qnr0kw
   xpzuZvBQK7EZybfiAQPTi4h9JNtK5nnBhZR59rJhM14BU+2DraqfmI94F
   97sAIhseK3AD4wLaq/HNploSQIOXfp5IeGYOt/3iJ/OYBdVJBhjPZtsXc
   c9PvafLpQexnlmQsDPH1eQXSB77kiy9GwDYLdyg6uy+A6Qqt3/Z+Dk+yt
   mxT6vwReRkNiY4UwX3FjIIThpOXIwSic3KpqelSkUIqZdL3fV9KiDX3br
   uyNUZQz9mqw352sC/0XvY8nNtZ5zMir5f56pgXRlyDXOsUuLvB1lNpOof
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="319572512"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="xz'?yaml'?scan'208";a="319572512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 08:32:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="772344369"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="xz'?yaml'?scan'208";a="772344369"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 11 Dec 2022 08:32:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 11 Dec 2022 08:32:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 11 Dec 2022 08:32:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 11 Dec 2022 08:32:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 11 Dec 2022 08:32:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfbfDYmEh0D7SnXLvkdhg4G8DJfTy+LfLa8bD03nAqZg0vCZ4V2ChECTLWQlWp7/F7iebecnvydpHnKbprD18hdHUfmOYFRhOyGeU9LeO/DV+aqsU6EaG4GgnztDcw+QSCx68wA7SfUFnlHNMKr2+9iAu4IpCdFIvQEtXbB5DxfcbJiXYzvb4pGbmhFfOnndRUq7FrOFQcvCzGK+USxjBdgq88Z71tXCs5Ab2+MWzcMcthslvhikS+rJWV17zXQB6jG3xMHmHDl2nc2nsH7ZHsbC3UXA3ykAZFbUHl64J4BPgaPM9Hsq7B9KG0fYctjHYzkknNu2YqsIaEdBU38R5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1lYc92IXr6fv6sGmJwxl5OERF67uLaYpR/2UsSUkvo=;
 b=CZD9QM14bi96IqRiHTdURsIm76HGMDKonH4f4SihQqfsqpPfkal7/YFGPdnW+II6zeJJGGn4sYaBCwo7l8tO8LUCShsr1kyTgwQCS2YaXd1s27CKNK1iUQAj1mLHRJE70MjHPSzPEhk8nakANDI7cT5XnJknkmvAJF15YFQNOtJNdiZ5PGNQarfghA414Fqv4taJWfx56y/yjQW9o2IOQWSkQm+4WLPlpI97tdjIzKbThdhE8+nKiaDhjq5OuFspNwT3PXfcJ/lGG6CLgj/eKOZAhyo61UJ2CZKw7DnTZbDsLftG1MYwnZkZSXnAjWNy2XCmExbNQmItRPAjxB/fIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sun, 11 Dec
 2022 16:32:37 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d%5]) with mapi id 15.20.5880.019; Sun, 11 Dec 2022
 16:32:37 +0000
Date:   Mon, 12 Dec 2022 00:30:24 +0800
From:   kernel test robot <yujie.liu@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
        <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <202212120010.6de17419-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="nsmh7zgiHfGNsiUm"
Content-Disposition: inline
In-Reply-To: <20221208182142.250084-3-brgl@bgdev.pl>
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 175889f0-e77e-49fc-278a-08dadb954fdc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hcHjIPw+o6oyJOaoStP6OySdWC62HHgW5JumkqtwTVgHdjvL0/sB5CMWGOKZvvSEk4VGMJdcX9RkrYqJ31iUrXdBQ8xOlYHTJiRE8wWmyn34n019OAlhXRNbvqt609DP8ZR6fU38FuhyY//ha4qHwYU0CmgFsXLuahsSEpfYL7m/plmjLUvX+jCjjiGL6H97BbGupLXSKVTpn4RFT1U0cCKsM7EaOq6alAlmaCh6aAAJvqLzWUDl8buKeIoBXR6SDC4CDUB2W46stepT3fD9IeiNKR32RfLMAkM8i5DH8oTFXx/yenP6kpGlz77YKjP9ida6dl7BGoYNjeboFU/Lv/NCvHTjvUFdgn4OQShu/BbQ565HC0sWi+F7wX3GZflu4nrbEhgdlqqclJIUFw9+bXc8I3eOsNZhSaAHAbjHLZL9irvODS+5kRsEd0qYHeerscGL0igsjcUMB7yfig3DymU3phsaKlTARHCgOBqodUMpyryB2Pwd1OltwdpOOKJBvXjmPm6EMEIpksD0LfbJ3T0F+esTOiiuYnkcbcgA2iRwdABxWqh03gzKoMOE8uQ68/p4zQAyX3eHpTNbLzaqSE4eVe4YSPI/ikrhMntHOO53DYXM83CPOfKb1IBpoehOuzDboMqKDknh4GmjGxMWfWS7yEj1MpTyH0GYZQzZjLdWXIimIdwmvsZFlAvEKdpg/95rxC32m8FqYwucnsdzFwtA2v+LArjkgPM9nEzf9cHkQSoWa2P9nBbph10Sa5XRISByiC1oKdMgoTjFrfR1Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(478600001)(1076003)(44144004)(966005)(6486002)(45080400002)(21490400003)(6512007)(2616005)(6506007)(26005)(186003)(66476007)(8676002)(4326008)(86362001)(2906002)(66946007)(41300700001)(83380400001)(316002)(6916009)(54906003)(66899015)(235185007)(5660300002)(6666004)(66556008)(8936002)(30864003)(82960400001)(38100700002)(36756003)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wNaYShX4OO76YrFtloTQBJn7hxrWru9ok1vd9WLQoyY2P/IJdx2xqfoFDBQb?=
 =?us-ascii?Q?1nDWxuSkYfPPpGw2pT4yNuXvglz2tMDGwlHqhuZOj2jqN7tuV1qZcNc2tBVW?=
 =?us-ascii?Q?w8LvH999XUvS83GWLWYQcw8ANjE5S/0yZoI8ylt6nw4HgfiD/Doz02cEuW2a?=
 =?us-ascii?Q?kbfayauVWIp6q6fdiUnzkavoAmHyaVVBFFPy3ix91vYqTPq7lXeCgBbc3DhD?=
 =?us-ascii?Q?uSWpc3ygZAfjo3910jRlxVeQCug0Rlim/ZOM2ARNnTLzmzVUzknelGM8a+/J?=
 =?us-ascii?Q?oDuzj1Q6gkr3QVC4V28il1/QBSJvdnhxiI4RaUgmS23lXy2kN4kwMto1cKaE?=
 =?us-ascii?Q?1k76M6co8fxi1Eu/nwQO7dDLHrT5hs3K4STSq/FkgiW/6P9NRl4qMpfXVmpu?=
 =?us-ascii?Q?rZ6a2eT0o/kaLL8p38cnXwCco16TB5P7Y3qRPo13gun8Vhm17pBQXu2qHNgu?=
 =?us-ascii?Q?PnVXRRaSpYnR214zQZcjZkPj+tnOY6F2lC5gPiMc2OAMjAOtuuB8zc142Sa4?=
 =?us-ascii?Q?iKfxwMPMgSaaK9g/feVUNoIpTr0o8S2dKz4gRjoVXRQGJftAPIJuSwm6P1XA?=
 =?us-ascii?Q?wBHx3kwyMPykjauE5nAyQCcxXVuq6xhQjRJzNTxTmDkw1NakDd50/o2d2syN?=
 =?us-ascii?Q?e/eWvwTZIWlMiV5xOSHBlLra/QIS2aW5xLenF/K0IfiLoYyyvrlVa7IXdl4K?=
 =?us-ascii?Q?C5ezGwGbwd/EC8YMc9RWMnVCNEejYFN00I4XqdZZc756xwO6uLznIQaih9sJ?=
 =?us-ascii?Q?Soi0wAaZ1tAdla7eiIeGt2kYon7jxtzj2YcRP5nGtLxewlnW/MSEzE78sGL7?=
 =?us-ascii?Q?FSLZkrlVsAduBroLESpjgrmugzDy3G5tF2HIdLC+6pL3TwTHS22TQhzl9eAj?=
 =?us-ascii?Q?pFBfPEWG2maWvg9YTFuj57+jHXkhtvkv0FIXivf156K/fy5QEz6bmdSFXTDU?=
 =?us-ascii?Q?AfHDnsKpNnqpnYGlIXh28q0NTRnZ0vDqxySTm1FLKDc46jCwQpjT+2+uvh2f?=
 =?us-ascii?Q?3bSOyitvWM9w6ojfSU2Ffz6NnOf29BfUu8uuvOXVatcXcHELSwkL/d3sawuJ?=
 =?us-ascii?Q?YOtZXhgRm9zAOQMpcjPMTyViS3EXyV0j+IdvzMVivZJB/vX3qQSdfZYJRf4r?=
 =?us-ascii?Q?DIgHcD52kApRqoJQER9jPnID3gl0Jzu/77KDY1z8FjaoLwRqRBtwKwzkCxYB?=
 =?us-ascii?Q?D8I1Ysy8voNM5UM6sFzBYgOzYVZK5BY5Ziz5zwTGrbrn02gWS0hcEmPWGy9E?=
 =?us-ascii?Q?tJt0BoBUPAxNHKQhsUGQu5OmYO9pHAmKWIzAyZcQ/7A0LQ6eO2mLDvrMFHpi?=
 =?us-ascii?Q?cNJe0DXeVTdKqZasyZEDIklePciqPtzeN9DESUfKvPUV5BeO9LABNZaC0qOg?=
 =?us-ascii?Q?bXF9PRD72xbwZ/fkdJZSKN+8X3U6niS13LEofhOA6C4jFQ+W/iK74htiNX/S?=
 =?us-ascii?Q?TTZ3cQWfcCC9zoWMNv5ZPGG36MWs5t9K5PV1TbUzuE6D7SNPVE4Ia2gloBWk?=
 =?us-ascii?Q?CEFTK5vUqOuQweyJCotB93QI7X9d/XVsX2CjCdHMJ3SCh8ALRc9v4XsJHt4G?=
 =?us-ascii?Q?S26/BJZPBkld2kisQEEGq8Mn+g+34TunEj2gB0Nt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 175889f0-e77e-49fc-278a-08dadb954fdc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2022 16:32:37.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf/3uXJdZoZeCTx2x5aFFcMFyd8qJv9feJ/OgMGSpHkWy9GXILo/hAR5f4ZewR2IyrgYKZ4Q18x/rwgvbBUjyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Greeting,

FYI, we noticed WARNING:at_drivers/base/core.c:#device_release due to commit (built with gcc-11):

commit: 22f82cbe7636f59cc21f6837c500d704e3b412a5 ("[PATCH 2/2] i2c: dev: don't allow user-space to deadlock the kernel")
url: https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/i2c-fortify-the-subsystem-against-user-space-induced-deadlocks/20221209-022450
base: https://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git i2c/for-next
patch link: https://lore.kernel.org/all/20221208182142.250084-3-brgl@bgdev.pl/
patch subject: [PATCH 2/2] i2c: dev: don't allow user-space to deadlock the kernel

in testcase: xfstests
version: xfstests-x86_64-5a5e419-1_20221128
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-group-07

test-description: xfstests is a regression test suite for xfs and other files ystems.
test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


kern  :warn  : [   35.378637] ------------[ cut here ]------------
kern  :err   : [   35.388198] Device 'i2c-7' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
kern :warn : [   35.401052] WARNING: CPU: 1 PID: 195 at drivers/base/core.c:2332 device_release (drivers/base/core.c:2332) 
kern  :warn  : [   35.410178] Modules linked in: x86_pkg_temp_thermal intel_powerclamp i915(+) sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft ipmi_devintf crc64 coretemp ipmi_msghandler sg kvm_intel drm_buddy intel_gtt kvm irqbypass crct10dif_pclmul drm_display_helper crc32_pclmul ttm crc32c_intel ghash_clmulni_intel drm_kms_helper sha512_ssse3 syscopyarea ahci mei_me rapl intel_cstate libahci sysfillrect wmi_bmof sysimgblt i2c_i801 mei intel_uncore libata i2c_smbus lpc_ich fb_sys_fops video wmi drm fuse ip_tables
kern  :warn  : [   35.455372] CPU: 1 PID: 195 Comm: systemd-udevd Not tainted 6.1.0-rc8-00063-g22f82cbe7636 #1
kern  :warn  : [   35.464544] Hardware name: Hewlett-Packard HP Pro 3340 MT/17A1, BIOS 8.07 01/24/2013
kern :warn : [   35.473036] RIP: 0010:device_release (drivers/base/core.c:2332) 
kern :warn : [ 35.478405] Code: 48 8d 7d 50 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 89 00 00 00 48 8b 75 50 48 85 f6 74 13 48 c7 c7 60 f0 ce 83 e8 6c 1c f2 00 <0f> 0b e9 0f ff ff ff 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48 c1
All code
========
   0:	48 8d 7d 50          	lea    0x50(%rbp),%rdi
   4:	48 89 fa             	mov    %rdi,%rdx
   7:	48 c1 ea 03          	shr    $0x3,%rdx
   b:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   f:	0f 85 89 00 00 00    	jne    0x9e
  15:	48 8b 75 50          	mov    0x50(%rbp),%rsi
  19:	48 85 f6             	test   %rsi,%rsi
  1c:	74 13                	je     0x31
  1e:	48 c7 c7 60 f0 ce 83 	mov    $0xffffffff83cef060,%rdi
  25:	e8 6c 1c f2 00       	callq  0xf21c96
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e9 0f ff ff ff       	jmpq   0xffffffffffffff40
  31:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  38:	fc ff df 
  3b:	48 89 ea             	mov    %rbp,%rdx
  3e:	48                   	rex.W
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e9 0f ff ff ff       	jmpq   0xffffffffffffff16
   7:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   e:	fc ff df 
  11:	48 89 ea             	mov    %rbp,%rdx
  14:	48                   	rex.W
  15:	c1                   	.byte 0xc1
kern  :warn  : [   35.497913] RSP: 0018:ffffc900008af310 EFLAGS: 00010286
kern  :warn  : [   35.503884] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
kern :debug : [   35.507134] calling acpi_cpufreq_init+0x0/0xdeb [acpi_cpufreq] @ 190 
kern  :warn  : [   35.511739] RDX: 0000000000000004 RSI: 0000000000000008 RDI: fffff52000115e54
kern :debug : [   35.518879] initcall acpi_cpufreq_init+0x0/0xdeb [acpi_cpufreq] returned -17 after 1 usecs 
kern  :warn  : [   35.526749] RBP: ffff88811b5671e8 R08: 0000000000000001 R09: ffffc900008af147
kern  :warn  : [   35.526761] R10: fffff52000115e28 R11: 0000000000000001 R12: ffff888215592a00
kern  :warn  : [   35.551527] R13: 0000000000000000 R14: ffff88811b5671e8 R15: ffff88811b567220
kern  :warn  : [   35.559414] FS:  00007f9cb90ec8c0(0000) GS:ffff88818e880000(0000) knlGS:0000000000000000
kern  :warn  : [   35.568257] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [   35.574756] CR2: 0000556c7b996000 CR3: 000000011d29a003 CR4: 00000000001706e0
kern  :warn  : [   35.582650] Call Trace:
kern  :warn  : [   35.585828]  <TASK>
kern :warn : [   35.588667] kobject_cleanup (lib/kobject.c:677) 
kern :warn : [   35.593256] i2c_del_adapter (drivers/i2c/i2c-core-base.c:1710) 
kern :warn : [   35.597944] ? drm_encoder_cleanup (include/linux/list.h:134 include/linux/list.h:148 drivers/gpu/drm/drm_encoder.c:199) drm
kern :warn : [   35.603630] ? __process_removed_driver (drivers/i2c/i2c-core-base.c:1655) 
kern :warn : [   35.609083] ? drm_encoder_cleanup (include/linux/list.h:134 include/linux/list.h:148 drivers/gpu/drm/drm_encoder.c:199) drm
kern :warn : [   35.614859] intel_sdvo_init (drivers/gpu/drm/i915/display/intel_sdvo.c:2626 drivers/gpu/drm/i915/display/intel_sdvo.c:3436) i915
kern :warn : [   35.620500] ? intel_sdvo_get_hw_state (drivers/gpu/drm/i915/display/intel_sdvo.c:3313) i915
kern :warn : [   35.626889] ? fwtable_read16 (drivers/gpu/drm/i915/intel_uncore.c:1851) i915
kern :warn : [   35.632481] intel_setup_outputs (drivers/gpu/drm/i915/display/intel_display.c:8005) i915
kern :warn : [   35.638516] intel_modeset_init_nogem (drivers/gpu/drm/i915/display/intel_display.c:8764) i915
kern :warn : [   35.644817] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:966) i915
kern :warn : [   35.650560] ? __mutex_unlock_slowpath+0x2a0/0x2a0 
kern :warn : [   35.657141] ? i915_print_iommu_status (drivers/gpu/drm/i915/i915_driver.c:889) i915
kern :warn : [   35.663336] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:167) drm
kern :warn : [   35.669388] i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:1337) i915
kern :warn : [   35.674966] ? i915_pci_remove (drivers/gpu/drm/i915/i915_pci.c:1305) i915
kern :warn : [   35.680594] ? _raw_read_unlock_irqrestore (kernel/locking/spinlock.c:161) 
kern :warn : [   35.686339] ? __cond_resched (kernel/sched/core.c:8343) 
kern :warn : [   35.690950] ? i915_pci_remove (drivers/gpu/drm/i915/i915_pci.c:1305) i915
kern :warn : [   35.696432] local_pci_probe (drivers/pci/pci-driver.c:324) 
kern :warn : [   35.701038] pci_call_probe (drivers/pci/pci-driver.c:392) 
kern :warn : [   35.705638] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:186 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
kern :warn : [   35.710260] ? pci_pm_suspend_noirq (drivers/pci/pci-driver.c:352) 
kern :warn : [   35.715549] ? pci_assign_irq (drivers/pci/setup-irq.c:25) 
kern :warn : [   35.720242] ? pci_match_device (drivers/pci/pci-driver.c:108 drivers/pci/pci-driver.c:159) 
kern :warn : [   35.725190] ? kernfs_put (arch/x86/include/asm/atomic.h:123 (discriminator 1) include/linux/atomic/atomic-instrumented.h:576 (discriminator 1) fs/kernfs/dir.c:536 (discriminator 1)) 
kern :warn : [   35.729449] pci_device_probe (drivers/pci/pci-driver.c:461) 
kern :warn : [   35.734150] really_probe (drivers/base/dd.c:560 drivers/base/dd.c:639) 
kern :warn : [   35.738596] __driver_probe_device (drivers/base/dd.c:719 drivers/base/dd.c:776) 
kern :warn : [   35.743827] driver_probe_device (drivers/base/dd.c:808) 
kern :warn : [   35.748787] __driver_attach (drivers/base/dd.c:1191) 
kern :warn : [   35.753494] ? __device_attach_driver (drivers/base/dd.c:1135) 
kern :warn : [   35.758968] bus_for_each_dev (drivers/base/bus.c:301) 
kern :warn : [   35.763741] ? subsys_dev_iter_exit (drivers/base/bus.c:290) 
kern :warn : [   35.768860] ? __kmem_cache_alloc_node (mm/slub.c:3400 mm/slub.c:3437) 
kern :warn : [   35.774388] ? klist_add_tail (include/linux/list.h:69 include/linux/list.h:102 lib/klist.c:104 lib/klist.c:137) 
kern :warn : [   35.779157] bus_add_driver (drivers/base/bus.c:618) 
kern :warn : [   35.783759] driver_register (drivers/base/driver.c:246) 
kern :warn : [   35.788442] i915_init (drivers/gpu/drm/i915/i915_driver.c:1078) i915
kern  :warn  : [   35.793347]  ? 0xffffffffa14e3000
kern :warn : [   35.797404] do_one_initcall (init/main.c:1303) 
kern :warn : [   35.802026] ? trace_event_raw_event_initcall_level (init/main.c:1294) 
kern :warn : [   35.808719] ? __asan_register_globals (mm/kasan/generic.c:214 (discriminator 3) mm/kasan/generic.c:226 (discriminator 3)) 
kern :warn : [   35.814120] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/kasan/shadow.c:142) 
kern :warn : [   35.818735] do_init_module (kernel/module/main.c:2455) 
kern :warn : [   35.823348] load_module (kernel/module/main.c:2849) 
kern :warn : [   35.827859] ? post_relocation (kernel/module/main.c:2673) 
kern :warn : [   35.832716] ? __x64_sys_fspick (fs/kernel_read_file.c:38) 
kern :warn : [   35.837666] ? do_mmap (mm/mmap.c:1412) 
kern :warn : [   35.841947] ? __do_sys_finit_module (kernel/module/main.c:2949) 
kern :warn : [   35.847338] __do_sys_finit_module (kernel/module/main.c:2949) 
kern :warn : [   35.852552] ? __ia32_sys_init_module (kernel/module/main.c:2917) 
kern :warn : [   35.857850] ? fput (arch/x86/include/asm/atomic64_64.h:118 include/linux/atomic/atomic-long.h:467 include/linux/atomic/atomic-instrumented.h:1814 fs/file_table.c:371) 
kern :warn : [   35.861675] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
kern :warn : [   35.866017] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
kern  :warn  : [   35.871828] RIP: 0033:0x7f9cb95a33a9
kern :warn : [ 35.876164] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 8a 0d 00 f7 d8 64 89 01 48
All code
========
   0:	00 c3                	add    %al,%bl
   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   9:	00 00 00 
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d b7 8a 0d 00 	mov    0xd8ab7(%rip),%rcx        # 0xd8af1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d b7 8a 0d 00 	mov    0xd8ab7(%rip),%rcx        # 0xd8ac7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W



If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202212120010.6de17419-yujie.liu@intel.com


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.


-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.1.0-rc8-00063-g22f82cbe7636"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0-rc8 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
CONFIG_INTEL_TDX_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=m
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
CONFIG_PMIC_OPREGION=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_IMA_KEXEC=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_RDMA is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_RDMA is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
CONFIG_MACSEC=m
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
# CONFIG_CAN_SJA1000_PLATFORM is not set
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_PURELIFI=y
# CONFIG_PLFXLC is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
# CONFIG_RTW89 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_SILABS=y
# CONFIG_WFX is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_APANEL is not set
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_UINPUT=y
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_IQS7222 is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_INFINIBAND_ERDMA is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
CONFIG_INTEL_IDXD_BUS=m
CONFIG_INTEL_IDXD=m
# CONFIG_INTEL_IDXD_COMPAT is not set
# CONFIG_INTEL_IDXD_SVM is not set
# CONFIG_INTEL_IDXD_PERFMON is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
# CONFIG_NVSW_SN2201 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_SVM=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_IRQ_REMAP=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
# CONFIG_SECURITY_PATH is not set
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
# CONFIG_IMA_KEXEC is not set
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
CONFIG_IMA_WRITE_POLICY=y
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_IMA_DISABLE_HTABLE is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
# CONFIG_FAIL_SUNRPC is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='xfstests'
	export testcase='xfstests'
	export category='functional'
	export need_memory='1G'
	export job_origin='xfstests-xfs-part1.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-ivb-d04'
	export tbox_group='lkp-ivb-d04'
	export submit_id='6393ec8f0f8a6be9cd04cf9a'
	export job_file='/lkp/jobs/scheduled/lkp-ivb-d04/xfstests-4HDD-xfs-xfs-group-07-debian-11.1-x86_64-20220510.cgz-22f82cbe7636f59cc21f6837c500d704e3b412a5-20221210-59853-133asy4-5.yaml'
	export id='6a3f488101a7db08e37ac32ff61fd5e6f525c0fb'
	export queuer_version='/zday/lkp'
	export model='Ivy Bridge'
	export nr_node=1
	export nr_cpu=4
	export memory='8G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2KB240G8_BTYF836606UQ240AGN-part1'
	export hdd_partitions='/dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part2 /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part3 /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part4 /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part5'
	export rootfs_partition='/dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part1'
	export brand='Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz'
	export need_kconfig='BLK_DEV_SD
SCSI
{"BLOCK"=>"y"}
SATA_AHCI
SATA_AHCI_PLATFORM
ATA
{"PCI"=>"y"}
XFS_FS'
	export commit='22f82cbe7636f59cc21f6837c500d704e3b412a5'
	export netconsole_port=6676
	export ucode='0x21'
	export need_kconfig_hw='{"R8169"=>"y"}
SATA_AHCI
DRM_I915'
	export bisect_dmesg=true
	export kconfig='x86_64-rhel-8.3-func'
	export enqueue_time='2022-12-10 10:18:56 +0800'
	export _id='6393eca80f8a6be9cd04cf9c'
	export _rt='/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='f8ef1e742b53b5ca368d17083e07888d677ebe2a'
	export base_commit='76dcd734eca23168cb008912c0f69ff408905235'
	export branch='linux-review/Bartosz-Golaszewski/i2c-fortify-the-subsystem-against-user-space-induced-deadlocks/20221209-022450'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export result_root='/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/vmlinuz-6.1.0-rc8-00063-g22f82cbe7636
branch=linux-review/Bartosz-Golaszewski/i2c-fortify-the-subsystem-against-user-space-induced-deadlocks/20221209-022450
job=/lkp/jobs/scheduled/lkp-ivb-d04/xfstests-4HDD-xfs-xfs-group-07-debian-11.1-x86_64-20220510.cgz-22f82cbe7636f59cc21f6837c500d704e3b412a5-20221210-59853-133asy4-5.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-func
commit=22f82cbe7636f59cc21f6837c500d704e3b412a5
initcall_debug
max_uptime=1200
LKP_SERVER=internal-lkp-server
nokaslr
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/fs_20220526.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/xfstests_20221128.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/xfstests-x86_64-5a5e419-1_20221128.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220804.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='lkp-wsx01'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='6.1.0-rc8-wt-ath-13156-gddc4f1f20db8'
	export repeat_to=6
	export stop_repeat_if_found='dmesg.RIP:device_release'
	export kbuild_queue_analysis=1
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/vmlinuz-6.1.0-rc8-00063-g22f82cbe7636'
	export dequeue_time='2022-12-10 10:20:12 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-ivb-d04/xfstests-4HDD-xfs-xfs-group-07-debian-11.1-x86_64-20220510.cgz-22f82cbe7636f59cc21f6837c500d704e3b412a5-20221210-59853-133asy4-5.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup nr_hdd=4 $LKP_SRC/setup/disk

	run_setup fs='xfs' $LKP_SRC/setup/fs

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='xfs-group-07' $LKP_SRC/tests/wrapper xfstests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='xfs-group-07' $LKP_SRC/stats/wrapper xfstests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time xfstests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--nsmh7zgiHfGNsiUm
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

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

--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="xfstests"

2022-12-10 02:22:29 export TEST_DIR=/fs/sdb2
2022-12-10 02:22:29 export TEST_DEV=/dev/sdb2
2022-12-10 02:22:29 export FSTYP=xfs
2022-12-10 02:22:29 export SCRATCH_MNT=/fs/scratch
2022-12-10 02:22:29 mkdir /fs/scratch -p
2022-12-10 02:22:29 export SCRATCH_DEV=/dev/sdb5
2022-12-10 02:22:29 export SCRATCH_LOGDEV=/dev/sdb3
2022-12-10 02:22:29 export SCRATCH_XFS_LIST_METADATA_FIELDS=u3.sfdir3.hdr.parent.i4
2022-12-10 02:22:29 export SCRATCH_XFS_LIST_FUZZ_VERBS=random
2022-12-10 02:22:29 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-group-07
2022-12-10 02:22:29 ./check xfs/070 xfs/071 xfs/072 xfs/073 xfs/074 xfs/075 xfs/076 xfs/077 xfs/078 xfs/079
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 lkp-ivb-d04 6.1.0-rc8-00063-g22f82cbe7636 #1 SMP Sat Dec 10 01:00:17 CST 2022
MKFS_OPTIONS  -- -f /dev/sdb5
MOUNT_OPTIONS -- /dev/sdb5 /fs/scratch

xfs/070        4s
xfs/071        6s
xfs/072        4s
xfs/073        22s
xfs/074        3s
xfs/075        2s
xfs/076        255s
xfs/077        41s
xfs/078        10s
xfs/079        19s
Ran: xfs/070 xfs/071 xfs/072 xfs/073 xfs/074 xfs/075 xfs/076 xfs/077 xfs/078 xfs/079
Passed all 10 tests


--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/xfstests-xfs-part1.yaml
suite: xfstests
testcase: xfstests
category: functional
need_memory: 1G
disk: 4HDD
fs: xfs
xfstests:
  test: xfs-group-07
job_origin: xfstests-xfs-part1.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-ivb-d04
tbox_group: lkp-ivb-d04
submit_id: 639364eb1ea9f109d6324a2c
job_file: "/lkp/jobs/scheduled/lkp-ivb-d04/xfstests-4HDD-xfs-xfs-group-07-debian-11.1-x86_64-20220510.cgz-22f82cbe7636f59cc21f6837c500d704e3b412a5-20221210-2518-tkle5e-0.yaml"
id: 8cc194371ddb59929703b4e16e1413c9baffefb0
queuer_version: "/zday/lkp"

#! hosts/lkp-ivb-d04
model: Ivy Bridge
nr_node: 1
nr_cpu: 4
memory: 8G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2KB240G8_BTYF836606UQ240AGN-part1"
hdd_partitions: "/dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part2 /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part3
  /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part4 /dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part5"
rootfs_partition: "/dev/disk/by-id/ata-WDC_WD20EZRX-00D8PB0_WD-WCC4M0KTT6NK-part1"
brand: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz

#! include/category/functional
kmsg:
heartbeat:
meminfo:

#! include/disk/nr_hdd
need_kconfig:
- BLK_DEV_SD
- SCSI
- BLOCK: y
- SATA_AHCI
- SATA_AHCI_PLATFORM
- ATA
- PCI: y
- XFS_FS

#! include/queue/cyclic
commit: 22f82cbe7636f59cc21f6837c500d704e3b412a5

#! include/testbox/lkp-ivb-d04
netconsole_port: 6676
ucode: '0x21'
need_kconfig_hw:
- R8169: y
- SATA_AHCI
- DRM_I915
bisect_dmesg: true

#! include/fs/OTHERS
kconfig: x86_64-rhel-8.3-func
enqueue_time: 2022-12-10 00:40:12.648653796 +08:00
_id: 639364eb1ea9f109d6324a2c
_rt: "/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: f8ef1e742b53b5ca368d17083e07888d677ebe2a
base_commit: 76dcd734eca23168cb008912c0f69ff408905235
branch: linux-devel/devel-hourly-20221208-220048
rootfs: debian-11.1-x86_64-20220510.cgz
result_root: "/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/0"
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/xfstests/4HDD-xfs-xfs-group-07/lkp-ivb-d04/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/vmlinuz-6.1.0-rc8-00063-g22f82cbe7636
- branch=linux-devel/devel-hourly-20221208-220048
- job=/lkp/jobs/scheduled/lkp-ivb-d04/xfstests-4HDD-xfs-xfs-group-07-debian-11.1-x86_64-20220510.cgz-22f82cbe7636f59cc21f6837c500d704e3b412a5-20221210-2518-tkle5e-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-func
- commit=22f82cbe7636f59cc21f6837c500d704e3b412a5
- initcall_debug
- max_uptime=1200
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw

#! runtime status
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/fs_20220526.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/xfstests_20221128.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/xfstests-x86_64-5a5e419-1_20221128.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220804.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: lkp-wsx01

#! /db/releases/20221208144305/lkp-src/include/site/lkp-wsx01
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 6.1.0-rc8-14680-g8c709ee2bd0b
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/22f82cbe7636f59cc21f6837c500d704e3b412a5/vmlinuz-6.1.0-rc8-00063-g22f82cbe7636"
dequeue_time: 2022-12-10 01:15:47.517186198 +08:00

#! /db/releases/20221209185942/lkp-src/include/site/lkp-wsx01
job_state: finished
loadavg: 1.40 1.17 0.66 1/142 69292
start_time: '1670606306'
end_time: '1670606678'
version: "/lkp/lkp/.src-20221208-140008:d4e054b2e:30d5f0d1c"

--nsmh7zgiHfGNsiUm
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

dmsetup remove_all
wipefs -a --force /dev/sdb2
wipefs -a --force /dev/sdb3
wipefs -a --force /dev/sdb4
wipefs -a --force /dev/sdb5
mkfs -t xfs -f -mreflink=0 /dev/sdb2
mkfs -t xfs -f -mreflink=0 /dev/sdb3
mkfs -t xfs -f -mreflink=0 /dev/sdb4
mkfs -t xfs -f -mreflink=0 /dev/sdb5
mkdir -p /fs/sdb2
modprobe xfs
mount -t xfs -o inode64 /dev/sdb2 /fs/sdb2
mkdir -p /fs/sdb3
mount -t xfs -o inode64 /dev/sdb3 /fs/sdb3
mkdir -p /fs/sdb4
mount -t xfs -o inode64 /dev/sdb4 /fs/sdb4
mkdir -p /fs/sdb5
mount -t xfs -o inode64 /dev/sdb5 /fs/sdb5
export TEST_DIR=/fs/sdb2
export TEST_DEV=/dev/sdb2
export FSTYP=xfs
export SCRATCH_MNT=/fs/scratch
mkdir /fs/scratch -p
export SCRATCH_DEV=/dev/sdb5
export SCRATCH_LOGDEV=/dev/sdb3
export SCRATCH_XFS_LIST_METADATA_FIELDS=u3.sfdir3.hdr.parent.i4
export SCRATCH_XFS_LIST_FUZZ_VERBS=random
sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-group-07
./check xfs/070 xfs/071 xfs/072 xfs/073 xfs/074 xfs/075 xfs/076 xfs/077 xfs/078 xfs/079

--nsmh7zgiHfGNsiUm--
