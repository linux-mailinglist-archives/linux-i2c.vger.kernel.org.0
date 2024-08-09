Return-Path: <linux-i2c+bounces-5245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A856494CC06
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 10:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4DF3B21965
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 08:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977CF18CBFA;
	Fri,  9 Aug 2024 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="FQOmlE+p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0016D4D4
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191477; cv=fail; b=BSBZOy45iC44RDpgGOweCFk92ckGe0xQ49S2WaMxr8w1P1g4SDQB8PuWy7I+6lwx2O2bkcSwPHtZn+uyef/zQRIxX5ztpe6TNocFLhaqN8U5QcwLqQaI+jKRGjl5PnEL6DBRG3x7HYMYR8rVGqWXg8IZtizt7Vn4uC6nFGSCcnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191477; c=relaxed/simple;
	bh=lU7NJIZ4L8V5J8bPMls3Ddxoq8bGw7rx5bGV79FXxw8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X9HWL88/pc3BPGWkqVJ8Q+8jfdIXAXIM4KrPHVVhVVAxUU6OChEmOI2t52ulZV0h8T2rhHNrya/avKT9jIiwDeWll/pKLbVzOXEbhhdw1i+KCJBctOIawuhU37MGQttEw4pIGvUqoUbkfNlChPngl5IO0sW9eMnWtUR5W2UvUjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=FQOmlE+p; arc=fail smtp.client-ip=40.107.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq7GEsf2ksLJ9rky9yeMR814zNfDkIXWrQ9DtgE4PbpurIEOM/YuB8FjbSLhIraJUD7RyE6P3ykDZq1XhmdKBjEMEBLY2hp+0Y3b/XTKQ1DwcJIRcDNMTOTNK3adg7USItQWJjpYRxkEfArsYpRBjSDTxyGYFXaD3KpYuzrabtxkFMFtJmOQ/fnqTPRzghwm74Mi31lJjlOspCRXU7SVuTBKl03gJlxCdleclk84J2mFqP3qYlJuSVboOiGy+lMZ35EOxn5vThwD9VNxl/C5m3XiZWPMJA6atHrvkbDZNvx9uZ0ZoRGQpj51pz83ct2sOB64gkt/5tbMq3ZWwZa0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm7TtEQ3aUiMZI+g72VNpCAEQ6bQ235UnsW6mSZiQC8=;
 b=g66oUOWG/FOcqrlS78CeiIrmSCiCHzR9zmUloKoA5dw9l3MHvVgudcXjCw1Pak9587Rx2XijIfh0dMVa5TApUzt5u3VNHysxZ9ycCZtcqqumnulns/Jg3CDeA9UwSoWuXFjF+quZSpC937rJ6dmoVCW985HWnaSdyIu0S8hwl7AXE8mN0Olskgc4SX0wZ36PfKYkQU8o2j73j1qJscv6cDsrzTQo2Axs0S67zS4qStxGwcjEbRlsLnkT2mazXGtLd/M7L+c2ruTtY/XT6spMDd/YVPruZ+JEC4yy7CZr9LYn4xnXfeeiXNiCGDrGa7cVkcSN9N3QTS8AzJ4Mbq1lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm7TtEQ3aUiMZI+g72VNpCAEQ6bQ235UnsW6mSZiQC8=;
 b=FQOmlE+peVk9scIatkc8Q5s0tVWuVDL2PpQYf1mU9braX/B6MfvcSp5oQ11AbtxU3xhcrxBTf78aoClGy2QvyCFUjQHl3oud7ft5Y0cGDBYiViL0LtCjVh4UzsdbMsPBelfCGkFVQ9G3No2Qn+M920wVMP8F0/ISi0fJ9t9Tck6ux4cfA3zOdMifS5IQY2nnxjiZBSemSGKJ7eivQSF/c7y0wjlgs2HIzAWTgYMA/edHzA+rudD4SRTIDgQ8yeGkCuIoGPn6eGhaUmmLsbQvI6zajvUNGcyiso/WHigBBA4f/PXKZj8iEkcVvh3Okm9hSr7guHx0Cum10MHofPijRw==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AM7PR07MB6948.eurprd07.prod.outlook.com (2603:10a6:20b:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 08:17:52 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%5]) with mapi id 15.20.7849.013; Fri, 9 Aug 2024
 08:17:52 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PATCH] pca954x: Reset if channel select fails
Thread-Topic: [PATCH] pca954x: Reset if channel select fails
Thread-Index: AQHa6jQddQPwTX4+5E2Bd0WqFVKNFw==
Date: Fri, 9 Aug 2024 08:17:52 +0000
Message-ID:
 <DB6PR07MB3509F48523F601D4F6429D069DBA2@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|AM7PR07MB6948:EE_
