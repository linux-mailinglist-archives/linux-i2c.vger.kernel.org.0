Return-Path: <linux-i2c+bounces-14515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4377CB8C16
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 12:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D624B3058E50
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0245531ED9B;
	Fri, 12 Dec 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iuVpFeRe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE2319617;
	Fri, 12 Dec 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765540771; cv=fail; b=aEE9ekTlsFt6+y0/z/VpgXCpt2Mt1XS6LprrbEtlVMWEpj11HJzPK2Wo5mxJi3+8l3T07Emd+ffz/ZAEK+QugW9Q+5ZHDiliVnVAuod2iNmr5TlFMEzZbI3yxw8yjoekRd+3BMF8dAMcJVu45CMLJeNX2kaSOl2jK2aDvzUXdlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765540771; c=relaxed/simple;
	bh=ayv9ZJ+fNmndPJZUsUpSnqryXo6IKAx2Jn/3xq5m2bE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AjmMsqssDk80S3aXk+6zLxEGcIrgJQXb7tkA0Hif8CjnHcc49Uy0siS82NyW2HhpVID+4s0Efk+NG0HvoFnQsmM6XfOEnvAmBUfuUJW37eUzp4sjQsZEVWsL4FAuBl0NHLAD8OGCns8zvgxugQaAF01SLHakCAhptHhWBfaLsQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iuVpFeRe; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcw7aLCCI/5bqVkUtE1D1VLgzpF8RGrm1OBEaDPXp72VIO7TiiUUNYuhA2+ty2TByZ4T1JucXzH4AMP4jU2ofX2uEv8oMpyUu4KGBYHSjTmsbod2LoXcamiurUt3h8hO3qo/8nzF8U9dk1hRMoT2iqpzE+7c9gwORzEzoz7MTHBM2cdsIccM/sThMWQC+S8CXn+yMvKljoBygKWd9cEn3Le6SuV91ueggg1qY1i+Lr2M+weUWoIqkn/VmdkqyI/4oANv0+HhrEtk85uG4NftCUiFCbFF5328/qGz8or4/F2Z28z3w9uCqutTwszAtEKwv7pGAn0i/5vr6uoMNzYg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlZIPy1I6Av2/K1c9//ke9C4/bKvXfyRrREEpUaY90o=;
 b=hssw4OxV+dZc88fyCpII6KS4MfTGfH8G6pHyxSfpsHITdx2tNwerSRFmVYhWzNMJPkK6EO97U8WWGqD7F0/p9HHwUhxk78rAmR9dfQzdjm0IbKjHtJQ4MGyXnfbW8DK450AxrPv96+f70pnSTfhjYmwF8pqmKOGzzJpkKBn9YWEmA1ens1Bc/qeITmSFB88TNxJ8m23AEJOcRHl3pbzFIH9XEvHsWITVUfErifFU19Q/7Mwze1DiXMrH6FHy7e4oaC27pPTNxGup38/Rmi3lM890LM5/Q2xR2ADWXTtKDVfTR369SEXQP5T5bOXggKjHUK8ayHzD5ObsLsHetVFvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlZIPy1I6Av2/K1c9//ke9C4/bKvXfyRrREEpUaY90o=;
 b=iuVpFeReNoQroSpTLk3hifhc44A+iTKjSeAcJXOpBhM0VLVjTVgT5z/sNnUifbKxhTKnyFzKZ15pQdDBTFWJqvROgxxGG8d2vHD21Siapk782VcoLoRgaoN/XMfk0bfrrrI0N6K3cD+MSHLb+H/4DrbYUk7M4cW/Qi668pkIrqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB16294.jpnprd01.prod.outlook.com (2603:1096:604:3f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 11:59:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:59:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Date: Fri, 12 Dec 2025 12:58:57 +0100
Message-ID: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB16294:EE_
X-MS-Office365-Filtering-Correlation-Id: 682a385c-fe24-40dc-3823-08de3975e4e1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76rrm/uEUUFefb7MYBFmvqJodNwuKX6Znl+tTvf5L7AwIn/9H+APDcLsMXDX?=
 =?us-ascii?Q?lHqRIPw/ynDNtDpv/jlt/cFREgTFMQ93noHJj8SCLAq+gPJCL2TNEc8xeyWZ?=
 =?us-ascii?Q?pLgJDZCkOPPbRNaKq1ztKP+NbPKKi8E2sVH+u9d6CY//5OzmrRYig9cdZUCN?=
 =?us-ascii?Q?cdwoYlph98AA2/f4EMhAuoIjAwTXZL56WiBjI+YbAMDZ6BLgheiMcwmR2S3i?=
 =?us-ascii?Q?Vd7oj0yOl1KJbhjMen3MvqJ8z0ct6/pWlRe/d3IubSDo/FZdZt0uBshXQG8i?=
 =?us-ascii?Q?Vmm4YMJL+uBXpqlaiAKnNkaYoE52b2uq47d2RFt6jeP36LHAh14eE8yhC1sQ?=
 =?us-ascii?Q?fFTelNm9nA8a115gZDk8znuuw0NOgoDyrk8DzFCpKEXYcRiupj1r9IhFzZSX?=
 =?us-ascii?Q?s0j5ChvMglXKmrj2TnqJM0r1eS2yfwOssUuBBiuvDcSMekt0tKktpqrcwkgI?=
 =?us-ascii?Q?Z5rkU+LuvbDqqg/c91NIzncZakw228mCL/tKSbdqOJSKEaai3xeND93zzM01?=
 =?us-ascii?Q?39dTlAaBzd8xFKbrdtyLy9tn6gLoVZHBD+swFWQuRBFW6uPAI7uLN+hYIX7a?=
 =?us-ascii?Q?ey8GWKOQaZMgs8oGDYmHAXcUkgqDqswDKd2FLPp3hf8k+dnxY7TbnZEueWN9?=
 =?us-ascii?Q?jZIeIR5xqyOOFfoNneIB89bo+zvEvm+U2ESNEFFVPS7iCXvFJr31ID7S4s/j?=
 =?us-ascii?Q?9NHqT9yG871S6UCP2HMSA+mmVADfS8ZVw2G/R7Nvqt3hIQvwM9D6ipGafNG9?=
 =?us-ascii?Q?RLNxb+KAsgsj90+y942KLoPp/lTSL2ptS1cxzl7IjLeTHviBxZYWZ+GUWTor?=
 =?us-ascii?Q?U8X+22Fi7Z8ynuVg5rtR4sthWiR91JyA95TBqf8L0KyAKYqVgeRjyhZLOmP8?=
 =?us-ascii?Q?bDfm0Jz9NkEIV8D0EoQRTe2mWgALkTJ++6cta0Ynxtq/xUJxgaNSKSEOk9sQ?=
 =?us-ascii?Q?/2F5/ltpnjyaf5lXvzq/nHYlOlkfC4BQFYsxlwvqIWkcf2e4/mIE9tGeBnFq?=
 =?us-ascii?Q?U80YD6ZSp6nI4W1yxvkQrCUqc+K/HdtSUavfL3SvYSVuMDL70EbMpsHrgNaw?=
 =?us-ascii?Q?wRGs2d/Lm/1qljwcoCTVTltfQRauIcKmN0Pq8fhvcMnGqNRzjHQ4Po4RqAR/?=
 =?us-ascii?Q?bhWVu7hEhvwxwtqaSXqB+V5ZEDvAO9vH0+EVRoAxG+MbuTQ2UgPorwLEdN3r?=
 =?us-ascii?Q?U8I/NJVQKd6Sxks766C+BysMvKKQqguTdhHoSzTz+SDJpdSA4OrwGzQZb/+5?=
 =?us-ascii?Q?QuZCxzm7EnJlKzM70q4iloatMeXkWVqOj004RNN7ohUMG5NrfcmtxFZnrLJH?=
 =?us-ascii?Q?6qRw8NDXz9bHoAE+Jb5BPKwfCcbCZcGuK54006W2xBeBXfu003XqsMnWhk5k?=
 =?us-ascii?Q?pyTpctg3tjRtjYyXs1bVAfOElU6nya63JYv/DdYw5+diFTKr/gHdiCH9jQZl?=
 =?us-ascii?Q?PJFbT35TuULeBPzaDA8OWdrNMqNNApHJJ8Vtt1M9pdohKszLK2x48tJxcocV?=
 =?us-ascii?Q?juow8C+1wRI/EzQIVfSN8UYtwzMa4NmFTnQD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?42hE9ox9G9ArcYwqM1EnJXu0sZgkpFmSz3ywwcCvTbxbdelOjGINFuApUjU9?=
 =?us-ascii?Q?vW3il3DLmIutM+jJxpA+YY09v09/Af4pU04fFy2lrEypYPcCkP7KK2QMJa24?=
 =?us-ascii?Q?3+HgZ5pVcUNuWcWpDjpq6IElLig66mHmfOnMWprt1kcdv55GciV6E45QZjyr?=
 =?us-ascii?Q?tN1zSkNfEkAauJigb06NzzzDH2d0JRJH7ZaKxnNoK2NQThpuzfVpkOXh39uA?=
 =?us-ascii?Q?CC2Nufwtxd3PbfUfxjuQEto0nedmy/kxBO0KgdX0E5ol7FIO5jdT23LVXysp?=
 =?us-ascii?Q?8rTHEZuDxuLEJ6IxHfbrZiM3pqoN//VmYM9kXfDCporCbc5grHI18IKqFGOE?=
 =?us-ascii?Q?qAYMYfzjMy6ndFWmsTO8cVS1Hsz+0pM2XkdIEkDNCZnMru1MKFAKweZVjXdc?=
 =?us-ascii?Q?kcggsHFL4EZgfTFTrp13M2jaCM+dbiuuPhxjqkmV80eyJ8W1mdjzP+aNptTF?=
 =?us-ascii?Q?QdOO0leCc438WPGSI4JVt38faV6VU+YQ8QcW7GSOxbrHnbr8oBSg8WjBPlFq?=
 =?us-ascii?Q?CrReBKb8xXInS3xKcSMPNwBnGZCBlIOdDCWurzzfpP8g1WtngxgcowsAFvWm?=
 =?us-ascii?Q?k/AXl/KAdM0I1+A8a8xw21axzfVz/tLcR8YKXUTV3DVfWhnpZdeOLItAGRdK?=
 =?us-ascii?Q?zh05Oa2HYw3fEpgzgrj4Iwdj4ZW73wJ7J924vH95H10pred+h/GwdbP2pZeu?=
 =?us-ascii?Q?UDxRAvePEixQE+gIjxltXrIhz7tZF4TsWY5pTGJQBbzfa9MXcp/AAuaWfthR?=
 =?us-ascii?Q?3EAnRgZGQxtVoeJivZkUf6ufj0ViY2Yn5eJIA3Na5qjwmFLPhUFcFHqj08F+?=
 =?us-ascii?Q?55Ll0aCtrYZMcogmy6uiKLDvRqb+XKeU/uuc+wer27SECbaFDwgrh66I/Hbt?=
 =?us-ascii?Q?nDJd93dzp9tMeUvXHBFSbBtlaz0szd+egvYFm3Rd8D7VaP5vIGCodsm/Ofyk?=
 =?us-ascii?Q?G0H0cNaMzKf7NQBpIuBbSqTB35eH0QqlFc1cZvzsrNgH2IvP2VWt3BMyKFVQ?=
 =?us-ascii?Q?h/x3up/QJHSrnkgGT6zXLYr8b83g8bSLLXkBWA6iOJyE3ePXDIutMxvzgB9R?=
 =?us-ascii?Q?BU9rXdLFW6IWcy+ra5dYso6r1hl4aLQn2j+XzvY3kh7QxLjUujo2Ap89LDNL?=
 =?us-ascii?Q?EsNCxQePOihLMd6/6aqgSwZYGO9PGUxPKavis/8MZ6lI6Gubj45b21+8A3Wk?=
 =?us-ascii?Q?ivV1KFTzjp3rlLjUoRi8X59oWgHU1K5AN/vcJPEVg6Z2/qSE3vWGqy+WSCQV?=
 =?us-ascii?Q?xCgoDBB4LpPXdtf8QRMT3EgJjq4EXMlZiI6kF3oLjAMjPmW+NCu7C48TLHjs?=
 =?us-ascii?Q?/kwHgvmuOWdgWJUuLuhHnOBfuj8HfeuuBVGdh/clJ0DK7Wqxq1U5r+CF6xtp?=
 =?us-ascii?Q?LuoM9EBi4Z6wauPDq3wk9VvEXVg2hFKCTaOau9otZ2nZj8PRfezywLosBCXl?=
 =?us-ascii?Q?PK/QPPK/PYZtEb+NZbNKY+est3JzCLHOtuB5xGtDwE9GEZKZNtX6Xr08aRop?=
 =?us-ascii?Q?FVDN1uCbr1mtZAC7wnaCh+GmKwUdjLaMdWaqpfp/7DUjycfHXUEYb3tc1aRt?=
 =?us-ascii?Q?44oTcPSHy0IbdiluM00zMjsqNXioHxow/qqEpd+f0o9v5cFeXG6P4lfIz5Jn?=
 =?us-ascii?Q?RrPHjhWX2x3T/cfCHDjSJk0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682a385c-fe24-40dc-3823-08de3975e4e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:59:25.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0JVHzCjVwTHeHFkXHQPVXi5X6uUq3L/cpywJzAJer64rWCuLCF8VxcAlxOU1mPt6Nlbjb2HI5qCr/J76KbE9F9muLQJDMHGggEkfIbO4Il142vJdzezSrnyyRslLeXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16294

Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
suspend support for the Renesas I2C driver and following this change
on RZ/G3E the following WARNING is seen on entering suspend ...

[  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  134.285536] ------------[ cut here ]------------
[  134.290298] i2c i2c-2: Transfer while suspended
[  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
[  134.365507] Tainted: [W]=WARN
[  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
[  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
[  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
[  134.391717] sp : ffff800083f23860
[  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
[  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
[  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
[  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
[  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
[  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
[  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
[  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
[  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
[  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
[  134.466851] Call trace:
[  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
[  134.473715]  i2c_smbus_xfer+0xbc/0x120
[  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
[  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
[  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
[  134.493226]  __rtc_read_time+0x44/0x88
[  134.497012]  rtc_read_time+0x3c/0x68
[  134.500622]  rtc_suspend+0x9c/0x170

The warning is triggered because I2C transfers can still be attempted
while the controller is already suspended, due to inappropriate ordering
of the system sleep callbacks.

Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ
phase, ensuring the adapter is fully quiesced after late suspend and
properly resumed before the early resume phase.

To support NOIRQ resume, the hardware initialization path must not invoke
runtime PM APIs. Split the init code so that the low-level hardware setup
can be executed without pm_runtime_get/put(). This avoids violating the
constraint introduced by commit 1e2ef05bb8cf ("PM: Limit race conditions
between runtime PM and system sleep (v2)"), which forbids runtime PM
calls during early resume.

Cc: stable@vger.kernel.org
Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 65 ++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 3e8f126cb7f7..9acc8936cdf7 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo = {
 	.functionality = riic_func,
 };
 
-static int riic_init_hw(struct riic_dev *riic)
+static int __riic_init_hw(struct riic_dev *riic)
 {
-	int ret;
 	unsigned long rate;
 	unsigned long ns_per_tick;
 	int total_ticks, cks, brl, brh;
@@ -431,10 +430,6 @@ static int riic_init_hw(struct riic_dev *riic)
 		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
 		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -451,10 +446,25 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	pm_runtime_put_autosuspend(dev);
 	return 0;
 }
 
+static int riic_init_hw(struct riic_dev *riic)
+{
+	struct device *dev = riic->adapter.dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = __riic_init_hw(riic);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static int riic_get_scl(struct i2c_adapter *adap)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
@@ -572,6 +582,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
 
+	platform_set_drvdata(pdev, riic);
+
 	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
@@ -585,8 +597,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-	platform_set_drvdata(pdev, riic);
-
 	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_hz);
 	return 0;
 
@@ -668,27 +678,17 @@ static const struct riic_of_data riic_rz_t2h_info = {
 	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),
 };
 
-static int riic_i2c_suspend(struct device *dev)
+static int riic_i2c_runtime_suspend(struct device *dev)
 {
 	struct riic_dev *riic = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
-	i2c_mark_adapter_suspended(&riic->adapter);
 
 	/* Disable output on SDA, SCL pins. */
 	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
 
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_sync(dev);
-
 	return reset_control_assert(riic->rstc);
 }
 
-static int riic_i2c_resume(struct device *dev)
+static int riic_i2c_runtime_resume(struct device *dev)
 {
 	struct riic_dev *riic = dev_get_drvdata(dev);
 	int ret;
@@ -697,7 +697,7 @@ static int riic_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = riic_init_hw(riic);
+	ret = __riic_init_hw(riic);
 	if (ret) {
 		/*
 		 * In case this happens there is no way to recover from this
@@ -708,13 +708,30 @@ static int riic_i2c_resume(struct device *dev)
 		return ret;
 	}
 
+	return 0;
+}
+
+static int riic_i2c_suspend(struct device *dev)
+{
+	struct riic_dev *riic = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&riic->adapter);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int riic_i2c_resume(struct device *dev)
+{
+	struct riic_dev *riic = dev_get_drvdata(dev);
+
 	i2c_mark_adapter_resumed(&riic->adapter);
 
-	return 0;
+	return pm_runtime_force_resume(dev);
 }
 
 static const struct dev_pm_ops riic_i2c_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)
+	RUNTIME_PM_OPS(riic_i2c_runtime_suspend, riic_i2c_runtime_resume, NULL)
 };
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-- 
2.43.0


