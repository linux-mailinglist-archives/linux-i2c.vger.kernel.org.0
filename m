Return-Path: <linux-i2c+bounces-8410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A29EAEE0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21D5188B44B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716B212D81;
	Tue, 10 Dec 2024 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLvRFeCJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4ED210F6E;
	Tue, 10 Dec 2024 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828280; cv=fail; b=jD3JRpgPYAzx36yMv0FzYUUoL+GsPVv4oIyQtMpA9DSaXRraiETDLGqCMYZMMfgu0UXMfgfAOBN2WexYg2nO8B2197VemnzAvhELj17Bz3UQRMY6frayUJiiggFs44FkxJ8lZM9fXXVoorcZ4gVfnauFCnh7zxyqQB1/BAjTTic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828280; c=relaxed/simple;
	bh=NrCDn7+WX7subNSzlRGFhKL+pgs5cqK1R736/nJUhUI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VZ9HsJlbdmaxMRNahsaXMijMF7T5YFi68CQLYP2CzZJ3BPUgn/voiYqzaR/Z4GdmeS4Ly8/jw8Rhj6X0vhXevl2gWoFs1VCym9Hr/VZbTNMvvbFZ5+7EDe2ItmP1C7mU8/KyIGsipQDql6izwmcXtlOJZR45zDLFY7+urjgMbbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLvRFeCJ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733828278; x=1765364278;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NrCDn7+WX7subNSzlRGFhKL+pgs5cqK1R736/nJUhUI=;
  b=bLvRFeCJtYjUfmWZTXWhr8dFZGvxJRWGK4q4iWeB98M3zxM3/BloHIYw
   PdNEcp7pmr6Rdgi9NGZCV318kiMyh21W7Km98AeMLXOPQI0lcGnDv2aoR
   XQsuDB0N4O9lkmSbnVr5dNCz0tMfu2jPWgOHpSBE8HnYDWinn8wcFjhWA
   e/80Vo4WYq2mhVXrqrBkLYa8fsVlDDXQx0f1c6kG0kLxKH26rdWJkmqYq
   ZLR6ivaAoNtPcLaXNKn1Ox6eoB/OrVHoCbT14cVL1Bl6zeIBHc/+I2X8w
   EJKAcsPK57ZW/FGphFWjCBwhkSYbLaw72/B2iGOoFd/4KEalW1a9TNpG+
   w==;
X-CSE-ConnectionGUID: b9aLHWfYRbWIhQ8IdtyOhw==
X-CSE-MsgGUID: kqoAAuvNSfuz6uuol7TI7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34086570"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="34086570"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 02:57:57 -0800
X-CSE-ConnectionGUID: B6OdtMjHQROrAomn64WydQ==
X-CSE-MsgGUID: y/SmcbAeQLqSDeUkCIxEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="99429624"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 02:57:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 02:57:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 02:57:55 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 02:57:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSHjTfAWJLV8tQdeUQXagTA3sd0EL8Oi6Y3G9eS8beCOoKni3eEK/lFl7flzHMxQAZKNT/Hx9yKjS7gX3+66+mQkxkj07DuRyKAFEjWMtF+4O0sfsoqI2sz1JSrfB+g6nNXZBUMmDOjVcTKtz6uqiyJCCw5Q94hev25mYuz8//a2l/L/MCJCDQ9KINJ0C5ypPyXe5xCwpMeLoRktcir2gnDSUAkhphH59wD2l0GAv8j/i12clrsc1ygvr8DvH958s9jwhC0Wm/MuMoZs8sKpIkVLk/2U1FFfNx1Do1lltZkmIqFPzkWqAKeA3DNybLbIXUOL6uSYH2DGHmw/2kCEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MLPB4q2fhHOPLxghYSGGNa7XGoLMBIp8XafTKrJJFk=;
 b=AHK6hPLXqEAH0Iuh4DDOhm+58zEAE6eAHc46H4+pR/7K5MjcS+CMKIjj3XagbzipI7Lv5L+ONkoAtFLKCsOL4+UQqwYLxOTB3a9c+nCAzmdeu2UAJz9upt7zDvHXmyQk1irYzxlfLMiDrnzbSmspBBpSbo2JwFW0tMyI8/P7NX7PNDcTcMBdHUMVMRobLh9iPcuz6eUCd1lrdQ/BQnlhDxrEvFdSRpKUoC7DviStOHME7X5FI+53/YD+iBJnjvZaX0ZT+TtdFGLkSt6ttv7XJtujqH5mX33ppnd5V9MJvxQyFVcIArD1G2oI71XlEmC553xfuLEMkRw0FAXR65AwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 10:57:52 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::b8f1:4502:e77d:e2dc]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::b8f1:4502:e77d:e2dc%5]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 10:57:50 +0000
