Return-Path: <linux-i2c+bounces-4440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979B991B915
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A45601C227A3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B8C145A1F;
	Fri, 28 Jun 2024 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N1MwPNKa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2078.outbound.protection.outlook.com [40.107.113.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA56E13AA40;
	Fri, 28 Jun 2024 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561353; cv=fail; b=TuWM70zs+uIUqKZVfN0ZM0i+sOtw1v7NOYWYwkXpiSNpxYruagQiDotIfwDoARVzNl92OBjpbsYYcYq7CH0hHm3LQm10i2K9V9kSq684+3Hn8t1S7KL6UEZ8wXBnztayp7DyFFP6V1y000MMlLEwpsNbWUs2Uw4lzsQ2udWh8dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561353; c=relaxed/simple;
	bh=1p8hnl+X3UytbwBdze0jR+HjW+vAnFicHgdf+nAbs3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rUsC3sDBTS1jPCF8bv/el2eIEw3FxL36dELcokJLkimHkkbceEgeMJi3bYGIZvjDrGVa/9zUNJ3mS95W5IC7OtPanGAwG7TcJau19HdFmchANso1UvGaHfwW2ZICFhzcfNrXGYAZ+/EOqfbHmlSlhw+1AatGc/7Vk1pXUZto7ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N1MwPNKa; arc=fail smtp.client-ip=40.107.113.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE7aCgmQkakHFyfsg6wWS8PzT4b1bQretFzf67qQRxqJzad5dDj0Ce15fvQ+osXhwR5OZ1TKlTy5W4lYLhuc56OyuGM8kZJqa4vXYZ5P49jCSN2r5WHJSjRDhFMZeYl3WuWFf7OPXERD/ahK5X6uNl4+BfAWOit0ifeUavxO7BBGw6sGvxuH2yq1kzMUhffHd3cZnsy8KtiJqnn42ONO17nciGC8BOPQsbP7MGMjiBhpsSAthHhUMhrHfbfoCCzfhT2XEOpbfKn3+dhmFUBvLq0bBC/3vIVvjrlk2IISraeboj9BeBWtNwl+XSVtitSwp+Q39W/6+YFTqZ175fCO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p8hnl+X3UytbwBdze0jR+HjW+vAnFicHgdf+nAbs3A=;
 b=b17meBbtTNQTzYnr27oFzlL3I4gwBoJ0IKcF6foaUmDoLq259WWwGOqwGjwFiAGdDcfEvSCPeeHG6+gxjHTMvtnx5ryVIHZPHe42DWD1RrRpi6KBuPOjd/nCVOWjQHG6u/FdvAsVyMNH5o/WYsM5JpuPCMfR6xCFP+7mtTm5meDZ0H/0r4QtDKSbqdxJooz9Un5C14s6rzI5/80JqB2vLhQSgNNYw93LABlEFPgaTyQ1SAZUkxnVhdFG7u/gHGQNsdBngDTWq3527/TOatpJLjfpR4mr0e4D7mEqLvmAUx78RfJp4fCSQzxZWuxld3JotTLFlK1gwM0i52EPWxkzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p8hnl+X3UytbwBdze0jR+HjW+vAnFicHgdf+nAbs3A=;
 b=N1MwPNKaQ7gKlyw6rUBNh8+K6qIo6IrqUMVUjxwSJJIvQ6utqhqHwWUWsevykXXR/YdvicEW2S2gZbe+prHSo8cBjKI+zSsg2f7nKmd4dt70F/7vqPDlsk2CPInQ/gnUNV7uJdOPwUmR9spChMM1Oz5hvdBPiiuqs2TJTjIOAdI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7969.jpnprd01.prod.outlook.com (2603:1096:604:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 07:55:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 07:55:44 +0000
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
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index: AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcA==
Date: Fri, 28 Jun 2024 07:55:44 +0000
Message-ID:
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
In-Reply-To: <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7969:EE_
x-ms-office365-filtering-correlation-id: 7b633544-963c-446f-f91b-08dc9747b702
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?cWJtVVQwQzF6dEVhQmNWeDNhMGJJMUJnNWZVazBGbGx0YnBPZHVobENxRGZx?=
 =?utf-8?B?RFFpeldlTDk0ZjIyMVVJaThlZk5VeGtKcUdwYk9IbDdYRE5pMGlqNzBRSDM3?=
 =?utf-8?B?TnQxaWpaaW5jcDBpVldwVkNPWnllL0VPNmF4ei9oSU1qSTUzZUpQcXdhMHN6?=
 =?utf-8?B?NnBReUYxdExOTWhYZWozOHd0NnptdWc1QkdLbjBBc3FOQW1pU1l0cnFRVEFy?=
 =?utf-8?B?ZHlrWVRjK3k1djVhczVYd0xrMjNSTmFLS0pVdVJTbkt2cVRsQ0VqV3hGdHZY?=
 =?utf-8?B?eWJqWFduaEV6MFNuWFgyMlNHL1Jvanl1eFI1Q29iYVZ5UVIzMmZMRi9STmFG?=
 =?utf-8?B?RW9hd1ZRWjRBSlZ4Rnd3TkcvdDhmTFZkNkJoVktIWGxydmN6a0JBeUNvVTh3?=
 =?utf-8?B?L2tmaG1VZkdEQzlQQzhaOVlCNGJpVXhvV29EVithR2xDTkxHbDRNekFEYnAz?=
 =?utf-8?B?dzg4RnZwOU5JeVVFVHJNV2lPelcrSFpvQ1hST1U3a0VUUCt4eWl3MU5qT2tL?=
 =?utf-8?B?ODE0VWNqbEZYeDR5V3J1T1RtYjRqU2I5b2lYYytjSSsydHl0ZHFJMUEzUC91?=
 =?utf-8?B?MkhDOWQxRjR6VEliZGoxQUFHYTBONFpYNnMxMmIySjVVcGRjTjBsRlJJaWVS?=
 =?utf-8?B?U0ZBOEdBRGdhNDFLUzZBSXJweG4yK3JSeWxCL3B5MERuczlSQ0F2RTI2REVP?=
 =?utf-8?B?VlRsb1RtTzNFcy9hNHB0dG1vSkUxWHBReGZoZXB6bTgwYW9JQnJhUFdLQXc0?=
 =?utf-8?B?WjAvRG5VRDA4SS9GRitFUk12UG9RUWI5REhjRzVrTS8xRGlaK212TXJ3U2ph?=
 =?utf-8?B?Q0I3SlE0STV3LzF3YmUxYk95bU1pay9tMGI4TkNIQ2kwRDh5NnczM1pOcitj?=
 =?utf-8?B?WFcvSWh4OEFLSDQ3c2NMZkdWVzJEZVlpNFRPQ29oSmkxNFl0WjBPM0pyS3gx?=
 =?utf-8?B?akpKL0c5S2Ivai9Gc1VHUk5qM1pwK1BwQUEycXZ3Ty96akdnZEVTVEZTV2Uv?=
 =?utf-8?B?L0dTQ3pZam9zUWtnU3RtOTlsbWwyMEoxS25GTTcrK28zeUJ1VktGbG9iVEZN?=
 =?utf-8?B?b2hHN0EwNENtK2lEak1YU1BqRnN0clA0RzhMZmFCcnFvdU01ZEx4WUdjOU00?=
 =?utf-8?B?WmIrblNFZVVyMU5UOU55bWNQclJoUFBFTnN5U3MvM3pTb1JvRk82Nm1zWHVV?=
 =?utf-8?B?ZmZwR0xDTkZBNXFibVZoT0dqaFYvdVVsRXd4TjNsV3ZRcHY4ZCtHMUMyVlBX?=
 =?utf-8?B?ZjgvMm5GRlY2OFBBVFlTdjNMSkFkYm5YaXlFUTQ3ZzdjdXh3bVd5c2FSRmJD?=
 =?utf-8?B?SVBldnQ4Q29YNTFuK2w2Q3Noak41eWs5Y2tFWlQ2c24waHdLcU4yRVVNVVRj?=
 =?utf-8?B?MTB6WE4zNUFtdkZ6emNpSHJjN1RNcUcyalBSak1HL0pWVk4xbHJkSmZUa0Nq?=
 =?utf-8?B?cXo0endlbklScXBFWE1ldURrWDhLZXdkZmFpUGhPTi9oejYrN0h6UnhYUXpF?=
 =?utf-8?B?djBPSWNCUmNsWERKa1BsWUIva215dzgrdXhUcjdvZ2E1TmdzZnY3YTR5K0p5?=
 =?utf-8?B?a0xQRVNnZSsycmg5Z2ZYUHFta0ZmR3VUdHQvd3p5Tnlmcm4wTnVDSjFEeGZ2?=
 =?utf-8?B?Q1M0Qi9wS2o4clJVb2lYcmdQbFc1QmhWZmdoSUVXUjFTc0tNUzBJbFlCdXBB?=
 =?utf-8?B?K0E0OG9HNVFnbGdpMEtIbVpaWlcyS1RNeUR1aGJpb05PMDhsNHFMV1l3Q0xC?=
 =?utf-8?B?aThxTzk0eE5QeFo3dXROYnlnMUY1WElTbFRFSzlLczhsM01OZWtJMUkyMnVm?=
 =?utf-8?B?MFdtTktCU2YvandzUW1yZWFPYmc5RDQ4d0lpYlJJS2JPQTc4LzJ1N3FLZnV1?=
 =?utf-8?B?Zm0zcjdwbU5pNHJUdFpkVjFkZjM3OWVpQ1JyaVpMRlFFN1MwZmpYQXg5WUJs?=
 =?utf-8?Q?q1iz912m8qI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUM4clFPVGFVbkI1NmRJS1FZVmN5NlhqUE0zWFFkVy9FNjdickdoaTU5SEll?=
 =?utf-8?B?UFQ3YkxQU1YyelA2anpUTDRFUTZ0cU5wL013ZWdtbUhZWEhEdGdVMVk5WHMy?=
 =?utf-8?B?bGlqaVhMWUx3T1pLb1FvZjZQTkNUOWw3ZC9WZUV3TXZKTGJhM0xick5ZQ3ZK?=
 =?utf-8?B?a2NTUlhNcWZQaE52TEN1cWxWQmxMS1pxZmRXYkNST2hSemxkbDJ3NU9Hem4w?=
 =?utf-8?B?VHd1STNaeEVQNkpGWjZHNFVnSmxlZVBVVlVYRnhsOWFzdHprNTdhdnJxRXNI?=
 =?utf-8?B?YjUrM1R0czloSStDTVBrNHhFc3Avb1F4MWN6TDVpRlNHMFRPNXQyekZzMkYv?=
 =?utf-8?B?NUxjT3pyZG91SlA3M0JIanJvdUxOZVVCUk5Tb3BoMi9DTFd6VFNZZ29HUW5n?=
 =?utf-8?B?UmFZckY5REM2MytFekJqd0xtWUc5cG01MVJSQUIya3V1ZFhkbjh6cVBPTWs4?=
 =?utf-8?B?TTNYaGhEb251dFRLSHp3Q2lNT2ZzbUZJVE80MTdQbXpTWVpZMERJM0JjUHJ5?=
 =?utf-8?B?TWJPZGVNR0NlalpCdjUzZGwrcXNCYStjRW5CcUl4b3Jackl5dkdzSlN2OXhU?=
 =?utf-8?B?RFNJMStlTTB4RThiQVZKMW5rc2VNQXdOc21ja214dFlCQmYyYmR0YS9CL3N1?=
 =?utf-8?B?a2VvM05HQXBvVHlQUS85OHNtMlpBeUswVDQ0NFZac0wzalgwLzZtUnRSMy9N?=
 =?utf-8?B?bmtpeWNxWnNZZ01qRGpkcXg5dlZweFoxWHFDaEFlS1lFWlo5dWtBRXJiWFRY?=
 =?utf-8?B?dnl1U0N2OXhIQmR5UDBjdC8wQzlmU1hsOEhuYmJ1M2dFcGFRNGFoSk5uK2N1?=
 =?utf-8?B?WUNYZW9xUmkrZ0pZb0c2UkVoZmFDWnQrWnJxRXJYV3RsM3pyTFNTS3dvclJ6?=
 =?utf-8?B?cVkxSEwzbGFtTkZac3I5T2d6bmhDZEMxWEF5NUI2TVo0Q3ZhVWtWN0oraDVX?=
 =?utf-8?B?WkNyQjBZbzZiWFZiWk5VYjRKWWFCSW1obkZWTzdaNm9Penp3QXFHWGZRb1Jn?=
 =?utf-8?B?Y0hwdFArN096U2YrUHN3ek5sa284bkp3cmt6UFJWcTNncG9VYld4ZGd3RnVN?=
 =?utf-8?B?UnpMSkNaZ3pIeDhGMzZZV2Qwb29ldFNzbU1xTVV1QUl3SUFPN1IwZXlZNS9R?=
 =?utf-8?B?dG5jM0tDZXpKWjRYNUxvOGh0aGtEWElnOThLZ0c5dWsxaHhUWjZMM2N1blor?=
 =?utf-8?B?Y2xCZ2J4dzFrV2xqTCtNOVo5eEplNVo2VWx5ZXNFamExNWRSYlE1NCtrUzlN?=
 =?utf-8?B?eGpmSjNaL1kvc3NiSzhiSmprUUd5ZHZjNGRnTElySzRlakt0eXVOekkrTERU?=
 =?utf-8?B?MVRtWk02YjVXQ1AzMm9EbE9VMCtkNjk4Sjh4YUU1OEluOE1WU1ZZNnFjSjkw?=
 =?utf-8?B?aWsxQzNSUGx6cVJHeXBBUzQvbGcxaDJWRitDM3NuckI0QmJMMFBSb3NOYzkr?=
 =?utf-8?B?SjFhekUzSTJxbGJkWW8yS1BLTFlCRCt5VmF1OEttekdEM25TQVlzakFNRFgz?=
 =?utf-8?B?R0NSYk5mdlpzcEhTQnorMG5GbVoyMTZ6dGZPR0g5N1p4MXA4Q1FRZmtYQUhn?=
 =?utf-8?B?R0NKbjFLZ0RacFY1cnRZZnM4b2dKOW0rREtxdmdJVFhFK0hKdVE1QnVsMkZJ?=
 =?utf-8?B?bnlaczBreXBNNThaYm9lZ0VXUjRpVTRnVkJndzh0L29UMG1OOGZFQTlPa0Na?=
 =?utf-8?B?ZWZWSGVrY1RKZnBNODZxMExoMkp2RUw5V0R4anZPeVJGZWpSa1d5b1c1R2RD?=
 =?utf-8?B?ZHQzMmFUclFPSXp0RlR2Q0I1Mkdpalc3MFFWMU9aMHoyeldKQzZrTzlIR1Vt?=
 =?utf-8?B?SWcvNjNzRVF2NzFXYkZ4YmNaMTl1RlBiamh0b3pmZDVPMzllVHBVVU9rTm81?=
 =?utf-8?B?bzZPOFNuTmNjRStUcjhmSXNDUVJkS0pGYjBJUVkwSzNPTTRRMDcwdUJOSFhs?=
 =?utf-8?B?bVNZQmhDeHh3UllreXRhRC9RZXlSbkt2MXhSNkhjZU9HMGVaOGdhc2tIZUZQ?=
 =?utf-8?B?dVhiQnNBTmJ3cGhreVpCVGIyQy9aUGJQU1pWa1RtelBlRk1GRDloTnNCajl0?=
 =?utf-8?B?czlEZWZiY3A5d3A0N3VtdCtmbVh5SlFMbmtvc3N0ZW5ObGF4cE50WnpFd3Vw?=
 =?utf-8?Q?IUwTOQcQqowFlZdwKAFqGst/w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b633544-963c-446f-f91b-08dc9747b702
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 07:55:44.8513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgOyc6AGiPThrtYg0QAnfbztysZhlhs1ng7BgX2H4Ubv4MuqgpXDE2IybD1wG2mEKm5bQU2Ax2h8qrNYl8E8bHrKhrR9g1Cp2MWcxPSHAy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7969

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjgsIDIwMjQgODozMiBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6
IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cyB0byBkZXNjcmliZSB0aGUgcmVnaXN0ZXIg
b2Zmc2V0cw0KPiANCj4gSGksIEJpanUsDQo+IA0KPiBPbiAyOC4wNi4yMDI0IDA4OjU5LCBCaWp1
IERhcyB3cm90ZToNCj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4N
Cj4gPj4gU2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4+IFN1YmplY3Q6
IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8N
Cj4gPj4gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4NCj4gPj4gRnJvbTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+
PiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNl
dHMuIEluIHRoaXMNCj4gPj4gd2F5IHdlIGNhbiBkZXNjcmliZSBkaWZmZXJlbnQgSVAgdmFyaWFu
dHMgdGhhdCBzaGFyZSB0aGUgc2FtZQ0KPiA+PiByZWdpc3RlciBvZmZzZXRzIGJ1dCBoYXZlIGRp
ZmZlcmVuY2VzIGluIG90aGVyIGNoYXJhY3RlcmlzdGljcy4gQ29tbWl0IHByZXBhcmVzIGZvciB0
aGUgYWRkaXRpb24NCj4gb2YgZmFzdCBtb2RlIHBsdXMuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+DQo+ID4+IENoYW5nZXMgaW4gdjI6DQo+ID4+IC0gbm9uZQ0KPiA+Pg0KPiA+
PiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgfCA1OA0KPiA+PiArKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMu
YyBpbmRleA0KPiA+PiA5ZmUwMDc2MDkwNzYuLjhmZmJlYWQ5NTQ5MiAxMDA2NDQNCj4gPj4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPj4gKysrIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1yaWljLmMNCj4gPj4gQEAgLTkxLDcgKzkxLDcgQEAgZW51bSByaWljX3JlZ19s
aXN0IHsgIH07DQo+ID4+DQo+ID4+ICBzdHJ1Y3QgcmlpY19vZl9kYXRhIHsNCj4gPj4gLQl1OCBy
ZWdzW1JJSUNfUkVHX0VORF07DQo+ID4+ICsJY29uc3QgdTggKnJlZ3M7DQo+ID4NCj4gPg0KPiA+
IFNpbmNlIHlvdSBhcmUgdG91Y2hpbmcgdGhpcyBwYXJ0LCBjYW4gd2UgZHJvcCBzdHJ1Y3QgYW5k
IFVzZSB1OCogYXMNCj4gPiBkZXZpY2VfZGF0YSBpbnN0ZWFkPw0KPiANCj4gUGF0Y2ggMDkvMTIg
ImkyYzogcmlpYzogQWRkIHN1cHBvcnQgZm9yIGZhc3QgbW9kZSBwbHVzIiBhZGRzIGEgbmV3IG1l
bWJlciB0byBzdHJ1Y3QgcmlpY19vZl9kYXRhLg0KPiBUaGF0IG5ldyBtZW1iZXIgaXMgbmVlZGVk
IHRvIGRpZmZlcmVudGlhdGUgYi93IGhhcmR3YXJlIHZlcnNpb25zIHN1cHBvcnRpbmcgZmFzdCBt
b2RlIHBsdXMgYmFzZWQgb24NCj4gY29tcGF0aWJsZS4NCg0KQXJlIHdlIHN1cmUgUlovQSBkb2Vz
IG5vdCBzdXBwb3J0IGZhc3QgbW9kZSBwbHVzPyBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgSC9XIG1h
bnVhbD8NCklmIGl0IGRvZXMgbm90LCB0aGVuIGl0IG1ha2Ugc2Vuc2UgdG8ga2VlcCB0aGUgcGF0
Y2ggYXMgaXQgaXMuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gS2VlcGluZyBzdHJ1Y3Qgcmlp
Y19vZl9kYXRhIGlzIG5lY2Vzc2FyeSAodW5sZXNzIEkgbWlzdW5kZXJzdG9vZCB5b3VyIHByb3Bv
c2FsKS4NCj4gDQo+IFRoYW5rIHlvdSwNCj4gQ2xhdWRpdSBCZXpuZWENCj4gDQo+ID4NCj4gPiBp
ZSwgcmVwbGFjZSBjb25zdCBzdHJ1Y3QgcmlpY19vZl9kYXRhICppbmZvLT5jb25zdCB1OCAqcmVn
cyBpbiBzdHJ1Y3QNCj4gPiByaWljX2RldiBhbmQgdXNlIC5kYXRhID0gcmlpY19yel94eF9yZWdz
IGluIG9mX21hdGNoX3RhYmxlPw0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUNCj4gPj4gIH07
DQo+ID4+DQo+ID4+ICBzdHJ1Y3QgcmlpY19kZXYgew0KPiA+PiBAQCAtNTMxLDM2ICs1MzEsNDAg
QEAgc3RhdGljIHZvaWQgcmlpY19pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ID4+ICAJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZChkZXYpOw0KPiA+PiAg
fQ0KPiA+Pg0KPiA+PiArc3RhdGljIGNvbnN0IHU4IHJpaWNfcnpfYV9yZWdzW1JJSUNfUkVHX0VO
RF0gPSB7DQo+ID4+ICsJW1JJSUNfSUNDUjFdID0gMHgwMCwNCj4gPj4gKwlbUklJQ19JQ0NSMl0g
PSAweDA0LA0KPiA+PiArCVtSSUlDX0lDTVIxXSA9IDB4MDgsDQo+ID4+ICsJW1JJSUNfSUNNUjNd
ID0gMHgxMCwNCj4gPj4gKwlbUklJQ19JQ1NFUl0gPSAweDE4LA0KPiA+PiArCVtSSUlDX0lDSUVS
XSA9IDB4MWMsDQo+ID4+ICsJW1JJSUNfSUNTUjJdID0gMHgyNCwNCj4gPj4gKwlbUklJQ19JQ0JS
TF0gPSAweDM0LA0KPiA+PiArCVtSSUlDX0lDQlJIXSA9IDB4MzgsDQo+ID4+ICsJW1JJSUNfSUNE
UlRdID0gMHgzYywNCj4gPj4gKwlbUklJQ19JQ0RSUl0gPSAweDQwLA0KPiA+PiArfTsNCj4gPj4g
Kw0KPiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCByaWljX29mX2RhdGEgcmlpY19yel9hX2luZm8g
PSB7DQo+ID4+IC0JLnJlZ3MgPSB7DQo+ID4+IC0JCVtSSUlDX0lDQ1IxXSA9IDB4MDAsDQo+ID4+
IC0JCVtSSUlDX0lDQ1IyXSA9IDB4MDQsDQo+ID4+IC0JCVtSSUlDX0lDTVIxXSA9IDB4MDgsDQo+
ID4+IC0JCVtSSUlDX0lDTVIzXSA9IDB4MTAsDQo+ID4+IC0JCVtSSUlDX0lDU0VSXSA9IDB4MTgs
DQo+ID4+IC0JCVtSSUlDX0lDSUVSXSA9IDB4MWMsDQo+ID4+IC0JCVtSSUlDX0lDU1IyXSA9IDB4
MjQsDQo+ID4+IC0JCVtSSUlDX0lDQlJMXSA9IDB4MzQsDQo+ID4+IC0JCVtSSUlDX0lDQlJIXSA9
IDB4MzgsDQo+ID4+IC0JCVtSSUlDX0lDRFJUXSA9IDB4M2MsDQo+ID4+IC0JCVtSSUlDX0lDRFJS
XSA9IDB4NDAsDQo+ID4+IC0JfSwNCj4gPj4gKwkucmVncyA9IHJpaWNfcnpfYV9yZWdzLA0KPiA+
PiArfTsNCj4gPj4gKw0KPiA+PiArc3RhdGljIGNvbnN0IHU4IHJpaWNfcnpfdjJoX3JlZ3NbUklJ
Q19SRUdfRU5EXSA9IHsNCj4gPj4gKwlbUklJQ19JQ0NSMV0gPSAweDAwLA0KPiA+PiArCVtSSUlD
X0lDQ1IyXSA9IDB4MDEsDQo+ID4+ICsJW1JJSUNfSUNNUjFdID0gMHgwMiwNCj4gPj4gKwlbUklJ
Q19JQ01SM10gPSAweDA0LA0KPiA+PiArCVtSSUlDX0lDU0VSXSA9IDB4MDYsDQo+ID4+ICsJW1JJ
SUNfSUNJRVJdID0gMHgwNywNCj4gPj4gKwlbUklJQ19JQ1NSMl0gPSAweDA5LA0KPiA+PiArCVtS
SUlDX0lDQlJMXSA9IDB4MTAsDQo+ID4+ICsJW1JJSUNfSUNCUkhdID0gMHgxMSwNCj4gPj4gKwlb
UklJQ19JQ0RSVF0gPSAweDEyLA0KPiA+PiArCVtSSUlDX0lDRFJSXSA9IDB4MTMsDQo+ID4+ICB9
Ow0KPiA+Pg0KPiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCByaWljX29mX2RhdGEgcmlpY19yel92
MmhfaW5mbyA9IHsNCj4gPj4gLQkucmVncyA9IHsNCj4gPj4gLQkJW1JJSUNfSUNDUjFdID0gMHgw
MCwNCj4gPj4gLQkJW1JJSUNfSUNDUjJdID0gMHgwMSwNCj4gPj4gLQkJW1JJSUNfSUNNUjFdID0g
MHgwMiwNCj4gPj4gLQkJW1JJSUNfSUNNUjNdID0gMHgwNCwNCj4gPj4gLQkJW1JJSUNfSUNTRVJd
ID0gMHgwNiwNCj4gPj4gLQkJW1JJSUNfSUNJRVJdID0gMHgwNywNCj4gPj4gLQkJW1JJSUNfSUNT
UjJdID0gMHgwOSwNCj4gPj4gLQkJW1JJSUNfSUNCUkxdID0gMHgxMCwNCj4gPj4gLQkJW1JJSUNf
SUNCUkhdID0gMHgxMSwNCj4gPj4gLQkJW1JJSUNfSUNEUlRdID0gMHgxMiwNCj4gPj4gLQkJW1JJ
SUNfSUNEUlJdID0gMHgxMywNCj4gPj4gLQl9LA0KPiA+PiArCS5yZWdzID0gcmlpY19yel92Mmhf
cmVncywNCj4gPj4gIH07DQo+ID4+DQo+ID4+ICBzdGF0aWMgaW50IHJpaWNfaTJjX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQ0KPiA+PiAtLQ0KPiA+PiAyLjM5LjINCj4gPj4NCj4gPg0K

