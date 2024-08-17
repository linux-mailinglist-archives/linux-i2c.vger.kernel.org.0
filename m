Return-Path: <linux-i2c+bounces-5470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94633955880
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 17:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D63282BBA
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAFFD26D;
	Sat, 17 Aug 2024 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="BAilZ8vQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD188C13
	for <linux-i2c@vger.kernel.org>; Sat, 17 Aug 2024 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723907224; cv=fail; b=itHfLo1hYeNUPew26y3Ods+uFXc/SplK71kv+WaS22l8k0gqbfLFyrVBnTe6pyAIjTN190dOCe8r1Zer9nGLLK8yzyzYo7jGSOnLtZvSuE3Q4kK+UmwwWZwaTC9zoWenxbfB5ajeOQDCcRoLiJxd+1rbj5PbtHkCtjDbKffglvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723907224; c=relaxed/simple;
	bh=sDnd2sZpCD43Ixa00gUFc381Olwwqv6YNQk9upBaLjg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=balJxCwfxST41ovyyTugERnYr9x+Ztex5tEn83nbRN7uXzMxP2coFNNJ3c3Eq7egV44SUuXtZ6nYsRYdKQrCaaRmlsr1rHDbhvFQig3CFruQjglz4VDitpBYxmm9pp/z4TWoa9rQNHFQyz44weuxFSKO4WHS5xPVvqAZdbGQo8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=BAilZ8vQ; arc=fail smtp.client-ip=40.107.241.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIJb7NlJMotkeljZYycZZR7O+8Dm3UoeLRWdloSet2mNk2yeUfz3e9tkMHqHGTbNsIsdp2kEVUiUn7EffHPjIiAYZMq6r92XRxtcesX95Fs+C6iuHjP9pByO2TgFBk3zeJLxwiGa/2MYwfKM6BCB2T8K0qj6tvGs9Ran3kT1WCuODXqEJTszVajY+as+7IWhfA5V59WphrQpTAnsiwjjlDm3XQdf6ORf9uQp4GDtAqcHI35u7QSaMI90VW+lOBHor+ZjxX2euouGmOpeRiBp68HUtplsCOuYKwebe2diRHJmFsizpiVbOh/Sal731BwRPGUl1OrkxY715TcEAZGYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngTwvUoRxaNzyADWyiQ/071+0m/XZYMMMTQonn8x2z0=;
 b=gI2jBboNtpjjvR95VlHQkw85jsmUP/IZLAqyrHtare9P2ArsmvmE8Tx/bl7msPknTqR1Zju37JsaEfxKlMPjfqYQb3RahfTCSj9jb/xboggp/FsNkNuOK28JrPXdijgz9cY9afe0wvk2j88QJW12xewAB3R3SZSWfJC/RY0TI7idYQ47VSId4/DhwHxG685KQDUbBWB79MakwE2f3IthZFI0qa31MustjCtnhQhwSDVzI13iESEQuLWxeqd8MKcYlGBTLP2ScKJiqhFaLdw5+bHF2yT0SMBTB+Kaw3xsMzzO9Q+SFQH4RD34MIEk88DHlxo9y3CI0ksCDEFfQO5uKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngTwvUoRxaNzyADWyiQ/071+0m/XZYMMMTQonn8x2z0=;
 b=BAilZ8vQ/m/z2vpRaGUEP6KGum4hzB7Pm7Zl+18PXjbkSN7qK1UHHxgOvE8pivSwzs36mDpK6u/xKHgbQww4NREObCPeilUfb93EtzAuGbj23UE3nbeKwAC6GrfY+F/BGfpqDhsTf/e25NHIOGtMzff4S1Qsb0KJcg3YmaHp+1q9s7f0WdPzpaTV7QoXRSXTcmLVNQYcqrOJgoV38Gf2jQNum3/bqZaOToPx5WLW6GJIScJaUaTkzBVumC7gwyVQUm5jslq0M11s+rwZtwGldmo0tWiqmImeh1nHDF2846gCIzrzzJUAVHS6Z7q7WdbIL2o7uQIUeFulxBOgcef9yA==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 DBBPR07MB7435.eurprd07.prod.outlook.com (2603:10a6:10:1e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 15:07:00 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 15:06:59 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v2] pca954x: Reset if channel select fails
