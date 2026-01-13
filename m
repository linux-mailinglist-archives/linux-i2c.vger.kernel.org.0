Return-Path: <linux-i2c+bounces-15101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD75D19356
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A61B30D9745
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BEC3921E1;
	Tue, 13 Jan 2026 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsIr3P/z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF503904F0;
	Tue, 13 Jan 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312115; cv=fail; b=GI8owoVkqDeXZJHzP9i0G0n4pSo6unaJDRo17FjYf8SKXroqXipiKGT7keOHde33dL5p+cPxO3vkhPqFk+HdVk6yedRPcSk9XUBwRUvrMqXAH9yHv3l9oRKmliZVSOoWrR11Qb9E6CBCpecb5A5dQVMBfLaV8nn71tr5for3dfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312115; c=relaxed/simple;
	bh=XUJiXMekGIYsyyW5xopvcMJBCs08NxJB63PMrRhOJk8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=diERflnkJDxqBGjU6OBqI5so9JYGTWRL6lxCbVBXltyJgBtR3o+SOVBKCVLEEH7khh/q2wRjFFiq5q7/wtRrZpuEIdvSkO8F3fOaBZojvUeqUiQLUVEJ0eV6ZwzsFrEwVKq10dCUgg8Bc7+OJioYTh60OD1eppcodbIb7nBHM+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsIr3P/z; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768312114; x=1799848114;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XUJiXMekGIYsyyW5xopvcMJBCs08NxJB63PMrRhOJk8=;
  b=BsIr3P/zYqB6x/xVJXnwxKB8hENmOunJmGXsN+KaKGJ6GevWWsolQdZ5
   KlAJZSQ6zwNI5rVvXrQbah8ChdvrXtWmZETWpJp1tpX0/urMhkBcTX4Is
   Z3bpB5GOpx4tUGN9tzAo8uw0NlKkQbvcKM2a6jYo+LoE1EF290b3h/coq
   tRuJh7UqHomPFZEkLjkTVjjFH1fJkz/uRbl/B1iqJv8dreGuNmQGyTNx0
   yBWWzT43grjAnfEB6BG8ZGHMDEFM0l7K+JqESPBt4iitEFWb9LhfKdr+i
   Y2EJszw9KSiU7sdgA8/BnUjC7kpsskhvJXtLmKjs2D7UlrBkw6Y+VUTrn
   g==;
X-CSE-ConnectionGUID: EeCcl8h3S0q2MthSBF/JXQ==
X-CSE-MsgGUID: r/j6HtGDTBipJLf6cvvdGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69327386"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69327386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:48:34 -0800
X-CSE-ConnectionGUID: BMZuobgJQSCI5hHP//+CYw==
X-CSE-MsgGUID: 4vKrHoyxSiW86a++U9FECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208856476"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:48:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 05:48:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 05:48:32 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 05:48:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJr44lR0vzVXSXDehQV7jdoli3YMja/EgN5K+8Gvd9EbMuabkYYu7el/3oE49Z6QQs2d3dExuYT+XuwenuD7tl2m7fk11j4cJFSRyGxJ4StvgDpIIg2PfGmsOw+2HRxGUnAB90Q5MfbmtrAQCsJTG/zkshtXBZctZU4hrS0fPzGzJzv+laiYeBD6ptS9SEw9Aw+RLcFIvSu/OVRzJYCWsEV2A8HEQlBuxIOgU86GFFUPc5kueiuVjXLQ0r+zoZniZ0MC/R8IeDJz7kTUBe0n7zIihyf3bfo7HpwovtG8gSAPVoLPHVFgHzcSiSJd0Xss6SOHh6RaNkWi3l8/NfsTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufLixrHt1MgtlWi6diOuXieoCRiU1ISEgRuE0ShC7fY=;
 b=YQPRdVF6A5wyzjGB+2zp7cLu981WFSB8epzHmeSV3jRVs2QoB4r17UFNqkWYsD6jP4VJFRDYhiTPYIRx9bsNojr4cJLaivfG1jfYWeX3Do72AyTITi9qih8FcHjvSxGKUltso9ybHX9y3uga4ouMwewz8BxP0TxuNj7UCFO/WT13cywlcuWhWq0fSpQMc1Fcp0v9MIhThAsb6ryNPlUL4K6M9fZlkn62YXptDmZ7JbCQuhVc38onjndZTI/tq059uq+xJXBaY3ZTHvinEm6gu8jo3bMl0w5PLWAuzOkErOBf1zSTvXtm9FPpDLRdORx6wn4C3G/+t59vLF4CrEbN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:48:26 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:48:26 +0000
