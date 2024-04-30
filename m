Return-Path: <linux-i2c+bounces-3355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400CE8B8168
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 22:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D5341C22D20
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 20:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598561A0AF1;
	Tue, 30 Apr 2024 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oby60sj8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007FF50287;
	Tue, 30 Apr 2024 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714509009; cv=fail; b=Y1ILmTCEDvAMltXzZaSLr017kIH8TmG4Qzaiij2AzC4jxO3xLQEHEzX8plw37ioo8ZXdVkZAVm+EFeUGg4rUG1rLgv4QE8MKkmm8mLDJ7DVF61BazAGCcnJvUfhaK0+slQA5Vpe0psJEr1hYB9Qhol+6qhb+OOi1sFMhli/dHuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714509009; c=relaxed/simple;
	bh=mXGV28j84i793xgkvOVwB+5+vgM2oZ+ctBLs0pH9ZlA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WIuOge2R/Z2yTqu/LMEao+4t7ujwPD+XiDTiq747DL+7UIJNPJS7OeJUc0HTanXrjnOwHG/b6sPKm6brx/7fN83IvEL8uQTaweItDRJHMWPgjmqUWxlFyh4BgCj8h2/76ZVUhxoQXqbYFXAOVF78zcywqz5KEzn01nkxaBjpbBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oby60sj8; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714509006; x=1746045006;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mXGV28j84i793xgkvOVwB+5+vgM2oZ+ctBLs0pH9ZlA=;
  b=Oby60sj8StnK2LTxf7tJF8VUD5t68rTIiqM8X8rhGG3vFnOCuSXb/rx5
   V9D34cOZON7x1aYGTPyG+ORKzEZGXeGlbKWlQNicv34HhYCEpPg8PsElw
   9EHYxJ7WVQsVXL2hIHQmgk8JfV9XpM9u4AWXJWOBGVVVjCxO0hyq199pp
   mAtx6fvZxHEiOo1qJU2XF4nIr28ZbwiPNdpfLjp7XCxMsLfVWWwYGqwxe
   J9wRss10hXDmO6UEfhduVnRhqt7cXte1ua2dlXlH4pSsk0Lu4LrRTYSQx
   akPbwcwrmoFZBD2sAKeeRaln/YW52IxVkKnKHB7NNqqkJx1W9Wi4BZrdG
   Q==;
X-CSE-ConnectionGUID: wMvoSwanR7meT2j24zkFgg==
X-CSE-MsgGUID: CNx0bS/cQ/C6llXhNfdvXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20923544"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="20923544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 13:30:05 -0700
X-CSE-ConnectionGUID: 30cXLICfQkyTSZSCL0ewaA==
X-CSE-MsgGUID: 1OnEYnvjTSKMro+eKaIoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="26544757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 13:30:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 13:30:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 13:30:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 13:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqluM9cM/PYHySedZq9ton9xkSrfPOn9HLFYeDaXPwd28n1ZparKJrRlWQSzb5IMK1Lj85iaGvOm/sedaylUYYhk61/ZZcIZKiGvhtrVu0cmdBkwx8ITqDpcgx771mj2jxn2Y//svowNWZXJMldSoFCrnL7rJumYzITQCE1zBEVPtVAgG4fqB5Scdlv5nUUwqQS2pd439mUIFXwwksVrVQSaEKYjWhxb89XRlXh2nclq75JyiQOE73CNJBtjZi8G9h1IYIBJrMZc0aFlFxbkkOteSOn8HpObVWxKcFjxUQOQzndymMwNgnuFt57/5Qv0ag3Z5LqW+4o8wXEjooONWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yooT53qJDPc+vMHe/EC62HSVV2cUy83RtsOt5tUHACg=;
 b=NjJRDeKTG0PuQc8qVKDUpEv7H4wSyRsQzOKBq1Fu2HqiHnoNSIHbjf2htyOKNIpcZx6ZBb1prBS0qH1/3yRcQXkkig4bX8h6lJVYAnAqXlXMLoe5HJVpmvPdR86eFiHWDq4Y2aJoWsLaxX2wCEYWchQqX6WEVeXyaDLhIfd/hYRQ0/4qp7wK5LaOmcSSWP/j9VpmMwX1nwsWZim+CB/u2Xpu4OFpF5KtiJ1gul6ou6I20+uBTGBHmQCqtwqbCSnvEp++mOs6b0/ytyD0GHDKg0ud3vSqetSHD2yETzDNrZt/OCfB700lPdhtjw5D10yN9BRPpW039kLCvB+D8uaoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 20:30:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 20:30:01 +0000
Date: Tue, 30 Apr 2024 16:29:54 -0400
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
 LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 03/12] drm/i915: Make I2C terminology more inclusive
