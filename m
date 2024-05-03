Return-Path: <linux-i2c+bounces-3413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35D8BB561
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 23:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1BF61C20D26
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 21:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753FA4F8A1;
	Fri,  3 May 2024 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQSvFpDq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818750279;
	Fri,  3 May 2024 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770871; cv=fail; b=n4R7doPdz3gNI4hVfT64UA1ayjzc8zj8DxxTJo00V+pQRNLxqkj4RG/0qNCHVVjjSD+vCCvZBWPhQQaJztzP/sTkEB21fMPNVb7LBZmMiycTtlG1ThDNWGWgNToAlrTOsk3HzrGkChcqyT+z19Flm/UCh2n+O4scfs++b8w5qBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770871; c=relaxed/simple;
	bh=9A4AeWhdESCsfw44cpFJ4oNoy8nhifGP+MvdeEbhJqg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MYRT90S0r8dSnaqQpAL8D/yy3tDu40LKbI0omMHpPT3H9+EPERHjEU5rqwwop1WqJ3M2U0wUcrObUFgPxmCSp5l9eT1xvnKlB5Pzcrwm0tXNYlvfI/GFABJcA2jnPPwyZklVmg25Uo4zli6IbA+oYZf2d7s02GD2DceIT5XU7WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQSvFpDq; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714770869; x=1746306869;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9A4AeWhdESCsfw44cpFJ4oNoy8nhifGP+MvdeEbhJqg=;
  b=JQSvFpDq/eiYF1vlUtGK1tueviCdSUe+jAEYijkKewJUcVseGvKQTP9/
   89h6c6w4bnp0tg7iOLCpRRoee6RNss9IDHHKEhLIBzsarlmGo0kwYFhqm
   tuyCRmUHtxnVo7V2dOSpU9lfm/X38jyC82hz18nPzAke7j5nZ/VesCDuW
   I83F+jtV07oTGO8Kew9aMOwiUo/snSOgimcgqU3pBhTQkOebb9rxCk3OB
   XP5pwUYjEHTPDX0UnPANqSChha7JZY4HB9SuyoQIwEfu/rW1I0nLNe1GE
   bXN8hlP9kF2uZoyFSd+aqAlgKjjWQZQG/NOfxVmz/eIcW9Y0Z54jbpf0T
   Q==;
X-CSE-ConnectionGUID: UvYDo3waT1Kkp8eQVPjKbw==
X-CSE-MsgGUID: SL4ZIARTT72w+WRtnN6dmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14409738"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14409738"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 14:14:29 -0700
X-CSE-ConnectionGUID: 8AR0XYvxRqyELGvysGlcnw==
X-CSE-MsgGUID: oh7uqHyOSO+1ZHB9qpNzHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27591964"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 May 2024 14:14:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 14:14:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 14:14:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 14:14:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 14:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO3DZexGt361HcZ2DCSK9kAZp813MNxUXV2WSKfxOSFe4GwxwCKPrRLoUMSYFzIp+SiuPsHfrK4P7bTmeiSHOnkXq8vPsoAMp9IDZOkzovbvNW7wwR+wb3PPf+VgedZLBr078xMn1UZrcd+8evahRUHX2TUZPM90Pv89T4fiK1bCAbcknfYVRrEIRJd/6TKOhUrqPNEN0Yx8diiSOJ+8PA4cQOuDBau5Hsfw+Ur/zesPiklabBZdT8bs+7rz3tSCD6OomBLkNn7W6+xtjpYPqrTg3vmkSG4fztOJtrtwRuFJkgWgxTGO/blZrTWS64o5EwtM+KrqKMfYNa4TjBXdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDQe9bA4B31Y0TTgJb1wOeo8QUE8DFs/rEoagl+qgQY=;
 b=YFtm9ubCyyhuKJWiN1Dk6F/afqbm7lxLnTrxcEYvoKenzc+JVvtk3SEQc4ZWS5VD21YKUadk9/xiD4mESKPCV2DAzhS5kSfhK5OFb3CETfbWUmAo1uP6C5kl6izL8zShx95v2RBIsuIrDs5HgZW83mn1jxzghngmLm/r2L2ZBNMkCLoC+N55ZXq+K+iKTvTWTUa+dqwza+uEQ+V4IU/xH8cE/Zjg3zpXx6ayrHvFrXdxn0tki1hQeYlxFPYqLzDFZB32iBtc/WMmZjb61tKltsRntF5HnL017iEah4304GEiio1ObimYyffp7HznecF/cDlpL3q/+vxlAlEhHX04YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.36; Fri, 3 May
 2024 21:14:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 21:14:22 +0000