Date: Tue, 13 Jan 2026 21:48:12 +0800
From: Philip Li <philip.li@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: kernel test robot <lkp@intel.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>, "Khalil
 Blaiech" <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti
	<andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <aWZNHKeXFMPMG9q1@rli9-mobl>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
 <202601130414.VJyCNWzI-lkp@intel.com>
 <aWVbYYusNh_q_91o@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWVbYYusNh_q_91o@smile.fi.intel.com>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3803a335-36b2-4c21-c4ff-08de52aa6d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/NFNm0657kt1PnrSNzO/jeQJPCY6xvI4TUJXjs3xnkeUR722VdxlR+CTOPva?=
 =?us-ascii?Q?Z8QsnlOq9bVwRIGryKmasIw0eHUbIxoUw4590OSFRpgJzNvhdGb36HuUTIux?=
 =?us-ascii?Q?MIZhWJcyf9Oq2+xpIm6O9aTV59Q/vRMpy9CNgTGYPH/V+O1sLMCDaQ5zFrBX?=
 =?us-ascii?Q?AJjcL1K3SV/5mcAcfAelEeeRsK6vobL0WqnUrUPinezMrpKJxtCvnh6S6JhM?=
 =?us-ascii?Q?1wjozSim5Slaw2oRLaxSeDrSfqHXvmTWmV5jBzJDWIGxAFDLoiANhBza0n/h?=
 =?us-ascii?Q?4/2WwSJQBMqudnbzRF2jw5S2lH9rEuoWMRTNAgFknJPeoc+qmh4RdUlAEY1u?=
 =?us-ascii?Q?uTWAcEEUEULg0+o2GCDliQybldTNPUSgm2WUgDkD6bX9w6VwOMMl0jl2YfQB?=
 =?us-ascii?Q?n49jXbYLLLWtXJy6uR/Y9j63E5rnzf8uMHK4UvE/fDyWVEug50KLlkUOOySp?=
 =?us-ascii?Q?lH+89TMLAuLYieatpAw6fQN/48x5mcGC+3jx9q3cYyCfFFhLplvRMjYcVGqE?=
 =?us-ascii?Q?XeuPlrw68Hrj9HsFG/6ta4ddzJZ0YIYPKE4iN/TVH4GGKStr4zHgUyKKTMIh?=
 =?us-ascii?Q?HpL9E92Tczb/50Ns92QHwW2JmfJ1Nv9tHKJ2dbNWaPvvgrJk5FGPTmdWr0hI?=
 =?us-ascii?Q?pGgm8VDn2YA7ODZmJ/xHQ0lkylwNAyUbtn4pXP01cxzIlq9HakS+B+iqJPJN?=
 =?us-ascii?Q?Uwd0M9J2pjy3pJ4O86u7SFmBxvJqPyostQ1UtBWPdP/xIoRot0AAP98gdfA3?=
 =?us-ascii?Q?UoYX1zeic/ggwPE13IaTiDtPk2xKi99Li62x3NOgwAFRwYzLjOlmyDUBiaD9?=
 =?us-ascii?Q?7QZMecCh+Q4ye5J/9Nnct8pJFV+xmdHPYQng/F2XaeFZRyzwLZxpLIcVK3UQ?=
 =?us-ascii?Q?F6IvLBN1oBuDoZL4u3OccjT6MSpL4PfEiS1pxntZLMKwol6UdlKyQgP2EvMu?=
 =?us-ascii?Q?NhB0t0HR4eLPvGuIEWvCAWYXuXV0QS7jhZ+futRJsK9Ahl2yNCEwlzGNJCUH?=
 =?us-ascii?Q?7NVQcAkPfu3Ym7r/i8/yX7TqVnezTWS86jrkqnEB1oqdaGB4s8HEccwwweNe?=
 =?us-ascii?Q?dkL5pCAgohGDvTj/1KOMRxFlj0tqBSlsrPI780JTavnfsKadEP6Q5ihkhhlo?=
 =?us-ascii?Q?6Jvh+aEG9/5zzCIBDBmlESZ2yV9asOCTsjiiQbdcB6d48s/WvV2SOrp2BajU?=
 =?us-ascii?Q?cseYHZYCRMwJq8tvogVWGEfMYRIdYC7/zrXZtsv/GaZJCRDoF8sr1geW1HTy?=
 =?us-ascii?Q?81bXqCIsgZ2+uNtdu+qy4TQ0jY+eS+FU3YqrRba0Y6bBGGmAiWtgSOq9mAxU?=
 =?us-ascii?Q?jVPC+Z3zjiVm1HuHO6ROdIKn7uf+L+Y/uG3mzEMTI8sVNR6h1kBdqX4JDUZK?=
 =?us-ascii?Q?2b0bmEVuno8Qr4tEX7c0+McySAF5xQr9KztjKeEwq4bE9eKBu+Vghb8Giy2R?=
 =?us-ascii?Q?7ccdmZAPiFzWylgQVQEeDYx84eA6PubT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPl1qcV5XeOo2msGGx9Jrwp9CUb2Pvg0NH+BzsQjjSYVzAx3YwzT8JYqkMIA?=
 =?us-ascii?Q?w8ln18TpofVBZDIA+UCMhVYcMW2+GUZODfNh7yhTCiNlOEjYqedC89RfDcqy?=
 =?us-ascii?Q?UyPaUUGgNK1GuYaNLIE3j4SMJKGcQ7cs+akr/AuJwlr//9Gv+5sVMsyyH+aw?=
 =?us-ascii?Q?FWNOe4emOzq0ERPUQHTqPuniRXmW8gmkgiP+avTmrgPfaEGe/bmR2u0bTNSq?=
 =?us-ascii?Q?EV/4PYkeoXTrt2+yyiOOgVjCL9NaoUBTlAwwKZ7TViOSR7COkXBwLHD+JSyR?=
 =?us-ascii?Q?OUNf0ay64npsIl28Sbz2T/4S6K9cJTbe0T7TLQIGdKv3lACWAwfH0IoXm6zr?=
 =?us-ascii?Q?wHTRH69h3iSUx+4/g+8OWzPRvR1dDK0gcAsT4dKgNW2lf2Q+T6GeM2PNOlV5?=
 =?us-ascii?Q?NYd6Z0TnaX8ifjtKAE4XsoSJWsYOu0kJmyZO+IHjTSwUNxJkAqUKvK06FRjC?=
 =?us-ascii?Q?46wWtGC3OkhvBYdllUxwajSWdb7rpI7rt2mF4K+zlU50xtvPTQmbG/GNtH7R?=
 =?us-ascii?Q?bv+vHlzEmU5eZG/V3b/dB/WRAXFIIN8EIB/11koY+GofSBDoczfEMh1nc9SJ?=
 =?us-ascii?Q?DodM9DfxKf+BPfABYUKka8XeJ3SyJs2nwU8quamB0qJ/qQrsjItAF9Q35qIE?=
 =?us-ascii?Q?1UV/wCNuiY0RhcjOD8BkQGUcEl1h0tulg1C5Rb/Z3zD2ypmpV4pgqe26aa6+?=
 =?us-ascii?Q?jAq/qVSSTxW2e7YzyIXenx3HlTvmQYdcwPffSOR+aWnxnq0cT8dGi0nw/p+u?=
 =?us-ascii?Q?PihhFq4N1P41pcP7LeUdHk5A+qjcARRjvYStAht3djceJtOxpCaDgBeNiSFf?=
 =?us-ascii?Q?+76QqPy6BwAaQcLr9WsMy6gktVDAPk0GbPSdmyhgleiEjEm7MDvwgkljpcpr?=
 =?us-ascii?Q?qamXSJAxumeRmkQaI7BmqxxWmjvK0ICBtSidzeobFPD81imiv45JDq2UUn4k?=
 =?us-ascii?Q?frPR776z8LRdIcLilQV5XWMB79CR5+C3lPwiQfnEofWEuKG+MsXccB4p1jOb?=
 =?us-ascii?Q?XEiIQL1/KVEr9cDaH3Xh0GdcJdwX2EJBdi47z86QLShatErJ0enGKI4qSXaA?=
 =?us-ascii?Q?V+xJ3TAqTroofCzwJQpRdxNRa2IVhZGrDheuAtCrCx+gWNSdT55eRoIXpF94?=
 =?us-ascii?Q?eubrBnvvD0nyyc7dgUpP9Ky/xjHeZPMVokws7u0FBYmFQsVkRpGGqHeg7RsL?=
 =?us-ascii?Q?aN+xxeN2CJp2B6N7hU+1jnCcFSI8oAWNVe4pZ5Kwt5eiz9ww1yLwSOM/yib4?=
 =?us-ascii?Q?L6zayc/+hfx6Aaxo5U2oEChJ6IL8W3WgsUSYcBdb0dFiH1WMWdy1vTD/fG7X?=
 =?us-ascii?Q?0oRg2jiCuYV5avuGMjJ9JtfKMRKTUkdSx6mpaiJ6vHxMkdPzgP+whWzwSOea?=
 =?us-ascii?Q?tOVqNy7M4c+nzc3qWFREsj6DvpQFjcpOpaGhLt0tMb+AtiajWpM8zOYLNsni?=
 =?us-ascii?Q?8LQEIruNh/SnoJf1QX6eR5qc3KrZPlYsUKD/YUPBqMwgYOq6hzBkDIUp9Cwp?=
 =?us-ascii?Q?ukfiFcQttHkQB8/e0aoBenB/zwbRu7d3FeYz4oYFA6lAtuR3LTr3GavfaNTm?=
 =?us-ascii?Q?VZ2aSZgZ4z85bhnNfPz82sNiXsSlF9tGWMuyGqfXj28lBr4wZgKOVI3TjczL?=
 =?us-ascii?Q?QOc6q6S5dtr6Pgi86zQzTq8lXood2AgN+gyGP06Jb0J2aMxXWg2uECtQTiqk?=
 =?us-ascii?Q?2Kzu7vT8g+nt+1Ju/GxeYBAFXQLjLNP+jYC5aBtfcLQD62xGWfSOjj/CvUgP?=
 =?us-ascii?Q?sY5h7iahNg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3803a335-36b2-4c21-c4ff-08de52aa6d0d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:48:26.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtkUqNlPczSTDft3W7OyLgKRa+D2Ou+xGWerPt1HNpvN4q2qvkJBLNYKobvXSPv0wK7ZVH9UFSMTaybHUeg39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
X-OriginatorOrg: intel.com

On Mon, Jan 12, 2026 at 10:36:49PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 13, 2026 at 04:33:04AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build errors:
> 
> Ah, okay, this needs to be based on the series that adds HZ_PER_GHZ as it
> provides the needed header inclusion.

Thanks for the info, and sorry for the false report.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