Message-ID: <2d6e82ff-9f68-427e-a8a6-8dd31b3c94e4@intel.com>
Date: Tue, 10 Dec 2024 11:57:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>, <tmyu0@nuvoton.com>, <lee@kernel.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andi.shyti@kernel.org>,
	<mkl@pengutronix.de>, <mailhol.vincent@wanadoo.fr>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<jdelvare@suse.com>, <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-2-tmyu0@nuvoton.com>
Content-Language: pl
From: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Organization: Intel
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0087.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::40) To BL1PR11MB5399.namprd11.prod.outlook.com
 (2603:10b6:208:318::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5399:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bafba5-12e1-4200-7487-08dd19097d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmtrcmlCaWVoQnVUbFNVMHhqZHFhdFNkeUlpRlpOQ0hlRk5UckxRcFdpR0o5?=
 =?utf-8?B?MFh2L2IzNEFDcE0xL0krbGxPWXgyQmJoaHZxTXBneWFGQndYM1VWZTdJMDIr?=
 =?utf-8?B?ZEhHK1FMSzlUMENKYUZmcEs0WCtUV0N1alF0M1hQL3FDVjZRM2tHRnNDY2pM?=
 =?utf-8?B?amRqR3F3UXpmM3VIQ1dYL3MrU3NhQlBDeEhWNnQwNHB6Q1JKVTRvTFczalN4?=
 =?utf-8?B?L0c0czJiN0g4bG1oSlBqaGgvS1QwYXp4NXFkdkdkMkcwOWdkMGJpY1I4Ykl0?=
 =?utf-8?B?Z1JuaGRsUTRISnNaaWJhbncvdlFzQi93WWRFS09MeEsveDNzWTF5ZlBnVFhL?=
 =?utf-8?B?dXpmTHRwQ21hcjhic3BJbDh5cDdadnFPTGthakI2L1MzVG5xMC9YVnFIc05h?=
 =?utf-8?B?aU9vNWJFUXlWS3V2QmpqZ1lWSFRkZFJvWEYybE9XUll4cnFpcHRUV0NTVDYw?=
 =?utf-8?B?czVjdFJiVnlsSDRhcDNMVnJIRzZ1aUpCbUpsaW42YkQrdVNVVFpELzJxUTNv?=
 =?utf-8?B?dEtYd0lMdUl6V0EvQk5pUWIzSytJSlpJSFRYeENJQXZsU2x4V1RSV09DYlZa?=
 =?utf-8?B?OEljclNtN2doM3U0Wm9TL3ZySWNtRTJCVlpHUVBFUHhoMlczNTdVdXhDTmJv?=
 =?utf-8?B?YzczcVhqalNXSWlLRnRyNmh2eXl6aUZnanNPNzN1R1VGUWRMTEtxTGdGUEF5?=
 =?utf-8?B?UmM1ZVRNU0tjbHNSVFRkbTh2S2s2ZVAwOXdkQlRsbmkxd2EzeXUydTNIbmNx?=
 =?utf-8?B?cmM3WmZhdktFWU9xU3pvMG0yVEVkWWZndGlKNWZaN3E2bEVmYmc3aGJYS0Ra?=
 =?utf-8?B?UDFsMG9Pbit1bzhwM0FBcW5zNXpLR09mNmtCSEFIRTBVeHhqcVY5c01RWWxM?=
 =?utf-8?B?SjBIdzczRHcvU0N0T1I3c2NWdCtZR1ZlQjh3NkxrSTQyVmllcldha2xCcHZq?=
 =?utf-8?B?bTZ1eWQ2NFdRN1VVN0daRnViak1OVS8yRkZJYkhDdG9PRWgzUGxzQkljQWQv?=
 =?utf-8?B?Z3QyS1Vxd1l2VHdWMnhiTkRmREt2SmN6bjc3cGdBNlk1L09xOVN5aS9Zallj?=
 =?utf-8?B?TytJQ2tMUndtQmJDall6K3ZqZzZUUjlNNmxxcGJUa2pqSkdHcEQzZU54d3Qr?=
 =?utf-8?B?M1BBalpjSzJhczhNUmprZUpmTktLenhSYytnQ0tLOHptMUhYNGUrTXBrRk1G?=
 =?utf-8?B?aE5Sa2ptcTFYdHIxK3JYQ0syaG5lT1A3QWxrcHFPUmp6NlhFS1UxdVhNMGdY?=
 =?utf-8?B?cGdreld3WWVGRUFBbm4rekpLTk52bWhqK3VwUnpuZzRkeUhreXBrMjZpK0pQ?=
 =?utf-8?B?dWw5OFpFby8zZTZrbjZ6Q285ai9YaXFkSWlnb3ZtM1kvd3NnRjlQQ1RNcGZz?=
 =?utf-8?B?TFNwN0sxWW5STDhFb0hFQjNGenV2RW1NUHlnM1VDRzBUdzRocFhrYnJDS0d2?=
 =?utf-8?B?czFtZ281SUd1cEZTZG55MWV6RUw4bkhscVl1UzJUVGZlVkp6bzlZZHhqbHBs?=
 =?utf-8?B?WHhqVHdvZVFSb0tFRWloT3VnM2JMWmFPbFhEelZyeklNYnZ5VG1HdGh2a3cx?=
 =?utf-8?B?YUZsVnM4Tnp3cU5vaW5ZdEhuZzJVWVE1VGZRTDY0N2U2TDFnUHN5WjZXUlBU?=
 =?utf-8?B?K3pNUW4wd3lzMElua3ZLM2x0U0RkK3BkWkthZThTU1M0MXczVS9EaFJRNHp5?=
 =?utf-8?B?SDV0bGNSdmo5U2pzTXd5NndPcnhSUDV1RHpDTmFSN3U4a0FrYU9McklHbGpL?=
 =?utf-8?B?UGlWR2k3VWpMcElnOHRPMzZnWmFyUEdSaFlpeml6N3J4NVRETjVsWVZwWnJ1?=
 =?utf-8?B?T0JiQXlOMmZsY0VSZnEveXEvWHJPaDNCN01temFuVHJjVWpwQjhpNEs1R3NQ?=
 =?utf-8?B?UmxGc1lQd0JTQkdGOG9ZS2tnZUJmN3FYbllmb0FHM0RjcEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJYVVV6SFhDMmthejFBS2JMNFhTelBiallIZUFPeFhoODd0Vkh0L3JucVRv?=
 =?utf-8?B?WEVEQ1YzSExwcXRqUlZaMU5XZDhIV1lMV2RXV0p0M3prY3lGamNqWVBTU0pn?=
 =?utf-8?B?OWdTTmZHd09mZXNiMVdYQ2pia3k1ZEhhOXU0RlNxajkzL3ZMeGpJakNjbno5?=
 =?utf-8?B?dWtyREdoL1c4d2VZZTdUQWphaG0wU0d5NnR4eDRtbHFhVVEzclNnN3RLM2I4?=
 =?utf-8?B?UVM2VWZpbSsyMFcyeGN3Q1l3L1VLOXA4M1FSK0tPNVh6clBjQ01CbVNMaG1C?=
 =?utf-8?B?blJhVkxSczR5LzFLY2pnWXBnSnYrcENwcEhOTlVUTlU1d20vSkRQTEhrdUd3?=
 =?utf-8?B?YUkySEVaTGlkQ0RWaXdWbzJlZ0Z0TDNGTDN3R3pHSmw3cVRjUFErRjVURHZh?=
 =?utf-8?B?RC8xbXJ3bWFzdTI1dFBGNGw1UzlYOHZhcG9aOFlXWEc5MWwyeGw3MFNwRUk4?=
 =?utf-8?B?VUM3dmkvWGhvSVVOdWhxQTIxWEQvT1pSYmpCYXBlWGNTMWpnWFlQb3RZTVBi?=
 =?utf-8?B?dGpjbFlseDZWSmhNYUlobHN4MXJSOG44U1ROSFp0OU5URFpLRmZVQmZjdHdB?=
 =?utf-8?B?cC9hZVpZcktLTEV2RS9VeU13MW5ZeTFwb25IUklhMWlTNFh4Y3NZaFVmcGhB?=
 =?utf-8?B?TmplS1d0bVo5YklIeTkySTQ3TDFEY251NE5KcU1WSEs3ZUxFSVB5TkRicDEy?=
 =?utf-8?B?NlhNa0VJSERxekhGejkrVXR5aEJDRVVLYzVvOFR3UHNmWlZ1TXl3L2RIV0Rw?=
 =?utf-8?B?RlB6TmhJRzcwa3RNUjJlcjRUUk45TFVIeVBaS0ZGQU9VUmc1aGJUMmpRejl2?=
 =?utf-8?B?MXBpOTlhdUVzdkhIZTJIQmxJZ0EwM0xYM0ovNXpqQm4xMkg1L1NEcC80aHN6?=
 =?utf-8?B?clgrSUdNbGJEWkNKcmgxZ2hUNldZUGl2S2dpMU5yTkoxOFZRRXdWT205QnND?=
 =?utf-8?B?cE1TWEpJK3Mza1FCVk5sV3VQQkl0YU5Ccnp6UEEzS2IwbWFLYngzaGxSa1pT?=
 =?utf-8?B?dktZQ0VvLzVVUy93bTZHQ3A5NWVoZ1BRTVlvWms4V2N0SG8xM0FXS24zYjVi?=
 =?utf-8?B?QTMvS3ZRYmRFQ042YVUvRFdJODdxaEpTWjFvT0M0Z0xUWVp5a3hLTm11b0N1?=
 =?utf-8?B?b2R1UmRsc3dTTFRROWtEeWNMS1RpWURsbjV6cTRQeWNwZVRScC9tZWx3aW9Z?=
 =?utf-8?B?VXBLcFE0WUVsRVRhb0QxVVkrcUVVdER2dVhPU3lic1F3Q0NNM3VHVE82OHJB?=
 =?utf-8?B?Wm1ZaHJ3dEFrdWI5c0toanhCZnpEMEptSW1JNk1PZTRpR2tPaWsyYndJOHov?=
 =?utf-8?B?WHM5SlRGSkx0b3JDMVQySVZaL3ZVSEVFNjBkMHJYVEpwSWZvUVYyam1xS3lQ?=
 =?utf-8?B?SVlVRjd4Z1V0dDlKU3oxcEs0RTk4UkZBMEsvcHNDQ1hvSEpZTDdVRWZiZXpU?=
 =?utf-8?B?dXQ1Y0hieFkrdytCSEJiUVdQWXZpUTNvUUR3c05wbXRxYlNvaXRGMkVoYWVm?=
 =?utf-8?B?YmF5dTJLV1A4NG45andwa1o1VDFrVndWUjRucjhWTHR1aGpqNFZoRTdQVjBl?=
 =?utf-8?B?T0tnc3dWU1ZPK2w0SzVtVXNvT0ZKZEhjOTBicGJOSW1nS0NHL1hxSkRqRWZF?=
 =?utf-8?B?UmpvakF0Q09xUXlwREJTNkg0dVVOeUxWdDBoYmRmZXpVMWV5RUdHb0dpclJM?=
 =?utf-8?B?UjZwV1Z5ci9HRkRidWZiSXBETDhJaHd5NzFOOUFkS3lSdEpSdFhUZU5WV1VZ?=
 =?utf-8?B?OUs0WEdDbXg2MkFGSHlZbmJFeC9DeFB3S0IzbThVKytjbDFuMHJ6UkorV0hv?=
 =?utf-8?B?UXU4RHBYU0piRmlJNlFacE1NM0F0OWNIQlhaUGVJTFNCaGZ4K3dhR3RnQktY?=
 =?utf-8?B?UXpRUWRiMndIa0kxdUpLcG1BTzB0MWJ0SVh5RSt0cUxPY2tJc2grWnY4czIx?=
 =?utf-8?B?MXh0Y3pXN2svbzNFSzYrRmpNeGVNczcreDBVTEY4Q3c1QWx2QTd1ZWZxbHIv?=
 =?utf-8?B?M21DT0NPTno2TUJwV1JsVnBadE5MRittRUJXVVhMNlVGVDBBaFY5YmY1c2VJ?=
 =?utf-8?B?U2lLakM1cStQMGxoZWEwK3FBWDVYcStvTFpoNUhhZkY2WXhNaGFWaDFIc2lt?=
 =?utf-8?B?a3l2RFVOaU41L3NJWkRpMUdUOGF0dC84cXBHYUNWeUdPS05oYXh4UHh6OTRH?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bafba5-12e1-4200-7487-08dd19097d0c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:57:50.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpsECnnhFRWiS6lTYj4McTVvxM4z+oi7U+tpvkXy3jVqBF/QUr+6ILrYwO+C4zWnMPRMQg5p5dnAJnOTz6NiLayHjhPHWc3uEFCh+mbNy2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-OriginatorOrg: intel.com



On 12/10/2024 11:45 AM, Ming Yu wrote:
> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
> 
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
> 
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>   MAINTAINERS                 |   7 +
>   drivers/mfd/Kconfig         |  10 +
>   drivers/mfd/Makefile        |   2 +
>   drivers/mfd/nct6694.c       | 382 ++++++++++++++++++++++++++++++++++++
>   include/linux/mfd/nct6694.h | 139 +++++++++++++
>   5 files changed, 540 insertions(+)
>   create mode 100644 drivers/mfd/nct6694.c
>   create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 67d2159406c2..9c9a94ff8f98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16541,6 +16541,13 @@ F:	drivers/nubus/
>   F:	include/linux/nubus.h
>   F:	include/uapi/linux/nubus.h
>   
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>   M:	Antonino Daplas <adaplas@gmail.com>
>   L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 03c1e4e3eea4..07ccc32f9985 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -558,6 +558,16 @@ config MFD_MX25_TSADC
>   	  i.MX25 processors. They consist of a conversion queue for general
>   	  purpose ADC and a queue for Touchscreens.
>   
> +config MFD_NCT6694
> +	tristate "Nuvoton NCT6694 support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This adds support for Nuvoton USB device NCT6694 sharing peripherals
> +	  This includes the USB devcie driver and core APIs.
> +	  Additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>   config MFD_HI6421_PMIC
>   	tristate "HiSilicon Hi6421 PMU/Codec IC"
>   	depends on OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e057d6d6faef..9d0365ba6a26 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -117,6 +117,8 @@ obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
>   
>   obj-$(CONFIG_MFD_MX25_TSADC)	+= fsl-imx25-tsadc.o
>   
> +obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> +
>   obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>   obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>   obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> new file mode 100644
> index 000000000000..071333d13eae
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 MFD driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +#define MFD_DEV_SIMPLE(_name)				\
> +{							\
> +	.name = NCT6694_DEV_##_name,			\
> +}							\
> +
> +#define MFD_DEV_WITH_ID(_name, _id)			\
> +{							\
> +	.name = NCT6694_DEV_##_name,			\
> +	.id = _id,					\
> +}
> +
> +/* MFD device resources */
> +static const struct mfd_cell nct6694_dev[] = {
> +	MFD_DEV_WITH_ID(GPIO, 0x0),
> +	MFD_DEV_WITH_ID(GPIO, 0x1),
> +	MFD_DEV_WITH_ID(GPIO, 0x2),
> +	MFD_DEV_WITH_ID(GPIO, 0x3),
> +	MFD_DEV_WITH_ID(GPIO, 0x4),
> +	MFD_DEV_WITH_ID(GPIO, 0x5),
> +	MFD_DEV_WITH_ID(GPIO, 0x6),
> +	MFD_DEV_WITH_ID(GPIO, 0x7),
> +	MFD_DEV_WITH_ID(GPIO, 0x8),
> +	MFD_DEV_WITH_ID(GPIO, 0x9),
> +	MFD_DEV_WITH_ID(GPIO, 0xA),
> +	MFD_DEV_WITH_ID(GPIO, 0xB),
> +	MFD_DEV_WITH_ID(GPIO, 0xC),
> +	MFD_DEV_WITH_ID(GPIO, 0xD),
> +	MFD_DEV_WITH_ID(GPIO, 0xE),
> +	MFD_DEV_WITH_ID(GPIO, 0xF),
> +
> +	MFD_DEV_WITH_ID(I2C, 0x0),
> +	MFD_DEV_WITH_ID(I2C, 0x1),
> +	MFD_DEV_WITH_ID(I2C, 0x2),
> +	MFD_DEV_WITH_ID(I2C, 0x3),
> +	MFD_DEV_WITH_ID(I2C, 0x4),
> +	MFD_DEV_WITH_ID(I2C, 0x5),
> +
> +	MFD_DEV_WITH_ID(CAN, 0x0),
> +	MFD_DEV_WITH_ID(CAN, 0x1),
> +
> +	MFD_DEV_WITH_ID(WDT, 0x0),
> +	MFD_DEV_WITH_ID(WDT, 0x1),
> +
> +	MFD_DEV_SIMPLE(HWMON),
> +	MFD_DEV_SIMPLE(RTC),
> +};
> +
> +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> +					 unsigned char err_status)
> +{
> +	struct device *dev = &nct6694->udev->dev;
> +
> +	switch (err_status) {
> +	case NCT6694_NO_ERROR:
> +		return err_status;
> +	case NCT6694_NOT_SUPPORT_ERROR:
> +		dev_dbg(dev, "%s: Command is not support!\n", __func__);
> +		break;
> +	case NCT6694_NO_RESPONSE_ERROR:
> +		dev_dbg(dev, "%s: Command is no response!\n", __func__);
> +		break;
> +	case NCT6694_TIMEOUT_ERROR:
> +		dev_dbg(dev, "%s: Command is timeout!\n", __func__);
> +		break;
> +	case NCT6694_PENDING:
> +		dev_dbg(dev, "%s: Command is pending!\n", __func__);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EIO;
> +}
> +
> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		     u16 length, void *buf)
> +{
> +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
> +	struct nct6694_response_header *response_header = nct6694->response_header;

RCT violation

> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device */
> +	cmd_header->mod = mod;
> +	cmd_header->cmd = offset & 0xFF;
> +	cmd_header->sel = (offset >> 8) & 0xFF;
> +	cmd_header->hctrl = NCT6694_HCTRL_GET;
> +	cmd_header->len = length;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
> +			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	return nct6694_response_err_handling(nct6694, response_header->sts);
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);
> +
> +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		      u16 length, void *buf)
> +{
> +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
> +	struct nct6694_response_header *response_header = nct6694->response_header;

Same as above

> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	/* Send command packet to USB device  */
> +	cmd_header->mod = mod;
> +	cmd_header->cmd = offset & 0xFF;
> +	cmd_header->sel = (offset >> 8) & 0xFF;
> +	cmd_header->hctrl = NCT6694_HCTRL_SET;
> +	cmd_header->len = length;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
> +			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
> +			   buf, length, &tx_len, nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
> +			   nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
> +			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
> +	if (ret)
> +		return ret;
> +
> +	return nct6694_response_err_handling(nct6694, response_header->sts);
> +}
> +EXPORT_SYMBOL(nct6694_write_msg);
> +
> +static void usb_int_callback(struct urb *urb)
> +{
> +	struct nct6694 *nct6694 = urb->context;
> +	struct device *dev = &nct6694->udev->dev;
> +	unsigned int *int_status = urb->transfer_buffer;

Again RCT violation

> +	int ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		break;
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		return;
> +	default:
> +		goto resubmit;
> +	}
> +
> +	while (*int_status) {
> +		int irq = __ffs(*int_status);
> +
> +		if (*int_status & (1 << irq))
> +			generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> +
> +		*int_status &= ~(1 << irq);
> +	}
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret)
> +		dev_dbg(dev, "%s: Failed to resubmit urb, status %d",
> +			__func__, ret);
> +}
> +
> +static void nct6694_irq_lock(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&nct6694->irq_lock);
> +}
> +
> +static void nct6694_irq_sync_unlock(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_unlock(&nct6694->irq_lock);
> +}
> +
> +static void nct6694_irq_enable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +	unsigned int irq = data->hwirq;
> +
> +	nct6694->irq_enable |= (1 << irq);

