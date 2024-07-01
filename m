Return-Path: <linux-i2c+bounces-4538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993A91E304
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8941C22146
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DD116D32B;
	Mon,  1 Jul 2024 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2iDQPhHn";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JPFv8RGJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297A16DEC2;
	Mon,  1 Jul 2024 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845826; cv=fail; b=K0YSPbMfaT3Ol2S1E2bGGsl7MVlQkbyNm90bSMB4/3JDau5J+ymILcDXZqUaRzXxnN/V61zo3T6n6O3pBV+7eR49upZwQMjjyexR0K7SpUqFIk2oa0RZzW+V+6MhGkYpivvNbdxu/sSmnyxmY2BbWpAS7my0Fg3Onxb3BXmzAH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845826; c=relaxed/simple;
	bh=MU6WDcCuXEfir3jhsVDgSx0vAhSZWENzuWL0hbgY55U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nZ37DtZAee/O6+OFAH6hzLC5SM9QK01hiOVhP7uor9KVkR/tdbmuXp3DFF7Ghe14bPUuTkaPT3DKsRXC+X0WOJmURw3kpft/HpC1us1j+o9c5c/bQxviZcX21dqJbCWmjlut/gAihjIYRLrllDt50YaSxItgCrw4KL9fiwqh4o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2iDQPhHn; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JPFv8RGJ; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719845824; x=1751381824;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MU6WDcCuXEfir3jhsVDgSx0vAhSZWENzuWL0hbgY55U=;
  b=2iDQPhHn2hFFm0xWQVWfbcdTzVY/kNSp97iOtgMR08UNAYai5ZnZ1GcD
   CHH6hnLL8/wJm3cCA8jmTo9khJWpno9o2YJ0JCYhVttc+r83TiR794u/j
   rR/a1xTybDRsmFGyuOf9UT0kDaTpa4Xw35ScF6R4sbe/vnPqGqGoUNiIK
   MdwKV5vw2V+nOWmtRjgLuIsjry5vNOQ1arZ0BB4lP3M2FX3+GJTx3kXnb
   IxmoQ6GzSRD39OEJmbJJfEF2FTHgYHsyaLWEbLOcwSIqLeohfWR5Y1abY
   eIfpzEqiteUKj/M4Ub32ViMSt80mz+RfXzQRhV9G2zDhtULtUc1C/cToq
   Q==;
X-CSE-ConnectionGUID: UX9HCUExSROg8fTJE0imiA==
X-CSE-MsgGUID: j3E+nnXuTeyqcP90iaflxQ==
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="29344599"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2024 07:57:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 07:56:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 07:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwYtU7mY6nSMwc15pxS1JkRvefsU6Mv49AJbZ2BNrzBGcKiWnP/fY7yvCCcNXUI3otO8AjO5Z/lURTfjDrSdoc8aPR1/Qonf9HOf14QLor3oaUbbn20Bibb59Z2tijgFnPrKngHLYjnOAlHFGaCIWYz1lcZfh31v5yocA3afNktsF+wbEKJ44KghuQPMbF7Vl13zmSNoV+wSO98XjkvD9V4Z81/0aHXszu4P+T1gPUUNDjKlspV+mqepw/c9zioG5I3rsque7ZzXHAm5gpTs0TsBtAiY2TV1+fyz5xdrG2PoASDVgY0lq2JcdbFPj1UnYa/EY8avM6OGRY6hwsFtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MU6WDcCuXEfir3jhsVDgSx0vAhSZWENzuWL0hbgY55U=;
 b=J+iLNBrEsfc8RirmcKXwOXOtZCiIqB9otAYFl+Of6LHht/GV+GjbDSvQgucUxvxIjXhmmyjc/RVWOsfpF+4Ih3+ujAjocPhH0Sch9GeQu7rNP7KG98gOx8b7tz4kSrxa6hR5g8C+txzgjnKuiiJpal9wJ1a9o7WvFmPjcxxJlY8Hzo+YtNlVmvpTcSiHEY+01AIbBOuzW3HjpgbsB6Azm+8stqxWw/wGl0rgucqWKOuf6MLj6V0n64e9OEMPjRvdOhv/PkbjWgs1BruIjW6G7kVFD+TbIBEtW+pohg/X9PSfTtH+p7nWgccEOmtU/QA7cm2pG3auO4L+OLg/oS8m4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MU6WDcCuXEfir3jhsVDgSx0vAhSZWENzuWL0hbgY55U=;
 b=JPFv8RGJNx+QroZQBoyHzDNpUL4H4Y4FnxVvkm7ppjEUuQ7bsygqDEKzfJRQGVdImdvl7p7EIa69eEHyj+lTghORMV3s3IUG35W1yiZLSasEv9snH5jhFcM4hIR9f5MWKRFIVgFLygPC6iX62bVNS02tHdMX446eKXgylMJ5Ioe3WivnxMez6lo74L7e5v7iUca2DnInFudWJ/kZ46Mo0me5OIFeLtM86wujrxUPmhV0mgI24pg1HrNScmdPnkoF5E4tiYrmqvB2aoSp+LFBKEF4jJGX7196qTs4V184XomM9QAhJoJ2FIE7tFX1tvtLhnor3vqzsfgOUAcHYGrZRg==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 14:56:20 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 14:56:20 +0000
