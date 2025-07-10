Return-Path: <linux-i2c+bounces-11904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CAB0077C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 17:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4AD317BF86
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A427C844;
	Thu, 10 Jul 2025 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLe5pAVF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC83275B18;
	Thu, 10 Jul 2025 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161981; cv=fail; b=M/lFfBbkry0Scpn6J+827qrsw5sNW71+B0Lz7QpxNH1gXIhHOxrm4A4Lor7jiX+EoQiBkmrmiGKjS7uSkCGqT9lnWHg69ETnEKAFZ3ZdklUXVCdFX4VWH0mw8Rq2GQhYCwyuUo6YJIabvO7D/QP9tNI9/6PBuevB/wJvhn8VXLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161981; c=relaxed/simple;
	bh=IIFIZP7b/PUPnlC5kBc3FCjIEWUzEOTJTfXaJgAOt4E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kAMvxbqPHP5cx8HANWcWiKcudOqTImR8ZNcM3PPK/k9plMf9PRFmicdLdY2kUavMn9/wT6ZJDcsqDoQc5Y9hpStRjmPbw9NLd+N1yLZuYiEsxtzsv/UrK1BBdMUEI8Yi3V8AGa150PEEVsLeSNxK0OUQIrmD5oZyi47tLEHQz1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLe5pAVF; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752161979; x=1783697979;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IIFIZP7b/PUPnlC5kBc3FCjIEWUzEOTJTfXaJgAOt4E=;
  b=QLe5pAVFeaPzcbmuULUTuGI33AHHfKZk5bkjNvzTJjs828rY8E5jzSF7
   Sv6wtll5frX8LVIbgZ33+3fWwxZxqCIsGEpwwz4/csFG4DwfAguHrCdp7
   bwn6CjwIb6OBX3l0In2JTPP+MzzVfcmJg1LjfryXFL5TZ38wQeu6yF161
   70t3wYJ7QFQTRjpwiql04SLomhhqYK0FJNLL9wqusNcy5e30Ic1KQkW7m
   ymYEB4ynQwUvadYiGdSWygWGvhEEUhY8oLcetninqn+eZHWpgZR1eYZ6T
   uYLpsdUeiKxGDMWA0T9mixbDTaZvETI8cnHV4U13AV57v3/ap+NpPfwtw
   w==;
X-CSE-ConnectionGUID: Bn/M6pCXSBmfNigYIB8vFQ==
X-CSE-MsgGUID: PH+BaXWdTxqgLe5tPrfEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65028326"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65028326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 08:39:37 -0700
X-CSE-ConnectionGUID: 7DIx2tR/RsCSuev455Y/BA==
X-CSE-MsgGUID: OPhgVbVjStS38UlFGoWHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="161693412"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 08:39:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:39:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:39:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkFYGsHw0gE0tSqa3Q/7wKTejwMI2XPY3V01kOLbyk14k7X05wg0/2nidVhopAIpZjBumyrRuSRg6EUJJn1wRyAkLbXsr0LMud1URv32pVlsnj83/2AIbTsVWbVd2DTdGKGwOFJVdFe5Uqs1pVbIrqo8RFYax4trpMlslhq6qcDT/MKcBjRWApLkyzv9KsxVWXoBnNcumYmQCnKew+r51+1khMhScSmzWHvX48jLcqi/5rpwafKHbEEHhmaq8jA8Oxrow8EDlDv8Ajs712Jk9cI5kXRBL6xPKB99Fo05QyPKr11+/IZkzQA/WdK5HwAyMF2Ulo+nJCJCilkKa2iqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rpl/gsBEL758dzHLDFkJuoAQvpJrlHxQ5CRrz6G2ugg=;
 b=R/sl9MuXzDVL9K5iGEQYiaawlgEQPPE1e0i8tr6Q/N3tXLq+R+JZiIrLjpVxpzKgzfidC43BP1b0+U6m9X2PxJJqviw8PgGwpW6mNZ/f08sM+f/exuuH3kcr2bdSaSRE9nB2yrmiMwLu87P2IANUDRV5KmIdtMZueM3EnyKfip/bd1do0cUlGAUjwfVJV0U/2iWVyOxNACspeuQQW7irGE8Uhoq2fIkMb97w9VTHNFxR0ZjRtolgOHV6LyDftd/uEGUeQ7uJ89Ny5BU8IoTRSCHCwa35LkVprgRVbYPaRWzHCTXc/sJY871VvNNRuZAj6cmP2JhEjzTMHjHbpv5VNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9280.namprd11.prod.outlook.com (2603:10b6:208:56f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 15:39:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:39:31 +0000
Date: Thu, 10 Jul 2025 11:39:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<jarkko.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>, <andi.shyti@kernel.org>, <riana.tauro@intel.com>,
	<srinivasa.adatrao@intel.com>, <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/5] drm/xe: i2c support
