Return-Path: <linux-i2c+bounces-8443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2F9EC572
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 08:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C82285C4C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 07:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C3B1C5F0F;
	Wed, 11 Dec 2024 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL0F8gfF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C2179BD;
	Wed, 11 Dec 2024 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733901444; cv=fail; b=aavjzQ8Ui8SIi16cIUB4N2+mOj5oIlggaafjj/dIvV7XT26iwmh1toZOTilUSamSTLIBVQDlFMwRwuYp/+zIx4BzSV8V73VLaNn+HNo8oGAh5PCevlRhKszf1tvzh1r5qATh6oVNyFnXxqj4uZMT7FzlsEqMjeKB++SNpYguuPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733901444; c=relaxed/simple;
	bh=ziJ3/torFBicaLGRLBAW9VCWLN4GwsT93cmSBZYtTdg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bjsqj1Xh5Mv1IoClQNbmLJy/dDjSBwXt8/C2TKaj5o1Vi4MjBFt79w/FlP+sx1ET3P1savjnAc+8xrPewKR5q8fk6pVvuHfXrdCQ9ILYxc44+w9q0x19e1G+PGpiDimGJ47DmBdaf/bAt5INiryVMopMi8yVm465Rn+291WoKtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL0F8gfF; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733901443; x=1765437443;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ziJ3/torFBicaLGRLBAW9VCWLN4GwsT93cmSBZYtTdg=;
  b=eL0F8gfFh1lNx3y2prtwpMdExWqxNamMHv9bc0gfo2YzrbNuY9gk/dWD
   ieEWTyV+VWzab3SZPgGcwoYifyPyBhAf2tRmqpnJQ1syTkr3prNgztX8T
   t9ZcGpBxtnp74qwB82Wcelg1A3QWlIW7TaNYPeSmrW1ymENoNRXkKn16B
   hcPIyFwmFahFZG/kwUzRekUXyRs9//xDanP5tD77wu7fEvl47buMg33yf
   rBSWC6PgOF/sS+G92ItpsPT7NXmTD60cgDrBY9bUyaSLZhpKJi5jC1Q7w
   x+8/Huz4OhbPuoqIy0kGjex3qe3xzSLwirwjXgePUzj1l2/sZMFefkJv7
   g==;
X-CSE-ConnectionGUID: gC3SCj1vQHyD7ke6o3Fe8A==
X-CSE-MsgGUID: bGSlRWLoQmKWKVlUU88Png==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34409128"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34409128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 23:17:22 -0800
X-CSE-ConnectionGUID: M1iXyEsERJCgX24k3J+XPg==
X-CSE-MsgGUID: PlwKdUBhT2OtRGuDp41fqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126527507"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 23:17:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 23:17:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 23:17:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 23:17:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWKeFV/Juuj/RX3iy9e3DY2q7d5/GAeT3W7+JZs040wygQeX4i017lGF5/TbVovzMOHQSscrE5WMw/U56y/UtQtfNa06/wLO2lLgY5DL1OmKnZg2xGrzFkbu0NlZ/rCf3HR923LTGSJtjuVvfI8mNNQta6crKkJX50gFZLfdvVPTfklO1C5cboEmFaoZViIxat6WT5EVLbzI87CGQ4ok2p+18rx7Si1akO1NdBcDop5fr+iPbU71UF/cK2BHoDkSKlqcp6Pz3kt+kB7D4Hg/d9YwwFTYptV8FlYUfhigMv5NUCd43Cnvnr1HURDvaMkwNX653BdR21kFWM6IA5jOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xhm43gMJRddvkZ4g31K+7AJaKxsaRFKDUI5xtaXdq0=;
 b=bCEmn3PivzSo6bY3JNKUImITO+vyWPoF4KgulysgGtYfv7j9PsArIvkd6xASM/RMfg0CjNsLMNmDQJ2nsEAh32arAdjtu0SMXWq5gu2feTM/IwR1+UH9ONTAEd8FGXpsJjRmwi8FaZuEJOvvbE1nf5HG0quF3p2mdtBCZqyaBdhLMbRJZnqKATtEjiX1kk3OlWk0RmVKpklur/nSja8irPvmQWrEEqI3HQ/w0UsdGDARz0DWYrKGXFBEcSMy25MZC/1uK45f3WVRrs2EJfQSlWyoNqAIptuCnOeWfCSK4RHfQLdvyW7TGk3oLeY915r+HvVSNYYfszOIAIPJnSJtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 07:17:03 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::b8f1:4502:e77d:e2dc]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::b8f1:4502:e77d:e2dc%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 07:17:03 +0000
