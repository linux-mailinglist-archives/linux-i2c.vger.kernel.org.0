Return-Path: <linux-i2c+bounces-11024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6EABBF17
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AF83AE384
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2FD2797B2;
	Mon, 19 May 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O9f2+8MH";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Esxc827q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F01A3177;
	Mon, 19 May 2025 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661208; cv=fail; b=B+s5kjpt+T3NR8Tky7jlueWh2iZT+LYOjJgxAUciU212HR0RKG7O5lBFGQcjbmKq7V5W8ySV7QXaG6MAt5HSNOWHGU4OG9gf1ApmLCq0qLWOAQXGmwtdPV42nTnuqCY+9CbNU/zS6xw/o+H+TulvUQxYhOCPWGgg93ZmpsOeS5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661208; c=relaxed/simple;
	bh=WsnAVHkuA7kzkExMgq+1v3XdL0KegUFK6bSXnc2iopM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZQyugtLBrNbF+EPsQ7PVuDSWaErZHiwVbxHsJuo2BQ2LWRUiN0eX4fQcwqIly8aA59BNpTRFO3O1yn9VJ5RQ+n925UHf02rFWQvD8VN25HSutadTP7BGrfYns7N2l9XeH6NriU6WR4mFyFaQNtDUEDg/P/dEo6632qCdTo6p2Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O9f2+8MH; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Esxc827q; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e61651cc34b411f082f7f7ac98dee637-20250519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WsnAVHkuA7kzkExMgq+1v3XdL0KegUFK6bSXnc2iopM=;
	b=O9f2+8MH2gDJjfieBdThwzXKlYgoowbfydxFXH/ocpmp3EKWUBliTR14i5lKsUegLU+2zkTED32Ix12tZbJBxoHtt3HLeILK9g0m6Tqf64F71rWjd4hvQSGUS7Hx2KjiaZHJhonbi1MeYGS/uGR1+X/i2H69TxLKYg4qBIR1yno=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3d685893-3498-47af-ab6e-6a725145702d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:7bd72b3e-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e61651cc34b411f082f7f7ac98dee637-20250519
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1224158269; Mon, 19 May 2025 21:26:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 19 May 2025 21:26:38 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 19 May 2025 21:26:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1OYR1JAQMH4b4Bpy7GLhlSZX82F+0GW7smhe6RXVfcT4VeN+W39qlHGyfaT8iD38+qiTzK+t0NEBkDYLdlcMEY+fEJu76NHW4HlfYSQ4CDJspfBfZiyOExXjTnQoTem7yF0vPDgXOU5GfC7bgrz6DJ4SUmYfa0AyXUYhnZA9BL1RitxEuTn9u3ig/pGGE8bRLa+jkm9mWBRFf0nInwLwTNy6o2xgnj0Daqle6K0yvviTnKFlJVRYXB1MZBsdt9dMj+kpXrWmf1wOfEahgro0LTUPWyFazSSi+K+Vk2kGWFsD1GRqUv8Hec3lOfhxYBbfCFosOPNwrv5MA9Dptmdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsnAVHkuA7kzkExMgq+1v3XdL0KegUFK6bSXnc2iopM=;
 b=hIphGX6sfjg6GR3OimW7IDeYIp9aYB6AjzP6IDn8DheqTtDJsAYwwSgiRZiyjAzH009SSs/vW7xnw+6KzWDpnzSD881YeVsLXSE58bU/TlAXjmNG2eYJ5Ag9u42S/IJ908a5oHZTWx1KrLR17XZCQp7QA506d2aM3yEsvpteHBOGmFHYFKL2dl/BQ6AOsZgSDMHi2Ucb/9bCKFBsxl54IxJLfILMr/tkvwWZVYq1ya0AvXMeea9WmHbV0zLlFPkwcOPaRbGR5IiM+11FxWrg1WPctnV59iWoBv8Fj7ABPO4lx6AvDTMtPXmy9C1p1jkxmFWfFVEY/apuPIpWyZ4OFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsnAVHkuA7kzkExMgq+1v3XdL0KegUFK6bSXnc2iopM=;
 b=Esxc827qPrNGKTINwlT21J6hBFxMmlLwXs6ycKw9WuQ/ziXYKCkj4pK93eNVTxGeGnd6gbUSgPIwVxL/lbjxIRHf1JbDWv3UmJYW7RwNgAMBA0jwHSp9wNxwr0vBvlrOIwVFgVoulJHDJydN5Ah3vi2iBs4S33l9en+HU+qwzqU=
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com (2603:1096:400:149::5)
 by TYSPR03MB7942.apcprd03.prod.outlook.com (2603:1096:400:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 13:26:36 +0000
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508]) by TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 13:26:36 +0000
From: =?utf-8?B?Wm9pZSBMaW4gKOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
To: "daniel@makrotopia.org" <daniel@makrotopia.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: "john@phrozen.org" <john@phrozen.org>,
	=?utf-8?B?TGVpbGsgTGl1ICjliJjno4op?= <Leilk.Liu@mediatek.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?UWlpIFdhbmcgKOeOi+eQqik=?=
	<Qii.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?Sm9zZXBoLUNDIENoYW5nICjlvLXmrL3mtLIp?=
	<Joseph-CC.Chang@mediatek.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Topic: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Index: AQHblPD8aCJuLR3mjEKjCfcqm/NKPrN5ktCAgAMMlQCAACicAIBdkWWA
