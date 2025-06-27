Return-Path: <linux-i2c+bounces-11677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04460AEC20B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 23:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4022E564DBB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 21:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D513F279908;
	Fri, 27 Jun 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnDNs+dN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A42797A3;
	Fri, 27 Jun 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059803; cv=fail; b=AYfyKtiEAJ0tZ/L9ITVqeoNYwBYQfNoQfMI5GQPwxQgo4rb3czMAp51knCXBCVTt1CL0ZhfeOhKMsQQf3Zc8zbqQpNG57g2xJzALM864BrArz1NXODCqOa7SC6csp5DjgNm1bPinCYDPcjcDbm6dfUUk/AsuDe//wIn+iUcmtlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059803; c=relaxed/simple;
	bh=xVUQIACdl+asOy4y6QkaiCladlqpGhH9db0uLNt0JJA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cKiMIdiO1RzbXDqzvsEQ3CAVj5iZocjXLo8QUDdGJOykXS2/W7KTWMuMsJLqbMwJhnBQywnY+4gwxcKGx9K+kF1YOvbxDHkjZF9ESwuUdQR80DoT4qHw5ZliKxbWLEYzw5ZPI9c5FCiY7bFnR+O7QUsArOimK37dsETJmZbUiJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnDNs+dN; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751059802; x=1782595802;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xVUQIACdl+asOy4y6QkaiCladlqpGhH9db0uLNt0JJA=;
  b=OnDNs+dNzxQS7AbpslLxpXWxrxrc/CZ8Uynx7Nu1ZJeMkqZt2DvUibmi
   vmODwsQAgrwAlmy2vIUsTLnFM2unXS2Ihk9ps/ydNQoSf4HvK67ociZJN
   zkhKC3iLhKrovCVqLofn1NaoEVHbDJYwUQgS5E8nhMV2hImoMrxzJPwjF
   EARXCu6kgdXzG0YSYUl5O8mY+IeECVXOo3zniWMMESRQOoupSNS3mXUWl
   SGm9KXGg3cbLuPcB7YwKdaC/4MxPdAf1nhhx345dTBf8WfZQia9s1fZN9
   jtDYBRO/vQbKO6bywctpwhLqATEz5Ros6NB0kGMH1GzmP/hJ5rObiYR0M
   g==;
X-CSE-ConnectionGUID: bMh2FmO4RUei8R34aDxc8A==
X-CSE-MsgGUID: 66K+OjB1RuuMOjTNXfWnnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52610410"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="52610410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:30:00 -0700
X-CSE-ConnectionGUID: LYTDfCpoSbSg2tj/Dh9Ujw==
X-CSE-MsgGUID: K2K+i7qtRLGXpNJT7693MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153450756"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:30:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:29:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:29:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3PQhptR9ud7Et0fGw9em+v0iYDg+NVS+ROVL2rg6HiuHrEoVhl0mtB1ic1COdHEsTXMATw5Xc6YwScsE/MNdt8zorU9N8dn/EUU3WTTwkgkX91YORdz3d1+3j5gqV4OmmU1kYtxisdvFoX2y7TbJx5/P+VfNF+Qs4rM6xg+im/khErJh5cfghkkaEhKTqbp5B16gYeyj2bLac5pjYBxoLhP8yCtimkyCm1SpR96JUZGTwSOqRy+OTgdK2xCKZmPkEa9JEIIUhYHS5XsmV0GXoUMhyKL3IykafLVZRpptIWCnx1BUsLactOYHureZ3r8LlWMFsACYfBXf0bSkXbFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejdHY26fn1BdsW+KLbvOerkiIM9bTcXodJ4wDkTcXTU=;
 b=gjefAGPVxZohFmkLCCQZUIQukXNh+M75eNkN0Qj+I+XpQOD+vuUWgq9qn7iVzeNPIQADR/z62t43h41iA/MR1HX0xVzWyp9WzWBj8i2g9CqLAOLb8RzoeZ8/wuj5gqCfgOcOSXr1OEQOzPZzn24X3TBQLBR7t3iCNWVM0rRPi0A8ycY3WP70jGj/f2uTBOh3N5dpdQ5iKw0uokL7uoVN/8f+Q2xYAuTerQRIT7uoqpqCGO320oCvwMS1TecEQYVDCWnxl7duzfGEOLzw8igRRK5GGGtj9EeRLqtODAGbQasdI6f4RYk4HYhmxjYxPohtdnIp4LAuEGZDGd1s/KztRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 21:29:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:29:55 +0000
