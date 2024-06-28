Return-Path: <linux-i2c+bounces-4450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767391B9D7
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 359C02844EE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA50E149007;
	Fri, 28 Jun 2024 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FXdrD+18"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF714389A;
	Fri, 28 Jun 2024 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563388; cv=fail; b=mM7ofGlrY9N74kJR4E+UhJXjmJqIS2FRRgVJnU7ayXsNV+TflJMASmyakd3+G6+8gmF5vSkW+SNb/FSaQOVUdoxrjsomL8kr6zG2CeBrhWVCBSnQiEmWgxFxLOpq+BOTRHIfz5n9i/X+B7XP/Mp5qHMk4EaV/Rf2zxNDFn7rwMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563388; c=relaxed/simple;
	bh=QqxJbPUeuzOeCY0kd4sN0LJ4DN5TiegwSXd2YHMiOlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dvTDu4E/MedqH+PBGZFEQIaiJtm0Z3bEf1aJEtu2/FCx9LgeGhnpJ6DMRdsX9BroAuOqZkXoLsXDpos7ReOHQ7EE8OaeEdJ2UGJNtuemq4Xf1WYwYxy0LvJ4jsIrXz99DFr+1GAt3WrS/k8N5tEjmcCvoY3iBaB4ppHZ2DKGm7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FXdrD+18; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsYB8xmuT+ZTEoTUs3cWV1IUQIZUTXm/J/yvz69C0sobJ5cE06Pgf0hnQojJTo3qRciEJvmFZVxjjYsocD5+o1iVn0OqrMKZ+dnGbntlLAt+itqvcStuntOH5ZjbC5HM6aKqBnK7AHVREsb53NDlc2JuDTRc28M1TCwENjiMqmSx9177IBQxChRWF1J6pRWktLREmsPhPrh+47e3WDU/9/HAMsyhfHQcIFvFOFYEFvD0EsDcHnAMxpkac1mk46IqooilGqDpsAl52lYBlWHlCF1GDyeyMkoRugz8vro4bd9/bG3nLrwzS2KuWz3Xw6bI/4GDWfJeTbCartPj5i2nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqxJbPUeuzOeCY0kd4sN0LJ4DN5TiegwSXd2YHMiOlQ=;
 b=CZw13jvUeo/sv/EGhuZ2EkvBZFYtvpr3rLbhW90NLnRnDwuuWvB590MT5EIjiikU/Io4fOaCQ+UXVb89DO75KQBPdE2MPy+su7VxPeMMQCovfJxnUuE7bsSFQrzcx4bDIWxozmvMbAyjvfDJyjYjzM7MgIolu3wnGTBf0hSwDuezBN73Xt+dxteiSoKrSBkxKP3dTjkX1XP58t6tS/4Qp/LV6nk/HRzwAPT9MAj5WlQg4nTUPe+OtVMY+3m3dKFzG7uir2ej0DezWjT81D7yIs2be0UrrEqTT/v9saaOM32EkpUN7iJBukbYKSa0WG8XG4084Pd1gp5QR99akWz/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqxJbPUeuzOeCY0kd4sN0LJ4DN5TiegwSXd2YHMiOlQ=;
 b=FXdrD+189AZKjVnTdMRxgJsrJC1jnL7INilfFTZQW/6aMMv0GuEp1J/OaHktUUHKvoA1b2T5Sm70g6XNpU6utOmSaHM9ebUeo9zb5KPCmf1rGz8cl75p0stKnFYTFGxU3/oJIgPOf/uy8rUCH+3jWMZ1HgZZ7xt++TtAQOCHw+s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6465.jpnprd01.prod.outlook.com (2603:1096:604:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 08:29:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 08:29:40 +0000
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
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAAAI1gIAAAhDQgAACRiA=
Date: Fri, 28 Jun 2024 08:29:40 +0000
Message-ID:
 <TY3PR01MB11346C2290CB5BD32892D404986D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6465:EE_
x-ms-office365-filtering-correlation-id: 26b9ef02-ffeb-4eee-7818-08dc974c744a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHRuazB6OVJlc2pYYUtqTDJ2VWtMcWtQckV0T2x4Vk9ySzdTVkpkUTArOHR6?=
 =?utf-8?B?QXpJOHMxQTk1aHVHbGlXU0UzSlRNWkErR3ZwOGVvbnpCbTdydzVoMGJjSnYz?=
 =?utf-8?B?STFMbEk1aDRicVBYdk05V2tvakdjTURBVStCVE9ORTE5NE9KTWtVdTg1QnlL?=
 =?utf-8?B?OWl1TUx0WGQwbTlhWDE5d3IzWVhuYXdXbTVKM0x6NWFGY1dBN2dBRmFqdXZQ?=
 =?utf-8?B?WmozVGNqSzlZazB3NlV1NDRPb3g3SURPWWFjVHY5OE5kdTBVeDhpV20xQXR1?=
 =?utf-8?B?YjkxMTdPVW1KTFlyaUVJbnVzVWczM2gyS2lhWG9uRXV4cGZzTFBYeks2QzdP?=
 =?utf-8?B?NURXd3hHUVRQUUhJVjVXR040dVBOd3g0bUFSaE1kTE9COHBaMFl5bTY5L2hP?=
 =?utf-8?B?T3FUYlljSGpmQStFQTh0c0xBODR6OTdKc2wxRENheFFWU1llbUdRUG5ZNTZu?=
 =?utf-8?B?NTJSVzFWL0NWbXdjWG5veEhPL3FsYXpSSnVIdkRWY0VhVzJ1dCtLanFSTVo5?=
 =?utf-8?B?ZFN5eHl6ek1sQmFSem1DaUxUK0U0MWMyb0E2MzJpcnhSbFY1QlFCekpSWWNQ?=
 =?utf-8?B?VFVXR0o5YWtJNmxHK2NGOGExZmRTeW5Ec2pDbzg0ZU56U1lyUGVQa1NyZ0JM?=
 =?utf-8?B?V21mYlpFLzFyVFNwenduMm9aTEptcUJ6MXpFQVFVWkt1cHpYRkFlZ0tyYm9t?=
 =?utf-8?B?SWlyUHpkUGpSaWZ1QzA2MERCYVcwemhqaXdXcCtKcW1IcVRRTElmLzRQZnA5?=
 =?utf-8?B?UEFqaDF2WHo4MzdQejNuR0FKNFpjbHVrQkw3MU5MQkRNcnNyRFgxQTlKdzB2?=
 =?utf-8?B?bG1oNmRzQzVsWVlzUHlRQy9ydUZ6ZGVlQmthc0RSTG5pMExMTFI5NktsRnpp?=
 =?utf-8?B?My9Ock0vWjVkRlo4TEtTYjJDWWUzWUZTMG42Y3FMSjc1d2Yvb216bnVKbHZL?=
 =?utf-8?B?bnkrTElEODdaUkxnSFVyNnUvZGtFQXdZbjdBS3RVWm9kL0ZEUjR1RnpqQndo?=
 =?utf-8?B?K3QrUXM3RjJSWVd1TVFTK3dWR1E1aE9mSjZaMDlTK3VJUVcvTUsxV0lIYit6?=
 =?utf-8?B?QkdFcER1Rm8wTS9iTDBsa1VPbFQ1NlhyRnI2N2wxMXBZaU83SnR5d1N3ai9z?=
 =?utf-8?B?MG9WeDBGRkF6d3dLSGNaOXh3TlcwcHJ3Rytwb0VtYk1vdGhRRDc1KzhqUXlv?=
 =?utf-8?B?SDZ1M1VtaWJnYXpjY2VUYkpaYmljMFY2Vm1mdFV4a20rS1Q5RGFYaW5kby9y?=
 =?utf-8?B?YjVPajFuckxWdUFSeDlicTkyQkRnZ0ExWitJMHdkRDN6VTF5MTMwZ24wQmtp?=
 =?utf-8?B?Nytxa1Z3V25BdU1vL3NtbEJZcDNQVjlBVy9Kdmc5ZzF5NUlRZUpnRUdJNXJk?=
 =?utf-8?B?NjQzaVgxK0xDOGRydEVqWGs3Vmpwdk1Jbnl6YU1ZVDVEUkRzaThCUTRJWEs1?=
 =?utf-8?B?bG0rcU0wekx2Q1daSkRzNEdYUzlVSDdQSEhRbkZFM3FCbUQwYVpQbjI2RmYv?=
 =?utf-8?B?Zkgvbm95a3VraXZyYlRZUURWZHdzcGtMdkVveUVGVFlVRzNTdXFZc09kTEZp?=
 =?utf-8?B?SFkvYWN0dmkxZXVtZHdKZEY0QzliTm5nUFpyZk5ZNFFibHM2eVFra2c2bXls?=
 =?utf-8?B?aUJIREVxNXFCSEZrS2ZxNnlwUkI5Y2RYVkJlZGZxSEh1dEpDVHlDQkJtT1ZY?=
 =?utf-8?B?akI0eFJvdEhYelE1WFNQSXUwY2ZrTzhCdDZxV2NXLzRXKzBkNUxWcUFnSHJ6?=
 =?utf-8?B?aDlOUE9qYTFOWmRNR0xaL2tzbTlsZGdEL2tjZE5XQldtYmJnclVWWnIwQzZL?=
 =?utf-8?B?WkpGNWlUZEdIUDdEMHp5eDZ4NUx0NWRvZmwzSTZyWDUyQ2luNG5TelozZTBa?=
 =?utf-8?B?ZjBtNnQ3SmU3RHhyaXNPQzFQK3pZQk15SHZ4Y0xmTFhSU25FTTVPQlQ1VjhE?=
 =?utf-8?Q?YgOumf6vtLw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UndjZlFpd21PK0NYUWdYK1pSQ2NzZFJaWlRxL2w1WXc4bCtpcnV5U2IzUjRY?=
 =?utf-8?B?TVpLemhxbmRYVFFvWTV2cnZSbFFvTDIyUVlQclBRRXhVYTBiUnFPUEFJU0Zx?=
 =?utf-8?B?SHhsTlVNaXZ2QTN3MkF0ZkE1U3NJWXBHbFB4ZkFac1diRVhJaFVhQUk4YTNL?=
 =?utf-8?B?d0VFZEFqK0NJSDZxem5RbVBBTGpkM3pGVjgvbHFCaGZnTW9OVlR3aUNIdXRn?=
 =?utf-8?B?Yk9iOUJUQXdJZDJLYUdLQURoOVpvNkJQV2xXY0ZMTG04MGVKS2w1ajJVODlW?=
 =?utf-8?B?R210d2J0c2I2Y1l4Z0JVeVZXTFRjMG40b3AwS2h2eWYxT1hWVGFaOURETmR5?=
 =?utf-8?B?TmFLRFZqcVpRakhWR0xKKzNsTHQ0UlJtUFpmdXhVTHkxLzR5YUtDQUJkcy9x?=
 =?utf-8?B?WmdCN2RUTG1SWTNwZWVyZW1USnRtT3hrcHdDL2hhM3dwY3Z3NXZHS1R1RDNu?=
 =?utf-8?B?UzhSdlNGZnNDaWtqRlQ2SnlvOHZrQnRiRDJ4MDR6NnloWEROdXBSZThHemJt?=
 =?utf-8?B?eGN0TFZGVldyZFlVQWhFZDFaa2ZrTGhINjFYNXBvZXVqTEl4TFRNcGF1N0RR?=
 =?utf-8?B?dCtJUE5sZjNaVUwxUjJPVWJqMGE4OCtzWUhQVngyQ2Rmb21DTlQ2c0o5NUR2?=
 =?utf-8?B?RlpEdFR1OWJlRk5oWHh1Q0NEdWtZOGRWNmJXbjcyOVkxZGJCRUlZZTB4clZl?=
 =?utf-8?B?eEhibFVCVm54TlI5KzRyeU1xaXdPWWpZYTYwYUlLSkdCSklQVXlKTmdKU2ZG?=
 =?utf-8?B?RzdOMjlHTXpiNFNmRmpxTVJoK2RMMUhBS2FRM2NhaUtUME5sM0dpcGpsTTY0?=
 =?utf-8?B?Tyt3SVRJcjIwUHdTTmlPcklUYmVsNk80RHhpNk9IVUNNb1p2MDN4bHFVR00v?=
 =?utf-8?B?L1hyRzBmUmtzdmNlVkFMSVdDY3RjaUpEeXhxNHJkV2JZV2c5c2dQYVE1dUtj?=
 =?utf-8?B?QnJzVzhudDlmVC9VVlA0d3ZwNUNOMW02ZTRHNXBnUTB5T25LVEV5R1QzWExu?=
 =?utf-8?B?OFNhaU5PWDBjREg2ZTdFSUcyV0tqeVl0cHFHcGUxYXpxb0x1MElkeVk2b2V4?=
 =?utf-8?B?Z0RwWmFFWXl3N1NWdml3M0N6bmhPTSsxNVZHNlZ4aVJNYURja01aNyt4RTMw?=
 =?utf-8?B?TEZlbjdoVHdkV2pHYkNyMFhIVDZaOWlXZVNWSHNpck5UbXk4dWdVYkdNOVJy?=
 =?utf-8?B?V0lyV2JBelhXTW5Ra3Z4eDE5b05iTVBBTTNvS0l0d2w2cUZ1YTI3L1F5TFFM?=
 =?utf-8?B?M0c3ckltZVFHK2pNVmZCNE1VL2tJczAzM2p5UzNQaHhaYmovYWZPQmh1M1Q1?=
 =?utf-8?B?V0NPT1NHOHFZbXMvcGJ0b1hham1JUEtZdytTVkoza0FNRTNjc1B0cTVtQTNC?=
 =?utf-8?B?MjVvT29lS0J3WkFQUXN3NUppb1hSRldpMWpXdnhjTWRqckRaeHFURThwMnlh?=
 =?utf-8?B?TURodXpOQjJ1QUtzSkdRajZhODhJUkwvQ3ZnTVZJMUxxUkpPVHlKUlQxV3FL?=
 =?utf-8?B?d0lDK1NSWXhndE0rK2Y0djFWVldTODlHZjFETG9LNGJmNGQyRlRjRGpqeDgy?=
 =?utf-8?B?dXJxWEV6U2dqbjFyVmhQTmdqb1l6cFh1Sk1WM2FpcFBFTjZYYWVmeGN4VjNM?=
 =?utf-8?B?OW14a3hQVTV1SFZ6eFdRSjZNVFhSOU9hNEJlMmJjWkI2V2hobjVQaVh6TEhG?=
 =?utf-8?B?bkNhRXNRcWMybWpWeThUTG9HNllhZC9EYlBid0MwYTliQmtuaGpaaWZVam9q?=
 =?utf-8?B?RW9kTzVmdm1NNk1DQjloMWI1MDNLbGo0bUsxRWxjZVNNcHdpNHJ0b0l4VWZa?=
 =?utf-8?B?Qnh1NVNhVGdILy9GNTdSVDFyTUVJcHJDVmZsOGoxMFFPS2R6aTFISHBXbTNw?=
 =?utf-8?B?dTQzUVRIdnJVL0lZY2dpRHJ4NGJTL0RqUitLOTFVdit6TiszVyt6cER0Qk1q?=
 =?utf-8?B?U2JFeWdpYWt3NzBCTVYya1JUQmExY2RjL3U2ei9CWFVWZ3pSaUMyTkJrd3NC?=
 =?utf-8?B?SytRVkJ3VU5rUjFlRzdxY2dVNkFlbG01OW9ucitJdkpMTzhDenFHWVpVTFRp?=
 =?utf-8?B?ZTlVcGJ4d0srZHBsS3djOVRXLzRheTFCWFc5cDdsY3JvK1dQdjRFRkZmK0xH?=
 =?utf-8?Q?FLjcf4IWpxwbedyOTSFV10kAK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b9ef02-ffeb-4eee-7818-08dc974c744a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 08:29:40.3521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E55l8+mgYc8VzdravPo67JgEDjFb8mzjErJQXIq4xxISF6TRrzA3VJGhzmY9CkSdnbQtOhJ8ju1FZT8FCygfrBSrIk73LXm6yXFVZKtbu4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6465

SGkgQ2FsdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAy
OCwgMjAyNCA5OjI0IEFNDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMDcvMTJdIGkyYzogcmlp
YzogRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzIHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZz
ZXRzDQo+IA0KPiBIaSBDbGF1ZGl1LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+
ID4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDk6MTMgQU0NCj4gPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cyB0bw0K
PiA+IGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4NCj4gPg0KPiA+DQo+ID4gT24g
MjguMDYuMjAyNCAxMTowOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgQ2xhdWRp
dSwNCj4gPiA+DQo+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+PiBGcm9t
OiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+ID4+IFNlbnQ6
IEZyaWRheSwgSnVuZSAyOCwgMjAyNCA5OjAzIEFNDQo+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMNCj4gPiA+PiB0
byBkZXNjcmliZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0cw0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+Pg0K
PiA+ID4+IE9uIDI4LjA2LjIwMjQgMTA6NTUsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4+PiBIaSBD
bGF1ZGl1LA0KPiA+ID4+Pg0KPiA+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+Pj4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+
ID4gPj4+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIwMjQgODozMiBBTQ0KPiA+ID4+Pj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBh
cnJheXMNCj4gPiA+Pj4+IHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4gPj4+
Pg0KPiA+ID4+Pj4gSGksIEJpanUsDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gT24gMjguMDYuMjAyNCAw
ODo1OSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPj4+Pj4gSGkgQ2xhdWRpdSwNCj4gPiA+Pj4+Pg0K
PiA+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+Pj4+PiBGcm9tOiBD
bGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4gPj4+Pj4+IFNlbnQ6IFR1ZXNk
YXksIEp1bmUgMjUsIDIwMjQgMToxNCBQTQ0KPiA+ID4+Pj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjIg
MDcvMTJdIGkyYzogcmlpYzogRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzDQo+ID4gPj4+Pj4+IHRv
IGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+IEZy
b206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzIHRvIGRlc2NyaWJl
IHRoZSByZWdpc3RlciBvZmZzZXRzLiBJbg0KPiA+ID4+Pj4+PiB0aGlzIHdheSB3ZSBjYW4gZGVz
Y3JpYmUgZGlmZmVyZW50IElQIHZhcmlhbnRzIHRoYXQgc2hhcmUgdGhlDQo+ID4gPj4+Pj4+IHNh
bWUgcmVnaXN0ZXIgb2Zmc2V0cyBidXQgaGF2ZSBkaWZmZXJlbmNlcyBpbiBvdGhlciBjaGFyYWN0
ZXJpc3RpY3MuDQo+ID4gPj4+Pj4+IENvbW1pdCBwcmVwYXJlcyBmb3IgdGhlIGFkZGl0aW9uDQo+
ID4gPj4+PiBvZiBmYXN0IG1vZGUgcGx1cy4NCj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogQ2xhdWRpdSBCZXpuZWENCj4gPiA+Pj4+Pj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4+Pj4+PiAtLS0NCj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gQ2hh
bmdlcyBpbiB2MjoNCj4gPiA+Pj4+Pj4gLSBub25lDQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+ICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMuYyB8IDU4DQo+ID4gPj4+Pj4+ICsrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+ID4gPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pDQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMuYw0KPiA+ID4+Pj4+PiBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jIGluZGV4DQo+ID4gPj4+Pj4+IDlmZTAwNzYwOTA3
Ni4uOGZmYmVhZDk1NDkyIDEwMDY0NA0KPiA+ID4+Pj4+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXJpaWMuYw0KPiA+ID4+Pj4+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJp
aWMuYw0KPiA+ID4+Pj4+PiBAQCAtOTEsNyArOTEsNyBAQCBlbnVtIHJpaWNfcmVnX2xpc3QgeyAg
fTsNCj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gIHN0cnVjdCByaWljX29mX2RhdGEgew0KPiA+ID4+
Pj4+PiAtCXU4IHJlZ3NbUklJQ19SRUdfRU5EXTsNCj4gPiA+Pj4+Pj4gKwljb25zdCB1OCAqcmVn
czsNCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gU2luY2UgeW91IGFyZSB0b3VjaGlu
ZyB0aGlzIHBhcnQsIGNhbiB3ZSBkcm9wIHN0cnVjdCBhbmQgVXNlIHU4Kg0KPiA+ID4+Pj4+IGFz
IGRldmljZV9kYXRhIGluc3RlYWQ/DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gUGF0Y2ggMDkvMTIgImky
YzogcmlpYzogQWRkIHN1cHBvcnQgZm9yIGZhc3QgbW9kZSBwbHVzIiBhZGRzIGENCj4gPiA+Pj4+
IG5ldyBtZW1iZXIgdG8gc3RydWN0DQo+ID4gPj4gcmlpY19vZl9kYXRhLg0KPiA+ID4+Pj4gVGhh
dCBuZXcgbWVtYmVyIGlzIG5lZWRlZCB0byBkaWZmZXJlbnRpYXRlIGIvdyBoYXJkd2FyZSB2ZXJz
aW9ucw0KPiA+ID4+Pj4gc3VwcG9ydGluZyBmYXN0IG1vZGUgcGx1cyBiYXNlZCBvbiBjb21wYXRp
YmxlLg0KPiA+ID4+Pg0KPiA+ID4+PiBBcmUgd2Ugc3VyZSBSWi9BIGRvZXMgbm90IHN1cHBvcnQg
ZmFzdCBtb2RlIHBsdXM/DQo+ID4gPj4NCj4gPiA+PiBGcm9tIGNvbW1pdCBkZXNjcmlwdGlvbiBv
ZiBwYXRjaCAwOS8xMjoNCj4gPiA+Pg0KPiA+ID4+IEZhc3QgbW9kZSBwbHVzIGlzIGF2YWlsYWJs
ZSBvbiBtb3N0IG9mIHRoZSBJUCB2YXJpYW50cyB0aGF0IFJJSUMNCj4gPiA+PiBkcml2ZXIgaXMg
d29ya2luZyB3aXRoLiBUaGUgZXhjZXB0aW9uIGlzIChhY2NvcmRpbmcgdG8gSFcgbWFudWFscw0K
PiA+ID4+IG9mIHRoZSBTb0NzIHdoZXJlIHRoaXMgSVAgaXMNCj4gPiBhdmFpbGFibGUpIHRoZSBS
ZW5lc2FzIFJaL0ExSC4NCj4gPiA+PiBGb3IgdGhpcywgcGF0Y2ggaW50cm9kdWNlcyB0aGUgc3Ry
dWN0IHJpaWNfb2ZfZGF0YTo6ZmFzdF9tb2RlX3BsdXMuDQo+ID4gPj4NCj4gPiA+PiBJIGNoZWNr
ZWQgdGhlIG1hbnVhbHMgb2YgYWxsIHRoZSBTb0NzIHdoZXJlIHRoaXMgZHJpdmVyIGlzIHVzZWQu
DQo+ID4gPj4NCj4gPiA+PiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgSC9XIG1hbnVhbD8NCj4gPiA+
Pg0KPiA+ID4+IE9uIHRoZSBtYW51YWwgSSd2ZSBkb3dubG9hZGVkIGZyb20gUmVuZXNhcyB3ZWIg
c2l0ZSB0aGUgRk1QRSBiaXQgb2YNCj4gPiA+PiBSSUlDbkZFUiBpcyBub3QgYXZhaWxhYmxlIG9u
IFJaL0ExSC4NCj4gPiA+DQo+ID4gPiBJIGp1c3QgZm91bmQgUlovQTJNIG1hbnVhbCwgaXQgc3Vw
cG9ydHMgRk1QIGFuZCByZWdpc3RlciBsYXlvdXQgbG9va3Mgc2ltaWxhciB0byBSWi9HMkwuDQo+
ID4NCj4gPiBJIGludHJvZHVjZWQgc3RydWN0IHJpaWNfb2ZfZGF0YTo6ZmFzdF9tb2RlX3BsdXMg
YmVjYXVzZSBvZiBSWi9BMUguDQo+IA0KPiBNYXliZSBtYWtlIHRoZSByZWdpc3RlciBsYXlvdXQg
YXMgcGVyIFNvQw0KPiANCj4gUlovQTEgLS0+ICZyaWljX3J6X2FfaW5mbw0KPiBSWi9BMiBhbmQg
Ulove0cyTCxHMkxDLFYyTCxHMlVMLEZJVkV9IC0tPiAmcmlpY19yel9nMl9pbmZvIFJaL0czUyBh
bmQgUlovVjJIIC0tPiAmcmlpY19yel92MmhfaW5mbw0KPiANCj4gVGhlbiBleGNlcHQgUlovQTEs
IHNldCBGTVAuDQo+IA0KPiBDdXJyZW50bHkgcmVnaXN0ZXIgbGF5b3V0IG9mIFJaL0EyIGlzIG5v
dCBtYXRjaGluZyB3aXRoIEhhcmR3YXJlIG1hbnVhbC4NCg0KT25lIG1vcmUgdGhpbmcsIEZyb20g
cmVnaXN0ZXIgbGF5b3V0LCB5b3UgY2FuIGRldGVjdCBTT0MgaGFzIEZNUCBjYXBhYmlsaXR5IG9y
IG5vdA0KU28geW91IGRvbuKAmXQgbmVlZCByaWljX29mX2RhdGE6OmZhc3RfbW9kZV9wbHVzLg0K
DQpDaGVlcnMsDQpCaWp1DQo=

