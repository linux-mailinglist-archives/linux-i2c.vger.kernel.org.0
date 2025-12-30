Return-Path: <linux-i2c+bounces-14868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE9CE86E9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 01:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375203011192
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 00:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D34E2DA76A;
	Tue, 30 Dec 2025 00:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHtBg8Wh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793E26CE2F;
	Tue, 30 Dec 2025 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055267; cv=fail; b=KGhFoURBrLIQmSIw7ECRMF4iCEHR6j6kctqulkgPRc6qbqAJ6WnaY0hKdCYOlm1/RxeCwiVbgWX4lzE0CJolz2cgrFjOwiE18+sqWp6/f1rL/Cq3tY1770cgKnG8rDGCGTk9JBigoU91iamLlsLxXr2OwgRY+nlAoNnT+MDVy5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055267; c=relaxed/simple;
	bh=0jc16l4eB4BU0hG0OpLcY+BoepW8BXMbI8QCoGkNvnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JjZMzB+aOe3701x1Opn2RWKVMRnLAPgjDulT7249nsq4swcBX/6kJyMw5+IJm2LG0s3ZoR2J/gqVcBERdbPhN9mpoBRvf4EZGn+ptuCIAqXb+OLRTP7UEyt0wpokvqRpxQ2ANBosEcTesmaFNbwKOyh67ijIZCz2LkSI55dfIvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHtBg8Wh; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767055263; x=1798591263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0jc16l4eB4BU0hG0OpLcY+BoepW8BXMbI8QCoGkNvnA=;
  b=cHtBg8WhMy9aMXRwB6/4nKwuE+O8OT5QY5cX5JeJFjhvw1P5jYZ3gCZ4
   ihwv1QeWcrRRC8dZWJDv8fQPvHnTMu33hFUqgkXEymBNTG53cqsfyOkFM
   j/DCF63818F67/ezOZkgM7V6sY3wONAt1QfSsbd8HGt4kLXXiwdEm/M8z
   wdhT9+YNBG71Kv1eIu4xt7ZqiCfHIitLts44AUtWtBnHWA7GqzbSuGGci
   TI7wAnczgOY2jNTM+NRL/eHJ6kOE8phya9hVg7m3OixP1Hrne6cg04kpT
   26c6C0zzpaFPqUUhWvNMxtRSu7G4JRS6d8j8q3SfSrF8nE++6PCH0H8ar
   w==;
X-CSE-ConnectionGUID: r51UGWaMToW+9iT7+/b15A==
X-CSE-MsgGUID: t03qBr2oT/ubf4hVxT+fZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68545790"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68545790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 16:41:02 -0800
X-CSE-ConnectionGUID: wlK3tPSnQRqGC1jnm7E5Kw==
X-CSE-MsgGUID: Y5sTvnKhS2Wjw+M/ZT9eaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201529377"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 16:41:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 16:41:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 16:41:01 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 16:41:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4wayJSj6oBEKMwtE5FO4rJ1uwOElv6u0b6bI5L0YfUA/pxzyscRNtyUm2mMcYV17ibErsCyjr1TYVWcO2GFim+R1DKrJemEokrLSRKbxtVa6a6SHxStfiW9uojxg7jHPz9WNdiHbpqk0+/e+uJLXmECb9N+D9qiwpLKjaijektjX3p8ZBBOtPtHo7ETFGrNMfpKGZrvDbQ4CKACHKcSGYf65qL+AdSggOtEGBSiQthfsx7S18JeyXKhGL+uNPEO1+2sXQjAilJSgtgYNYVou6X+cqkCmoQI9oxyOE/SakXKI3dXWaVi8rCBZ7mJWcQ/MisJWVx4SX01NBCIzSUyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jc16l4eB4BU0hG0OpLcY+BoepW8BXMbI8QCoGkNvnA=;
 b=xrazX+HU5ASEHN0+E80FyPoTLr6r9H0xJolLrj8O9zpraIQzJc2A5zO+GH0KnxvY7oMf4Qe5vb4flaZH92CiwHAt8qHt1OUWauqSMXBYPe7cn+B1VPDMHqrLxmE+n+vaZx7QA/Kk5NnHKh2IYMOln9omsIVMMFOI6UNEfaGnCL+4Mu5MAhEsRTsnscD8LXeibH/wbVDO0isnNHftqhJv0dwcE7/1hzwxf7KQtoxDaNqncfoVg8ZzsS9XMZjO2l3ut4WFR/iw7VbkwjKnR7935pHH3bTQafk/WHY+IUq2ifMaS24o5KoDFNWcCSs3/7hO8IuhPUmhvAqa9iGNIa4OOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Tue, 30 Dec
 2025 00:40:59 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 00:40:59 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "Cepeda Lopez, Israel A"
	<israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/7] i2c: ljca: use i2c_adapter_set_node()
