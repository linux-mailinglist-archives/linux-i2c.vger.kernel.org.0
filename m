Return-Path: <linux-i2c+bounces-13365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB45BB4D5E
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 20:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0409F7B62D1
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 18:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE67272E63;
	Thu,  2 Oct 2025 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDAuCCqP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346007D07D
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759428327; cv=fail; b=b24S+T7sCec4fm8O/qHYV9R4ZNSUiHKTX9W/SlICoiGnnDEVM12QFDDzLdVTWajc+AVKUPrlsjlflFnhI9HGr2XUy8Cd6qI4kCs6g2CrW2rrikQ9UOs3Qq67bio/0QHqqJwi0QI6gEtBCRN092OC3V4cNw2QA/UAxlXM8YjE97c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759428327; c=relaxed/simple;
	bh=DVTWEQ0xu0Nc51ObDXPE0pGrSnG4qUeQthgq8zUIPcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H6Y55uLpc1IEjm9ah6y6YDm6yGzjUGTJ0FF7YIG9ApGwExB8T7hWeJ9ydfDZByTSfmPwa0MCUKFlVI0VMT7/pVjRezLbiL6TPwn7BTlMtFowOl7VFbxpiOYf/vunjQ25sU/CAPvP5nEn/W2P0AT2+kjoyl2AikMqmZXaN9REyNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDAuCCqP; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759428326; x=1790964326;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DVTWEQ0xu0Nc51ObDXPE0pGrSnG4qUeQthgq8zUIPcM=;
  b=fDAuCCqPQ/wsD+Qf4P/aGnRcjSY0qPajLjBjlCsODr/5UQ+Uy5G5G0TY
   n6BkoJqOrKfwN3rtXV6i1mqctaWiczVoTJ91DmYfzRFHQoWAKrLQ6eubj
   jQ0XbUaO3uVaTiijhv6zRgb8941r414EEAsuLgOee4Yg5p4Ccac5pCNtQ
   QlCGkPY2XcZp6YS4kV4DorjgyexudNZNfoW65Lj1Vyc5EzTQR83sSIZH+
   L4FUmQfYNsLKy/1h41o2LFVq8HyH/RO1NKuinZePb9unmuGGTIVJGoJCx
   60jnvv+UAaS8qDYQKqs6YWd0QLqqZwXp1v0n+qMAVscXPOZS3Aq1q7Xqp
   Q==;
X-CSE-ConnectionGUID: mNYDKqrRROycWOZjZKjNaA==
X-CSE-MsgGUID: 30t7tu71RiCiSPloZOUB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61628138"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61628138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:05:25 -0700
X-CSE-ConnectionGUID: Oe2mvcUOTCSUUEsg8Skmdg==
X-CSE-MsgGUID: fx+GMXInSt6kJTTBb6NILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="183396745"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:05:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 11:05:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 11:05:24 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 11:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpyUv08JGmeYugisaxFZgALQuMcVWfwEv7FarVX5hva7V6PpIN/7b7LTUzxG8S+3keUbIiNLLB/Ik1WbJLfoj5CUz6CbASHgFrknZ1dlTxoHFQpVEBN2dAU5Cj9fC1sGWk+IhJHFtrlsyXpSo5YRyTDmcQXaAYlnCD501EmBoEL7e3UrXQLd2/bdPyfKIRsCsf7gJ12dJ/aFg/q/v3YSSGOCEbXrLGUI24+NsdxorYCAC68orJn2KhkCGxT1Lr258RflQLqVGVL+y6sxJGwDxoOf5Uy/7Nv7KcPoxPO7q1RPmMVcPihkiR5AOn3Nmunpav84jcWnDKTJ2qAjyvk7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVTWEQ0xu0Nc51ObDXPE0pGrSnG4qUeQthgq8zUIPcM=;
 b=V6tbOIKp+j6ejENS+JRsphQHGpfTCp+BPN9yEBylRGPB2whFlnq917PIapgyh91LfH4SqZanu7IBb3MIZCK37euBvt042M0NoLaes7V4jIy987jVYsYoCjsxNEG65hf+CoAf8p/c64XskoU0x7JpFzyNpacAEP4CjBBghMT45SajdltWAVBTdF3aesvIjuYl0kDwSo/EuwnPzBj4yok6QVwJLZ83Vsg817zq05TqpV1j3uhua1hlaPnIiZM1GSsifMZeJ2CFCjhuwvflBZwpsZe28NC0yCuz30p9ZzUkkAx/yQZz2/Q/GzVtXOJVEUmf0cyBigTXw0tM/BEUpL+2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 2 Oct
 2025 18:05:19 +0000
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc]) by DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc%8]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 18:05:19 +0000
From: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Topic: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Index: AQHcMxmeb6TxZJKd902vCvsKWQIRQrSt1rkAgAC4C4CAAAYLgIAAPysAgAAuQnCAACFJAIAAAwQQ
Date: Thu, 2 Oct 2025 18:05:18 +0000
Message-ID: <DS4PPF11A2D5672F6724542FB9C1E9AEF60FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
 <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
 <056ae17a-5351-4be7-a14e-9becf8ec404c@kernel.org>
