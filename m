Return-Path: <linux-i2c+bounces-4222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A05919127F6
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4DB91C25A8A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84E028DC1;
	Fri, 21 Jun 2024 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BEpxPjJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2083.outbound.protection.outlook.com [40.107.113.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56883214;
	Fri, 21 Jun 2024 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980659; cv=fail; b=NikrOKCklSA2KpvWVHbpBJPiKOzBmylmetcPi0MOmrkSVd3l9MZ0DzoZKZx4hUr175Y9+DprZrKZPjOReI3Pn71GG/BMKmGGu9U3Vvlr2Y0NpPDNtkCX9vYeFveZfx91cfrJNRs7Kgl57RYTYilfJS0bwpcvRvEbQbyfinDE0ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980659; c=relaxed/simple;
	bh=SGn2PotX2+L6sr7GRxhPoXAyIePEducyV9DEsI34NIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dNGZ5qrqVOxEiF9IvZuFc3JnpJk2VlTT8XP+fIIN6OoDmKe8MoqW350hSOiKl6p29OzFiii92JMUyq3ikGBgjUp0hpC/bqmW1nwrw8PAWjCipHgdUu/6Hvf4C4uRUPQaLkTi8fcZK1w7WSOjUkBBxocLHAIhqhkdrFkeyD95scc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BEpxPjJL; arc=fail smtp.client-ip=40.107.113.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu3vZJ6r6VN/WpDz3/k5xTx3UE3cv8ZTdKag4m0QomH7tpFyvLVfLD97KfZ55Ss0g8YYof0WbU9Hib+TBflV7tpBPygwDakKUpeUOq1SKh3Harp8U89jTDI7GKmMHiITV1uClw41SSbJeuUCsu3+8f/zJQbTCmom0wJ+Sl+IygKoqkjNkwp03/4NO/ayZOO46lVo0cwbSXAwJHnb+WBsP0JN5uWnO/44rf3O4ZozrlvgAwE6t8JfyPndiKGez9bmaXrTPMsdKlpReH+aGnOmW/19quEGk2FJIgOOl/U3C7KII5bnxwlIk2slrCb+C8xGEw9O3sOI9Ru6KlM+GjlskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGn2PotX2+L6sr7GRxhPoXAyIePEducyV9DEsI34NIQ=;
 b=JY5KcAd/GGkOu3Z2BrPs4PWdWQvhXdpEvDy8LDfb1xRx5K8KnS+pYTRI3/kd/uwtHqqI1FatJU19bz61LhyYdoSoHJVAhY//REen3R7qVdqjBW+lAe2Zme6VchMwFMU9IYJ44tsP9dctfJtoLbM6dIeLydfRGj3q+Mv8HBv+KtAdiabHfhTwv9xRlQedhkF3YbnnWjyPntkmRsF7MMtLsL9cIvFXX9+3sD5pJ/1lSxypvxCxu9A3ndccqHmTly4EqQPjnGJV132C+X9aBu4DB8EgDMRnCbsu0EGgtLOeKyH1v9/aF46zwT8qnG0JRFmbW9w236UsvhEYs1bWMMwJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGn2PotX2+L6sr7GRxhPoXAyIePEducyV9DEsI34NIQ=;
 b=BEpxPjJLhA3EHt1Udrms7dYAVRLYuAMEQGGNx9x501zOmY9Ka7zr6n8DXPppzotlX0YaUQ4RjGexwlObbjlv+uInmBLZGz64J6RPYBJllj20DuM3Dut5b2x02Xikp+D33mOybo9uozP9PLZ4wT2Y93BoKuQmIUSJLcLgHVuBkdI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6761.jpnprd01.prod.outlook.com (2603:1096:400:cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Fri, 21 Jun
 2024 14:37:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 14:37:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Topic: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Index:
 AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwIAAAxiAgAAAHECAAAZ8gIAACYPggAAHhoCAAAGPAA==
Date: Fri, 21 Jun 2024 14:37:32 +0000
Message-ID:
 <TY3PR01MB113462C6C427DD4581086430D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
In-Reply-To: <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6761:EE_
x-ms-office365-filtering-correlation-id: 2e414e05-ac7e-444f-13b0-08dc91ffaf53
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|376011|7416011|1800799021|38070700015|921017;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEJFK3ZUUHRvU1lJallUTDhQb2NVUmtTbGt3MmRKM3YrSjl0VU9qWllDNUI0?=
 =?utf-8?B?TmZ2UmdWbDgrUmNNS0ZqMVBKaWtGS0p3aTExTVVHZXdoUDRQYUp6YkVQcmpU?=
 =?utf-8?B?U3BTRW1lN2pPaGI1MmNsLzlWeHNWQlE5SFN2T05TNW8xOC9XSGZZZ2F5enhE?=
 =?utf-8?B?SUtBaGtKS2dSZkdIaGxxZ0k5eVgwQUVrWi9UamNnckJrVTBpSkk1bTRYZ1VQ?=
 =?utf-8?B?R3d6NGswL2g4Zy9VS3c3VC9UTEJOWkFxYWFrcC94c21EV2xHV1hsUzl5QnRK?=
 =?utf-8?B?cXEzTVNDR2Z4N20wckVuUXcycGpQbmQ0VkpyVDBWVlFmMitnNGJEdEJwbUFX?=
 =?utf-8?B?K1I1bDJFNXc0SWVsYTlaOXhRYVBpc1Fud2x5c1pRSkRVa1VVYTRBSXJucVhP?=
 =?utf-8?B?Z1g4Umg3OHNqWDNIWW9CLzA0SFlSMVlKbmthMTNlNXhHOFdITkZDNThUdjNR?=
 =?utf-8?B?amZ4Vk5TWkZ3Y2tNdHhCZVJpeEFTRHJ3R1I1K2xBeXZuRHFib1FZNGZhNkZh?=
 =?utf-8?B?WlluN1J5MS9ja00zVzN1bEhwbk40djBUelV0bGpyRklQTk1JY3lBcEg1dnRq?=
 =?utf-8?B?ZlloWDlkZG1pWU4zNmRHYWJ2ZDkyZXBtZUJEUVk3VFQ3cXFuSWpxYU5yanZ2?=
 =?utf-8?B?c3kwMWdabTlsWkZodUJjOGRiV245ZWdudXlFVGlPS2tsU1ozbll2ZjU5N3hN?=
 =?utf-8?B?MWUweTNRQjZpUVBMMG85YzUwQWFzOVFvekdORlRkRk9abW1oN2lsdlVjUWNW?=
 =?utf-8?B?SFoxSi93aUc4NVRSeTE3QTlpSDBLOCtPZ3ZqbXdlWHRsZXRLZ3JRZzVCS0Fi?=
 =?utf-8?B?Um1UTnI1Y2dpTlRpOHowTndRSmx2akFYLzVMRlpHWGdzbFV1Mm9ZVHYzb2dE?=
 =?utf-8?B?UDVnYVZuQW5la1lyK1RTWUJveXdNSTVFQXhOU01HRjNFWm1aQXNPZUJoZGtF?=
 =?utf-8?B?cFFTLzYrcFF4K0tFMUx1aUh4dUZZWkdsbUw5NldnWW5wNjk3Q0FPSkZNY293?=
 =?utf-8?B?WCszQzN5Z0haemxIL0lKSDFFQ3h4REhKY2kwdWxWNGhxNmpVV29oUGpzWmZi?=
 =?utf-8?B?dG5jRWtHNzV5dkNCMHk2ditsaitnSTdMWmtVMXlBQ1BIbGdkV204YnlmQWNZ?=
 =?utf-8?B?RWxWTHFtWERaOXRGQUJ6bFRCU2plTEZYRFpOVWNES0h6VU04Q3F6UFlFTElP?=
 =?utf-8?B?V25ORGtsVmpHMWIvcEJ5NTE0NFUycndzcTV4bWE3UmxaUXpNWDhtWkRIN0lI?=
 =?utf-8?B?amJJR21tR29Mb251bE00ZjdVZkpwMHlUd01mUGt4OWVNaWVGYWxlWWZSaXc0?=
 =?utf-8?B?NnU4dW14NjdheVdwWlhSaUZCZGQ3dEI2Q013NSsrbUpRRkw3UnRFdURoWkRo?=
 =?utf-8?B?OHUwYi9vYW9CZ0g5VExld1hod0VaTlNIeTlGWGQyVEptNEhseXorTExwRUNQ?=
 =?utf-8?B?VEZ6M0d0OURsOVJ0a1I3MUc1Q0djcnFUZzRSRlNnUk0wY2NEMm5BUVhBMHU5?=
 =?utf-8?B?djM5aFpiek1lSjRNMmU3S0FlRHJYbUIxdFVFbDdYeTh6THh5dWdXNDBpaVpp?=
 =?utf-8?B?eVBxcUV5Sm5VL3NNZGd3MlRzdFJZNG90SnZXRXd1bzJXVEJpL3lXMmQvMmVt?=
 =?utf-8?B?UFJmMkh4aEc5U3FvYkVDNFYrZEJpMjQrL3JaRU43eDJxazUrSmhkQmh5ZFp1?=
 =?utf-8?B?eXJGUmtYVmh3NmM5dUxkVlRUVGE2cWtVTFlFbStVN1o5V1RvWjdnREZwWmhX?=
 =?utf-8?B?d2xyRUd3cEhYUzY3Zm1JajZCSVJOSXJ2czFXaWVLNk9pUzgwNDNaYndTMVRh?=
 =?utf-8?B?cGpEMXNkK3dZcG1DSXpSOStqT2NrbE1DbUpoY25yekMrTHRNNHUvSy9zdENQ?=
 =?utf-8?Q?HG0OlCNhlHo12?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWRXZVRNOUFVaTF2M0JObURYR2hUZzdkSDZlYWhieklwUVdXWUQwY3Y5OWVh?=
 =?utf-8?B?NENqeEgzeWtwWTBKTE9LVGdQbExRRXUxVytUSHVzQmxDSXd2OEwyQUE3dzhF?=
 =?utf-8?B?cklYSTJmZEx0MXhSMlhneC9Fa09rdm9jWVpOUktRSDdSSW1TSm1Yb0loVGxX?=
 =?utf-8?B?NTR4Skgyc2w2K2t1TXZ0dmZvaGUyNFd6ZXdDalhwam5RK1NrbDFGMFRTMnBa?=
 =?utf-8?B?VlFHUWlVdkFLL3dlRE5rRDliN2FSMUpNSUZtMm5QYld0ZCtORHg0cnU1eWtl?=
 =?utf-8?B?bGYzZzlTZzNPSEtMTFVBa2ZYMTJFNW4rTUhQaVFjOERRMnRoZE1PblZFQWNW?=
 =?utf-8?B?cVZUMldjMGFwQk4rYjRRZSttanloanNGenJzbTkwYW0vVHVZY2dEZXZNQWMx?=
 =?utf-8?B?MWwyZ08raUZaZ1h5RGNuclh3a2hpbEpVQUdOV3FQd2lvc3kyM3JyandMYWlW?=
 =?utf-8?B?Z05xYVV5eXpKR2RTaHR6OEU2a3VvbFdnZGFmODBVakI2Yk9meGM1cVcyNlN6?=
 =?utf-8?B?cENBOUhGMEhTWFU3RVY2ZGwwNWlJZ2VhZjErTEdYTjNFRzhxZE5vektncEF4?=
 =?utf-8?B?cUhGQkE0MTY4aWZpS2liTlhoVDUyN2twb1Z0QTZnZXNBSEZVWmtKbVZZdFN2?=
 =?utf-8?B?eGJNRW9McVhvMm5tNG9WcnVYQTJ3STdRcXNObWM3enoxa0szWjFYbnloTUow?=
 =?utf-8?B?NmtWMnl1anQxU1BxdzNLajdRNEtVR3FWWlhDbDlzRjNIbGN4MFA2S1JxdWx3?=
 =?utf-8?B?U1RLaE1tblVlTVg3RW5xb0l5MkVHM2poNWp3eVlTUy9ibmVDVkFEQUtHNmpm?=
 =?utf-8?B?eFNacENsaEFFTzY3WTFDang0YmE3YTBZZUUzTy82RVYzRms0TEVoOFM2NXYr?=
 =?utf-8?B?QWtIdldIS2tYa05VZTNCc0NZeFlDUTVQY0ZYK1RwN1pXbGFyMUdUME5DM3I2?=
 =?utf-8?B?SHpBTGtybUdOS0NHNTRleWhPOUM0QmxaMWFBZ0ZmMGIvUkZIT3JPRXdmRVJP?=
 =?utf-8?B?TlBFcjYwTWVUS3l2N1lSM1UvQThiSFNOT1dwSGJlSFBoQldBakVSOGRvTWZG?=
 =?utf-8?B?cHRJVTVXcnExR1Y4Zk9XNzI4bUhORTgzSEI2aFR5U3J2b0RlaGQzMEt3RVM0?=
 =?utf-8?B?WVdiQmhIVTlrdFBHTjNUcTVHSHVXS05SemhzYWZiNjBkdkp1WC9aY0cyaG1t?=
 =?utf-8?B?dDUxc0Y5cWFSZmg5Y2EwRVhqcVp6Q3BXa2h1UkZ1SmV4M0w5KzcyaTAwT3N1?=
 =?utf-8?B?N1RuTklVZno0dTZZS0xjMHcwL2tCZ0hQTW41UEdUQU9BMVZvSTM1eS9GaUR6?=
 =?utf-8?B?d0JqaW1sdFljb2JLSVpKTVdDVTZQSzU0Y3dOLzcwRDU1L0QrdmdFWTZydXZi?=
 =?utf-8?B?MFB3RUVBSTBsT25aNFRBbGFoOEZkRzI0UkhMZncxb21YTGtrV1dRbm5FMS8x?=
 =?utf-8?B?Y3c0Wk9BbWhLOExocklMcTF0RkU2NEdwbHEyWEYwbXU3MTh0S2Y0cGZRNHBS?=
 =?utf-8?B?SW1kSmtrN1puZnNWWXArd01vMHZBL0xvR2N3UWNVd2d3dWpGcTIzd3R1SE1G?=
 =?utf-8?B?bk9HY2N2U2RDQVlYN0R6bjJBOUxESVVybXgvblVPNTZaWkJpUWk4ckt2bDg1?=
 =?utf-8?B?cVJSTUFnZEQ0SVR6R0VLb0dxaThNNFBmSnJFQ1lpYVVJLzJ0UlZnemVZK2NK?=
 =?utf-8?B?cmNUNkNOZU1ER0R4TEZNRGlqOEI1clBnZ0hzajNOVTdtQjh0VnAvbHoycE04?=
 =?utf-8?B?OTFna2VXMlpNdjZHN0d1NXFSQmlzbWlWa1RGUy9NQTVKUVUxTFJSUGtEeFJT?=
 =?utf-8?B?RW5UdFVLQmlib3p1YittTi92THl4bTBPb3QzbHI1elVqNlNqbGVnZFVXSVl4?=
 =?utf-8?B?WVdpN2hYa1F4QkJ3Y2JtMEszczFHWHRCdkdEV3FQcXIxZFJXTWI4V0pyK1Rx?=
 =?utf-8?B?cmZ0SFpMK1lYSWlXa2ZER0tDWERQaE40azNtSS9pS2JIQjZBeExOTktOS0I1?=
 =?utf-8?B?NjY0SkpXbHdpbm1PQzBzaGdEbVgrMXd3UlR6a1JtNnBNeHJyMGRDRCtNOVFr?=
 =?utf-8?B?ODR3c3NSZFhwdEFQN3RYbGdHbk5kVXduaEVMTUFYbmVtd3V5KzkwbVVKZEFM?=
 =?utf-8?B?emZGelNpbkVXUk55dFFrY25kZTk2WlZUMTZIUHNzTlY3L1djemVwM1JWT0tJ?=
 =?utf-8?B?UHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e414e05-ac7e-444f-13b0-08dc91ffaf53
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 14:37:32.3660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZfDYVpyCUi3EV+ZXSLt2Bsb7TMAUU9okLGZJhtAbNpDO+e+xxYmtBMDDF5y3by+WwOB927U9j08pMs9ALx0ErQg/aMczSMQGGY+OvJZSrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6761

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2xhdWRpdSBiZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0
IDM6MzEgUE0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IENo
cmlzIEJyYW5kdCA8Q2hyaXMuQnJhbmR0QHJlbmVzYXMuY29tPjsNCj4gYW5kaS5zaHl0aUBrZXJu
ZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2Vy
bmVsLm9yZzsNCj4gZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7IG1hZ251cy5kYW1tQGdtYWlsLmNv
bTsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7DQo+IHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU7IHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tDQo+IENjOiBs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBDbGF1ZGl1IEJlem5lYQ0KPiA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgv
MTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzogRG9jdW1lbnQgdGhlIFI5QTA4RzA0
NSBzdXBwb3J0DQo+IA0KPiANCj4gDQo+IE9uIDIxLjA2LjIwMjQgMTc6MDYsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4N
Cj4gPj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0IDI6MzAgUE0NCj4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwOC8xMl0gZHQtYmluZGluZ3M6IGkyYzogcmVuZXNhcyxyaWljOiBEb2N1bWVu
dA0KPiA+PiB0aGUgUjlBMDhHMDQ1IHN1cHBvcnQNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24g
MjEuMDYuMjAyNCAxNjoxMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxj
bGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAy
MDI0IDI6MDYgUE0NCj4gPj4+ICBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5kaW5n
czogaTJjOiByZW5lc2FzLHJpaWM6IERvY3VtZW50DQo+ID4+PiB0aGUgUjlBMDhHMDQ1IHN1cHBv
cnQNCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBPbiAyMS4wNi4yMDI0IDE1OjU2LCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+Pj4NCj4gPj4+Pj4gSGkgY2xhdWRpdSwNCj4gPj4+Pj4NCj4g
Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBjbGF1ZGl1
IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+Pj4+Pj4gU2VudDogRnJpZGF5
LCBKdW5lIDIxLCAyMDI0IDE6NTUgUE0NCj4gPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgv
MTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzoNCj4gPj4+Pj4+IERvY3VtZW50IHRo
ZSBSOUEwOEcwNDUgc3VwcG9ydA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gT24gMjEuMDYuMjAyNCAxNTozNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4+Pj4gSGkgQ2xh
dWRpdSwNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+Pj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+
Pj4+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyMSwgMjAyNCAxMjoyMyBQTQ0KPiA+Pj4+Pj4+PiBT
dWJqZWN0OiBbUEFUQ0ggMDgvMTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzogRG9j
dW1lbnQNCj4gPj4+Pj4+Pj4gdGhlDQo+ID4+Pj4+Pj4+IFI5QTA4RzA0NSBzdXBwb3J0DQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gRG9jdW1lbnQgdGhlIFJl
bmVzYXMgUlovRzNTIChSOUEwOEcwNDUpIFJJSUMgSVAuIFRoaXMgaXMNCj4gPj4+Pj4+Pj4gY29t
cGF0aWJsZSB3aXRoIHRoZSB2ZXJzaW9uIGF2YWlsYWJsZSBvbiBSZW5lc2FzIFJaL1YySA0KPiA+
Pj4+Pj4+PiAoUjlBMDlHMDc1KS4gTW9zdCBvZiB0aGUgSVAgdmFyaWFudHMgdGhhdCB0aGUgUklJ
QyBkcml2ZXIgaXMNCj4gPj4+Pj4+Pj4gd29ya2luZyB3aXRoIHN1cHBvcnRzIGZhc3QgbW9kZQ0K
PiA+PiBwbHVzLg0KPiA+Pj4+Pj4+PiBIb3dldmVyLCBpdCBoYXBwZW5zIHRoYXQgb24gdGhlIHNh
bWUgU29DIHRvIGhhdmUgSVANCj4gPj4+Pj4+Pj4gaW5zdGF0aWF0aW9ucyB0aGF0IHN1cHBvcnQg
ZmFzdCBtb2RlIHBsdXMgYXMgd2VsbCBhcyBJUA0KPiA+Pj4+Pj4+PiBpbnN0YW50aWF0aW9uIHRo
YXQgZG9lc24ndCBzdXBwb3J0IGl0LiBGb3IgdGhpcywgaW50cm9kdWNlZCB0aGUgcmVuZXNhcyxy
aWljLW5vLWZhc3QtDQo+IG1vZGUtcGx1cyBwcm9wZXJ0eS4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWENCj4gPj4+Pj4+Pj4gPGNsYXVkaXUuYmV6
bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWljLnlhbWwgfCA4DQo+
ID4+Pj4+Pj4+ICsrKysrKysrDQo+ID4+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IGRpZmYgLS1naXQNCj4gPj4+Pj4+Pj4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1sDQo+
ID4+Pj4+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2Fz
LHJpaWMueWFtbA0KPiA+Pj4+Pj4+PiBpbmRleCA5MWVjZjE3YjdhODEuLmMwOTY0ZWRiY2E2OSAx
MDA2NDQNCj4gPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1sDQo+ID4+Pj4+Pj4+IEBAIC0y
NSw2ICsyNSwxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAtIHJl
bmVzYXMscmlpYy1yOWEwN2cwNTQgICMgUlovVjJMDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgLSBj
b25zdDogcmVuZXNhcyxyaWljLXJ6ICAgICAgIyBSWi9BIG9yIFJaL0cyTA0KPiA+Pj4+Pj4+Pg0K
PiA+Pj4+Pj4+PiArICAgICAgLSBpdGVtczoNCj4gPj4+Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0
OiByZW5lc2FzLHJpaWMtcjlhMDhnMDQ1ICAgIyBSWi9HM1MNCj4gPj4+Pj4+Pj4gKyAgICAgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHJpaWMtcjlhMDlnMDU3DQo+ID4+Pj4+Pj4+ICsNCj4gPj4+Pj4+
Pj4gICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOWcwNTcgICAjIFJaL1YySChQKQ0K
PiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiAgICByZWc6DQo+ID4+Pj4+Pj4+IEBAIC02Niw2ICs3MCwx
MCBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4+PiAgICByZXNldHM6DQo+ID4+Pj4+Pj4+ICAgICAg
bWF4SXRlbXM6IDENCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gKyAgcmVuZXNhcyxyaWljLW5vLWZh
c3QtbW9kZS1wbHVzOg0KPiA+Pj4+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiBzcGVjaWZpZXMgaWYg
ZmFzdCBtb2RlIHBsdXMgaXMgbm90IHN1cHBvcnRlZA0KPiA+Pj4+Pj4+PiArICAgIHR5cGU6IEJv
b2xlYW4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IENhbid0IHRoaXMgaW5mbywgYXMgcGFydCBvZiBk
ZXZpY2UgZGF0YT8/IEJhc2VkIG9uIGZyZXF1ZW5jeSBhbmQNCj4gPj4+Pj4+PiBkZXZpY2UgZGF0
YSBpcyBlbm91Z2ggdG8gZGVyaXZlIHRoaXMgaW5mbz8/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gV2Ug
Y2FuJ3QgcmVseSBjb21wbGV0ZWx5IG9uIGRldmljZSBkYXRhIGJlY2F1c2Ugb24gUlovRzNTIHdl
IGhhdmUNCj4gPj4+Pj4+IDIgUklJQyBjaGFubmVscyB0aGF0IHN1cHBvcnQgZmFzdCBtb2RlIHBs
dXMgYW5kIDIgdGhhdCBkb2Vzbid0IHN1cHBvcnQgaXQuDQo+ID4+Pj4+DQo+ID4+Pj4+IENhbid0
IGFycmF5IG9mIGJpdHMgZm9yIHRoaXMgY2hhbm5lbHMgd29uJ3QgaGVscD8/DQo+ID4+Pj4NCj4g
Pj4+PiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZT8gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCBo
b3cgeW91IHdvdWxkDQo+ID4+Pj4gcHJlZmVyIG1lIHRvIHVzZSB0aGUgYXJyYXkgb2YgYml0cy4N
Cj4gPj4+DQo+ID4+PiBzdHJ1Y3QgcmlpY19vZl9kYXRhIHsNCj4gPj4+IAl1OCByZWdzW1JJSUNf
UkVHX0VORF07DQo+ID4+PiAJdTE2IGZhc3RfbW9kZV9pbmZvIGluZm87IC8qIDEgbWVhbnMgZmFz
dCBtb2RlIHBsdXMgc3VwcG9ydGVkLA0KPiA+Pj4gc3RhcnRpbmcgd2l0aCBjaGFubmVsIDAqLyB9
Ow0KPiA+Pj4NCj4gPj4+IC5pbmZvID0gMHgzLCBtZWFucyBjaGFubmVsIDAgYW5kIDEgaGFzIGZh
c3QgbW9kZSBwbHVzIHN1cHBvcnRlZA0KPiA+Pj4gLmluZm8gPSAweDAsIG5vbmUgb2YgdGhlIGNo
YW5uZWwgc3VwcG9ydGVkIGZhc3QgbW9kZSBwbHVzLg0KPiA+Pg0KPiA+PiBJZiBJIHVuZGVyc3Rh
bmQgdGhlIHByb3Bvc2FsIGNvcnJlY3RseSwgYSBtYXRjaCBiL3cgc3RydWN0DQo+ID4+IHJpaWNf
b2ZfZGF0YTo6aW5mbyBiaXQgKyBmcmVxdWVuY3kgYW5kIHRoZSBub2RlcyBpbiBkZXZpY2UgdHJl
ZSBpcw0KPiA+PiBzdGlsbCBuZWVkZWQsIHJpZ2h0PyBBcyB0aGUgUlovRzNTIFJJSUMgY2hhbm5l
bHMgYXJlIHVzaW5nIHRoZSBzYW1lIGNvbXBhdGlibGUuDQo+ID4+IFcvbyBhIG1hdGNoIGhvdyBJ
IGNhbm5vdCBkZXRlY3QgaW4gdGhlIGRyaXZlciB3aG8gaXMsIGUuZy4sIGNoYW5uZWwgMQ0KPiA+
PiB0aGF0IHN1cHBvcnRzIEZNUCB3L28gaGFyZGNvZGluZyBzb21lIFJJSUMgY2hhbm5lbCBkYXRh
IGluIHRoZSBkcml2ZXIgKGUuZy4gUklJQyBjaGFubmVsDQo+IGFkZHJlc3MpPw0KPiA+DQo+ID4g
Yml0IGFycmF5IGdpdmVzIHRoZSBjYXBhYmlsaXR5IGluZm8gb24gdmFyaW91cyBjaGFubmVscy4N
Cj4gPg0KPiA+IElmIHNvbWVvbmUgZGVmaW5lIGZhc3RfbW9kZV9wbHVzIGZyZXF1ZW5jeSBpbiBE
VCBub2RlIGFuZCBjaGFubmVsIGlzDQo+ID4gbm90IGZhc3RfbW9kZV9wbHVzKGZyb20gdGhlIGNh
cGFiaWxpdHkgaW5mbykgdGhlbiB5b3Ugc2hvdWxkIHJldHVybiBlcnJvci4NCj4gPg0KPiA+IEhl
cmUgeW91IG5lZWQgdG8gdXNlIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIGFzIGVhY2ggU29DIGhh
cyBkaWZmZXJlbnQgY2FwYWJpbGl0aWVzLg0KPiANCj4gQW5kIEkgd291bGQgYWRkLCBhcyBpdCBp
cyBpbiB0aGlzIGNhc2U6IHRoZXJlIGFyZSBtdWx0aXBsZSBpbnN0YW50aWF0aW9uIG9mIHRoZSBS
SUlDIGluIFJaL0czUyBTb0MuDQo+IFJJSUMgMCBhbmQgMSBzdXBwb3J0cyBGTVAsIFJJSUMgMiBh
bmQgMyBkb2VzIG5vdC4NCj4gDQo+IEZvciBhbGwgUklJQ3MgKDAsIDEsIDIsIDMpIHdlIHVzZSB0
aGUgc2FtZSBjb21wYXRpYmxlIChhcyBhbGwgYXJlIHBhcnQgb2YgdGhlIHNhbWUgU29DKS4gSG93
IHRvIGRvDQo+IHRoZSBtYXRjaCBiL3cgRFQgUklJQyBjaGFubmVsIGFuZCBkcml2ZXIgd2l0aCB0
aGUgc29sdXRpb24geW91IHByb3Bvc2Ugdy9vIGhhcmRjb2Rpbmcgc29tZSBSSUlDDQo+IGNoYW5u
ZWwgZGF0YSBpbiB0aGUgZHJpdmVyPw0KDQouaW5mbyA9MHgzLCBzbyB5b3Uga25vdyBmcm9tIHRo
ZSBjYXBhYmlsaXR5LCBmb3IgdGhpcyBzb2MsIGJ1cyAwIGFuZCAxIHN1cHBvcnRzIEZNUC4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQoNCj4gDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQmlqdQ0KPiA+DQo+
ID4NCj4gPj4NCj4gPj4gQWxzbywgZm9yIGZ1dHVyZSBTb0NzIHRoYXQgd2lsbCBzdWZmZXIgdGhl
IHNhbWUgc3ltcHRvbSBidXQgZm9yDQo+ID4+IGRpZmZlcmVudCBjaGFubmVscyAoYW5kIGNoYW5u
ZWxzIHdpdGggZGlmZmVyZW50IGFkZHJlc3NlcykgdGhlIGRyaXZlcg0KPiA+PiB3aWxsIGhhdmUg
dG8gYmUgYWRhcHRlZCB0byBtYXRjaCBiL3cgdGhlIGNoYW5uZWwgYml0IGluIHN0cnVjdCByaWlj
X29mX2RhdGE6OmluZm8gYW5kIGNoYW5uZWwNCj4gbm9kZSBmcm9tIERULg0KPiA+Pg0KPiA+Pj4N
Cj4gPj4+IENoZWVycywNCj4gPj4+IEJpanUNCg==