Thread-Topic: [PATCH 4/7] i2c: ljca: use i2c_adapter_set_node()
Thread-Index: AQHcc/Psc/fg4i9pRU6b/5/6xxjAhbU5YKGA
Date: Tue, 30 Dec 2025 00:40:58 +0000
Message-ID: <SJ0PR11MB56134EFE15DB24BFB7E6CCB793BCA@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|BY1PR11MB7982:EE_
x-ms-office365-filtering-correlation-id: efefd6ec-5373-402f-3248-08de473c19db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VlhhZnRMaXBSTUlhWStSYzIwOVVKY2VPTzBvTnlJUnFrUitUd1gwcTZPZ3VT?=
 =?utf-8?B?U0RvY3BQQnowZjg4aFAxYkpTMExHM3ZVRVNueFJaUGFxZjJQcitDcS9jcTd1?=
 =?utf-8?B?bENzZVIxUlR4NEgwUTcrek9lU2pwaFAremdmbVpPVENoVnA3M09WWU5zQ2FH?=
 =?utf-8?B?NVBzWkhsNlNlN1RqZXB6UXZML2krdlhFWW4wcmtnTVhyNFBvQktKazdRelhl?=
 =?utf-8?B?cCtma0MvWmdlOUF0Nnl4dTkwV1BRYjYvTVRDUjVVTGtZTmNqTG16UVk2eURH?=
 =?utf-8?B?ZUI3UHVpOURRRGVpUy9SYlc3U0hvcVowd3VxSW14NUdCUzZlQkZTNitWZjZ1?=
 =?utf-8?B?TWJCVTJIQVNIWlZKdnluQ3l1ODQzdzZCaVFTT1MrelR6V1lFcm56TWIveEt2?=
 =?utf-8?B?VzhIWW9jVDlRYS95ZXpoT2VwSnJGRS9ibFVKblhpWGJtNk1STG43UUJrT21l?=
 =?utf-8?B?eTBXaWp0QWZCbnlGQSt4NlVnK3JRL1I1LzFGUHJ1bXUrU2pWQnhXUDlLdXVJ?=
 =?utf-8?B?YWszWDAxbTk2QnJ1U204OFYzSlBjUnZoakRxSndqUHV5L25LSm53ek54anBP?=
 =?utf-8?B?Z3NaUzBIaXF6YnN4VnlqZk5uZnY4bWV3VWhXZDduT3A0T2Y4T0kvMDFPT2R2?=
 =?utf-8?B?ZHFISHVPT2xMaUg4aXl6clZ5QjYwdzkrMWk4V1hjZUNXZXZkN01lbjIrYk5C?=
 =?utf-8?B?dGQ1OVpRYytkdVdaWDlNZWlVYmtZSVkvdXQ1ZGswaTNUUkV5bFRPdVdyK2Y3?=
 =?utf-8?B?UU92NG9sWUJuc2I0cEwvQjN3cjVpaVNKNGxwQjU3Tjd0czV3MEcvMFZ6V1Rz?=
 =?utf-8?B?MWlLdTNFR2tSbGlCWWR6akRuL1ovMlFuQWM3RUExVy9idlA4ZVhvZDlJcU5P?=
 =?utf-8?B?WG1zK3VZaWwydUwvTmI2MXY5Z1l3U3JNR2dUOVJUWjgwZjVUaXdyVTVtY0RW?=
 =?utf-8?B?b2RobUFlMjZwTTNCcXJqclhpb3U1d3Y2Q2ZaUWNHM2RhNjhCQ2swemwyRTZT?=
 =?utf-8?B?NE1BYlRjR1J2ZlNOUUwwQkphOVVpOXAvQ0g5QXRhS2R1VXF6UHhDbmxpcXVh?=
 =?utf-8?B?NVg2L3NlVW1xYTc0TXdWSEJCanNwT21lNjhySC9FNVQyNlJ1VkdvZCt2eEc2?=
 =?utf-8?B?Kzk3SmxxMnpIRXlRV21yMFBkVnl5cmxkTjVtNGUxT2xlaWM1TnZ3MFhEaHdL?=
 =?utf-8?B?VDRUYmIvK3RwVldUUlJFUkFuRHlMU2dLeUd6Y2hrYjBlQnBWZEY4ZnBuNUZ5?=
 =?utf-8?B?NjZDTlMybEdHNnAxZFNraEg5aGtrN240ZWE5REMyZ3ZoK0pGQkxZV1JYdUli?=
 =?utf-8?B?Z0FPb0xVK0NwYllmZHQ5Nnd3VnZ6STkzRnY0NjNZcGZqNnVNd0lBc1VxclBD?=
 =?utf-8?B?YURFRHZVc1pzcG9rUUhmcTZHQWY0SzhjMGN1dkw1b2VLYjVXa2ZjZ1RxSnhZ?=
 =?utf-8?B?aGRFTFJ6Tnk2bmh2a1BnMGZJaEJkZGJPRGw5bFdGQlNLbEI4WnpJZUdWL3Av?=
 =?utf-8?B?TGY2S0tjSnFVZzB2MWlkMXFRWXMxYkFKUVVrTmxrdFc5N0tUUnZJRlNWb3VE?=
 =?utf-8?B?OFhTSHBaaHhQLzRQTjZ3ZVhDZiszR2JIRmxwdUxBVjMva3NoWTYyWW9oL1RJ?=
 =?utf-8?B?eno1cDBRcFVsVllXM1ZpaUg0Tzk5K0xkMldmM0FyTk5xblNIRGVhR3BsTWdp?=
 =?utf-8?B?SUh2OG1na0dPaTJQeDc1NUwrNzJmVjNCSmRjSDBvTVF1VExqRWpDWnB2Y1lK?=
 =?utf-8?B?akNDOUc1SVdmSE1RUE9qZ3lJcW1Pbk5IV1FTZWJEUHdCS0FHbjNuNW9xR3ZQ?=
 =?utf-8?B?Qm1ndy9ZMnZCcGlqYnViMnZqb25ST2Rsb3hkL21kbFRLc1QyTUZDMVl0UUZj?=
 =?utf-8?B?L0w5VzhINEJLaWRSNjhaZzBadkxGQWxpdnY0S3dRa3BWa0o3SWd3RDBCZFVj?=
 =?utf-8?B?cjJkbmI0ZmxvbmtXWmhLcGN2bURZQWZlT2owUFlISmhvaDh5bTJNdEhXM3o5?=
 =?utf-8?B?aGZKYWhVaE5oZ1gzMlI4b2lBN0N4amFNL0NpSEthRTZWRUl3bVBUVGdxTkJ0?=
 =?utf-8?B?WjdrUVNwT3lybnFLVTVLQjZMT3BIZUJXY1ZrUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjFPeVlxMnNVRDBMQlgwbzF2YTRuWThjRERpSmxLSXNva3hJS2EyZDcvaE5u?=
 =?utf-8?B?TGJzTHc2R1JBU2tFT2N6WmdQVWpSNXd2bEhIRzlzYzl3K2lKbi9jYzdRUzN4?=
 =?utf-8?B?bm5LZWVnZmdQa2hLemZDUjR5R1g1T0IxaWZIc1VkS3Jpa1UrazA0UlFNUEJ6?=
 =?utf-8?B?NmJhMzdVZStQU0JsT3pCQVE4YTJFdzl5QTAwdGZIMHcrNHJWUGplcklkbU1v?=
 =?utf-8?B?K0MyZTdhQUxGS2ZTejc4Z1hLN0FxbzFyMUdMQzhmd0FHdTN3OHJEa2VaaU9i?=
 =?utf-8?B?ZTlIMEZDdGREVVB5dHFrOUpaY1ZXVVovMGlxb0wzTEVuek9RNnlPeXNGeHpv?=
 =?utf-8?B?NDlHVHMzNmtRUXh5RDBRUzI4N2hFSGVjbDlGQU9oL292QnVOVytpN1A1N2gz?=
 =?utf-8?B?N3hrUGk5eC9vemlxZHZYb0hrczk5bHp5RmhDdXc1OC9ZTzUzR1orU3pTb3NQ?=
 =?utf-8?B?d3VJaEVvcDBnTTNkUC8yQUo1NFh0TjdDWDFUN2FySXVUaWYwY1lrYW9JbzFJ?=
 =?utf-8?B?bjM5clE3cGp3N2JWY3psN0R0MGNDZjMydUxBS1p4dU8vSExLempBbHBpd0lp?=
 =?utf-8?B?bG5LQlU2bnpzY2cwSW50UHQ4NUdqbjUrQVZvUXgxbmNuU1FjMmh2cWdvS1R4?=
 =?utf-8?B?ZjJvd3dMQ1YzZDkvdk0vYmovQldzRmRoVXZzUTBMYnFCL1VWZFc3eEpLU1JF?=
 =?utf-8?B?VzRYMzVqV2ttMThhekprZVVqYnhVdWxFZ1JjZlRxTFpGRnB3aVJUNm1ac1VT?=
 =?utf-8?B?WkZ3d2lPa05IUFlhYzc0endLMnNVOG9rTW9LVC9kVnlIZWMyNzdKTmp4eWEw?=
 =?utf-8?B?c3hEaXJTbXdQUmtQK1RONFFvdjRmY0lpVFl2RmsxS3dtU3BIVFdNbUk4NXAz?=
 =?utf-8?B?bmg1RkxnVENzOHZWT3FzUDJUQUpHZ2FMbXRuZWR4ZGxydGVtYWcwOVhqY09q?=
 =?utf-8?B?NzJSTWFhckVqcWdmMVIrcjFWYjlldG9NNmU0K2RSUWJMNDJjczVNMjZJUEFB?=
 =?utf-8?B?NkIwa3A3Q2ZSVlBYNkF2WVJmYUZ0b0UwYXVvMEE5Rjl5bHArZkw0V1BPSmxU?=
 =?utf-8?B?eGhQVDcwVzEyTVQ3MlJodm1Xa1ROMTZSNVRpSTZVM2VvWUpiZEhReWFxdmRZ?=
 =?utf-8?B?dkdFR3RQNCs5T1d6Z0hwZFZxRlBxcWdFVzNDMGxZNlV2YUduZUh0eFdmeDQy?=
 =?utf-8?B?WFRZeWJDUmNOSnZ3Y0JGWVNWaFNXMEgvMFNsSjViM25qalhmL0V2Z25TV0p3?=
 =?utf-8?B?YndObWh1MnYrQ3hzTnpNTlhNWFJZL0NZSHNyQi82WWRQTG1XZWdjdzMrNUJn?=
 =?utf-8?B?TWd1Uk93VFh4RDNzRFRwb1VKU1RTNld1enZRM1Q5MTZnY3VNWVAwUGswbDhB?=
 =?utf-8?B?VEJsa0gvY2N1V0RSdjNHTERWdzB1OC9jdnNyK0dxektQUDdHcGJuN0pNNmNJ?=
 =?utf-8?B?d0lvc3kwQU92YVBEeCtkN2xiVWlHVzVmN3J6TXBuSk9YQlcyNFlnbmJRSnRk?=
 =?utf-8?B?MUwxVlN1bklsdTJFWWZ0QWVCMk40VXNha2t5N1ArS0R1SURhVGxvaUEvNXNi?=
 =?utf-8?B?Q0ZOSHdNaW5WZndoL05URytVanNwUDNDbTF6azBFNHFwYnRmbitZb3NRRjJp?=
 =?utf-8?B?cDFWVC9hTUY1aktjSEVtcWIvZ2UrSXNKbThiYU5rUWcvK2svZDVPN0EzL1cv?=
 =?utf-8?B?TTBVRkdnb2oxSnJDUnNvUUtZaG1xdWZHMGRENFN4WkZjb3ZWKzRQajIzU1VM?=
 =?utf-8?B?VzN6MWM4bStxNndOMWdDdW54aUJKYVc2YmI0U1ZmM0dtYVNIbFJtS001UUxC?=
 =?utf-8?B?R05VY1hJMkUwb3JzektINjJzb3g2eGVTRkJ1eTBKM0xBdmlDOXIybER6TDNn?=
 =?utf-8?B?MEpTRytBZTB5Yjh2NTY0TDZTTWY2b3hpR3RlOXh0MFVuU0l0bFpnb0k4RHNj?=
 =?utf-8?B?Wk4ydHRUcDZxUWFoVjJrdGZTNzRIRkZIb3ljbnU2M05UcHhBSjZvUm92TmJp?=
 =?utf-8?B?UFI1NUZYaGlTL3VsTWh6bG1hNmJEZXc5dVc5YmxTY0VGYklJM2VDeTRTbDJZ?=
 =?utf-8?B?dHg4eDY4VnYraXhibGxsY0lWcDdCU1pZU1d4aHorMTlyejJvQ3hnbUNxenF2?=
 =?utf-8?B?QXB5TGc1YlJKUEFPNXE0ZWJ2aHdXUDR3SDZDdis2MU1FaUpVY1A4UEI0N2Fo?=
 =?utf-8?B?MS9LQkF6Rmlad0xWSFhsbTZhL3REOXhYZzIwV2U1ZlVvc3o1U0JRa24wc0lK?=
 =?utf-8?B?dUM3WWhNM3VHWGlRUkt0M3hTdkJnOUR5N0hjVGxXWjBFUkVPbE0yZ2s5d2w3?=
 =?utf-8?B?dmJSbzJtMTJDMmNkcmlpTk9HWTVsdlc5VDMvNnVjUTAvUXNxRHBmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efefd6ec-5373-402f-3248-08de473c19db
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 00:40:59.0329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQYjajXICkW3aQraCT4iN1NoaYTSJjZMY9qMEZ3bH/bVZeP7d2VIYcLLjlvDa9LHFNjZ944BTIEM48VvcVDEYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPg0KPlNlbnQ6IFR1ZXNkYXksIERl
Y2VtYmVyIDIzLCAyMDI1IDY6MDcgUE0NCj5UbzogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0Bz
YW5nLWVuZ2luZWVyaW5nLmNvbT47IE1pa2EgV2VzdGVyYmVyZw0KPjxtaWthLndlc3RlcmJlcmdA
bGludXguaW50ZWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvDQo+PGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbT47IEphbiBEYWJyb3MgPGpzZEBzZW1paGFsZi5jb20+OyBBbmRpDQo+U2h5
dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz47IFpoYW5nLCBMaXh1IDxsaXh1LnpoYW5nQGludGVs
LmNvbT47IFNha2FyaQ0KPkFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgQmlu
YmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+Ow0KPkZhYnJpemlvIENhc3RybyA8ZmFi
cml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgQ2VwZWRhIExvcGV6LCBJc3JhZWwgQQ0KPjxp
c3JhZWwuYS5jZXBlZGEubG9wZXpAaW50ZWwuY29tPjsgSGFucyBkZSBHb2VkZSA8aGFuc2dAa2Vy
bmVsLm9yZz4NCj5DYzogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgbGlu
dXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+a2VybmVsQHZnZXIua2VybmVsLm9yZzsg
bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBCYXJ0b3N6DQo+R29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0gg
NC83XSBpMmM6IGxqY2E6IHVzZSBpMmNfYWRhcHRlcl9zZXRfbm9kZSgpDQo+DQo+VXNlIHRoZSBk
ZWRpY2F0ZWQgd3JhcHBlciBmb3Igc2V0dGluZyB0aGUgZndub2RlIG9mIHRoZSBpMmNfYWRhcHRl
ci4NCj5UaGlzIGFsbG93cyB1cyB0byBoaWRlIHRoZSBkZXJlZmVyZW5jaW5nIG9mIHRoZSBlbWJl
ZGRlZCBzdHJ1Y3QgZGV2aWNlLg0KPg0KPlNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFpoYW5nIExpeHUgPGxpeHUuemhhbmdAaW50ZWwuY29tPg0KDQpUaGFua3MsDQpMaXh1DQoNCj4t
LS0NCj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMgfCAyICstDQo+IDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbGpjYS5j
IGluZGV4DQo+OTMyNzRmMGMyZDcyMTY2YmYwMTdmNjVhZjc5N2Y0MTg3NDNiNmE1Ny4uZmI0NTAx
OWIxYTBjNTgzZjE5YmNlMzUyMw0KPjk4M2E3OWQ2MzJkYTNkYSAxMDA2NDQNCj4tLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYw0KPisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bGpjYS5jDQo+QEAgLTI5NCw3ICsyOTQsNyBAQCBzdGF0aWMgaW50IGxqY2FfaTJjX3Byb2JlKHN0
cnVjdCBhdXhpbGlhcnlfZGV2aWNlDQo+KmF1eGRldiwNCj4gCQkgZGV2X25hbWUoJmF1eGRldi0+
ZGV2KSwgZGV2X25hbWUoYXV4ZGV2LT5kZXYucGFyZW50KSwNCj4gCQkgbGpjYV9pMmMtPmkyY19p
bmZvLT5pZCk7DQo+DQo+LQlkZXZpY2Vfc2V0X25vZGUoJmxqY2FfaTJjLT5hZGFwLmRldiwgZGV2
X2Z3bm9kZSgmYXV4ZGV2LT5kZXYpKTsNCj4rCWkyY19hZGFwdGVyX3NldF9ub2RlKCZsamNhX2ky
Yy0+YWRhcCwgZGV2X2Z3bm9kZSgmYXV4ZGV2LT5kZXYpKTsNCj4NCj4gCWkyY19zZXRfYWRhcGRh
dGEoJmxqY2FfaTJjLT5hZGFwLCBsamNhX2kyYyk7DQo+IAlhdXhpbGlhcnlfc2V0X2RydmRhdGEo
YXV4ZGV2LCBsamNhX2kyYyk7DQo+DQo+LS0NCj4yLjQ3LjMNCg0K

