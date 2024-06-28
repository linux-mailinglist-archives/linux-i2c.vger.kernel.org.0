Return-Path: <linux-i2c+bounces-4470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372091C06E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 16:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9D71C228B8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 14:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D18F1C0049;
	Fri, 28 Jun 2024 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wJJrE2Q/";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dLDGnVp8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D661BE85C;
	Fri, 28 Jun 2024 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583636; cv=fail; b=Y+u+3W7lAMw2SxKALFK0CUhmcAqDP/HLoLlNk5+nCjaLMd1N4fXMjtY8mIWRAhVxosUmFFARfW3BvhXn9f0Pe+AQ1ZIlhhWj6AftreRycfSPpkgiPxZggmRaCrdkI9tyw/xyKMf+PloktpZmp2cQ2miYkFPqZe9sXKnBGPh7ILQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583636; c=relaxed/simple;
	bh=x8Mt3t4i/bovcrBXpurx53CaZnreUGkEAgBMJw1jrPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utsAPEX273gy7YRKVYBWhOF/qBmUOqx0qYGefGsLvfslBYUaTVBr0FAxxTH1L5eEUo1pvCh7Td37h5IxNow0OGe1zTZlNm/PrdAjDoXHna6+pVpqRUsqoZE98jTYity5GgPBPAm3ZK9lQe+Vxmi9lLDSk7mLG0WN3kyyjo+oui8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wJJrE2Q/; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dLDGnVp8; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719583633; x=1751119633;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x8Mt3t4i/bovcrBXpurx53CaZnreUGkEAgBMJw1jrPI=;
  b=wJJrE2Q/QAyeL7lG4kag59fukVKJY7QOg26nrOCZEQSzY6hlDB1KE1Ry
   ysmDf4be76yGMIEJbwXCNw982xpdGkztBIDvachoh4GLd4cjtCwhJWuC8
   yUGmyyDntJ1uFSwqeObEBJ76Wia2DKiM4BEo8sy0PGIAt+/SLBVUZ6VEb
   +yhvbLRqG2hXWCHAFc5cTo+x21TFI8hLQI1MLs0Z+1vPf1G6qziQzewly
   qRCOfvDx6TpTvhASILNZgNbGmai5QHJX5WhEQk2JFa0Vpv34DjDCMOTtP
   V2yWavvYmu6eJMkbUffyoQfrIIbIG3rZ4Zr3fbRa/gnyNszvbYi38c0Ni
   A==;
X-CSE-ConnectionGUID: tjo7Je3uTgu5CNByEA7ZxQ==
X-CSE-MsgGUID: Xzm5z8vFTiKgdmnh2JWzMg==
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="28600496"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 07:07:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 07:06:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 07:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfY8JPg1kZxKdz6jP/WEB6KMvcyvmLPFnmYHyalLZ1+b+FOAJVZsWoNo08IFeLWcaLqCJfM2UD6UmRe7gRXdRyn0jaeyIAXrq82B5636ofWKI/TT9qi6OFbij/QhR4mzdX84D/Q8ujpl20aiqojWd/dzpULjDVrB8dns5jdyYsLbSp19liTCEAEcEBf5s+1AtLLvYQywJA4RtzQBfo8ao+XG5mdzPawMdHzyOK24CquUGcglpTGFco5HmQYLuMzvUtuVOH9cO0Gw3dNTx2K2Z+ycRlFzc//eaUcngCuQsq2r4Ht8RZoI1ofvmtpmcW9/Gwv0CssOM53RNW/LLk6E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Mt3t4i/bovcrBXpurx53CaZnreUGkEAgBMJw1jrPI=;
 b=SLa9wJyVqsJVmHRuUA5BhdNTuf9naa4qq3Kskfvm9Coutk1VJFo92EfqxB7bfJoefp+ACPHJswXVAt1Lyk6TnCQs+zAMjQyfCK0AsrUndRkfuoF5CGQgxiQAxE3Vov8d/pWA2eo/uh4oRf9SAxpL0U50O5DNlAIDHMCLDx7Cp8E1Xp4/arNO6yLhV53FHPY/JVxDrs+Ot9AWYx88VF8ubUGfKEfip3+kf6ravaVY8yXN+2t1KUA7RujyyDHdYO9wH7w6qw/pGSv3wZt9t5428SvagPVaRQmic7f1d6pvAssj9yzw7O5zQjddNXHzxqHxHBcwGbbk0LOcTqiFQKS3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Mt3t4i/bovcrBXpurx53CaZnreUGkEAgBMJw1jrPI=;
 b=dLDGnVp8cyx66YYuPcWYLFg7Vu40vRBCopFKl4aIkBF7QsIKhI+gemxBMEshKGUpgLCHcqXt7glyIApyU2UZ7YRaMPhNHjviA2K4pATFOpg3j2+eacqsbpAOgC40qvQjabQ5O6wkVHdT7r1I2HeiIAW15rM/JtEMuaCV/6SaWxMRdhq3U1ku4csLAggDA08ilssiePy3NWo0I1AKhDRYK0P0QAeJ48RfSU3/tztU38R30/lI1YxkjhP0FolifbJjNOepuu13DhJVn7y8CXUG2tMTth+v9k0vvoGidJDqq8pemN+0Y9PPHCt+SJcQjhYmo1Mm3UB0DyBfUWgLVA6KaA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 14:06:58 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 14:06:58 +0000
