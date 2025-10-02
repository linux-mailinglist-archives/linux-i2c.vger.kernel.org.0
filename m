Return-Path: <linux-i2c+bounces-13363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C98BB4675
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 17:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA85F3C529F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 15:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23CD230D14;
	Thu,  2 Oct 2025 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuxEPoHp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355E1E5213
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420337; cv=fail; b=XOgUcD2uLB0kGTyy5KDxbVEL9YBGIJG0Ok4QqwBcyZqFeaK5XxqakzCTuEK2ZYLaZYBxGNDosaPdobaxjdt3itq9arHLGQaxBVRHak2RxCI2nj5oH22DILc1BvdjzoXjY0hmA2J8tsLdKoGcvsOpl1gjuX/FCVAll36A8hWEVzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420337; c=relaxed/simple;
	bh=vhCZLg9IKgkRs8cweqZiKUsm4xGU1qBl0nNSzyDrpzo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HMWlIQ5+xrf3VdrVsSvsf6I8xpbCaTMNnpQlEdUdRI4Ocw4BPxy3HXKyFFq/FTrPA43wfshUPlm9q0hz6CjAELS79AikdGyCR1oVoU560h/3N5i/MnEMddAOO5gl5A6SqASz+lhwa4FDZarLv7qfJAnWCPlKwjWETOxBZ37puE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuxEPoHp; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759420336; x=1790956336;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vhCZLg9IKgkRs8cweqZiKUsm4xGU1qBl0nNSzyDrpzo=;
  b=BuxEPoHp50jF86xEobouAVKZ7X52Oz29cMVZXFxEjp9jhHrAXyIBkIn7
   83HLy4H/P7Opsk3uBZohQOIA9EzATzpUo490LMoPh4lG8UI5qXdXbflNk
   Si/K+K5le2ci86zGpTOHazM2HsMqM4F85pdOqwWYC+Bt4tvCmnSNlQ/j8
   URnFStjHi/Qs5xtMkM6dSaKlPMMTUEXNX76EXpMQdq0vg8Qs9pWZIRbFm
   lf6OfA7Iv77OmNpcQNPUIu1Sud1tGso5VJLH35OuhavszfR4RFEq6EGgb
   /R0E786Hm/0eDMYcuFfBiVHMiMMbdiRWdy9+mOcse6gSmogGWdK2DwGVV
   w==;
