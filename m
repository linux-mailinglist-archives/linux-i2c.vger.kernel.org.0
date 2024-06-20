Return-Path: <linux-i2c+bounces-4125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB69101DB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 12:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013B81C211C5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 10:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335011AD492;
	Thu, 20 Jun 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zq923ukj";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bwporRfP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183601AD41B;
	Thu, 20 Jun 2024 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.153.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718880377; cv=fail; b=ElkfiSA0RovRx4aT/BWbgosApHbVF6N1WjroWxtdGib2319JyEB9GS2MhrIQo1T0NgcLOaHKzygNffxoH6DwHXOElLpcrgTQ+Q9+0ISaqxijVWT7wkFEcCc1BA3zsuhLCTWkNvXpVn28+GnEOAp8RfzKMuCuEjrLIgzcSGfkmOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718880377; c=relaxed/simple;
	bh=G8EkuRb5koWP7eGd4078nplE2Aavv0mY0QCgeK0W0a4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=goHF3aimG9I4fkvZ5jIh62D0QrV7L6fbRkpZgglX3LsKCGW+z2pUydtUddIeDDeayBfV319QZTck9F1tIuNE6KfrKwKL5KyeRbvW4JeX69o2dTZhoHSspVzUR8hl89M4xEhuhec3BQIcshdc4ilWsSzkUVuWN5kimim/a54hgk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zq923ukj; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bwporRfP; arc=fail smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718880375; x=1750416375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=G8EkuRb5koWP7eGd4078nplE2Aavv0mY0QCgeK0W0a4=;
  b=zq923ukj3QE2PZBwC01uUwo0SstjH/iF4/y1D8oHav/O+rP8cSnadYo5
   18hg1nr3f1f6TGgHABKrAY5lzumBPaAxdUP0TvWeVAjaTn9tTg7b6JGag
   FgLb+FAZDGr51UjdaRj45qaFtUtrLybz6oPnUwZc8KIOTzTLEJSxey1UJ
   oQrfH8PMpJOF9vc2kw65VKry2wdeL57vbFPocUmkYxe6Ped6XaHmiV65u
   64Ax81928TE34+qsm6jBs92KbjoPASaJ7qhSLiIz+Yn+dgtoF4jvZV5zM
   gGeFfbpmcgCiNWhNp7hnVfzoLXYKNeynXzRUu0r+QZ9nO7y7PgAZHypvD
   Q==;