Date: Mon, 19 May 2025 13:26:36 +0000
Message-ID: <8874a29ba42eb828d70deb73d4b84a59126b84c8.camel@mediatek.com>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
	 <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
	 <Z9yR6pyg1mtqKynh@makrotopia.org>
	 <em2y3tkiwlxc45f4sjtzdd3oy4v5zpqgdpqfppyzah2ilzidg2@wn6cnrezygpl>
In-Reply-To: <em2y3tkiwlxc45f4sjtzdd3oy4v5zpqgdpqfppyzah2ilzidg2@wn6cnrezygpl>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6369:EE_|TYSPR03MB7942:EE_
x-ms-office365-filtering-correlation-id: 37c2dba8-7b64-4483-f2d9-08dd96d8c7c3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?blpSSVE2Y0hpWEFwL1czRms0RDZIb2NXZDErbVBEWk45NElSZkhWeFdtdFQx?=
 =?utf-8?B?R2YrNGRIRnlsNWk5cnNzQ2VkWlVUMXVYNWw0bGx1dVBlUjNHb21FQW45NnJO?=
 =?utf-8?B?Q0ROV1JWVFJoeEh6NjljUEZhYlNsY3ZyNmQ5aEZZN1NyRUIxOWg0cjduTWRN?=
 =?utf-8?B?VjFrYlVvYVdhdm5uQkIvTjhTR3ViQzNpNnlLZEE4MVpjdzJYeUllRHN0bnpo?=
 =?utf-8?B?ampGcjJvQlFveFB1dHJlM01IN25vK1N0K2VYMk5PSm9hM2FKUjdzS3FyK0Rx?=
 =?utf-8?B?MXRSZmFNRng1cVcxVkNHMWQ3Tm4zanBRTXNIdnVOd0c0ZDdTdnRiak02UCtt?=
 =?utf-8?B?Wk91VGJXYWduTUFXcmhEQUtteWV6YjRPSkVlUVhvTFI1bGNkL0tqQk90ZFdB?=
 =?utf-8?B?MnFNUDRmZVdmTEEyR2tJZWZtWUhCeEY0Y3V5M1JYdC9reXpHL1RRczRjMVY5?=
 =?utf-8?B?V1lBOW04ckwvQ3JKM1NVcXhWaUg5NVF2RGQ4UmhrUmFVZWxKMzllTEJuSG9R?=
 =?utf-8?B?ZFUxYkhYTmlsUHhHbjJsbEFuZFhPbHBsSENrTWZ5SU9kUzFvOVlLUUcrS3FJ?=
 =?utf-8?B?c1RubjJ0U2pRUmlWeEdXN2o0TmJuK3NYV3I5MDJHVmtUTm1LMFlYZVUrMmNa?=
 =?utf-8?B?R2dTVnVXUXowaUdFMFdKZVBJdkZwcElwclM1MzR5ZFYvR3RzMWd5S3JiSUlq?=
 =?utf-8?B?ZFdtNDJYSFRXaEpxYy8wRE80T1hEUnRMYVNhZDE2dmZiMDlwbnhGejZCQU1r?=
 =?utf-8?B?OUtYLzh6MW8wQ1VWNFZJTDdCdnYwZWJwejhNbWxEQzlNSnp2dU9XYkRZRWhr?=
 =?utf-8?B?ZkZyM1dVeFh4cEM5U0RTRjFOUDBsZ1ZkQklDK0p4cGJaWUMxZEl2dzFnVlJO?=
 =?utf-8?B?T3JOSDNwMGU0MTNJYjZWUjFFaWMreEhubDBTcE9xMzczNE1DNThwWlcxUU1P?=
 =?utf-8?B?dVpGek5jYi9adUlCNkpzNC9RLys2MWxXd2tKSm1rSWdTdjEvbDVKN2llT2kw?=
 =?utf-8?B?cXRJaENCdFMvZUozRFVHbWdySVRoNGdKWGwzUUl6S3lDSGFmTG5sczUzUno5?=
 =?utf-8?B?SkgxSkRrbENURTlsK1AwUVVIbWIwQURSbytydDhlSFhPRWNBckE5STZRditL?=
 =?utf-8?B?cm9oOGlyWHdDYndGUWJJM3pCcWFZZVBEVkovaHBFYUJERlE3cGdrZGcxNDNi?=
 =?utf-8?B?MDlUdnFZWTFhRUFhTDIzYmhweGFnclptUUhlZ21DenVzbW44NWVwRnpHS1hF?=
 =?utf-8?B?NmJMYW1xL2tQWmlaMFQvZ3ZDWExhWmx6L01wVUVWNWRyME9PTEV6Nm5EdHBp?=
 =?utf-8?B?b1Y4emsrNDFEZGJ3MUU5UnRLVWh2c0lWQUc2UjkxWThmdTJpRXBOY0ZjUkJN?=
 =?utf-8?B?NGFWbS9SR3p3TDluL05mTEkrUFVIMDYybENnaXdYN1hIcWdwRjNoNk5HMDFr?=
 =?utf-8?B?TnFkTnNqcnR5OHVnT2xLeWU0UUViNGlIQW0zM0JlYk9TSGtuYTlHVTJhUDB1?=
 =?utf-8?B?M3hSdTJxKzlpRzh2aVIvSlI2b2hYRDJ5ZE5BUWpYb3lmRHpSL1czanU4V2Z5?=
 =?utf-8?B?UGNRanhOWnB5L1lFVTlnT0krN1JsMjFneWhJQm4zcjIvNzY5S2t1ZGx5N3hU?=
 =?utf-8?B?R0lFdkE0Lys1eEgxbmtvajM2Y0dnTHRxdExmWW9iWUZZQW1ZUEh0alF3N1k0?=
 =?utf-8?B?TmxNQk1sVXVnUUVUSmxzTXhuc1JXMjRhTVc2aHpFRE84bnZzMis1S2NVR2pB?=
 =?utf-8?B?L1NZV2Q1aVpjMWwxNFRLZXRjaHc0ekRhRFBFYVdZdEFQS0dOTXhUdlM5b09U?=
 =?utf-8?B?S1UrNHI2d2R2dkY0VGgwYm1MNHlPQjBSY2EvaFd4K1d2NW4zQVRTN1J6MnNp?=
 =?utf-8?B?L1JXQVRnSDl6Z3hXSXpMNWYvUVdBWkdkWVlWcEtXaWV5SFl3M2JSdjhmQ0dC?=
 =?utf-8?B?Znlkejk0b2I2Ujc4VmZNaHRtaHFES0UvM0xVa1h0cjQyZlYwSDEyTUdpL2ds?=
 =?utf-8?Q?sbCtoMilTLu+D7XaNkVHVCvOEPiigs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6369.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHpqMWRMR3pCZVA3VlpKb2FHcjRYd29NUVB2VUg1SVA1T0plbzhHN0hnYnBT?=
 =?utf-8?B?TE9STExoQnZFYlR3ODJKNVNzQ2VKcFVHS1VqV0NKSnpuWDBSbXBhbVlvWWdX?=
 =?utf-8?B?eTVqZm5BY1VuNHRnUmdwUzZWWE03bXpxa0NuQzNDOHd0bFhBMk9VWTlYbVBw?=
 =?utf-8?B?Y0thenlLc3ZidWx6SUJEUTlWaUdwNFhYUFZiRGVva0JvVHg2VWJUQXRqS2t5?=
 =?utf-8?B?VzJBbFdOK2VSWkRwT3p1dHhYSlEwaGpOUXZad3dMbUxIVVY0STlKVnBpbzVW?=
 =?utf-8?B?bFpXdjB6Q2tDYlRKVUkrZEpwc2JxRXdaTHV1Y2VaWGFzaGc3bG0wcFpmTUFN?=
 =?utf-8?B?dkdncjFBeVJWdHpFOS8xcjlLM1lVaVUxNWdHRzgray9Tb2YweStQQlNPcTRH?=
 =?utf-8?B?Ung0N2xrZS9leWE1bGN2S2NMRFdTazVSaXpnTFNxamR2QVhhWGE1ajhYSkJm?=
 =?utf-8?B?aERyRFJvL1lyKzJjK2tEOWhjNkhaME84ZWs2TTZMYUJNeUQzNVNaTmxpTVN4?=
 =?utf-8?B?Zlp0MTZQQXA0dVR1LytGejV5Y3ZhYXB2QlpIM1J3TVhiWkpmSUdUNFd3aThk?=
 =?utf-8?B?WkZpVjRZa2JJVytodVZxTTBFenVjMGFES0w4cWZXU3NmZ2diNEJycWdyMFZU?=
 =?utf-8?B?VTNieFI2c0JwaHdYUGc1cUdqOVZrNml5TURvYVBqK0xXWHNjT0hvY0pCbWhO?=
 =?utf-8?B?eVRYcGVSVFhrMmo0NVVPRlpCc3pRRmhSeEgzZWZhR29HbHMrN2grd0lJYnFN?=
 =?utf-8?B?YjhKVlp2aUlNNnJBN2NlN1ZSR1pmUi9qVUM5d1JwNlIyVE9WVnExTTFRdDZ2?=
 =?utf-8?B?c1F6L254Z2JqOXY4SWtwZ1hQTmVoTjNCYW5CMy9EdFprd1FWdTluUXFmczNU?=
 =?utf-8?B?QmJQT29UaFJlcDFsUnRpOVBNQ2dMcmplOXE1aUxGK2tRSUtoRlh1enlybkZ5?=
 =?utf-8?B?eFY5SFhIcnNnOGJCdHlEb0IyaDBFek9uUE9kSFBGK3ZkUkN1YWNRYThESndC?=
 =?utf-8?B?aEMwbENOcHAvYUl4bGtHZkdPa0U1bnZpR3FLajJxdFJ2UDdsa0VPYjBXM2Jo?=
 =?utf-8?B?ZHBKVDB3OHdFMW15VndtQTJCL29ublVTNCtkTjZWci9tYk5HRUxnU1ZKakpj?=
 =?utf-8?B?M05YeTRPOGpkN2lFVWVFNDhObU1od0pkd2tKazBsRmpWNjdiejlOYlAreEhw?=
 =?utf-8?B?Uy92YUZqZ0RiYUJjbzV2YVV4QmQ5cDgvV1dJOWt0WExQaXR4d0RNd1V1b054?=
 =?utf-8?B?OE1zWnVnVUoraUlHY2J0WDBWcndjNDhzdG5YL0cwaVo0TTJKTjhHT0Y2TUQ2?=
 =?utf-8?B?dm81NkFpWTN5VmMvOVozYWJGUGJlUmFqbDExRG10YTQ3Y3Zta0tFTTl6ZDh4?=
 =?utf-8?B?N1lsL0l0a1VqRVUvSnRCbGtYMXZ2WVFUNVFINTJCdG1tczNnQTJsRFg1bVB2?=
 =?utf-8?B?bHRMM09odTJxU2hkM1ZZMUdPMUJzZ2J5TDVNYUhJV3B2ZXg5THBaN0N2NWlF?=
 =?utf-8?B?MlBQMXlPcXYyS3ZZSXNSVlpHNzM5a0xpU1hLa2tZak0remtpcHVNclY2bjFp?=
 =?utf-8?B?blN3Mk1NNGtPYlZjaGJKQjFnY0FIMWZIWExqaGdHQlRqaEJuQjYzL3lJcEdi?=
 =?utf-8?B?UEhaTWNBcFQvVWZpcWs4emVGWlJJeEdhYVdGM2pNZjVwOW45RHU2UHpxUU5m?=
 =?utf-8?B?azNvd0lJaGxZelRUTHVHK0VaYTV6NlVmTGZZUVN4V29vMGZialN2TkxMT3Nh?=
 =?utf-8?B?VGRsTWswOXJncU84d1ZvQ0plMEVOKzY5WWZaOWxYbUlMV3lVTmxldHZSS01k?=
 =?utf-8?B?Zk9POFRFeHV2WElHZC95czBodE5Pa1NuSWZWMThhdlNvVU5qUEN5TkNPZFRQ?=
 =?utf-8?B?N3pMM0NMS09SS0ZQWVU0T3JKSGcxUE0vNGZGcXhWcWJ0R2djamcvZ2wzQmpv?=
 =?utf-8?B?Z3dwb0R6aTRJM2lDelBwMmNCYkRvUG0zYUFBTWFyczhjanBaZERMTUp2azk1?=
 =?utf-8?B?UG4rYkw2dU42OStEL2g3b2dSZ0d4WlRjM2NLZWVFVEdBVUxCc0hqSEwvSXpR?=
 =?utf-8?B?SkJGc2RmM0lJcngwZlFoeENXMjVGa2x5TTBOa2hjZEN3cHdaQjdwbWlWT3dM?=
 =?utf-8?Q?+W6twvqLvurcfxhV+ZWmuCqsD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D04C8175E62314181E59C9F221D1C47@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6369.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c2dba8-7b64-4483-f2d9-08dd96d8c7c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:26:36.4783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3ljcUh4LL4ITuG7SwCDJqVOBNb5Z7XZWCXm6U4cwweBHUD+ssrkO6MhaYc+GiF312WozZa6hTOsQ5fZn5yXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7942