In-Reply-To: <056ae17a-5351-4be7-a14e-9becf8ec404c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF11A2D5672:EE_|DM3PPF0644BB20C:EE_
x-ms-office365-filtering-correlation-id: 1fa7924b-b72e-4c48-6867-08de01de3f56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dUpTOVpuakhMbHlobkFvZVR1ay8wR1FMSzFEV3MxbWtEQzVyclllSTJDcEVN?=
 =?utf-8?B?S3lHaEVDTDlkR2JEaGdRVDRRRmdUSHhvT3ZObFNHdDZFZ2ZPMmswQW1IQVB1?=
 =?utf-8?B?c2RLeTdwaE9CYnBHbEVzVnhpU0hXYTcrWThPTFRRQnlZb0t4MDBNTEQ5QW83?=
 =?utf-8?B?MERiNFpmd0NKQkVOWGVnWEVNY3hLVDhoTWozeEpicm9VT0xXZEtsRk5ISlBL?=
 =?utf-8?B?dkd6cGg3RkFYYXRhUUJORjVXYTZZcDFtMUdpVERZMSsyaUlQcGZQVUtybnNQ?=
 =?utf-8?B?WXRLMnVEek5KUnBqZzFTaExzVnRLRVB0cWhlYmFTT2dYd3BZdTRJdnBWK0tP?=
 =?utf-8?B?bElVOFJSbkVwTkxMTzU2WHErZzhkRTA1RjFPbnBsQlNjZEhsYVp6Q2FaNkNt?=
 =?utf-8?B?bThVWXRjR0tReWlEQlRFUml3OGQ0SkVkRWJ6OXZ5VTgyTFEzL0U1TU1GWW1M?=
 =?utf-8?B?blh3cW41d2RLbkdOZEpMQ1VGOE5laERRM0pwWDMxZHMxUnpzUGxyTzg1TG14?=
 =?utf-8?B?M09YcGU0a0pYcUNLOWJ6dWRrRzhJaFErY29JNWhXWnFueGVoSnFtWDFQNlBG?=
 =?utf-8?B?YXFGQ3ZnbW1ZOGdUcEdjaUhpbS8wOUNJYUNCVWptdUhQODVsazQxcmZaMHpZ?=
 =?utf-8?B?UjJyM25pVE1EcDhtZ2R0N0Z1OGJraTF4eWpjQnFwVUZSZnlhR01oM3BhNmtj?=
 =?utf-8?B?MkRJYVUvUGFTVjZXdVExSE5BUkhnaDhNeTFWc2Vxd3JwOUVEeGQvZTNJWlh5?=
 =?utf-8?B?dW1HK3ZJd3dlZXFVZEtFMEJEUWJ1dDJXQTAraVgzOUUxaFM3dTRDKzNXTG1p?=
 =?utf-8?B?LzRvS09weHhyL1I1SVY3Tk4vRERCMUErRTJKalJ5SkpKUmsrdkRNVnRMQ1Q1?=
 =?utf-8?B?VGtWY0MzdVh5WkZDZTFSeGxuRFNDV3dqWUpWTHlxaVdIWHg4N0hsK0pncUVM?=
 =?utf-8?B?YWhwS000a1VkOTlubW84TUNaVTZzZS91RG1QQkNXampuUFhkTU52cFQvLzli?=
 =?utf-8?B?Wlc0bXZqL1lvN3IyRGNJK3lISVRteXdEeU03VFdlRStyYVlqeUtUcjkyZ3gx?=
 =?utf-8?B?NEpUSDBMOHBvejJ6VzRDWjBhejJRNUM0TWlOeEFuQ0ZCS3pDSWR2NGVlL2hK?=
 =?utf-8?B?a3J0L1pWb1p4UzJMREFUNnRHTS9XNmpFRytha0g5SEVFaEpjTUlEN0lTdkxF?=
 =?utf-8?B?dDI0WklEeGxlbXFiaVV6djdSTWw3bjZieXdCcmhIUkpZTnJXVCtCckpCZzcv?=
 =?utf-8?B?cE52QnlraHZERTFLZWNzT00rZHArT0JwZWw2Vm9IRlVwWEJ3emJhdFBMdnAx?=
 =?utf-8?B?MmRZS3Aza2NNQlJtMWF6ckUvdWR5cjFmWkdKWWJ3TWoxVThKVjZqV1hGMFdQ?=
 =?utf-8?B?OTJPTm5Xa2Y5WElqY3ZMVTZiUzFZVnNwZFphY2x6R1FVS1V5Zk1lYTVNZlpN?=
 =?utf-8?B?TUE3VUVnTGl6aWsvMkhQOHRHYWdVSHFqZi96R1BKbHd6eFJxem41T0NFaG1H?=
 =?utf-8?B?TUJXYXA5TG1hSzJqRzdUd1YwN0JlMSt6V2p6dUxJUUhxdEZDUHptajljWFNs?=
 =?utf-8?B?cytrdC9vOGU4elZ3VnpFTm05MmJud1JrYThIYitnMUJMbVFsUUdTSGNxVXZu?=
 =?utf-8?B?blNGOEVWNElVWHB3MGc1Y1N6R0xQcTg0Y0ttRHdDeTdleHp3cU5TcnZ0WEVx?=
 =?utf-8?B?SFpZa3dLQVZOVGpORSsydEJOMFBUOXc2S09STXYzTS9kOWlxRHN6VW9zRzh0?=
 =?utf-8?B?TEVFNlQrMitDMFZucHVmT2VRZDArcXp0OEhYQWtVQlEwOFZMZkRuQkZQVnc1?=
 =?utf-8?B?VDlRd2ZUWmJNNm1MU3puYkx5NUgvMUpjc3hYQkxwdlArakkxckxSdVFMeUE0?=
 =?utf-8?B?S1poeG1CUTdLTnBPa3JNSnFDM1pxWkFJM2hnZUZhYTBTODVvVVQ5QmYxVC9T?=
 =?utf-8?B?SEE4ZCtsK1paWFlnaDE2VXlzNjFQWGtyTmVDRlI0UVBoU01naFBWV0xFVnh3?=
 =?utf-8?B?K3hoeTU1SGtBeEJHVWxGMzVxRzNmZFhvT2RGcjJkOGtFNGt1ZytRWjRnVlBZ?=
 =?utf-8?Q?d7EzXV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF11A2D5672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE9GTFNVSDNaOHdQTXZyakxueHpwYVlnVlFYdFNDU2I3aXladXRGaG4yTTJG?=
 =?utf-8?B?dGNOMEd3VkhSU21TR2FSMWZpQ0dGanpIWlhOQ3MxNTNPOHFHZFpJVEFmQlo1?=
 =?utf-8?B?SGlmajZGVUhQeU1Wem1oanoxLzh3bTNxVlJFY0p2OGZMdTJnWnp6SVFQR3E5?=
 =?utf-8?B?cXNYcUJPcUxtczZrZ2t1Q21ObENtVVZNNDdsU004cFdpOWdHaXd1VE9ucXhG?=
 =?utf-8?B?TVFQWXVSaW5PRGsxK0h1bVNhUUlnazdyZVJJRjViK1VRcmE2Q0Y4L2pIbklW?=
 =?utf-8?B?MlJNVnpuVDVzWkU0c1RibzlXZE5KREVITE1OamZqWUZndnBoMnpESlNwd1Yy?=
 =?utf-8?B?aXdRQzY0S3dYdHFWNkxBbU92YzQyRmJyRXREb0FkSjRMd2lvb3Q5VWNVM1p4?=
 =?utf-8?B?K2tLZW5VQTJJcldSUG1XQXpyTXJxZjlYV3dkdFg3cEQ3Y0duRWk2UzV6VjJM?=
 =?utf-8?B?SDVBck50aVhvYjZmd3QwSzdOOGFaMk9HUlg5MXltYVFrdWdROGJGaXp1RVV4?=
 =?utf-8?B?RnlLTGVsQW93cUFmenBkdSsySkhkVnkvV0NTMnFiL3ZoTE9MTk1qU3hublJF?=
 =?utf-8?B?NHBid3NPN2pndzkvalY0d2xBb2FXY1RJYTBWNFZxUHJENE1aSVRuemQvVUdI?=
 =?utf-8?B?VVFKSzhQMjU0UUI4WGp4VDEzT1ZTM1pmUmNYK3I3TlloMnRBTFdYR2pHcDJ6?=
 =?utf-8?B?bEU1Z1JKZklUYzJOVjJSSGJ4aFcra1NtaWlwRU56d2pMS1AyS2M1Mi9abkJE?=
 =?utf-8?B?TVhTajZsWU5CSzVEcGlyTktTWEh0Ulk2M01HN0JhQ3VlaHVwSGYyb1NOcEFU?=
 =?utf-8?B?T0NZL3R0dTZmTVgrQUpzbVYvR28yZVlrWWwzYkhaTzVkVUJuQVdSNDc4NzV6?=
 =?utf-8?B?Q0VqeTM4SFJBQ24ybmQydlQwQ2MvTEN4TDV4aGF6dENEbm8zTzVoM0t6dnhl?=
 =?utf-8?B?UGFETkZ6V2NrWTFNbkFGNEwwUkJINk10MWN5WVFqeDBXaWZiSmZvNzdoZlRZ?=
 =?utf-8?B?c0NQbzFyQVV5anFUMzhuWUZuUEJSV0Z3cUVvL0lwS1ViZVVMWWFLQnVGUnUz?=
 =?utf-8?B?d3JML3RsQmEzZ1M3OVV6QUhnNkZMS0FyaXppVVRzdWhJZm0weHdEcWV3bXJm?=
 =?utf-8?B?TkpjMElGVHUyanphclFYZnIrSGt4aTBTZlBpRWoxS0pVSXN6Y1ZGbXY0bWVW?=
 =?utf-8?B?cEFYdzJvMUsyM1hFZVlBTWR2djhJSE5UeDVTUkMzbnhVRHVpa1Mvc21ISUg5?=
 =?utf-8?B?cDZuQ29pa1ZJTjFjbTVTTktvR3pWbmNoSkdyS0xLUDZvQmRxQ0RXRmRsK05j?=
 =?utf-8?B?bGFhSFI2U01EREZaQnVnODJWcGREaXQ1bzBLcDdWNmozOFJ4U1dwZmNxb3l4?=
 =?utf-8?B?NzNSRGUvN0c0VWtSYm01SHp2TzVzT0gxU0dYOUtEVlpQR0NyeThkSWlmaEJp?=
 =?utf-8?B?NERsZTZwNjEydm1hbU9ndXBQdlk3LzdYUHYyTkdpYU9BR2d4Q3JZS08rYStN?=
 =?utf-8?B?MXVIdEpLMEpPY1NwNUlPZVJ5L3NYSFhoekNJclJMTkFDSWZGUHBzeVV2dmVW?=
 =?utf-8?B?cnhJMlJwdlVtdVYyVXA3WlIwMXVWUVFtQkthNU5VbFRkaG52eWpWcWZzQlow?=
 =?utf-8?B?MHFaeVp1R3ZUOGwvUUZ3TE9Od0p2VXg5TDF5MnY2MXplM1hRbXpsSTA3Y0wr?=
 =?utf-8?B?a2VQQUd0cC8xVHcxUzBHamlXTXg3aHd4MlZBUGxpQm9aVHduOVJrN3NSNU5E?=
 =?utf-8?B?V3NyZXhMc3ZkUllEdEFZWXI3ZVo4RjY5NTVxM1ZleEpDTC9EUjZPSS8yZlMw?=
 =?utf-8?B?NTR1aHptR1UwWDI0cjh6S0ljVFZCZkQyU1Q4WndwdHJkYVI3bzJWakl0M2V1?=
 =?utf-8?B?U3hld1lOaS85MW5xb3EzeWpKNVFoNENOMEpHS3R4T1pmUDNQUHlGdWQ5SEVC?=
 =?utf-8?B?MXRjUlAwdDBjdS94QzUzUDA2SnY0NFJrek1uVEl3OUlvK2JoZmdUMWFWT1JZ?=
 =?utf-8?B?cTdJN0xxVHhyNjJPMHprTENpTFhuWjhkWktINUV6NHB5UzRSb2lVeFhkUkN5?=
 =?utf-8?B?Umo5c0prRThSU1JjWEJkMWJoOWgrdTA2emZjdE0rbmRLUXhQNi9vZkQwMkxw?=
 =?utf-8?B?Nk1heGNHRFlGcjZnalhrdzJITC9QakZiNkluS05NZW45U3Z6dCtsVk9GYUV4?=
 =?utf-8?B?bHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa7924b-b72e-4c48-6867-08de01de3f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 18:05:19.0139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzcMKIFLET+PJ+MVDJHzfsO6I4kHhsSWipo2eMflTn8g2N/eqxhqrNDB2hSWYcROCHwRf8cM+Wc2bsNSn3NwP4wgtxEDT4naSbxRswiiMQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-OriginatorOrg: intel.com