X-CSE-ConnectionGUID: kEqWvn4cRcWjUzzOdX4xhA==
X-CSE-MsgGUID: e6spIRVwThuD6qEdizZhvw==
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="30789856"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2024 03:46:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 03:46:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 20 Jun 2024 03:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQFITeSjGtB9E/jF9RHRUPChgnNbpmr8UQil4G6iKQfFwBIgmAi7cqp0BIVOdYLfouvKcJmMgeneQ4haVlROrbwS5wlJtfUeBuWJ/67GWz8cqCvugLdQPWNMf5AFMWeuo6WG4stHQWhCVS4a50P22qEpdJasdGb94l49pxrYZeG4NwRxRq5M2yBJpRF9PPhI5OlKqkOo2MdOdTG6ZoE7U/wCGXNZ8eGALk0pMCPQKTCjCmCIErbgXsbmpvX6VgDW+irAy0Jmf9UBzERJA0r5K0iE46aolL5RgsLQiSUtitt+S2CB2WtrrHPTIMCcpU1HR5Etw/Lie/qT6oNuQd/FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8EkuRb5koWP7eGd4078nplE2Aavv0mY0QCgeK0W0a4=;
 b=FpiKz8sqhYDjidEvBK1hm9yN4mFr0GGzjww9Kpws7LI3puF+Ce8BdB3JIeIoWbEWBsLPMSrfOJccpz0fAggTPGYjKVxw29ut+3u6hg4Zpx+HfdKD62IeUUXObZ9tp9qkVSn8WKr/z0/rhJMKEKqhvz7Di/Fz3nplvcOVtilrzrPm3ZuvEAfnRPPnWenSN/0exTvVn9NyM+rfdP2CpGmCIc3xbodaYtHNMzLgHOc4SIc5iBsh7MBSxispExBeEtEcTgWjPSiTs+HQBjbpSwkpLjHy4s3nMAVjBkD263Kl4MwWa/ZMhFitRPBXsCujls9SPiVyijYAyi6mjEpDVaVr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8EkuRb5koWP7eGd4078nplE2Aavv0mY0QCgeK0W0a4=;
 b=bwporRfPhTvZqjU81eHxUzExgxusChbp/vYavZOPeZv398/Ldvube5cPkyTTNTbMnQDwPGB+lGlbQ5aWBL95EhzUw1Pky6ziRiI6mSrGXmUfjTzKa1ONxWCWIDJbpIqBQxp8JRrKNDafeVCv4kxtz0BBFZRjcTdeGP7j7HqLceICdIUo7ojyRiVEo6n9U3j6CYeAkgD5K8tA54e5TD/pRpTrkBnuH5QMlS6agtggTJ+0KI7PuD+8Mu9SFJqJCbtlbhSkSteFdxZiAj+hhTRzrH3j+rGmZ4eSplTycgHc0v7856YWatByz0NBStxoNetzPc7UJ6pCo1rjI7IFGlH77g==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 10:45:59 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 10:45:59 +0000