Date: Fri, 27 Jun 2025 17:29:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Jarkko
 Nikula" <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana"
	<riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aF8NTuKbOv-bwZuH@intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-3-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-3-heikki.krogerus@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceec5c6-8d04-48a2-3eb2-08ddb5c1c2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JKrvZCm6arpVj34s3IGblQGXxCwE5nk9JYby1gRqPMpzIn68NOUvyjGFRQT9?=
 =?us-ascii?Q?j7Tb4guv3Z3NqV3OAHYZYnFsJviYUoWqbtybNqYND7xaYGTkXTtGmq7htKo2?=
 =?us-ascii?Q?CmzkpfjkCr0fwQZWKxjXh81Af3iVY5wd8vKcTvUb80UPPzeeNMu2aJEVCZIv?=
 =?us-ascii?Q?usnO3b8iz0lH1hf8JMGMyCtVUBxtXWTgvr40Dez2mNfqwTJzT143U5aq7Z8g?=
 =?us-ascii?Q?akeWNji2K6wWcKVPaaP6ZrFasZZ/GXwzZBKcMKCVPtvV2c2ZYtEdbD6n00+E?=
 =?us-ascii?Q?xLGEIEoaALH1dbC9l7jmFCjD7TFwHYLqZWAIxC0AA23a52iPFJgh81cynwFv?=
 =?us-ascii?Q?WCx7xIngpUuazMDXiM56XTMrEj/vrO35rRt7rUA40MLCz3GlUX0X+HZxrkrA?=
 =?us-ascii?Q?HL69VGtFN/bkcVkUYVXiU4HKm0n5vH7mV2M7ewvli1puet7vWpXLpHnNtXyW?=
 =?us-ascii?Q?VGt7FGyixa+FnTo2hKo+Zw2XwDpRLda9I/eVxsgmYoo5+VGg+MPdfr+XKMbG?=
 =?us-ascii?Q?fdPxembyFGY7VeY8ZJFCnuXUfW868FNq7eGfd/nH2qK8soW108VvTwETzxWs?=
 =?us-ascii?Q?3UoUtuRjZy6XaC5fth268vyLsa51l4WQJpXchQv3Mwe+J2aDLPrS5h4OZjkb?=
 =?us-ascii?Q?bV+F/2cUSkmUFQ3aPhJuB2Iy+zFD6F9nK1Ull0yFtCJ7vI9eTTUE7A7KCbsI?=
 =?us-ascii?Q?JHQnFBEKqgKb3m+Mnmxm4vQEz7e6UGqZ1nRkNuGfg9kkAQQPiIE5vOUAUvZK?=
 =?us-ascii?Q?EIBiD7Ub9ZXkGFEOBo6R7sABP6l3y2yg8Z28rDE7cmG52T9H3GSlWnKwVjCR?=
 =?us-ascii?Q?8IJVfUNuaqkVkuKP9mODJne18z6kROhtHh6Q0u6WDcf9ECl2aSMlcK8dQNV8?=
 =?us-ascii?Q?tAD8TrmYSg4bP1r3S/SmbbzZU06D7HCwEG5cHuxXRoB7nvbS4UBI0QZuemA2?=
 =?us-ascii?Q?1C/lsEy4COJYJ4L5ItQwIvpRpuA8vfbPqWLvOsjHlxCOVuZuH6FrqHgsAGT6?=
 =?us-ascii?Q?7hJRH/GT3PhiGK5JV7FXrvJfBtdSoCSfeB1c9QNwiZDdVLKDogQGLoB2CrPx?=
 =?us-ascii?Q?vW034+9dX0KFgfpMOyoSlqYTmAl6OXq4eUnVjI1JIRkyUOhhCOcz7LbkGxcU?=
 =?us-ascii?Q?MPw5UsI7OBP0BbRAzj6ccon6W/EUeZBMOneWKrHn3co1jsZQbXGv93JU1Goo?=
 =?us-ascii?Q?yE3b2GoAogQndd3R4SZINdqkps69ZS2nBAc1jKGNYgxi54D1lCgpAmXLG/PB?=
 =?us-ascii?Q?R8/5d0RAtBKwylcr1bTP5ppulT7yjeB7xJKQWYtnNBS1TuzwFo5WRXtkbE+M?=
 =?us-ascii?Q?Q0XBJusnz+jxnIvWYsDQ2Hovb97H/s+iRhxCsLg5gX61iTbrQa5WglCwDKZr?=
 =?us-ascii?Q?98JNG4u12deN7CchCTI36XVShrUMUVZLCJtEW47iYmAuaI1TmonmRzPaox39?=
 =?us-ascii?Q?bNl/+Oeyfg0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b6atskYUfuY6lA4MRWaJJT7OPOWPPHgHzxuDY4S7Se8X19MioYgpM5NYPaJl?=
 =?us-ascii?Q?djdUJmgsJsH8y4VQZdooUsRGXZfFvOFwpfuoXi7dyaWZ0luPnv6LE9lCwdx+?=
 =?us-ascii?Q?zm7oUIJ7LciPvZpB20Vp2cMBIU0iwCkCB4kJhLyjwNWsrye1OnIGzkOYAs1v?=
 =?us-ascii?Q?q2vhrAjZuqDtmupjn/8bX75E1FXke2BG7MCnkC1uGvzWg9+zKLxJfEj9Z8+9?=
 =?us-ascii?Q?mHB9twg6O+ogAJrzkt3HsWT3FJchBPZctwwr/6HrMbv4v25MXyXkWe45QZK+?=
 =?us-ascii?Q?qnLq9yBiC244L/dVaT38e0rQEvJThZEf0Y5e7mnXVG7SZPLrICe5zKZTPNQi?=
 =?us-ascii?Q?MrCCb1TZYSJ2P30JxLKJjitEaIKrjIedvAS4gBjIeasBoH6AY8NKnq336aCd?=
 =?us-ascii?Q?/jjGrqwa0h1ryVns95rrLBE2R8c4kit5MGemtB8lSEVpAO/kmW7lUFMgIoch?=
 =?us-ascii?Q?Tb7GghnfSFHaARWUS1U005xJOFSLvgcQCDDKbR+j4M/FPCr6POD+BqbgV3pU?=
 =?us-ascii?Q?GiVCPl1+Vck5ylSvnPruJJyEd8UABpWBaqN9Vn16JmF8h6AXRpkdiBGnupYi?=
 =?us-ascii?Q?5dNAXAb6jpKVovhr2CxNybzRJorVJ5a4blH+itth8DEYo1fxtn3YAQ3koVeX?=
 =?us-ascii?Q?iBeBgbocCkLNcj02nPA2Qf9rtPPKrKu7gajvhs58mi+toSH7K135gzA3xdtu?=
 =?us-ascii?Q?Tio2xP93AJROADmRxCE2UAMyGOE9q6OyO8/YYFLO8IHsySacM4eCB9If047R?=
 =?us-ascii?Q?kuBBwZcCXNbfJPuekqjGexaSVrWrH2qnuPtK636lejL2nCYL3GpNGm99WWXb?=
 =?us-ascii?Q?1vG6WlWzPXqZmIku5sMzBDNBV2X4f3V5tLc+HccPdZNeRGCkW8DfJQGWXzwu?=
 =?us-ascii?Q?CxJYHhZRENTz6i1DdN8nVfWLXc7pxNMGPyHbmFeNhOpZFVlJp6PDcd6P4JFN?=
 =?us-ascii?Q?C5Bt+2d16RbSTPdm61sFo8iiysnfq/EUcE3ozoxawZspY2NSPyJ9Kmgkyrwj?=
 =?us-ascii?Q?DBthOkbj7OHHx0tPM4C2cllPPE0En7CUWPfn8/uPXhVywWVx+V+Mm/zCb34Q?=
 =?us-ascii?Q?nWeEvdBwftWwTC3kBwJQMhhmpcTmmS+gwgIIqk74pOtimoarD0JVwK/jAT1A?=
 =?us-ascii?Q?miOqCofu33TPdElqlO2o6Mfz2zZoP+mMpSkwWnnzMlMRw0C982Wp1QfvmfGM?=
 =?us-ascii?Q?RtcvvcvsrK6/C73NyPPaTqw6xlETE4FEGNNdQvEiG+bA8ROfAuqMEJ0LrBDI?=
 =?us-ascii?Q?1jnA8uH0FRBT/kBN/p959QRb8YT8vwZcYBjWCkMoy9dA+HDB/zxw2m9XpoeK?=
 =?us-ascii?Q?LD2LiSAb9Gp3bRIuKsjprxutdU4aKZmtEKVRbK0dg8Fg6YMRMyuqGjF7qybV?=
 =?us-ascii?Q?+91F1fMJoFKIIcmDJGYHfwc1Aj4rzhVtvRkSAnuSzF/qPzoE7oqTaOhxz+Nc?=
 =?us-ascii?Q?Jext185SOEEE79WjierWF88+8NH4728vgmmgEm0lPXEs8jCax0S9uuW4kaXL?=
 =?us-ascii?Q?Hdv9zq1TM1dEY4zifqTP23gSWloq82tf1YYdcAWZGHdJCZsgA2z0fIeFlSHJ?=
 =?us-ascii?Q?6XeFY7Ba4yoOQL+dFv7oRJYv6YN+VZQSGdBMc9JyAYrTDYgoO3YxusbAx5NZ?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceec5c6-8d04-48a2-3eb2-08ddb5c1c2b4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:29:55.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5tKJuHStIjPlhBPRcztjDdlyfz9k+CBao90yPe8M1sbnT07YS6e7XHFnFwrlTFYWMcesE2fnCpzxFXO3GgFHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
