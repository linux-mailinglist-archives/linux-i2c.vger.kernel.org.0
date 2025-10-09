Return-Path: <linux-i2c+bounces-13419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A03BC720A
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 03:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D389119E27C3
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 01:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42F813D8B1;
	Thu,  9 Oct 2025 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf+W8X5+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1F4A06
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 01:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759974621; cv=fail; b=IkzSEuzNRBwjayWNsYmVkljyaM7mYvvOWthKYytklWQt2djH68zSus8q2wnwT/WThUJwXVakYNxPxbDyBjqeVWlZznUlDc790EpfbrJT+uDESJYimf1AOndhC3TnDOL5+K9rOvVBgvfWCoY7Z09SSuRVUIANB7EhteOSZeeExmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759974621; c=relaxed/simple;
	bh=B1YNOS4jUh70MqKIJ8z6qoSaqKaGpZ4PUw0pPV8IWbM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OXeRpcczEBV710lpZE100qvcsKDmhRakPxSEXYI8c/U+LvJXimWkyE5lV1DloCtDahvNc3MMJGYO2Ew73CeA3Kg08sbq5MlMCz4fpSrwY3a5vZHHlivQcF2s9Wd5VfVjIsYTc2983ibaajVZSKTUNV5JOYCLNxvUy+LO0fupPg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gf+W8X5+; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759974620; x=1791510620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B1YNOS4jUh70MqKIJ8z6qoSaqKaGpZ4PUw0pPV8IWbM=;
  b=gf+W8X5+i0xrqu7mAF0kuVWMfARixxA0ks1OnETinszZICEGbD/WJPUU
   9MGLwzbuu/B8gVOPXcxl/6Mmbsqvr3rEkvJr9LLPheqlFanixs0hWDC0U
   UsnuzO5Lv0rqzWSxSIZGusnRWrjKSKOyXqwLyslSr7CuluPbkLdYy2kwb
   SDowsvHidgYVaZgMe/b4BsMCr9xqJEUhlvXfJXQJ2qXQyxoIIO0YHpBMM
   PKYiP6PDlayEh4PtYexJNtgBb8uAY7ni6jOf/2J/wfbbstdAR5QHQGBZY
   48+s7pq7L+Sry1EW5Ok62FivQn9M/lkSGSB54dlI9lT1x5l7HcYqq4hGp
   w==;
X-CSE-ConnectionGUID: IoccGXRITJWIen+4X5N9eA==
X-CSE-MsgGUID: EYzclA3DSr69B5fPZgckZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72437639"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="72437639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:50:20 -0700
X-CSE-ConnectionGUID: uG8Jk3EeQW+yCnPpldZX1w==
X-CSE-MsgGUID: d1E8khl1TOuILkI8UB/mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="179836833"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:50:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:50:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 18:50:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:50:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO/vz6tipOnEAvXLu6qhsV6obKscAk4t/sudwM0zLLr/NxNgnkyRe4ZGBz8m+XKTGROd29NsaR4FcH5jhCSeJ4j1IpKJIBmDlGOLi4QsLmsxeq7N/04knadiqYvpySKAavE9O/6v2E6YvJl4mQw19D/mbiQ79QbLmR8Wt2UXnjxPw1kF9udOPDZ32DT1rl7ToBA92i/EE2Y5GKVgk5A2Vz9MCsjoxG5fJhAX8iGMCf32AIXpFvFkg1LU8FXooIZRflBnmBeWGLmCr0xV+6Yznz7gGOPIXvTjL+9Vk7PJHnrL5szhUvehS09PGhZC37uYc+BhUbOF4RO7tS/X5zaHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1YNOS4jUh70MqKIJ8z6qoSaqKaGpZ4PUw0pPV8IWbM=;
 b=qocYA1MYPOyBn5yTsvqPUzngMEjU3obamxXkGTA6B2V3aO9Q9wSJWe2mUkHD3pzqVcb2E3wFnFOFdXSWIqFqcdFxSWTMwJ9wq+kFQ8rn0GYrGiyJsWgR9aM9TYG7C/CY5gs6qYk2KiqMGm4scXG+4xLC/L191c9g5dR9kWJ8AwhN6eXNbDDQIKzjSP1mXB3ihRPryRmiD8eSZ0AONAlLoFT9iDOM7WvHi4FsV0sd9Mr4VI9gMgrHrjDtf6UUMjdvPaKsJO3jMhYxHq20GgJs+s/2CeE+cc0gM6LFFNSWLmUD9oSH6HGkK76Q/R+qEWtUy9Bdsd0JB+KFUU6+5MFk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 01:50:12 +0000
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc]) by DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc%8]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 01:50:11 +0000
From: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: RE: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF
 devices