From: <Andrei.Simion@microchip.com>
To: <conor@kernel.org>
CC: <Conor.Dooley@microchip.com>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Thread-Topic: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Thread-Index: AQHayTGFipq1RnVUHESI83ra/iB+krHc42CAgAUSxwCAAAKSAIAAApAA
Date: Mon, 1 Jul 2024 14:56:20 +0000
Message-ID: <b025bd8f-ca7d-4639-87e2-f51e6dca96ea@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-4-andrei.simion@microchip.com>
 <20240628-plunder-wackiness-72b0acf3624b@wendy>
 <04278bf9-fb5f-4592-8edd-a45332fed24a@microchip.com>
 <20240701-majorette-briskness-696746f3fde1@spud>
In-Reply-To: <20240701-majorette-briskness-696746f3fde1@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|LV8PR11MB8509:EE_
x-ms-office365-filtering-correlation-id: d836bc98-9846-4d76-f5a4-08dc99ddf7ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NS9FM2ZCWnREeHpmcEs3L0g3ZEdvU2FpNWhzd3VrSjFuRnBXd1ZkZGtDWE0z?=
 =?utf-8?B?SXFZanhXT3J5MFJ4c1l0VnI1Uk0yaHFvc0tNcnNvSU5peWVNOHdlS2NJT3pq?=
 =?utf-8?B?ZXkreER0K3d5YnY4K3dXODFTRmtYblFKTFFXenFuenM3UDVxL2JDWTVUZTlS?=
 =?utf-8?B?YSs4a3FpZWhpVTNmQmozQ1RGV3BVZW5DQ0ZmQ1k3WUVZdGwySTJTR040N05Q?=
 =?utf-8?B?YTBJZVNpdHluQUthdS93ajRWNERwVERNM3BWQnVTd0dKekl1K3ZsajI0WjNn?=
 =?utf-8?B?RjhBMjQ2YUZOM05hZ1Q2UmloL2I3RVhidURIUEdXQzBMR3ZuUVB4YjFGYVNn?=
 =?utf-8?B?Qy9UdDEvMFZKc1VBdzI1K3VtVEFGTGkwZ2tnY0xHb0JTZ2owc2JkdzFMM3FO?=
 =?utf-8?B?RWFIZWJiMEkyT1NhaDhUb284c3VvZFpCZ0xMS1pVRCtoUENuN2VpTlYrMHVT?=
 =?utf-8?B?MCt4UkNnUGs0dlhBbHcybWpLOGFiUzRsUHhSdnZnSXB6dWh1R2xvQjdjdThs?=
 =?utf-8?B?MFBrUXRZVW1oNW1zT3NudHJLeWRrTWZNUmE3cnJMeWJzTk9KYm9zTVVBWDlN?=
 =?utf-8?B?RFE0WWp3MVZjNmluSGpuRUg0dFM5NTB5enBXSDlmbFdXWnhUVmFKeUNtSGRK?=
 =?utf-8?B?eGJneTF0SVBIYTliM1JzN2t6am1BR015WmlJWHlKdEI4czEwalJsOVdMMlFK?=
 =?utf-8?B?NE5UNTQ4ZFpUbS9QKy9NbzF1VkJEKzZMcDV1SU9VZkF6dHFsOWwrcmRxTWlk?=
 =?utf-8?B?NEVZWDgxaDc4NCtCUWJ2NUFMOVpzQnVNTlpCRUZMeGlmM09KRG1OZ1VWd1Ju?=
 =?utf-8?B?U0ZkanQxZGVDMDNnU0Rubk5XRDFYOE1DcVlNWWw2WjVjTEVYdzlFWmozdXpo?=
 =?utf-8?B?YWJQVjQrVEV6K01FZ0ZqVS8wbjlDN2pDUUE2VnFkSXFyajkxVTBmd21mMURP?=
 =?utf-8?B?S1BmMklON0VtczRRcUUzOVhJSUtrTWdHY2RIaG54eGtETEE4dk1weWVNSDh4?=
 =?utf-8?B?KzhtN1FFT1N2Zks4VjJodTN2ZzIzQVl2ZlJmd0VSS1M5SThyeDF3a3lIY3JX?=
 =?utf-8?B?MnQ1Tko1eVkxUGpid2JaSEdsNElJamQ3SWtRZjIvTGRHTUpHbUFPT1Y2ME8x?=
 =?utf-8?B?ZWo2L0ZBTFJYeDNMeG5qSm5LL3VBcWxwSkJzeE85K1diR00zeGRFSURqbGhZ?=
 =?utf-8?B?UDIyWENQbEVFZGlYR01UelJmQjgrSXdHdUJvYlg5aDJxbXJCTS83RXB6RUNv?=
 =?utf-8?B?L0d3UEY0andLWmlRdHFjWlVPUDRGQ0JTT3RrbzQ5dUZWQ0gwbEZxZ3NhWHpm?=
 =?utf-8?B?eE9pSjZBWmxFU2NxNy8zNUJwSm52R1FaeklkV3hURG9oVitFNFdPWXZwMVhk?=
 =?utf-8?B?VUdqdGluM0xZZHdHL1F3YmRlemk0MnRocUc3ckRwNC9VOEsveEZPRXpTUFNv?=
 =?utf-8?B?U2ovUDdYbmIyN0t0TXJZTHA0Z1UzZGdnZlhGZVVPOW1VRzFYZ29BWkpVOFJo?=
 =?utf-8?B?ZC9OZWsvUnluemVqNUJMNmZZMm9OcDNFRkVSbzhPUnh6aGlyaHBFZHMzT0hk?=
 =?utf-8?B?K0VrSHdyTkU3cDVuS1cxNWwvYmlaZDArTjhSNE9KSnRqZjNUTk9BdzlIS3ZJ?=
 =?utf-8?B?SHpuNzY2NVZDNzVhZ0FEaUUwOGp0Si8xTzV3NitJK0lUUU9QVUt4QU9Tdmw2?=
 =?utf-8?B?WDNVY01uWTBSZnA5QTBRQkUyRjZ0cHl4T1hMQWs5NW9HMEQ4TkwxZXpGWWZK?=
 =?utf-8?B?OHg0bFBmcElacjZkODhrQnVpOUlmaEt6VnVMZ2JjK0twcUVtYmQ2dVkvbXZQ?=
 =?utf-8?B?aXc3enpSY3Z3cEhQQTkyd252NDd5MHZ1eHdkVXBJcC9pbEhPaFpoc2NURUFl?=
 =?utf-8?B?T3pnVGI2UHBYR21GeUt6aEhzeDdER2xDTVdyZmY3cThpQ3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNkVEJyY0xjcURZNDZsNmtFWHg1and1REdXVEUveUp5SkhucHVKWHJNRXlD?=
 =?utf-8?B?cGVTUGNrNEtYTzdaWEJYR3VJcVpXaTl0ak1FdHdnT2hROGRJQjg1R05NdmdS?=
 =?utf-8?B?c3ZWNVdkYzN5VWxzaWlsaW50elUyU0tUNXVMN2Q4azYvbXBUdmJpNm9hUlFS?=
 =?utf-8?B?YUxmWmw1cHJRK1JmaU9USGlFY0lka2k3VVRqQ3pjNCsrS2VWVlVkUGlDdWJY?=
 =?utf-8?B?MHQwWk1oSGxPdCtSekdKUkZTanA4b0JDREI1bkhzOW9VdWtXR2VVZmd5SEpq?=
 =?utf-8?B?MmJMbGYxQzZoSDhTdVRWQ2ExVUlQdlNpQ1FmdklXZU1IRUNmbWZmdW95bDdY?=
 =?utf-8?B?eXBpUllWOE1BWHFoZHlRVXpmeFU5aWxkeGtKOFNkZ0g5TksxSmtYUXdtcWph?=
 =?utf-8?B?RW1MUjRJeitPN1BTNHpVaGdQY2oycG1vdS9XR2FjZHZKY2t0STE5V0llQTZw?=
 =?utf-8?B?QXI0Z3hFekRTQXU1bnhxRFd2Q2U3aHBaVThHMU1UTzFqdVNCU0t6SnU3bWpC?=
 =?utf-8?B?VE5OditoMmowR3pUdnRwOHZhZXdpMDI2MDZxYytXOFVmZjF4d3hwY1JYWndv?=
 =?utf-8?B?b0VEaHhwTU92NEVIdDJsSWZBUkQ2cnJsbEJRYnQxdG1hSkgvSHUyLzAvOU5K?=
 =?utf-8?B?RVNMWkd0eVY2YXhjOVBoRGhpeHVndTdJSUNWSThhNm9CWTJVQzNvSTUzQ3Ji?=
 =?utf-8?B?RDh3N3hiTlBabk9QRzVTbS9idTRXN1pkOFJ3cU1NeTZiSUtQeTJJc0FoSitS?=
 =?utf-8?B?QnV5amhyd2FROG1xOGtPRTBDa1lHVmc0ZmdHOHJQQUsrNndsdlphVlR1SFh1?=
 =?utf-8?B?cTZGMzVHRUx2bk1Wa0xEOEYwbC85VlZWU1FMZmNOTVdjbjdHNmFTUVZuTXVS?=
 =?utf-8?B?NGkzMVJBVk8wOGszbFFubVBJcEhPYy9KaTNZUVZuZ21CdGhjeDJpM1lZZk11?=
 =?utf-8?B?cG4wTWd1aytZelJraWlFZk1YUDBGZFVIYXBGanorMXg5dWlINEg1NERtbUdV?=
 =?utf-8?B?VG90V0NZMnVTRmtmUFU4emUwbitpZGV2dGY2Nks4SFNjNVBQTmpDNVIwcFNi?=
 =?utf-8?B?VEliQm5oSWNsVm14VmJ6dnlpaXU1bi8xZEdWYjdNcTZZMk1WZlh4aEpMdDFN?=
 =?utf-8?B?eGNkeVRXQlcrOTlSU1V1anNDcys2c0NXTkhBQ1FJSFArWmg1V0VKRFJJaXpN?=
 =?utf-8?B?T0ovOVVVNkFINk5TTEVCQ0o5OUpJRWVUNFdIS0lHeTc3YW9HOHlRSzJVV29N?=
 =?utf-8?B?Q0RnNlhCRGN4Q3JybkpLWm14TTZOVHM1blVIcmNUcHlVejB1anZPbzJkb3Q5?=
 =?utf-8?B?MUJCS0l3bFpCbDRvaVpTV1dsYjgwb1pnbkhDS2hmRGE5aExpU2RVQVpoNisy?=
 =?utf-8?B?aFpOeWd5cVpjaUNsQ3FtSWt6SWxpeXpLOUlVK0JRZEhqVVNQRGc5dk94S1Ba?=
 =?utf-8?B?WXd0TWZkVUJyd1FFS0tyQWx4S25aclBQRGFKVzVFaklHbDlIUjNnYXJLckw1?=
 =?utf-8?B?U0xoZjVBaHNGVWxtVWZyK3dPSUJqRStmNGlwWkJKT1ArM3pxZUpSWEtmcDlG?=
 =?utf-8?B?KzBYSzcrUlh0YWdQMmU5dFN0Wm1EWHFyS24za29sd2FCZVZOM280YldkZVhr?=
 =?utf-8?B?dTdnRFhsOWY0Y1N3aW5sWGNMc1I1Uk5nU0hvM3kwQWkwTHJJZUJ6bVRIQjRj?=
 =?utf-8?B?Q3lWKzBNVlVQR2dLOW85UkIyVCtjamIvdGk0VWJUYVJrTTNDV2Znait1ZTZH?=
 =?utf-8?B?WVN3R21SRkhhSGNPbEhkbnRyQVg1bkJzVGRGT0taclMzbzk3ZVNhWGZNOVNG?=
 =?utf-8?B?MUYwMXpCZkRLdlRvVW5BS3hhRTdRa3V3Um9Gb3lUK1RYRUs1VGJvUTVsMU5T?=
 =?utf-8?B?SnhJemZmcVdWTEZZeFZENlJhZ2g0ODFwbDFCdStNMHUybE1aYW5ReFZSQ1Np?=
 =?utf-8?B?WDBBbTJRWU4relZsUlRIUnFMaGZSQnZZeHA0TUFISkQ4T2NVNitiMEZYL1Fn?=
 =?utf-8?B?amwrRHVsQTNkWWhaUi9hMm42VE8waThUQktkeEVYWW9obUdDY1orQjhqRmNK?=
 =?utf-8?B?YWJJU2pxelJQblF3YjZlWkhnMmEvZUt0dXRvUk1xQzFtYi9oOGRCQzdleXly?=
 =?utf-8?B?czdSWDJKUyszVDgwVjN2dGNLOGtiT1NsN0pMbTNOMkFaeTF0N2poNU5RU3Rs?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0155A2608BFB8042B2DF5E204A951D48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d836bc98-9846-4d76-f5a4-08dc99ddf7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 14:56:20.2302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s93tfjuv6MXszEa/sZk1Q9UvUIe1ctAvkWQKEPFFlgjxvp+4HQ4rWjPr4YZoeWyKWjmXmmslcuFyQLLrWgdG4k0tPdgg3ywyzppE/Xk9aTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509