VGhhbmsgeW91IEhhbnMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9i
ZXIgMiwgMjAyNSAxMDo0OSBBTQ0KPiBUbzogQ2VwZWRhIExvcGV6LCBJc3JhZWwgQSA8aXNyYWVs
LmEuY2VwZWRhLmxvcGV6QGludGVsLmNvbT47IFNha2FyaSBBaWx1cw0KPiA8c2FrYXJpLmFpbHVz
QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9y
Zz47IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy0NCj4gZW5naW5lZXJpbmcuY29tPjsg
bGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaTJj
OiB1c2JpbzogQWRkIEFDUEkgZGV2aWNlLWlkIGZvciBNVEwtQ1ZGIGRldmljZXMNCj4gDQo+IEhp
IElzcmFlbCwNCj4gDQo+IE9uIDItT2N0LTI1IDU6NTIgUE0sIENlcGVkYSBMb3BleiwgSXNyYWVs
IEEgd3JvdGU6DQo+ID4gSGkgSGFucywNCj4gPg0KPiA+IExKQ0EgYW5kIFVTQklPIHNob3VsZG4n
dCBiZSBzaGFyaW5nIEhJRHMuDQo+IA0KPiBZZXMgaW4gcHJhY3RpY2Ugd2UgaGF2ZSBzaGlwcGlu
ZyBoYXJkd2FyZSB0aGF0IGlzIHNoYXJpbmcgSElEcw0KPiBhbmQgc2luY2UgdGhpcyBpcyBoYXJk
d2FyZSBvdXQgdGhlcmUgaW4gdGhlIGZpZWxkIHRoZXJlIGlzDQo+IG5vdGhpbmcgd2UgY2FuIGRv
IGFib3V0IHRoaXMuDQoNClRoZXJlIGlzLiBERUxMIGhhcyB0byBwcm92aWRlIGEgbmV3IEZXL0JJ
T1MgdXBkYXRlIHRvIGZpeCB0aGUgSElEDQpvZiB0aGUgc3lzdGVtIG9uIGZhdWx0LiBUaGF0IGlz
IHRoZSBjb3JyZWN0IHNvbHV0aW9uIHRvIHRoZSBpc3N1ZS4NCg0KPiANCj4gPiBXaGF0IGlzIHRo
ZSBVU0IgSU8gZXhwYW5kZXIgaW4gdGhhdCBzeXN0ZW0gKGxzdXNiKT8NCj4gDQo+IERlbGwgUHJl
Y2lzaW9uIDU0OTA6IDgwODY6MGI2MyB1c2ItbGpjYSBkZXZpY2UNCj4gICB3aXRoIElOVEMxMEQx
LCBJTlRDMTBEMiBhbmQgSU5UQzEwRDMgQUNQSSBjaGlsZHJlbg0KPiANCj4gRGVsbCBMYXRpdHVk
ZSA3NDUwOiAyYWMxOjIwYzkgdXNiaW8gZGV2aWNlDQo+ICAgd2l0aCBJTlRDMTBEMSBhbmQgSU5U
QzEwRDIgQUNQSSBjaGlsZHJlbg0KPiANCj4gQXMgSSBhbHJlYWR5IG1lbnRpb25lZCBlYXJsaWVy
IGluIHRoaXMgdGhyZWFkIHRoZSBzaGFyZWQgSElEcyBhcmUgbm90DQo+IHJlYWxseSBhIHByb2Js
ZW0gYmVjYXVzZSB3ZSBoYXZlIHRoZSBVU0IgZHJpdmVyIGJpbmRpbmcgYnkgVVNCIFZJRDpQSUQN
Cj4gZmlyc3QgYW5kIG9ubHkgdGhlbiB0aGUgY29kZSBsb29rcyBmb3IgdGhlIEFDUEkgSElEcyBm
b3IgdGhlIEdQSU8vSTJDL1NQSQ0KPiBjaGlsZHJlbiBzbyBhdCB0aGlzIHBvaW50IHdlIGFyZSBh
bHJlYWR5IGluIExKQ0EgcmVzcC4gVVNCSU8gc3BlY2lmaWMNCj4gY29kZS1wYXRocy4NCg0KQWdy
ZWUgdGhhdCB0aGVyZSBpcyBubyBkcml2ZXIgcHJvYmxlbSwgYnV0IGl0IHdpbGwgYmUgYmV0dGVy
IHRvIGhhdmUgYSBwcm9wZXIgc29sdXRpb24gYW5kIGF2b2lkIGZ1cnRoZXIgY29uZnVzaW9uLg0K
DQpUaGFuayB5b3UgZm9yIG5vdGljaW5nIGFuZCBicmluZ2luZyB0aGlzIHRvIG91ciBhdHRlbnRp
b24uDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCg0K