From: <Andrei.Simion@microchip.com>
To: <arnd@arndb.de>, <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Read MAC address through NVMEM for sama7g5ek
Thread-Topic: [PATCH v3 0/3] Read MAC address through NVMEM for sama7g5ek
Thread-Index: AQHayTF68NqQW2BHaU+oQOEfMeENPbHc2DCAgABeTIA=
Date: Fri, 28 Jun 2024 14:06:58 +0000
Message-ID: <49a71ee7-b86b-4f44-b7b3-dc0a6433e1c3@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <58ec4d44-3393-4b0b-83c4-3f66b0e2de1e@app.fastmail.com>
In-Reply-To: <58ec4d44-3393-4b0b-83c4-3f66b0e2de1e@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|CH3PR11MB7939:EE_
x-ms-office365-filtering-correlation-id: 18a8d018-03ee-49c4-d5cb-08dc977b9304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUtJMEdNTU85ODlhYjBRdjZHS0ZQN1R4Q2RSUmk4eWVuaDFxalZJd25adk9C?=
 =?utf-8?B?Mm9kR3I4Y1k4NkVnZmp0M3VJZDZCZU9lNFVOSTJaUmkrcy84Z292NG9hYWpX?=
 =?utf-8?B?T1JSU0gyRW5mZ2h5VXNjSWE4aEFLUjdqRXYyNVV6T0lCb1UxWTJsOXNoeDJM?=
 =?utf-8?B?K3d5bzJ2MWJXZFlXVk43N21abm1NWTJGL1oxZmFDTktZQUhLaUZDUVppT1V5?=
 =?utf-8?B?N2RDL1owZzc1amNCWW1UMEFWalFtOWRJMHhiYnBLVFdzVGdyVEppRlZwaGtJ?=
 =?utf-8?B?M283alpKVlhJUEREMlgzckVTT0wyaWYyaVFHUCtBamxLZFdvSVBGT1V0K1By?=
 =?utf-8?B?S2xlb3F1Nkp5UXNhN2xHTDFOL09YY1dZYldFNHZpMHNEZjBXYzA4VlR0YjZQ?=
 =?utf-8?B?UlJuUUJuSEtGNkg5TTV3TjFGZldFMzhvcmQvQ29nNFdmTk5vUFVPSEU3WUFy?=
 =?utf-8?B?dEEyK0IzN3c1bDZkQlJFWnB6UWxabkJtOVZoekxaMS8vUkFqYXpNbUFCNWRa?=
 =?utf-8?B?V200UGtFOU1qVzhoTDk1U3B6UmRtTXRMWVRJeXJjWGMvRUJmVlc1bW81cWR5?=
 =?utf-8?B?bFAzVlR5MXRjZzJEbjNKMzdSM3ZYSlpYa0ZiTEc3SWZsSlh4WWswakgyRG96?=
 =?utf-8?B?Qm5oQ3NPamp2bGdmbU9nVTBmbFRzYm1UYjhZYTdBWEQ2SWdXSzBwNWQwTi9L?=
 =?utf-8?B?VUpZaG1GQ2VVNW1Kb05xb2Nja08rVWRFbG9EN0xyT0JWRVJwY1cxY09yNE9C?=
 =?utf-8?B?bzYyMEVXY3B0UnRNZmlSa3MxNlV4Qy9HZ3ZVVDZoNERGRzFJYm5rc2pHOWpV?=
 =?utf-8?B?dklhUlcveXcwbUxsTEVEblp6clEzQVM2RThHZGpmMGlDWmx1K25ibitHYXFr?=
 =?utf-8?B?czdhN0J5VTdtb2pRWkxMeTF0TEQ4VGNDV0xWSkdNU2czM29OaDM0WFNJWTln?=
 =?utf-8?B?d2xWaEhpeFVKa3FrQ011WlRMcjNuL1gyOVBXbnkvL1JuTXNzejJGUW93RTZk?=
 =?utf-8?B?K3JrdVZ5Y1ZDckl2NzYwRURFQ1FoNzhWWCtCdlZkUGFNWlhCdGVtTUl0QjBx?=
 =?utf-8?B?V3E0enV5a3JGQk05d1JsMDFTd3JLTXp4eWVyUysyMDM0ZnBNWGV2ZVhwbENw?=
 =?utf-8?B?ZWRjcEhSNWdCMm9pWmRGMkRrM3ZpcjZIaDBBN3VpUWFTYmNodE45UHN4eU8w?=
 =?utf-8?B?WUdsZHRHQWtCZlN1LzdzZmxnMzgrTXFBT1pFV09yM1pPT0RyZng1K1ZEKzl5?=
 =?utf-8?B?VHdSUHBmMVZScGpyTkIyS1NMNm42UTVCVUhYVnlkUmw3ZTFxMHhyK1pBS1Y2?=
 =?utf-8?B?UDVCSG42eDFFYXZKaGNwemFMSFBGc0RjWjl1Rno3WXE5cDl2aHpLZ3JwNlpX?=
 =?utf-8?B?MnlHbjNEMDNzK3lVSXNFUi90Y3ZLNUExTXdrR3RJRk1iRjhJbFN5ZStTNitV?=
 =?utf-8?B?M1BlQ0llUUt2Vmp0eUVqUXhoM3hMSjN2dEl3MlhrRUxPYU02TTF0eXcwY205?=
 =?utf-8?B?eUtEQ2NXckNQTWNoUXE0bXVQbTZRYktvckZYbEtKMXdGQjNjK0xVaUFyWUNy?=
 =?utf-8?B?TG1LUDRaTVZlN3Q3SHVRUk13Q1lUZHY0SUErUXIwSGZERW1XbDQvMU5IaW5J?=
 =?utf-8?B?eTVjbEI0emFPMkVIVm5MZThoTUdnRi9HYnh1dHA2dXlyYm5LU2xtdTQ1aWZN?=
 =?utf-8?B?ZHhCNmxDdGdGMEVQalF4ek4xdFZqTUs5WDcveUN4eCt6MVY2NEowRVcreGh0?=
 =?utf-8?B?UEV0emhCOUVZT1BGTWkxQzNvL1NzM1dtQXRoUitrZzFGWVN4aGgrL20zaXdE?=
 =?utf-8?B?STB4SWlsRFA2cmlOVVVJUnJoZkhWQ1dobE40MTRURVRxMVJEd0dSM0lRWSth?=
 =?utf-8?B?SjMrTHdGWGdnZWI5RFFuSFg4K0dTVFRvS1BDSURjOEV2Q0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFFQc1BneHpnamhEeGJwRVJvZ3RwUnBOYWp5MjAzcVNYZEtyeWNnVjhWUEFi?=
 =?utf-8?B?RDhPa1FIVzA3SW1RSTI3VHJGSVA2VDV3a0owalV3WEFBZ3o1aFcydHM4ckdl?=
 =?utf-8?B?Z1YyakxTQXhKd3hmc3ZhN2JHSisrVWlyb2RtTUsyUUd1aThUaXNnVzNIU0VE?=
 =?utf-8?B?ODVGWmJ5bC90UGpJcktGNThaMGNCRFNyN0JpNEY5R2UwSXk5UldoUFpUY1oz?=
 =?utf-8?B?Rms1SFBRNUJoVTN2d040N2xzcEI3b3hXZXBXYUNFU2VleHhUdGoxZWtRRjk5?=
 =?utf-8?B?QWs1QzRUTDViSUthZlN5bU5QU3QyOEszOGljYkR3ODI1K3hTMWlIUFFDYTZo?=
 =?utf-8?B?bFpHdGtVejhtSUpKMW9HaHlxcmk2c0hOQXJFMzNkbWRvNUUxMktPWFpaMEMv?=
 =?utf-8?B?VmVFZkxvMmw3T2ZzRkNSMnRQZU9nSHFjR3E5NVBQMzVhRFhjcmJTWUlQc2Iz?=
 =?utf-8?B?RERRd2oyWENyVmNYc0xRUkY2ejh2SkRUNU8yemdLOVFUTEJQNGVnUVpYd2VT?=
 =?utf-8?B?UHdaOFJQY1MzeG5VcjlaYjM4Wi96OGhXTWZOVmtZbmxORldkQlR5Qk1LdjIw?=
 =?utf-8?B?dEpWbmdGem5yZXVZdjdySUxMTVVHQnd5RnN1d055UlFNYXZtK1hhanZlRlpR?=
 =?utf-8?B?NU9STS8vRkk2ekNuL2ovZVRsOHd3NjJyQXhKY0xzWjQrS1hhT2FJdXhXSmlE?=
 =?utf-8?B?UGJIcmxlNGtDUTdxdEUvYjRFZzh4T0VweDU5S25oMEJEcU1ob0MyeGRqQUc2?=
 =?utf-8?B?K3FQN3NXeUlwRDhkREw5c0ZiZ28zU2pGTkdIREFMNU45UktIOXU1ejZwOWlt?=
 =?utf-8?B?Q1pBZjBHZnBwZ0ZGbit2WktmdFdQMHlmTUtTTTFma1FVTFhENXdpd0tiYmZ2?=
 =?utf-8?B?NGRUU253Q2lJVDk3blYrUVIvS1dHOUZqQUJtK05BL0lucGoxcWdqcUpkUXEw?=
 =?utf-8?B?UmsyOFlzTTlhdUVIMW94Y3hVMHlwSTV1TmVhMkFDYUllRmw1RytxdDlVSDV1?=
 =?utf-8?B?Wi9IdmVPMUx4RGtYdkFYMFZjdTAyOGtSeHZjbE9jTXgrTG85b3IxWUcrK0Z4?=
 =?utf-8?B?aGZiZmJkTWpSblA2bW9IQUJyZlNOQ21jZGJmeG5uaGdGWEkrMHhrUlFsekRR?=
 =?utf-8?B?MlpRSFd2NS9GeW9uRUVOZC82c1l6eFE0QjBmeWl4N0k1L3UzVEZLaG5ySCtv?=
 =?utf-8?B?QmY4UUlmKytSeVFVK2xtc2I5VFdoT09wUDdyb3ZlRjF0aUlPbGpWMTE4OWht?=
 =?utf-8?B?T3liK3cwVGR0bFQ5R2lCWkltaERDWVZnTEp0VlI1YkRFNnBJMVdObHZoS0FX?=
 =?utf-8?B?cEtQWDkvOXVMZDBISFZ5NURYazFWZGQzMFk0Y0MzcVBLNU95bUtFa2xwL3Y3?=
 =?utf-8?B?Um1ESHJnY0Q4ZWpSaWluSFpjYjAwdE4vOTBONlYvWHpoWUg2SlByeEJjMDNw?=
 =?utf-8?B?bHN5M3BqZXZnT1V6WDVDUnF3N0d6Y2R2ZGhPMDNROEFYTklCbENUamVaL0Zw?=
 =?utf-8?B?VzVMcmRodHVlaFc4N0Exc3lEamszMXloZDdUTDNDcUJXUFRvYzhUNUQxbW8x?=
 =?utf-8?B?d2ZqdkRCcFVicVoxdHRydDJFa3pnVU5lNWN6VmswNXVycnVITUorS2lSdVpI?=
 =?utf-8?B?UXhhZWtTclRGRUU5WWV4VkdFd0pmcmhZYjRPdm9yOHVGSFFGbm51N3dKQ2FQ?=
 =?utf-8?B?TS9rNEN1eFh0N2tERVFPVzRUeGZSeWJndlVYem9yUmdibEN0bThpbzlSRGl5?=
 =?utf-8?B?UG9aV1owV1ptbGc3dTdoblBNS2o2Z20yd05MUStwb21hd1NpaWlvcjc4SkNY?=
 =?utf-8?B?K3dZRjAxSEJpT0s2S04ydXJ0aXdCclBROFhZUHgxOVhOYlJvWGdNSlM5TWt3?=
 =?utf-8?B?ZEJ5SWE3N0pZenJLUGRWZDJaaG1Nb0pVWEErTnN6RUk0VGIwblUxLzVsY21X?=
 =?utf-8?B?bys5cDhXT0dxbWJUZlgwWUo4U3BwbmUwS3RMWlVIMFRpRHN6OU8xVFRva2M2?=
 =?utf-8?B?NENzTTFzbCtxUDlFZG1qSDZQSktJS3RnWUp0UHZxbHFSS2RTcGpUVkxxalpE?=
 =?utf-8?B?bG5mN3VCM2cyNWRhdUpreWN1WW96dmVTbTkwWGhRZm56dFlLMnc5ZnlnaVoy?=
 =?utf-8?B?dndtWks2R2RObzVTMmVFVStEM2RFdlN4UGN0MnBpclphbjZSd3VjYkJFWDVw?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53CADD5B4E7325479C1BFEA543CBBD47@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a8d018-03ee-49c4-d5cb-08dc977b9304
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 14:06:58.2879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3F9bywYqCZq2RR571vn1PL8quCSkKjYthlwWUsBsQNuQV6WJ67P0jShCr1Vfww0z3Mntjr0S6bXa8OG1u2yYe84A/tEGcrgfidS0RgD5eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939

