Return-Path: <linux-i2c+bounces-2299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35237876AA0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 19:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5592B1C212A0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D1E56459;
	Fri,  8 Mar 2024 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AOHNBk/x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC917745;
	Fri,  8 Mar 2024 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921752; cv=fail; b=q9IC4a9a+gBrP7JdyraqVaDU4wUM1rKrB2kkOnXPrQ3rAvYVh5eoi9O9rFEKDMFX0OejZ8bHHCE8REJfOSBO8RrUGJQ+PdtGFkBCJ6syOyG6g6yqkclx+ZWkAY4lL5YZgwEGhVNH0y/m5+Uzr2UjDJL9Wo7Hp1GMXUYuQdX0fjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921752; c=relaxed/simple;
	bh=QIqWaef2GYYOTpSNEWzLQ34GHj6HAuCrFLV9kPYPxNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GwqlPKb4YComlsbtIyGGLele5/oZKcdazh/fDuRQJG5DGEmGuJn4bv7uCa/PsQeNdMw8eRh94Bn3dtplB6L3uioMQ5T79oAgvrXXXaGsyJeqYQrR2fc15yjPCjm39zI5wkvE9iSHRvlR7z4rYaIJvl0b1vRIZ3U8IUr+/6K90NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AOHNBk/x; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UokO4ewIiV13m5lfz0Jjv0bofIUCqpX4fd4ZFX2IBtTWze2Mu7iIUqt9Poko7MY1ATsHthtgGat3uMo6Rep2SDdawQBXNLwmKYHMmoaSFTBscCvrG79zB93fHaorXZk1KfOCvURHEIj8W2bE0uN3tEB3Un8PaiyeddG1fNrlzqU2PQI/S2B+Hdk3AZ1n8lTFojp3hagKrO3iK0vrGrpNYQilkDJN9ftp56FMtk+ldVdRwzryFdQw22Ph45+TZZ4MVi0X5L4jhyBO/KnkpzAlT+FwG5rmKc222ZEsuUH9tvC9tMca8C3OTe0T6wnLSdrZCnI86vo4TTIrp7FHTBUzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIqWaef2GYYOTpSNEWzLQ34GHj6HAuCrFLV9kPYPxNE=;
 b=GhdM2IwqypiHwM1huqVMrXoD7zOtiXzrl5XVN++es9MYS/WrX2C5SgeROzx3WpvasZajVTpy6ZlKqxUMFfIJgsY3v3+cvijyGhUxjTr1Um5oAFiyWAMx6R4smQ8MYY0dYHVKkII7YeMAbPo3bj5OSk3S7Gcb48tSXAxw67ICRPpsUOyGX7uPFFrbvLLon4CWSQjo+iu0CjKs8N4TFbGNyYDzWpYoKeu9hMzlscg4ilIzcQFAi8LAZhlu3otsMJqRXAVjfRnOadO9D6SxroIlMhf1Q0bEzi2bhDsos1DdMMXhSNXRAVBQ607b3mbh7ZYMbb4ud/jWashCNPHKGFJ8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIqWaef2GYYOTpSNEWzLQ34GHj6HAuCrFLV9kPYPxNE=;
 b=AOHNBk/xL4KMWY0Da8qB5zpFCu5XwDTxUEYM9cOYSL7kxaCod2YjwoYD7gNFJl0rtbuv7e4niEdoJCj8W9yC0oiuP0gts0PIh4nMt/1OkKupBqdK97ZP3ekMLpaEzb1mjCg4DCkCFytH/gZMd0KvJAwIWebvTVSdaryE4xqLEJM=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS3PR01MB5654.jpnprd01.prod.outlook.com (2603:1096:604:b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 18:15:46 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 18:15:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
Thread-Topic: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
Thread-Index: AQHacX4tmFc1CI8ipE+h03wpRb2Q9LEuGoKggAAIZoCAAAI6MA==
Date: Fri, 8 Mar 2024 18:15:45 +0000
Message-ID:
 <OSAPR01MB158788EB1E8959BA8455E5FD86272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OSAPR01MB1587CFE774834B31820E7D5486272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <CA+V-a8uJO_qz6CaD2zUXC1Kf7tuM+Nzq6W+WHjy09NN2FAn+fA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uJO_qz6CaD2zUXC1Kf7tuM+Nzq6W+WHjy09NN2FAn+fA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS3PR01MB5654:EE_
x-ms-office365-filtering-correlation-id: 95567c57-2e10-48b1-c661-08dc3f9bc60d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9iLRIES0C/MgguOz7rqouSXWFT60wAwVmCrpyRSZ8BRdvDNs8YO61WeLicwRzTVuTpJ77guwKtrGB7NgTfwLiPBW4+99hNbtXgkUEprcKHJanL+F/FBMKq51XrVlOsfB6H/TW33QScMcu666PapQmv7elYH3KB03jHTwaavC2F7twSwiVU7SAxYQl0NFyTg11ig+He1iHla9L1zKsefbmgxEl+Os81MPRSwRefB8V271Cz4orO1BypZJxLo/G2OzpwOpismYFdupXMuMNN04bKXBGBjsxz7+38lB6GOU7a1IDwjU+2l5LnLA/ebf7KhZsSjlbv/hK8UQecMvBQqbuLde9/NeTNW3rhBwFCiED9OQbi/kPqQ171PpVFJe2duQWtyIqik+WH/2zqqUvIKs/S5cVBdrNz2cYgulKwzIxQzS3GYSRO5RW0Y2sMGXyOz5Bq73G2QA1PZnqomiRHjsBQTTKEPhSZ2DI7F0lF60moLPQbNlc4V5I7LgfOYiGZEvcSipIpCIoAT3o3YfFO94fzkCnh2eCHQy+tiGIPx8/n2SQXxmGmJTn1WyxyrVTGi5PQV06UqJxGaKULWL414F+1k49JDXqVBMODhhk9u4toF8NzQdvMyi13c0u8Dr+ObtKp5bQkRv74ay6WvAMLXtiRKLd/o8zPja2gCaOmMiX68kwooKJ8n8xTSZ69p6JUGl/CaT2uJEGNgIbbZ6663QfuhiL5vr1TrVkftUHnwqCqo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a25abEtZQXFlT3FXVUIrSmdwQWZ6Z2pSTjZVOFRQOU5GT3F3QjFVcXRyaVpL?=
 =?utf-8?B?SDl3ZEJrUGV0VXdjK0ovNDRrWjZUb0V0SFQwK1BuNGRJWVIwVExqcC9rY0VW?=
 =?utf-8?B?WXU3eEd0eHc1T1JGb0NRMGVnb1ZDYlFjYy9uU1FPUlcyc0FwZlRXd2JPSjFG?=
 =?utf-8?B?VXkzV3R5UWZnb0gxVGNqb2dwekRONDcyVW9PU1dNK083S2lSVyt5djhzclpx?=
 =?utf-8?B?cTdua0lLMUN1enRFVTZjeUg2ZDZldHAySXRLS2Y3K3RrdWsyaGdpeDV2SnVD?=
 =?utf-8?B?bURoNkRNd2RJOHpaUHpCU2hISVJRbUdWazRuZlR3TjNUVno1Nk1lN01GSUw3?=
 =?utf-8?B?eXZkQlVOYkxMd2lCaWwxTmIvMXUrdjBKMHFMYmNDRFo2VXlXR1FaMy9XdXBI?=
 =?utf-8?B?Z3Z1cWx4RURFVzcydHozZDRZbWRjU09MM05NWmdXVTNGODNiU0JGR2QzVGh3?=
 =?utf-8?B?VkJuNE51VzdkelphZ1ZiMmY0dXRUUlcrcWNRcm9LaHR2d3dPN1JCdnE5dUhP?=
 =?utf-8?B?dGpObzR1RUY4N3hlVDFqYUxkdWlWT0FGUUpWc0w5NjdqR08xQzJxdDZSZm93?=
 =?utf-8?B?d1ovZ05wMGlwVVBFZE54VC80aVpreGVJZDlvdEc3L1NaMmhsWE5sUXZndHJW?=
 =?utf-8?B?MjR0VWJtRkpQd21VTXZqT0pjSlJtTkVZK1dyTDVpVlFZa2dqSE1yM0UzNXY5?=
 =?utf-8?B?ZEFPdzlZa3pZbFNoVUIyZjBJZUN4WlAreHA3SURsUjZRMml6OVZkM0MyQlZm?=
 =?utf-8?B?SFVVMW1mSS9QSjQrZUZ5ejV0THIzTzNTQkRwVjRTSWFIQUJRTnZBcnNMNzNJ?=
 =?utf-8?B?Ulh6MXVHeHl1RDlBWFJvZk0zd1QxVFgwNnJVTXVkb3V5QkNGTHVOTEZMMm84?=
 =?utf-8?B?cmtjbjdJUlArUDF3SzVVWHlaSXA2QUNHMTF4VEJvZkJKSTZpV21JbXkyTml2?=
 =?utf-8?B?VldNOHNkb0xvc2x2SDdWUVBHbHFmWDA0NWpzbnAzYjhDMk4rbmpTaEtoZzZW?=
 =?utf-8?B?WHZoUkNQVWgxbjMzL1VpWE9DWDdoTWNXNDRCVy9MaDVMNyswT2lTUlJGR1A0?=
 =?utf-8?B?QndReG5YelBjeEhxWlU0eURBRjhjWkp6MjRNQ2N2UitIWERDSzcyelRWbFdp?=
 =?utf-8?B?TmxlOGxIYkwvQmJ3WHdBZ2t0aFBUMGpoZEZvRHhzZlN4K0dROVRjQkNSaTgv?=
 =?utf-8?B?c1VpTVhZbThQUWJCc3VjK3M4d3I1bjJIcXVxdGZGajJFMkdaSE13V3h3ajNC?=
 =?utf-8?B?RHFqOEY0OHVScllIM0grOHAyKytCS3h2U2Q5VkRIVDhNbzY4VWxYQUtTa2R6?=
 =?utf-8?B?VGxrZ0laYzl4UzB2QzdWbjhFTkozc2VNT0tFRytNa1UwRXl2bTA1VUozT3RM?=
 =?utf-8?B?VVhqR3paRjluT1BFUGlPMjV1UVJiK0htWktzUWlnazZxc2tXaENRNjFjbGo2?=
 =?utf-8?B?eFlENzU1ejJ6aHY5L0hlZ1dmOWlwbEg4REkwTjZPZnUzV3kySFlBQ0VkTVpD?=
 =?utf-8?B?L01PZnlxMzNObXdUU2x5dEZsd1RLY3lkaG9aKzBMaHFKNktHZjZwc2RFM29M?=
 =?utf-8?B?SXRLczVVeXoyZGZKdzhXamtvaDZ4Rkd1S08rcGNQWS8vd2RVdDhmS092b3lF?=
 =?utf-8?B?aW1zT1FZdlJtdUpoVklPMk5tTWRuY1ZBOUZWZVBtNnBRR3h3UWl3cnFKaWxP?=
 =?utf-8?B?RDYzZEswTzZGNjZLRFRMcmg0QzI4RVFUdmM3OWNKS3cxZGFmNWRlWGZSQjhs?=
 =?utf-8?B?YzhaUk5pTStzbE9XNHVYalhwK3hYdkJOOXVMd1hvTzRyRE9FNkgzcmFmN05U?=
 =?utf-8?B?QyszSzh4aU05WWtKaldKcE5vSlh4N3VxbFRmS28wY2Jnc0JkQ2tSdkQwZFVW?=
 =?utf-8?B?YVZZWmZvTzMwdkN4K1kyU1Vpd1Noa1lvY2VmN05STTd4VE1CMjJBdENxM1d5?=
 =?utf-8?B?eE9uSlZXeEF1STVpVm1MWVpnZFA0L09UZnNJN29IOHJaV3F5MnUrNjZvV1Nw?=
 =?utf-8?B?OEZMek9MV2M3azhDdVV3K0pjbmdkZWp3QWYvUlRBTENVT29tTFFQdGRVT0lJ?=
 =?utf-8?B?WE13MGh2M2hMTHFzQk03OGdoNTNuVkNORXNuVlNRc2VoRHFJQ2JkWXVwYjd4?=
 =?utf-8?B?UWZESXlaT05xTUhsdURwRzdzb0dVUjc4ellET3h3ekVqTjlEUHB4TkppZlc0?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95567c57-2e10-48b1-c661-08dc3f9bc60d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 18:15:45.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/M9sLkDpT3aBx0xnlBsSsD5WLZOnAP3p3hByVkR+cd3UzqwOlLY8C6/uIwuI4NTLHFK/QaHoQuThGm15CThsM7n6AJ4MbEgRdyhCi8x2OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5654

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDgsIDIw
MjQgNjowNCBQTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IENocmlz
IEJyYW5kdCA8Q2hyaXMuQnJhbmR0QHJlbmVzYXMuY29tPjsgQW5kaSBTaHl0aQ0KPiA8YW5kaS5z
aHl0aUBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlz
enRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENv
bm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hZ251cyBEYW1tDQo+IDxtYWdudXMu
ZGFtbUBnbWFpbC5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJp
bmcuY29tPjsgbGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJj
QHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5q
ekByZW5lc2FzLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0gaTJj
OiByaWljOiBQYXNzIHJlZ2lzdGVyIG9mZnNldHMgYW5kIGNoaXAgZGV0YWlscyBhcyBPRiBkYXRh
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBNYXIgOCwgMjAyNCBhdCA1OjM24oCvUE0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhp
IFByYWJoYWthciwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFr
YXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggOCwgMjAyNCA1
OjI3IFBNDQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggNC81XSBpMmM6IHJpaWM6IFBhc3MgcmVnaXN0
ZXIgb2Zmc2V0cyBhbmQgY2hpcA0KPiA+ID4gZGV0YWlscyBhcyBPRiBkYXRhDQo+ID4gPg0KPiA+
ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4NCj4gPiA+IFdpdGggYW4gaW5jcmVhc2luZyBudW1iZXIgb2YgU29DcyBy
ZXVzaW5nIHRoaXMgZHJpdmVyLCBlYWNoIHdpdGgNCj4gPiA+IHNsaWdodCB2YXJpYXRpb25zIGlu
IHRoZSBSSUlDIElQLCBpdCBiZWNvbWVzIG5lY2Vzc2FyeSB0byBzdXBwb3J0DQo+ID4gPiBwYXNz
aW5nIHRoZXNlIGRldGFpbHMgYXMgT0YgZGF0YS4gVGhpcyBhcHByb2FjaCBzaW1wbGlmaWVzIHRo
ZSBleHRlbnNpb24gb2YgdGhlIGRyaXZlciBmb3Igb3RoZXINCj4gU29Dcy4NCj4gPiA+DQo+ID4g
PiBUaGlzIHBhdGNoIGxheXMgdGhlIGdyb3VuZHdvcmsgZm9yIGFkZGluZyBzdXBwb3J0IGZvciB0
aGUgUmVuZXNhcyBSWi9WMkggU29DLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQ
cmFiaGFrYXINCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiBSZXZpZXdlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpA
cmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJp
aWMuYyB8IDU5DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4g
PiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgaW5kZXgNCj4gPiA+IDQ5YTEyZjFl
Y2RmOS4uMzM5OGQ2MzliNzU0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1yaWljLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jDQo+
ID4gPiBAQCAtNDYsMTggKzQ2LDYgQEANCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGlt
ZS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+ID4NCj4gPiA+IC0jZGVm
aW5lIFJJSUNfSUNDUjEgICAweDAwDQo+ID4gPiAtI2RlZmluZSBSSUlDX0lDQ1IyICAgMHgwNA0K
PiA+ID4gLSNkZWZpbmUgUklJQ19JQ01SMSAgIDB4MDgNCj4gPiA+IC0jZGVmaW5lIFJJSUNfSUNN
UjMgICAweDEwDQo+ID4gPiAtI2RlZmluZSBSSUlDX0lDU0VSICAgMHgxOA0KPiA+ID4gLSNkZWZp
bmUgUklJQ19JQ0lFUiAgIDB4MWMNCj4gPiA+IC0jZGVmaW5lIFJJSUNfSUNTUjIgICAweDI0DQo+
ID4gPiAtI2RlZmluZSBSSUlDX0lDQlJMICAgMHgzNA0KPiA+ID4gLSNkZWZpbmUgUklJQ19JQ0JS
SCAgIDB4MzgNCj4gPiA+IC0jZGVmaW5lIFJJSUNfSUNEUlQgICAweDNjDQo+ID4gPiAtI2RlZmlu
ZSBSSUlDX0lDRFJSICAgMHg0MA0KPiA+ID4gLQ0KPiA+ID4gICNkZWZpbmUgSUNDUjFfSUNFICAg
IDB4ODANCj4gPiA+ICAjZGVmaW5lIElDQ1IxX0lJQ1JTVCAweDQwDQo+ID4gPiAgI2RlZmluZSBJ
Q0NSMV9TT1dQICAgMHgxMA0KPiA+ID4gQEAgLTg3LDYgKzc1LDEzIEBADQo+ID4gPg0KPiA+ID4g
ICNkZWZpbmUgUklJQ19JTklUX01TRyAgICAgICAgLTENCj4gPiA+DQo+ID4gPiArI2RlZmluZSBS
SUlDX1JaX0FfVFlQRSAgICAgICAwDQo+ID4NCj4gPiA+ICsNCj4gPiA+ICtzdHJ1Y3QgcmlpY19v
Zl9kYXRhIHsNCj4gPiA+ICsgICAgIHU4IGZhbWlseTsNCj4gPg0KPiA+IERvIHlvdSBuZWVkIGZh
bWlseSBhcyBjb21wYXRpYmxlIGhhdmUgdGhpcyBpbmZvcm1hdGlvbj8NCj4gPg0KPiBZZXMgdGhp
cyBpcyBhZGRlZCB0byBmdXR1cmUgcHJvb2YgaXQsIGFzIHRoZSBSWi9WMkggU29DIGhhcyBzb21l
IGJpdCBkaWZmZXJlbmNlcyBpbiB0aGUgc2xhdmUgYWRkcmVzcw0KPiByZWdpc3RlciBhcyBjb21w
YXJlZCB0byBSWi9BIGFuZCBSWi9HMkwuIENvbXBhcmluZyB0aGUgZmFtaWx5IG91dHNpZGUgcHJv
YmUgaXMgbm90IGFsd2F5cyBwcmVmZXJyZWQNCj4gaGVuY2UgdGhpcyBpcyBhZGRlZCBhcyBwYXJ0
IG9mIE9GIGRhdGEuDQoNCk9rLiBHb3QgaXQuDQpCdXQgdGhlIGZhbWlseSB2YXJpYWJsZSBpcyB1
bnVzZWQgYW5kIGlzIHdhc3RpbmcgbWVtb3J5Lg0KU2ltcGxlIHJlZyBsYXlvdXQgaXMgZW5vdWdo
IGZvciBkZXZpY2UgZGF0YT8/DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gQ2hlZXJzLA0KPiBQ
cmFiaGFrYXINCj4gDQo+ID4gPiArICAgICB1OCByZWdzW107DQo+ID4gPiArfTsNCj4gPiA+ICsN
Cj4gPiA+ICBzdHJ1Y3QgcmlpY19kZXYgew0KPiA+ID4gICAgICAgdm9pZCBfX2lvbWVtICpiYXNl
Ow0KPiA+ID4gICAgICAgdTggKmJ1ZjsNCj4gPiA+IEBAIC05NCw2ICs4OSw3IEBAIHN0cnVjdCBy
aWljX2RldiB7DQo+ID4gPiAgICAgICBpbnQgYnl0ZXNfbGVmdDsNCj4gPiA+ICAgICAgIGludCBl
cnI7DQo+ID4gPiAgICAgICBpbnQgaXNfbGFzdDsNCj4gPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBy
aWljX29mX2RhdGEgKmluZm87DQo+ID4gPiAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiBtc2dfZG9u
ZTsNCj4gPiA+ICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciBhZGFwdGVyOw0KPiA+ID4gICAgICAg
c3RydWN0IGNsayAqY2xrOw0KPiA+ID4gQEAgLTEwNSwxNCArMTAxLDI4IEBAIHN0cnVjdCByaWlj
X2lycV9kZXNjIHsNCj4gPiA+ICAgICAgIGNoYXIgKm5hbWU7DQo+ID4gPiAgfTsNCj4gPiA+DQo+
ID4gPiArZW51bSByaWljX3JlZ19saXN0IHsNCj4gPiA+ICsgICAgIFJJSUNfSUNDUjEgPSAwLA0K
PiA+ID4gKyAgICAgUklJQ19JQ0NSMiwNCj4gPiA+ICsgICAgIFJJSUNfSUNNUjEsDQo+ID4gPiAr
ICAgICBSSUlDX0lDTVIzLA0KPiA+ID4gKyAgICAgUklJQ19JQ1NFUiwNCj4gPiA+ICsgICAgIFJJ
SUNfSUNJRVIsDQo+ID4gPiArICAgICBSSUlDX0lDU1IyLA0KPiA+ID4gKyAgICAgUklJQ19JQ0JS
TCwNCj4gPiA+ICsgICAgIFJJSUNfSUNCUkgsDQo+ID4gPiArICAgICBSSUlDX0lDRFJULA0KPiA+
ID4gKyAgICAgUklJQ19JQ0RSUiwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gIHN0YXRpYyBp
bmxpbmUgdm9pZCByaWljX3dyaXRlYl9yZWcodTggdmFsLCBzdHJ1Y3QgcmlpY19kZXYgKnJpaWMs
IHU4IG9mZnNldCkgIHsNCj4gPiA+IC0gICAgIHdyaXRlYih2YWwsIHJpaWMtPmJhc2UgKyBvZmZz
ZXQpOw0KPiA+ID4gKyAgICAgd3JpdGViKHZhbCwgcmlpYy0+YmFzZSArIHJpaWMtPmluZm8tPnJl
Z3Nbb2Zmc2V0XSk7DQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgaW5saW5lIHU4IHJp
aWNfcmVhZGJfcmVnKHN0cnVjdCByaWljX2RldiAqcmlpYywgdTggb2Zmc2V0KSAgew0KPiA+ID4g
LSAgICAgcmV0dXJuIHJlYWRiKHJpaWMtPmJhc2UgKyBvZmZzZXQpOw0KPiA+ID4gKyAgICAgcmV0
dXJuIHJlYWRiKHJpaWMtPmJhc2UgKyByaWljLT5pbmZvLT5yZWdzW29mZnNldF0pOw0KPiA+ID4g
IH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIHJpaWNfY2xlYXJfc2V0X2JpdChz
dHJ1Y3QgcmlpY19kZXYgKnJpaWMsIHU4DQo+ID4gPiBjbGVhciwgdTggc2V0LCB1OCByZWcpIEBA
IC00NTMsNg0KPiA+ID4gKzQ2Myw4IEBAIHN0YXRpYyBpbnQgcmlpY19pMmNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ID4gICAg
ICAgfQ0KPiA+ID4NCj4gPiA+ICsgICAgIHJpaWMtPmluZm8gPSBvZl9kZXZpY2VfZ2V0X21hdGNo
X2RhdGEoJnBkZXYtPmRldik7DQo+ID4gPiArDQo+ID4gPiAgICAgICBhZGFwID0gJnJpaWMtPmFk
YXB0ZXI7DQo+ID4gPiAgICAgICBpMmNfc2V0X2FkYXBkYXRhKGFkYXAsIHJpaWMpOw0KPiA+ID4g
ICAgICAgc3Ryc2NweShhZGFwLT5uYW1lLCAiUmVuZXNhcyBSSUlDIGFkYXB0ZXIiLA0KPiA+ID4g
c2l6ZW9mKGFkYXAtPm5hbWUpKTsgQEAgLTQ5Nyw4ICs1MDksMjUgQEAgc3RhdGljIHZvaWQgcmlp
Y19pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAgICAgICBw
bV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7ICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgcmlpY19vZl9kYXRhIHJpaWNfcnpfYV9pbmZvID0gew0KPiA+ID4gKyAgICAg
LmZhbWlseSA9IFJJSUNfUlpfQV9UWVBFLA0KPiA+ID4gKyAgICAgLnJlZ3MgPSB7DQo+ID4gPiAr
ICAgICAgICAgICAgIFtSSUlDX0lDQ1IxXSA9IDB4MDAsDQo+ID4gPiArICAgICAgICAgICAgIFtS
SUlDX0lDQ1IyXSA9IDB4MDQsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lDTVIxXSA9IDB4
MDgsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lDTVIzXSA9IDB4MTAsDQo+ID4gPiArICAg
ICAgICAgICAgIFtSSUlDX0lDU0VSXSA9IDB4MTgsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlD
X0lDSUVSXSA9IDB4MWMsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lDU1IyXSA9IDB4MjQs
DQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lDQlJMXSA9IDB4MzQsDQo+ID4gPiArICAgICAg
ICAgICAgIFtSSUlDX0lDQlJIXSA9IDB4MzgsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lD
RFJUXSA9IDB4M2MsDQo+ID4gPiArICAgICAgICAgICAgIFtSSUlDX0lDRFJSXSA9IDB4NDAsDQo+
ID4gPiArICAgICB9LA0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgcmlpY19pMmNfZHRfaWRzW10gPSB7DQo+ID4gPiAtICAgICB7IC5j
b21wYXRpYmxlID0gInJlbmVzYXMscmlpYy1yeiIsIH0sDQo+ID4gPiArICAgICB7IC5jb21wYXRp
YmxlID0gInJlbmVzYXMscmlpYy1yeiIsIC5kYXRhID0gJnJpaWNfcnpfYV9pbmZvIH0sDQo+ID4g
PiAgICAgICB7IC8qIFNlbnRpbmVsICovIH0sDQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiAtLQ0K
PiA+ID4gMi4zNC4xDQo+ID4gPg0KPiA+DQoNCg==