X-CSE-ConnectionGUID: GneLK60vTK2zxx1dZCho1g==
X-CSE-MsgGUID: mkJbIIWpTNKT41w+GvYJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72324080"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="72324080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:52:15 -0700
X-CSE-ConnectionGUID: kmznDsKrTduIw8XBts+JVw==
X-CSE-MsgGUID: IhW3xarTRPKGNPb5h1/JGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179091618"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:52:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 08:52:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 08:52:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 08:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1ihS2AlWll3DAjXncxXOSW39TvC6F5i13U02bIgbQT5BXWjmIkPFJU1lNkDMlVKpr/jm+yF4Vi4TN4V7UpFK0ktoYgfAnfLASeo3KzwQ4v9oY/GJ1l9XlGp2jeZADh6ViS6OkynWfQ7z1GmyLNQTcjP/jfCayyM3KGhxvONxaU+l8iFi9u1giiZxpNBUGCRhyYHwSFYRWMzG1TSvoqMAzsqcvJ6d7L/BzyT3FuQt84MLav/G2I8kcqxdBPIBcDAjzyFPjhLRnEmm+Mmrpa+Hq/ZtAXlqnFIrPIJzBAJIwvWrCRiHaJYllAUsGvagWKFcGiz20X/4DLxzCx/6SVSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhCZLg9IKgkRs8cweqZiKUsm4xGU1qBl0nNSzyDrpzo=;
 b=HXwIX3ALChpRx+tQ6OF7pGMzG7mQvScNQYKzBVTNotQwu358ng3Zds9dCqprgRyWJwFGc+kfqUx8uxxtC7QPokLm3pvjGcGP6sIfInSgYc+7593XqeQqCtJkM9I8Ydv3kPLWUNH2FlJ6939NBLAUXTTHOYftOAQ7c5uWhu1YSBHlQbP7RpO4O7v6CBuG5doCt2kC2gJjgGJ/LmY8ftUEAsOXZT/XHrERbqpQB++s/ySr+gdGCN7KHD4U2VNatjhvNyJAIgOUWXxOx9rlEifCOMcHDM8HMIPwBiHpq2MI6TiNdYIOdcCU7bAKzxQ+RYRt+4GpHljgTkOl2EGYbHWz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 15:52:11 +0000
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc]) by DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc%8]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 15:52:10 +0000
From: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Topic: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Index: AQHcMxmeb6TxZJKd902vCvsKWQIRQrSt1rkAgAC4C4CAAAYLgIAAPysAgAAuQnA=
Date: Thu, 2 Oct 2025 15:52:10 +0000
Message-ID: <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
In-Reply-To: <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF11A2D5672:EE_|SJ2PR11MB7574:EE_
x-ms-office365-filtering-correlation-id: 7d73c77d-dba8-4724-20d5-08de01cba609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S2Q4L054SHhJTUt1dzljUXljdm40MnBZd3hUc2VJYXZRRk5XU2wrOGpwMUo0?=
 =?utf-8?B?My9BY1NVa1hvWU1lSXdtM0tHQmhOKzhsS0NJWTROR1dpNHJCRHFqcWtyYTZw?=
 =?utf-8?B?TjErNW9Bb2JxRC9HaG1SZnFuUVN3ZzF2ODAxeUQvVm5VRU9RRjFPR1IyMi90?=
 =?utf-8?B?L1pzTzRsbiswakExOGV2Y0tBaThkdWN6U3VQZmxHdGRjRlFUWmRqUmhzdXcz?=
 =?utf-8?B?UDhrdkM2dWtHR0o2ZCtKMkxZUXJBT2sycmRIQXEzOWF5R3krdjNTVldmZkY2?=
 =?utf-8?B?b2x2TndaZWcwR1BCWVh4NlhKL1FiV0xzRVhBQW9pK1o3UkFCMEdYTU84dCtr?=
 =?utf-8?B?dkVVYlhUU3FXME5jQUFHdTliRkJzaVN0ZE1ZSXhLaUhmbC9RbXU1UmV4WU1a?=
 =?utf-8?B?blZBNExjK25Iek5YSHNlRkpiSkZZeHBtWkFDQWc5R013QnVVaDM0M3drVTBE?=
 =?utf-8?B?Q2ordDh5Z0JsZVVvSm5odU0zTTVJaVJQaVNGSytNWWhodnVNMXhCTnRjUVo4?=
 =?utf-8?B?S3hvL1liN1pVdVRqZ0dGck5HVWlwazYvRU5OOTFRK0NXdlVnUEQrcmxicG1r?=
 =?utf-8?B?WEZzUlUzU3Q2NFpEYVdXQXYxenJtcVpGakN0c1YxdTFxUDJ2V240RG00YnJX?=
 =?utf-8?B?ckdFL0NnUjI2c0ZMR2dBNk1kRDFGVkhHS0ZYS3ZveC8ydFl3Z2wxUzJsejVC?=
 =?utf-8?B?UGgwUS95Ymh4MVJKbWpIKzJyZEE4UXRVdUhkV2Q4TlZCMXNoVStQUnRySmtK?=
 =?utf-8?B?bnhneUZNZ3ZBdHQ4bTVVQzR3WnpoYTY3NkN2dEJMN012a21LNDdKdXowbDhH?=
 =?utf-8?B?eC90S2QwUldZY1V1dnRRcC9GVEJDL0h4Tlp3MDdsR3dETG1CbGZaL0tDb09j?=
 =?utf-8?B?Rjk2NlpHeUZMM3RuWVBLTUZaZzFuMWRjMVNmSzFVL3BaZVBpZWgrdmZUVmg0?=
 =?utf-8?B?MDcvWWljZGh4dFVheEYxSEJYZk5hdms4UTlmNjdWTktyQTBBQU9ScmtPSGV3?=
 =?utf-8?B?a0NLNC9CZmJwMTZDcFkzQXBXckJqdXcyaUREeVFmcno5M1NwUFFJOWViSDd1?=
 =?utf-8?B?QmNnZjRRemdsTitBamsza0craGdrNXNrMG9KN043TVJueFFoUTUvR254Y25i?=
 =?utf-8?B?NjQvUE9OeTlKUkxyNk9PZVhFcWJuOXZDNnI3OEFWaG1mMkZKMi9TenRlYXJt?=
 =?utf-8?B?b0Vja2x3MnhiZFVaenRCNUtSQitDbnpQVDJ2bkpaeHVMZEtyVXJ4TGZQcFhC?=
 =?utf-8?B?cW5mYklycHUzcGMvSnZDQnF2SUJ5enJPRkNqSm4veHl3dzRCeVc3dVYralJT?=
 =?utf-8?B?WmlKNFN4RlMxVnlVUzFOTWttKzlLTG1QbnR3aWNTcCtPNW1ML2Y1S251b0pm?=
 =?utf-8?B?dFhyLzVRbCtvMG1aMlNTWkJlaDdCZjl4YUxTa3ZOTGVacTdVVm9uaHF0OUdr?=
 =?utf-8?B?NEZFWHdMdWxRV0w5dTN1WllpMEVHem9MeGc0UVo3K1A5MllUa1BiajdOTnhG?=
 =?utf-8?B?V0dHMWtremxOQXpLdGlXdXhqaDRnNFA2YmFLREhxTnlTTmVZd0dLRmJ4TDNG?=
 =?utf-8?B?TGhNcWFLbVZFLzJUc0lRcmJDdmJTWTZ6ZWdPQjRrYVZBQ1FkdlgybUVXa3A3?=
 =?utf-8?B?UFFnekl4Z3p4elRyelRQUjFUbjVLVjZjbGlRTUhrb2k5ZlNLbDlwTWpFV0Vh?=
 =?utf-8?B?UmJFUXZWUmd5cjVMS0xzS0VmS281K1RzMTY5M2tLMDYvWUg5cTFabDRlclhp?=
 =?utf-8?B?S0h1OHdkWDh2V0UvWFoveE41cXp1emU0d3FzYlVWd1ZCdThJL21EcWk4L1U2?=
 =?utf-8?B?eHNSU2xhTlN3N01OQzBMREtBeFhDb1NIYnMyaDcvTkVhVG53MWxHM1BqSGJu?=
 =?utf-8?B?Wi9sT0hwTFpzajVUeDVSS2VuWDJTU3Q1VkprY1lTNkZnRCt6UE1zQTZMSUgz?=
 =?utf-8?B?dTNuZHFDbWlWamRIdHdCdS94SkF6cjRBbVVaY2p1Wm4yZHhOZ1pTYW00TjRz?=
 =?utf-8?B?ZmxaeXR5QlZoRXY1NGRlYis2Q0ZZQzZscTVYeGFNOFdVQ2tQV3UzYzFSYm5n?=
 =?utf-8?Q?aAAJQ2?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF11A2D5672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDU4SHBhRk5hSFZwbkh0WllQMXNhSXB6OTFpa0JPYlZ2dGRMdTduMVl4T1lJ?=
 =?utf-8?B?T0xWS3ZIQ0VyR0tpTGVaQkM3MjlpTjQ3ZjloU0FCTy9uaStabXF4SldtMkU0?=
 =?utf-8?B?L2N3eEFiSUFBTGMwdzkzTUt6OVZZWm5ORFI1ODdvKzlydnNudllqcjVWendV?=
 =?utf-8?B?eEtMSUppZnJqbGlNZlpyOC9pZzhmNFZWNFFDNk12YnhGSXNYR2YrQ0d3Q2xD?=
 =?utf-8?B?MXhpTVhVWW8vWDAvRGwrL0NCeGJZK0ZHVGYvdVVEMXJUWlVwWlhqRVdGeStp?=
 =?utf-8?B?UXlvUnhhbU83c2hQR3J6c21tVUxKeE9UZDZWTGNqUXRDUFNhcEhRNnVwQkw1?=
 =?utf-8?B?cFBNSzcwV2FYVzBiUjIrTFUweWkrRzNlVUJqRU5kL3p3WENTMnM3Z0JmRjBl?=
 =?utf-8?B?VjBvSTVWSUdwTzBQcyswY1RyQTJCUUpvT1hXZmJDaWFaNGdaSlJvWEpzWUw1?=
 =?utf-8?B?bFZ5OUNkbnR5eHZxamJFSXdQc1NNTVYrYlFZZmVMYkZPZWdWamkwT1N5eHc1?=
 =?utf-8?B?M21NNjBsdW11cTNsUjRQM21IeVpJK2VoVXAxYXhIWXJ1ajV3dDQvWFhVclI4?=
 =?utf-8?B?dEtCT01HR1Z6UitaQkgzejZHYlNqT2QrYXBXUW9YQnZMeXVLa0pmY2Vkbkg2?=
 =?utf-8?B?cjBOS2EzOUtCa2ExcHpRK0xlZFVJcnoyQ2JlTlFZOVJpMDJTbmdqOHprdFVQ?=
 =?utf-8?B?YmprdzZ2NXBqVGo3MzV6WUZndUg2ZlBweGU2UmtKT1RHQ245UHBFWmt6NERx?=
 =?utf-8?B?SVN4Rmx0YTRsc1Zwb21ITGZxeWx1RkpiNk5qcGkrTnBmTXZiV3J4RVVGMXNr?=
 =?utf-8?B?bjlNMFg1Y010MTRYaXozdXNPakpDRVdPNUxNUnZhZHlZbUo2VGxITWt2QWs1?=
 =?utf-8?B?eG5ienZQdWxOeThOQVp5NGlwSlo4UlNqbHhMNnFId1g1b0Z3Uy82eHRjVGE3?=
 =?utf-8?B?Mk9xMHp3TnZ5eEN5SFZRMEdNQ21mWVpoWlRKR2cyeExLK2RsaS9EaUw0Rk5X?=
 =?utf-8?B?ZUV3cS9Nd2FDc3puME1kSm43VTN0MFF4c0dPbWNIT0VEUUYvVGZiL3B1RnBs?=
 =?utf-8?B?dWJJN09uL213WDRRNDZuaXZaSkxDM3BmaGc2V1I0UHllVWVTeWFob016UHpS?=
 =?utf-8?B?MS9xSElCVjZUVTJTOGo1bmR0Y3Q2dkE2SmtZMGJReGhBN3EwemZxVTJHOTVC?=
 =?utf-8?B?bFBLTUdkZVpyVkM5b1NFWGZXbGFuNFZxeUtzSHo2OTI2eWtveCtFWnBtZTdv?=
 =?utf-8?B?czJvb1EvNC9TTDN4aGIrRjFqQ2s0UGhXSlcrSkdqYXR4YnpIWnRwN0FPMG4w?=
 =?utf-8?B?ZFE3VkVyWWRJdEdyQVNKWll3ai9CWnZYVUdPTVdMbXY3aUZkT1VDNnFUOTdF?=
 =?utf-8?B?N3NjVjRIRTN5c0Q5bHp3TmdlRXVlYUk0dWM4eERjdjRCWDFSeXBURXhXRVlB?=
 =?utf-8?B?aWVGTWU2YkRISjVseVZaSXUyTWRHRWxVY1ppaDZZRGRvbUhVbktFZFo2ZnZY?=
 =?utf-8?B?V2hnRVpRQkVybU1YNllmeGpQa0xjSlR6Wms1NUk1SUpOd0dlZXBuU3lpd2ln?=
 =?utf-8?B?eXdpMGNDRUlmaG5HaGN0Ni9ibit4SERhQVhURGJaYStweTN2VGM5eFZJQXps?=
 =?utf-8?B?WWFOR2dTaUhKY1dpZ21HWHRuZVM5QTRLVWxzRWlZUjBWWGJZQmFhMDN6d2pu?=
 =?utf-8?B?bTl5cmk5UjlYb1BTeWFidmovTlIrVi93Uk44N0M2TER0RnhsWVpPVm9HSytM?=
 =?utf-8?B?YmI4UzhyRUlQSEhHSzA4MkdpZGRYRkJzbG01cXFyNDU2azJCMktCdTl1RStn?=
 =?utf-8?B?ZXNVTnpJVzcyTnBiMHpRekNDNXVEb3Y2bjFUQ01PdEtlVXBFWHQvSnJqK1Iv?=
 =?utf-8?B?RWxCNmpWYTZtMG1XZElUZ2xHS3poSHpQaHZmS1ZZUFcwcW1uWFFvMFE2cm4r?=
 =?utf-8?B?ZWR3WE54VkcyZXc5VFhmZWRSemVPNWNjR1Z1S0srTXVzYXYwbkxsUHd2c0Yy?=
 =?utf-8?B?OEc4STc5Nld1Uy81dENoeWdSNCsxTTVCWS8wQWgrVmVoZFZCQ1RacjY3bGdH?=
 =?utf-8?B?TWdJWlVsSTF1UnZuZ1NicUhEYTlWUjhZVmlxWVJ3NU96TkpTeGtRbWxiTTNZ?=
 =?utf-8?B?cmpWLzgra0UzYzJMeXJSL1FZdHRPM2ZlV3JCNHBRL29rVzVmZ0gyZkdCYmFm?=
 =?utf-8?B?Qnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d73c77d-dba8-4724-20d5-08de01cba609
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 15:52:10.8631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRSJN2QXIqEyYqEB27h3QlGkAv/2UB/7OIvH7DF78kjMb0xrn1GY2bCW7Tj+1OFYwX4nSlJPhFe4RbWgy7cTUY3F2lUYG4mB+bwcuOQ69/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
X-OriginatorOrg: intel.com