T24gMjguMDYuMjAyNCAxMToyOSwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIEp1biAyOCwgMjAyNCwgYXQgMTA6
MDEsIEFuZHJlaSBTaW1pb24gd3JvdGU6DQo+PiBUaGlzIHNlcmllcyBwcm9wb3NlcyB0byBhZGQg
RUVQUk9NIHN1cHBvcnQgYW5kIHJlYWRpbmcgTUFDIGFkZHJlc3Nlcw0KPj4gdGhyb3VnaCBOVk1F
TSAodmlhIERldmljZXRyZWUpIGZvciBzYW1hN2c1ZWs6DQo+PiAtIEFkZCBpbiBEVCBiaW5kaW5n
cyBkb2N1bWVudCB0aGUgRUVQUk9NIGNvbXBhdGlibGVzIDoNCj4+ICJtaWNyb2NoaXAsMjRhYTAy
NWU0OCIgYW5kICJtaWNyb2NoaXAsMjRhYTAyNWU2NCINCj4+IC0gVXBkYXRlIHRvIHRoZSBkcml2
ZXIgdG8gc3VwcG9ydCAibWljcm9jaGlwLDI0YWEwMjVlNDgiIGFuZA0KPj4gIm1pY3JvY2hpcCwy
NGFhMDI1ZTY0IiBhbmQgYWRqdXN0aW5nIG9mZnNldCBmb3IgdGhvc2UgMjRBQTAyNUV7NDgsIDY0
fS4NCj4+IC0gQWRkZWQgdGhlIG5vZGVzIGluIGRldmljZXRyZWUgZm9yIGVlcHJvbXMgd2hlcmUg
YXJlIHN0b3JlZCBFVUktNDggTUFDLA0KPj4gYW5kIHVwZGF0ZSBnbWFjIG5vZGVzIHRvIHJlYWQg
dGhlIE1BQyB2aWEgZGV2aWNldHJlZSB0aHJvdWdoIE5WTUVNLg0KPiANCj4gQ2FuIHlvdSBhZGQg
YW4gZXhwbGFuYXRpb24gYWJvdXQgd2hhdCB0aGlzIGlzIGdvb2QgZm9yPw0KPiANCj4gRG8geW91
IG5lZWQgdG8gd29yayBhcm91bmQgYnJva2VuIGJvb3QgbG9hZGVycyB0aGF0IGNhbm5vdCBiZQ0K
PiB1cGRhdGVkIGFuZCB0aGF0IGhhcHBlbiB0byBzdG9yZSB0aGUgTUFDIGFkZHJlc3MgaW4gdGhl
IEVFUFJPTSwNCj4gb3IgYXJlIHlvdSBwcm9wb3NpbmcgdGhpcyBhcyBhIGdlbmVyaWMgc29sdXRp
b24gdGhhdCBib2FyZA0KPiBkZXZlbG9wZXJzIHNob3VsZCBhY3R1YWxseSB1c2U/DQo+IA0KPiBB
cyBmYXIgYXMgSSBjYW4gdGVsbCwgZXZlbiB3aXRoIHRoaXMgbG9naWMgaW4gcGxhY2UsIHVzZXJz
DQo+IGFyZSBiZXR0ZXIgb2ZmIGp1c3QgaGF2aW5nIHRoZSBib290IGxvYWRlciByZWFkIHRoZSBF
RVBST00NCj4gYW5kIHN0b3JpbmcgdGhlIE1BQyBhZGRyZXNzIGluIHRoZSBpbi1tZW1vcnkgZHRi
IGFzIHdlIGRvDQo+IG9uIG90aGVyIHBsYXRmb3Jtcy4NCj4gDQo+ICAgICAgIEFybmQNCg0KDQpP
dXIgYm9vdCBjaGFpbiBpcyBST00gQk9PVCAtPiBBVDkxQm9vdHN0cmFwIC0+IFUtQm9vdCAtPiBM
aW51eCBLZXJuZWwuIFUtQm9vdCBpcyB0aGUgc3RhZ2Ugd2hlcmUgd2Ugc2V0IHVwIHRoZSBNQUMg
YWRkcmVzcy4NCldlIGNhbiBza2lwIFUtQm9vdCBhbmQgdXNlIHRoZSBmb2xsb3dpbmcgYm9vdCBj
aGFpbiBST00gQk9PVCAtPiBBVDkxQm9vc3RyYXAgLT4gTGludXggS2VybmVsLiANClRoaXMgcGF0
Y2ggc2V0IGlzIHVzZWZ1bCBmb3IgdGhpcyBzY2VuYXJpbyBhbmQgYWxzbyBmb3IgcmVkdW5kYW5j
eSAoaWYgc29tZXRoaW5nIHJlbGF0ZWQgd2l0aCBORVQvRUVQUk9NIGZhaWxzIGluIFUtQm9vdCku
DQoNCkJlc3QgUmVnYXJkcywNCkFuZHJlaSBTaW1pb24NCg0K