T24gMDEuMDcuMjAyNCAxNzo0NywgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IA0KPiBGb3J3YXJkZWRNZXNzYWdlLmVtbA0KPiAN
Cj4gU3ViamVjdDoNCj4gUmU6IFtQQVRDSCB2MyAzLzNdIGR0LWJpbmRpbmdzOiBlZXByb206IGF0
MjQ6IEFkZCBNaWNyb2NoaXAgMjRBQTAyNUU0OC8yNEFBMDI1RTY0DQo+IEZyb206DQo+IENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4gRGF0ZToNCj4gMDEuMDcuMjAyNCwgMTc6NDcN
Cj4gDQo+IFRvOg0KPiBBbmRyZWkuU2ltaW9uQG1pY3JvY2hpcC5jb20NCj4gQ0M6DQo+IENvbm9y
LkRvb2xleUBtaWNyb2NoaXAuY29tLCBicmdsQGJnZGV2LnBsLCByb2JoQGtlcm5lbC5vcmcsIGty
emsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgTmljb2xhcy5GZXJyZUBtaWNy
b2NoaXAuY29tLCBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbSwgY2xhdWRpdS5iZXpuZWFA
dHV4b24uZGV2LCBhcm5kQGFybmRiLmRlLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZywgbGlu
dXgtaTJjQHZnZXIua2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPiANCj4gDQo+IA0KPiBPbiBNb24sIEp1bCAwMSwgMjAyNCBhdCAwMjozNzo1N1BNICsw
MDAwLCBBbmRyZWkuU2ltaW9uQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyOC4wNi4yMDI0
IDEyOjA5LCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4gSGV5LA0KPj4+DQo+Pj4gT24gRnJpLCBK
dW4gMjgsIDIwMjQgYXQgMTE6MDE6NDZBTSArMDMwMCwgQW5kcmVpIFNpbWlvbiB3cm90ZToNCj4+
Pj4gQWRkIGNvbXBhdGlibGUgZm9yIE1pY3JvY2hpcCAyNEFBMDI1RTQ4LzI0QUEwMjVFNjQgRUVQ
Uk9Ncy4NCj4+Pj4NCj4+Pj4gUmV2aWV3ZWQtYnk6IENvbm5vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KPj4+ICAgICAgICAgICAgICAgICAgXl4gICAgICAgICAgICAgXg0K
Pj4+IFRoZXJlJ3Mgbm8gd2F5IHRoYXQgSSBwcm92aWRlZCBhIHRhZyB3aXRoIG15IG5hbWUgc3Bl
bHQgaW5jb3JyZWN0bHkNCj4+PiBnaXZlbiBJIHVzZSBhIG1hY3JvIHRvIGluc2VydCB0aGVtLiBQ
bGVhc2UgY29weS1wYXN0ZSB0YWdzIG9yIHVzZSBiNA0KPj4+IHRvIHBpY2sgdGhlbSB1cCwgcmF0
aGVyIHRoYW4gdHlwZSB0aGVtIG91dCB5b3Vyc2VsZi4NCj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZWkgU2ltaW9uIDxhbmRyZWkuc2ltaW9uQG1pY3JvY2hpcC5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiB2MiAtPiB2MzoNCj4+Pj4gLSBjb21taXQgc3ViamVjdCBjaGFuZ2VkIHRvIHJlZmVyZW5j
ZSBNaWNyb2NoaXAgMjRBQTAyNUU0OC8yNEFBMDI1RTY0DQo+Pj4+IC0gZHJvcCB0aGUgcGF0dGVy
bjogbWFjMDJlNCQgYW5kIG1hYzAyZTYkIGFuZCBhLXogZnJvbSByZWdleA0KPj4+PiAtIGFkZCB0
aGVzZSB0d28gZGV2aWNlcyBkb3duIGF0IHRoZSBib3R0b20NCj4+Pj4gLSBhZGRlZCBSZXZpZXdl
ZC1ieQ0KPj4+Pg0KPj4+PiB2MSAtPiB2MjoNCj4+Pj4gLSBjaGFuZ2UgcGF0dGVybiBpbnRvICJe
YXRtZWwsKDI0KGN8Y3N8bWFjKVthLXowLTldK3xzcGQpJCIgdG8ga2VlcCBzaW1wbGVyDQo+Pj4+
IC0tLQ0KPj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0
LnlhbWwgfCA0ICsrKysNCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+
Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9l
ZXByb20vYXQyNC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJv
bS9hdDI0LnlhbWwNCj4+Pj4gaW5kZXggM2MzNmNkMDUxMGRlLi42OTljMmJiYzE2ZjUgMTAwNjQ0
DQo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQy
NC55YW1sDQo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXBy
b20vYXQyNC55YW1sDQo+Pj4+IEBAIC0xMzIsNiArMTMyLDEwIEBAIHByb3BlcnRpZXM6DQo+Pj4+
ICAgICAgICAgICAgICAgIC0gcmVuZXNhcyxyMWV4MjQxMjgNCj4+Pj4gICAgICAgICAgICAgICAg
LSBzYW1zdW5nLHM1MjRhZDB4ZDENCj4+Pj4gICAgICAgICAgICAtIGNvbnN0OiBhdG1lbCwyNGMx
MjgNCj4+Pj4gKyAgICAgIC0gaXRlbXM6DQo+Pj4+ICsgICAgICAgICAgLSBjb25zdDogbWljcm9j
aGlwLDI0YWEwMjVlNDgNCj4+Pj4gKyAgICAgIC0gaXRlbXM6DQo+Pj4+ICsgICAgICAgICAgLSBj
b25zdDogbWljcm9jaGlwLDI0YWEwMjVlNjQNCj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgcGF0Y2gg
d29ya3MsIHRoZSBzY2hlbWEgaGFzIGEgc2VsZWN0IGluIGl0IHRoYXQgb25seQ0KPj4+IG1hdGNo
ZXMgXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XSt8c3BkKSQuIFlvdSBlaXRoZXIgbmVlZCB0byBo
YXZlIHRoZXNlDQo+Pj4gZmFsbCBiYWNrIHRvIGFuIGV4aXN0aW5nIGNvbXBhdGlibGUgKGlmZiBh
Y3R1YWxseSBjb21wYXRpYmxlKSBvciBlbHNlIGRvDQo+Pj4gc29tZXRoaW5nIGxpa2U6DQo+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQy
NC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0Lnlh
bWwNCj4+PiBpbmRleCA2OTljMmJiYzE2ZjUuLjRkNDZiOGM1NDM5ZCAxMDA2NDQNCj4+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1s
DQo+Pj4gQEAgLTE4LDcgKzE4LDkgQEAgc2VsZWN0Og0KPj4+ICAgIHByb3BlcnRpZXM6DQo+Pj4g
ICAgICBjb21wYXRpYmxlOg0KPj4+ICAgICAgICBjb250YWluczoNCj4+PiAtICAgICAgICBwYXR0
ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XSt8c3BkKSQiDQo+Pj4gKyAgICAgICAgYW55
T2Y6DQo+Pj4gKyAgICAgICAgICAtIHBhdHRlcm46ICJeYXRtZWwsKDI0KGN8Y3N8bWFjKVswLTld
K3xzcGQpJCINCj4+PiArICAgICAgICAgIC0gZW51bTogWyJtaWNyb2NoaXAsMjRhYTAyNWU0OCIs
ICJtaWNyb2NoaXAsMjRhYTAyNWU2NCJdDQo+PiBJZiBJIHVzZSB5b3VyIHNvbHV0aW9uIChhbmQg
ZHJvcCBib3RoIGl0ZW1zOiBjb25zdCkgLT4gaXQgaXMgc2VsZWN0ZWQgdGhlIGNvbXBhdGlibGUg
YnV0IGRvZXMgbm90IG1hdGNoIGFueXRoaW5nLg0KPiBNeSBpbnRlbnRpb24gd2FzIHRoYXQgeW91
IGFkZGVkIG15IGRpZmYgdG8geW91ciBleGlzdGluZyBwYXRjaC4NCj4NCg0KSSBhbHNvIHRlc3Rl
ZCB0aGlzIHNjZW5hcmlvLCBpdCBpcyBPSy4gDQpUaGFuayB5b3UgZm9yIHlvdXIgY2xhcmlmaWNh
dGlvbnMuDQoNCkFuZHJlaQ0KDQo+IFRoYW5rcywNCj4gQ29ub3IuDQo=

