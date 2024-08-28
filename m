Return-Path: <linux-i2c+bounces-5836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC550961C29
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 04:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B3B283F7C
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 02:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D5041A8F;
	Wed, 28 Aug 2024 02:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="MaTa8cxR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BC288B1;
	Wed, 28 Aug 2024 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812493; cv=fail; b=lgq5Z6a4xL45H9z7JyunYqpJ5iNpWPHWbpFG6gcW6iyzly+aZbny7jvHrVhm320NAM0mP3r3Q3mDamoWZVh0AzCnvadxsP1qfutaazmwyVDrreJIwP8D+XLlx5hqACEZhZI3zaTyehenxhI/7B1Q+TJ9CXPvg+tBWF2MYRuk5Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812493; c=relaxed/simple;
	bh=/c60EITzT/gASQI0L5V/7ys50SUGtLW+IM3rEcvBJ7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o3xTPWGyV/oOKkjA8Iwy6goQl76ihG5WmUcJLXKJeDWPAHM1V/VCMfzLaGswfaWH9voG5hIlleqB33oE6wdhffg8m8GJLkTzSbL7rB9fMKNFFp843eR3gevXPkGybb4T5K6yqGk55oKZTT2ThK0a8oL7FdDXiYzy7ijWv7BIJ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=MaTa8cxR; arc=fail smtp.client-ip=40.107.255.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6A1YK/ceWJLxit6jqVklePN7okBkhP60cOexwp+b2+u6pfYMrIauY1bk2bj2qWk/DXmgQuKGc4kdcM5oCTeNs9zgqsJgaxyJ7NpFM1JGS7Eket8yOZlcf3vnzeeHlw8leFbu65lDQcI6lTny8b7nXHI03OoVfZ0HvBzerjFX6kUo+jFL9xPWTOJLvzdjY6UqofEArTvMXjzwdgbV9gkiruRZSe4QVGEarR1zqa+kbXXPK1ChFm2TTtgKYv44+GcknAizLinHsPHqvgP8Fm2ANPFFAAgLJlwccQ427gpUzlYQT2Vv47t39f1qLP4eS72puT1uTjALyMbnYO7zBFcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT/+Mk0EZsn5ssnt1WExj+UnUSsLOOYKRw0/dX+GtPU=;
 b=XOhNhBxD/xNtshPMVS/MSEerYLaZq6wj85F8voCDTFRBb/lc95NJ9dH4DrEbeAGuhLbKRPH/ryHhN04G+ZbeMLFwtooY+eKrfu6NKhOH+Ou9ZNb5efr8NMj8Y6yz21kzftPvKXNqr+W6RI0fhPxMJnk8fPBS9WBXac6RAxSyP8G3XFSNA6n8PG3YSnYo6e0Ly7cvVzkinKaDPjtNCu8tfIogK/FzDCWOL57M72Ij4VpZkq+3u/KUqBhJpT9aORVFAf8lGdfO4kCERyvQTo+sGu1wD2jjfGYMmDDOjI3cZbZN4qMKBQpI4ZK8FnN6zeRB1k8B6eu+U6UGdQYw+jkatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT/+Mk0EZsn5ssnt1WExj+UnUSsLOOYKRw0/dX+GtPU=;
 b=MaTa8cxR9eO1C29RGA7kqKYiwv7VH2ShsEK+HRKPmGi0t8Ml+TPHy90O2vz3esS/r5HgLWNNiDQH64ZrLa2ERJLrzSzW/yXzYIkDFkZZUuYY4Buc+Zs45uL3iYTQ5gSJxfSVZlY8Gc+W2/Ek33jdjnzOzengrpDY5m/P2fO9WSgcR9RtaGZUJA5mnAssasWYb5MnstInlREZtDdClf8xowWJ/Y7hBtjPFWF+C0fm4qWv0a8oxgQdvd9LuFkR/OzmC8EjrhGUJWtDKD0O/Hu/Z6kOq432OaOqYaPTGQa9QJWeqJTY/z2RCYMDnXOGwOKp7Zo9oEvPLArdmLCcwH7D3w==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR0601MB5598.apcprd06.prod.outlook.com (2603:1096:820:9a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 02:34:43 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 02:34:43 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index:
 AQHa8ho4oLFWUX2yC0qHT9Kfp3UIaLIuoMcAgAJo7hCAAJOvgIAA5YcAgADIa4CAARTpgIAAhfaAgARNnHCAADAKAIACnU8A
Date: Wed, 28 Aug 2024 02:34:43 +0000
Message-ID:
 <OS8PR06MB75416ED990B2A32F98266A1DF2952@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
In-Reply-To: <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR0601MB5598:EE_
x-ms-office365-filtering-correlation-id: a2cbba31-de1e-4737-c062-08dcc709f96f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KTtmsPYPVorFub7zE3pzV3olezOvUVh6TFveU47LBSz+4lFXflQHZUgwxBoQ?=
 =?us-ascii?Q?X1j4fFwrAEV/qriOnyIn64Kntr3nZxvS2fnk1pHYl5zS/nfOwn7EgCD36P0u?=
 =?us-ascii?Q?Q2vUkBCRD4Zoav40WrQ49cYA1JkydR+YnCqJImh6fWB5unJSPlU2Uhbgxt4F?=
 =?us-ascii?Q?RCx6jWOQDtbkfC67SUHCehF+dK6FmMYtU6jrO+tWqkYy1EChZpQtsuTAuQ4f?=
 =?us-ascii?Q?612kbDxbrMFcppWz4kEk888qNv4sN9vpoDNWq2V8//YApgqgfQ0056lC9rGZ?=
 =?us-ascii?Q?IGnlMHFIHe0iu/7RNedxSL9zllPbgOMPU1UhTXNNaPgDwElY3nD7hvjsmY5z?=
 =?us-ascii?Q?JFd9Cf5n4oFjV2PtwJgfOOJ5wYa/o2+5UANa8joEZdD8Q7JDeFrBRoivoiQ1?=
 =?us-ascii?Q?4hn5VRz47ELCh380f2vh1puG3srlomAZz/2mDwM7CkKTwduJRvfmAk1I0DXl?=
 =?us-ascii?Q?uGzLixE3LwTbuOQb+xu+Z9YL8KAThzQPJKZmsCOMXDkkWZmgSjreQ2RPvHX+?=
 =?us-ascii?Q?q2umqticpidHUoS0jgI+6KqhciC85MzZjbW7D6U2O8+9t7i+SfxkiJq+XfQs?=
 =?us-ascii?Q?LeqcnknzhLMNiXcjn5sJRcih3+QYuI+0V6NO1xo9ju9mkqgVsr8gGXZDTkBt?=
 =?us-ascii?Q?7NBvTS/9zO507jE+eorkQ5Bue5865sPf74ozL8SOtAFNE2x7ogPD29E4poqi?=
 =?us-ascii?Q?v1Vek4pCzsdkPbkZuXcSd1cBjIv9wT1KFRHZ725SOAlBZqpC0xP56UcIfcVA?=
 =?us-ascii?Q?7PNxMtqxnSNjJAz8GAY+G2iboxIcsr2GH02G8iQPyGb7erE5ULI1ZWuCfKwk?=
 =?us-ascii?Q?uM+VGPcBZPYqYxN10t3tjz/5LIYSYxG7uNIMwqsZJeeBmfilwejqq6C4oCk2?=
 =?us-ascii?Q?qKGE0hB2F9yrNCriw5HRuiSjEpSdpRFq2NtYF8wfLeT6VE/ysHh6e2pV7KZI?=
 =?us-ascii?Q?8sQIMskSmzm7WKHyzFcE6/7WreNeYEvnF93qlb/awUzPmBMBvM4TnUjJz3+5?=
 =?us-ascii?Q?piz5Fv4HI1BEc85MYnZyzbURhHxiKa6WeW8WtT5IcY/zJt1doMp04/dBciwY?=
 =?us-ascii?Q?CUX0hF+JMrE0e6h8GOY1TN8oqsT/S4vrWp0YakPVcmlClQ8hqweRdFTdK9cC?=
 =?us-ascii?Q?264JVCUso+f5DOkOYLw+THsmd0uV0fowu+gWx32A1sByBo+MfRVZuWGOZQzr?=
 =?us-ascii?Q?59Pf/gcSrisVJTOQi3iy4zEYDZzHJzrLKmJqI4/dexsCfLhCvIvaj+ZtBBO+?=
 =?us-ascii?Q?4Ngr1LebBreiCI6RkUPYK92YzfSOB1wMfwnBJ5Yg9ixeQnMvbPsz+57ul5FM?=
 =?us-ascii?Q?moEsK/ixp9rgg1A7dzaxjfzkhWHWzmhH/XU71uQ7GQ/UllHrw8bnQtLF1E0A?=
 =?us-ascii?Q?7QSKJLKje4v/LaiONr2l5ffy2QycbXMxBf7NUOXMRhw/BhzixQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JAlfemUcLyzmzxiI8oCeC6iLu7v3hQ8k11gVQsYUI6mf1QzMMxKjrMIey+vU?=
 =?us-ascii?Q?gvrfTF8afIg9h/U6EmVvqSL7NRKjx2Vp3XShOWm/AtnlHgqoWv71vetMjgqX?=
 =?us-ascii?Q?tNxqZAoEac2G1wBCJo6fYb0U3u8EqkbX2UGOa6fIGe71XoHnBR12gvLaRFsD?=
 =?us-ascii?Q?OEkIMGGBlQxK8cQ28UpwNTPZJ5rPv06XDbZnoGMLFQUxXDOhYs99lbgtOYmt?=
 =?us-ascii?Q?X6Npk4fp4okPr32/AyTTjyqWaPp4MMf/FM5xGrbuB9x7fSpOdNhfJBcStov6?=
 =?us-ascii?Q?W19tdxk+tHqc0pg7X6BEcHC2lg5TchLcF8Kl/7fqdjT6MoiEwmtcQ+1KxsQV?=
 =?us-ascii?Q?IuUjzXPP0+pvkv438Wuu2uvzt/WRb1RhYh9CwD+x8Q7/cjBsOfqkPxaUTSVm?=
 =?us-ascii?Q?vmWX6Q3OgKiiMb9S7evEzxLfbd2i+30Scot53cteciFEiyyREovQHjoelVzY?=
 =?us-ascii?Q?v6jvkaoR9tRhjz4C9OtaHxmZJ/06BprC/oQ4IKFuSzqpkD9f/U7S3d7gwN5F?=
 =?us-ascii?Q?YvU5wjXmmddGP8IYxIn1jSbisUT0ZTp8EYwJhFiQoxdHgXdryWQgjaq2jsbY?=
 =?us-ascii?Q?ih/b+SKFptXk95CkjDZ3PLW+Uu7oN+VJ/kY+6EelJhI7BtsxpgLK1wnRMKGh?=
 =?us-ascii?Q?Mi2OzcTfPNHhHFYQvdOBDrLdgCWScA6z9+cdyuLMaop/A3ZBuwyFRVd4U2U6?=
 =?us-ascii?Q?tx/969ZB/ESkR9cLsf0urD3rOyQH48S6R/3osC2Eekmb3G/Cc4cA7m5kA7Xb?=
 =?us-ascii?Q?y15SBEIUSf8G81jYAAJBfKIEe8xKF+sGHAgjWQ6Sz9yqIFRhCHBpxpxcxW5Q?=
 =?us-ascii?Q?jW6sNvs/pJlnPufnuaH2NXI2SsC/CehQuvvTQTK5aDGcjIAbsRkxsBny21Nz?=
 =?us-ascii?Q?mQihiSdmyr61iUK8i+Nl4eobdeJvSfd4p8I/BG/gmP+5nv8TVy1L2wh39b6Q?=
 =?us-ascii?Q?G6gzITnCyDOuPaGL0UW7C8BDWAQhx/zhcU4jWeTmOjJ7kE5Ez4elp1vI3Pko?=
 =?us-ascii?Q?AzuupSdbKJbTRcwGoFEP1uFvGkl+TWJ5PRPuiO0M8McUaK8EJJycRVK+nucF?=
 =?us-ascii?Q?+DtS+tp33QTNqO20YasGyUxI90gjm5TQIBBFRcMvNtic8dDErdxm901mej89?=
 =?us-ascii?Q?fiB17ZPW2XxsY5tROkoXugREUgguL9KpeXjKJxLga+hNlu44PKpoQgeKq7DU?=
 =?us-ascii?Q?tZCBmeurpnO5Ok5W2ifblAef/PHsbX41HTiks56KwdJ08wdMrn0f++o9kA05?=
 =?us-ascii?Q?lNlLV/cZYoiu2IzYNMkiscQKssp2+1hyT0N/LBQHVsmptPoddt1gAd7elmQq?=
 =?us-ascii?Q?m3JW7PQQG92P2Z0x617dJWg5CDxHdVgqW6z1RRGG7SZ7hwhU6bu7wCOYW6Gt?=
 =?us-ascii?Q?+UkEfeEYTABTcMJj5d+s83nYMPRoY9ixuN9p7bcQwSLj54NLVVVVtrkNYfEX?=
 =?us-ascii?Q?KCctIHdz1ZGlmDYsUZBEoC+PxO9qxiAoWaSH2gBcZYu9rET2suC61mQ2DOwx?=
 =?us-ascii?Q?3jcBaOt7YaQm3W6WNn3K7XgHUniYXYo7DA0iP0FjZuvElfFF55j7Tnyw3+zc?=
 =?us-ascii?Q?lU+ULBI+EDOP+aqjsjLSs52Qwz/J18CoiHpPTzIx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cbba31-de1e-4737-c062-08dcc709f96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 02:34:43.3158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztPP4Y1Ru678EAh9RdIpdn5j6oI/pel6xz1lWJrblmD80iAPd93X5xXHyIJA2EJIfGzC015NA1GbyWDUbjBQZnunD8sAp6C8NwRGiV4tUdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5598

> Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Mon, Aug 26, 2024 at 07:50:24AM +0000, Ryan Chen wrote:
> > > On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote=
:
>=20
> ...
>=20
> > > > > > > > > > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > > > > > > > > > +		i2c_bus->buf_base =3D
> > > > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > > > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > > > > > > > > +		else
> > > > > > > > > > +			i2c_bus->mode =3D BYTE_MODE;
> > > > > > > > >
> > > > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > > > possible to have NULL here?
> > > > > > > > >
> > > > > > > > Yes, if dtsi fill not following yaml example have reg 1,
> > > > > > > > that will failure at buffer
> > > > > > > mode.
> > > > > > > > And I can swith to byte mode.
> > > > > > > >
> > > > > > > > reg =3D <0x80 0x80>, <0xc00 0x20>;
> > > > > > >
> > > > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}=
'?
> > > > > > I will update to following.
> > > > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > > > 			i2c_bus->mode =3D BYTE_MODE;
> > > > > > 		else
> > > > > > 			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > > > >
> > > > > > > 2) Why _NULL?
> > > > > > 	If dtsi file is claim only 1 reg offset. reg =3D <0x80 0x80>;
> > > > > > that will goto byte
> > > > > mode.
> > > > > > 	reg =3D <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > > > 	due to 2nd is buffer register offset.
> > > > >
> > > > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > > > >
> > > > OH, I will doing by this.
> > > > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
> > >
> > > The question about _NULL remains unanswered...
> > Sorry, I may not catch your point.
> > So, Do you mean I should passive coding by following?
>=20
> No. I already mentioned that in one of the previous mails.
> Why do you use IS_ERR_OR_NULL() and not IS_ERR()?
>=20
> You should understand your code better than me :-)
Understood, I will change to=20
	if (IS_ERR(i2c_bus->buf_base))
		i2c_bus->mode =3D BYTE_MODE;
	else
		i2c_bus->buf_size =3D resource_size(res) / 2;

> > If (i2c_bus->buf_base > 0)
> > 	i2c_bus->buf_size =3D resource_size(res) / 2; else
> >     i2c_bus->mode =3D BYTE_MODE;
> >
> > > > 			i2c_bus->mode =3D BYTE_MODE;
> > > > 		else
> > > > 			i2c_bus->buf_size =3D resource_size(res) / 2;
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