Message-ID: <ZjFUwjMFMcvJr5KI@intel.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-4-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430173812.1423757-4-eahariha@linux.microsoft.com>
X-ClientProxiedBy: MW4PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:303:dd::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb69a93-4c58-4881-945f-08dc69544f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A8MZmOoLDzFpJrMbm+j3JcsrN56l176OGPLQcBx3Q1U9OjGe+G2DjKvHpJnH?=
 =?us-ascii?Q?4NIdYbywfYRFrPoVIqMoWz6ZmBZT/w7T0eVgQkNE8f7uYD93a/Z5gLziQmOj?=
 =?us-ascii?Q?piU6ErtxXVr1ckwYcl3Ux0lGcGrupcQ27jSY3Q2464x6CsSrORtNdEPURn8l?=
 =?us-ascii?Q?EseQ23Xh2Bn2oZ0wkUvSTL1zIUijwbCPXEkBYEwILODXujjead7e3grdgLyk?=
 =?us-ascii?Q?hgVmONDnBWn2+Z/Vaxz7hS8ZBLOk6Ajeo1QeDV6u+WeRz/B7jt0e+YG9psuz?=
 =?us-ascii?Q?/7t0RSuSsTI9rjaW4NTnUurpf5lgyyGogKDcZ46ylp6wcsukRF/kpGVaSeGK?=
 =?us-ascii?Q?0DhYHTLOQZeFrQSfCwLsLaIyaPGB9t79/xWADJGJrIH+FE62bpdys3SI4q0w?=
 =?us-ascii?Q?7LztcZjm8wxml5ax09l5jXZl3SX3xwnv5FSgAmKMUXQvac4VBl2EiQvRNSZ2?=
 =?us-ascii?Q?8g0q7IdnvkN6Px0Gq4usbRCge4SMxM6142phV8ZvqtlOXmpxQR3QvWF7UILk?=
 =?us-ascii?Q?fmCClBNVYeBNtTXEHOQ4ZP7erLNqMV3HFHyQaFQaTsENJx0DRmteEe+ZD55y?=
 =?us-ascii?Q?yFAW6wTeML+0FrWdoi3n0MCQilgm2Th47Xfj5BEeD4PKd47xQpQl6er6A99J?=
 =?us-ascii?Q?eADnVBsE+3o9+AUENc3scZVxD4iJRk9RILO2Nc8SrqC6FHdOVhCWlIZ2sCzk?=
 =?us-ascii?Q?WozcpuLuZGPSV5u1m1JuJ3ZhWvl+r9PNA0f4ZX3YL3VCzElihAOFhboi0nGx?=
 =?us-ascii?Q?SHyq4iv9o9uRYMG3SgDou2eq4puV0VOOM1f34FZOETngy8eptN6jRuz4KfNv?=
 =?us-ascii?Q?v5iI3T4X1ZEVgTeIoJbHuraq2bR8q0kg7YRpBfxeHjZ8hJnbfhO5YjG1KxMv?=
 =?us-ascii?Q?JSU/HX28l7zg26ExOqOdqxADqYRFSxhKBw4r53sC1JV7QUVScaeFSNRVO0If?=
 =?us-ascii?Q?87NJno9BMDxIPlkozQvyEJvBxSFFtcd7RVYAHGzI7J8gt8xfoDnysr4ap+Ii?=
 =?us-ascii?Q?pZlN51kkaqJas5K2tx/w6N/sflo7zE2nzYMeqd6HA7ncSoZVhzgMxy99mT+7?=
 =?us-ascii?Q?bQPfsyTBULnZ5GpEEqswGTYGuOC7p1AROh+Fge3IUXvOyRV6l/yfUlMytZfT?=
 =?us-ascii?Q?x4SmYeAm5vxxrWd3mGXCNT5I4++2nZjj3LUfd6s89VCoNfnoEfUvU+qFatmX?=
 =?us-ascii?Q?a9+BbDOH9XhWKSMUN+3zQdMc0Lcf1aKx8wpurQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t8RKZ7BHdpC7/ZN1mF7qH1uKs1J28XAy9ahPEk2D2hfslxTAJAc5G1NufBxB?=
 =?us-ascii?Q?NxYoDSOVoByjzXA1penEW7ZK7ZAbsrayAiJOvYjqso2IGNw5WXFo/RSbXonU?=
 =?us-ascii?Q?u/F8CC2dK4Ze4pXehDaiPdnW2nBv2qXt0u/re+hbirBKW7ikgGh++AmglROL?=
 =?us-ascii?Q?pUPTW988oO3k//L4FhQvYQy3QABHsivIxZHrt3CWPKZd7Mm90xeKP0022PbK?=
 =?us-ascii?Q?iYNYA7BFJSG7WFvG3gIlTN6d6FJHMA0auRkjo61rQph23PrFFggv0EG/854I?=
 =?us-ascii?Q?MbC0BesJZccTSIelXr/PZv/y6UAoa4Y5X8Xd7gA+D9higuZ6U+yYm5fzyJ9L?=
 =?us-ascii?Q?OYVy4MOplb6EUL1WQuNWtK2WQUxZ5dQN9dhnOzbRRLMSAY6LVFAL9mNCEiQd?=
 =?us-ascii?Q?xHAIJ9CmfT1HgjzE9fKFr7D/b+yuWZRiSRCZrMSPxXFhDYd9cQDOeZxQ7Bj0?=
 =?us-ascii?Q?P27Nmg6v4I4YYZjeEHWDrZ1juyAj/PzO4eMiwWkXT/gzfrrmwX8w8ey6lsXq?=
 =?us-ascii?Q?tObJs0i1JR9RGj0nKNL9+R83GTQQ7t84o8s3XK5r2P5kdzH1ODZXLJvvoXNY?=
 =?us-ascii?Q?enbIXTgPo3+kodKzhTd2veqU5rz10TtxJnEuDXPzhKRsT7NC/y63lE9MNasK?=
 =?us-ascii?Q?PlbbygwTmQ0DS2tA9J2gX+HTan1/jqierIHZtu0jnRIzcdAt4qwm0xEY+CcE?=
 =?us-ascii?Q?lYFgMBivg2LqQWg0iKN/bVeaHuzQqHhyj4m/j6+/OmWMyqjrWXkl0RoN++Yc?=
 =?us-ascii?Q?Lmd4TWlxVlq1z0Sw7SkdBBACPY5/KTZ8/jAPKwOxUJcjaYNno92dJJEYaRM3?=
 =?us-ascii?Q?iaKDYuaQpolTYI2UwTlYP03a6LPruVl2p0E6IlXSKSFbYpUjyWSkQwL7Qysk?=
 =?us-ascii?Q?n8KzUYHUvviqNie7WDV+ERYTXxsqOu1joPAQw8Wb5a4otMVXIrDv/0dLjQle?=
 =?us-ascii?Q?Yyootm1xDPx86ubLBolA82rhQjthptWSy5qYmJ72fHWKdul2LXj8KR0aDEgy?=
 =?us-ascii?Q?cnCWpXQb7U8j20znpCZFl5w3QB/STr4pvRlZP7WeL2++wq6TfK6HqSygH/Tl?=
 =?us-ascii?Q?Kg52JC0J88CiHPwQcTqB6KQc0AZX2hYtsgtAjgLYsPLw1SeuTiKO6xo8467F?=
 =?us-ascii?Q?oHSs7+6h/QMnMccgQmczXNbgmWPx7GHwE/gUEUmosdToUoKwawqIRcN9nR5x?=
 =?us-ascii?Q?8vzdvLlrdYxSbEYnXIj3VBiRQ73DISQrjT04nFVeA3xcV4eupj2ED0f4aLNB?=
 =?us-ascii?Q?LOa2qRaeTKNdnOq/28zC8GxqURX9UQyto37+ETNLnOrnxWbaL1Nl7N2dh5sM?=
 =?us-ascii?Q?6COEfHy0fNxTsZXWo9ni1J1REgQWlg4FrgNPSl0gGoUpcfxWaEQEvDHhP61u?=
 =?us-ascii?Q?+8xuZcvb9gkTcSoOfHbykUFlEwREDsmZrDMAIqfdFl+Fl3HxthMWXaCzMuIk?=
 =?us-ascii?Q?vJy9M6mZnuTMs99hUzIrK24eIXYvVnLH7wyTeUUazYmaItwY8LIZNj9xzpph?=
 =?us-ascii?Q?yrntxrG+DWR7311QvW3A3w5i1VS4HbIAoOLy9nj+g8DZUnq/9biIZuHnaqPB?=
 =?us-ascii?Q?GMthXt7ocFBl40puVSLKuvQhjRKJg3wIaMGOU99+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb69a93-4c58-4881-945f-08dc69544f4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 20:30:01.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+7I4V4N7exUvuwSi434gInnARjIxshchJ1PbZo9ZqUnVk8jvVDNDBn5UFwkfFB8qsOY8xpKhcPoD6n0fQ6xXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-OriginatorOrg: intel.com

