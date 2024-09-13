Return-Path: <linux-i2c+bounces-6700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AD977DB0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA971C21019
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2BE1D86E4;
	Fri, 13 Sep 2024 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="DONzUqe1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424541D86CE;
	Fri, 13 Sep 2024 10:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223814; cv=fail; b=CnP3cegEuq4c9q7Oye1vcmlYCDT+Zg6EBHA6W3j8xrbmU41hJtCFjibB7J3cLHZOiHj5xgmJKIsVZ03yOcCA1INp0kifDNKXt/aqaPPMpUiE3OmD32ldc6z4Ynwl1pvu27XFH26KHt42LRIoUYmqpKtGubfSmXEJ7wkPEcszVQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223814; c=relaxed/simple;
	bh=POjlTT8/ReVyRGFDr+ma5dR5Fq2gCo1DqKvsR/aicHQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Vo3N6JwB7M7jYl9mzAH5ybbnnVYyjxITx2gjPvE86NGP7ib8RcqcFrjzhKtgRoo5c5vOGFlYO5iET8CJSjZWewSajxm+rzzPUbe9skwszpQfk2bz7jD3AZ0wdfsM6vXB6NNAqABWFOjLkDab3TRs+WnNGhHgNrW3IFijDCISsiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=DONzUqe1; arc=fail smtp.client-ip=40.107.104.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu7Ttiz3tuSW4OBmAfB6fTYVUf8HH0Zjc5/Hdm9D71WA3CZq4ZO1+E+SGc2b5gIPZu5gqABGDB96bndih86zXsx03XA1UOW5RuIyjcHki0jBlVF1aXFGpgBgOADpmxJlGob5SdCuLRQNaC6pWn4tfxWTzIzLufQOKWfF9QviGnfX7YNFe+J52BhLyUsM04MKrWKTXGWSaqkvIsd+zn2Z2cDazc+NRRmDxuu+3FGUF/rWcQCCBI2K6KUk088NHZ6KCxy5yTBDYzVpfq7Lm5JLDm6JIZdWqMMz2n7UfjeodMUxcujr/HTaOs8HNtvTo95Y2LuntMZUO4MVuJviwgFt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPjScVDs5Ou4HMPux1ESsdceYBp2vjaItfDBK2kZzCI=;
 b=JfyDQbsxO0lQ1YHvTmkIcQA3gfP6oszxONlJHzGNQMymfe07F/Thld1RMm9ux+sb+0C5KGOO3NoCZceMlK7YDeZx7LYkGxJr4OCMN/QSfvfs+vKdqXO6O+Msj35iQOjNx5CZQcGVu55rXqTJluZGttx2AYYxIblDh6dTl26V6kAPCChESEJC0r1b42kcut4mUgBZZTMRA2BS0rHfm+CLlMeQH7NRA2roeFjtbfUQ1Ozjp7VrqQFJR4S3Jqt09V8ClSVIzbVOJA9gBM+N6THzWQC4y1UT/RTCnyLAT9B1gMqna8nE9Ks1iDqKUlVtsCxugR8v5u/fuSZ0MZOK7Ea0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPjScVDs5Ou4HMPux1ESsdceYBp2vjaItfDBK2kZzCI=;
 b=DONzUqe1uRLjI9sZvMASaZ9h/wX0afBD7ikRiE34xtEntpgdRc90vaB/rLbi88MQ6wxqyiolXih6NKgwgsttyi54spbsVcrb7UfZs4hQZb7RifVg4rks7QuW3s9WMiN0QKShD3AtuZNdX8Xdmmv81nEjSGdcpLSygH1/P8SyMcQp0e8BXpkdyisrIlNlqpFmkPAjyWsFhXWvm+cuiVcBcw6tIeLbpoz2NEMNSLsdNhK2RajYfzKQ+u+mnAFvNnqmfCT1Az7sxyk6GH2x9JEiJNqe65IJNfP/DMsl3FwKc+Ibz7RHbYt6X4jBdZ0w3RmNWn63TPjorUacspVJfQR/HA==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 VI1PR07MB9408.eurprd07.prod.outlook.com (2603:10a6:800:1c3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Fri, 13 Sep 2024 10:36:43 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 10:36:43 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 0/2] pca954x: Add DT bindings and driver changes for reset
 after timeout
