Return-Path: <linux-i2c+bounces-11678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8CAEC213
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 23:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36B8A7ADBA4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 21:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB24289E2C;
	Fri, 27 Jun 2025 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3BfHCok"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AF22CBF9;
	Fri, 27 Jun 2025 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059955; cv=fail; b=dfzCKBcYMhG/Wng9Cn2IyTY81J1zYzB9kpXtzWWz4QYM/8csh4yiD/jRxILn3Q91vrQfaHB7E4ngXsjLPAw2FY06E9MAHSRrNCmhfqdON1DyHzvf1eOcdxUe4hceMUhn52H9s+xTqMUGTB+UreHyF7rrQo/k5n5sR5cMrLKceB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059955; c=relaxed/simple;
	bh=2rMKgfE1OXCrOPOq5CHkQZVDUOHFpytTeLzRpxS/M8E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dDmL2JiewFLzybzyJSVUA3lDZrIO3eLcPAFLiY8MOEwlAk5Ma7jE9OsFtc4rn/gWq2aGzO7q4QPmYWjfsYO/wj/zRHc9wP/YGpSf6O0LzIIkofPiABjbjB5iWt1EyudUNnvtZ2biW0+gfROJ+O1LdIqJXmLsBWjAM4iWCYPTZvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3BfHCok; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751059954; x=1782595954;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2rMKgfE1OXCrOPOq5CHkQZVDUOHFpytTeLzRpxS/M8E=;
  b=G3BfHCokwelrSa2UXNO37ubpZHfUekMTVTigB1WV9Z4xenxp7R/R8Cp/
   kpicY1xeNaszS3TA5nK3S4Hx2xxVJGxytFb7lGq+7Ho9NZX6hEgGupgzX
   4MczSia2OW8u3fGFfjIrHwTYEaOp9S/LxdAL64WFYv1GA3yD9zilB1ii4
   yQBukGSz7BPkYBfcOw55X6Uv++Z9pCxkuIeJQlxjSI3/wvM4vExWKZqPI
   w1OXzZvWENIExYOszEKszNECwD3uDcI4RQAYjTy+MhxbRmAnya/b5wGC2
   rNllwBQGnk+oZQE4h0xMNgEzOsg+hUA+d598s4vSD4OyA5LMFEwMq9qbj
   A==;
X-CSE-ConnectionGUID: LG5jxDa6TfKFXmBQDuJs3w==
X-CSE-MsgGUID: /2y3wOcFSzGiUTvCPL0kAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53347280"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53347280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:32:33 -0700
X-CSE-ConnectionGUID: 9XhNWoHDTs+P4VFQLHOK1A==
X-CSE-MsgGUID: n57qJbiPSYee+ZR8O9ARKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152422305"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:32:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:32:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:32:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxbK7zRtSVhz6t40cRHjhAoHjPZK0nchmoOPI9ZMEebBK6k0rVIwx5rNy36VyA93edW7zst17vBYlluO2X4C+pwlz+YBiy5vm0JVv9/IVWBJnlRNtXGsJc7UrYzkCF/R134Mry60JcfDY/C2RHaKlszf1Z/OBzXCQjDQbXQgXCsPnBnZtZjjGYBqLEbJ9WygyIK+XksVi/zzBmWju0+cFTkqooCJ2TOy5kpx+qc9lmazTnU30eq7J4cJ/V9E6qHv74/RySrqkjU3caUPrZVd8CVe4Li0TYkLfKoqU6arLYE+ZHRNSELmH4Npl2CM1Rl2s3wlh3QEurf4AzVHvLjdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdqLL7/qFWCNbGZzdyByIV9vhWnjB4ejR4y86w7QXnU=;
 b=cgCyQ4l2FicslmQ04XgSYVGiXo4QiDl5heh6gGTM/oH1QshMWVfJD8MmdWWJtuotaNKuxqDCi8IcUp/qptCnd9Rosv3ALl3u+O04WrQwdIxBrLa/AMonXo7jALARElDVYDBC/nH9P1zovgktr9a7BhHdEWvyVf+4LgH4NkpN3H9z4bmYjRI1kv/6/giB4bqpULHoZhf/DXqXlay5mzCv5dsz5f486Kqlv6vBmT4nro9Ao7o607eNUQtMB6j0/uZNZt47SJRTQtHMg6d52KcfnQ9jx1xW24g906snoZJ3VI7lrHVjT1ESdPI8ti/9SU4g4jnUcuO+IeRmwUisQDUpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 21:32:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:32:15 +0000