SGkgQW5kaSwNCkhpIERhbmllbCwNCiANCjEuIFRoZSBpMmNfdHJhbnNmZXIgZnVuY3Rpb24gdXNl
cyBhIGNvbXBsZXRpb24gbWVjaGFuaXNtDQpmb3IgaW50ZXJydXB0IGhhbmRsaW5nLCBzbyBpMmNf
dHJhbnNmZXIgY2Fubm90IGJlIHVzZWQgaW4NCmludGVycnVwdCBjb250ZXh0Lg0KDQoyLiBGcm9t
IHRoZSBjcmFzaCBsb2csIGl0IHdhcyBmb3VuZCB0aGF0IHJ0NTE5MGFfcHJvYmUgLS0+DQppcnFy
ZXR1cm5fdCBydDUxOTBhX2lycV9oYW5kbGVyIChpbiBpbnRlcnJ1cHQgY29udGV4dCkgLS0+DQpy
ZWdtYXBfcmF3X3JlYWQgLS0+IGkyY190cmFuc2Zlciwgd2hpY2ggaW5kaWNhdGVzIHRoYXQgaTJj
X3RyYW5zZmVyIGlzDQpiZWluZyB1c2VkIGluIGludGVycnVwdCBjb250ZXh0LiBUaGlzIHVzYWdl
IGlzIGluY29ycmVjdC4NCiANCkJhc2VkIG9uIHRoZSByZWFzb24gYWJvdmUsIGl0IGFwcGVhcnMg
dGhhdCB0aGUgaXNzdWUgaXMgcmVsYXRlZCB0bw0KdGhlIHJ0NTE5MGEgY2FsbGluZyBjb250ZXh0
IHJhdGhlciB0aGFuIHRoaXMgcGF0Y2guDQogDQpDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBhbmQg
Y29uc2lkZXIgdG8gbWVyZ2UgdGhpcyBwYXRjaCBhZ2Fpbj8NCiANClRoYW5rcywNClpvaWUNCg0K
DQpPbiBGcmksIDIwMjUtMDMtMjEgYXQgMDE6MzQgKzAxMDAsIEFuZGkgU2h5dGkgd3JvdGU6DQo+
IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpIERhbmllbCwNCj4gDQo+IE9uIFRodSwgTWFyIDIwLCAyMDI1
IGF0IDEwOjA4OjQyUE0gKzAwMDAsIERhbmllbCBHb2xsZSB3cm90ZToNCj4gPiBPbiBXZWQsIE1h
ciAxOSwgMjAyNSBhdCAxMjozNDo1M0FNICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiA+ID4g
T24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMTA6NTM6NDNQTSArMDgwMCwgWm9pZSBMaW4gd3JvdGU6
DQo+ID4gPiA+IEludHJvZHVjZSBzdXBwb3J0IGZvciBydW50aW1lIFBNIG9wZXJhdGlvbnMgaW4N
Cj4gPiA+ID4gdGhlIEkyQyBkcml2ZXIsIGVuYWJsaW5nIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVz
dW1lDQo+ID4gPiA+IGZ1bmN0aW9uYWxpdHkuDQo+ID4gPiA+IA0KPiA+ID4gPiBBbHRob3VnaCBp
biBtb3N0IHBsYXRmb3JtcywgdGhlIGJ1cyBwb3dlciBvZiBpMmMgaXMgYWx3YXlzDQo+ID4gPiA+
IG9uLCBzb21lIHBsYXRmb3JtcyBkaXNhYmxlIHRoZSBpMmMgYnVzIHBvd2VyIGluIG9yZGVyIHRv
IG1lZXQNCj4gPiA+ID4gbG93IHBvd2VyIHJlcXVlc3QuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlz
IGltcGxlbWVudGF0aW9uIGluY2x1ZGVzIGJ1cyByZWd1bGF0b3IgY29udHJvbCB0bw0KPiA+ID4g
PiBmYWNpbGl0YXRlDQo+ID4gPiA+IHByb3BlciBoYW5kbGluZyBvZiB0aGUgYnVzIHBvd2VyIGJh
c2VkIG9uIHBsYXRmb3JtDQo+ID4gPiA+IHJlcXVpcmVtZW50cy4NCj4gPiA+ID4gDQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFpvaWUgTGluIDx6b2llLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gPiAN
Cj4gPiA+IG1lcmdlZCB0byBpMmMvaTJjLWhvc3QuDQo+ID4gDQo+ID4gdGhlIGNoYW5nZSBjYXVz
ZXMgYSBjcmFzaCBkdXJpbmcgYm9vdCBvbiBNVDc5ODggd2hpY2ggdHlwaWNhbGx5DQo+ID4gdXNl
cw0KPiA+IG9uZSBvZiBpdHMgSTJDIGJ1c3NlcyB0byBjb25uZWN0IGEgUmljaHRlayBSVDUxOTBB
IFBNSUMuDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHRlc3RpbmcgaXQuIEkgcmVtb3ZlZCB0aGUg
Y29tbWl0Lg0KPiANCj4gQW5kaQ0KDQo=

