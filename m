Return-Path: <linux-i2c+bounces-4512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445591D8DD
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 09:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6A74B22132
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 07:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC396F076;
	Mon,  1 Jul 2024 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="d76Czez9";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n45V3LiO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF971B809;
	Mon,  1 Jul 2024 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719818614; cv=fail; b=gBPibBQPGE+yoOH0qHjJyVaJN/QEswBsjhSmyY7cnaactlyZGIcPqdcjluEc6GiI3BPHPbsyoE344N76Brsrd/r/Jfum0IilVniccGtgu9SgFvYZRadtVkO9WVNl0oRxcsaDN5aE6UiUUSNlH6kUrIlStMWChJ2iN+wDAZf5pKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719818614; c=relaxed/simple;
	bh=4CkPUSGtbG3LfVSjJv54nNm36B0kOwon9B4YtsNpLMM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mt/k/SWTWX7ZUtNa7nFSC7Yqyl/Vt0R2eVPd+a58T900nWWokXp1fUlMAJ+GCeIJq44SJvdhV9t0VuiAsHb1u56g9WgVxFU8nwUUCjlgHoH9e9hGS6RZiDXXe7XZULWb2AGESi2WTNH0mfR2VF0i2N45NvjJUa32YK9W7gNEfe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=d76Czez9; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=n45V3LiO; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719818612; x=1751354612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4CkPUSGtbG3LfVSjJv54nNm36B0kOwon9B4YtsNpLMM=;
  b=d76Czez9NKd+EAGv2qkj6U+U6t78uRwrt5ucdIhYyOGuoYYgejVpozUq
   cT3s6S9aoBk8CvPWDAUO9XvzhkUCh/TccFRnURMt9UTmtG1uUafccnt16
   ARXPDdd22PCOoNw215qqjt/hd79qDzbWccJl1WTWlLlpA3TXXsUFx/1xV
   1eKtPXS1b+umBWbGQPcR2/2yi9GP6NIYZWjUEgQc97LAgrX77j/qVeiFY
   VcEwClYeP88D2EERmgYJdH7ELMSDjeGgJX79dJ6g3b1XFU+8Bp8V8Oc0z
   3+UywGgLK/G9614VdqLDwu/U3vB9uNdeYbhCC9GzK6MSkyYdbbcOj6n1q
   Q==;
X-CSE-ConnectionGUID: 9QwibpmwSfeSS1z7fVhMew==
X-CSE-MsgGUID: brsV50lNSBCXMDEF80F7Ow==
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="29324612"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2024 00:23:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 00:23:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 00:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn5exPGf/ePP1098MNgkpYtctlRo3RiCyOrgsR1I8tNUNrIu4cxdnJDq/z7Nt7PUIXOJXPgm/Q2ClQvwVoDBXcxVTShNAfYqNxcvWmmm6j0edDnWoJfn1iPi2eMRzFTcv2Ib1jaVRTdkCqbT4X4yLe0vn48mTB0htGUZdwPN4fR9tLovo6SPyvCtSD1g/aExagenfGE0wmvcw20s//QxQK4S4NHo8PLq45VU4bduasZ8v3+lDEvvjNmMtPHPq6tyI2XCpt7JFyS9Rpt5mvIl0do/fiSNEZP51PtpfgUPlF/3fTDeP4hcHq99xP4PnyBja1e4Z2G+1UQpKq7UYybDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CkPUSGtbG3LfVSjJv54nNm36B0kOwon9B4YtsNpLMM=;
 b=DPXxVHvq+e/bkxgZp3ooZASyiQqtRW9yGdoMMjPvv4kKfFd1/urGdJkkpRXbMrvCXez8hVx015BXUwvZJzlQ7a2iDM1htLv0wAEZbsJlKHfj2rTJcrv8GzaYoUD6ajMbPTCdNS54E53m4vVknDnsM0UVsQUmb/X/vPi6WCdfmVtRSM26mkgKNo78chgvMakqLqGasPACZ8YyTw8iuh0ufb/0DGTNSMTcgojysC5ermErh2K/lshr7Fq2Nop9XuR9bgdspTRzEKZRDda6PaQMNcX8GxySKT8Znt2dGSj10InsVegdCbIHS0INkrNpnzNXEpVoSQZQszvozBEjtt6pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CkPUSGtbG3LfVSjJv54nNm36B0kOwon9B4YtsNpLMM=;
 b=n45V3LiOM3jfrshvMoFCBndcDtyNNlf9FfzljRAhoBEgtBdNBF9th9OLrpDB2Cx2N6URi8vq0fgOf0Zv0sjNR3SNPmwM3HYjK0B3biEhp2pHWbayyMEQPLMC+45m2zC0HB+L6XzpGqhyVxC+NZcZufJ4OpY2Hs88UMvqjX8Ws10zWYfGZmBAvJsKlpEKyOptk+IjWqKh3fTTQghhR3YIKsD4Yd2rdwVdOGZ+jKTXPg/0phsGu+zUq5uKJbzALITTAFhjAQSF2qZE1oqkBLOw1eJ6WfZ/4sw7rDl14lc6dn5CeU8T+/kun8SoYBxT4g1g7kGrEUj23vkxFDaXg+00zA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 07:23:01 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 07:23:01 +0000