Date: Fri, 27 Jun 2025 17:32:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>, Raag Jadav
	<raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, "Michael J. Ruhl"
	<michael.j.ruhl@intel.com>, <intel-xe@lists.freedesktop.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aF8N0dYk_WAJjvVu@intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aF6nEOVhLURyf616@smile.fi.intel.com>
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa2a03f-bfd1-4572-85e9-08ddb5c215b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LVBgyTU3fWmhCwXlgQY9jNdWPwqEgkoM+unuukkXG5hAx8jJKYkyI83pmM+X?=
 =?us-ascii?Q?c8hQUsFkxuDdOZyJWt7m52C9Kfh0kU6G4LUTac7Y0rPtSdsn9+x7f6j+N+l1?=
 =?us-ascii?Q?JbJUHCwBtwujmwJb1sf7Npt//OHQJ/AaOIIa5ql3onQrRj7A9VjI2kZnYm9U?=
 =?us-ascii?Q?1C5vWOhnM0R5LcVIcBJ03QmliA8NZfyfe7dQ6pNf1b4Am+2oTXWopo5R/yXR?=
 =?us-ascii?Q?WhPoXKAzZYXxQZNbIRcR3O8c9Nb1t/Ou5O8HO5ui+1qMWnXuaAZnjSXwGPNr?=
 =?us-ascii?Q?JFnsQjAeHxJn9SSiBJ0jTqG+uglUdDkzjAV0W/uErX1AY7qks5a3fLzVMmbR?=
 =?us-ascii?Q?W7XDpeOc0d2VgrKNs58otuxIws6TuwldBAqb0dvIMeKT6w5loKztaBFQqir9?=
 =?us-ascii?Q?NXVad8OaPzvs9uwO1hk3FPlTJuEw+UdJu5QLDGtZXYnCjJxDPuq+q6RxCIpS?=
 =?us-ascii?Q?OmYdBKPHY+W3w31jjeAu/yDnY9w/36Yay8CjHf1rgVu5csVAAq/iB/N9HJmk?=
 =?us-ascii?Q?UvPGdTnTFj6X3NkrCeGZ7rCSLYk0cG+YvGadQL9bLVS3jejF1Lj58rYEFd3C?=
 =?us-ascii?Q?q7uPVdS1ZTFuKsz3MdbwkhVWcVLxHAVySOr9eFxuoOrBItohZN/ZOxwfpKIN?=
 =?us-ascii?Q?aUwitfjhGxaRi0FOYafy9i9EBR3hc9sKPGd2SEeXeP0EK1gAgyd79gE3VSsF?=
 =?us-ascii?Q?LdNfr4BRrsTQl6RVIbDEBl7AVtCrKTuXISBNTPqbtuth3cqxjG6TBzRIIAbk?=
 =?us-ascii?Q?B9RpgO0/jkhE9Pa6P+dMFDUuaFyk7Ta3LJ79M8TS6drDzTqAaL4oZlGkIacZ?=
 =?us-ascii?Q?4cWESiPRuzxqpb/+27tIM+7VxwjeT60lvQUmXa5v1e2losFnDLo/x7x8oIwT?=
 =?us-ascii?Q?WURbmIQ9YHm9WREDqmD96Vr/mvrM0/PNzDnHJwDLwMFwJgc9104Qde34OELF?=
 =?us-ascii?Q?FZJBcu3ifQ/BqX3I/8J7ugi8T0Pj2BXwIbVP2JXBNhGVBtnBGnJnOfyxPCAa?=
 =?us-ascii?Q?q8oUrGyISfKOTlyLIva1d8h4vfRb5tVwbsTkoa0+g85O3QSc5wwIWDNYpE3a?=
 =?us-ascii?Q?LZfp5Ebjcmu0aAsCW5grc1kaFklqmZrt0UVIgt2D22XHJZV8nxM9W2QLycMF?=
 =?us-ascii?Q?3EQx6W6YFIkBTjuXHwH6FMA7HVJyh7dVszcf60d9JSzyMj8MkzvuVvUADJjf?=
 =?us-ascii?Q?/SIQ6CySimIrTrsyhEbXKhcUQjc+Or2Wv8X75o+Iz4OJSa/KQQkc3sdbsw1H?=
 =?us-ascii?Q?/dtmEdO/uvX0mCmY1A7czMUlNZjXlTVy/Nm+Nd9o18MTE9ajIHPOJZNAVfc1?=
 =?us-ascii?Q?b6EPF2YJt0cxH7wYlh4lUd1ZnFXbmPYiuVNBFvnCA2mHS9tnlTq4SjVc0uOz?=
 =?us-ascii?Q?zVW9XhfDApAZglRkds3QSLhaCQgtnutmfyALmcjFLgg2KUnvKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uw6yquODmOgEiCTrufzmXxLVrpRhDkrnZ6RUS4knOHNuRaWKYDqhvaTvbxqj?=
 =?us-ascii?Q?8XC4eMtAshcn5FtHdjzD1IBiC5V5J3W3lMoicDnxOCkDtUTdl5v89JOnWLs8?=
 =?us-ascii?Q?tdQ9x8ZcZ6O84BWrWSrf8S6NPSg9LJxnKdzOgJJ/sUY42FZ6+R0ONFIFRM0N?=
 =?us-ascii?Q?yNV0h5EUDrAi4nTIzwrE/GyeRw2JW+jsQHrAwVzcP6NXYfAGrQ8+xvuI3UCG?=
 =?us-ascii?Q?rQHgdNZKHmkYlom4Oon55HHajzSpuSyObeOM6hW70CZgxtB1JAqEuVkhPh+e?=
 =?us-ascii?Q?xhSGCR3XAm3X42mpx70DT08TlvzIxySM7L5/m/IieN3j7+9jevWhM5K9TQc3?=
 =?us-ascii?Q?xm0HW8DTkQVVuWBOe3vC8jJ+u4dCtugOxK0ZLfGdsBTC/bertP5A74m/a393?=
 =?us-ascii?Q?xQTVZPrd49jkYXpcctinpOXn/GkeFD/2JHb6S8ph+Y84z+zKEhlozX3uxekp?=
 =?us-ascii?Q?okLCtYa3rUkriQMN4SRfsu3oaVTOE3P2JrJGkDgqIBbLIdga/Ig3r2JfhI/a?=
 =?us-ascii?Q?C6tOzP2ih2hMB8sa7KqJtfTtSUHAFa0O2xh6iByFIBpNwE+rw7b4tNc5pdMh?=
 =?us-ascii?Q?NoYuXqRc88QAxKR4Y5IV2AwyLJkipWep0nNuZcxKEwPDASlD+c9uoOAR1w3J?=
 =?us-ascii?Q?lDgU85YkWNoijAAgdAPjQGRgLePckQFOGm6z+sV84RNssLcBmVM2eXxjUR+7?=
 =?us-ascii?Q?OpVEKW5iW0uUUORgZKgZQjWYqrgFrftdgvlEqfb3jEUcEF3eQvEUMp5SDJSp?=
 =?us-ascii?Q?hqioCnk3KtWRe13ljlYL38IiBIfJttD7ppb4OXs5pe40hDjFuMQ7Lf6EpdbR?=
 =?us-ascii?Q?FZpV0UqFuEctIRE5E/TiIP5hVTmaeqPpTxCRtgPfb1ax0VCPuUOflYV1NkGJ?=
 =?us-ascii?Q?5L4Uc71YLTyIVy17YqFfsfzLa1ZOUv3OFcBtEiFcMt+DcLuWvEnT6MRnENCu?=
 =?us-ascii?Q?kBLYVONPILybjVwHLirQFK8/vtppau8CKiLs7bW/8NLxCQhHQGFR5FYzBkAB?=
 =?us-ascii?Q?X80K+5dXvaLaddzKXQ25KtOhqO/8fnP81k6qc9MSIidwx6Bog5YWOoHww795?=
 =?us-ascii?Q?U8IofIjVSmPWBy+N5ZQhOZZzwRZLMNBp5Ix80I4l9xj7dh12p4a7pOmvwAI5?=
 =?us-ascii?Q?8GoHpHF/3pOPACcJwTuZwql+xRkhlg82x/0/FY5otWJJfkjE4Z/4i0xIlKz9?=
 =?us-ascii?Q?03OW+/Jvet0pbyY540OrEGpVOQ6PQKSTVjDlF97n6NYUk5GFJJ8a1paD5Fw3?=
 =?us-ascii?Q?jSyj6TEm9TyyeE/Ceh3WuLUMbBrlQu+bKcCTESZ9hHQMwuqhPwLc29Oj2naP?=
 =?us-ascii?Q?E2CfGbIxKBQDBkSpdXKv+qdjwPlhpIj8DFPU/+AeHXppfeRugpdasiLwLFro?=
 =?us-ascii?Q?KfUbJOcyV45WIOnVJbpLs/dwXb31/vCNOHHYPzZyibqZli/yDAYye7xnWQFr?=
 =?us-ascii?Q?i0uNW/Y9wAHBRoqwyqzLzJZZ4gSdBxONIdP1MhqpphP3PTZkacO8hGGYDeGx?=
 =?us-ascii?Q?oko0/Z3nVv97yMgsD5pQ9117TjLcQKXImDZEXxG0bZs64lqP4aTXKBFDP6Rp?=
 =?us-ascii?Q?tVGpBiWuSRsgy03j+UrlwsxyrO/+l5bwCq/+eoZKnR/LZhcSAK+TON2DdfT/?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa2a03f-bfd1-4572-85e9-08ddb5c215b6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:32:15.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe65QokkXV9v7oGbZj8bfFSn4WowjDYORu3i38wYrbBNGPyO6KTzxTga43Oe2un41W92m9rOtELn92Hh2GNBwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-OriginatorOrg: intel.com

On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> > The regmap is coming from the parent also in case of Xe
> > GPUs. Reusing the Wangxun quirk for that.
> 
> ...
> 
> >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> >  {
> > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> 
> > -	dev->flags = (uintptr_t)device_get_match_data(device);
> >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> >  
> >  	dev->dev = device;
> >  	dev->irq = irq;
> > +	dev->flags = flags;
> 
> Maybe I'm missing something, but why do we need these (above) changes?


in between, it is introduced a new one:
flags |= ACCESS_POLLING;

So, the initialization moved up, before the ACCESS_POLLING, and
it let the assignment to the last, along with the group.

Looks good to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

