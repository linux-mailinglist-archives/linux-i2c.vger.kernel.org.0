Return-Path: <linux-i2c+bounces-4475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5891C20F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 17:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C9F287BD1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 15:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7ED1C2314;
	Fri, 28 Jun 2024 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I51tRMzf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2084.outbound.protection.outlook.com [40.107.113.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243039FEB;
	Fri, 28 Jun 2024 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587157; cv=fail; b=WPvfqcOggJgWmUDs2q8jQ7yTWKCJFwFM2bAVLvUNZb+nuIIfDGuzBK+uyef0EheuI/YgiEve3yjggGwkysSYRyREFYjjbgXknhgfIUN8KXJVJmSIL3nZWw5hE++LiXXv3/EWhIJ9S1LpTkgfMxHZwpdesxd3mDYda9MpP+IaLrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587157; c=relaxed/simple;
	bh=LIHX86D5Ts+G//it0bh2pWLkzEWoXG89GS00fG9GFuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UNWbKLSpS8d+BfEZOU6E3i5SSBn9TJwIP6h42ptAWlgW6dkMDoUrPPRxzctuSHRS6R/z/kW9jv9VhjvwaVEZFwcFczHy7WZVTHWOTkbDKENwfUOcJe66Cvc6k4yjwrPahQChZTIgiwYUQD4Jz+91u1gJfFjk2Ox5xRoE5Uz5lkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I51tRMzf; arc=fail smtp.client-ip=40.107.113.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSqXWpMiV14/ll/huLTo2tQI/sm+LvJbcaT0HA1e7vJrghd02bCjy3BEN1uKAD2WoNcDSjUK3vaABuSzKb0irLe8T8+7NaG4E+LFGHOwq83sH4FBZjh+Fe6VMvLLObMtZJ4ZqHv+3H/UBwU4hO5DvXIBfmWLsKO/a9C8yqCWM8XKWYt3aeOgC4JzszZl8ci8OnwrCAUXqZI09Lt0QQmx6hUCvy7fxu4ICgfGLADDcNxh/9VHuAvQo1o22zqTm0Ljuj9iYf/XHGBifH+AQtwcHs5c1Eta1stjBRkv2gigyZCNliDruN3Aeq4vhITxsdmzvj2T33l8ny9Ni4EPqDBVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIHX86D5Ts+G//it0bh2pWLkzEWoXG89GS00fG9GFuo=;
 b=VtcjwaQB3XU/z19bMz6JS1qIvdBYkep515a131l5jJNIMTv9o1l1yvZRhPsUtiSWcsM3UUYeEaY1aX/6KwZUytUTop59taDqMI4gvlkZjQquoEjZHKdu6JLco1dnOaMzMiagP8RONvSsUqYZS5gBme2KnuCW920q4zYpwQETKMLkCwl52LR6O9/nqmZGNcASdWgY65kINWF/NT+hAc6F61aF2KT/IlucUpubE2GfErLxoTH8pXzpkiKV5saQ81y/rY8dcUhUhRDRruYHnMYMlTK9bUfXErn08GHk8pw98ZbVO6rj5FCiMOWOih07kstsAnfZvuvKuJIJiamDLFJ4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIHX86D5Ts+G//it0bh2pWLkzEWoXG89GS00fG9GFuo=;
 b=I51tRMzf5IEYNPm8uDRHCxuCTY53CcR3szHBkkddEm5JVsy6762u4pqjBFhz5QFc2nNRmfAOfRBRyBS0l1BCbro9btJzSGfY/13mBefmZwtx6cqyaiGZ6SIq//Nr9oP3bHg/G3pBROM7cB36dprXqroaXrir17apxuqacjputyc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8068.jpnprd01.prod.outlook.com (2603:1096:604:172::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 15:05:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 15:05:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Chris Brandt <Chris.Brandt@renesas.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index:
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAAAI1gIAAAhDQgAAi5QCAAAElIIAAD5mAgAAAQqCAADyhkA==
Date: Fri, 28 Jun 2024 15:05:50 +0000
Message-ID:
 <TY3PR01MB11346128D4F85CF889A6C0ADE86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20ff64a8-e619-4281-894f-1aa08ea67f18@tuxon.dev>
 <TY3PR01MB1134678E3A8485DB152BD66D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ae2223f8-4058-4bd1-b480-ed2b4b1d526f@tuxon.dev>
 <TY3PR01MB11346B97813661374F72A677986D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346B97813661374F72A677986D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8068:EE_
x-ms-office365-filtering-correlation-id: aa1ff7ed-e039-43c6-45fe-08dc9783cc95
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGJwdW9iWExUelpiczBJUTd5YjBJOUZyOXdyVk00UzBJNEVNNWNjUlFQTFVT?=
 =?utf-8?B?ZkE1TnlSUTBjL3ZweDhIZmo3SVFQbUJTaHBJbTZGVElDTXBpSmM5K2N0RUpx?=
 =?utf-8?B?UzhiMDU0MUtIUVIweHg2SktMOFpnT3Q4NHlac1g2NU5TVGVTL1FueFhvUTNV?=
 =?utf-8?B?dkZMY0lKS0ZaNzhBK05sNEtqSVBlWFg3Q0laaG1GM0NIaVZ6cFdxNUk0KzBP?=
 =?utf-8?B?akhtUHZ1VEJ0eHRpaUkrYTJUbGpnSEYvaWJCQXBXMllsRmlVYWRYVFhEWlJC?=
 =?utf-8?B?SmRoUHBZQ1hXMGlEK2h1elp0V1dBS2Nwci9qdFF2djlHWElmQTB5N2pEUXlP?=
 =?utf-8?B?M2xFR0ZCV0lPZHMrTzgwRzVZUXRYRU5kQVE3YTZzTitDUksxckd3Z0xxaVd0?=
 =?utf-8?B?OEdSVWRwdXdsZEh0TG1LMWt4R2pIeldVYStMYVdEL2JyOGlTZFZxdEpXUnhT?=
 =?utf-8?B?QW1pVzY3OFJzaThydWx1c21jWmJ3OGVKeWZXR0IrU1NMVldkY0RReUJCWHBs?=
 =?utf-8?B?N2pLd3lUNnBtZFRnSmpVcGlPV05wNDQrNTROdEREVW81QWVEOE1IclVPdzZ4?=
 =?utf-8?B?aERuaUVkdE1WTUt2V3BWeFE4YmVveGE4WXFTYVIydUpEaVMweVZQZHhJZHFk?=
 =?utf-8?B?UWN4K2dZNEorbk4rWE1IVldVQUFic3VVMVNNOEVuV21icFVPQUhWYnBOZ1By?=
 =?utf-8?B?b3YyZTJ5cEg5L1paSGM5OTNqZFUwQTU5YldtMm1NU3V6eVRpbVVQYS85dkta?=
 =?utf-8?B?OTVlMGtTL1BBVnMvTjZ3QktRVTN5WTJLOHVBL0N3VmJINERjWDNteVRJMlV4?=
 =?utf-8?B?TVFkMlIyZm50ZXhaY0ptTmFqcFJzb0pNL0NXVlVoUzZlNzVITWdWUnNscHUw?=
 =?utf-8?B?QUN3N3BmVFBiOEdXT2EvTzA5MWpEWDJoVXRJNzRGVzBYdDUxZnZGWGhlakJG?=
 =?utf-8?B?amlIeDdiMFhHOENpdkxWVk5Kck1pdllJMmgrMjhVbmlxSFJPL1dQbHIybGNw?=
 =?utf-8?B?MGgrdkFqeTRhV3MybEFscEpJT0RKckpQZ1hEejluNk9LSkpBUkJ2SnloMzFP?=
 =?utf-8?B?ME55a3ljTUxiU1BJZTRQWlN3a3RTVnhIaFRkUXJzZG12NVF5MFF4UWQrL3JY?=
 =?utf-8?B?SFNlSURXbEowbDFiTWtZM1hWYy84V0huMVRPVG9MV0xpd2hwOVRZdVgycE13?=
 =?utf-8?B?T0NwVDR4OC9yaVhMUk52dVZxL1pIbDdHM256WTVDYUZLcHlCM1lTeXFoU01r?=
 =?utf-8?B?M0IwWkRsZlJBNlV1UjcwQVNIQmhvc2dZdVY2cDIzNWs3WWtEeUxDeFVxRFNv?=
 =?utf-8?B?dnlyQkFxdTJ4Qi9rMUpBZGpQUXhpM0ZrWjJYK0FyZmRoc2hwa2NPK0Z5SlJT?=
 =?utf-8?B?dS9RSEdaZnpsSzNENm5WdjhaZGJieEpOa2M3enptYkl1TlFRdE1aUmRRUyt3?=
 =?utf-8?B?YXZDUFlaNWJTTk03ZCtrcitYcW1Hd3I4ZU5NeTVlcER0d0x5QUZmZHRYZitt?=
 =?utf-8?B?NXV5M0VGWlZlZmdYRjhSb1pZVmlkZVBFaXVxaGJPMlpzdVZmTEN5akdnbG8w?=
 =?utf-8?B?TEV6bHNSMVRIQkJpeHdFOWVFdCs5QzB4WWZYSGlPUzlXanA3NHpGaGFXbTc1?=
 =?utf-8?B?NXZud2RNNTdDK1lWVXkxNVh6ZnRYL2JzSkNjMkhGMURPR2RvSGtPRWVnOFdi?=
 =?utf-8?B?MFU0emN4YW5BL0czTEVsY05wbkJ0VytrajNDSlQ4QkFOcnVnNThGd2IyN2Rq?=
 =?utf-8?B?NzVGdkU1bitiazFUeDZmMllOdzd4UkplK2xHdnlMMkVweWh1TGNSN2x3WHE5?=
 =?utf-8?B?UnFWRE12VnFKVEZkTmpQenlNSkdYQTQ0Y21MWW9oSm5WbFlKKzREUm54c2E1?=
 =?utf-8?B?U2J6V0tvVjRnSUJ1YjFUQ2w2S2ZrNDM4MFlnN0xmNlo0VmFQWGpMakNrUExu?=
 =?utf-8?Q?dl882nOrymM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzNXUUZLa2JWdWZlU09lSTg4RUh4SXdNZ0d4eG9qZXBNRE44bHBVUzFrdnFj?=
 =?utf-8?B?RnRRdVFvTU9mYVVaMGFKUUJ1Q3hmVG1BK01UVi8xcXdtVXptRGJVZi9Zcmdz?=
 =?utf-8?B?OEx2R0hZNkJyMTNlMUFhUU5GMFAvY3V2NVFXYTNvYVV2OWg5RnhRZ0VTdUx1?=
 =?utf-8?B?ODdVY3h3WlkrNHpYZkVhdmlnMVdncU1McmVGWmN0OFdmNHRrakpLQUd1MVZy?=
 =?utf-8?B?NVJQcE9pdWU5RVk5OERiSjZiR25kREVuaGIxdC92SlBTVXNuL3IwZnpUaFJE?=
 =?utf-8?B?bDFKRzNSZFkzeldhN2Foek9mQ3NrZVJhRTh0UkRXQmhzQk8vTWludWVISGF0?=
 =?utf-8?B?ckdZVjVjMTF5Vmt2RkdhcS9GQTZFQ0F4RmI4dEt4UGJaNlZ3bHZ6Um1ZS3Rw?=
 =?utf-8?B?ZWVINW9ocDNzdzBVdFpaQUdFeGo4TkRFYkg3bzkzSkhlWUZnUzBrZFcyZ2Jx?=
 =?utf-8?B?S3pOeHpuVUdJdzhzQ1czRlRxbGxYdmk4TTBUMHd5Z1d6bms0QTRTd3pGZllT?=
 =?utf-8?B?ZFFvQUY3NnUwRE9sUnVxaG52RE43QnB2c05Yb3pxOHVsRmk4dUdLaWF1UGhK?=
 =?utf-8?B?TXM5RFAxaHdRYURScE5sQkFhMmhFNjdkM0NsNm01eUphQ2JmMDRQUVBLWkJR?=
 =?utf-8?B?bnJ4TlYvajdiWlY1aW1waWdRcGhaUStPY2RvTWwydS80aGt2ODFSODlPejg2?=
 =?utf-8?B?YkN3YjcwUE5WZVFYMEhTcW5Lc05oekN3NENreXY5SEVRclVmMlpTV0Ivd1Fp?=
 =?utf-8?B?cGVKd0pnM0h0cndQbEM4SFhCT1VDVDliSER0bkNkRkphTUZoVjUvVHY1Zzcz?=
 =?utf-8?B?dVAwRjBVZlFGMlZ3bUJWMWZsYU05Q0N2YVRUR01SS0tHcWFJZTVZdzFUV25t?=
 =?utf-8?B?c2tPcnA4Q2N6Zlo0VUFYaVNwMWV1Rm1USzZ4WG55S0FZRTFoMFZJU0U4UmdN?=
 =?utf-8?B?KzF6d09QUjY5RG5BRTFhUDAySGk2ZUtJUExHL2JsazF6eEw0eXRUZS9mZ0ZR?=
 =?utf-8?B?S1M0SEdaZTJYVUhHMkRnSFVMaWk0Z3ArUWhXVExzYnRxUXN1dTM5ZENxYjFr?=
 =?utf-8?B?aG1QdVQ0aXRXUDFzUkpMMi84Z0YyTnFsaFA2bnIyalRJbHdZQWgwb2oxdnFi?=
 =?utf-8?B?Q014enpRWHFvQkM5UjhlZXYxNmQ0QWNITm1ZYUN1eEl1bHZGZ3hYSWhBajBm?=
 =?utf-8?B?eHhSSENPRzZRanR2bENGeEdLL3ZLeU5nKzNjYnZ4OWtJaDQ0bXZ6Qkw5ZG9q?=
 =?utf-8?B?VGhBU0xTdnZOQW9YTGRHbVhHMUI0RDIvWFkxQlZNeXNmZjkzY1pnK0ZUNHEw?=
 =?utf-8?B?TUNRYjN6Q2IwLzZUS2NOVkV6aGNpdlA5d2lBSkU4aVQrNHJmVFVPaUxUREZW?=
 =?utf-8?B?V3RJYzNHMXd5WXo4ak1abGdhV1R4U2paY3BsTWdIeVhJcHdRRDVUVHUxQ2o0?=
 =?utf-8?B?cERYYWdaMVVGWlo3U0VDYUppcyt4RDZTbitrR1FtTGkvQXVuOXQrWEtSZEdU?=
 =?utf-8?B?NWVCcHBuRHFqVjZUMGlQanBwcVA3MWpOVGkraUJuRkx3RE5iRVVaN2xJbmRG?=
 =?utf-8?B?a1RHdkt1bExVM2xrVmdYMVNSVjVpbzB1M084TnVEKzAvTCtTU3FqMC9IY0Vo?=
 =?utf-8?B?bFJkb0NUbGsxVHU5QUpVNCtFQ2NER0NsT3FpY0hyempLUVAxTmhLY2lQMUor?=
 =?utf-8?B?VXR0STJLNC9Kbm02NlBYb2c3Q0pUUzd1L1Z2Q0tsUnBGc1NEMWhWZjdidjFs?=
 =?utf-8?B?alF2bVFzNTU3MG4weU9qalhDcld6bkYxSnI4S25TcklMSy8vNmJ1dm1waS8z?=
 =?utf-8?B?UjhEem1QYVJScmFJWU1zOTlCdWVCQ3BuVXBDN3JOazVqT1cxYTJWeDZEQXUr?=
 =?utf-8?B?aExTOTI0WXUwUnFUeW9HaG5QaE00bXc5b0xyZlZkNDZoQkQ4TnRNUkxUQ2Nx?=
 =?utf-8?B?elFEUlpETHBSVzFKRTkzdU1mZWFhRjZhLzM5cjZtZDdqc3JzYjFLN3ZTK3pv?=
 =?utf-8?B?Z1RUNUdUTVdxY29oeWZvdzhwSVd4ZlUrRGgrYWtPNXVnZTBTZlpGdXBhSUhw?=
 =?utf-8?B?azFiMmxRRGxKbkFCYkdKV0dqWGpQQWFQSlhXb3NpS0pwZnpldm05K3ArMTc0?=
 =?utf-8?B?cElNYXBBZ2ljTFJhdUNxYzZiMVZ2Q3RONlNlQTc5YkV6QXhNeFU0cGdnVlEz?=
 =?utf-8?B?VVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1ff7ed-e039-43c6-45fe-08dc9783cc95
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 15:05:50.8131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tos68JhAToyUreufv18h5gaUNRiut49B/egcwObfc2GSDkWXargjGUkpCzGnSBAemiFecVOh6hTXVbnsrDSdMo9X8UvSI34hv879+lOAyQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8068

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlk
dWFsIGFycmF5cyB0byBkZXNjcmliZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0cw0KPiANCj4gSGkgQ2xh
dWRpdSwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+IFNlbnQ6IEZyaWRheSwg
SnVuZSAyOCwgMjAyNCAxMjoyNSBQTQ0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDcvMTJd
IGkyYzogcmlpYzogRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzIHRvDQo+ID4gZGVzY3JpYmUgdGhl
IHJlZ2lzdGVyIG9mZnNldHMNCj4gPg0KPiA+DQo+ID4NCj4gPiBPbiAyOC4wNi4yMDI0IDEzOjQ5
LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IEhpIENsYXVkaXUsDQo+ID4gPg0KPiA+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVk
aXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPiA+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIwMjQg
MTE6MjUgQU0NCj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6
IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0KPiA+ID4+IHRvIGRlc2NyaWJlIHRoZSByZWdpc3Rl
ciBvZmZzZXRzDQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+DQo+ID4gPj4gT24gMjguMDYuMjAyNCAx
MToyNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPj4+IEhpIENsYXVkaXUsDQo+ID4gPj4+DQo+ID4g
Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+Pj4gRnJvbTogY2xhdWRpdSBi
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPiA+Pj4+IFNlbnQ6IEZyaWRheSwg
SnVuZSAyOCwgMjAyNCA5OjEzIEFNDQo+ID4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3
LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0KPiA+ID4+Pj4gdG8gZGVz
Y3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPiA+Pj4+DQo+ID4gPj4+Pg0KPiA+ID4+Pj4N
Cj4gPiA+Pj4+IE9uIDI4LjA2LjIwMjQgMTE6MDksIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4+Pj4+
DQo+ID4gPj4+Pj4gSGkgQ2xhdWRpdSwNCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+Pj4+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+ID4+Pj4+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIw
MjQgOTowMyBBTQ0KPiA+ID4+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6
IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsDQo+ID4gPj4+Pj4+IGFycmF5cyB0byBkZXNjcmliZSB0
aGUgcmVnaXN0ZXIgb2Zmc2V0cw0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+Pg0K
PiA+ID4+Pj4+PiBPbiAyOC4wNi4yMDI0IDEwOjU1LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+Pj4+
Pj4+IEhpIENsYXVkaXUsDQo+ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPj4+Pj4+Pj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUu
YmV6bmVhQHR1eG9uLmRldj4NCj4gPiA+Pj4+Pj4+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIw
MjQgODozMiBBTQ0KPiA+ID4+Pj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDcvMTJdIGky
YzogcmlpYzogRGVmaW5lIGluZGl2aWR1YWwNCj4gPiA+Pj4+Pj4+PiBhcnJheXMgdG8gZGVzY3Jp
YmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPiA+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+IEhpLCBC
aWp1LA0KPiA+ID4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4gT24gMjguMDYuMjAyNCAwODo1OSwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gPj4+Pj4+Pj4+IEhpIENsYXVkaXUsDQo+ID4gPj4+Pj4+Pj4+DQo+
ID4gPj4+Pj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+Pj4+Pj4+Pj4g
RnJvbTogQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+ID4+Pj4+Pj4+Pj4g
U2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4gPj4+Pj4+Pj4+PiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMDcvMTJdIGkyYzogcmlpYzogRGVmaW5lIGluZGl2aWR1YWwNCj4gPiA+
Pj4+Pj4+Pj4+IGFycmF5cyB0byBkZXNjcmliZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0cw0KPiA+ID4+
Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJl
em5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+PiBE
ZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMu
DQo+ID4gPj4+Pj4+Pj4+PiBJbiB0aGlzIHdheSB3ZSBjYW4gZGVzY3JpYmUgZGlmZmVyZW50IElQ
IHZhcmlhbnRzIHRoYXQNCj4gPiA+Pj4+Pj4+Pj4+IHNoYXJlIHRoZSBzYW1lIHJlZ2lzdGVyIG9m
ZnNldHMgYnV0IGhhdmUgZGlmZmVyZW5jZXMgaW4gb3RoZXIgY2hhcmFjdGVyaXN0aWNzLg0KPiA+
ID4+Pj4+Pj4+Pj4gQ29tbWl0IHByZXBhcmVzIGZvciB0aGUgYWRkaXRpb24NCj4gPiA+Pj4+Pj4+
PiBvZiBmYXN0IG1vZGUgcGx1cy4NCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYQ0KPiA+ID4+Pj4+Pj4+Pj4gPGNsYXVkaXUuYmV6bmVh
LnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4+Pj4+Pj4+Pj4gLS0tDQo+ID4gPj4+Pj4+Pj4+Pg0K
PiA+ID4+Pj4+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4gPiA+Pj4+Pj4+Pj4+IC0gbm9uZQ0KPiA+
ID4+Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMu
YyB8IDU4DQo+ID4gPj4+Pj4+Pj4+PiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ID4+Pj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyNyBk
ZWxldGlvbnMoLSkNCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPiA+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1yaWljLmMgaW5kZXgNCj4gPiA+Pj4+Pj4+Pj4+IDlmZTAwNzYwOTA3Ni4u
OGZmYmVhZDk1NDkyIDEwMDY0NA0KPiA+ID4+Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1yaWljLmMNCj4gPiA+Pj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtcmlpYy5jDQo+ID4gPj4+Pj4+Pj4+PiBAQCAtOTEsNyArOTEsNyBAQCBlbnVtIHJpaWNfcmVn
X2xpc3QgeyAgfTsNCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+PiAgc3RydWN0IHJpaWNf
b2ZfZGF0YSB7DQo+ID4gPj4+Pj4+Pj4+PiAtCXU4IHJlZ3NbUklJQ19SRUdfRU5EXTsNCj4gPiA+
Pj4+Pj4+Pj4+ICsJY29uc3QgdTggKnJlZ3M7DQo+ID4gPj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+
DQo+ID4gPj4+Pj4+Pj4+IFNpbmNlIHlvdSBhcmUgdG91Y2hpbmcgdGhpcyBwYXJ0LCBjYW4gd2Ug
ZHJvcCBzdHJ1Y3QgYW5kIFVzZQ0KPiA+ID4+Pj4+Pj4+PiB1OCogYXMgZGV2aWNlX2RhdGEgaW5z
dGVhZD8NCj4gPiA+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+IFBhdGNoIDA5LzEyICJpMmM6IHJpaWM6
IEFkZCBzdXBwb3J0IGZvciBmYXN0IG1vZGUgcGx1cyIgYWRkcw0KPiA+ID4+Pj4+Pj4+IGEgbmV3
IG1lbWJlciB0byBzdHJ1Y3QNCj4gPiA+Pj4+Pj4gcmlpY19vZl9kYXRhLg0KPiA+ID4+Pj4+Pj4+
IFRoYXQgbmV3IG1lbWJlciBpcyBuZWVkZWQgdG8gZGlmZmVyZW50aWF0ZSBiL3cgaGFyZHdhcmUN
Cj4gPiA+Pj4+Pj4+PiB2ZXJzaW9ucyBzdXBwb3J0aW5nIGZhc3QgbW9kZSBwbHVzIGJhc2VkIG9u
IGNvbXBhdGlibGUuDQo+ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4gQXJlIHdlIHN1cmUgUlovQSBk
b2VzIG5vdCBzdXBwb3J0IGZhc3QgbW9kZSBwbHVzPw0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+PiBG
cm9tIGNvbW1pdCBkZXNjcmlwdGlvbiBvZiBwYXRjaCAwOS8xMjoNCj4gPiA+Pj4+Pj4NCj4gPiA+
Pj4+Pj4gRmFzdCBtb2RlIHBsdXMgaXMgYXZhaWxhYmxlIG9uIG1vc3Qgb2YgdGhlIElQIHZhcmlh
bnRzIHRoYXQNCj4gPiA+Pj4+Pj4gUklJQyBkcml2ZXIgaXMgd29ya2luZyB3aXRoLiBUaGUgZXhj
ZXB0aW9uIGlzIChhY2NvcmRpbmcgdG8gSFcNCj4gPiA+Pj4+Pj4gbWFudWFscyBvZiB0aGUgU29D
cyB3aGVyZSB0aGlzIElQIGlzDQo+ID4gPj4+PiBhdmFpbGFibGUpIHRoZSBSZW5lc2FzIFJaL0Ex
SC4NCj4gPiA+Pj4+Pj4gRm9yIHRoaXMsIHBhdGNoIGludHJvZHVjZXMgdGhlIHN0cnVjdCByaWlj
X29mX2RhdGE6OmZhc3RfbW9kZV9wbHVzLg0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+PiBJIGNoZWNr
ZWQgdGhlIG1hbnVhbHMgb2YgYWxsIHRoZSBTb0NzIHdoZXJlIHRoaXMgZHJpdmVyIGlzIHVzZWQu
DQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+IEkgaGF2ZW4ndCBjaGVja2VkIHRoZSBIL1cgbWFudWFs
Pw0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+PiBPbiB0aGUgbWFudWFsIEkndmUgZG93bmxvYWRlZCBm
cm9tIFJlbmVzYXMgd2ViIHNpdGUgdGhlIEZNUEUNCj4gPiA+Pj4+Pj4gYml0IG9mIFJJSUNuRkVS
IGlzIG5vdCBhdmFpbGFibGUgb24gUlovQTFILg0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gSSBqdXN0
IGZvdW5kIFJaL0EyTSBtYW51YWwsIGl0IHN1cHBvcnRzIEZNUCBhbmQgcmVnaXN0ZXIgbGF5b3V0
IGxvb2tzIHNpbWlsYXIgdG8gUlovRzJMLg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IEkgaW50cm9kdWNl
ZCBzdHJ1Y3QgcmlpY19vZl9kYXRhOjpmYXN0X21vZGVfcGx1cyBiZWNhdXNlIG9mIFJaL0ExSC4N
Cj4gPiA+Pj4NCj4gPiA+Pj4gTWF5YmUgbWFrZSB0aGUgcmVnaXN0ZXIgbGF5b3V0IGFzIHBlciBT
b0MNCj4gPiA+Pj4NCj4gPiA+Pj4gUlovQTEgLS0+ICZyaWljX3J6X2FfaW5mbw0KPiA+ID4+PiBS
Wi9BMiBhbmQgUlove0cyTCxHMkxDLFYyTCxHMlVMLEZJVkV9IC0tPiAmcmlpY19yel9nMl9pbmZv
IFJaL0czUw0KPiA+ID4+PiBhbmQgUlovVjJIIC0tPiAmcmlpY19yel92MmhfaW5mbw0KPiA+ID4+
DQo+ID4gPj4gU29ycnksIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQuIFBhdGNoIDA5LzEyIGFscmVh
ZHkgZG9lcyB0aGF0IGJ1dCBhDQo+ID4gPj4gYml0DQo+ID4gPj4gZGlmZmVyZW50bHk6DQo+ID4g
Pg0KPiA+ID4gTm93IHJlZ2lzdGVyIGxheW91dCBpcyBhZGRlZCB0byBkaWZmZXJlbnRpYXRlIHRo
ZSBTb0NzIGZvciBhZGRpbmcNCj4gPiA+IHN1cHBvcnQgdG8gUlovRzNTIGFuZCB0aGlzIGxheW91
dCBzaG91bGQgbWF0Y2ggd2l0aCB0aGUgaGFyZHdhcmUgbWFudWFsIGZvciBhbGwgc3VwcG9ydGVk
IFNvQ3MuDQo+ID4gPiBDdXJyZW50bHkgaXQgaXMgd3JvbmcgZm9yIFJaL0EyIFNvQywgd2hpbGUg
eW91IGZpeGVkIGl0IGZvciBhbGwgb3RoZXIgU29Dcy4NCj4gPg0KPiA+IEkgY2hlY2tlZCBSWi9B
Mk0uIFRoZXJlIGlzIG5vdGhpbmcgYnJva2VuLiBUaGUgb25seSB0aGluZyB0aGF0IEkgc2VlDQo+
ID4gaXMgdGhhdCB0aGUgRlArIGlzIG5vdCBlbmFibGVkIG9uIFJaL0EyTSAocGxlYXNlIGxldCBt
ZSBrbm93IGlmIHRoZXJlDQo+ID4gaXMgYW55dGhpbmcgZWxzZSBJIG1pc3NlZCkuIEkgZG9uJ3Qg
c2VlIHRoaXMgYnJva2VuLiBJdCBpcyB0aGUgc2FtZSBiZWhhdmlvciB0aGF0IHdhcyBiZWZvcmUg
dGhpcw0KPiBwYXRjaC4NCj4gDQo+IEFzIHBlciBSWi9BMk0gaGFyZHdhcmUgbWFudWFsLCBJQ0ZF
UiByZWdpc3RlciBpcyBwcmVzZW50DQo+IA0KPiBXaGlsZSBhcyBwZXIgWzFdLCB5b3UgZG9uJ3Qg
aGF2ZSB0aGlzIHJlZ2lzdGVyLiBTbyBhY2NvcmRpbmcgdG8gbWUgUlovQTIgU29DIHJlZ2lzdGVy
IGxheW91dCBpcw0KPiBicm9rZW4gYW5kIGl0IGlzIHNhbWUgYXMgUlovQTEuDQo+IA0KDQpPb3Bz
LCBJQ0ZFUiByZWdpc3RlciBpcyBwcmVzZW50IGluIFJaL0ExIGFzIHdlbGwuDQoNCkN1cnJlbnRs
eSBzYW1lIGNvbXBhdGlibGUgdXNlZCBmb3IgUlovQTEgYW5kIFJaL0EyDQp0aGF0IG5lZWRzIHRv
IGJlIHVwZGF0ZWQgaW4gcGF0Y2gjOSBhcyB0aGUgbGF0ZXIgaGFzDQpGTVAgY2FwYWJpbGl0eSBs
aWtlIFJaL0cyTC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg==