SGkgSGFucywNCg0KTEpDQSBhbmQgVVNCSU8gc2hvdWxkbid0IGJlIHNoYXJpbmcgSElEcy4gV2hh
dCBpcyB0aGUgVVNCIElPIGV4cGFuZGVyIGluIHRoYXQgc3lzdGVtIChsc3VzYik/DQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2Vy
bmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMiwgMjAyNSA2OjA1IEFNDQo+IFRv
OiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBDZXBl
ZGEgTG9wZXosIElzcmFlbCBBIDxpc3JhZWwuYS5jZXBlZGEubG9wZXpAaW50ZWwuY29tPjsgQW5k
aSBTaHl0aQ0KPiA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPjsgV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT47DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGkyYzogdXNiaW86IEFkZCBBQ1BJIGRldmljZS1p
ZCBmb3IgTVRMLUNWRiBkZXZpY2VzDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDItT2N0LTI1IDExOjE4
IEFNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gSGkgSGFucywNCj4gPg0KPiA+IE9uIFRodSwg
T2N0IDAyLCAyMDI1IGF0IDEwOjU2OjQ3QU0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+
ID4+IEhpLA0KPiANCj4gLi4uDQo+IA0KPiA+Pj4+IElOVEMxMEQyIGlzIGFwcGFyZW50bHkgYWxy
ZWFkeSBjbGFpbWVkIGJ5IHRoZSBMSkNBIEnCskMgZHJpdmVyLiBEbyB5b3UgaGF2ZQ0KPiA+Pj4+
IGFuIGFjdHVhbCBzeXN0ZW0gdGhhdCB1c2VzIFVTQklPIGFuZCB0aGlzIEhJRD8NCj4gPj4+DQo+
ID4+PiBBY3R1YWxseSBpdCBsb29rcyBsaWtlIGkyYy1samNhLmMgc2hvdWxkbid0IGxpc3QgdGhp
cyBISUQuIFRoZSBzYW1lDQo+ID4+PiBwcm9iYWJseSBnb2VzIGZvciBhbGwgMTBDRi0tMTBEMy4N
Cj4gPj4NCj4gPj4gSSB3b3VsZCBub3QgYmUgc28gc3VyZSBvZiB0aGlzLCB0aGVyZSBhcmUgYXQg
bGVhc3Qgc29tZSBEZWxsIHN5c3RlbXMNCj4gPj4gd2hpY2ggdXNlIGEgY29tYmluYXRpb24gb2Yg
bGpjYSBhbmQgTWV0ZW9yIExha2UgYW5kIEkgYmVsaWV2ZSB0aGVzZQ0KPiA+PiBkbyB1c2UgdGhl
ICJJTlRDMTBEMiIgSElEIHdpdGggTEpDQSBmb3IgdGhlIEkyQyBwYXJ0IGFuZCB0aGUgc2FtZQ0K
PiA+PiBnb2VzIGZvciB0aGUgR1BJTyAvIFNQSSBwYXJ0cy4uIE9uZSBleGFtcGxlIG9mIHN1Y2gg
YSBzeXN0ZW0gaXMNCj4gPj4gdGhlIERlbGwgUHJlY2lzaW9uIDU0OTAuDQo+ID4NCj4gPiBMSkNB
IG9uIE1UTCBpcyBzdXBwb3NlZCB0byBiZSAxMDA4LiBEbyB5b3UgaGF2ZSB0aGUgKlNEVCBzbyB3
ZSBjb3VsZCB2ZXJpZnkNCj4gPiB0aGlzPw0KPiANCj4gSSBqdXN0IGNoZWNrZWQgdGhpcyBpbiBh
IHNzaCBzZXNzaW9uIHRvIHRoZSBEZWxsIFByZWNpc2lvbiA1NDkwOg0KPiANCj4gaGFuc0BwcmRl
bDp+JCBjZCAvc3lzL2J1cy9hdXhpbGlhcnkvZGV2aWNlcy8NCj4gaGFuc0BwcmRlbDovc3lzL2J1
cy9hdXhpbGlhcnkvZGV2aWNlcyQgbHMNCj4gaW50ZWxfaXB1Ni5pc3lzLjQwICAgICAgaW50ZWxf
dnNlYy50ZWxlbWV0cnkuMiAgc291bmR3aXJlX2ludGVsLmxpbmsuMiAgdXNiX2xqY2EubGpjYS0N
Cj4gaTJjLjENCj4gaW50ZWxfaXB1Ni5wc3lzLjQwICAgICAgc25kX3NvZi5oZGEtcHJvYmVzLjAg
ICAgc291bmR3aXJlX2ludGVsLmxpbmsuMyAgdXNiX2xqY2EubGpjYS0NCj4gc3BpLjANCj4gaW50
ZWxfdnNlYy50ZWxlbWV0cnkuMCAgc291bmR3aXJlX2ludGVsLmxpbmsuMCAgdXNiX2xqY2EubGpj
YS1ncGlvLjANCj4gaW50ZWxfdnNlYy50ZWxlbWV0cnkuMSAgc291bmR3aXJlX2ludGVsLmxpbmsu
MSAgdXNiX2xqY2EubGpjYS1pMmMuMA0KPiBoYW5zQHByZGVsOi9zeXMvYnVzL2F1eGlsaWFyeS9k
ZXZpY2VzJCBjYXQgdXNiX2xqY2EubGpjYS0qL2Zpcm13YXJlX25vZGUvaGlkDQo+IElOVEMxMEQx
DQo+IElOVEMxMEQyDQo+IElOVEMxMEQyDQo+IElOVEMxMEQzDQo+IA0KPiBTbyBhcyB5b3UgY2Fu
IHNlZSB0aGlzIHJlYWxseSBpcyB1c2luZyB0aGUgSU5UQzEwRCogSElEcyBhbmQgdGhlc2UNCj4g
YXJlIHRodXMgZHVwbGljYXRlIGJldHdlZW4gdGhlIExKQ0EgYW5kIFVTQklPIElPLWV4cGFuZGVy
cy4NCj4gDQo+IE5vdGUgdGhpcyBkb2VzIG5vdCByZWFsbHkgY2F1c2UgcHJvYmxlbXMgc2luY2Ug
d2UgaGF2ZSB0aGUgVVNCIGRyaXZlcg0KPiBiaW5kaW5nIGJ5IFVTQiBWSUQ6UElEIGZpcnN0IGFu
ZCBvbmx5IHRoZW4gdGhlIGNvZGUgbG9va3MgZm9yDQo+IHRoZSBBQ1BJIEhJRHMgZm9yIHRoZSBH
UElPL0kyQy9TUEkgY2hpbGRyZW4gc28gYXQgdGhpcyBwb2ludCB3ZSBhcmUNCj4gYWxyZWFkeSBp
biBMSkNBIHJlc3AuIFVTQklPIHNwZWNpZmljIGNvZGUtcGF0aHMuDQo+IA0KPiBJJ3ZlIGFsc28g
YXNrZWQgZm9yIGFuIGFjcGlkdW1wLCBkbyB5b3Ugc3RpbGwgd2FudCB0aGF0IG9uY2UgSSByZWNl
aXZlIGl0ID8NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCj4gDQo+IA0KDQo=