X-OriginatorOrg: intel.com

On Fri, Jun 27, 2025 at 04:53:12PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).
> 

I hope all Andy's comments got addressed here..

Mine's were. Thank you.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig            |   1 +
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  15 ++
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h      |   2 +-
>  drivers/gpu/drm/xe/regs/xe_regs.h     |   2 +
>  drivers/gpu/drm/xe/xe_device.c        |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   4 +
>  drivers/gpu/drm/xe/xe_i2c.c           | 300 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h           |  58 +++++
>  drivers/gpu/drm/xe/xe_irq.c           |   2 +
>  11 files changed, 390 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 553c29e1030b..eb361c202581 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -44,6 +44,7 @@ config DRM_XE
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
> +	select REGMAP if I2C
>  	help
>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
>  	  for Xe series is also available.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index eee6bac01a00..4b8a8fcd3959 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
> +xe-$(CONFIG_I2C)	+= xe_i2c.o
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> new file mode 100644
> index 000000000000..92dae4487614
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _XE_I2C_REGS_H_
> +#define _XE_I2C_REGS_H_
> +
> +#include "xe_reg_defs.h"
> +#include "xe_regs.h"
> +
> +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> +
> +#define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
> +#define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
> +
> +#endif /* _XE_I2C_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index f0ecfcac4003..13635e4331d4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -19,6 +19,7 @@
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   DISPLAY_IRQ				REG_BIT(16)
> +#define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..2995d72c3f78 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -5,7 +5,7 @@
>  #ifndef _XE_PMT_H_
>  #define _XE_PMT_H_
>  
> -#define SOC_BASE			0x280000
> +#include "xe_regs.h"
>  
>  #define BMG_PMT_BASE_OFFSET		0xDB000
>  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 3abb17d2ca33..1926b4044314 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,6 +7,8 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define SOC_BASE				0x280000
> +
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b73cb72bad1..6db09cfc8eb8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -43,6 +43,7 @@
>  #include "xe_guc_pc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
> +#include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -902,6 +903,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	err = xe_i2c_probe(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7e4f6d846af6..ce0c4ed834b8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -34,6 +34,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
>  
> @@ -583,6 +584,9 @@ struct xe_device {
>  	/** @pmu: performance monitoring unit */
>  	struct xe_pmu pmu;
>  
> +	/** @i2c: I2C host controller */
> +	struct xe_i2c *i2c;
> +
>  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>  	u32 atomic_svm_timeslice_ms;
>  
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> new file mode 100644
> index 000000000000..172271469ceb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -0,0 +1,300 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Intel Xe I2C attached Microcontroller Units (MCU)
> + *
> + * Copyright (C) 2025 Intel Corporation.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/notifier.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "regs/xe_i2c_regs.h"
> +#include "regs/xe_irq_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_i2c.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +
> +/**
> + * DOC: Xe I2C devices
> + *
> + * Register platform device for the I2C host controller (Synpsys DesignWare I2C)
> + * if the registers of that controller are mapped to the MMIO, and also the I2C
> + * client device for the Add-In Management Controller (the MCU) attached to the
> + * host controller.
> + *
> + * See drivers/i2c/busses/i2c-designware-* for more information on the I2C host
> + * controller.
> + */
> +
> +static const char adapter_name[] = "i2c_designware";
> +
> +static const struct property_entry xe_i2c_adapter_properties[] = {
> +	PROPERTY_ENTRY_STRING("compatible", "intel,xe-i2c"),
> +	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
> +	{ }
> +};
> +
> +static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> +{
> +	u32 *val = ep;
> +
> +	val[0] = xe_mmio_read32(mmio, REG_SG_REMAP_ADDR_PREFIX);
> +	val[1] = xe_mmio_read32(mmio, REG_SG_REMAP_ADDR_POSTFIX);
> +}
> +
> +static void xe_i2c_client_work(struct work_struct *work)
> +{
> +	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
> +	struct i2c_board_info info = {
> +		.type	= "amc",
> +		.flags	= I2C_CLIENT_HOST_NOTIFY,
> +		.addr	= i2c->ep.addr[1],
> +	};
> +
> +	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
> +}
> +
> +static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
> +	struct i2c_adapter *adapter = i2c_verify_adapter(data);
> +	struct device *dev = data;
> +
> +	if (action == BUS_NOTIFY_ADD_DEVICE &&
> +	    adapter && dev->parent == &i2c->pdev->dev) {
> +		i2c->adapter = adapter;
> +		schedule_work(&i2c->work);
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> +{
> +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> +	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> +	if (!fwnode)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Not using platform_device_register_full() here because we don't have
> +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> +	 * uses that handle, but it may be called before
> +	 * platform_device_register_full() is done.
> +	 */
> +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> +	if (!pdev) {
> +		ret = -ENOMEM;
> +		goto err_fwnode_remove;
> +	}
> +
> +	if (i2c->adapter_irq) {
> +		struct resource res;
> +
> +		res = DEFINE_RES_IRQ_NAMED(i2c->adapter_irq, "xe_i2c");
> +
> +		ret = platform_device_add_resources(pdev, &res, 1);
> +		if (ret)
> +			goto err_pdev_put;
> +	}
> +
> +	pdev->dev.parent = i2c->drm_dev;
> +	pdev->dev.fwnode = fwnode;
> +	i2c->adapter_node = fwnode;
> +	i2c->pdev = pdev;
> +
> +	ret = platform_device_add(pdev);
> +	if (ret)
> +		goto err_pdev_put;
> +
> +	return 0;
> +
> +err_pdev_put:
> +	platform_device_put(pdev);
> +err_fwnode_remove:
> +	fwnode_remove_software_node(fwnode);
> +
> +	return ret;
> +}
> +
> +static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> +{
> +	platform_device_unregister(i2c->pdev);
> +	fwnode_remove_software_node(i2c->adapter_node);
> +}
> +
> +/**
> + * xe_i2c_irq_handler: Handler for I2C interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Forward interrupts generated by the I2C host adapter to the I2C host adapter
> + * driver.
> + */
> +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	if (!xe->i2c || !xe->i2c->adapter_irq)
> +		return;
> +
> +	if (master_ctl & I2C_IRQ)
> +		generic_handle_irq_safe(xe->i2c->adapter_irq);
> +}
> +
> +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> +			  irq_hw_number_t hw_irq_num)
> +{
> +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops xe_i2c_irq_ops = {
> +	.map = xe_i2c_irq_map,
> +};
> +
> +static int xe_i2c_create_irq(struct xe_i2c *i2c)
> +{
> +	struct irq_domain *domain;
> +
> +	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> +		return 0;
> +
> +	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	i2c->adapter_irq = irq_create_mapping(domain, 0);
> +	i2c->irqdomain = domain;
> +
> +	return 0;
> +}
> +
> +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> +{
> +	if (!i2c->irqdomain)
> +		return;
> +
> +	irq_dispose_mapping(i2c->adapter_irq);
> +	irq_domain_remove(i2c->irqdomain);
> +}
> +
> +static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct xe_i2c *i2c = context;
> +
> +	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
> +
> +	return 0;
> +}
> +
> +static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct xe_i2c *i2c = context;
> +
> +	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config i2c_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_read = xe_i2c_read,
> +	.reg_write = xe_i2c_write,
> +	.fast_io = true,
> +};
> +
> +static void xe_i2c_remove(void *data)
> +{
> +	struct xe_i2c *i2c = data;
> +	unsigned int i;
> +
> +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> +		i2c_unregister_device(i2c->client[i]);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	xe_i2c_unregister_adapter(i2c);
> +	xe_i2c_remove_irq(i2c);
> +}
> +
> +/**
> + * xe_i2c_probe: Probe the I2C host adapter and the I2C clients attached to it
> + * @xe: xe device instance
> + *
> + * Register all the I2C devices described in the I2C Endpoint data structure.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_i2c_probe(struct xe_device *xe)
> +{
> +	struct device *drm_dev = xe->drm.dev;
> +	struct xe_i2c_endpoint ep;
> +	struct regmap *regmap;
> +	struct xe_i2c *i2c;
> +	int ret;
> +
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return 0;
> +
> +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return 0;
> +
> +	i2c = devm_kzalloc(drm_dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> +	i2c->mmio = xe_root_tile_mmio(xe);
> +	i2c->drm_dev = drm_dev;
> +	i2c->ep = ep;
> +
> +	regmap = devm_regmap_init(drm_dev, NULL, i2c, &i2c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
> +	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_i2c_create_irq(i2c);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	ret = xe_i2c_register_adapter(i2c);
> +	if (ret)
> +		goto err_remove_irq;
> +
> +	return devm_add_action_or_reset(drm_dev, xe_i2c_remove, i2c);
> +
> +err_remove_irq:
> +	xe_i2c_remove_irq(i2c);
> +
> +err_unregister_notifier:
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> new file mode 100644
> index 000000000000..7ea40f4e4aa4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _XE_I2C_H_
> +#define _XE_I2C_H_
> +
> +#include <linux/bits.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +struct device;
> +struct fwnode_handle;
> +struct i2c_adapter;
> +struct i2c_client;
> +struct irq_domain;
> +struct platform_device;
> +struct xe_device;
> +struct xe_mmio;
> +
> +#define XE_I2C_MAX_CLIENTS		3
> +
> +#define XE_I2C_EP_COOKIE_DEVICE		0xde
> +
> +/* Endpoint Capabilities */
> +#define XE_I2C_EP_CAP_IRQ		BIT(0)
> +
> +struct xe_i2c_endpoint {
> +	u8 cookie;
> +	u8 capabilities;
> +	u16 addr[XE_I2C_MAX_CLIENTS];
> +};
> +
> +struct xe_i2c {
> +	struct fwnode_handle *adapter_node;
> +	struct platform_device *pdev;
> +	struct i2c_adapter *adapter;
> +	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
> +
> +	struct notifier_block bus_notifier;
> +	struct work_struct work;
> +
> +	struct irq_domain *irqdomain;
> +	int adapter_irq;
> +
> +	struct xe_i2c_endpoint ep;
> +	struct device *drm_dev;
> +
> +	struct xe_mmio *mmio;
> +};
> +
> +#if IS_ENABLED(CONFIG_I2C)
> +int xe_i2c_probe(struct xe_device *xe);
> +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> +#else
> +static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> +static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5362d3174b06..c43e62dc692e 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
> +#include "xe_i2c.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_pxp.h"
> @@ -476,6 +477,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  			if (xe->info.has_heci_cscfi)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
> +			xe_i2c_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
>  	}
> -- 
> 2.47.2
> 

