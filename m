Return-Path: <linux-i2c+bounces-12338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F10B2C71A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 16:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C20371BC4436
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90C12741CF;
	Tue, 19 Aug 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kowKYaa5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="C4zUS7r8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F395258ED1;
	Tue, 19 Aug 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614014; cv=fail; b=E7j0A1/8cfrH8Sflxe0uC4YhLNTujJvbK5tpIg4sjYGWPsrs/SPugDOA1Gar0xTtg/lJ5qPRWxPUe7Ss5HsBQZVtt59h4J1EjPGScwf7oFCQhvONOW4JViKn8R5/WTSV7mS3BiG7g9nAJhYCRad7GL4TTkqEb+WCdCImsfYtbsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614014; c=relaxed/simple;
	bh=S4prxwgpffGkHl4rrMnTw6E9iuxzv9RM0Wokqac/F+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IK1vDka7sO/kZc0UJqt1QPOD8aSa9UEl9ibgTCNkRCGr7dvfbJ6QrDuB9k+mUCMhZsIL3mTX4UjcADYqAsst0iaAQJOfRiFDOVT+koR7gyrkF/sQtTSIxYS0K06vjFz8lteSnjxS5Ta1XI3mQwkNlfx46bZMxtDFWuxAsec7Umk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kowKYaa5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=C4zUS7r8; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 76bce5787d0911f08729452bf625a8b4-20250819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=S4prxwgpffGkHl4rrMnTw6E9iuxzv9RM0Wokqac/F+8=;
	b=kowKYaa5Nkm7hf/GYl/g3jNy9IGtWX/naB29OuS5d9sqewo4Lb8Mx3pyJ6LvCrUYVwLzHUTZnW+FO47SdYvDCrHC9slXbrWe83Ac/FcLoefJY10idFa3yvxWd99vKUYnsb8hiCgExBe5UhVThkUb/liy76OHm9ifBjgvgHt6Vig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:abec989d-381e-48ae-bf0a-457c552a216b,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:f72e4c7a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|110|111,TC:-5,Content:0
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76bce5787d0911f08729452bf625a8b4-20250819
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 359675590; Tue, 19 Aug 2025 22:33:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 22:33:20 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 22:33:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8tNOKL6Peag/3jJd2xhNHjr3kOWE9LkEIlvi2VKooYZe2YePi3zVPADH4qX0c6WG7ElqIKa4wwga2nxf9BqMvUF1zmUGSYVA//+P4AN8ag0HZXjwNw9Xd//khrn7utfr16Hs1dqm3eaR1A39gyDuoWEx7iNFjNMEJWUQfLVh1n4Ghm52tqpy1nwsDqhLLpmAxFn8bM3nmeqmK3iNMkuN00Sj3AUIWRI7/G5lYNGhWkoAMsEp6hh0Xbbb6NuMG5ZTdy3NTiP3jSSgsMOeBeEJVjREB2qHBPxM0Kj+RjN9K758x+0YL/nRE3S6kx4wW8xy6cMWE4B4lfjN/I2FSIgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4prxwgpffGkHl4rrMnTw6E9iuxzv9RM0Wokqac/F+8=;
 b=UwSrUiBFy8P72SNZtTt9Ex1WwHUfoDojcbuw/JlUuDhyF/KV8YLrTI1ZYpana8PXJl/N6g+T4nWQj2Z67ASoR5Urc2Sbq3W/B8deujN35GgSqFWnw/hf9uVJEdcXdNViYUvqwRPJ15+pQCeiMtoqAkQ2aeTj1wksuCo3ydQ2/8eJgrfJjPKWYIjjgFIcXt9J+bOBSNGWtKH6yQWdmYXiAe1aa+v6jGAUZa+WKGl0IAAQ6GbZWrEYRp+qOGvNg9Jbfxq3y23+kW03jvGNliLrAHabH4slroOUxfJnoZyoO9+KeDHZKGxNeGiBvR9ZHL2brKK2xaLB1NEJIAo83NYwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4prxwgpffGkHl4rrMnTw6E9iuxzv9RM0Wokqac/F+8=;
 b=C4zUS7r8XnhvXDS+kRpcAh/RGNBPrMjMKKSIPcCV5qrwKbJMEO7gT4ultl1g6Nws+xazf41Yu5NGdW5dqW0wr1hnTTR/MdQDmq6BMzd+iX5V+oEwoIU52M1uw0QCZI6j41T3Z9Fe7cfKngb9k+fqHpcsDH2TB5tCzwvbK7IffCk=
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com (2603:1096:400:149::5)
 by TY1PPF4D0176D00.apcprd03.prod.outlook.com (2603:1096:408::a53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Tue, 19 Aug
 2025 14:33:19 +0000
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508]) by TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:33:19 +0000
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
Thread-Index: AQHblPD8aCJuLR3mjEKjCfcqm/NKPrN5ktCAgAMMlQCAACicAIBdkWWAgJCpIAA=
Date: Tue, 19 Aug 2025 14:33:19 +0000
Message-ID: <2b23a56c71548bec7114c2ac6034c3b8c0d51362.camel@mediatek.com>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
	 <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
	 <Z9yR6pyg1mtqKynh@makrotopia.org>
	 <em2y3tkiwlxc45f4sjtzdd3oy4v5zpqgdpqfppyzah2ilzidg2@wn6cnrezygpl>
	 <8874a29ba42eb828d70deb73d4b84a59126b84c8.camel@mediatek.com>