Message-ID: <36ad17f6-cc1a-48c2-92b6-31d2464946d6@intel.com>
Date: Wed, 11 Dec 2024 08:16:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Jakub Kicinski <kuba@kernel.org>
CC: Ming Yu <a0282524688@gmail.com>, <tmyu0@nuvoton.com>, <lee@kernel.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andi.shyti@kernel.org>,
	<mkl@pengutronix.de>, <mailhol.vincent@wanadoo.fr>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-2-tmyu0@nuvoton.com>
 <2d6e82ff-9f68-427e-a8a6-8dd31b3c94e4@intel.com>
 <20241210175623.748da1b8@kernel.org>
Content-Language: pl
From: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Organization: Intel
In-Reply-To: <20241210175623.748da1b8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0043.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::32) To BL1PR11MB5399.namprd11.prod.outlook.com
 (2603:10b6:208:318::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5399:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c06dbcb-742c-457d-ecaf-08dd19b3cfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNQajhCQS9reWtzNkNVNUh4RTFHTjlBQUgxNXpmekhLQnV1OEdwamtnQUpx?=
 =?utf-8?B?STgrYmhWQUpES2FaaFIycUp4SEVzUXVWSkh0d2FQOW90bGgvaUk4bGIzeG9J?=
 =?utf-8?B?RDRTUnZlRmoxSFVaMllPR2tNRGJmK1R5djZwOVhBR1kyblZtQUFsQzNDeFN6?=
 =?utf-8?B?c2xVdXB0YUZ5QjJ0bDNOYUxScEc1ZWpPK1N3QkdmNE8rRVdscm5qMFliZFMy?=
 =?utf-8?B?QXc0RmQ0dVNuQ2lsK0VjWTgrcjRQMHZYT2FzYlVVT0xmdGpOUWhzZWhzVnFu?=
 =?utf-8?B?U2FPcGc0MERNK1BLU2Z2SXVySUwvWXFTQ2lTSEhQRnlkS29ObjNubThLdnRm?=
 =?utf-8?B?WENKWW9pbkR1akZyOVV3R2tLb1A4bHpWWmhGUXpITW1tdGdFNmw0WVhxbC9H?=
 =?utf-8?B?ZWdZVXVMTTF1cGsyblpGUDNjdWVSc0htaDB0VnkyVGw2ZXlKRnF1cjR1TDBi?=
 =?utf-8?B?SXgvcHppVHZFMXBQVGpYZ1daajc2OGFJc1B6YU54TXBodzZJdmF5eWc2VXl5?=
 =?utf-8?B?bTI1dmgxOGNRNU9sdjV4NEhPa1dscDVlazBKMjRpRzZsYnBEN3ZQS3hVUjVo?=
 =?utf-8?B?VmhvVUNla0pOeGJuN01KUU9aRzR4bXFqS2JuRnZ3NzZLWnNFd3dKSzJWRHM0?=
 =?utf-8?B?UFZZWFp3NVBGemdZSkdYZWhQcEZLVHEyblVscEZKNW5QL21RQVIvYjU4Yjlq?=
 =?utf-8?B?SzZEV0dmZVovQnlLSHBnbThVeEpvUndnL280Mm43Z0x0SHk0ZW5xQ2dZWXph?=
 =?utf-8?B?QmZjVWhhODVuWGptM1pBVk1vQkszOUh0S3VtNHFGZUZraVlFdTg3RTEvMkFZ?=
 =?utf-8?B?eVZwM01ubndtUjgrL0NhQzNwU2VaOVUxRnZrVUpMRE1MMzVjeStxbUJ0dWhL?=
 =?utf-8?B?c3BKRHVJYjJKcTNkdUgxRTJkaGhFZGZna1hlWEtlQnZaSVdCSDdXNlJGSndX?=
 =?utf-8?B?YXJiVm9CZFBrYVVqZ01aVlFlTXA0dVpnaUdDYTZSUE5kcE5RcFBRc01nUWlO?=
 =?utf-8?B?cWFOWU1jMWI2ejNva2lhZFM5RnhMYm5MSWtOUzJlclRpZWYzT1J1UmYyNm4y?=
 =?utf-8?B?cS9KZTJUem80TTIrZ2RHWDcxbHdhS3J5Q3l2dWxkT2Z5cEtPQnVXd1EzT1pN?=
 =?utf-8?B?eUNadUs0bnhEM2l5ZFRtRjJwclVZRXBQckNoT2ZyZ1ljaHQ0QlRCVlJiL2Q3?=
 =?utf-8?B?TUJaY0RFcDRsUDFYRDlSejBmazlTWHdKajV0UndZRmljaExhTEpabjV1Uncx?=
 =?utf-8?B?ZVZiYW5NTkNRL2g1a2o5OWF2QmFZenVlcUU5ZXZUejQxbGJERHJ6WWVsaWpn?=
 =?utf-8?B?VGJXUVZMVzNwbHQzZ3FhN01FWk5vSGloNHYvaldRb3BDemh1byt2OGwvSFBY?=
 =?utf-8?B?Tkh3Q1JUNDB1c2tSV0gvK1RFZEpnaitmaU96WlhsU2V2aHorTzV2dDhQSXdy?=
 =?utf-8?B?UFpyaCs1d2MvV09RVUsveWdoY1RtZ25jMHB6ZWxsOFlEaEMwdVkwZkdEd0RH?=
 =?utf-8?B?K1JoOXJqZ3VrZDlGNDZ6dHlzc0FIaElHeVl1cTZ3ZnhHN01XRnExOWhnNWlI?=
 =?utf-8?B?Mmg3TG5NT0NrVEpEV3kwRDdrUU12WXlBNlhSMWxJbEN5eEI5SG9TNXBKeG1I?=
 =?utf-8?B?ZlQ0Y2s1eWFFRmJvUWFzYnFNa2ZXNmVLOVpZMHZocGVzMHVoWUJJbVpOOTdF?=
 =?utf-8?B?N3BaTVdhNkhQMkxmMGZHOEZMTnZobm5DaFR4Z1EwRllNS3F5ZmJ5WVZudTNs?=
 =?utf-8?B?RXUzRzVUaHVrQ3djNjRrMndIOGhPMlZSSSs1WFZqeG9mVExIRTRvSytVdXNU?=
 =?utf-8?B?SXZ1Qk93VlhHMzhxcSsydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWZuOTM0K2hBMVg2dXBoc1hkdnpIdldkMUtka1F4WjZvUHB3K1gvblk0cHN6?=
 =?utf-8?B?WkJWa0dCR294VTVzUmF3VnRrS3lOalNBUW1IZTQrcGlOd0JseHNDTkVkWkhY?=
 =?utf-8?B?WEp2NUV3eHBCNGtNOXBnL1lrUmxWVUFlN3BJWlpkdjVkWGUxSm8zUzUxeSs4?=
 =?utf-8?B?UHBHNzNUbDFPaUllSnY3bDNiREZWSjFuVzlQTHFEQUxldStKQWdodFNTbEkz?=
 =?utf-8?B?TlFLNGdiMWF3TldscWxMT3dUSDZnekdNT3NNRWtRODJhalg4QkFPUnltR3hh?=
 =?utf-8?B?cm1CbU1nMU9pdVM5UUxQcS90NFJRWG9mL1ZJZ2Q4cnFSbjRzWTl6Z0I0azlm?=
 =?utf-8?B?TXZwclZCWWVjelNlUVJtZ1ljWjMwTk1FcENNejM0QUJQZExEZjVpekV4RVFt?=
 =?utf-8?B?cEhzdmFaTW11U1JKMkFPek9WeTFWUmpqZ2kwUW9uQlZkOTJtTDlwQ09XMWN0?=
 =?utf-8?B?YnNiTGs4K0d0UnR6a1g1eUNHYVNnaTZoL2E5Sis4aWE4VHFkOVhtWXVzcTFj?=
 =?utf-8?B?MXlaYWswdVFTeW03YkNtcm5XQU5NcmVuS2lhUzlHaVlZdUlRVUZ3RVp5VFh2?=
 =?utf-8?B?eDJaK2xuZmVLVTVUdHZKMEg4WS9qZWswTGM1c1BqT0ZKNy9VY0ZlejE3V0lu?=
 =?utf-8?B?R1NsZ0V2eXNjaHJoaEdtQWVEaEtlcFVmUmNqZzlTTWl6SUUrbUkvOXU1TmtN?=
 =?utf-8?B?VysxY0N3cDhmTFFoQndkRS9rYUQ3Q0lRNzhqa2txRXd2UUt4Wk02UUdkRjIz?=
 =?utf-8?B?dDQ3Ukg5Qjg0NHpqdlJNaVhzQjBaSzVIMmZ5QmQwbGFzMk5CZWc4ZlZKS1lq?=
 =?utf-8?B?ZkorMzZMcHlRRUtHVzZQa0h1TVp2TllNeFVpVS9IUVBRbzh3TE55Z1pVcVo4?=
 =?utf-8?B?YmtJY2F4UFpIK3J2cjZUbVdHdEhGN3cwektKSmhwUVdudEVCa2pvVmdoRnBN?=
 =?utf-8?B?c2lhS3Z4OVYzNzZiMUE3RzhqbnZ4VW1lYzl0Nk5WRll0ditROTROdnkrQUU4?=
 =?utf-8?B?ck9Heit2Yi9XNFdLazYyZ3lwbkZPNGp4eCtQRDRiUmxzNFVwOG9qY3NUeDVI?=
 =?utf-8?B?YXpUcXJpVnZWQzlZMnNrMXNUcTNPU3VpN1EwejhCUkg2WUkxbnNjVmRET2Uv?=
 =?utf-8?B?MjdCTEFRTHJFZHNubVRna1ZNVHd6eWo3c3QwL1dvMGFhM1NNKzlCblRMNEUx?=
 =?utf-8?B?RnU4Wm9haDhSdDJXanVIemNHRXJZeW8vZU1LWWJxOVZlbmdZVW11cG83MWwz?=
 =?utf-8?B?VlJiRk5QbDZUNlZZZ2czeFpiNWFLUWpUVU1ZYmJremZHMW9QQnhHTEE4MUNL?=
 =?utf-8?B?L29TMDhDcmVYcC9lOVhHc2VXRy9vL3FuM01RRkVBUGZuOWlVUFlQcmpLVE5F?=
 =?utf-8?B?b0Nvc0UwL1R5RlkwRkdndVJnQTZZSGlwT2dwUUJYa1pvUld3R1VZa1M5eVJ1?=
 =?utf-8?B?WFFBcmZ1VHlPbDdCMm5qOTdkdVhwb1dKcktyNi9UOWR5Y3FHZWFaTjFRTklt?=
 =?utf-8?B?ZDJ0NUpNaEF6bUZIcG9udllSaytoMTVZbEY5L3EveXZRZWZFRHNPQlJhSVpj?=
 =?utf-8?B?UlBHUXFQYTlvT0VmUjgwdXdBTnY3RVorWFBKVVN1VFc2anRXZVk5Z1NHRGJK?=
 =?utf-8?B?VkliQzlieHNUNUEvT0xBQWVLTFd3UURzbmVVb29Eb0FMbk16b0NJZW9kYWhz?=
 =?utf-8?B?c25LeTU2bGp4R2lMU01VTGQ2WVB3T1RHUUk5eks0WStPNmMrYmxqK0dIWmsw?=
 =?utf-8?B?YnFqNXJrbDZIUmJ0bXNwQTNKbGRlcDl2ZkhCbW0zRGYyVkFIUlpzcE9NdzNX?=
 =?utf-8?B?U2FGVUZ5TS9zM2VmUXFRcU0rNmZ0eHlLWXB3Yzd5S1JpVnhiS3JRNm5lZk5p?=
 =?utf-8?B?OXlwbUlUV0lhV0Q1Uk1XWWRYMnVOWXYwUy9RelpwKzJZaWhINEtrR3dRNnND?=
 =?utf-8?B?WithOGJvbmtETTdhamlPVXRaQ1l0Y1Q0MEdWMmU5TGlWUTFrR2U5Zlozcm5Q?=
 =?utf-8?B?ckQ1b1R6MkI2aHZkUjVWczFWVWJxRTVPZGE4NHFXcVZ0N2dNbVpHcFl1Vk55?=
 =?utf-8?B?T2QwZk80VWdPMVdwOGlhWUlPbmNjb0RiWmlaTW9lUjhzTGx0NlkzL0tadGJQ?=
 =?utf-8?B?cDE2TVhTNGo3dDNWbnlmcjEwUS8vaklTd2xBR25abzgwWTVCOVBsdSt4K3pt?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c06dbcb-742c-457d-ecaf-08dd19b3cfc7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 07:17:03.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7velYHtOshHjQKVTGsNED+AgJJ4c5Lli8pB9ui3XkGO739P6ayCTHhX18riu3DBm2Eavem5iHspcZMJ8UW4na8iB5a2viJe8GBJhyxydxFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
X-OriginatorOrg: intel.com



On 12/11/2024 2:56 AM, Jakub Kicinski wrote:
> On Tue, 10 Dec 2024 11:57:41 +0100 Mateusz Polchlopek wrote:
>>> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
>>> +		     u16 length, void *buf)
>>> +{
>>> +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
>>> +	struct nct6694_response_header *response_header = nct6694->response_header;
>>
>> RCT violation
> 
> This code is not under net not drivers/net
> As a general rule please focus on functional review, formatting and
> process issues are harder to judge unless you read all of the mailing
> list traffic.

Okay, my bad. Thanks Kuba for explanation and I will focus on code next
time