From: <Andrei.Simion@microchip.com>
To: <brgl@bgdev.pl>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Topic: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Index: AQHayTGBv1mzh/dtb0KvO1vdxjAYGLHc2IiAgABg1ACAAAgwgIAEOxWA
Date: Mon, 1 Jul 2024 07:23:01 +0000
Message-ID: <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com>
 <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
 <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com>
 <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
In-Reply-To: <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|SA1PR11MB6846:EE_
x-ms-office365-filtering-correlation-id: 79a9295d-e6c3-4c84-7807-08dc999ea3bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SUpoWktqd2xJL1I4S1p2Z2VKNzZDdS94TEl6dnIxZmtKOTl5dmRmZ1FGUHN2?=
 =?utf-8?B?bmN6VVVwOUxJT0M4b1d2Ny8vTEtxVGd0Z0x4Z1BwRUh4WHNmQWladDVzbXk0?=
 =?utf-8?B?M3FSUGcvVXFOK0k4Mlphb0trbTEvd0FHeUF4NTVhNEFpOCtEdXRuZEg5cGd5?=
 =?utf-8?B?Y2Jxd0JqNG51MHhtZm1YT08xS2V0QlZ3ZjF2YndlREx4UU1rc20rNS9yajZX?=
 =?utf-8?B?MGJVMGUxenFjei94S2o1ZGZzZnhDRVp2VSs4NEZnMTBBa2wrK3BNc2o1U3JF?=
 =?utf-8?B?NWlVeUNZS0d0TnloU0dZSUVOeHRIR24rY1pWWDloTVFadkY1bW1ZS3NFazI4?=
 =?utf-8?B?dVd4WExRM2JIN0JSQ2ZVQ1NzVWxRcG9hUUZJZG93Qk00T2F2MzM5cnZuc1pZ?=
 =?utf-8?B?eUJYYVc3aGx0djBjQ2szYUZyOVFnTlYvMXhhNVI3dWF1Szk2UjhmampNM29r?=
 =?utf-8?B?cWJhTXVkTjYybVBIVGlTU2VGREpyeGRJV0gzOHh5S09uZnhBRExveE4zNkRm?=
 =?utf-8?B?RTNMa01GeWoyeVBjSzZvNERDRnIxblVoeG1teFZpQVk1OUVRbytzclNNWUpm?=
 =?utf-8?B?a3NNTmYzUmZ2ZjVLTUdUNXp3QllFekJGbnc5cnhMUDl0cDcxM0xFZkJNWkVs?=
 =?utf-8?B?ZVlsOGwwbUlHazFoVDlJdmNGR01ILytJTlFONTkxK3pGcXFaNnRuY3ZUUmUv?=
 =?utf-8?B?a3dJMWJwdGdRbm1VdWorNkRaWk4rTXF3ME5TLzA3bmFGVFE2WFV5VXJ1M0xo?=
 =?utf-8?B?LzJXMVI2Yk9EU0FoTmNNK1hxMDRWTm45Ny9ENEN6U1hpZC9zVTNPLzNFRGND?=
 =?utf-8?B?MzRQTHBzeEd4SktKdzAyQlZFb1I3Q1BiUEhrMk1VbGs0N1A4bURrR3VsMU1k?=
 =?utf-8?B?Y0RBd1NwU0ZKTG9LbnNxU2w5SnQ2S21KM1BrT0lGanRGK3BaWms2RjVpMmow?=
 =?utf-8?B?STJnVFVOOHllVjFJdEpjeHM4RjNJbnhKcjR3US9FVGpuVnpIeEJyTkJkMEgv?=
 =?utf-8?B?R21rbC9PcTdwKzFhNGo4Vll2K3BNcVNHM2tWNTkrZU5JUWlJWGViRWh5QUVs?=
 =?utf-8?B?cGlXMitoWlJKaEdqRkhJT3U2T2s3czlCRHgxVW9URXlRNHVxdktpVFlobStH?=
 =?utf-8?B?RU5CaGJXc0ludlROdWs0ODQ1MkxsOVR6T1FpWGo2TGJuUVhpRTlFMzZOOWZK?=
 =?utf-8?B?VUF1OGJyK0U2WGhXWUg0b3Vab3pZQzRXYThpcHI1OFpBdmpPcVJibXNjcWY5?=
 =?utf-8?B?L1dEYkFuRll6TzByVVFCTm05VC9DTlV6L3N2M2MwYUUvTU5xdTBNR01UYjFR?=
 =?utf-8?B?L0hKRTB6UktOUDN0WHFFYWxLdks4ZGZLYU53RUhvVktMRWc4NHVXdHYzNEpP?=
 =?utf-8?B?RGdnVWxjdFhlT1VDMlBleTlXbFZmUUFMVnBzTEsreDVSVzFKUGJCVXBWWVl5?=
 =?utf-8?B?bmV2WG4xZGFSTVRwWGpMVUEyZmJYVG0xMktJTXpnTXRyUk5PUlpUcHBFQ0lq?=
 =?utf-8?B?c0F2eVlyZkFKT3JGMUdQVTZseU5HRnFJKytZUzNvR21rOHdrZS8vMmg3d3da?=
 =?utf-8?B?a1dQT1dtZDN3U3BMUkU4Y290VThVTlAya3k2Z1B4SzdveWx5b1lyNWRHTHRQ?=
 =?utf-8?B?cENaOXR2b0ZTdzU0RXVjR204NWhVSkgwbUtPVkxKRy9jWTIzYk1TeCtvanFD?=
 =?utf-8?B?amgrWEgrU2tzOE44TVQ2VUkvV0t6M2ZQTXZ5OHI1SmhUQUJDYUtxVEhURHNt?=
 =?utf-8?B?TmlWSGd0cWRrVkV0enlTdXhDeS9RM3A3MFRZL1V4STFjMWtNTDNiMEZVbHBl?=
 =?utf-8?Q?0Up/FLAJ0yaAaQ+P+ndapNwIoAg5pf90u1DrM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0RpeXhGeFdnRVhyYkM3VGNlWVJSY2QvMWpERWFKSDhVWkMxTzNoOHIyZVVJ?=
 =?utf-8?B?aS9mRkR1VUE2bVh6cXhOL1JBbkltbXp6azVqTVdDM1FDNHFNeDJtcHhTWGJk?=
 =?utf-8?B?TjYvVmF2WmJ3WmJmOGovT1hmanNwNnpVV0JhdFZsRDczb3JqbHBMazF5OGFI?=
 =?utf-8?B?WU9JK0dHeERIdkZGL0NtRWpkSDFhZzRlMS9DeHFMS2ViSGRydERPaE1RL1NQ?=
 =?utf-8?B?dTl5OHVrNGZWM3U3UVNlMVgwV1BHVExzQ2J4SW1LQnFpT3lZS1J3YVpiYzl4?=
 =?utf-8?B?MTUwU3NSdkM3TG1sbHhYcEVET1Fzd2FHQzFnVy9ibldjRVJURkROclVqT2dj?=
 =?utf-8?B?KzhvRmZsbzVQTnJETG1BMng2S3pzUkg3YzRYenpRTzVPZFhRWDNhYUpXZTk0?=
 =?utf-8?B?ekRWNmFNeTZkV2hQNTd4V1NRV1ZGamFLVjA2UUxubUZoYUpJeVhlS0tLOUdG?=
 =?utf-8?B?UFVEVWZ2N1hsaDkzZkdhdXRzYk5MeUsvRzUvbUtKRzdCbWNWM0ViZExadEJo?=
 =?utf-8?B?NXk0ZDNIMk4zQS9tYVpyUzl4L0lORG96WXdkNjg0YjFNR3BEc0FXSjJobFp6?=
 =?utf-8?B?akZHVi95ODlhUUlhbUY0d0VING9jVy9sS2MvN2pTb1dkMUZMaXFCYXI1eFRj?=
 =?utf-8?B?eUZ2S1pod3RScVB5Y0drR2JCL09aRDJXdmg4b3JhUUVHVU5lTkJtRTlDS2o0?=
 =?utf-8?B?Sm95MFZZZnpoM0dBc3ZTSk5LZGRGRVI0amtpZUZTMGhSL2V5azdncVdia0wy?=
 =?utf-8?B?RGRGNmxTc1BhaTRqbm9FTUF3UFpzSGs5RDcrT3ZFT05pWDg0Z2pjTVFlS24r?=
 =?utf-8?B?eVluTTVyVDlJN0F3RG03RzdqMkJaTk1tYThJSStRamlpNEEzN1VFVmlSYlNk?=
 =?utf-8?B?a3N4ZGcrRlpuWEZod1NYaGc1UE1tUUUwUjdzQ2NsZmtYd29GSGc4L3ZYSTlx?=
 =?utf-8?B?RVRGZFE0WXFUcll5L3hKS2szcFRGWExNcFAySUpvc3BuY0t5TjV6a3RDMkdV?=
 =?utf-8?B?OHQyeFlPcTRLMGNIeDhQdGFEemV4SmJlbk1BZEs5Sm1xRmVJZXY0ZUVmZENh?=
 =?utf-8?B?TVJ5UXlYYU5zdFQ1QWQrQzZzVForZ2E0WVRWVHB6dDZZT3Q1QTk4MnNoTWww?=
 =?utf-8?B?ZE14OXpESGpvR29yd0tua3Z4QXYyOWNSYTVVb3hxRVdZdGk1cEw1RHpUais0?=
 =?utf-8?B?TUFPTTFWKzVmWjNWdG81WjgxM3lZNUt2N2h3YU1DTFI2anZLc04xcDVMUFVX?=
 =?utf-8?B?TXEzWkFsU1YzUVVjMnVKRlZQdkRLYTJnVGE1TE15V0JwSTM0WjJCbjJ5cUpT?=
 =?utf-8?B?akI0TVptR1pTR1BJcE8wWG9uK0tOOGpSK21uQ3c4QjZRT2ZhVkVPZEZ0RXFj?=
 =?utf-8?B?UzFWc0h1S2JRYVVyMFd1by9UZU9pYnk3K0txeENJL2hubFVRbWRjWGRyNW9Y?=
 =?utf-8?B?dGZuU3NDWFNKbHVJV09TbmlKUVhZbzZNWGxCY3VpVnk1ejNDOU9aMEIvQ3Vz?=
 =?utf-8?B?b1ppL2NYQ0hlcmUrL1lkZmQ1UWIzbWMvbTA1Qm96S0JUOHdqRnFCdjRvQWNq?=
 =?utf-8?B?THgzeHhQd25qdGlYd1p1dlJiU1U0RkxDWTdvbDZkUU11SHpvQVI5dkNIWVAr?=
 =?utf-8?B?RWpLSk1IOXAxaXIwOHhuZ0RTY1FFMWlzVnpBSkRoNjJlOS84akhHZzFYaHZP?=
 =?utf-8?B?Z0JRL0NoLzhUcDd5TGFadjEyR2ZITWU0amV3ZkNrdWo0QTZsaFEvQ2d3VGNx?=
 =?utf-8?B?Y3NMVGV1Y0JlMzNibTlUTDhuZVUzZHQ3ekpmdXNWRmV4RSs3b2JVdEhoYytl?=
 =?utf-8?B?dzlQbjVPQS8wK1pzSCtPUDBibkZieXB5L0lBUWVkY3RlRW1vTDcrOE9OUmcx?=
 =?utf-8?B?TGJaUlRhU2I2MVdvdlFuaFFUV2xqL1JrYW9PUEJYY0FyS2tubHhORnJNdUhB?=
 =?utf-8?B?R1g4WFJ5ZDRaUkZEaTh2Y3ZGdkJtYmJmYWt2YitUajB0dGM4bTl5OS8vMnA5?=
 =?utf-8?B?REczY0xFZ1diMVpBdktBbXkzMUJ4UDU5UGdtSmFNcW16cE1xclNNNHRIQUpO?=
 =?utf-8?B?WjFPeWtmSUtFaDViQkRvTWZYUGIxMWFPN1JUYjI1Q2tJbHBBa2VjcTV3QnVm?=
 =?utf-8?B?YXJPOXNhVmJBejRFR21uOVlaRmxOTExTZDYxSHp3NlBOanN6TERxR1kyWVB4?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68017C775F56834D82E8FDCFE469A79B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a9295d-e6c3-4c84-7807-08dc999ea3bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 07:23:01.0594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKbXvfd891km6xywh1DCe8qMAV3D4822a2BkXGv6Mb5pITNpTOnXnUguTX7ZZGE7QE7lhEXYk6QIb/n6kLdWarmiG8MngJgu8ZZu+X4+mpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846