In-Reply-To: <8874a29ba42eb828d70deb73d4b84a59126b84c8.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6369:EE_|TY1PPF4D0176D00:EE_
x-ms-office365-filtering-correlation-id: b9a3a738-bb99-4adf-310d-08dddf2d57d4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SEJoWkJLNmFrZWpCOXQvQjFGU3FyQzBtZ09EbUNDZE15ZVdCdWtGL3RVSXAw?=
 =?utf-8?B?TTVnTDNzTlVIYnFObGhlNFk0Z3o3a283eWhGblJhOXpRazFjUHI1OWZoTXpH?=
 =?utf-8?B?bWwyMEZ3ZTQ5dTQzT2wrdmtKaVd6SUJPSWhaenlsMnpJSHNJY2IvREtGRWFx?=
 =?utf-8?B?SDBGL1JuY1B6REF2NStBdDMralZOeFhsclFJeXhvV3ZjWTVsL2dBMWxHR0Vk?=
 =?utf-8?B?OW4wNXA0ZDhISkhiRUpkdjhGQ21tRHE1V3JwWm9wZzBJVStWSFMxNnFUOXNy?=
 =?utf-8?B?YjhrdkoxWGc2UkV3ejJLdWpiSHhYUExBa2RSMUFrU1FTRDVVdmhwVDU4elpn?=
 =?utf-8?B?RzZsclZZcURoWTYrK2VMWVdLaXVlQVdHd1U1RU9DQ1A3OGpCQjF0aWNqbHVW?=
 =?utf-8?B?Q1RYK2NZVXFwQXl2a1RZVElMY3B0TzltMlArM3owVHBITTFOYURlZlUwT2Nm?=
 =?utf-8?B?Wjk4UzVRa3NnbWFYUXdyU1J0OG14ZkVvdlp3R0JxM3pTeEtTaThBTVVTcWg2?=
 =?utf-8?B?QTV6K0djdnNXaHkxc3NSVTJkc3lJVUdhRHlmVkNOcmJGaXh0b2pHVDQwN1Ji?=
 =?utf-8?B?VnovdzBjV3J4dm84eTlSZDh4a1BubjQvakRBWXFPNHNQUnNCYUwwaXYzWG5l?=
 =?utf-8?B?RVVYZW1sOHNOOVk2SVU5MU9kc1hJT2lJUDNZRFJ4UENBVEdrRHVxbWJMbTNn?=
 =?utf-8?B?NE0zVFVaVDZ2aXpSVVd4UGd1SFd5c2pweW45OUIwRFZnejg5UTFvSzhFTjdD?=
 =?utf-8?B?TDRaZWI3eFhVUWtCc3p2M01GSnNXTm8vcXNpV2k4bksrL1pqcEpFcVBPZGxt?=
 =?utf-8?B?bTZ4VDZEcHo0enpGTDJBbXlKdFBOaUFnM05uYllGRXVMVWdvZHl1dmNPbEVV?=
 =?utf-8?B?aXdGeTNWWFR6cmgzaGVHWjV2WVNJeW82WG13QU4xY2NheTRacVpwRUx1VzBF?=
 =?utf-8?B?UWkyWklQOERXUGJ5RVEyaTgweVg4VWxVaWV3a0ZmQ2htQ1ZLOXFRb0drRzZw?=
 =?utf-8?B?UkdDaXFNdGc0RkRNK0N4STllZTRwbktzTXBvT0lWRldhNHRrUTBiZ0Q2SFpx?=
 =?utf-8?B?V3pPRElvYkpxd2YzNTVNeklrbmJPTjJjalE5WUs3MVcvaEVHVGxxMUhsdkJP?=
 =?utf-8?B?Z1drRzVQWHF6SHBNcCttOWYxK2RNeEY4cDlkME1TbzlWeFpTUkdlbTdyUHAr?=
 =?utf-8?B?TVIzTTZSczJJZkRPNklLSjlmdGNIWDU0ejBobXRmam9DY1hGSGVseVUwVGxu?=
 =?utf-8?B?QTRpREd4UXpHbVlZKytUYVZ5WSsyWDI4Rmd1ZldOQ0FwbEtZUU8wcDkvZFlp?=
 =?utf-8?B?Rk9SdElhUEdtWWVxcVBkTmlqdi9WWFV4ZlJlSlBVNStoY3c0QjEvTkJuNy9p?=
 =?utf-8?B?T0t1VXlGK1BZaEx5dDB2MEtrYzZyZXQvK1hzank0UGxRaFpKOUhkQ0NyNHc1?=
 =?utf-8?B?TEZzeVZFTGgwdGtWcHFQeFRiYnEvVWx0RnJGZVpzWnlEUUd2eS93RG55Z1BY?=
 =?utf-8?B?TEp3dXYxLzdBVkVDZmdqb3cxTTlGYytxL0pod0JyNWk4Vjc0SGJYWWVVZ21i?=
 =?utf-8?B?Ry94aVNRODdZVGxIY0JQUGZqZnkzTDRUeGloQlc3RDUxNWJPemkvbUVMS20y?=
 =?utf-8?B?bWlCTGFaRTQxcUo5VXVISm0vV3BaV3BLNXNOSDlIUjJFS1QzNnZYNWtNb3NE?=
 =?utf-8?B?d1JXWXFDTzJKOTA1RVRrK0IwMkt6Wjc0MDZ5WVdhMHdId3czYkVtS1VheitJ?=
 =?utf-8?B?VXhQejhzN09VaDAxK0VycWNwc0QzQVNmWWlncXp4VzRFRHlGU3lNR3pjaE1F?=
 =?utf-8?B?eVphQ1F0MjRSNVBpM0Y1S1lPM2dScmVJbEI3akdRWkRsWGoxYnQwSytBTU1O?=
 =?utf-8?B?SDg5RVRDbStndDBUcC91OW81SFlDU1BJNVE1NGpjMlkxL0FpWXJWUjUwTTR2?=
 =?utf-8?B?eHMxN3U5M1dGb2NhbS9HSnNtSHVpKzhlejltUGVCYVlReWN4SE5yYmo5ekFx?=
 =?utf-8?Q?Vp/OkBXa7bZDQJYJ3MmCF9k9Kuum5g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6369.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjZkRXBBeWJPNHVhU1R2Z2pmOGNHM2JxbFd2cVdXbmhjRkVVNEpiY3pkNDll?=
 =?utf-8?B?SjlOTjBWVkZrVHY0SWM2SDlXd293clU3SXVtclJSclAxWHVQU1JZdnJ2ZkxW?=
 =?utf-8?B?RjBpSlV5djBsOUdtVzhSZUR3WW9zS21NK3FqY2RmL294Ty9BTEhxSXpEZCtO?=
 =?utf-8?B?RTNlNStBMXJoQTZENUZmQUxiazlnNURMRWtyU1lsV3hoV1RpODBlOGZZUWVm?=
 =?utf-8?B?M0R4YUNXUjNkU0NNenVtZGFwbWlrdC91K0ZGWm82YXFCUmZ1OUZ6S1RxSlNU?=
 =?utf-8?B?c1pMZmZYQVJDRG5LTUUwSXJoWm8rWTZPUkl0YWhQdjQ1eHJSNnFCUU9MUnBO?=
 =?utf-8?B?TCtVNExlREZzRW05VmVLS0hTMWcwamI2K3JGVzNCdGpPOVZVT3hxMENqUzBL?=
 =?utf-8?B?T1hKSjFsRWIyRHVEZ3hOZllRVmdkQVBRMnJ6OGN1c1BySENEN01OamNrUGh0?=
 =?utf-8?B?ZGhMaEplZEZ1ejhQR3pVdHZmcG1NeUpycVBKNml1UXRsVnE0NWJqZnpIUlRH?=
 =?utf-8?B?UEI5QVB1ejJYUE5lbWZYMU91UXZkcUtTQlRHUWlPc0pLZlloRzJtUTJSNmR1?=
 =?utf-8?B?TFVFNG9OczByNE1SdGRaNW5xVTVIN0xlWFdLZy8rZW43TEJTaVpxcnhXbzFY?=
 =?utf-8?B?VnJ2V0xhOTU0ZmdzKzNldU03N09oaUJDL1R6Y3h0RXcreUIxdmZYTHZ4SHFx?=
 =?utf-8?B?L2Q1dGYvbXpHMWFPZUFWeFlEVGVEczhKSThSR1FRL2tzUlJPNC9mZ05qZnVQ?=
 =?utf-8?B?Ulo0Wm9rRFg1ZEZNYnUxVHFKaytDdE1renBHeVNZeE95RnA3M2U1Skp3VE9u?=
 =?utf-8?B?QWZwYmhlbms4RlY5U0I4NjhMMXBzVUJyVEcyWEpaNlpiODREWG51QTV0dXdB?=
 =?utf-8?B?NWFFS0hvZGlpNjV5azhsNFRjcit2QWEvR2F4R25pZjl4TEJ3cEhkSGZpR25O?=
 =?utf-8?B?bktZekZnRXRuSDRmS1ZXVkxXNDV0b2JyN2xLTnRLWWwrdWRudUU4amI3Uk9j?=
 =?utf-8?B?TVhuV1o0UVZFNjQ1YndDa05GK1pTczVZd1lGcmgrLzMwOEdwWDhVSVQ5clFp?=
 =?utf-8?B?MndmenR0ZndNSURNUXptYWtiUmdLZDRXL2dWZWZBNklUMDV4aEJWbi83QVl4?=
 =?utf-8?B?YTAxYVZHeFp5QVpJNUoyZGdEc1hIeWcxUkRGLyt3QVpqeVBBVHdYN0tBdzFS?=
 =?utf-8?B?aVAzSnFGOWdPL0hJbTNRaEdOUDJDTVMycmhTaUlCcGltZ2RHdEs4K2dYaGpz?=
 =?utf-8?B?V0FKalU0V1BtSUNaVEtnTWdyOEdVaHNEem5PMzE2RkZQSkgwNVI2VE5vOTFV?=
 =?utf-8?B?aGJ1UE9ocWY5ZmhOSnhnU3k5N2xLM1o4czZUVGFJR2VjWktsS0d1N0dOS0dP?=
 =?utf-8?B?MFpZWVIrbEwrYlcyRGZtb2hhZU1LaU9SZlg3VTlXK0FuWFNHaFJFeHZhVGpr?=
 =?utf-8?B?SExJVlJnZU1peEhBdUxTL1BEYnIrNHFCbjBzRHo3bHFEaGx6Wm1McVFDMFlU?=
 =?utf-8?B?Q1V1L3FGeFhDR1JPZ0ROQ3Q0RHpjM2ZkS1M5V1Zhcm5kZGFXZkphQ1J4cUkv?=
 =?utf-8?B?Y2s0dGg0ZW5HQThVMWphSEpWL09VMkVOSVJtMkNiL0w0MS9WMW95ZGMxS1Ra?=
 =?utf-8?B?dHRLTThxcWJGcVl1TGtOQ1V3MHhueGMzNmw1UmZNaHVjTnpEdFdGVVd6aStq?=
 =?utf-8?B?N0RzbHpUT1ZpeEY2YUl3MnJkUENyd29hRE1HMGNjVEZ2dGFzWDlTckFtSC9H?=
 =?utf-8?B?a0U0WkU2eTh5MGxncURKb3R4elA2K3FBUkkxcks0YUwvK0hLRGhKc01WS0Vn?=
 =?utf-8?B?bEtGQmFWU3ZBSGFoQ0RvV2wwb1pvNms0dlRLMDRrNkptZ2pXNVZqUFFjdUhY?=
 =?utf-8?B?bHVVMnc3ZkVxV21sa1NYdnJ3T0R4NWZwV2FnN0FGZ2V4S2xtL3lGZ2srQzA4?=
 =?utf-8?B?VUI1aWZMS2FyZGNGQXhGcG4rVjUxSmJQQ3llN2hqcDBKWjB0b2JPdmR5Mmdv?=
 =?utf-8?B?bC85RWVPbVZLSXU3NjBSaVpqekZncit2ck5vU1k2U1dGQnhHRWx6ckx6TFFr?=
 =?utf-8?B?eWxvQ1BGUjZsV3Y5eWFVVXNmelV1UHg0Kys5Z3RqK3BGVGxVWTZtQjkranQ2?=
 =?utf-8?B?NUNscDNoN1lKTzZjZTkvSGtIZGtBR1VicG9uN1pydGVCZExyL3lWUmllOVI2?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E2B06B5F942414E908C7F3B3E6AF517@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6369.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a3a738-bb99-4adf-310d-08dddf2d57d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 14:33:19.6052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87lAV6sSJNhc2/Wf/8XTrwaDVCsH33OwnEZjTLxWkf542KeA73e5f0s5lktBNt4ezIA5ozJjG3RQIegM9JOO5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4D0176D00

SGkgQW5kaSwgSGkgRGFuaWVsLA0KIA0KSnVzdCBjaGVja2luZyBpbiB0byBzZWUgaWYgdGhlcmUg
YXJlIGFueSB1cGRhdGVzIG9yIGZlZWRiYWNrIHJlZ2FyZGluZw0KdGhpcyBwYXRjaC4NCg0KQXMg
bWVudGlvbmVkIGVhcmxpZXIsIHRoZSBpc3N1ZSBzZWVtcyB0byBiZSByZWxhdGVkIHRvIHRoZSBy
dDUxOTBhDQpjYWxsaW5nIGNvbnRleHQgcmF0aGVyIHRoYW4gdGhpcyBwYXRoIGl0c2VsZi4NCg0K
V291bGQgYXBwcmVjaWF0ZSB5b3VyIHJldmlldyBvciBjb21tZW50cy4gVGhhbmsgeW91IQ0KIA0K
QmVzdCByZWdhcmRzLA0KWm9pZQ0K