I wonder if this is necessary to create local variable irq
if this is used only once. Maybe instead:

nct6694->irq_enable |= (1 << data->hwirq);

Not big thing though

> +}
> +
> +static void nct6694_irq_disable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +	unsigned int irq = data->hwirq;
> +
> +	nct6694->irq_enable &= ~(1 << irq);
> +}
> +
> +static struct irq_chip nct6694_irq_chip = {
> +	.name = "nct6694-irq",
> +	.flags = IRQCHIP_SKIP_SET_WAKE,
> +	.irq_bus_lock = nct6694_irq_lock,
> +	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
> +	.irq_enable = nct6694_irq_enable,
> +	.irq_disable = nct6694_irq_disable,
> +};
> +
> +static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +				  irq_hw_number_t hw)
> +{
> +	struct nct6694 *nct6694 = d->host_data;
> +
> +	irq_set_chip_data(irq, nct6694);
> +	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
> +
> +	return 0;
> +}
> +
> +static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
> +{
> +	irq_set_chip_and_handler(irq, NULL, NULL);
> +	irq_set_chip_data(irq, NULL);
> +}
> +
> +static const struct irq_domain_ops nct6694_irq_domain_ops = {
> +	.map	= nct6694_irq_domain_map,
> +	.unmap	= nct6694_irq_domain_unmap,
> +};
> +
> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct device *dev = &udev->dev;
> +	struct usb_host_interface *interface;
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct nct6694 *nct6694;
> +	struct nct6694_cmd_header *cmd_header;
> +	struct nct6694_response_header *response_header;
> +	int pipe, maxp;
> +	int ret;

