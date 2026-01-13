Return-Path: <linux-i2c+bounces-15139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC0D1BC19
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 00:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBEDB3017868
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 23:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABBA32A3F1;
	Tue, 13 Jan 2026 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpodjDPZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19128EA72;
	Tue, 13 Jan 2026 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348522; cv=fail; b=rEILHtoOR7u2nG9/T75m+r9wb1JMRzHEtL5D1Unz3EJSM507NcJAxSIGL4FYb62c8enPZTAnOxxc9TmOu5xjjiQPKO2kfGRQP8EMEAV99xxMgIhVQ/20fLucvYdxzFZSs/yJnAILxPmtbGEWWCB4veS7+2CxuuxyEK66vbSQjik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348522; c=relaxed/simple;
	bh=EJYlDrDo5KEXkC3Ey+4rWTT3sLoffAIeuEGGm9y4KgQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h+BxneNx2uaNpPiyFkfW1NQ0w86dRJIFINVLTCx+RkYMwly9lvbd3b4O5bh7SM//XQ9B7rFnzL6XcOTuSnIm6tmwd2uNavXVVfCP8maK+rw+Rsq8sVJWQ3b3kOb+/9mW7KKMYy76ZnyYdpAvFM7+Fjckb0wXfdpOuAE6KagEquk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpodjDPZ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768348522; x=1799884522;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EJYlDrDo5KEXkC3Ey+4rWTT3sLoffAIeuEGGm9y4KgQ=;
  b=cpodjDPZfmOs0ePG/oNkKk9Is5qSWupWMIi9U4VRbZTtTR3Ox59qGEJz
   vVA5AuhX+kRXGHQFNrI7o75iMtS8gXZ4aDJ9Nrlsoy/x1oUBxYKRUqnn9
   YSvKMgEUSE3LsqJMgrPPd3/jPgD+R866ZDOy0SDPPDhdQvxHBe5jeHGv7
   Acn4RGS3tSCZTnLXy6W1KbxYxie94hUe07/1A/42g8Pub3y9UkKslAuVc
   +mSEi7nowEc3x5rFq7rit7tN50IqGFSW5qUuEfugR4QDx790PTJe69ogx
   kpbo7aselWknj6SOlPXU2ysRV/NRvIqxwxs/Xert/5K441Gw9fFt7nXPQ
   w==;
X-CSE-ConnectionGUID: zuliCtH8RHWdaDigv5/SAQ==
X-CSE-MsgGUID: +T4hmspVRfCLX4OgIf2oZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81093780"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="81093780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:55:21 -0800
X-CSE-ConnectionGUID: AJuGlNsVT3KvX4TMTeW7uA==
X-CSE-MsgGUID: JsXzg0QNQgWL0R665JSSgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="209045659"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:55:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 15:55:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 15:55:20 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 15:55:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJzZ/UulIKrT71bTyrZAZXOUIrjsfDwg2w3UvNc4jh4Uo/aZdGOwqddgH4NW9YuLFUOiPVhcg43ubaQIBRqScMevHN9xqHX/d60WUxIdvaodV/yRazwUBcgWvhfG7B30a3x7MeDxJZvKcETTJtBrpKzYhuFxxjIONBLmqcC1CwrhtFJ74FC4JNDH/lctsBbyuEdhG/sC4y0hCJvvR5zu3EptwJ3k7NnqdpNKy6f0s45kIv4NGC4Bpvl5fInnMIWWBPf+BfbrD/iOP/U6FLuSrVIzKYZFWznNo1pSJzRBzWs0GS7dDLq8SCsuwZsDg30o3H3LrzXfwybPZ/O8G+8UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dkv5PEBh8Skz3r+nSRL9U4+KEjJks5jKVm8h8Kllax0=;
 b=F2XLYFCB3ny6TDxsb3KDqou7ybfnZFvosKL3g9V+AIiyu/U6He6N0EoE1+DGUqcqAMjBgsfUDNsS/KrwVYOLh0K81D+MRD/fs63QYWd0Lv2oCqTAO1sqquGVpJbM7viJSnxLUNCo+NSxPVW9ky7D+lurjkCnOy9C0t3/2lFpC7qDH4NJo5a1pOYlZMiui9ZDZHWHtA7DW0i1sMvRcLrKuqrZBqbMwySCoa62Z9PfzO/mp4cDxh/gBcF+vDIQf1/m6D4RDqqabMrH9XkO/0r92SFGX3HWbWxtIsvIovNU6zv7DmFGGIBEjSM+ClEAmbsyGH7TwVo2cOr/0R3Eo3y9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 23:55:12 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 23:55:11 +0000