Thread-Index: AQHa79MbyYnkGBOn7E2e85VmQT3fTw==
Date: Sat, 17 Aug 2024 15:06:59 +0000
Message-ID:
 <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|DBBPR07MB7435:EE_
x-ms-office365-filtering-correlation-id: bbb61bba-9464-471f-bcad-08dcbece3de4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?VZXiaKZGTPH61xC8HAW2fDmIR/G3P4URDMbJ5HrdqusXw9ruCL3Q2qtu5B?=
 =?iso-8859-2?Q?meiFNs82WLcbkmIZji0+f1pWRt611XYHJCDpdH7kkucktHZ41t7Nmw1zVi?=
 =?iso-8859-2?Q?FlD1Hqcd6Id/+6A4exGB3I506ZKjdlGJCL+ofR/NVgTAHh3AVlEL/Id9Qc?=
 =?iso-8859-2?Q?NqStJwMrDE4URCSkF5PVx3EDRasIhFzkNrhYU56XU7tR766kUxUvgfTCO4?=
 =?iso-8859-2?Q?5Ol/1eJNlO8FNEAXWSWxzQdX9rP5Fha4FL30+fls5R5PJsd2BWEdfCHIgV?=
 =?iso-8859-2?Q?sAwFknwd8ssun76yqUgCbm65kAapP3OlBOKfVwMiRaRJBk9Wgbt74pPrfE?=
 =?iso-8859-2?Q?wXe+dJpwYoN2t0R80sTmGcPoN1XwSxYUBEy4uR4SN0naq56CmJMF+F/K2D?=
 =?iso-8859-2?Q?rSU5EwjLnanze4k9MPMtqOiAXSrM/M2417PCcgW1mY6Ymh24UhuUXwdp/Y?=
 =?iso-8859-2?Q?cWMVYC+SF77e4PKhR8a2NnS8kMvw1RQA4BEib7NmlPI6Z9c2DlRi/bb9LL?=
 =?iso-8859-2?Q?u9GbQu3AAbdq4x2Aw5ZIOONsk0dIeaTRRfQkB4CWnLXosexK5G+b9UtmtI?=
 =?iso-8859-2?Q?+6rvq91ylygIV1JukY3j2Jl+yylJYl6OJbsxxgIHPpMuWx+rPtr2COV2b4?=
 =?iso-8859-2?Q?qcQE3Vo3cerlQv1Cznw3Dh6CprlJA9Q4Q9h8qnxbXp4Cfnsw7RpQKGMUv4?=
 =?iso-8859-2?Q?4xj511OZh6lSIHDrVokBsd1fmpdHr/YQfUy2L4aUEJhU8ChdKDC1oq0zBQ?=
 =?iso-8859-2?Q?Y0WYJmkTz1jS12W5KhFToHwq9L//UxmUdM7w9bwvavinxTA06bQ8gLB4ug?=
 =?iso-8859-2?Q?gc8F30xB1lEBJ9nWGgMtmtRrvvxpLYIGrs/cM8JTyk9WwS0gr6arCx1wRo?=
 =?iso-8859-2?Q?4JSUzl1bh5VVQhbCZpJsysFHp/q/c4qY0mDvNcQ29osPONX1jLzvAxMryz?=
 =?iso-8859-2?Q?p2dDSsz6GnqjEO1qo6QCQ0Idf+5oqlmysYwo/EwjZCuJwXHRJvG3CuRdz0?=
 =?iso-8859-2?Q?z5+yt1xelEcNLHe8hlZyDFNG8SKGUYf7XNU8Fdh3f//ySxPbAOB701Kpc4?=
 =?iso-8859-2?Q?4RrRcz/eEmKhyRXsOzvOa/5cuX9CdeEEj3P+v9wWZcp11FlhXFKqznttht?=
 =?iso-8859-2?Q?XJDB1nVpLiVq87RIbU9VMNLI7L06IU7rBeIAhcyTjtpg2CWxapgvWxpoPP?=
 =?iso-8859-2?Q?cQz+uwk0J8LJkzo8JLK+KG/n0Y0x3ixk3P7JlL/zjX2AYpZ8biMLQ9tBK5?=
 =?iso-8859-2?Q?Y0vQwtPbtKW1hc2Weh+kwlywbZmfUzHszKHiWBNC2DgGta+7rlTpdoYjbn?=
 =?iso-8859-2?Q?cEDveb/+lVRMGktA28dYaqrfOrAKBAON4rEJBn/7H2FYij2Bx9ADY5xOoH?=
 =?iso-8859-2?Q?2RSSAx0t+yV2mTUwFNeLyCCq140b9d9PEfkKurxXEO/6AFMLee7F7wXBqI?=
 =?iso-8859-2?Q?MZ7bJqXeB2mvqKcd8LibOOvniMDdWPjF8k93dw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?2nIxOKtpbPnjDLD9zctZguDVi/+wWh10oKSa4eiBggp24zqmGOlxZZuPUw?=
 =?iso-8859-2?Q?eJGGX1DL8oUPtqXoUxk3nLFd7aW2kBDyDeC+dz5S7gTD1yTqNRVH/vDkLv?=
 =?iso-8859-2?Q?UKCJDxOlenQsOGgSn0FrVtpYMRgU+9E4Q+MwJYwexZoAc5Zmlhn03aFD1E?=
 =?iso-8859-2?Q?PDzzjrvZO36HnI4lh5k9fQ10TPaZl3a7inTcOCIKJhrzCNwDdZC2yTvSCh?=
 =?iso-8859-2?Q?T4OhTsP5EsEhbXrpIShFUb5Gy5z01Va6Gv5V2COOWgV2g//Ql84sgQUbWx?=
 =?iso-8859-2?Q?CSOjacRsCIxAf5Q2oCM15BthxvBhRXFtUzUm2viqBfItq996k+GHeHEzUK?=
 =?iso-8859-2?Q?Gg9GLV+kJbTvuiUyos1jdWoKvc6mzgDfMPqCZ4S6DZLLmgKHF0mpAkDfPr?=
 =?iso-8859-2?Q?xmqMCRdVZ4Z7CoZBRPPZPduQbiOC9MFgGiwvFVIo3e7rbYeL906m2b7xHU?=
 =?iso-8859-2?Q?M329jFSMxWp2sLKbbK3KU5oevU1Cl+Xf0cZZr4a6GUTy/B5f/mOYK+dMjH?=
 =?iso-8859-2?Q?ocyVF+p99fxkzc3DpA1DXY5H2qzVOjfuQMazyaI1nGcJG+i1nyP2tZebOw?=
 =?iso-8859-2?Q?Lf/DHE2g6+SPSetQrmy4SMc7C5Tjaj6aJD6cXKCakOs/gYZLN1mAyrC+nk?=
 =?iso-8859-2?Q?1bqvU//PKXJ1Wu22siHiUsH64dpRM9qsk0mHWVvSbINNH6MdLknBRO+xP8?=
 =?iso-8859-2?Q?vzBdUVf1xw5pJsw09iC0n+49iHYP83hwBtbhpxg1qdGkZfGnaqhPuYTIN+?=
 =?iso-8859-2?Q?77UhkG1p1+WUPLy1NOe8aZwlvU6pTbj6tNwI+pMRkrCI7Zr9FjWhcy89Dz?=
 =?iso-8859-2?Q?rRvVtjebMOvvliint0P5aoHtaEyBqRMvK9gXLKLj8X4my/4h+JQerY53Hg?=
 =?iso-8859-2?Q?qZBL4ItJX+2tuwWQfAMXYaoDMc7NZRl0w4S3FRmsHJ/0j3bFyZT25x2P4k?=
 =?iso-8859-2?Q?vikjnFaEqAT994ul/z7KWx/mqaAePtYSPPEdMZunkdvBKO88Ua/8bL+O+k?=
 =?iso-8859-2?Q?Rub3KiONDFMHeizEbLe9Oc8uhADPBWSRPk+eFti/HeoVWXCrdVbJ2UlCcm?=
 =?iso-8859-2?Q?4yrl81a6Y0DEewLC57deB4IDWfsRykXYt2lZC24YrZx08BxMTtLmvgI7dy?=
 =?iso-8859-2?Q?c1Lj/34eWjPg7rbxqoRD1ioi/naGNdxr31brRWZKR7XGqiutC6PI6emJ8a?=
 =?iso-8859-2?Q?/FvQo4oqOMBFQZh4gWMMCRcuVxyxaWdeCvLAicj0HzzOL1OAk/Hl0Sbrrb?=
 =?iso-8859-2?Q?ZFGNB/eBbs/UuhIs5QYYiQjus82EVTOQv9q8Se71Rn9+w2jiZAze4FZbap?=
 =?iso-8859-2?Q?FnD2GhfIZChnAXr3mhhg7vsWB+1R7qh1WFTDp8UTy66m1fWNw1AYjqmIPc?=
 =?iso-8859-2?Q?O6VTx1e49GyvnhreTxXl1Ubw8jdieSvJQeShnPdoCkQ6oOxz8qEx/lqlUj?=
 =?iso-8859-2?Q?XIdIg+NrSNhVfufS/c7XKxb73KuEgBHR8A5nJeVNSDX6pvC8HY7tu/sby4?=
 =?iso-8859-2?Q?Py80vuinw6CmeL8TIFZ92JC4iIsz1xv0V0p63EYNEs7X3QoUddAsXJQ9JD?=
 =?iso-8859-2?Q?MJKLcdnZy3qaKL5da0ULfCMgcQ0mmL86IGo7bft0gYTyBifqMw8VCisSiG?=
 =?iso-8859-2?Q?X9IQswNC0OZEg1uOmtl9lnQg2rqF8dAADh?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb61bba-9464-471f-bcad-08dcbece3de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 15:06:59.0607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cT3oSnwPAhB+arUyC3jdVd8fIcJdv/q1krAC/yreANzMlwVoLV1w2Jdxb8LHoD5p+DR8NcCJUd815YA5T7MtJ6WCP8EHronEzG5vRX45Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7435

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
Channel selection that has timed out is a symptom of mux'es I2C=0A=
subsystem failure. Without sending reset pulse the power-on-reset=0A=
of entire device would be needed to restore the communication.=0A=
=0A=
The datasheet mentions 4 ns as a minimal hold time of reset pulse,=0A=
but due to paths capacity and mux having its own clock it is better=0A=
to have it about 1 us.=0A=
=0A=
Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
Changelog:=0A=
v2:=0A=
  * Removed mail header from the commit log=0A=
  * Decreased reset pulse hold time from 10 to 1 us=0A=