Message-ID: <aG_erdEFxtBPg_oh@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce3ef39-566f-4f07-bfa6-08ddbfc7f651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4CHGGG3SiexK0FmjM2yiYJNYhBja5tUiR3sjnKYeVFj5AzBtl8UcumAurJfs?=
 =?us-ascii?Q?GkdS42B7d91VbLrOSoecucb3cPnxW9qZIjVgNuIi0TLNH/wNm6P37GDQ7h6g?=
 =?us-ascii?Q?G8kkl3emP08rF7Iu5PXQMkpXc8kkQiH2ePiOhavcrWXfvIPIQo6jDNosezPO?=
 =?us-ascii?Q?hHhAF4H67hpyzs3p3ypGGsDDAVZAGiFjZvvsQi7j6e7jw1voL0dfpHUf1n1j?=
 =?us-ascii?Q?0Wvq+z92acJIhVOjFu+07vUcP+bgDb/NLrPVzeczxDqkRY+/cxCsH5vizvwU?=
 =?us-ascii?Q?lNH74gvgYi2Gm5SmS9bTt2oHBgu1q1C3FkawOOxHH4kP5KWqA6rVsSF/bE2i?=
 =?us-ascii?Q?CTN6XZvgU6N/FDHYhI2YTWdr5V5hztpQx2d5AycrrsDqQ3kL9KC1uBpNt+P1?=
 =?us-ascii?Q?oOMvF2RhF2fBoMQIxa8XLIZCjy6Bi1rI9o+Fa3MDTLs42Q7c/7L2ABWGi0EI?=
 =?us-ascii?Q?xcuy5wL8spi4AjObtMA5CMPLsntqD+odXXOuN1DmWnfSHKn4QZbWWFdrqCcT?=
 =?us-ascii?Q?pfDKd94C40VU99svRORvWZVPRoMLCe2hRPSq1Cg3xrocjiU0UVCgtWFEHq84?=
 =?us-ascii?Q?LSCkXDCRLAhGkb/Fcj+VLHMmcTt8oAULuRf0xw6lKaJwi9UKNmnYLNvc1tVL?=
 =?us-ascii?Q?KW4eRvSY34u0QQ2OdJaTsvrfl71IM85YV+cEZL4MR3kpVjZN6ffaMLBMImZW?=
 =?us-ascii?Q?xlUq23yyEWWeZRwfL66P/zw+oKThoD2l5GMVAgAyqH5u3RSbUYi9CKh8qEZi?=
 =?us-ascii?Q?33IfgsaRMO+Mmu9MYwOz1kREeVjQlBb8AXbb0KPvNB9LN2vpIeWB8znx8ylR?=
 =?us-ascii?Q?u0A8fm/gKQxzGwWGgzFEc4iEuVNdTOnjtDubjEiENAkOuD3HYlb1CfNaCWFb?=
 =?us-ascii?Q?+wb6F4wH7fPD/n49PLRM8ZRdOQyVxNce+hkNIuLSsahCO9JxlJ5ftfPWBJNE?=
 =?us-ascii?Q?NFMly4aJzKuCZjCXQbDSXqpBc/pPUc1RURq9Di7tBDXXNLS8/C6FY3RTSOj3?=
 =?us-ascii?Q?4JWfRUjOie7bYkZ0asmo1GXL/d/TvJ9jy8AS22rKUUTWYhT/GGODrRpUSee6?=
 =?us-ascii?Q?DNn7MHUAczdqj4F7078OJEEkglIofRwqUWLVzGZUt/1e46Knkzh/bIoe0dP5?=
 =?us-ascii?Q?qePV2S1XC3BmCWA7DS07isIoi62M+6gpwP2HNuCfudbaKEFUbFWjze3Q08+T?=
 =?us-ascii?Q?lhXZqJlWprxspviDdZDjOmJDLRMjKh1vg/947509TB+WQ4L1y/UbtIbtSqRy?=
 =?us-ascii?Q?z864s2jMuw6nCmuWmOCB1vjp9RZfnPpG622tS5JgcZIuLPSnY7OhDZy68CYT?=
 =?us-ascii?Q?Y2X+7v4gGym2vkVrcXvLrdrIAYtLdh9BsQS8ecKXM9LQ7p03Jk4dfJt2zoju?=
 =?us-ascii?Q?Qh6attHQaYar4pGyAm5ZDjQtcM+fpnuyszIZ2QH6iodIOqHtxoFs2Ds8OwgF?=
 =?us-ascii?Q?OSpt4P5NazA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7CFB2tNW/vQW07OjMwcFOudVCBBXrWURGOkRnzunsUddR9sfywj/KzwaMsmT?=
 =?us-ascii?Q?o7laEzHPpFnEMLmTM2ONeSipk9MWMHtSbpVaiDL2Jt+L/c84gSfCMvlhEhBn?=
 =?us-ascii?Q?Qu6+dAxVWYCQlfzByaMAhhxhjvD6MY7H6szSCgQJX911YicuRi7vOZ2lFoDV?=
 =?us-ascii?Q?g2SPE6pkl2trlFou1wImqeVUu3hGdC58tzTGJRdR/CnCZ/Vpot4vGukNOKIK?=
 =?us-ascii?Q?uR5EPscqE4QQBwk4hA9C4N12edjSGati5eVesc2rvDW+cUEqLURXLgnzgQpn?=
 =?us-ascii?Q?PVN7REWPqxj/+UicdidJHoYRVTzEHUAuVpLL9cWjKvujK4ak3Hhxjr+BsvHJ?=
 =?us-ascii?Q?w7A9sF6sFaLFpyaAEUBzb6ExMtzcvL8MP7nPYg27/qY//5cuPrdY79pvrE3G?=
 =?us-ascii?Q?mZxdI5r8uK3eoj6Z7ReTuALTPvs3hgpRpgB1yU3aD6CiQ6RVNEl60H9Lq+sP?=
 =?us-ascii?Q?vGMIkQsCevzWpvhBg+oetbkKpBuPrsnCO4MGZJkazxN5xb5T9z0aWwPZzKY/?=
 =?us-ascii?Q?QGc8+CLDJ+c2w/9saPi8WarUZ10fP/yv7tUBiXf5dD92Bldh8WcRGpFXcWCu?=
 =?us-ascii?Q?1uGzdbEnCENg6hpVvrSiVLEbvFN6Km9gW/PKYhX3yba0iMftL15ZqsxL/Nyr?=
 =?us-ascii?Q?NJK2Dm9vBThTguRbLUu742LW4bdEHLTZtTxyz46wFZuqrvLtdzenJVyjoXQo?=
 =?us-ascii?Q?H0jy471pKBq03l8ecGPsQqEbr6bOCC5O/6aGEEsfoHmtY1rUe5hCiAQ8JSyS?=
 =?us-ascii?Q?PLWTOQ6Gc1uEav19n6Ks0s9Xb/cVkFK79QH9tcTQyRhWVlXU5e8OevX3qjAl?=
 =?us-ascii?Q?wOYEURW8cYdwLrPPI1qx97c4ivBii89SvHshDawU+gb9bfs4bfc50cvb/ppX?=
 =?us-ascii?Q?r4aX9TdEHEeaUubCXKIBrTAlPB/1GpUkqKoO2SmYX9wq2gACA6VKiEvl6aUp?=
 =?us-ascii?Q?WoGhS6Ch6Rht4NkzTmnTc6TaiMpi6GBzZIdhGubo+balzC7Xsvd6RrFjSGX5?=
 =?us-ascii?Q?QB1w0O1Hs7c6EPasIm9ol40WNVoe/NrjhR/zQdqM1IB+RXnAicAMBSzvzDi+?=
 =?us-ascii?Q?gJW3rHdU/ttBPkbuWK8asVBUNFtLeMluwPawYNRXKFfmUpRUb8UZLvSco+Ep?=
 =?us-ascii?Q?3DmLVN/hajzjcJg6Z9an3/+SpHauWjnFjst8XAzWL8QvOdQWr6gK7TsAR6Qr?=
 =?us-ascii?Q?VhLE7JkkOg+aJLiMqDNY2mPoYlrcG4yFQUT11KomZyCvb8AQmJ1msOhS49dO?=
 =?us-ascii?Q?MWQBh62z5hF+np5WKlmPV4By2dZS/IBt1YLNBd1v9X9Oz+QfoZSvX5CkOe04?=
 =?us-ascii?Q?ARmClmiUGn+FKyWrJf/p9thgG1n1YFLgJe0Js6eVMG5P9DZCoO3BwFiRiq9W?=
 =?us-ascii?Q?NBOKadYERwFCnjvog3gYmdc2nE+hNjVdChccsLyAWbLKPV4RQwywUPX1LSAh?=
 =?us-ascii?Q?ghwPzfWI7dhe20G9sr7J8QsiM2eqpci4uETPrGJgCiZ1TFQOmd6ZCZwEyRQe?=
 =?us-ascii?Q?ZIo6JCjUAGIROa6LO+Yhne1EDIA7f4IB6MrhByGo60jA9kqrCEI7j/wBIaQx?=
 =?us-ascii?Q?CMbL79LJsf7D1cWHjf4EWyLMo72IHo6ZXq4koT2ze0BgtrlMVRieUawXAQ+z?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce3ef39-566f-4f07-bfa6-08ddbfc7f651
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:39:31.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXFpzFej+LzWpRUHhl5SBojEQZixhpU/+sXax/u467o9/u+s2w0rEobLKJPMQ4rkls3Xk8k//mL9M3jv2ewOtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9280
X-OriginatorOrg: intel.com