Date: Wed, 14 Jan 2026 07:55:01 +0800
From: Philip Li <philip.li@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: kernel test robot <lkp@intel.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>, "Khalil
 Blaiech" <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti
	<andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <aWbbVUbMkKAAV+s6@rli9-mobl>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
 <202601130414.VJyCNWzI-lkp@intel.com>
 <aWVbYYusNh_q_91o@smile.fi.intel.com>
 <aWZNHKeXFMPMG9q1@rli9-mobl>
 <aWauQVSkQsqvS_rT@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWauQVSkQsqvS_rT@smile.fi.intel.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d66ae0e-0a75-44c0-4ae3-08de52ff3027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2jjKNaDoQm+Uzv5ZJrJ9vpV6S2kLBnQ3Lvm1Z72aiexFCQ+Sor7t6rN9pHJs?=
 =?us-ascii?Q?bZFEJTS9Y+ez/gB72nnfoFZp4FWdvYXKEqBfGhJNvgzVegAl7L9ZGP2qfawS?=
 =?us-ascii?Q?8lRwWYkzFdGA5vSJy3RjKpbTm/5FDGkygobj8QVNA6vJbuGhwSg/D6b6wWSY?=
 =?us-ascii?Q?oIoeahSryJrEeajhZniEjBGKba308gN3jhMelszzG8v+MhAzRJ3lzyDXvLrP?=
 =?us-ascii?Q?rC8F73z8tk0whNWtmgwqjAAdVkVf2XSKqgfWSOlIwWJUo+gBekDWNDDZmDX8?=
 =?us-ascii?Q?904rGFlJ5Ppy8g66nuEjj1VFo8+3TU7EybyxZoRRv3swHY3zpwzFUEvY6j31?=
 =?us-ascii?Q?29e592P1DcZBgrZ33ZpB/zAIJF8i1lAsVt9LMhrldT+SD+nllF3K78e6QL5b?=
 =?us-ascii?Q?IcqKACL4bIvDNhzzE9/bdCRDM73pLQlTL2BexJlPsZ+7e27HxDMPHznPZs/o?=
 =?us-ascii?Q?6EF4aruMMZl+1WH26/nM+d7RbLJeHhwc3AUZ7D6+vXRm42+u/Mk9pGoUm6TJ?=
 =?us-ascii?Q?uLodSIFOM5bk1YMfSe6Ho+tnKlCqm/LCIYL2PbKyhAIyypwat2vaXTke8rQT?=
 =?us-ascii?Q?dvf6+PXdn2f4UyGFEVR0CCAzHIwXabntYEpT14q4+0eANj+1wb9jPVzeqoV+?=
 =?us-ascii?Q?i5cyjhglIqmPeW3sQHw/KS4EYXdatafBsFK7uu+z3unIGq4RSPTOLtrxFQsL?=
 =?us-ascii?Q?cFAIET+mHOvE1jH8ruzHToYLeju3CoRFHBXUb9KUDdesWYiKWn/nBZ4qhgXM?=
 =?us-ascii?Q?jlYXlrLGYv7m+n0kDqTkz6RSvn+H2Pzl54XKvUSFIkpws4zAy9c/51ajhLV6?=
 =?us-ascii?Q?4xFKNaFlIaGnBIvCbQKunHuP5p5J4mqMvY5e1UWpw0oonc9B9Nfh6xEhnCQM?=
 =?us-ascii?Q?0SBTE1vOyp6dx+88zMoKtFbOmUKXc9wixcft9xNbumJE/pZa1+y/iXdnd58A?=
 =?us-ascii?Q?CXO7gVn/IbpttVUwd75TW1Ei//Msg9+vWtoinQXAAHZGcaXIyRniBf3tE9vC?=
 =?us-ascii?Q?ff9QwjgzxMUPsx2pfu7aB7iUkTOQgpoGaZykJ7log1Sc4koRMRz60XNrJjJh?=
 =?us-ascii?Q?FDj5nP5xUsuaVErpFLl0rkxX97J7WIgxm3d09LqoGk1FEt9JpyBl+iX99Y0p?=
 =?us-ascii?Q?UxDChyntJNLclkNxdAiuMa84MlCPSzU7NTn6vOvXZDBBG9FD3Sa6ZGNUJN0K?=
 =?us-ascii?Q?Xzqj5UGALvh3IfVGuSDMtQYB3coj+T5qoqLTb9HAzJMOxzYFjzyW1bxt8JfD?=
 =?us-ascii?Q?O7h173iyjZ7mpDfF38ho9F5wsjlTyxSXSZiQMK7/rh/ALqjrwlsr4DozU8z1?=
 =?us-ascii?Q?kMUM04BFBkkl7zVJ1/5OqVo/NrJIwyFUrTwBRM9dZLeQRJnBr1Tw6GSzzxYq?=
 =?us-ascii?Q?pQQXy/kN7+ntduvBRP8jt/4sOMF98keQVxxq6YTtQwZa7H9aSfBho3rBzTnW?=
 =?us-ascii?Q?uCPdSLV4gsOq5uStc6hWwfwbGWYCdR4pbxiRtR053ds132ylZZe/HQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pkgn7QBEyEXHcBEvOZXrq9rWHKPSqaqIWEAAvHZVLQuRcBhyJTUVfRwTLbH5?=
 =?us-ascii?Q?avXLsmo8mjj38OLtSOJdxYmWWRUo+STI2edct5VrH+JHomM/xefmjiLRpxdM?=
 =?us-ascii?Q?6jxouYgJMFoP4+9JVUsxybD5CpyaN2fF4r/nfDq3srZ8Qt/pFrxRw+AxPYOI?=
 =?us-ascii?Q?51NJS3fOKrB7Nr2ZdffF/hhaCU4dVyoZFvhQq+a3Sqn8LiN9YSH++C1W9sSr?=
 =?us-ascii?Q?JbUKzjPiWhMKJTF832Pa7fBtd131ZawHJBRiANi0kg4hDZAKmGtuc8RFZ4mo?=
 =?us-ascii?Q?7UM0YVCs9NJ+UrkoecHJOCBv8FdFFRJQKMpcZNl/edCM4qmhhoZVDdMyo204?=
 =?us-ascii?Q?XTbDcpyTizsAr94w8PM2LF4XkqsW+ovxuGiguiBfaLoS64qRwKT3pgXH/wfC?=
 =?us-ascii?Q?cv9quGVybuCqj+CRZi8W8+B771AqqbQg7pjSBTZiqpi50CcplRCIBJ1raJf3?=
 =?us-ascii?Q?R0lFJ9S+4A0akhxM0Lr/PtBg4oSKPFMliSI6mWDFncW2zPVjUXzuM+R8ZhVn?=
 =?us-ascii?Q?vEgCt6OrKD3SuuJ6eNA/iJ+FsJHqqt4B6Ik6XOEfWZWPbnFh18sHZQJMD5na?=
 =?us-ascii?Q?ORd0xESrskHtDb7vkh5S0uS0HeoiMkyoSyXetdQ4roHh2r9Z5XfO8a3qm5CX?=
 =?us-ascii?Q?uELwqeq7uvZepwl0tkNE/tfmiEbnXsLKXpm6Z8Sv2WcaqzbIuRHoAcFppsi8?=
 =?us-ascii?Q?NJ3v0ydO6jFdLeKr1S53xGPZ2BMiMy2hxxUulTX25MhpAE4HOK/CVSTc+aJn?=
 =?us-ascii?Q?/eTSsxk4QmDfpm+95Vk5IJeXoq1AhRu9S4yiUfGHlHeXCK+UFIzZCCjGi00c?=
 =?us-ascii?Q?CN87U6JUEmhuPNAbYDPgDvDDVe4xwvPmUcu1DAM2bdN+x4dYHr6PwgugeJUR?=
 =?us-ascii?Q?FAfdFFOht8CI+XTFM5SajCkiLx4lIzf1FjKOu86baUsCw2jaGxkfj3fMScoC?=
 =?us-ascii?Q?bvLFKWRx00zZXFfyQHNJkCWA5tAgO6ugO1BWcxhZc4uTgTi6ZkVZxpdrdbzx?=
 =?us-ascii?Q?7ovplbLbsGWzFlVXvcniM1Q62e3jG8QTMvGHzqew0mEdoDHjZsMgkBhS+r4D?=
 =?us-ascii?Q?GWiDaWRa2sdWP18ywH5HkT42Q5pUwEZ2pzwoqilPwgVaLDxx6x9/S11CSzs9?=
 =?us-ascii?Q?46XOfqx7qqRIydxWC6bHIbJyMXwsdiXLvf3q34iP88g1QcQaU8zkCuTu0zgJ?=
 =?us-ascii?Q?PeVUsSGVdhZzOeorr8TXdPHupmp8qFRJCBYxG2K/xE7iMToQCt3akn9Kmvjh?=
 =?us-ascii?Q?ZEc3EnoMTt16JXKzDAEJNBnWvbUhWxIQ5HqMPQs2UUjBqjGjeFxbrE9oaovd?=
 =?us-ascii?Q?s2/Ro1A/7fHQyiYL2+smSWAbkg1hrQFi7nwidhrH2J8cWi/h0a6l79wMt5WL?=
 =?us-ascii?Q?5ZM9njJfw0GPzeh2ZUlmF5HoNWb5KRHF08B7x6y39SCH42PIH8K8oXsxseAj?=
 =?us-ascii?Q?xUS7eZHMlwoRA//RXgdvltPxz8VBxncUH0iC8qnaVW3LxX9rpwYR0Naflsa9?=
 =?us-ascii?Q?NslRF/c9iuP7EQKsQ7nAPGKaz6+1TA8TFKl2uXoa8joWcl7o2aTZxIS3JbOl?=
 =?us-ascii?Q?j3Uf7IaQvLE5ZNx85p/CLomGEEqS+ByEitQnSlvPFQAS1Y27b4Nta8EvvLAz?=
 =?us-ascii?Q?4fSE7kqmZs9RTpbnrvLB0xLjW+2k0dz+U8WIdOtYWFH8w43eOf9a+0HhxHNn?=
 =?us-ascii?Q?AFwq396uYkoiu2R093heGHvqTvZ7TPAtJzJ52bcXLEfWSYCVxrQsyhauBntO?=
 =?us-ascii?Q?6Kc5Kea94Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d66ae0e-0a75-44c0-4ae3-08de52ff3027
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 23:55:11.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHeDZFzwQyfh+zasyOAqpfWmAd0PVKGvOgI0SnfDo8tbW70GVXckYHTzZwtB8mJffoyRxfg3EP5M+CATql2BUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

On Tue, Jan 13, 2026 at 10:42:41PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 13, 2026 at 09:48:12PM +0800, Philip Li wrote:
> > On Mon, Jan 12, 2026 at 10:36:49PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 13, 2026 at 04:33:04AM +0800, kernel test robot wrote:
> > > > Hi Andy,
> > > > 
> > > > kernel test robot noticed the following build errors:
> > > 
> > > Ah, okay, this needs to be based on the series that adds HZ_PER_GHZ as it
> > > provides the needed header inclusion.
> > 
> > Thanks for the info, and sorry for the false report.
> 
> No problem, can you remind the syntax on how I can mark the series that
> LKP knows the dependency on another series (which is available only in
> the mailing list)? I assume it needs message-id to the email thread?

Currently to get dependency of another series is not supported yet, and
for now, we can only support the usage of '--base' option as documented
in [1] to avoid applying the patchset to wrong base.

Your suggestion is very helpful, probably we can check something like
base-message-id: (similar to base-commit:) to retrieve the dependency.

[1] https://git-scm.com/docs/git-format-patch#_base_tree_information

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