Date: Fri, 3 May 2024 17:14:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Zhenyu
 Wang" <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
	<intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open list:DRM DRIVERS"
	<dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
	"open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
	<intel-gvt-dev@lists.freedesktop.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "open list:RADEON and AMDGPU DRM DRIVERS"
	<amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:I2C
 SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open list:BTTV
 VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, "open list:FRAMEBUFFER
 LAYER" <linux-fbdev@vger.kernel.org>, Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v2 03/12] drm/i915: Make I2C terminology more inclusive
Message-ID: <ZjVTqNGjaAjuLdLi@intel.com>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-4-eahariha@linux.microsoft.com>
 <ZjU8NB-71xWI2X73@intel.com>
 <4f1e429c-794b-457c-ab1d-85eb97dc81c3@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f1e429c-794b-457c-ab1d-85eb97dc81c3@linux.microsoft.com>
X-ClientProxiedBy: MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c409221-61e9-43fe-fa8c-08dc6bb6010c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1MsuVQHEoBK66PzYUrUKefrqgqyKycmj1++K256fYdwWfE8Wr+p0zMnr+PoM?=
 =?us-ascii?Q?qUx38ycyplCBbs/PygJK+HmHxvTaJt2ddlOBbaxegv5nmewsixFo6qxN213x?=
 =?us-ascii?Q?fsjraA8GN9mnAQFRZuTolflb0o49rIa2m0mAvmEWxwFvPwH8jqXEgt5hiYmT?=
 =?us-ascii?Q?BsD+y4tqY+UWGZISutB9eLCQcItfslWh73zgcNKY3tlMtRNNH7NzThPCbZAP?=
 =?us-ascii?Q?WnLiAgpUpwdaWCd5D7FF+4jQhec8sdAqzPT0VaqWrnZV0MRaJQjF7jdp5Q81?=
 =?us-ascii?Q?tam0e4yDfzoo5Aa76El3y8pIqWYTeYc7oZKyibjjxeFobbOsUT6MLTkl26zr?=
 =?us-ascii?Q?tl+xDMTm6Ye4vTn/ILKVKeZ08mfouPcO/0/YHhABidPWdP2/PpFs1MQlgRwR?=
 =?us-ascii?Q?CVcuSOzqCF66vKkco7bJKXMF4dQMtH3MqA+rf31/OpPPnuV+EsJB/cT/yMEI?=
 =?us-ascii?Q?/xrySb+dbQkmC0I3ADlliTeXls3Vg/446CnXYEvq15xgQ0tQ8CIqFA2ld2ER?=
 =?us-ascii?Q?Kt7QYCwFpZ+L1YiuXblzVzx1HqwDPJ8W7paI8PHn2yc8vNnB175wWBGo0EQn?=
 =?us-ascii?Q?QJ5tAP3r400TpK5yhCPi7iV1JX6zhOFS1dnrz8VsjFyMwrBXasqDukZqB58o?=
 =?us-ascii?Q?eQlp21FdUO80am1/G/x4uHPIAGubtshMdAtVzOKsBSA0P8ZJPgiV6+ddF62P?=
 =?us-ascii?Q?BvAAZPM/jUsffIOby/5SYwFuPPTtC6B+an3xvmlRbpQj4mtSVvtphfmnozbR?=
 =?us-ascii?Q?GYF2SzLctdJON6XiWI4JmVlnshg3ly7GfFk0ZntuWUVJcSGwPtdJIZXoBHru?=
 =?us-ascii?Q?o9PlNgB5pwurP9rhOUnXAOc5QOtZ3qvSSmswD3pwYvmPUIgDvigf3AgP2yI6?=
 =?us-ascii?Q?HAtv8RRuwk0A0+SpRVlMpmZg7kYrWS5Tm/3c409FFCPVnCHtzINe/fh6Fj2c?=
 =?us-ascii?Q?O/dJi3DaA1I6uRGnja2bfUXC8VTGhfOT7BiBoverkkfS+ecI3xAYVgsio0zH?=
 =?us-ascii?Q?TumM8RQXdJcMImf/fUyeJybFrZskHIehHk82XmaK/OV5QaXWM2lYp/TYOAQd?=
 =?us-ascii?Q?2Gi5m/7WTYxWGyrh3WpgDAAryAHqSmwXEUbKgrX032pAyUiAcy+68Ad42t2E?=
 =?us-ascii?Q?U2mCbnn6e6b8RSZBEFgOwPAsMpr53PCfSYbW5x3thv5nAfqxYme8TB+8aHz8?=
 =?us-ascii?Q?HemCwqN5irh9M6iyHH1bqM7n76KNLagYHUOuZrpf8fp0D4wxM3epL4wftXw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NHgdIf24jEKA2yJx1GhEM6Olo4fhy2u4vavwMFeveHHGwF1Mi8DnkJCTAqn3?=
 =?us-ascii?Q?l2SKvcARmmr5d4vEY9FGfTRm8Y68koLgl2YlkZxhsm0tGVLwlUv553WV98rY?=
 =?us-ascii?Q?rYMlH1hv14Pvk+NXSkjqdUfy9k3eFL58a0b1HS9rUjdtxv8JaavIJLDBiRNS?=
 =?us-ascii?Q?0ybcNkPYFt4HGByLdzbfSJBt1ncRf5ohwEJV7ZlsfH42p/NQVVQJqBtWMMUO?=
 =?us-ascii?Q?yA0XZXAPtNme5XDElOInhH/29iO/tyWo+NvX62T0yYfpdwzB0W8rtco/ndLA?=
 =?us-ascii?Q?fngMjhmhCQQAuQoriEnQ/FWyBfY/PPd/UqZeFobiIQ5FL1KodePSzugaiRbo?=
 =?us-ascii?Q?T4OSiJeWgQwqD1Q0juhjbbJnoBKGHw/njFLzg33fA/rcDs4rGn3fyBMbz2mG?=
 =?us-ascii?Q?/qmipD8dbg+fjFzK6Jgj+Y5IKWLzzZ4EuqkGdJpclSGOVn21ntOTAWwdTDf6?=
 =?us-ascii?Q?p3k+0NTLqI7SLPKWyFhqwZ4JHfzRTLemWQIuqItHRc0/zDnKi7HjzOkXM87x?=
 =?us-ascii?Q?TVAt5TDE0R3FOHOfeEK19Tc5ydmguMjKeLucGBgCvAfsk2DiSACdkKEiBHky?=
 =?us-ascii?Q?f2KPvbFUe4v5orr06QwiSaGAGyIT7Qh5nfINMebp/8ai9ZcNvcOZAHFEoSek?=
 =?us-ascii?Q?WEPi+vXA37dC3ZXeubTlzpHEH0eFWMyqaVPPshCa6oawmwX1Vbs6aPdX6imG?=
 =?us-ascii?Q?r/OamZFrHyKkptDBqEXlG/HVGvV2agQvQgj23eXI9KQiJEQhgENVjhz2VhlI?=
 =?us-ascii?Q?gKJxUY+zKn40X9hAYOXAhRlFZlTmIh55HMDF9yl4bpOEl3MF1OnZyKThuBvH?=
 =?us-ascii?Q?TxMIWbp4Ha0NcYECNWCUgMyxCuhKSnbC6/BNrq7clVrBLUNxRi29oUSvOB0Z?=
 =?us-ascii?Q?7p5bpo1FX8uFJIG49F4cIrWgDt/KPWGBRFoTcP3mQ9ad5lF6O1LUCe1L7bcO?=
 =?us-ascii?Q?sHpl0fei1UgxAv7/ujOlYxkCKnm34jeCb/Z8QYb3cpFoci6Lucc6JmLP8Jys?=
 =?us-ascii?Q?zmYb7dpwb8vNLQ4HIrF+iCEHCFahCAgzmmXAebsc52aoN/MAtZDEsXiRU2H1?=
 =?us-ascii?Q?OphDHwNP7xj7rFVpjQvXHHRvM1P8pr6Ip3/IZ4g03DYmvOb8CkYMvrZofQsF?=
 =?us-ascii?Q?NyjqvKtj/z6GqUiCBVb7z/VYZE+eUdX/5/xfC8NTYzBdsYZiCbNCyidsfmRm?=
 =?us-ascii?Q?IxFk6WTKAKjdLAHAPjIyyIixbZxE9S8LsvjLiZF+ZNX6ktu3HhMvMIKXgf40?=
 =?us-ascii?Q?W2f74cvDB6z/+r72GfxkT2qFW/SS5Jwtt6Zp4mhUtJ9alKIkI1AMn2p9QMDC?=
 =?us-ascii?Q?zH5ldjfs/iDy9FcQeAp2I4GXq1rDhWqFkzHsAz2lSpZKkzmfOViznX30jR43?=
 =?us-ascii?Q?TAMEcPMDpsuTNjlX4H2i9vppxv1YrVzK21OCPMX6kBRySOJvApjQzPG2n7sW?=
 =?us-ascii?Q?dQf76mAEn3fQYXPP/ysbZWE291U28+RbVwfe4kJqYuTpH97EV1kzkRsocyvA?=
 =?us-ascii?Q?oY3hmf2xDUXnJVBP1kyycj9bkfgUdGG9zTNgtFaJnYOGj8aIf608h/LJBCrb?=
 =?us-ascii?Q?hFYSZMqoBbZUpcru8DiWOItoRVpyq72daYGbMD6mgtRsAOgcyxLWJY9TQGZN?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c409221-61e9-43fe-fa8c-08dc6bb6010c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 21:14:22.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFtfZwOtDtkOvX1Wxw5BqkoYON222k6SKEZj5+0WQJkrC+Fxadgm8gP0cqgJ7U4OhJTLiSaXRZgTJfav9jVOyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