x-ms-office365-filtering-correlation-id: a998a918-69e1-4427-d596-08dcb84bc37e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?60q37G2jqfVhzik7RRHJfyv5Pnj/z/6yrfWapTIbY6AwJu5eHJZBFNEgsj?=
 =?iso-8859-2?Q?tfR5529LI+A/7tfkghyNfuEkA6ES5ylBJhB0v1ZHB/ZEcL0nZgTvZgmTkb?=
 =?iso-8859-2?Q?qd+NOJT+QfxtsfY7RrmGmjtAqjR/+6BfyQk3FtMl/7PNnkEltUeTYN/5FZ?=
 =?iso-8859-2?Q?ssXXZidY216f7hdqAq6efkW4uDwb/kQMO6hHKr6Y3YtvQk8eKkJ4OQGsQB?=
 =?iso-8859-2?Q?JNoCY8LW32GN2uRRPNkkEt++xwPbmie4U8llPXIFsiRPj5x6+u78UUr0RU?=
 =?iso-8859-2?Q?EHS/RqCBD5smJiYwmnKlsG0wAvDtGd1nKQ+FN++2b/BR43ZIalaZP196jl?=
 =?iso-8859-2?Q?labOkByP6MnaVmxxltLsUAIBqoCVn1D9TTeR295D/LZCW+EG2fEN2eXxMH?=
 =?iso-8859-2?Q?pMYXYGmDNJcTa/EG8teGr4D+Rsysi4lu0mR8BC3faM+gkFQ9HVPacabcPj?=
 =?iso-8859-2?Q?FQHP5j1pE6SD1bOBwct9Bz+zg/0YDnyOaSItep4Ye0dV5NO7miPMs8NU2O?=
 =?iso-8859-2?Q?QarcHIBCX9OOm4EIQgEtkqDCVbFzaeWoFL33+porkF8XRVYTkVgULoBhD8?=
 =?iso-8859-2?Q?btZL5Ucf5r5H5KY+3+hI8TwHF0dTC5CSuWsd0/yRwAy7n/U5tG11SDsWzg?=
 =?iso-8859-2?Q?/m+aGruuiGXbkZVtUQUWaauhuNUut5aTp1U+mnC/D3zvUbywljUcKpWI65?=
 =?iso-8859-2?Q?VPsK3p+ke0IrvY7y6miRIUyfzobTuSaC2T3zYngO9myouBmhSaKnTpCyyf?=
 =?iso-8859-2?Q?S+aVFW7QxNX5dAN9D6rPj4lIa2nJYHQM2AhkD8SHehIJL4eGo+eeShVbD9?=
 =?iso-8859-2?Q?UhWT6LhUHrAO+TtYbWzWwPVaU2afL4zepcSMYSh+GyBZHjeDhSaxlW1IbP?=
 =?iso-8859-2?Q?znOvIWrUh43x2YcDtwCw5MTaxxnpSlIkrTiTehb+M47uTr6SxfZ0J2L0hX?=
 =?iso-8859-2?Q?qTjbwGEwe5fi2wSv3BjRsWeMvpSw4rdGuSjj6VCnLYG6l9JAh040wGQBR+?=
 =?iso-8859-2?Q?Ekg8wsVWezEm0ujxHu9EffwMrjMrVEd2naEUWvfYxWCKnAEoVRKPu2B5/y?=
 =?iso-8859-2?Q?NC6YuGPCWtqMsBk7SjfTNu6FgrA6R5eOR4DHsOy+6fzCrAwt0s9gVQG6Pb?=
 =?iso-8859-2?Q?+6xJc0VTNqmjtYtV4GQTmLo1Ngrz1ZtR9Qn+5Z2SiB+skIxzZC5IDckB+v?=
 =?iso-8859-2?Q?mN1IA4aFnC7ayHnfTffQ4QUI0ibtEqyfZgH7HC5cvouQKur5GcQsXExVvl?=
 =?iso-8859-2?Q?GeEaX1fWNocvHyvaA4stFpYlUhKczw68jssHUq2F9xSBH4BM9NpFJrzh9Q?=
 =?iso-8859-2?Q?uYO8Y5FZ+CGkiOLecztKCq151QynPUaJHqlShWfUKxTG5sc82MNh2ypqzf?=
 =?iso-8859-2?Q?LwdTm8PVpBLhdxU5aQdOeylRp3OTD+SnayNk2pLabbWTCzCI5GoHs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?BMimMm51uyw8kEq6+2ila7ByzsYJfEawIJcWlfihMAuYGgzHdRENL4AA6w?=
 =?iso-8859-2?Q?GUY/29gaYlvLxAoK8EaQJwOmSDP6UKddDO+AJmXjcsx/CLJyo1d5TgPiLl?=
 =?iso-8859-2?Q?06WgwgWqk0vNPSoXt3LsuuACb3qDkNPXRKpwGwt7KQh4N3gJG8CZVe4GkY?=
 =?iso-8859-2?Q?+hg3zDJ7Z371jDG+t2EumPIBcam+5+00LxtWHFgmCzH/A2kj8S5Q7Fqhwp?=
 =?iso-8859-2?Q?J7CQo1EWQQQTT28ZrAO53fdK/nRM0T2TE4N+oPR1x+6lMX8FPKDU69Zaup?=
 =?iso-8859-2?Q?aDAVtIJVkb+HlKTgVg3m8cwo3hBfT1fHnukh9ZFAkzHHHmytUnj60We99w?=
 =?iso-8859-2?Q?o6idbqrpKNETDlPZRf2OIx9WSeKCV07qC390vXdguICenKkSz1L5a5KhxK?=
 =?iso-8859-2?Q?HTsPnmehq7i4oHbVj2LMvb7EDLJaZVzSKBmiGgre8YLLtBhWPJY31lkWv+?=
 =?iso-8859-2?Q?bwmKF/H5IQlmZUIKKt7nk3mLWobtUxcrgFJJiuzSG4LWEBNE/TlDhwUyEz?=
 =?iso-8859-2?Q?gGGAXW/Qy5xKzKoXBP5LQ4u6xbLIkIokKZvj6iwQkn5PjKTS+mik7RFJXt?=
 =?iso-8859-2?Q?m758jmUkPD2Sv6jFkPWt//7VcD1HgjwvFZY+GEIWw61ZLoBjzKCPyCtwWd?=
 =?iso-8859-2?Q?YrPhG2dWRsSg5jNHM5V8tjYckNObnDlq00bp5IG220YBsk8Wd7BlSDiyjg?=
 =?iso-8859-2?Q?asHUUZ7rlin7NsLe+GcBgC3RBBlT4sxranSpRE7e4CC0cQVIGuDjEC7VH6?=
 =?iso-8859-2?Q?KjKK2/BO0bEH2bcCl69dL5Q6yVSOmaPtH/8ZjwDbX6cL9QSFVaBvLuMasR?=
 =?iso-8859-2?Q?EsgdFytn+u3/qqgFHe8osYUzpiWUnC62ZCqG4gE/WNl7EEBlFiv2wDbZtZ?=
 =?iso-8859-2?Q?CvucPeSFoYSk4Tl0DdhRYc3wex/GdsHA1Cenlv+U/7zX8OznF4xkd+/uf1?=
 =?iso-8859-2?Q?IrSsIqKF+CpHilnL8j3afxRF5d3+3eI5xRtGc3cMMKi7N+gCg+vtup/VL8?=
 =?iso-8859-2?Q?B3CPLX0QAZbKrHND1n+9D1WeuJSc0hxgS/tiEbvc66dDszw8pYQuM8M+hI?=
 =?iso-8859-2?Q?D0FwtTJsiIfLlBp8fCAMvglSUX3+QK9LFBdAPf5u6s7eCUhGxhdKDIxQDk?=
 =?iso-8859-2?Q?D1ocMeZwhZ1xMdngZ8NJA3ZBNdwjq7fGaFaoOetMV81tcetHKlenWJXwgQ?=
 =?iso-8859-2?Q?T21hDrckrsqoJFQU5nALVoKAbIf76DG/8ASmI6GfDrBk/wZqqUVhx1zdgj?=
 =?iso-8859-2?Q?kr/Y5hPBnNLhokoua9du0OiyK3d99govphlsFdRwPHtirTrh1NCGrU9ZE8?=
 =?iso-8859-2?Q?ZCWxDdMeEegynmFzgav14ugN9ikNVScLdGn06/2srP9Cm/qG/jMckzurT+?=
 =?iso-8859-2?Q?T7nSrBd2nXhyI2F1wkUsmKyFdp3tB9Fb4+WnJodAJL9j7IcrsTI9MhQjXb?=
 =?iso-8859-2?Q?9YGhmNSlCMneFQE+MrnFb1JpoNayW4WMsBQlAM5nXq+g8RjmC/dXBaTPrN?=
 =?iso-8859-2?Q?uve1rM/y1akcYfDwOdYoc2nPAUlntnk8DeVNgIrNl57ZXJ6IUokvQF/ZjX?=
 =?iso-8859-2?Q?3S+o0ZyZwwlZ27TTR9BeZQ6cqyWduT0K8fcdFbXCKiu77GSGh6djqE4vOq?=
 =?iso-8859-2?Q?oKE58t4YZjahRfyNg0LHu+niC27SbuWo7d?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a998a918-69e1-4427-d596-08dcb84bc37e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 08:17:52.1558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vngLiCfxkLiFbcxc22S5Icio/U8OOrE78OqOz8e+/6S/hK4yUQkALrPeRpwHz9bvZBrDJbP5csZD279OmIIp1S1Gnr8nBJn11nxSJnWGH+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6948

From da1630ee3ed664df8fbd74c4063ab130c4e98c5d Mon Sep 17 00:00:00 2001=0A=
From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
Date: Fri, 9 Aug 2024 09:59:27 +0200=0A=
Subject: [PATCH] pca954x: Reset if channel select fails=0A=
=0A=
Channel selection that has timed out is a symptom of mux'es I2C=0A=
subsystem failure. Without sending reset pulse the POR of entire=0A=
system would be needed to restore the communication.=0A=
=0A=
Signed-off-by: siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c | 30 +++++++++++++++++++++--------=0A=
 1 file changed, 22 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mu=
x-pca954x.c=0A=
index 6f8401825..0034e663b 100644=0A=
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
+		udelay(10);=0A=
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
=0A=