From: <Andrei.Simion@microchip.com>
To: <conor@kernel.org>
CC: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Thread-Topic: [PATCH 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Thread-Index: AQHawhmcfdZ+cktAmUebRm/UDFpJUbHPXxGAgAEazQA=
Date: Thu, 20 Jun 2024 10:45:58 +0000
Message-ID: <0d57b14b-48d1-4629-92f4-74934c6ecdeb@microchip.com>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
 <20240619072231.6876-4-andrei.simion@microchip.com>
 <20240619-thee-herald-82725e1526e2@spud>
In-Reply-To: <20240619-thee-herald-82725e1526e2@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|CH3PR11MB8468:EE_
x-ms-office365-filtering-correlation-id: a03dc053-4be2-40be-83bf-08dc91162bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?MEhrL1VnTFRscC9YTUttSHhMMnZJSkFuRkhXQTMrYUQzekl1WVkwdEU1SUMz?=
 =?utf-8?B?aG5VWmZHVkdJMGlWbmF0RmVHRXJQRmdMTFdtSmQraHZ0YVAwU01VaGlocWxk?=
 =?utf-8?B?eWdSaDhlZ2hEaFQ1Nld4NnVtQ1d1cXBvTTZ6Z1hKcFc2ZDBEUTVNZTErT3hB?=
 =?utf-8?B?VDM1RDhXUm01TFY4U0doeUZXeU51bDJ6c2lRQWhRMGhBcGRZMUFNTno2ZzBy?=
 =?utf-8?B?MmUyeHIxckc5ZDBqNnNVTW9FdkMrNFFVd3plZkQ5a1RRenR5elJybUNiWkh6?=
 =?utf-8?B?MGRtR3M2VlB0TENVMHJpM0hMZmxZOWJEU01kS2xUMTBEZmEzdGUyZXdyUWlj?=
 =?utf-8?B?L2NCK0NZWERXdGNOekFYSWIwSmdqaEx4Nkh6R1BHekZ1dG1BT2xaZ1p1QzRR?=
 =?utf-8?B?THJTcVRZUzNHZzdVUGdDREw3N2xCbFRjSTNqeFNxU0JPVG9FWHl3Z2Q4TDB2?=
 =?utf-8?B?dkZ5aENiaUtWMEZPeXUyRnRRTUxoUlZnTCtWajF2bXkxQ2M2bHBhbjNOSTJm?=
 =?utf-8?B?R3hYeS83Y09YQUV6dXplYjkzTjVVMmovSzM5NW1jWlhtQXZ5YXI0OUZNeWhX?=
 =?utf-8?B?bkZDMHFVaXRxMzgvTzRKL0hpWXFiOEE2OWhhQm0xQnJOdDZPa05UNlgyVnhD?=
 =?utf-8?B?UDNLWlV2ZzY0RmVMUnMwaEpRc2x4QkFKbjA3MUFkTWxTNHZGS1lPbWZvL2xl?=
 =?utf-8?B?NkVsc1Vlbldxa2FiQmU2cEQ4Rko4aVErQ2w2OTBJRERxeUpKMkVvWnJGMzJz?=
 =?utf-8?B?RzRxWnNpT2x1a25BajhZMEI2c1MvS2xkQmhFWDNRM1V6ejZBWWYyM0tHRU9l?=
 =?utf-8?B?MnlnUnVPcExQL3FYRXR6TlZJcU5wbUVJVWRTSUUvdVVtcVhXYzZZZFdoWTFU?=
 =?utf-8?B?MGdTMVhSWjRtbjlxcDFnb2dyZ09mTVF2WTQvY285SnFheG1oNHczM3RuTW40?=
 =?utf-8?B?Q0hxZlRSTmgxWEZLTlZJcDZCVDBBdjZFSmU1SHhlQW1FNzRLWEszSnBGUTZY?=
 =?utf-8?B?ODFkRlFQVXU5WUpvaTBuUmIvMktqanA2WHhlUGJEdmk2UHZWWkFVZ1pCbkRL?=
 =?utf-8?B?NGtGNFlHeUJRaUlWaEpPQmJGcEZlSlE3TDExSW5FdUkwVjR3UkxBcXNuNTJC?=
 =?utf-8?B?Yjl5QXpLdk9ibzJiZ2hUeE1lclY4RUVFS1VGQWowdE1Qc3oxMklUSDRrdkgv?=
 =?utf-8?B?WTdFNWN0OGUvUFRYQy8yY3JHTHV0WDUxdSs4M0p6WFdLMjJIUnRkVk82NGNO?=
 =?utf-8?B?VHJkZGpzcm5PNlk0SDZlekhwaXZqZ3g4ZWM5U1FqbHJLejRWbDQ0ZkFEeXc2?=
 =?utf-8?B?OHVqR3hzR09vWnpqRDJKLzNlTHFuMzdEM2FtRDNVWXMvczk2VUJMdTdzVXFJ?=
 =?utf-8?B?eW5GRGE3dXhBdFZFemsza3M3U1FjZUFPa1ZaQ01pb2ZOeWh5anEzN29vbERL?=
 =?utf-8?B?QW5ycktoYXZpTjlJbldWZXB3Q1lET1UwR1RjYnFwcFhnVXNFQWV2eTlJaTNo?=
 =?utf-8?B?UURuU1p1cVYzYVZjblEwcUNrL0hUM0tURG5GdTQ4NEh5SWpRZUVKT2J6VEZk?=
 =?utf-8?B?SGFqMVZKSUJhN041OWJzK3Q5bFBtaXpTemd6QWtrYUxuOXdJd3h5YlBheTVk?=
 =?utf-8?B?UDJDZGhFMFZGSHpQQ0p0UTRDOVFxbHdjbFh6eWpiNElIcEdWOXp6cy9YRExI?=
 =?utf-8?B?V1ZoWDNVZDQ0dFlOZWhWQkZCMWk2SEh2ZndiUURuNDYxS0tIdHorcldBQ3o2?=
 =?utf-8?B?UzBMV3RkWCszTzVlWC9UOHJ0V25BZWpEZzJFYlp5YTUxTE8xbnlDaEpSczVW?=
 =?utf-8?Q?SNdBa0GTBbzQu/53Lt9GMEJEnsx53LUXDPFDY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTBMNjRKTUZQK1A4SnFYMkNFZ0lNZ1RJWDk4Mll0L2RDZ2Y0eUJUbWt3Y09u?=
 =?utf-8?B?VEVNN2l1L2x2dXdXOXVZTXQzNjBrcE84Y05Oc2k1Zmp5QVhrRW5SVE1OcWdm?=
 =?utf-8?B?amd2dkZGamEzRVdVZjlzSHVUZkY4OXFLK0lQQXVPWk55YlVBdEFpRC9hQmRy?=
 =?utf-8?B?SWRBejZHUzZaYzM4NERYYXczSkp6MERTdjJmNG1DLzROblcxN2pTeUZoai8x?=
 =?utf-8?B?emJ2RkgrR1ZEMVdLRm9BT0NpMjFZWHRNSVdEbnQxQ28xSm01Nm1pVjhnREdn?=
 =?utf-8?B?bks5Nm8xK0paR0tHWmdUYjJEQ1VKaHVaWENQRzNId28yd0xjTmZtbGgzaGZ1?=
 =?utf-8?B?eXI4eCtsb05FNHJ5QXBFSGN4ekFUQmdsYjhnemVYenkrRzd6ekRVTHM2SGhT?=
 =?utf-8?B?K1VZVFU4QS9URDJEUWs2WGgybzBRVGtuNzdUckR5THlDc0prQmVDMUtqZzRn?=
 =?utf-8?B?ZElNYnBSNk0rNitFZlM4RDVyRGROWGtrd216Y21YWjZ0TlRlOGwvT0l1c21n?=
 =?utf-8?B?MjJ0dlFXKzdDODhhMkFMNVdQSXJuZm1IUEFJNkh3aTVCT3ZxRzRaOVlwclpB?=
 =?utf-8?B?bWpkUVR3WE1yOW5Fajl2TVZCUnBuak9YNXMrZ2ZxK1NqSGZDRGtTbFhMcVFu?=
 =?utf-8?B?RVlxY2dXbUxXUjFJZ0J4bTI0RlNkNGlLcW9lc05uVWVLc0g5d3A0eDRTMlF1?=
 =?utf-8?B?VHBwSnZpdjdvOGJONnIxZnN0K0NzZEpVbk9Rbithc0hhUkNOR3poMkpObU1K?=
 =?utf-8?B?WXlDbXZuR3VvaVBwd2RJYUZpVWJiaWpvRlU4dmF6UHNncWdUZUs0L3k5TElo?=
 =?utf-8?B?Q1UrVlBwbE9Mc1dueWJ4c01DMk8zU3lObmdaMWxNeURWcWhTYmpudDl3NEo2?=
 =?utf-8?B?STVxWEMzbFVMT29LbzBtVG5JT1J5WnNFZEZEN3hDUU1ic1pTNFZlQ0l1Qm1I?=
 =?utf-8?B?bW0yeFFpaDJNVmdYK3l6YVBsQVlraDd6WjN0dnE2VHo3WEhxcXV1TGN2N2VQ?=
 =?utf-8?B?TzZUSTd4aGRON0VsSnVhNHd3WklIOVUzMHEvbWdLVWRBdER2N3haZGh5Sm8x?=
 =?utf-8?B?TEhGb3NBSmM0d1ZRdzNZWWpOSGlCbHE5ck9mUEJMbVdqWURDOVNicExNSFJy?=
 =?utf-8?B?Y1ZIODdmNnAyZkdjRjNkeTE1Z3lhQ3o5YllYeFVxc2NscHlSYWQxeXR3dWg3?=
 =?utf-8?B?a0p0MW9QOXBHd0lHNGdWWnpFeGZpcWlOMml0SFp3R3ErVUMzbFNsREcvUk91?=
 =?utf-8?B?Z1RNbGU3UFJZYnd6d0xlTnZXYTJ3Sm5HYkR5QnNqTTlHRE5VcG1WRmR4cG5C?=
 =?utf-8?B?KzYyQSticSs3cHRPWjBiU3Q4cjRlczVwdFFkSkY4c2FzNjNwNTVqRTg5T2NK?=
 =?utf-8?B?c0FjWlRwbGRoQ0VGV2dYekVLMVhYelhQL0ZCTWppSXlkcjNpcms3SER4RlMz?=
 =?utf-8?B?aWV3UGdUck96cU5Cd2JKU1djQ2UyRm02L1p5KzV4a1pYRFd4WXpzVGEvRUFa?=
 =?utf-8?B?SHMzQ2w1UVB2YW84cWlpYTVmUjdNZ0JzT0E3eXNGUDV5TE9wSkNmc2hrUWI4?=
 =?utf-8?B?cXR3bnlyZ0FGTXA2QXlqcFNCd214c2ppYjhPQzRlVzBMSUY3QlV4SVBkQnRw?=
 =?utf-8?B?SCtJS2NQL2w4dVBQb09nQ0FadnkzOGU5SXVTc05oL3FMSFdmSHVSa0s5Qisw?=
 =?utf-8?B?U3JyNTl1MHZLZTZCZGxHVy94bm1URFpHNWJTYzNYWVVQa2FRN0pWNGtHaDFI?=
 =?utf-8?B?cmcwdVN2b1JnMk5Nd2tZamdJTzF5K0ZDZE10WE5IWjcwWHpBcFhCTXdZVG1W?=
 =?utf-8?B?STcxNGdxcDcyeTJTdm9ZWXlWejN6UGE1Y3JvS3RxWDZKRzJPYVI0Q0kxV1Fq?=
 =?utf-8?B?clFKK056QWxMcUxLQlIzQ3VtSVpmWVlGdlJaTnNYRlBkdmRadFMyUmJXM09C?=
 =?utf-8?B?ZDJMY2psS0poNXpBWXJDcXdnVzdzS2xkYi9hYnRjUlpxS1JwYTBldXNMMlhW?=
 =?utf-8?B?VEl4bDR2RTdqdjhZb3g5Umd5ekZxc3Fvcm1WWkorZHV1VTJVcVdYVExoTmli?=
 =?utf-8?B?TVFBby9wYnZycDgvSWQwZ29rWGk3ZDl1UmV2T2RuSHhHMmhIbGR1QXRjSUxC?=
 =?utf-8?B?OXlWeWJWUkl6SmphSE91blNCTWp0Tk1DM1JWeW5Wc1VJVkhoeHRqQWlrZ2VI?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A84615155D52DA478CB3857173B16206@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03dc053-4be2-40be-83bf-08dc91162bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 10:45:58.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ap0At2dK6io7NnyWa42aB32jCL3n848KDgKb8wC7SnWDuXozz7EMfSg1VHc7lUqPWo6OtZAOg6FgXIiuhnHMqSQDpTZFYFZ7Ev0RSRVtlyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468

T24gMTkuMDYuMjAyNCAyMDo1MywgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gVXBkYXRlIHJlZ2V4
IGNoZWNrIGFuZCBhZGQgcGF0dGVybiB0byBtYXRjaCBib3RoIEVFUFJPTXMuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogQW5kcmVpIFNpbWlvbiA8YW5kcmVpLnNpbWlvbkBtaWNyb2NoaXAuY29tPg0K
Pj4gLS0tDQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0
LnlhbWwgfCAxMCArKysrKysrLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPj4gaW5kZXggM2MzNmNkMDUxMGRlLi40NmRh
YTY2MmY2ZTcgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZWVwcm9tL2F0MjQueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwNCj4+IEBAIC0xOCw3ICsxOCw3IEBAIHNlbGVjdDoNCj4+
ICAgIHByb3BlcnRpZXM6DQo+PiAgICAgIGNvbXBhdGlibGU6DQo+PiAgICAgICAgY29udGFpbnM6
DQo+PiAtICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XSt8c3BkKSQi
DQo+PiArICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XStbYS16MC05
XSp8c3BkKSQiDQoNCj4gQ291bGQgd2UgcmVsYXggdGhlIHBhdHRlcm4gaW5zdGVhZCB0byBtYWtl
IHRoaXMgYmxvYXQgbGVzcz8gV291bGQgaXQgYmUNCj4gcHJvYmxlbWF0aWMgdG8ganVzdCBhbGxv
dyAiXmF0bWVsLCgyNChjfGNzfG1hYylbYS16MC05XSt8c3BkKSQiPw0KDQpJKSAiXmF0bWVsLCgy
NChjfGNzfG1hYylbYS16MC05XSt8c3BkKSQiIDoNClRoZSBmaXJzdCBwYXR0ZXJuIGRvZXMgbm90
IHNwZWNpZnkgd2hlcmUgdGhlIGRpZ2l0cyBtdXN0IG9jY3VyIHdpdGhpbiB0aGUgYWxwaGFudW1l
cmljIHNlcXVlbmNlIHRoYXQgZm9sbG93cyAyNGMsIDI0Y3MsIG9yIDI0bWFjLiBJdCBhbGxvd3Mg
dGhlIHNlcXVlbmNlIHRvIGJlIGFsbCBsZXR0ZXJzLCBhbGwgZGlnaXRzLCBvciBhbnkgbWl4IHRo
ZXJlb2YuDQoNCklJKSAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XStbYS16MC05XSp8c3BkKSQi
IDoNClRoZSBzZWNvbmQgcGF0dGVybiBzcGVjaWZpY2FsbHkgcmVxdWlyZXMgdGhhdCBhdCBsZWFz
dCBvbmUgZGlnaXQgYXBwZWFycyBpbW1lZGlhdGVseSBhZnRlciAyNGMsIDI0Y3MsIG9yIDI0bWFj
LCBhbmQgb25seSBhZnRlciB0aGlzIGRpZ2l0IGNhbiBsZXR0ZXJzIGFwcGVhci4NCg0KQXMgaHlw
b3RoZXRpY2FsIGV4YW1wbGUgOg0KYXRtZWwsMjRjYWJjIHdvdWxkIG1hdGNoIHRoZSBmaXJzdCBw
YXR0ZXJuIGJ1dCBub3QgdGhlIHNlY29uZCBiZWNhdXNlIHRoZXJlIGFyZSBubyBkaWdpdHMgaW1t
ZWRpYXRlbHkgZm9sbG93aW5nIDI0Yy4NCmF0bWVsLDI0YzEyMyB3b3VsZCBtYXRjaCBib3RoIHBh
dHRlcm5zIGJlY2F1c2UgdGhlcmUgYXJlIGRpZ2l0cyBpbW1lZGlhdGVseSBmb2xsb3dpbmcgMjRj
LCBhbmQgdGhlIGZpcnN0IHBhdHRlcm4gZG9lc24ndCBjYXJlIGFib3V0IHRoZSBwb3NpdGlvbiBv
ZiB0aGUgZGlnaXRzIHdpdGhpbiB0aGUgYWxwaGFudW1lcmljIHNlcXVlbmNlLg0KDQpJbiBjYXNl
IG9mIGF0MjQsbWFjMDJlNCBhbmQgYXQyNCxtYWMwMmU2IG1hdGNoIGJvdGggcGF0dGVybnMuDQoN
CkxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQoNCkkgYWdyZWUgdG8gY2hhbmdlIHRoZSBwYXR0
ZXJuIGFzIHlvdSBzdWdnZXN0Lg0KDQpCUiwNCkFuZHJlaQ0KDQo=