Thread-Topic: [PATCH v4 0/2] pca954x: Add DT bindings and driver changes for
 reset after timeout
Thread-Index: AQHbBci1Zr+o0WmEakiIZAn6C1FEDQ==
Date: Fri, 13 Sep 2024 10:36:43 +0000
Message-ID:
 <DB6PR07MB3509B9378807A7968E272D959D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|VI1PR07MB9408:EE_
x-ms-office365-filtering-correlation-id: d38dbe62-b52b-4c48-bdd5-08dcd3dff58e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?uCK9RfelgqG+QUFQsqMATaPBQTLIX5X1PniZ1le5XHP2GWr4DtCCRmn4ib?=
 =?iso-8859-2?Q?24MhVJlhLejGhim9C41vtqiU4YvzwyX6OUCHpL93MkALFlqj8ZqrF2EQyq?=
 =?iso-8859-2?Q?7bvC8r5m3nv8I7Zzud1mhXPaoq/+1yKg6o+RBOQlAxgZx0O1LOQqTl6WfO?=
 =?iso-8859-2?Q?nIk8x/kmJWWT7/GXqXBMRUJw1yjMRCNQFdrWoI3hSKUa//3stUHIlo8jUo?=
 =?iso-8859-2?Q?f4h7b7E+GgCWQoNCGDN2vanBU4ulGR9weirrqrOyktlm7PZCq7IzrCCrsO?=
 =?iso-8859-2?Q?CXW4LqAhA+YHRTiknAQ55ARQGraCXRfjuZ4O9PQ3Ylz8Tmg632YAUWtLRa?=
 =?iso-8859-2?Q?HK8PEPBOtHzK26aIWNMutFtqaM36D/oPow+O4Mz6BGAW7u7wmW5XcITSQ2?=
 =?iso-8859-2?Q?GZ1CaBhUXC0Bt+7NO9gK4Zib0dXW+7LMJAj9tLfg50SBk3bvdw0yAVEbSh?=
 =?iso-8859-2?Q?/Mlkq4DpDAMBz1vPkQKlPNovnKcZUeFO7cr4Zid6bzmQwO5kPGfQfv2Anw?=
 =?iso-8859-2?Q?b8gfem+atWWv6QTHb0lHCVHamLeb3EHHH/ZCzdi0fBAUGCQPQ97HzgX/LF?=
 =?iso-8859-2?Q?Tghuh++JWNTwNGUwkJ451vsmnEeRaZlrBBai83szBFjLNNvEuVxrF1xAel?=
 =?iso-8859-2?Q?gx2eBIFtG1PFJ7ph3GhOGMpmzl3iXQc3B/00hJFnNkakO8BmZ8E3xvXhfx?=
 =?iso-8859-2?Q?yp6PU/4ZmwhIzWxbEMOJ8ijzgxljYbEcshVbWYY6C12G78CQdZCpnsBB5e?=
 =?iso-8859-2?Q?1x9F60DPCSGM/B/GK1xsJOUdap0KOw0/Uhrk4y51/3m+s3DGmdtCth9Lla?=
 =?iso-8859-2?Q?u+k6Dx0fXbSlEtuhJkMkniNY6VLuFrjkqDnEZQ6EqZj55pMySVHjrZSOcv?=
 =?iso-8859-2?Q?LXBu56lIFHaSS4eu7kjIPa06VpaysvY1tOv6TvtGH4NvZbg6oH3ls3hPhH?=
 =?iso-8859-2?Q?Eb1hZ9Ked9w5a2y5labxzcEe2GJihag3S74hHxd7UG+O4vU+SnM1mmxroA?=
 =?iso-8859-2?Q?jexO6vyjrVXoId7VlM+vuhrtRuTWLuzyGrF8YSTBHI5m80OjtZACxEuS5c?=
 =?iso-8859-2?Q?E40dRxQB6HPBGQGjaAvKlOncjbYQxD7WbYa7437pfblNUNbX2KBmwLmliX?=
 =?iso-8859-2?Q?CT2u5wCeG8fJI0DUDc6n/P91O9qpwyVMoRwByyU95xfNflDwhcvedgh+bN?=
 =?iso-8859-2?Q?VQWKeNgLLVjQHEpY6hiBSgioestP/VNN7pGusTFx8SWTQ3XgHNCQaSjBgA?=
 =?iso-8859-2?Q?GRE/R/MC5IF6/Zy91B4Wk4XXtaeqs6EKufh9gWpamrxsHBYjeUx1eUaNz4?=
 =?iso-8859-2?Q?Cl7fMKGu8bEEuEyffQngB0WfE6h906YL2MVwtfVAOrUGK0dcGYXw9aKX9+?=
 =?iso-8859-2?Q?Fq0CiVgYvNGiBPpwVMgclKpI4kU1tMWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?cRXy3AOg3Y8LTc8CxmS8LmAOntPRd+xVa9UsEC6ve+jQjwWNnLqhtgiM7W?=
 =?iso-8859-2?Q?d+LDCMkM9G7qFCXzPS50reVHKLFELhXuRB7zFz6VL8Frn7/fuTAZH/3+Q9?=
 =?iso-8859-2?Q?ONuAIMcLVnPJ5zerXx+FbGIggrBByddsWmaPDEGbSyU7MAUyJokvOhxn0Y?=
 =?iso-8859-2?Q?Glf7T1HFeIUeKPTfdJ/5oraXJB7xWTCgMhBltVEsX3vUHlg96IXlBX+pK8?=
 =?iso-8859-2?Q?4eOXPdfgvG5VulPU+ax9Oz6l8jq5ZnvR4IQUwR2dTBb7NNLA3FO/9ESiAf?=
 =?iso-8859-2?Q?TAeM0YKSaSSgw2kU6r3zpeK5HaIOmvAT95xOXQnZEv68tmPm9XLNdoeFpz?=
 =?iso-8859-2?Q?vwxZbemlZjekvPw/TCymKq98QiJDiJpBDh7CVPKI5e859SvVyWpPcK9OzA?=
 =?iso-8859-2?Q?Q5Xs5ox2371f7cr5N5MeTG1oVqgBVeHf+BhPJIWIFid44qetg9UbEhADV3?=
 =?iso-8859-2?Q?HtzFXAhJir9l85czQZZ7hyHOnrHhNHWLfGvFFRIF+cmsWySl6nTNQjUIEm?=
 =?iso-8859-2?Q?Hqx7wyv7d9BkMJshN7tVDd6yZhbpn0yfVWnOgVxnxT6t5Vd6gCkQUug1Xe?=
 =?iso-8859-2?Q?o64aZYLL/RrYAngy2bmO4FEMkIZ2MiwWWEFkyWZk15GsXHXnRaRJliz8e+?=
 =?iso-8859-2?Q?Rwdd4VW7qUjIDeQL4i08UUhAy/KX5EcDCg9sg0txrB0BXjLU52RUtXde6V?=
 =?iso-8859-2?Q?EJQ+g0FBEsa3Cv3pH1i0TNrEjc+Qx4Va6KxUAo3lHoabGAeuchoJLtiiwj?=
 =?iso-8859-2?Q?akpqbtHomkm3WsrXP8RMp7WtG3Veis+XTJri/2aB7cIPanDyaJvcBZ+CHu?=
 =?iso-8859-2?Q?0/vWTsoz777AX22G8HfPNC72/L6il6QLzO1rYkRCfQ/FIfsb+y0HUrzAZL?=
 =?iso-8859-2?Q?NBWskHFmv24Wh8+pEL/WIj5LGfUsYnuxQu2ousYeQTW4n1X3F1eqHI2PUe?=
 =?iso-8859-2?Q?Stoo30GLXgcil4nUM8qTVLl6UshfLNbDLBuW7aHCGNT2u5xUyAEsQbUJvK?=
 =?iso-8859-2?Q?3vILWzYVm01PFaSUC2QIC8h3Vndh8QQ85ssrkdEb1eMBn7dJs/cN1jm8KH?=
 =?iso-8859-2?Q?1mvUEEFmZKcMkqJBUGK7ZwvT8+GzS891Rq5TEbBtMojdGN4I945Ioj/D7E?=
 =?iso-8859-2?Q?F26cbSyKjIplVNxJgHSwdhxY/MWb1q7jimgVaSNbGHxqqg6moTrbZtxWLM?=
 =?iso-8859-2?Q?VA1tHmFI5lNl1z4wrI85N5ameBnZ5gnivtnNV8WbDTUnS4CaxsS5T1lgVi?=
 =?iso-8859-2?Q?2HtwCiONM6yesXundPEfqyQNn8OBkpL7ifTDiKqkbipiEaMbl+Rfwh5+wH?=
 =?iso-8859-2?Q?PVieR3FzFxDbbOKkm66UaTs7YCLklJAmqPZxFYn7S7P/OayAHCKiCcuM15?=
 =?iso-8859-2?Q?wTY8glnT7HEyz4UszBY/L9Lq06jvhCQ/aIGI1A9QS1QlcRNtI+TdBr37Au?=
 =?iso-8859-2?Q?spy+dYL52ny2Y8XmZBoFwtbzWUsOBDIT043go90l1kRKqAydENcbCRRmnm?=
 =?iso-8859-2?Q?7FOCBFvhSNPoPJqwfT4CQCfJKPeYnhEq0orzVdw5o4+KeN4oA+JqsoNF2n?=
 =?iso-8859-2?Q?VIUIRmy7CVWwjrSMh2WNIgt+3zT/ily6xPVJZWpew0BAfSoldemhKx5gFT?=
 =?iso-8859-2?Q?+dYdHZ6y38F/S3USuc3yvlO5Tn0pKrqfsn?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38dbe62-b52b-4c48-bdd5-08dcd3dff58e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 10:36:43.0494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZhp2QBDm8mqgNUPe/vL6PzenqcOhH64z9q3xWx35YfKwQmeGXyY+gyRUc3IxK51DVti8F0pcdFAO3pP5tn01mpgWa6NMQJslTZJy8HfIbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9408

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
The pca954x mux might not respond under certain cicumstances, like device b=
ehind=0A=
it holding SDA after recovery loop or some internal issue in mux itself. Th=
ose=0A=
situations are indicated by ETIMEDOUT returned from I2C transaction attempt=
ing=0A=
selecting or deselecting the channel. According to device documentation the=
=0A=
reset pulse restores I2C subsystem of the mux and deselects the channel.=0A=
=0A=
Since the mux switches using transistors, the failure of line behind mux th=
at=0A=
is currently conneted prevents sending commands to mux itself, so external =
reset=0A=
signal is required. =0A=
=0A=
The following series of patches implements the reset functionality if it wa=
s=0A=
selected in devicetree, beceuse the reset line might not be dedivated in so=
me=0A=
applications and such reset pulse would break other chips.=0A=
=0A=
=0A=
Wojciech Siudy (2):=0A=
  dt-bindings: i2c: pca954x: Add timeout reset property=0A=
  pca954x: Reset if channel select fails=0A=
=0A=
 .../bindings/i2c/i2c-mux-pca954x.yaml         |  8 +++=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 51 +++++++++++++++----=0A=
 2 files changed, 48 insertions(+), 11 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=