X-OriginatorOrg: intel.com

On Fri, May 03, 2024 at 02:04:15PM -0700, Easwar Hariharan wrote:
> On 5/3/2024 12:34 PM, Rodrigo Vivi wrote:
> > On Fri, May 03, 2024 at 06:13:24PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> >>
> >> Compile tested, no functionality changes intended
> >>
> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> >>
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > It looks like the ack is not needed since we are merging this through
> > drm-intel-next. But I'm planing to merge this only after seeing the
> > main drivers/i2c accepting the new terminology. So we don't have a
> > risk of that getting push back and new names there and we having
> > to rename it once again.
> 
> Just to be explicit, did you want me to remove the Acked-by in v3, or will you when you pull
> the patch into drm-intel-next?
> 
> > 
> > (more below)
> > 
> >> Acked-by: Zhi Wang <zhiwang@kernel.org>
> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > 
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > 
> > Jani, what bits were you concerned that were not necessarily i2c?
> > I believe although not necessarily/directly i2c, I believe they
> > are related and could benefit from the massive single shot renable.
> > or do you have any better split to suggest here?
> > 
> > (more below)
> > 
> >> ---
> >>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
> >>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
> >>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
> >>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
> >>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
> >>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
> >>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
> >>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
> >>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
> >>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
> >>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
> >>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
> >>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
> >>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
> >>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
> >>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
> >>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
> >>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
> >>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
> >>  19 files changed, 119 insertions(+), 119 deletions(-)
> >>
> 
> <snip>
> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> index c17462b4c2ac..64db211148a8 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> @@ -4332,7 +4332,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
> >>  									connector->tile_group->id);
> >>  
> >>  	/*
> >> -	 * EDP Transcoders cannot be ensalved
> >> +	 * EDP Transcoders cannot be slaves
> > 
> >                                      ^ here
> > perhaps you meant 'targeted' ?
> > 
> >>  	 * make them a master always when present
> 
> <snip>
> 
> This is not actually I2C related as far as I could tell when I was making the change, so this was more of a typo fix.
> 
> If we want to improve this, a quick check with the eDP v1.5a spec suggests using primary/secondary instead,
> though in a global fashion rather than specifically for eDP transcoders. There is also source/sink terminology
> in the spec related to DP encoders.
> 
> Which would be a more acceptable change here?

hmmm probably better to split the patches and align with the spec naming where it applies.
and with i2c name where it applies.

> 
> Thanks,
> Easwar