On Tue, Apr 30, 2024 at 05:38:02PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

I'm glad to see this change!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
>  19 files changed, 119 insertions(+), 119 deletions(-)

The chances of conflicts are high with this many changes,
but should be easy enough to deal with later, so feel free
to move with this i915 patch on any other tree and we catch-up
later.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/display/dvo_ch7017.c b/drivers/gpu/drm/i915/display/dvo_ch7017.c
> index d0c3880d7f80..493e730c685b 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ch7017.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ch7017.c
> @@ -170,13 +170,13 @@ static bool ch7017_read(struct intel_dvo_device *dvo, u8 addr, u8 *val)
>  {
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = 0,
>  			.len = 1,
>  			.buf = &addr,
>  		},
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 1,
>  			.buf = val,
> @@ -189,7 +189,7 @@ static bool ch7017_write(struct intel_dvo_device *dvo, u8 addr, u8 val)
>  {
>  	u8 buf[2] = { addr, val };
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 2,
>  		.buf = buf,
> @@ -197,7 +197,7 @@ static bool ch7017_write(struct intel_dvo_device *dvo, u8 addr, u8 val)
>  	return i2c_transfer(dvo->i2c_bus, &msg, 1) == 1;
>  }
>  
> -/** Probes for a CH7017 on the given bus and slave address. */
> +/** Probes for a CH7017 on the given bus and target address. */
>  static bool ch7017_init(struct intel_dvo_device *dvo,
>  			struct i2c_adapter *adapter)
>  {
> @@ -227,13 +227,13 @@ static bool ch7017_init(struct intel_dvo_device *dvo,
>  		break;
>  	default:
>  		DRM_DEBUG_KMS("ch701x not detected, got %d: from %s "
> -			      "slave %d.\n",
> -			      val, adapter->name, dvo->slave_addr);
> +			      "target %d.\n",
> +			      val, adapter->name, dvo->target_addr);
>  		goto fail;
>  	}
>  
>  	DRM_DEBUG_KMS("%s detected on %s, addr %d\n",
> -		      str, adapter->name, dvo->slave_addr);
> +		      str, adapter->name, dvo->target_addr);
>  	return true;
>  
>  fail:
> diff --git a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> index 2e8e85da5a40..534b8544e0a4 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
> @@ -153,13 +153,13 @@ static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = 0,
>  			.len = 1,
>  			.buf = out_buf,
>  		},
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 1,
>  			.buf = in_buf,
> @@ -176,7 +176,7 @@ static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	if (!ch7xxx->quiet) {
>  		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  	return false;
>  }
> @@ -188,7 +188,7 @@ static bool ch7xxx_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  	struct i2c_adapter *adapter = dvo->i2c_bus;
>  	u8 out_buf[2];
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 2,
>  		.buf = out_buf,
> @@ -202,7 +202,7 @@ static bool ch7xxx_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  
>  	if (!ch7xxx->quiet) {
>  		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
> @@ -229,8 +229,8 @@ static bool ch7xxx_init(struct intel_dvo_device *dvo,
>  
>  	name = ch7xxx_get_id(vendor);
>  	if (!name) {
> -		DRM_DEBUG_KMS("ch7xxx not detected; got VID 0x%02x from %s slave %d.\n",
> -			      vendor, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("ch7xxx not detected; got VID 0x%02x from %s target %d.\n",
> +			      vendor, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  
> @@ -240,8 +240,8 @@ static bool ch7xxx_init(struct intel_dvo_device *dvo,
>  
>  	devid = ch7xxx_get_did(device);
>  	if (!devid) {
> -		DRM_DEBUG_KMS("ch7xxx not detected; got DID 0x%02x from %s slave %d.\n",
> -			      device, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("ch7xxx not detected; got DID 0x%02x from %s target %d.\n",
> +			      device, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/dvo_ivch.c b/drivers/gpu/drm/i915/display/dvo_ivch.c
> index eef72bb3b767..0d5cce6051b1 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ivch.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ivch.c
> @@ -198,7 +198,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
>  
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 0,
>  		},
> @@ -209,7 +209,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
>  			.buf = out_buf,
>  		},
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD | I2C_M_NOSTART,
>  			.len = 2,
>  			.buf = in_buf,
> @@ -226,7 +226,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
>  	if (!priv->quiet) {
>  		DRM_DEBUG_KMS("Unable to read register 0x%02x from "
>  				"%s:%02x.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  	return false;
>  }
> @@ -238,7 +238,7 @@ static bool ivch_write(struct intel_dvo_device *dvo, int addr, u16 data)
>  	struct i2c_adapter *adapter = dvo->i2c_bus;
>  	u8 out_buf[3];
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 3,
>  		.buf = out_buf,
> @@ -253,13 +253,13 @@ static bool ivch_write(struct intel_dvo_device *dvo, int addr, u16 data)
>  
>  	if (!priv->quiet) {
>  		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
>  }
>  
> -/* Probes the given bus and slave address for an ivch */
> +/* Probes the given bus and target address for an ivch */
>  static bool ivch_init(struct intel_dvo_device *dvo,
>  		      struct i2c_adapter *adapter)
>  {
> @@ -283,10 +283,10 @@ static bool ivch_init(struct intel_dvo_device *dvo,
>  	 * very unique, check that the value in the base address field matches
>  	 * the address it's responding on.
>  	 */
> -	if ((temp & VR00_BASE_ADDRESS_MASK) != dvo->slave_addr) {
> +	if ((temp & VR00_BASE_ADDRESS_MASK) != dvo->target_addr) {
>  		DRM_DEBUG_KMS("ivch detect failed due to address mismatch "
>  			  "(%d vs %d)\n",
> -			  (temp & VR00_BASE_ADDRESS_MASK), dvo->slave_addr);
> +			  (temp & VR00_BASE_ADDRESS_MASK), dvo->target_addr);
>  		goto out;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/dvo_ns2501.c b/drivers/gpu/drm/i915/display/dvo_ns2501.c
> index 1df212fb000e..43fc0374fc7f 100644
> --- a/drivers/gpu/drm/i915/display/dvo_ns2501.c
> +++ b/drivers/gpu/drm/i915/display/dvo_ns2501.c
> @@ -399,13 +399,13 @@ static bool ns2501_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	struct i2c_msg msgs[] = {
>  		{
> -		 .addr = dvo->slave_addr,
> +		 .addr = dvo->target_addr,
>  		 .flags = 0,
>  		 .len = 1,
>  		 .buf = out_buf,
>  		 },
>  		{
> -		 .addr = dvo->slave_addr,
> +		 .addr = dvo->target_addr,
>  		 .flags = I2C_M_RD,
>  		 .len = 1,
>  		 .buf = in_buf,
> @@ -423,7 +423,7 @@ static bool ns2501_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  	if (!ns->quiet) {
>  		DRM_DEBUG_KMS
>  		    ("Unable to read register 0x%02x from %s:0x%02x.\n", addr,
> -		     adapter->name, dvo->slave_addr);
> +		     adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
> @@ -442,7 +442,7 @@ static bool ns2501_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  	u8 out_buf[2];
>  
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 2,
>  		.buf = out_buf,
> @@ -457,7 +457,7 @@ static bool ns2501_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  
>  	if (!ns->quiet) {
>  		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d\n",
> -			      addr, adapter->name, dvo->slave_addr);
> +			      addr, adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
> @@ -488,8 +488,8 @@ static bool ns2501_init(struct intel_dvo_device *dvo,
>  		goto out;
>  
>  	if (ch != (NS2501_VID & 0xff)) {
> -		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Slave %d.\n",
> -			      ch, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Target %d.\n",
> +			      ch, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  
> @@ -497,8 +497,8 @@ static bool ns2501_init(struct intel_dvo_device *dvo,
>  		goto out;
>  
>  	if (ch != (NS2501_DID & 0xff)) {
> -		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Slave %d.\n",
> -			      ch, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Target %d.\n",
> +			      ch, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  	ns->quiet = false;
> diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/drm/i915/display/dvo_sil164.c
> index 6c461024c8e3..a8dd40c00997 100644
> --- a/drivers/gpu/drm/i915/display/dvo_sil164.c
> +++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
> @@ -79,13 +79,13 @@ static bool sil164_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = 0,
>  			.len = 1,
>  			.buf = out_buf,
>  		},
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 1,
>  			.buf = in_buf,
> @@ -102,7 +102,7 @@ static bool sil164_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	if (!sil->quiet) {
>  		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  	return false;
>  }
> @@ -113,7 +113,7 @@ static bool sil164_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  	struct i2c_adapter *adapter = dvo->i2c_bus;
>  	u8 out_buf[2];
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 2,
>  		.buf = out_buf,
> @@ -127,7 +127,7 @@ static bool sil164_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  
>  	if (!sil->quiet) {
>  		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
> @@ -153,8 +153,8 @@ static bool sil164_init(struct intel_dvo_device *dvo,
>  		goto out;
>  
>  	if (ch != (SIL164_VID & 0xff)) {
> -		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Slave %d.\n",
> -			  ch, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Target %d.\n",
> +			  ch, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  
> @@ -162,8 +162,8 @@ static bool sil164_init(struct intel_dvo_device *dvo,
>  		goto out;
>  
>  	if (ch != (SIL164_DID & 0xff)) {
> -		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Slave %d.\n",
> -			  ch, adapter->name, dvo->slave_addr);
> +		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Target %d.\n",
> +			  ch, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  	sil->quiet = false;
> diff --git a/drivers/gpu/drm/i915/display/dvo_tfp410.c b/drivers/gpu/drm/i915/display/dvo_tfp410.c
> index 0939e097f4f9..d9a0cd753a87 100644
> --- a/drivers/gpu/drm/i915/display/dvo_tfp410.c
> +++ b/drivers/gpu/drm/i915/display/dvo_tfp410.c
> @@ -100,13 +100,13 @@ static bool tfp410_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = 0,
>  			.len = 1,
>  			.buf = out_buf,
>  		},
>  		{
> -			.addr = dvo->slave_addr,
> +			.addr = dvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 1,
>  			.buf = in_buf,
> @@ -123,7 +123,7 @@ static bool tfp410_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
>  
>  	if (!tfp->quiet) {
>  		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  	return false;
>  }
> @@ -134,7 +134,7 @@ static bool tfp410_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  	struct i2c_adapter *adapter = dvo->i2c_bus;
>  	u8 out_buf[2];
>  	struct i2c_msg msg = {
> -		.addr = dvo->slave_addr,
> +		.addr = dvo->target_addr,
>  		.flags = 0,
>  		.len = 2,
>  		.buf = out_buf,
> @@ -148,7 +148,7 @@ static bool tfp410_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
>  
>  	if (!tfp->quiet) {
>  		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
> -			  addr, adapter->name, dvo->slave_addr);
> +			  addr, adapter->name, dvo->target_addr);
>  	}
>  
>  	return false;
> @@ -183,15 +183,15 @@ static bool tfp410_init(struct intel_dvo_device *dvo,
>  
>  	if ((id = tfp410_getid(dvo, TFP410_VID_LO)) != TFP410_VID) {
>  		DRM_DEBUG_KMS("tfp410 not detected got VID %X: from %s "
> -				"Slave %d.\n",
> -			  id, adapter->name, dvo->slave_addr);
> +				"Target %d.\n",
> +			  id, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  
>  	if ((id = tfp410_getid(dvo, TFP410_DID_LO)) != TFP410_DID) {
>  		DRM_DEBUG_KMS("tfp410 not detected got DID %X: from %s "
> -				"Slave %d.\n",
> -			  id, adapter->name, dvo->slave_addr);
> +				"Target %d.\n",
> +			  id, adapter->name, dvo->target_addr);
>  		goto out;
>  	}
>  	tfp->quiet = false;
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index fe52c06271ef..35f48fbd9e3e 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -69,8 +69,8 @@ struct intel_bios_encoder_data {
>  	struct list_head node;
>  };
>  
> -#define	SLAVE_ADDR1	0x70
> -#define	SLAVE_ADDR2	0x72
> +#define	TARGET_ADDR1	0x70
> +#define	TARGET_ADDR2	0x72
>  
>  /* Get BDB block size given a pointer to Block ID. */
>  static u32 _get_blocksize(const u8 *block_base)
> @@ -1231,10 +1231,10 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
>  		const struct child_device_config *child = &devdata->child;
>  		struct sdvo_device_mapping *mapping;
>  
> -		if (child->slave_addr != SLAVE_ADDR1 &&
> -		    child->slave_addr != SLAVE_ADDR2) {
> +		if (child->target_addr != TARGET_ADDR1 &&
> +		    child->target_addr != TARGET_ADDR2) {
>  			/*
> -			 * If the slave address is neither 0x70 nor 0x72,
> +			 * If the target address is neither 0x70 nor 0x72,
>  			 * it is not a SDVO device. Skip it.
>  			 */
>  			continue;
> @@ -1247,22 +1247,22 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
>  			continue;
>  		}
>  		drm_dbg_kms(&i915->drm,
> -			    "the SDVO device with slave addr %2x is found on"
> +			    "the SDVO device with target addr %2x is found on"
>  			    " %s port\n",
> -			    child->slave_addr,
> +			    child->target_addr,
>  			    (child->dvo_port == DEVICE_PORT_DVOB) ?
>  			    "SDVOB" : "SDVOC");
>  		mapping = &i915->display.vbt.sdvo_mappings[child->dvo_port - 1];
>  		if (!mapping->initialized) {
>  			mapping->dvo_port = child->dvo_port;
> -			mapping->slave_addr = child->slave_addr;
> +			mapping->target_addr = child->target_addr;
>  			mapping->dvo_wiring = child->dvo_wiring;
>  			mapping->ddc_pin = child->ddc_pin;
>  			mapping->i2c_pin = child->i2c_pin;
>  			mapping->initialized = 1;
>  			drm_dbg_kms(&i915->drm,
>  				    "SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
> -				    mapping->dvo_port, mapping->slave_addr,
> +				    mapping->dvo_port, mapping->target_addr,
>  				    mapping->dvo_wiring, mapping->ddc_pin,
>  				    mapping->i2c_pin);
>  		} else {
> @@ -1270,11 +1270,11 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
>  				    "Maybe one SDVO port is shared by "
>  				    "two SDVO device.\n");
>  		}
> -		if (child->slave2_addr) {
> +		if (child->target2_addr) {
>  			/* Maybe this is a SDVO device with multiple inputs */
>  			/* And the mapping info is not added */
>  			drm_dbg_kms(&i915->drm,
> -				    "there exists the slave2_addr. Maybe this"
> +				    "there exists the target2_addr. Maybe this"
>  				    " is a SDVO device with multiple inputs.\n");
>  		}
>  		count++;
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index c587a8efeafc..c408daee412a 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4327,7 +4327,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
>  									connector->tile_group->id);
>  
>  	/*
> -	 * EDP Transcoders cannot be ensalved
> +	 * EDP Transcoders cannot be slaves
>  	 * make them a master always when present
>  	 */
>  	if (port_sync_transcoders & BIT(TRANSCODER_EDP))
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index 2167dbee5eea..5bfc91f0b563 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -236,7 +236,7 @@ struct intel_vbt_data {
>  	struct sdvo_device_mapping {
>  		u8 initialized;
>  		u8 dvo_port;
> -		u8 slave_addr;
> +		u8 target_addr;
>  		u8 dvo_wiring;
>  		u8 i2c_pin;
>  		u8 ddc_pin;
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> index e99c94edfaae..e8ba4ccd99d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -66,7 +66,7 @@ struct intel_dsi {
>  	/* number of DSI lanes */
>  	unsigned int lane_count;
>  
> -	/* i2c bus associated with the slave device */
> +	/* i2c bus associated with the target device */
>  	int i2c_bus_num;
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index a5d7fc8418c9..fb0b02e30c8b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -56,7 +56,7 @@
>  #define MIPI_PORT_SHIFT			3
>  
>  struct i2c_adapter_lookup {
> -	u16 slave_addr;
> +	u16 target_addr;
>  	struct intel_dsi *intel_dsi;
>  	acpi_handle dev_handle;
>  };
> @@ -443,7 +443,7 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
>  	if (!i2c_acpi_get_i2c_resource(ares, &sb))
>  		return 1;
>  
> -	if (lookup->slave_addr != sb->slave_address)
> +	if (lookup->target_addr != sb->slave_address)
>  		return 1;
>  
>  	status = acpi_get_handle(lookup->dev_handle,
> @@ -460,12 +460,12 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
>  }
>  
>  static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
> -				  const u16 slave_addr)
> +				  const u16 target_addr)
>  {
>  	struct drm_device *drm_dev = intel_dsi->base.base.dev;
>  	struct acpi_device *adev = ACPI_COMPANION(drm_dev->dev);
>  	struct i2c_adapter_lookup lookup = {
> -		.slave_addr = slave_addr,
> +		.target_addr = target_addr,
>  		.intel_dsi = intel_dsi,
>  		.dev_handle = acpi_device_handle(adev),
>  	};
> @@ -476,7 +476,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
>  }
>  #else
>  static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
> -					 const u16 slave_addr)
> +					 const u16 target_addr)
>  {
>  }
>  #endif
> @@ -488,17 +488,17 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
>  	struct i2c_msg msg;
>  	int ret;
>  	u8 vbt_i2c_bus_num = *(data + 2);
> -	u16 slave_addr = *(u16 *)(data + 3);
> +	u16 target_addr = *(u16 *)(data + 3);
>  	u8 reg_offset = *(data + 5);
>  	u8 payload_size = *(data + 6);
>  	u8 *payload_data;
>  
> -	drm_dbg_kms(&i915->drm, "bus %d client-addr 0x%02x reg 0x%02x data %*ph\n",
> -		    vbt_i2c_bus_num, slave_addr, reg_offset, payload_size, data + 7);
> +	drm_dbg_kms(&i915->drm, "bus %d target-addr 0x%02x reg 0x%02x data %*ph\n",
> +		    vbt_i2c_bus_num, target_addr, reg_offset, payload_size, data + 7);
>  
>  	if (intel_dsi->i2c_bus_num < 0) {
>  		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
> -		i2c_acpi_find_adapter(intel_dsi, slave_addr);
> +		i2c_acpi_find_adapter(intel_dsi, target_addr);
>  	}
>  
>  	adapter = i2c_get_adapter(intel_dsi->i2c_bus_num);
> @@ -514,7 +514,7 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
>  	payload_data[0] = reg_offset;
>  	memcpy(&payload_data[1], (data + 7), payload_size);
>  
> -	msg.addr = slave_addr;
> +	msg.addr = target_addr;
>  	msg.flags = 0;
>  	msg.len = payload_size + 1;
>  	msg.buf = payload_data;
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
> index c076da75b066..8d4c8f33f776 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_dvo.c
> @@ -60,42 +60,42 @@ static const struct intel_dvo_device intel_dvo_devices[] = {
>  		.type = INTEL_DVO_CHIP_TMDS,
>  		.name = "sil164",
>  		.port = PORT_C,
> -		.slave_addr = SIL164_ADDR,
> +		.target_addr = SIL164_ADDR,
>  		.dev_ops = &sil164_ops,
>  	},
>  	{
>  		.type = INTEL_DVO_CHIP_TMDS,
>  		.name = "ch7xxx",
>  		.port = PORT_C,
> -		.slave_addr = CH7xxx_ADDR,
> +		.target_addr = CH7xxx_ADDR,
>  		.dev_ops = &ch7xxx_ops,
>  	},
>  	{
>  		.type = INTEL_DVO_CHIP_TMDS,
>  		.name = "ch7xxx",
>  		.port = PORT_C,
> -		.slave_addr = 0x75, /* For some ch7010 */
> +		.target_addr = 0x75, /* For some ch7010 */
>  		.dev_ops = &ch7xxx_ops,
>  	},
>  	{
>  		.type = INTEL_DVO_CHIP_LVDS,
>  		.name = "ivch",
>  		.port = PORT_A,
> -		.slave_addr = 0x02, /* Might also be 0x44, 0x84, 0xc4 */
> +		.target_addr = 0x02, /* Might also be 0x44, 0x84, 0xc4 */
>  		.dev_ops = &ivch_ops,
>  	},
>  	{
>  		.type = INTEL_DVO_CHIP_TMDS,
>  		.name = "tfp410",
>  		.port = PORT_C,
> -		.slave_addr = TFP410_ADDR,
> +		.target_addr = TFP410_ADDR,
>  		.dev_ops = &tfp410_ops,
>  	},
>  	{
>  		.type = INTEL_DVO_CHIP_LVDS,
>  		.name = "ch7017",
>  		.port = PORT_C,
> -		.slave_addr = 0x75,
> +		.target_addr = 0x75,
>  		.gpio = GMBUS_PIN_DPB,
>  		.dev_ops = &ch7017_ops,
>  	},
> @@ -103,7 +103,7 @@ static const struct intel_dvo_device intel_dvo_devices[] = {
>  		.type = INTEL_DVO_CHIP_LVDS_NO_FIXED,
>  		.name = "ns2501",
>  		.port = PORT_B,
> -		.slave_addr = NS2501_ADDR,
> +		.target_addr = NS2501_ADDR,
>  		.dev_ops = &ns2501_ops,
>  	},
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> index af7b04539b93..4bf476656b8c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> @@ -38,7 +38,7 @@ struct intel_dvo_device {
>  	enum port port;
>  	/* GPIO register used for i2c bus to control this device */
>  	u32 gpio;
> -	int slave_addr;
> +	int target_addr;
>  
>  	const struct intel_dvo_dev_ops *dev_ops;
>  	void *dev_priv;
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index d3e03ed5b79c..fe9a3c1f0072 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -478,7 +478,7 @@ gmbus_xfer_read_chunk(struct drm_i915_private *i915,
>  /*
>   * HW spec says that 512Bytes in Burst read need special treatment.
>   * But it doesn't talk about other multiple of 256Bytes. And couldn't locate
> - * an I2C slave, which supports such a lengthy burst read too for experiments.
> + * an I2C target, which supports such a lengthy burst read too for experiments.
>   *
>   * So until things get clarified on HW support, to avoid the burst read length
>   * in fold of 256Bytes except 512, max burst read length is fixed at 767Bytes.
> @@ -701,7 +701,7 @@ do_gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num,
>  
>  	/* Toggle the Software Clear Interrupt bit. This has the effect
>  	 * of resetting the GMBUS controller and so clearing the
> -	 * BUS_ERROR raised by the slave's NAK.
> +	 * BUS_ERROR raised by the target's NAK.
>  	 */
>  	intel_de_write_fw(i915, GMBUS1(i915), GMBUS_SW_CLR_INT);
>  	intel_de_write_fw(i915, GMBUS1(i915), 0);
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 5f9e748adc89..87052bd1c554 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -95,7 +95,7 @@ struct intel_sdvo {
>  	struct intel_encoder base;
>  
>  	struct i2c_adapter *i2c;
> -	u8 slave_addr;
> +	u8 target_addr;
>  
>  	struct intel_sdvo_ddc ddc[3];
>  
> @@ -255,13 +255,13 @@ static bool intel_sdvo_read_byte(struct intel_sdvo *intel_sdvo, u8 addr, u8 *ch)
>  	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.dev);
>  	struct i2c_msg msgs[] = {
>  		{
> -			.addr = intel_sdvo->slave_addr,
> +			.addr = intel_sdvo->target_addr,
>  			.flags = 0,
>  			.len = 1,
>  			.buf = &addr,
>  		},
>  		{
> -			.addr = intel_sdvo->slave_addr,
> +			.addr = intel_sdvo->target_addr,
>  			.flags = I2C_M_RD,
>  			.len = 1,
>  			.buf = ch,
> @@ -483,14 +483,14 @@ static bool __intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
>  	intel_sdvo_debug_write(intel_sdvo, cmd, args, args_len);
>  
>  	for (i = 0; i < args_len; i++) {
> -		msgs[i].addr = intel_sdvo->slave_addr;
> +		msgs[i].addr = intel_sdvo->target_addr;
>  		msgs[i].flags = 0;
>  		msgs[i].len = 2;
>  		msgs[i].buf = buf + 2 *i;
>  		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
>  		buf[2*i + 1] = ((u8*)args)[i];
>  	}
> -	msgs[i].addr = intel_sdvo->slave_addr;
> +	msgs[i].addr = intel_sdvo->target_addr;
>  	msgs[i].flags = 0;
>  	msgs[i].len = 2;
>  	msgs[i].buf = buf + 2*i;
> @@ -499,12 +499,12 @@ static bool __intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
>  
>  	/* the following two are to read the response */
>  	status = SDVO_I2C_CMD_STATUS;
> -	msgs[i+1].addr = intel_sdvo->slave_addr;
> +	msgs[i+1].addr = intel_sdvo->target_addr;
>  	msgs[i+1].flags = 0;
>  	msgs[i+1].len = 1;
>  	msgs[i+1].buf = &status;
>  
> -	msgs[i+2].addr = intel_sdvo->slave_addr;
> +	msgs[i+2].addr = intel_sdvo->target_addr;
>  	msgs[i+2].flags = I2C_M_RD;
>  	msgs[i+2].len = 1;
>  	msgs[i+2].buf = &status;
> @@ -2659,9 +2659,9 @@ intel_sdvo_select_i2c_bus(struct intel_sdvo *sdvo)
>  	else
>  		pin = GMBUS_PIN_DPB;
>  
> -	drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s] I2C pin %d, slave addr 0x%x\n",
> +	drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s] I2C pin %d, target addr 0x%x\n",
>  		    sdvo->base.base.base.id, sdvo->base.base.name,
> -		    pin, sdvo->slave_addr);
> +		    pin, sdvo->target_addr);
>  
>  	sdvo->i2c = intel_gmbus_get_adapter(dev_priv, pin);
>  
> @@ -2687,7 +2687,7 @@ intel_sdvo_is_hdmi_connector(struct intel_sdvo *intel_sdvo)
>  }
>  
>  static u8
> -intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
> +intel_sdvo_get_target_addr(struct intel_sdvo *sdvo)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(sdvo->base.base.dev);
>  	const struct sdvo_device_mapping *my_mapping, *other_mapping;
> @@ -2701,15 +2701,15 @@ intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
>  	}
>  
>  	/* If the BIOS described our SDVO device, take advantage of it. */
> -	if (my_mapping->slave_addr)
> -		return my_mapping->slave_addr;
> +	if (my_mapping->target_addr)
> +		return my_mapping->target_addr;
>  
>  	/*
>  	 * If the BIOS only described a different SDVO device, use the
>  	 * address that it isn't using.
>  	 */
> -	if (other_mapping->slave_addr) {
> -		if (other_mapping->slave_addr == 0x70)
> +	if (other_mapping->target_addr) {
> +		if (other_mapping->target_addr == 0x70)
>  			return 0x72;
>  		else
>  			return 0x70;
> @@ -3412,7 +3412,7 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
>  			 "SDVO %c", port_name(port));
>  
>  	intel_sdvo->sdvo_reg = sdvo_reg;
> -	intel_sdvo->slave_addr = intel_sdvo_get_slave_addr(intel_sdvo) >> 1;
> +	intel_sdvo->target_addr = intel_sdvo_get_target_addr(intel_sdvo) >> 1;
>  
>  	intel_sdvo_select_i2c_bus(intel_sdvo);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> index a9f44abfc9fc..c0d5aae980a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -432,7 +432,7 @@ struct child_device_config {
>  	u16 addin_offset;
>  	u8 dvo_port; /* See DEVICE_PORT_* and DVO_PORT_* above */
>  	u8 i2c_pin;
> -	u8 slave_addr;
> +	u8 target_addr;
>  	u8 ddc_pin;
>  	u16 edid_ptr;
>  	u8 dvo_cfg; /* See DEVICE_CFG_* above */
> @@ -441,7 +441,7 @@ struct child_device_config {
>  		struct {
>  			u8 dvo2_port;
>  			u8 i2c2_pin;
> -			u8 slave2_addr;
> +			u8 target2_addr;
>  			u8 ddc2_pin;
>  		} __packed;
>  		struct {
> diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
> index af9afdb53c7f..c022dc736045 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.c
> +++ b/drivers/gpu/drm/i915/gvt/edid.c
> @@ -42,8 +42,8 @@
>  #define GMBUS1_TOTAL_BYTES_MASK 0x1ff
>  #define gmbus1_total_byte_count(v) (((v) >> \
>  	GMBUS1_TOTAL_BYTES_SHIFT) & GMBUS1_TOTAL_BYTES_MASK)
> -#define gmbus1_slave_addr(v) (((v) & 0xff) >> 1)
> -#define gmbus1_slave_index(v) (((v) >> 8) & 0xff)
> +#define gmbus1_target_addr(v) (((v) & 0xff) >> 1)
> +#define gmbus1_target_index(v) (((v) >> 8) & 0xff)
>  #define gmbus1_bus_cycle(v) (((v) >> 25) & 0x7)
>  
>  /* GMBUS0 bits definitions */
> @@ -54,7 +54,7 @@ static unsigned char edid_get_byte(struct intel_vgpu *vgpu)
>  	struct intel_vgpu_i2c_edid *edid = &vgpu->display.i2c_edid;
>  	unsigned char chr = 0;
>  
> -	if (edid->state == I2C_NOT_SPECIFIED || !edid->slave_selected) {
> +	if (edid->state == I2C_NOT_SPECIFIED || !edid->target_selected) {
>  		gvt_vgpu_err("Driver tries to read EDID without proper sequence!\n");
>  		return 0;
>  	}
> @@ -179,7 +179,7 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
>  		void *p_data, unsigned int bytes)
>  {
>  	struct intel_vgpu_i2c_edid *i2c_edid = &vgpu->display.i2c_edid;
> -	u32 slave_addr;
> +	u32 target_addr;
>  	u32 wvalue = *(u32 *)p_data;
>  
>  	if (vgpu_vreg(vgpu, offset) & GMBUS_SW_CLR_INT) {
> @@ -210,21 +210,21 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
>  
>  		i2c_edid->gmbus.total_byte_count =
>  			gmbus1_total_byte_count(wvalue);
> -		slave_addr = gmbus1_slave_addr(wvalue);
> +		target_addr = gmbus1_target_addr(wvalue);
>  
>  		/* vgpu gmbus only support EDID */
> -		if (slave_addr == EDID_ADDR) {
> -			i2c_edid->slave_selected = true;
> -		} else if (slave_addr != 0) {
> +		if (target_addr == EDID_ADDR) {
> +			i2c_edid->target_selected = true;
> +		} else if (target_addr != 0) {
>  			gvt_dbg_dpy(
> -				"vgpu%d: unsupported gmbus slave addr(0x%x)\n"
> +				"vgpu%d: unsupported gmbus target addr(0x%x)\n"
>  				"	gmbus operations will be ignored.\n",
> -					vgpu->id, slave_addr);
> +					vgpu->id, target_addr);
>  		}
>  
>  		if (wvalue & GMBUS_CYCLE_INDEX)
>  			i2c_edid->current_edid_read =
> -				gmbus1_slave_index(wvalue);
> +				gmbus1_target_index(wvalue);
>  
>  		i2c_edid->gmbus.cycle_type = gmbus1_bus_cycle(wvalue);
>  		switch (gmbus1_bus_cycle(wvalue)) {
> @@ -523,7 +523,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
>  			} else if (addr == EDID_ADDR) {
>  				i2c_edid->state = I2C_AUX_CH;
>  				i2c_edid->port = port_idx;
> -				i2c_edid->slave_selected = true;
> +				i2c_edid->target_selected = true;
>  				if (intel_vgpu_has_monitor_on_port(vgpu,
>  					port_idx) &&
>  					intel_vgpu_port_is_dp(vgpu, port_idx))
> @@ -542,7 +542,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
>  			return;
>  		if (drm_WARN_ON(&i915->drm, msg_length != 4))
>  			return;
> -		if (i2c_edid->edid_available && i2c_edid->slave_selected) {
> +		if (i2c_edid->edid_available && i2c_edid->target_selected) {
>  			unsigned char val = edid_get_byte(vgpu);
>  
>  			aux_data_for_write = (val << 16);
> @@ -571,7 +571,7 @@ void intel_vgpu_init_i2c_edid(struct intel_vgpu *vgpu)
>  	edid->state = I2C_NOT_SPECIFIED;
>  
>  	edid->port = -1;
> -	edid->slave_selected = false;
> +	edid->target_selected = false;
>  	edid->edid_available = false;
>  	edid->current_edid_read = 0;
>  
> diff --git a/drivers/gpu/drm/i915/gvt/edid.h b/drivers/gpu/drm/i915/gvt/edid.h
> index dfe0cbc6aad8..c3b5a55aecb3 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.h
> +++ b/drivers/gpu/drm/i915/gvt/edid.h
> @@ -80,7 +80,7 @@ enum gmbus_cycle_type {
>   *      R/W Protect
>   *      Command and Status.
>   *      bit0 is the direction bit: 1 is read; 0 is write.
> - *      bit1 - bit7 is slave 7-bit address.
> + *      bit1 - bit7 is target 7-bit address.
>   *      bit16 - bit24 total byte count (ignore?)
>   *
>   * GMBUS2:
> @@ -130,7 +130,7 @@ struct intel_vgpu_i2c_edid {
>  	enum i2c_state state;
>  
>  	unsigned int port;
> -	bool slave_selected;
> +	bool target_selected;
>  	bool edid_available;
>  	unsigned int current_edid_read;
>  
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index d2bed466540a..908f910420c2 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -86,7 +86,7 @@ struct efp_child_device_config {
>  	u8 skip2;
>  	u8 dvo_port;
>  	u8 i2c_pin; /* for add-in card */
> -	u8 slave_addr; /* for add-in card */
> +	u8 target_addr; /* for add-in card */
>  	u8 ddc_pin;
>  	u16 edid_ptr;
>  	u8 dvo_config;
> -- 
> 2.34.1
> 