Thread-Topic: RE: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF
 devices
Thread-Index: AQHcMxmeb6TxZJKd902vCvsKWQIRQrSt1rkAgAC4C4CAAAYLgIAAPysAgAAuQnCAACFJAIAAAwQQgALisICABw2rcA==
Date: Thu, 9 Oct 2025 01:50:11 +0000
Message-ID: <DS4PPF11A2D56728CE6D96037AA9EF02AEBFAEEA@DS4PPF11A2D5672.namprd11.prod.outlook.com>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
 <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
 <056ae17a-5351-4be7-a14e-9becf8ec404c@kernel.org>
 <DS4PPF11A2D5672F6724542FB9C1E9AEF60FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
 <1e1b4323-2eb8-4c02-a47b-8e951606cffd@kernel.org>
In-Reply-To: <1e1b4323-2eb8-4c02-a47b-8e951606cffd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF11A2D5672:EE_|SA1PR11MB5899:EE_
x-ms-office365-filtering-correlation-id: b7face23-8234-4284-4428-08de06d62f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U2M4K2VZMTRSRTZyblgyOW1oQ0lZVFdnUjFZeS9aUDlVOGduY0h4U1FsQkg5?=
 =?utf-8?B?Wm5Fc25xSzMwdTlIMnBVRFJkbkcyVnRzemFwMmM4b3hVdnlVZHJ0SU5MSUdz?=
 =?utf-8?B?TFdmM1ErTzBqU0wvSEJwVWVaS2RRVjUwTmNRcE90SzV1WHRRSzRZME9aUldK?=
 =?utf-8?B?NVIvMEVtZFQwb21rQWhEWVZjK08zN3dzOHZ1QnRHVVFDWHdTL0RXZHhtVnlz?=
 =?utf-8?B?Wm5WdWZ6S21WRC9Ja0g0TFlQaE0vK1k5Rit5SUpkZVRCRTNlQzhVUW5BbEw4?=
 =?utf-8?B?R0cyTTZLZC9JWjhQb1cxS1VvUithMWpnL2xoV3NnUWEvVVU5dDMvbzU0K2ky?=
 =?utf-8?B?dFV6S2g0enl6MER6OWV5eUlmOG9JOWdPcFVRcmdid3dYeDRYbkR1aWhVSzNJ?=
 =?utf-8?B?SldiUnJQN0NVbDBMUEFTQXZmZFNFZmlPWG5jQmw4ZW16NjViV1A0aFk3QWwr?=
 =?utf-8?B?NUc0Z2tXT1ltTkYrMGpSMk9tR0IvN2tZZVQvb0R0c0V1OFg1L0RJaWpDa0tJ?=
 =?utf-8?B?M2pYdGJmMU02UzhjbXV5UkpyZVdRUnRwY3N3ek52Z3NWcnFEaEhSbnY1cnc5?=
 =?utf-8?B?Z3BkYzdNSDFSaUtUK3hXUVhzUk1KMEJuQ0pSV2Zpb08zVGFYd3BqVFFqTVV6?=
 =?utf-8?B?ZitqOG0xZUw0dXJLbU9CMzVja3NHOFNNODdRNG1NZnU1aEc5SmNsaUdPMnll?=
 =?utf-8?B?M3NpNjc2UmJSUFJ3Yk1IS215VDRiUHJ3dURIeTcwRjVnNzlqcHpwNmpWc0pa?=
 =?utf-8?B?MDRRbFdRQnZYNFhFc2YrSXNIc0ZLSEcxWGoxbVRmOGh5YjdUUk5BRnVJSFMw?=
 =?utf-8?B?b0FtRVk2SWh6RnAyRWVJSXBYT3FlUnM2ZHpGY2p0dDBHeGFsdnh0NE8zRm9t?=
 =?utf-8?B?YmNnZXcrck5oNy9abmNvTUdCNGI3cFhVUEJmejh0VnUyRGpnQnRlZ1ZjdFhh?=
 =?utf-8?B?QnlRdUo4cTk4VktkNzBHaXkrS29rOW5IUHJhTDV3N0doUXVrbFIrajEvWllB?=
 =?utf-8?B?NkJCNDhGcjk2ZkJsUmRJZVlDYjMxcitXcHhQVldDKzRxdWtaRG5lLzhTNzVm?=
 =?utf-8?B?SDJaaG1XYnFwYnRjYWxWN3M4Mk5XckVnVFBja3JXZnZGdXZ4QUVOcVB3OUtO?=
 =?utf-8?B?cWpxVE13Y1d5ZTZTVkE1K29Rc0RvYUFhWjBDUU9tN1J6SlRkT05tRGp1VlJN?=
 =?utf-8?B?Yld3RmxVME5Lc2wwK2xrVVpGRWd4K2F4Z0EvMENRVUdzTmNHYzFkWnNCbWVy?=
 =?utf-8?B?Nk82WTdzSkZ6NlhybzBwbS9tQytOMERydDV1clhSVzNoN0dOMmhOeEovWEcx?=
 =?utf-8?B?V3gvcE5FaXRqcWZSUC9YQ3JGb3MwSWdBQ1M1UVRXZVV3aVlaaVpDMDZMU1NL?=
 =?utf-8?B?ZmtXMkZLRVNBTWt3Uk5RdzFqanZIZlVzOEY0WGlBMmxKcFU2OU5aQjVtblQy?=
 =?utf-8?B?d0lqUlFqTnMxWGFSS0VwdjlCSmM5bGdaMHd1Sm9xbE1BemdZUzd3ZHJwTkdZ?=
 =?utf-8?B?dzdSbDZrZXcwRGtNNHFhaWQ4djlsQzE3eEVpWmU3OHZicWJJVWdmMU9Sc1ha?=
 =?utf-8?B?M0VjaXJ4TllVd3AwODg4c2taczltOWlSaVhadGVJOWg5Z3hPOGhqUThOdWgr?=
 =?utf-8?B?bmNlL1I3aFB4RkJUbG1EaFFEZXExOGhia1NObEJhNVoxYnErK3F2Sk9nMDJX?=
 =?utf-8?B?VXB3ak8rYTNDVWxTUGFrcVp3QnY0RmlHV0RCS1lNd0cyTWVwR1UvekRnck5x?=
 =?utf-8?B?Uy9LZEE1ak50dWpYRU9HZGRtbWhhcmFHTXVzZHJUSnRleCtndXV3RzE3ZVFK?=
 =?utf-8?B?VzlhcGM0eE4wSG5QY20zL2J3VHBEWmFBeEVqeTFxVVpkaWxWWjZVVG96Sllw?=
 =?utf-8?B?MS9yTWZNSGhHMUZRMkZYcnhwanc5TDU2d1k1SnV5VmZWY3pzOTBwWkpjT05z?=
 =?utf-8?B?ek9VVmtkNlBSSm1Zd1VES2VuZXl3Tks5Vk9wclVPOW93VlpOWDZWMCtCOGpC?=
 =?utf-8?B?aFpZbVdKdzQxQ3kxdDhHWjU3RkJZOFVrNlErY1ovMEU3SVZPWmNUQW5oeFBC?=
 =?utf-8?Q?2rDr7b?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF11A2D5672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjRpcmErWnhBTjZxWmRzcU14WUE1QnlGYTJvcGZKenJ1b1d6WnlkZkd0cVJm?=
 =?utf-8?B?b0hoUktSUjVsNFB0Q0Q2TVZheWVON2l0citjeFdoVEN6M3pIMEZGRFkybll2?=
 =?utf-8?B?SlZNSmNrSEd1aDE5NTBBYnpIQzhhNUd1Y2kvKytJMGhFMVZKT0RWb2M1SWRa?=
 =?utf-8?B?MHlwRi84Tk5HY2FrRytCSWNVZWdmcFhCSXU0cCtwK3FtOXZxcmhvWkZYS1dD?=
 =?utf-8?B?OTRNa29LV0d6Z2JQTTBGMndYV0tQdkZHbDZMcmxvWHZPRldVbjF0Wll2d3Y5?=
 =?utf-8?B?SzR3STNtakw1OEZ6NndpOUxXMitHcUhHTDBDS0RSOHRNbnJRZEJOeUs4MXZP?=
 =?utf-8?B?Y3JjMlJTWmdFTFhYV0t0YmVvSlRBamE5OFRCMExuVWRLSmdzbnRsc201WFd3?=
 =?utf-8?B?UjJJM2VENitjQ0xXWmxqRkM4bVdJbHIwTUY4VHhTa2toOW8veXdtZURiaG9o?=
 =?utf-8?B?b3pXeWFiUE9FNVJUV3hnT0hSVzhCVDl1TTd4U1pVdVBCYS81NTFWYU41ZjhD?=
 =?utf-8?B?aGdONDdLaFRwRzVHYTRKRWZYdkpjUzVYQlVtVjVQS1Y1NTBndE1rNXJOajZ1?=
 =?utf-8?B?UDE2RGVPYWc1WHNPbURFdGxmU1BpQnNva3BIRXRmaTViVTl0YWd5cUczQ2p4?=
 =?utf-8?B?Ym0wOTZKcWxHSzJEV2R3YzRUcGJSc2REZjIxNXJBalhTMW0vZHh3QkQrQXRr?=
 =?utf-8?B?SjM2N0hYZy9LRHhXb2czN2lUUHhyM1dlTCtZVEE2MHBwVXRnUnZKbmFUbmhJ?=
 =?utf-8?B?cVJzSU1oNFRoaTRSelJHanowMENudDUrWG9pNXhEMGZ6N0wzd2xHSG5WNTNS?=
 =?utf-8?B?WVVYVlh2aWxTZnZQdUVsUXZLZDZTVDFmUDRFVGpDeVpGc2E0NkwrQy9qcXpr?=
 =?utf-8?B?bnd2UlRna3JWaUlyNm5DeGkrb0VudXYybG1VUURxb0tCMnppb1U0RVY5Qi90?=
 =?utf-8?B?ZndERnFSUnhMNUR0ekMzK0tJOEpheVMvM1czUDM3dThvcE51Z0xiKzZFOVdy?=
 =?utf-8?B?VVFMZ1hDMmNaUEdzS0NuczFucVYrZlJrT3pRVjZVYkdsUlRDdFRGZ0hmVlBP?=
 =?utf-8?B?OTU1WGpDYVJYMmxNYXhUTk8xcG1Pd3g5d3hMSm9MRmo0K2Y4NzkxQ3V3MkxJ?=
 =?utf-8?B?TG13QXdyWm5QZlFtUlhwN0d0L0wwSzFkcU1STE9obTZZbmd6Rld3NkhDVERk?=
 =?utf-8?B?QXNTZDJwZnRVbnBzQUFKVml2SGg0cHpLSHY0dVorbGN5ejRuZGV6U1oyM3pX?=
 =?utf-8?B?RXRKdmNlazU1L1M2dG51cVV6Z0crUitZYkNINURjOFMvOWRDZWtuNnlQY2NQ?=
 =?utf-8?B?SWVBKzJwN2Y4SllqRmttNzRNcHUyZkYrdjhIK3Y2bEZPMktUb25oTmVvVXN1?=
 =?utf-8?B?b1NFcWtkNGo4STVEeVdMTXJXWFJZd2VTbkJWeWdzeTRFdk5WTmt1RzV3VjdR?=
 =?utf-8?B?MlQvUEhOMnVBNXJsckhFaERzdDMzV0xOd25uVy9vNU90RjZjU3NmTkloaHpD?=
 =?utf-8?B?OXdKbEhVUUtURGkwcnMySGFnKzJVMjY3bFhuZ2kyUFZsbURLU2IzZjRHOTUx?=
 =?utf-8?B?MHVYU3pNVzlFbjFwQ0EvSDg4QnVCWE5vZHJERDczOGtzdFlCQTh1SkpOL2pK?=
 =?utf-8?B?YjNWQUhnNGd5cTZJQ25uL2htT2FyclBDNXc5L09rWHgxOThDb3JKNkI3T3NJ?=
 =?utf-8?B?RHNLUm12R0c0Ynd3cmtpT1lrNmZ1cG51YTJQN2F1R3RWK3dwdEFGbnlySHZh?=
 =?utf-8?B?clVEZlF3U0VDeHAvaVUyR2FWQWJDNGQrNThCcnZVUlpHeEQzTjc1aU9aNVdt?=
 =?utf-8?B?bEwwWFc1Vnd2ZTNhYWFtVTduVEpuVTYxMG5qR3V0dFFFdWxNa1JseWo0YjlB?=
 =?utf-8?B?aTFBQUF4dWxyU0tpL2locW1MRjZLbXBVSDNQdEVMK0Rkc2hGTzgrRVFRSm1o?=
 =?utf-8?B?ZmtnYWZIaWRjUFk5K3UvQmlWQURsa0h1RHNHOTVxVjQvYUk3NFdqbW1RbDY0?=
 =?utf-8?B?bXVUTEtoQ3VOc0VSblQ5aGF4NDN3YTZad00zSkFlb0IySDl2dHZIRVpsMC9s?=
 =?utf-8?B?Mkg5dDVFbVhnUTQyTXJvT0duMFYwVXFnNzdGdmF2Uk9maStGWHNkRDJPaDV1?=
 =?utf-8?B?WENza1dMVkNrQmtveHNZc3ZPTG1KcDBYQUpmQ01IbGtWOWVwK1VpaWxzUWtS?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF11A2D5672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7face23-8234-4284-4428-08de06d62f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 01:50:11.8629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Aln494V3Y80jETcS7pWXJ/aLM/UGlT6NdX2VYzXcm99se4MbbMulCcZ8uNHyuN/4mc+BOQ3ZqVxybI4jMqLU7C73Uu0d0G7cVOwakZDcwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com

SGkgSGFucywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRl
IEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgT2N0b2JlciA0LCAy
MDI1IDc6MDQgQU0NCj4gVG86IENlcGVkYSBMb3BleiwgSXNyYWVsIEEgPGlzcmFlbC5hLmNlcGVk
YS5sb3BlekBpbnRlbC5jb20+OyBTYWthcmkgQWlsdXMNCj4gPHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb20+DQo+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+OyBXb2xm
cmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctDQo+IGVuZ2luZWVyaW5nLmNvbT47IGxpbnV4LWky
Y0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFJFOiBbUEFUQ0ggMS8yXSBpMmM6IHVz
YmlvOiBBZGQgQUNQSSBkZXZpY2UtaWQgZm9yIE1UTC1DVkYgZGV2aWNlcw0KPiANCj4gSGkgSXNy
YWVsLA0KPiANCj4gT24gMi1PY3QtMjUgODowNSBQTSwgQ2VwZWRhIExvcGV6LCBJc3JhZWwgQSB3
cm90ZToNCj4gPiBUaGFuayB5b3UgSGFucywNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPg0KPiA+
PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyLCAyMDI1IDEwOjQ5IEFNDQo+ID4+IFRvOiBDZXBl
ZGEgTG9wZXosIElzcmFlbCBBIDxpc3JhZWwuYS5jZXBlZGEubG9wZXpAaW50ZWwuY29tPjsgU2Fr
YXJpIEFpbHVzDQo+ID4+IDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+PiBDYzog
QW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPjsgV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLQ0KPiA+PiBlbmdpbmVlcmluZy5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBpMmM6IHVzYmlvOiBBZGQgQUNQSSBk
ZXZpY2UtaWQgZm9yIE1UTC1DVkYgZGV2aWNlcw0KPiA+Pg0KPiA+PiBIaSBJc3JhZWwsDQo+ID4+
DQo+ID4+IE9uIDItT2N0LTI1IDU6NTIgUE0sIENlcGVkYSBMb3BleiwgSXNyYWVsIEEgd3JvdGU6
DQo+ID4+PiBIaSBIYW5zLA0KPiA+Pj4NCj4gPj4+IExKQ0EgYW5kIFVTQklPIHNob3VsZG4ndCBi
ZSBzaGFyaW5nIEhJRHMuDQo+ID4+DQo+ID4+IFllcyBpbiBwcmFjdGljZSB3ZSBoYXZlIHNoaXBw
aW5nIGhhcmR3YXJlIHRoYXQgaXMgc2hhcmluZyBISURzDQo+ID4+IGFuZCBzaW5jZSB0aGlzIGlz
IGhhcmR3YXJlIG91dCB0aGVyZSBpbiB0aGUgZmllbGQgdGhlcmUgaXMNCj4gPj4gbm90aGluZyB3
ZSBjYW4gZG8gYWJvdXQgdGhpcy4NCj4gPg0KPiA+IFRoZXJlIGlzLiBERUxMIGhhcyB0byBwcm92
aWRlIGEgbmV3IEZXL0JJT1MgdXBkYXRlIHRvIGZpeCB0aGUgSElEDQo+ID4gb2YgdGhlIHN5c3Rl
bSBvbiBmYXVsdC4gVGhhdCBpcyB0aGUgY29ycmVjdCBzb2x1dGlvbiB0byB0aGUgaXNzdWUuDQo+
IA0KPiBFdmVuIGlmIERlbGwgaXMgd2lsbGluZyB0byBkbyB0aGlzICh3aGljaCBJIGZpbmQgdW5s
aWtlbHkpDQo+IGl0IHdpbGwgc3RpbGwgbGlrZWx5IHRha2UgYXQgbGVhc3QgNiBtb250aHMgZm9y
IGEgQklPUyB1cGRhdGUNCj4gdG8gc2hvdyB1cCB3aXRoIHRoZXNlIGNoYW5nZXMgKEJJT1MgUUEg
dGFrZXMgYSBsb3Qgb2YgdGltZSBpbg0KPiBteSBleHBlcmllbmNlKS4NCj4gDQo+IEFuZCBldmVu
IHRoZW4gd2UgY2Fubm90IGNvdW50IG9uIHVzZXJzIHRvIGFjdHVhbGx5IGluc3RhbGwgQklPUw0K
PiB1cGRhdGVzLiBTbyB3ZSB3aWxsIHN0aWxsIG5lZWQgdGhlIElOVEMxMEQxLCBJTlRDMTBEMiBh
bmQNCj4gSU5UQzEwRDMgSElEcyBpbiBib3RoIHRoZSBsamNhIGFuZCB1c2JpbyBkcml2ZXJzIHRv
IHN1cHBvcnQNCj4gcGVvcGxlIHdobyBhcmUgc3RpbGwgYXQgdGhlIG9sZGVyIEJJT1MuDQoNCkFn
cmVlLiBMZXQncyBwcm9jZWVkIHdpdGggY2hhbmdlLiBUaGFua3MNCg0KPiANCj4gQW5kIGlmIEkn
dmUgdW5kZXJzdG9vZCBTYWthcmkgY29ycmVjdCB0aGVuIHRoZSBJTlRDMTBEMSwgSU5UQzEwRDIN
Cj4gSElEcyBhcmUgaW5kZWVkIGludGVuZGVkIGZvciB1c2Ugd2l0aCB0aGUgVVNCSU8gZHJpdmVy
IGFuZA0KPiB0aGUgcHJvYmxlbSBpcyB0aGF0IGlkZWFsbHkgdGhleSBzaG91bGQgbm90IGFsc28g
YmUgdXNlZCBieQ0KPiB0aGUgTEpDQSBkcml2ZXIuDQo+IA0KPiBTaW5jZSB0aGlzIHBhdGNoIGFk
ZHMgdGhlIEhJRHMgdG8gdGhlIFVTQklPIGRyaXZlcnMsIHdoZXJlIHRoZXkNCj4gYmVsb25nIHRo
ZSB3aG9sZSBkaXNjdXNzaW9uIG9mIHRoZW0gbm90IHN1cHBvc2VkIHRvIGJlIGluIHRoZSBMSkNB
DQo+IGRyaXZlciBpcyBzb3J0IG9mIG9mZnRvcGljIGFuZCB0aGlzIHBhdGNoIGlzIGNvcnJlY3Qg
cmVnYXJkbGVzcy4NCj4gDQo+IEFzIHN1Y2ggY2FuIHlvdSBwbGVhc2UgZ2l2ZSB5b3VyIEFja2Vk
LWJ5IG9yIFJldmlld2VkLWJ5DQo+IGZvciB0aGlzIHBhdGNoIGFuZCBmb3IgdGhlIG1hdGNoaW5n
IEdQSU8gcGF0Y2g6DQoNCkFja2VkLWJ5OiBJc3JhZWwgQ2VwZWRhIDxpc3JhZWwuYS5jZXBlZGEu
bG9wZXpAaW50ZWwuY29tPg0KDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1n
cGlvLzIwMjUxMDAxMjEyNDE2LjQ4NzEtMS1oYW5zZ0BrZXJuZWwub3JnLw0KPiANCj4gUmVnYXJk
cywNCj4gDQo+IEhhbnMNCg0K