T24gMjguMDYuMjAyNCAxNzo0NiwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIEp1biAyOCwgMjAyNCBh
dCA0OjE34oCvUE0gPEFuZHJlaS5TaW1pb25AbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pg0KPj4g
T24gMjguMDYuMjAyNCAxMTozMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4+PiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIEZyaSwgSnVuIDI4LCAy
MDI0IGF0IDEwOjAy4oCvQU0gQW5kcmVpIFNpbWlvbg0KPj4+IDxhbmRyZWkuc2ltaW9uQG1pY3Jv
Y2hpcC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCj4+Pj4NCj4+Pj4gVGhlIEVFUFJPTXMgY291bGQgYmUg
dXNlZCBvbmx5IGZvciBNQUMgc3RvcmFnZS4gSW4gdGhpcyBjYXNlIHRoZQ0KPj4+PiBFRVBST00g
YXJlYXMgd2hlcmUgTUFDcyByZXNpZGVzIGNvdWxkIGJlIG1vZGVsZWQgYXMgTlZNRU0gY2VsbHMN
Cj4+Pj4gKGRpcmVjdGx5IHZpYSBEVCBiaW5kaW5ncykgc3VjaCB0aGF0IHRoZSBhbHJlYWR5IGF2
YWlsYWJsZSBuZXR3b3JraW5nDQo+Pj4+IGluZnJhc3RydWN0dXJlIHRvIHJlYWQgcHJvcGVybHkg
dGhlIE1BQyBhZGRyZXNzZXMgKHZpYQ0KPj4+PiBvZl9nZXRfbWFjX2FkZHJlc3MoKSkuIFRoZSBw
cmV2aW91c2x5IGF2YWlsYWJsZSBjb21wYXRpYmxlcyBuZWVkcyB0aGUNCj4+Pj4gb2Zmc2V0IGFk
anVzdG1lbnQgcHJvYmFibHkgZm9yIGNvbXBhdGliaWxpdHkgdy8gb2xkIERUIGJpbmRpbmdzLg0K
Pj4+PiBBZGQgIm1pY3JvY2hpcCwyNGFhMDI1ZTQ4IiwgIm1pY3JvY2hpcCwyNGFhMDI1ZTY0IiBj
b21wYXRpYmxlIGZvciB0aGUNCj4+Pj4gdXNhZ2Ugdy8gMjRBQTAyNUV7NDgsIDY0fSB0eXBlIG9m
IEVFUFJPTXMgd2hlcmUgIjI0YWEwMjVlNDgiIHN0YW5kcw0KPj4+PiBmb3IgRVVJLTQ4IGFkZHJl
c3MgYW5kICIyNGFhMDI1ZTY0IiBzdGFuZHMgZm9yIEVVSS02NCBhZGRyZXNzLg0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCj4+Pj4gW2FuZHJlaS5zaW1pb25AbWljcm9jaGlwLmNvbTogQWRkIGV4dGVuZGVkIG1h
Y3JvcyB0byBpbml0aWFsaXplIHRoZSBzdHJ1Y3R1cmUNCj4+Pj4gd2l0aCBleHBsaWNpdCB2YWx1
ZSB0byBhZGp1c3Rpbmcgb2Zmc2V0LiBBZGQgZXh0cmEgZGVzY3JpcHRpb24gZm9yIHRoZSBjb21t
aXQNCj4+Pj4gbWVzc2FnZS5dDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaSBTaW1pb24gPGFu
ZHJlaS5zaW1pb25AbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYyIC0+IHYzOg0KPj4+
PiAtIGFkZCBzcGVjaWZpYyBjb21wYXRpYmxlIG5hbWVzIGFjY29yZGluZyB3aXRoDQo+Pj4+IGh0
dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy8yNEFBMDJFNDgt
MjRBQTAyNUU0OC0yNEFBMDJFNjQtMjRBQTAyNUU2NC1EYXRhLVNoZWV0LTIwMDAyMTI0SC5wZGYN
Cj4+Pj4gLSBhZGQgZXh0ZW5kZWQgbWFjcm9zIHRvIGluaXRpYWxpemUgdGhlIHN0cnVjdHVyZSB3
aXRoIGV4cGxpY2l0IHZhbHVlIGZvciBhZGpvZmYNCj4+Pj4gLSBkcm9wIGNvLWRldmVsb3BlZC1i
eSB0byBtYWludGFpbiB0aGUgY29tbWl0IGhpc3RvcnkNCj4+Pj4gIChjaHJvbm9sb2dpY2FsIG9y
ZGVyIG9mIG1vZGlmaWNhdGlvbnMpDQo+Pj4+DQo+Pj4+IHYxIC0+IHYyOg0KPj4+PiAtIG5vIGNo
YW5nZQ0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21pc2MvZWVwcm9tL2F0MjQuYyBiL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jDQo+Pj4+IGlu
ZGV4IDRiZDRmMzJiY2RhYi4uZTJhYzA4ZjY1NmNmIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJz
L21pc2MvZWVwcm9tL2F0MjQuYw0KPj4+PiArKysgYi9kcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQu
Yw0KPj4+PiBAQCAtMTIxLDIwICsxMjEsMjkgQEAgc3RydWN0IGF0MjRfY2hpcF9kYXRhIHsNCj4+
Pj4gICAgICAgICB1MzIgYnl0ZV9sZW47DQo+Pj4+ICAgICAgICAgdTggZmxhZ3M7DQo+Pj4+ICAg
ICAgICAgdTggYmFua19hZGRyX3NoaWZ0Ow0KPj4+PiArICAgICAgIHU4IGFkam9mZjsNCj4+Pj4g
ICAgICAgICB2b2lkICgqcmVhZF9wb3N0KSh1bnNpZ25lZCBpbnQgb2ZmLCBjaGFyICpidWYsIHNp
emVfdCBjb3VudCk7DQo+Pj4+ICB9Ow0KPj4+Pg0KPj4+PiAtI2RlZmluZSBBVDI0X0NISVBfREFU
QShfbmFtZSwgX2xlbiwgX2ZsYWdzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+
ICsjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBX0FPKF9uYW1lLCBfbGVuLCBfZmxhZ3MsIF9hbykgICAg
ICAgICAgICAgICAgICAgIFwNCj4+Pg0KPj4+IFBsZWFzZSwgZG9uJ3QgdHJ5IHRvIHNhdmUgc3Bh
Y2Ugb24gYSBmZXcgbGV0dGVycywgY2FsbCBpdA0KPj4+IEFUMjRfQ0hJUF9EQVRBX0FESk9GRigp
IGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkuDQo+Pj4NCj4+DQo+PiBJIHdpbGwgY2hhbmdlIGluIG5l
eHQgdGhlIHZlcnNpb24uDQo+Pg0KPj4+PiAgICAgICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXQy
NF9jaGlwX2RhdGEgX25hbWUgPSB7ICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+ICAgICAgICAg
ICAgICAgICAuYnl0ZV9sZW4gPSBfbGVuLCAuZmxhZ3MgPSBfZmxhZ3MsICAgICAgICAgICAgICAg
ICAgICAgIFwNCj4+Pj4gKyAgICAgICAgICAgICAgIC5hZGpvZmYgPSBfYW8gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+PiAgICAgICAgIH0NCj4+Pj4NCj4+
Pj4gLSNkZWZpbmUgQVQyNF9DSElQX0RBVEFfQ0IoX25hbWUsIF9sZW4sIF9mbGFncywgX3JlYWRf
cG9zdCkgICAgICAgICAgICAgXA0KPj4+PiArI2RlZmluZSBBVDI0X0NISVBfREFUQShfbmFtZSwg
X2xlbiwgX2ZsYWdzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+ICsgICAgICAg
QVQyNF9DSElQX0RBVEFfQU8oX25hbWUsIF9sZW4sIF9mbGFncywgMCkNCj4+Pj4gKw0KPj4+PiAr
I2RlZmluZSBBVDI0X0NISVBfREFUQV9DQl9BTyhfbmFtZSwgX2xlbiwgX2ZsYWdzLCBfYW8sIF9y
ZWFkX3Bvc3QpICAgICBcDQo+Pj4+ICAgICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdDI0X2No
aXBfZGF0YSBfbmFtZSA9IHsgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gICAgICAgICAgICAg
ICAgIC5ieXRlX2xlbiA9IF9sZW4sIC5mbGFncyA9IF9mbGFncywgICAgICAgICAgICAgICAgICAg
ICAgXA0KPj4+PiArICAgICAgICAgICAgICAgLmFkam9mZiA9IF9hbywgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+ICAgICAgICAgICAgICAgICAucmVhZF9w
b3N0ID0gX3JlYWRfcG9zdCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4g
ICAgICAgICB9DQo+Pj4+DQo+Pj4+ICsjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBX0NCKF9uYW1lLCBf
bGVuLCBfZmxhZ3MsIF9yZWFkX3Bvc3QpICAgICAgICAgICAgIFwNCj4+Pj4gKyAgICAgICBBVDI0
X0NISVBfREFUQV9DQl9BTyhfbmFtZSwgX2xlbiwgX2ZsYWdzLCAwLCBfcmVhZF9wb3N0KQ0KPj4+
PiArDQo+Pj4+ICAjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBX0JTKF9uYW1lLCBfbGVuLCBfZmxhZ3Ms
IF9iYW5rX2FkZHJfc2hpZnQpICAgICAgIFwNCj4+Pj4gICAgICAgICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGF0MjRfY2hpcF9kYXRhIF9uYW1lID0geyAgICAgICAgICAgICAgICAgICAgXA0KPj4+PiAg
ICAgICAgICAgICAgICAgLmJ5dGVfbGVuID0gX2xlbiwgLmZsYWdzID0gX2ZsYWdzLCAgICAgICAg
ICAgICAgICAgICAgICBcDQo+Pj4+IEBAIC0xNzAsOSArMTc5LDEzIEBAIEFUMjRfQ0hJUF9EQVRB
KGF0MjRfZGF0YV8yNGNzMDEsIDE2LA0KPj4+PiAgQVQyNF9DSElQX0RBVEEoYXQyNF9kYXRhXzI0
YzAyLCAyMDQ4IC8gOCwgMCk7DQo+Pj4+ICBBVDI0X0NISVBfREFUQShhdDI0X2RhdGFfMjRjczAy
LCAxNiwNCj4+Pj4gICAgICAgICBBVDI0X0ZMQUdfU0VSSUFMIHwgQVQyNF9GTEFHX1JFQURPTkxZ
KTsNCj4+Pj4gLUFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNG1hYzQwMiwgNDggLyA4LA0KPj4+
PiArQVQyNF9DSElQX0RBVEFfQU8oYXQyNF9kYXRhXzI0bWFjNDAyLCA0OCAvIDgsDQo+Pj4+ICsg
ICAgICAgQVQyNF9GTEFHX01BQyB8IEFUMjRfRkxBR19SRUFET05MWSwgMSk7DQo+Pj4NCj4+PiBB
bmQgdGhpcyB3aWxsIG5vdCBicmVhayBleGlzdGluZyB1c2Vycz8gSSBndWVzcyB5b3UgcmVmZXIg
dG8gdGhlc2UNCj4+PiBjaGFuZ2VzIGluIHlvdXIgY29tbWl0IG1lc3NhZ2UgYnV0IGl0J3Mgbm90
IHZlcnkgY2xlYXIgd2hhdCB5b3UncmUNCj4+PiBkb2luZyBhbmQgd2h5Lg0KPj4+DQo+Pg0KPj4g
Rm9yIHRob3NlIHR5cGVzIG9mIGVlcHJvbSAyNEFBMDI1RXs0OCwgNjR9IGFkanVzdGluZyBvZmZz
ZXQgaXMgbm90IHJlcXVpcmVkIChhdDI0X2dldF9vZmZzZXRfYWRqKCkpLg0KPj4gU28sIGluZGVl
ZCwgaXQgaXMgYW4gZW50YW5nbGVtZW50IGluIGxvZ2ljLg0KPj4gVG8ga2VlcCB0aGUgaW1wbGVt
ZW50YXRpb24gYXMgaXQgaXM6DQo+PiBhZGpvZmYgKHdoaWNoIGlzIGEgZmxhZyB0aGF0IGluZGlj
YXRlcyB3aGVuIHRvIHVzZSB0aGUgYWRqdXN0aW5nIG9mZnNldCkgbmVlZHMgdG8gYmUgMSBmb3Ig
b2xkIGNvbXBhdGlibGVzIGJ1dCBmb3IgdGhlc2UgbmV3IG9uZXMgbmVlZHMgdG8gYmUgMC4NCj4+
DQo+PiBJIHRoaW5rIHRoYXQgaXMgZW5vdWdoIG5vdCB0byBicmVhayB0aGUgZXhpc3RpbmcgdXNl
cnMuIFdoYXQgYXJlIHlvdXIgdGhvdWdodHM/DQo+Pg0KPiANCj4gV2FpdC4uLiBpcyB0aGUgYWRq
b2ZmIGZpZWxkIGVmZmVjdGl2ZWx5IGEgYm9vbGVhbj8gV2h5IHU4Pw0KPiANCg0Kc3RydWN0IGF0
MjRfZGF0YSBjb250YWlucyBvZmZzZXRfYWRqIHdoaWNoIHdpbGwgZ2V0IHZhbHVlIGNhbGxpbmcg
YXQyNF9nZXRfb2Zmc2V0X2FkaigpKSBpZiBhZGpvZmYgaXMgdHJ1ZSAoMSkuDQpZZXMsIGFkam9m
ZiBuZWVkcyB0byBiZSB0cmVhdGVkIGFzIGEgYm9vbGVhbi4gSSB3aWxsIGNoYW5nZSBpdCBpbiB0
aGUgbmV4dCB2ZXJzaW9uLg0KDQpCZXN0IFJlZ2FyZHMsDQpBbmRyZWkNCg0KPiBCYXJ0DQo+IA0K
Pj4gQmVzdCBSZWdhcmRzLA0KPj4gQW5kcmVpIFNpbWlvbg0KPj4NCj4+Pj4gK0FUMjRfQ0hJUF9E
QVRBX0FPKGF0MjRfZGF0YV8yNG1hYzYwMiwgNjQgLyA4LA0KPj4+PiArICAgICAgIEFUMjRfRkxB
R19NQUMgfCBBVDI0X0ZMQUdfUkVBRE9OTFksIDEpOw0KPj4+PiArQVQyNF9DSElQX0RBVEEoYXQy
NF9kYXRhXzI0YWEwMjVlNDgsIDQ4IC8gOCwNCj4+Pj4gICAgICAgICBBVDI0X0ZMQUdfTUFDIHwg
QVQyNF9GTEFHX1JFQURPTkxZKTsNCj4+Pj4gLUFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNG1h
YzYwMiwgNjQgLyA4LA0KPj4+PiArQVQyNF9DSElQX0RBVEEoYXQyNF9kYXRhXzI0YWEwMjVlNjQs
IDY0IC8gOCwNCj4+Pj4gICAgICAgICBBVDI0X0ZMQUdfTUFDIHwgQVQyNF9GTEFHX1JFQURPTkxZ
KTsNCj4+Pj4gIC8qIHNwZCBpcyBhIDI0YzAyIGluIG1lbW9yeSBESU1NcyAqLw0KPj4+PiAgQVQy
NF9DSElQX0RBVEEoYXQyNF9kYXRhX3NwZCwgMjA0OCAvIDgsDQo+Pj4+IEBAIC0yMTgsNiArMjMx
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGF0MjRfaWRzW10gPSB7DQo+
Pj4+ICAgICAgICAgeyAiMjRjczAyIiwgICAgIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0
Y3MwMiB9LA0KPj4+PiAgICAgICAgIHsgIjI0bWFjNDAyIiwgICAoa2VybmVsX3Vsb25nX3QpJmF0
MjRfZGF0YV8yNG1hYzQwMiB9LA0KPj4+PiAgICAgICAgIHsgIjI0bWFjNjAyIiwgICAoa2VybmVs
X3Vsb25nX3QpJmF0MjRfZGF0YV8yNG1hYzYwMiB9LA0KPj4+PiArICAgICAgIHsgIjI0YWEwMjVl
NDgiLCAoa2VybmVsX3Vsb25nX3QpJmF0MjRfZGF0YV8yNGFhMDI1ZTQ4IH0sDQo+Pj4+ICsgICAg
ICAgeyAiMjRhYTAyNWU2NCIsIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0YWEwMjVlNjQg
fSwNCj4+Pj4gICAgICAgICB7ICJzcGQiLCAgICAgICAgKGtlcm5lbF91bG9uZ190KSZhdDI0X2Rh
dGFfc3BkIH0sDQo+Pj4+ICAgICAgICAgeyAiMjRjMDItdmFpbyIsIChrZXJuZWxfdWxvbmdfdCkm
YXQyNF9kYXRhXzI0YzAyX3ZhaW8gfSwNCj4+Pj4gICAgICAgICB7ICIyNGMwNCIsICAgICAgKGtl
cm5lbF91bG9uZ190KSZhdDI0X2RhdGFfMjRjMDQgfSwNCj4+Pj4gQEAgLTI3MCw2ICsyODUsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCBhdDI0X29m
X21hdGNoW10gPSB7DQo+Pj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMxMDI0
IiwgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMxMDI0IH0sDQo+Pj4+ICAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJhdG1lbCwyNGMxMDI1IiwgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8y
NGMxMDI1IH0sDQo+Pj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMyMDQ4Iiwg
ICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMyMDQ4IH0sDQo+Pj4+ICsgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtaWNyb2NoaXAsMjRhYTAyNWU0OCIsIC5kYXRhID0gJmF0MjRfZGF0YV8yNGFh
MDI1ZTQ4IH0sDQo+Pj4+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsMjRhYTAy
NWU2NCIsIC5kYXRhID0gJmF0MjRfZGF0YV8yNGFhMDI1ZTY0IH0sDQo+Pj4+ICAgICAgICAgeyAv
KiBFTkQgT0YgTElTVCAqLyB9LA0KPj4+PiAgfTsNCj4+Pj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGF0MjRfb2ZfbWF0Y2gpOw0KPj4+PiBAQCAtNjkwLDcgKzcwNyw4IEBAIHN0YXRpYyBpbnQg
YXQyNF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPj4+PiAgICAgICAgIGF0MjQt
PnJlYWRfcG9zdCA9IGNkYXRhLT5yZWFkX3Bvc3Q7DQo+Pj4+ICAgICAgICAgYXQyNC0+YmFua19h
ZGRyX3NoaWZ0ID0gY2RhdGEtPmJhbmtfYWRkcl9zaGlmdDsNCj4+Pj4gICAgICAgICBhdDI0LT5u
dW1fYWRkcmVzc2VzID0gbnVtX2FkZHJlc3NlczsNCj4+Pj4gLSAgICAgICBhdDI0LT5vZmZzZXRf
YWRqID0gYXQyNF9nZXRfb2Zmc2V0X2FkaihmbGFncywgYnl0ZV9sZW4pOw0KPj4+PiArICAgICAg
IGF0MjQtPm9mZnNldF9hZGogPSBjZGF0YS0+YWRqb2ZmID8NCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhdDI0X2dldF9vZmZzZXRfYWRqKGZsYWdzLCBieXRlX2xlbikgOiAw
Ow0KPj4+PiAgICAgICAgIGF0MjQtPmNsaWVudF9yZWdtYXBzWzBdID0gcmVnbWFwOw0KPj4+Pg0K
Pj4+PiAgICAgICAgIGF0MjQtPnZjY19yZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNj
Iik7DQo+Pj4+IC0tDQo+Pj4+IDIuMzQuMQ0KPj4+Pg0KPj4+DQo+Pj4gQmFydA0KDQoNCg==