---=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c | 30 +++++++++++++++++++++--------=0A=
 1 file changed, 22 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mu=
x-pca954x.c=0A=
index 6f8401825..e09d4d107 100644=0A=
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
@@ -316,6 +316,22 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan=
)=0A=
 		return 1 << chan;=0A=
 }=0A=
 =0A=
+static void pca954x_reset_deassert(struct pca954x *data)=0A=
+{=0A=
+	if (data->reset_cont)=0A=
+		reset_control_deassert(data->reset_cont);=0A=
+	else=0A=
+		gpiod_set_value_cansleep(data->reset_gpio, 0);=0A=
+}=0A=
+=0A=
+static void pca954x_reset_assert(struct pca954x *data)=0A=
+{=0A=
+	if (data->reset_cont)=0A=
+		reset_control_assert(data->reset_cont);=0A=
+	else=0A=
+		gpiod_set_value_cansleep(data->reset_gpio, 1);=0A=
+}=0A=
+=0A=
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)=0A=
 {=0A=
 	struct pca954x *data =3D i2c_mux_priv(muxc);=0A=
@@ -329,6 +345,12 @@ static int pca954x_select_chan(struct i2c_mux_core *mu=
xc, u32 chan)=0A=
 		ret =3D pca954x_reg_write(muxc->parent, client, regval);=0A=
 		data->last_chan =3D ret < 0 ? 0 : regval;=0A=
 	}=0A=
+	if (ret =3D=3D -ETIMEDOUT && (data->reset_cont || data->reset_gpio)) {=0A=
+		dev_warn(&client->dev, "channel select failed, resetting...\n");=0A=
+		pca954x_reset_assert(data);=0A=
+		udelay(1);=0A=
+		pca954x_reset_deassert(data);=0A=
+	}=0A=
 =0A=
 	return ret;=0A=
 }=0A=
@@ -543,14 +565,6 @@ static int pca954x_get_reset(struct device *dev, struc=
t pca954x *data)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-static void pca954x_reset_deassert(struct pca954x *data)=0A=
-{=0A=
-	if (data->reset_cont)=0A=
-		reset_control_deassert(data->reset_cont);=0A=
-	else=0A=
-		gpiod_set_value_cansleep(data->reset_gpio, 0);=0A=
-}=0A=
-=0A=
 /*=0A=
  * I2C init/probing/exit functions=0A=
  */=0A=
-- =0A=
2.34.1=0A=