On Thu, Jul 10, 2025 at 12:46:07PM +0530, Raag Jadav wrote:
> Hi,
> 
> On behalf of Heikki, since he's on vacation.

ops, I'm really sorry that I had missed this.
The first think I did this morning was to merge his series,
changing while merging, once I heard he was out on vacation.

But thank you so much for sending this as well.

> 
> Changed since v6:
> - Fix SPDX checkpatch warning.
> 
> Changed since v5:
> - The modification to the dw_i2c_plat_probe() is split into its own
>   patch as proposed by Andi.
> - I removed completely the comment from the last patch in the series
>   ("drm/xe/xe_i2c: Add support for i2c in survivability mode").
> 
> Changed since v4:
> - Cleanups requested by Andy.
> - Casting the PCI power modes to make sparse happy - Raag.
> - Limiting the use of this thing to Battlemage again. But I'm not sure
>   if this is the correct thing to do.
> 
> Changed since v3:
> - Cleanups as requested by Rodrigo.
> - The licence is now changed, but still need confirmation for it!
> 
> Changed since v2:
> - Added dependency on regmap when i2c is enabled.
> 
> Changed since v1:
> - Now rebased on top of drm-tip.
> - No longer ignoring errors from xe_i2c_probe().
> - Cleanups pointed out by Lucas.
> 
> I've also included followup patches from Raag and Riana to this
> series.
> 
> Original cover letter:
> 
> Some of the future GPUs will provide access to the on-board Synopsys
> DesignWare I2C host adapter. The i2c is used to connect various
> microcontrollers. The initially supported microcontroller unit is
> called Add-In Management Controller (AMC).
> 
> Thanks,
> 
> Heikki Krogerus (3):
>   i2c: designware: Use polling by default when there is no irq resource
>   i2c: designware: Add quirk for Intel Xe
>   drm/xe: Support for I2C attached MCUs
> 
> Raag Jadav (1):
>   drm/xe/pm: Wire up suspend/resume for I2C controller
> 
> Riana Tauro (1):
>   drm/xe/xe_i2c: Add support for i2c in survivability mode
> 
>  drivers/gpu/drm/xe/Kconfig                  |   1 +
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 ++
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
>  drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
>  drivers/gpu/drm/xe/xe_device.c              |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_i2c.c                 | 329 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
>  drivers/gpu/drm/xe/xe_irq.c                 |   2 +
>  drivers/gpu/drm/xe/xe_pm.c                  |   9 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c  |  19 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
>  14 files changed, 460 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> 
> -- 
> 2.34.1
> 