Please follow RCT rule

> +
> +	interface = iface->cur_altsetting;
> +
> +	int_endpoint = &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint))
> +		return -ENODEV;
> +
> +	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> +	maxp = usb_maxpacket(udev, pipe);
> +
> +	cmd_header = devm_kzalloc(dev, sizeof(*cmd_header),
> +				  GFP_KERNEL);
> +	if (!cmd_header)
> +		return -ENOMEM;
> +
> +	response_header = devm_kzalloc(dev, sizeof(*response_header),
> +				       GFP_KERNEL);
> +	if (!response_header)
> +		return -ENOMEM;
> +
> +	nct6694->int_buffer = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
> +					   sizeof(unsigned char), GFP_KERNEL);
> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb)
> +		return -ENOMEM;> +
> +	nct6694->domain = irq_domain_add_simple(NULL, NCT6694_NR_IRQS, 0,
> +						&nct6694_irq_domain_ops,
> +						nct6694);
> +	if (!nct6694->domain)
> +		return -ENODEV;
> +
> +	nct6694->udev = udev;
> +	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */
> +	nct6694->cmd_header = cmd_header;
> +	nct6694->response_header = response_header;
> +
> +	mutex_init(&nct6694->access_lock);
> +	mutex_init(&nct6694->irq_lock);
> +
> +	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> +			 nct6694->int_buffer, maxp, usb_int_callback,
> +			 nct6694, int_endpoint->bInterval);
> +	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_urb;
> +
> +	dev_set_drvdata(dev, nct6694);
> +	usb_set_intfdata(iface, nct6694);
> +
> +	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
> +	if (ret)
> +		goto err_mfd;
> +
> +	dev_info(dev, "Probed device: (%04X:%04X)\n", id->idVendor, id->idProduct);
> +	return 0;
> +
> +err_mfd:
> +	usb_kill_urb(nct6694->int_in_urb);
> +err_urb:
> +	usb_free_urb(nct6694->int_in_urb);
> +	return dev_err_probe(dev, ret, "Probe failed\n");
> +}
> +
> +static void nct6694_usb_disconnect(struct usb_interface *iface)
> +{
> +	struct usb_device *udev = interface_to_usbdev(iface);
> +	struct nct6694 *nct6694 = usb_get_intfdata(iface);
> +
> +	mfd_remove_devices(&udev->dev);
> +	usb_kill_urb(nct6694->int_in_urb);
> +	usb_free_urb(nct6694->int_in_urb);
> +}
> +
> +static const struct usb_device_id nct6694_ids[] = {
> +	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
> +					NCT6694_PRODUCT_ID,
> +					0xFF, 0x00, 0x00)},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +
> +static struct usb_driver nct6694_usb_driver = {
> +	.name	= "nct6694",
> +	.id_table = nct6694_ids,
> +	.probe = nct6694_usb_probe,
> +	.disconnect = nct6694_usb_disconnect,
> +};
> +
> +module_usb_driver(nct6694_usb_driver);
> +
> +MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..9733d47f5a01
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Nuvoton NCT6694 USB transaction and data structure.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#ifndef __MFD_NCT6694_H
> +#define __MFD_NCT6694_H
> +
> +#define NCT6694_DEV_GPIO	"nct6694-gpio"
> +#define NCT6694_DEV_I2C		"nct6694-i2c"
> +#define NCT6694_DEV_CAN		"nct6694-can"
> +#define NCT6694_DEV_WDT		"nct6694-wdt"
> +#define NCT6694_DEV_HWMON	"nct6694-hwmon"
> +#define NCT6694_DEV_RTC		"nct6694-rtc"
> +
> +#define NCT6694_VENDOR_ID	0x0416
> +#define NCT6694_PRODUCT_ID	0x200B
> +#define NCT6694_INT_IN_EP	0x81
> +#define NCT6694_BULK_IN_EP	0x02
> +#define NCT6694_BULK_OUT_EP	0x03
> +#define NCT6694_MAX_PACKET_SZ	0x200
> +
> +#define NCT6694_CMD_PACKET_SZ	0x8
> +#define NCT6694_HCTRL_SET	0x40
> +#define NCT6694_HCTRL_GET	0x80
> +
> +#define NCT6694_URB_TIMEOUT	1000
> +
> +enum nct6694_irq_id {
> +	NCT6694_IRQ_GPIO0 = 0,
> +	NCT6694_IRQ_GPIO1,
> +	NCT6694_IRQ_GPIO2,
> +	NCT6694_IRQ_GPIO3,
> +	NCT6694_IRQ_GPIO4,
> +	NCT6694_IRQ_GPIO5,
> +	NCT6694_IRQ_GPIO6,
> +	NCT6694_IRQ_GPIO7,
> +	NCT6694_IRQ_GPIO8,
> +	NCT6694_IRQ_GPIO9,
> +	NCT6694_IRQ_GPIOA,
> +	NCT6694_IRQ_GPIOB,
> +	NCT6694_IRQ_GPIOC,
> +	NCT6694_IRQ_GPIOD,
> +	NCT6694_IRQ_GPIOE,
> +	NCT6694_IRQ_GPIOF,
> +	NCT6694_IRQ_CAN1,
> +	NCT6694_IRQ_CAN2,
> +	NCT6694_IRQ_RTC,
> +	NCT6694_NR_IRQS,
> +};
> +
> +enum nct6694_response_err_status {
> +	NCT6694_NO_ERROR = 0,
> +	NCT6694_FORMAT_ERROR,
> +	NCT6694_RESERVED1,
> +	NCT6694_RESERVED2,
> +	NCT6694_NOT_SUPPORT_ERROR,
> +	NCT6694_NO_RESPONSE_ERROR,
> +	NCT6694_TIMEOUT_ERROR,
> +	NCT6694_PENDING,
> +};
> +
> +struct nct6694 {
> +	struct usb_device *udev;
> +	struct urb *int_in_urb;
> +	struct irq_domain *domain;
> +	struct nct6694_cmd_header *cmd_header;
> +	struct nct6694_response_header *response_header;
> +	struct mutex access_lock;
> +	struct mutex irq_lock;
> +	unsigned char *int_buffer;
> +	unsigned int irq_enable;
> +	/* time in msec to wait for the urb to the complete */
> +	long timeout;
> +};
> +
> +struct nct6694_cmd_header {
> +	unsigned char rsv1;
> +	unsigned char mod;
> +	unsigned char cmd;
> +	unsigned char sel;
> +	unsigned char hctrl;
> +	unsigned char rsv2;
> +	unsigned short len;
> +} __packed;
> +
> +struct nct6694_response_header {
> +	unsigned char sequence_id;
> +	unsigned char sts;
> +	unsigned int rsv;
> +	unsigned short len;
> +} __packed;
> +
> +/*
> + * nct6694_read_msg - Receive data from NCT6694 USB device
> + *
> + * @nct6694 - Nuvoton NCT6694 structure
> + * @mod - Module byte
> + * @offset - Offset byte or (Select byte | Command byte)
> + * @length - Length byte
> + * @buf - Read data from rx buffer
> + *
> + * USB Transaction format:
> + *
> + *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
> + *	OUT	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
> + *	IN	|-------D------A------D------A-------|
> + *	IN			......
> + *	IN	|-------D------A------D------A-------|
> + */
> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		     u16 length, void *buf);
> +
> +/*
> + * nct6694_read_msg - Transmit data to NCT6694 USB device
> + *
> + * @nct6694 - Nuvoton NCT6694 structure
> + * @mod - Module byte
> + * @offset - Offset byte or (Select byte | Command byte)
> + * @length - Length byte
> + * @buf - Write data to tx buffer
> + *
> + * USB Transaction format:
> + *
> + *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
> + *	OUT	|-------D------A------D------A-------|
> + *	OUT			......
> + *	OUT	|-------D------A------D------A-------|
> + *	IN	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
> + *	IN	|-------D------A------D------A-------|
> + *	IN			......
> + *	IN	|-------D------A------D------A-------|
> + */
> +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> +		      u16 length, void *buf);
> +
> +#endif


