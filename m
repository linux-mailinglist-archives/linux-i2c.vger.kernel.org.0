Return-Path: <linux-i2c+bounces-4218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B268912744
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D6242812C0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A0E134BC;
	Fri, 21 Jun 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dUwahgtq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2078.outbound.protection.outlook.com [40.107.113.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE5DF62;
	Fri, 21 Jun 2024 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978820; cv=fail; b=sYlx5Rb6xJnYamDs9Tp2Vr3lSYjr5hLYw1jWKeGqhuZAQlwHFYpb5VdaU2lbBM9VQpRzdhXcgWZIGbv6geDmvVquU0C8Lw5x2bb9ezTQqzz+DOQlKEt2/S3JhhRk6Am8aeW93KwUtOFOmgSJZ9QGzFHrTHbqvu+g5j3f69+T/I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978820; c=relaxed/simple;
	bh=7ckmIabutXbJvWXQXrgGJyO2rzJr/hmjQuOGLTHpmOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZEbpZ5bvkJiH161YicERKn7OVsYQ9suQ1hylh2qFH1RFnBv2oth+DKq2uRU9zsh/pcLpfRyge4oSvHFkSTQ9NQXDQH2yvXgg0sMEzOotHDxHd33nN5K6lUMOuehPTs1iVKliuJFmaUIbbcvvWFIUchIZY8pighBNngMuRgxgyUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dUwahgtq; arc=fail smtp.client-ip=40.107.113.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0PvT2HiwFzYcDhk+dkkmZ9TjReBM831brZ/1+wbKeTb5x89/BtIRiCpkwbv69cmc6sGYlJq/U16nqlNLMOYBOf/Qqn1NJx1VlgDL0Yos0vd79MgXPMmW4EJS1BKkLPxUw0G0a0a1E1g5tJNkwqm86jY9jweEFVs69y0JGWDbQJBIl/dW0oR+SRP8onZiSfexonBqJ6rbfs2OjLTHQMEL5gSc4uOlg8P1Qt7J6aqew69KR5qvvawwe9uL+ifTC5qkuFZUze9luSM/UVtuKLC/fwzNZcZzATzrYtO3yiN+7UxWTyFw0v33ZjYJ0P53iet53pJ+bhdH+rwrV0sklnCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ckmIabutXbJvWXQXrgGJyO2rzJr/hmjQuOGLTHpmOM=;
 b=QeP+FX1ik/mPL3PnETLv2+N8TrSLX70SeUeM85N1bjX3AVJNXL5sXk0bnnru9sVnfMP2LKPyFQTllA/vBsSEYS8Hb6evpJlPnoMhrgmv0od7c4Q821C1ehP5mej2LWNr3nypOFGcdPu23ruFPvlvlKt0zaJ1A0QaOzKwepVk6AtAYJfMH1bnPTiysrEKl2bdwIMrMHE2J8jQDT5oYYT8p9ZbmsyNJeIXKJqKUEypIELQjrfRsyYWx0ZGxQ8tEHLOxl73C/2ZwkmLw4ERo3U3pwfT+sySKdUBnWb9v4hBEN3s4oks4rcL17VaYDiuIagbDkQrBk+TTiwjtKmX4u2Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ckmIabutXbJvWXQXrgGJyO2rzJr/hmjQuOGLTHpmOM=;
 b=dUwahgtqLdfj3J+g7u3LIZhTD+HzjserAN3HjrtW6EYMQjNE8nUb6d/pjJAN0QRh5oIW5bbilhltEzBxDsCKDqemWfSquhJ9qQ7s2avgelLRrH8YY+hwp/QNYNFkaAq14qpc7RDKb1Lysc5SLcdwg3FTWwQ5GpmZn7Z7JBASz8Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6838.jpnprd01.prod.outlook.com (2603:1096:604:123::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 14:06:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 14:06:52 +0000
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
 AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwIAAAxiAgAAAHECAAAZ8gIAACYPg
Date: Fri, 21 Jun 2024 14:06:51 +0000
Message-ID:
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
In-Reply-To: <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6838:EE_
x-ms-office365-filtering-correlation-id: f538be1b-028b-4115-49b1-08dc91fb6659
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|366013|7416011|376011|38070700015|921017;
x-microsoft-antispam-message-info:
 =?utf-8?B?UDQ1NktrTG9wQmFnMVdlRU4wazVBenczRFQ0eDE4aWhtdlBWZ0NlMld6MkVS?=
 =?utf-8?B?Q01TUVR0b2dkSnVjUWtLUzRnWFc2dmh0VGlXZ0V5OEZGbUVxeCtZSFpabFJR?=
 =?utf-8?B?bGZhUzdBMzRDck81bjJUSjJQQURDOXR6NmpJSHBFa0t0c0g0aTJodjNqb01r?=
 =?utf-8?B?cFcvUVdqb1E5YTgzU09aaXlKU2NzbHhNa2tudEZScWpEejNGT3NETUdhWlJO?=
 =?utf-8?B?ekJXb2JFdkNjOUJKa3ZkZUVtZW5NZnR2MjdzZUluc0FWb0JQd1dIa0M0TDdH?=
 =?utf-8?B?VlpMQ0x5N2lROGx1RzJpTHlvSTFFemFuUGlLYlRvQmorMEJ1UmowRFRUc0pu?=
 =?utf-8?B?cnJqTmNxOU1DSmpleVh2MjRuWFMveUJ4SjQvU0Zwbk85blpMb2ZSdVQzeFB3?=
 =?utf-8?B?ZGt2N3BXWGFYQk5wb0tIS2wyMXE2UDdLbFdrMVdwK0RaL1BDRktiQUlGamFw?=
 =?utf-8?B?ZGpucUxCZUl1SUpBODRLWkpPQlZoM0FHODF2eU9XVjZsUldOd1pPZlpJdUV4?=
 =?utf-8?B?ZDhZTkNnd1pXT0dDZ3FDSXBnVHhJQWdoQVk4dDRhRGZITkxYOUdJb2FjcC9K?=
 =?utf-8?B?WEhwYW10MnFDNW1kNVd6OWsxZHhEU1FPUFJjemZENjNzYTJNUXFtK3dzLzJ4?=
 =?utf-8?B?RWJ4RlZURm1oMFQ3UG9zMXJtK2FRaHVaRitNQm1iZ3N6VW1QOUwyc2JJVHlz?=
 =?utf-8?B?cFVRRGRRQUFFMVV6UmYzWDVZRmVVRWFjL0FHQW50T09jemxIV1NmQVozTERI?=
 =?utf-8?B?OEtGZ2dwYkpSSDhtcDVyNUlKS3hxRVkyY3FzSWxBK0F2MGxYTDBlM2tLLzhI?=
 =?utf-8?B?M0tzMFVEV21YUkNtWElrSWNlMmpNa1FPVTRoSGQ3Y0R4T2VrVjZrdlNKc2dM?=
 =?utf-8?B?K0lYZjNIQWVUdHhnZHlLcWRISGgvTUg5TlAvR2RLZFF4OG1adkVwc0RaU2dU?=
 =?utf-8?B?bWkxamZnMFB2bERVSlg3ZFhIUjdDVDB3NDdqV2pqaTZrY3pRVDhjWGRvZ1F2?=
 =?utf-8?B?eVFYWENiUE9WS05pMWM1akJrdVppMkM0VmJNSlFNVWpNeURKalJIZFZLelJP?=
 =?utf-8?B?MXltbzlNOWNKaVZFUGdSVmdVL2RXa3hLeXFIUUJlTGNzWWNjeU1WMnJVVUlS?=
 =?utf-8?B?b0IrOVFRcWhhOVREVndnWjMwMmdHUTZsdWJDbVlPSUhyaEVYemp1MWpzdEl3?=
 =?utf-8?B?WUdxSVVDbXcvU2IxOEtucStYYXVqTWQxV0NOcEVoSGNBQkZsZkJFUVFSRDlN?=
 =?utf-8?B?dXZRNi9OV21uMVlPemNTZkhsU0hkZUxVK3R3VWU3UTJpS3UwMkxLRDJ3OEw0?=
 =?utf-8?B?YjE2L1hKK1BVcXdFTXNNc2gxWS9Demloa2UrNklaM1NNYzRLckh2UkdnTDVM?=
 =?utf-8?B?dTk3NG8wTTNxOGpnWk1aL2VxaE1od2Qxd1ExWE04Wi9zaHBKYVZhU01DRjBT?=
 =?utf-8?B?U0NTb254dXU2UXE4MmZGV2lkclJZQkYzVVREdzJVUVZCZEt3bDh3TmJ3UHla?=
 =?utf-8?B?VE9YRjVGTUU2aEVPelQ3UTRJRUhPdHJDSHpuaGtPQ3FHYm92MEJzZitsZXl3?=
 =?utf-8?B?YkV0OUlGWVZNRVcxV2xuSTRMSUEveFBDZ0c2NFk3R1dES0pSWUFxQmdKTzE2?=
 =?utf-8?B?T3dTQ0VMTVRBQTRORFZlWVE4Y3dTYUxhd3kwM2lPeGFGNVE2ZlNFa2NuKzln?=
 =?utf-8?B?NFZLUGZZeDFtZ1dMemRYYWVrTGZPZHdkWDhkUEJ5eFhoNCtoUnVjVHZvZzV5?=
 =?utf-8?B?MXk0L0JoVEFrSEl0TVdNN1dORnE4WFNHWTA5MmpiRE1WQ0VjODc1VnYvL2h2?=
 =?utf-8?B?cDZpa0UyUFRZcUlMb1Z3WlFJdGFqUlczMHJxRnM2SE9SK0lzWHZhMGpRRVNo?=
 =?utf-8?Q?+qgV+l92GgHc4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U210Mk9qWDRKODlyR1hlSFkxY0lnUDRRc08rTkx4VGZraTI2L3p3K2Vqbyts?=
 =?utf-8?B?bnVXZ0VyQXhDMVlOOW5GYnNLTlRkb05hVmdITEczUyt4bDlGemtsSjFuQmFi?=
 =?utf-8?B?WWZSOG1uOFcvM1hOMGhRY0laVGhJenJFYks2NFRVYzE0RDI2UWtJYVBSbmVM?=
 =?utf-8?B?RzczMkRvZWFrbDliYktVeG02L3M3cC9YNHU1WE1XV1RPNkttNmdIS2NJc3ph?=
 =?utf-8?B?cnVBTmJFV3BQWHI2QmcrQzh2djVLOU1SWFpUY1ZyWWhEVWpCRWtHOVA3SE9V?=
 =?utf-8?B?d1JtVXVWZmIvblRLMFRxSlgxNi84NXhkTGdhY09uYUN1cGd6dnMyWTJrNVVT?=
 =?utf-8?B?bFdLV3BTUzhQdUtuZjBLYWwrS3NhdnVBVUFPQkQ3MllBcHlSMDFqbFRBMGUx?=
 =?utf-8?B?bDB6NTFZOXdMN25Pa2NjTGJPWjQ4WERoSXU3SW1tREJWSDFqa01qWGg3citD?=
 =?utf-8?B?SFk1ZEZsd1ptb00zb1RFV0dNZWZ3ZjBDUDBtUE1hSlYxQUtJUXRDRVV2dTVQ?=
 =?utf-8?B?L0YwYXFhWUNBVEZNMHFMd3FJZEhlUHltaVA3NTU2NGtReWh2dXdWM0tPZ2k0?=
 =?utf-8?B?SlhwdGRJbEhubU5oNytiWmxYK2RUeFBlNDkyc3RWR2pUbnVrREZuN2tpUFZt?=
 =?utf-8?B?VU94YlJsOXlJZmEzeEVaZEpwYzFlTVVFTDNTNTVOdzF5V1RiRm5iYXhRaWc1?=
 =?utf-8?B?c09FQUIwRXB4WmFwT0dRdWJUei94UGRZa0IxNTNDTnJoS3ZMZi9UT2EwUU1Y?=
 =?utf-8?B?a2swUHJlVHNNSHlTcktxMWdHNWt1c3ptWlFaSjIvWngwVHJQRlhsOFB6Tzls?=
 =?utf-8?B?aG5YWnJyUGRNcXY2UmRFWUY2N1pkRWRqMzRrTUcyV21QTnZqc0pjZUxkdFRE?=
 =?utf-8?B?djZidlZXWjd2TnY2N01jTExGZGF4ZDhIS0ZDdFdwc0tRUGR0SHBveFUwTWJP?=
 =?utf-8?B?UDB6RGhtbnJKTHdVS0RhNERTUEpPTC8zS1VMRmNybVFoeWpvNDBrd2FaRHNJ?=
 =?utf-8?B?ZG1VbC9lWHl4bXIxK0Y3N29FYnNydGE3Nks0Vk9NSDc1aExCRk9BQ0JoVlRK?=
 =?utf-8?B?TFZ2NXZ3RjRZOXptSlRRbXhnWSs2bDI3c1RYUEszMTVLTnpva3lFQi83U1V5?=
 =?utf-8?B?bjB3cWYrZFpaNnZEdWhLYXJVTldMT2JVZ0xVVjBIZWlPT21NdDZZTUlkZmhw?=
 =?utf-8?B?dDJhc3UxdG9KVVVzZWFwU0ZEWGs5eUt1RjB5dU5WVmc0L0w2aURpbU1jdWhq?=
 =?utf-8?B?YmxUWmVaYkg4NzFmMjd0cnNlUm5CWFFjN1hEMTBSY3FJTjU3bDd1VUpxSEF5?=
 =?utf-8?B?UG81b3FTK0swV2FEU1hjVmZCT2xSdDJNUzYyaWxDZU5Ud3pBQSs4WUJQNlF2?=
 =?utf-8?B?Q2VWb0x6MVpjeWtBVVpseHRvbWh4Y1lyUkM1NGt4aExoazY2Q1cvSWZyU2x3?=
 =?utf-8?B?b0VTRGFEaEd0M1pNdHFhZDk2V0h1cVBsS1poQjBPcUxhYjlkNzhSdHFBRkRv?=
 =?utf-8?B?bWZwVk56Nk90UzlzZzNoWTZpREFuam9zRzhnTlR3OEUzRE9MdUJVK2M2M1F2?=
 =?utf-8?B?M1VUeWdCT2pFblM1czVuS2hPL3UyZ0lCeUEwS1JyNEtEdi9pMVBFN2pGZ3BQ?=
 =?utf-8?B?Y2l0akpQWmQyS0luMUJkRHhLdmplTGwrQ0M0TmNwSWdSOFdSV091eU9LMmMw?=
 =?utf-8?B?WUdzT29hU3k2NGxXZFdqL0h1dWVoZFMrVHRHR0JRS1NtL1VZaVdZZy9ScEZV?=
 =?utf-8?B?cVhmNjNyMEQ2cEpuMDlndzRyZGJGQ2NndmNIazBxdXpmVGc3RGNBZkFpNnp4?=
 =?utf-8?B?cm1jVVFjcHdIazUyd0N1YW9qY3JPRmFaWmJRSkRKeFZzYk5UMjRIbUpFZVVT?=
 =?utf-8?B?RlhVa0J2SjdURnFNbFdJcy91czUrRUJEcTc4NzBXbXUrOHBkVkpDUk5aSHVh?=
 =?utf-8?B?dFpoazRqM2lORGgrV0NvRW1wSVRQcGhMa2VjSFo1VXluK2hVdkJRR3JsOW1Q?=
 =?utf-8?B?MG8vQVZsamxiemwySHp4UzdwaDRRTkVXZ2M0SHBzSTZXeHlZclFXUE8rSkhy?=
 =?utf-8?B?WU9tbzVOd3FrbFNPVXBCVzZib0VuVGh2dlpKQ3hXZTl5UTIwbCs3OTA5Sy9K?=
 =?utf-8?B?dFpnTi94cVpISjFNMU94U29IMDUzQ1N5cHBROWN0TVBCNEN1aFpUSDNYTTND?=
 =?utf-8?B?cFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f538be1b-028b-4115-49b1-08dc91fb6659
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 14:06:51.9130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNr6T/IYnO7TZnnnDeAGZDT4UTQb50TiM0sD25LUCVUdaPIljZxf0kk0zltwP9lr6O46kXDqnN8UkdckxZVTP5kVHELUlvsLbVkWiZaAFSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6838

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjEsIDIwMjQgMjozMCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5k
aW5nczogaTJjOiByZW5lc2FzLHJpaWM6IERvY3VtZW50IHRoZSBSOUEwOEcwNDUgc3VwcG9ydA0K
PiANCj4gDQo+IA0KPiBPbiAyMS4wNi4yMDI0IDE2OjEwLCBCaWp1IERhcyB3cm90ZToNCj4gPg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGNsYXVkaXUg
YmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6IEZyaWRheSwgSnVu
ZSAyMSwgMjAyNCAyOjA2IFBNDQo+ID4gIFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMTJdIGR0LWJp
bmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzogRG9jdW1lbnQNCj4gPiB0aGUgUjlBMDhHMDQ1IHN1
cHBvcnQNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMjEuMDYuMjAyNCAxNTo1NiwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4gSGkgY2xhdWRpdSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyMSwgMjAyNCAx
OjU1IFBNDQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMl0gZHQtYmluZGluZ3M6IGky
YzogcmVuZXNhcyxyaWljOiBEb2N1bWVudA0KPiA+Pj4+IHRoZSBSOUEwOEcwNDUgc3VwcG9ydA0K
PiA+Pj4+DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IE9uIDIxLjA2LjIwMjQgMTU6MzQsIEJpanUg
RGFzIHdyb3RlOg0KPiA+Pj4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6
bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyMSwgMjAyNCAxMjoy
MyBQTQ0KPiA+Pj4+Pj4gU3ViamVjdDogW1BBVENIIDA4LzEyXSBkdC1iaW5kaW5nczogaTJjOiBy
ZW5lc2FzLHJpaWM6IERvY3VtZW50DQo+ID4+Pj4+PiB0aGUNCj4gPj4+Pj4+IFI5QTA4RzA0NSBz
dXBwb3J0DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUu
YmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IERvY3VtZW50IHRo
ZSBSZW5lc2FzIFJaL0czUyAoUjlBMDhHMDQ1KSBSSUlDIElQLiBUaGlzIGlzDQo+ID4+Pj4+PiBj
b21wYXRpYmxlIHdpdGggdGhlIHZlcnNpb24gYXZhaWxhYmxlIG9uIFJlbmVzYXMgUlovVjJIDQo+
ID4+Pj4+PiAoUjlBMDlHMDc1KS4gTW9zdCBvZiB0aGUgSVAgdmFyaWFudHMgdGhhdCB0aGUgUklJ
QyBkcml2ZXIgaXMgd29ya2luZyB3aXRoIHN1cHBvcnRzIGZhc3QgbW9kZQ0KPiBwbHVzLg0KPiA+
Pj4+Pj4gSG93ZXZlciwgaXQgaGFwcGVucyB0aGF0IG9uIHRoZSBzYW1lIFNvQyB0byBoYXZlIElQ
IGluc3RhdGlhdGlvbnMNCj4gPj4+Pj4+IHRoYXQgc3VwcG9ydCBmYXN0IG1vZGUgcGx1cyBhcyB3
ZWxsIGFzIElQIGluc3RhbnRpYXRpb24gdGhhdA0KPiA+Pj4+Pj4gZG9lc24ndCBzdXBwb3J0IGl0
LiBGb3IgdGhpcywgaW50cm9kdWNlZCB0aGUgcmVuZXNhcyxyaWljLW5vLWZhc3QtIG1vZGUtcGx1
cyBwcm9wZXJ0eS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJl
em5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+PiAtLS0NCj4g
Pj4+Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlp
Yy55YW1sIHwgOA0KPiA+Pj4+Pj4gKysrKysrKysNCj4gPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4+Pj4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1s
DQo+ID4+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNh
cyxyaWljLnlhbWwNCj4gPj4+Pj4+IGluZGV4IDkxZWNmMTdiN2E4MS4uYzA5NjRlZGJjYTY5IDEw
MDY0NA0KPiA+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4gQEAgLTI1LDYgKzI1
LDEwIEBAIHByb3BlcnRpZXM6DQo+ID4+Pj4+PiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscmlp
Yy1yOWEwN2cwNTQgICMgUlovVjJMDQo+ID4+Pj4+PiAgICAgICAgICAgIC0gY29uc3Q6IHJlbmVz
YXMscmlpYy1yeiAgICAgICMgUlovQSBvciBSWi9HMkwNCj4gPj4+Pj4+DQo+ID4+Pj4+PiArICAg
ICAgLSBpdGVtczoNCj4gPj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5
YTA4ZzA0NSAgICMgUlovRzNTDQo+ID4+Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMs
cmlpYy1yOWEwOWcwNTcNCj4gPj4+Pj4+ICsNCj4gPj4+Pj4+ICAgICAgICAtIGNvbnN0OiByZW5l
c2FzLHJpaWMtcjlhMDlnMDU3ICAgIyBSWi9WMkgoUCkNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgICBy
ZWc6DQo+ID4+Pj4+PiBAQCAtNjYsNiArNzAsMTAgQEAgcHJvcGVydGllczoNCj4gPj4+Pj4+ICAg
IHJlc2V0czoNCj4gPj4+Pj4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4+Pj4+DQo+ID4+Pj4+PiAr
ICByZW5lc2FzLHJpaWMtbm8tZmFzdC1tb2RlLXBsdXM6DQo+ID4+Pj4+PiArICAgIGRlc2NyaXB0
aW9uOiBzcGVjaWZpZXMgaWYgZmFzdCBtb2RlIHBsdXMgaXMgbm90IHN1cHBvcnRlZA0KPiA+Pj4+
Pj4gKyAgICB0eXBlOiBCb29sZWFuDQo+ID4+Pj4+DQo+ID4+Pj4+IENhbid0IHRoaXMgaW5mbywg
YXMgcGFydCBvZiBkZXZpY2UgZGF0YT8/IEJhc2VkIG9uIGZyZXF1ZW5jeSBhbmQNCj4gPj4+Pj4g
ZGV2aWNlIGRhdGEgaXMgZW5vdWdoIHRvIGRlcml2ZSB0aGlzIGluZm8/Pw0KPiA+Pj4+DQo+ID4+
Pj4gV2UgY2FuJ3QgcmVseSBjb21wbGV0ZWx5IG9uIGRldmljZSBkYXRhIGJlY2F1c2Ugb24gUlov
RzNTIHdlIGhhdmUgMg0KPiA+Pj4+IFJJSUMgY2hhbm5lbHMgdGhhdCBzdXBwb3J0IGZhc3QgbW9k
ZSBwbHVzIGFuZCAyIHRoYXQgZG9lc24ndCBzdXBwb3J0IGl0Lg0KPiA+Pj4NCj4gPj4+IENhbid0
IGFycmF5IG9mIGJpdHMgZm9yIHRoaXMgY2hhbm5lbHMgd29uJ3QgaGVscD8/DQo+ID4+DQo+ID4+
IENhbiB5b3UgZ2l2ZSBhbiBleGFtcGxlPyBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIGhvdyB5
b3Ugd291bGQNCj4gPj4gcHJlZmVyIG1lIHRvIHVzZSB0aGUgYXJyYXkgb2YgYml0cy4NCj4gPg0K
PiA+IHN0cnVjdCByaWljX29mX2RhdGEgew0KPiA+IAl1OCByZWdzW1JJSUNfUkVHX0VORF07DQo+
ID4gCXUxNiBmYXN0X21vZGVfaW5mbyBpbmZvOyAvKiAxIG1lYW5zIGZhc3QgbW9kZSBwbHVzIHN1
cHBvcnRlZCwNCj4gPiBzdGFydGluZyB3aXRoIGNoYW5uZWwgMCovIH07DQo+ID4NCj4gPiAuaW5m
byA9IDB4MywgbWVhbnMgY2hhbm5lbCAwIGFuZCAxIGhhcyBmYXN0IG1vZGUgcGx1cyBzdXBwb3J0
ZWQgLmluZm8NCj4gPiA9IDB4MCwgbm9uZSBvZiB0aGUgY2hhbm5lbCBzdXBwb3J0ZWQgZmFzdCBt
b2RlIHBsdXMuDQo+IA0KPiBJZiBJIHVuZGVyc3RhbmQgdGhlIHByb3Bvc2FsIGNvcnJlY3RseSwg
YSBtYXRjaCBiL3cgc3RydWN0IHJpaWNfb2ZfZGF0YTo6aW5mbyBiaXQgKyBmcmVxdWVuY3kgYW5k
DQo+IHRoZSBub2RlcyBpbiBkZXZpY2UgdHJlZSBpcyBzdGlsbCBuZWVkZWQsIHJpZ2h0PyBBcyB0
aGUgUlovRzNTIFJJSUMgY2hhbm5lbHMgYXJlIHVzaW5nIHRoZSBzYW1lDQo+IGNvbXBhdGlibGUu
DQo+IFcvbyBhIG1hdGNoIGhvdyBJIGNhbm5vdCBkZXRlY3QgaW4gdGhlIGRyaXZlciB3aG8gaXMs
IGUuZy4sIGNoYW5uZWwgMSB0aGF0IHN1cHBvcnRzIEZNUCB3L28NCj4gaGFyZGNvZGluZyBzb21l
IFJJSUMgY2hhbm5lbCBkYXRhIGluIHRoZSBkcml2ZXIgKGUuZy4gUklJQyBjaGFubmVsIGFkZHJl
c3MpPw0KDQpiaXQgYXJyYXkgZ2l2ZXMgdGhlIGNhcGFiaWxpdHkgaW5mbyBvbiB2YXJpb3VzIGNo
YW5uZWxzLg0KDQpJZiBzb21lb25lIGRlZmluZSBmYXN0X21vZGVfcGx1cyBmcmVxdWVuY3kgaW4g
RFQgbm9kZSBhbmQgY2hhbm5lbCBpcyBub3QgZmFzdF9tb2RlX3BsdXMoZnJvbSB0aGUgY2FwYWJp
bGl0eSBpbmZvKQ0KdGhlbiB5b3Ugc2hvdWxkIHJldHVybiBlcnJvci4NCg0KSGVyZSB5b3UgbmVl
ZCB0byB1c2UgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgYXMgZWFjaCBTb0MgaGFzIGRpZmZlcmVu
dCBjYXBhYmlsaXRpZXMuDQoNCkNoZWVycywNCkJpanUNCg0KDQo+IA0KPiBBbHNvLCBmb3IgZnV0
dXJlIFNvQ3MgdGhhdCB3aWxsIHN1ZmZlciB0aGUgc2FtZSBzeW1wdG9tIGJ1dCBmb3IgZGlmZmVy
ZW50IGNoYW5uZWxzIChhbmQgY2hhbm5lbHMNCj4gd2l0aCBkaWZmZXJlbnQgYWRkcmVzc2VzKSB0
aGUgZHJpdmVyIHdpbGwgaGF2ZSB0byBiZSBhZGFwdGVkIHRvIG1hdGNoIGIvdyB0aGUgY2hhbm5l
bCBiaXQgaW4gc3RydWN0DQo+IHJpaWNfb2ZfZGF0YTo6aW5mbyBhbmQgY2hhbm5lbCBub2RlIGZy
b20gRFQuDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUNCg==

