Return-Path: <linux-i2c+bounces-6666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB99778FB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2168F2884AA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 06:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF41B9822;
	Fri, 13 Sep 2024 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="Rczl38sz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD7D143C40;
	Fri, 13 Sep 2024 06:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726210281; cv=fail; b=q9aaQDq2aaPUB8dS/4qVbLOvbX06K8W4Zqt9mq7NPQdbPDfRoM1McIAKXCZKB7/7GAo91mfkqkTb8d0sCCmnGfxmlVImGdRW3p5krQO6yRp7GvuNWl2V6l9WckwokMonQ8HCx4McnKXCw0cxHCX9oIJa0qFiqiDQfUM5JnMk9O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726210281; c=relaxed/simple;
	bh=XijObxYKpViX/FYJIkOJQgsO6XAgOLcvV6WB+2B2j7Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rFo2YFptrpnmiGp+eg58jWVu7DpDjbOZUBiA3Dw+TJFGI5qisMWjcbKcn4hzRMgP5LZS5MS4XMFFfd1QqLVzqL9E0luYokSt4cyWV1CoVLGyFaN68UHrSW77bpjmsJJHa4c1GmHEdD1QddTnBHKqyrMzU+KYAEnbBdrg5dwjan8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=Rczl38sz; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFfQmkj5KFRshuogHxwMTHnhGh/wo7Rhwd6JlgIv4COlF54LZOqo9TgAXbdxq3ovVGFv3pHsomZSYW9ZcU/7o/UsX/5KZrUKp68oFYRXZUIkXqtvIAWHN+o5BLS0xELl0OGzg//bmw7edcLo96Qz0QR42dpfSIjZVLJEmBtLCQADuuDxdhwmkOLsCGp78Dl4nfU/wwwxwHzP8dDQ9F7uBgGNQ53fjflmxhBx1R2oaxWPOyqQY6BjO+ibHfQqpBl7SkyRC+OO7VqDwTHkvvs2sgrnS7jNh047UHvOdGQlOWrAoZj10QoHKr/d3yF5+pRTbkOVwhsLHHKZokRgr93Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4muBqgwpc+a4z5zH5aZ38iY0RdBI2H3bvcBnTChOaIk=;
 b=A+U2B09Rch/LH1jbGJrSSppqOWyPsN6oQQ7SWpoR8kLwBU4NvmKNPZpTHDLO3Xqbd6bVvs8Gvj/XXJH/ty7e1Z7ccr3jm0n1/vW+LAgPIAf6sP68FlQMapd5eh/71wOecME1S332aiqZR34x5QAKFs1ykuKKiUKD7pwX6WA06iyKDSwlmrUF/3eRQf0A/DfSHWx8zXFLpWUperKpxLtUWG7iPER9L9qV++oYv9gX941VYFvq6kyFeEoowKOjBhMZlMx2R9VnX//DLyjmYZm8ZFhDZkp24zWsS8PZv2VWu/D4iPOMVaTdeszRF0xoW9g/ruYCk281NCylY4cECQscjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4muBqgwpc+a4z5zH5aZ38iY0RdBI2H3bvcBnTChOaIk=;
 b=Rczl38szBE4sOeEadEsxNoqsI4ppxSF8NLOG0N2jiKesqecUSE6rUfqXVfnUHsctG2UE/2PF/uTQftzzbtBfWy3Zu6cwR41deAdr7TVJ+Lg9HscoTNLw8bmDaQsSGcAX4sLerSYqz++vabJJHlu+Dbp4SYC09j5YIIfyQx0npEZ3oje4NYEwbuwF1IBzZy/dG2DlQgZw+tefsjn+MInwtiLM3K05fIp01nIwwZaICd3C+lsehk0UelkQhi10EaqeC8U4hAdB+9yMstMDva5yNcfoEybuY6ZTh8nk6+4D7pm/g9LEHr6U+Amm8vzXCYDNUFc354x9LbqnFszNDm6vVg==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 PA4PR07MB8389.eurprd07.prod.outlook.com (2603:10a6:102:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 06:51:17 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:51:16 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v3 2/2] pca954x: Reset if channel select fails
Thread-Index: AQHbBakvQJCOfWHDv0+K266wlnTGWw==
Date: Fri, 13 Sep 2024 06:51:16 +0000
Message-ID:
 <DB6PR07MB35097CC094E6995B2F66A17A9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|PA4PR07MB8389:EE_
x-ms-office365-filtering-correlation-id: d906e9f5-e771-4830-a434-08dcd3c0775a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?ba8Gj28x0Xsv8f1QVV4CIYXi1xgz29xvUw5BE/la+6+x2aRHpTDsI6ET9C?=
 =?iso-8859-2?Q?ScYlSD0FyOz7jEUISB1N2CzHUp+ZUdnPODydGFFr1y2pxK28O3n+QaORN2?=
 =?iso-8859-2?Q?aLX5I5RA0pQHWwA4wnyHztFoyC4geMlItlSFS86Vo7VHHtkpBpxVUqPjvO?=
 =?iso-8859-2?Q?QigZmprzGqePn49UVymB7bMQwwBCABCkEfD9GEJoFOIN8le40M6e0ANvow?=
 =?iso-8859-2?Q?y7br01HUP2GuU+RN/vzSSPnRreOE44zwVjHnlBwsbqOqj59NbmGRWEmah8?=
 =?iso-8859-2?Q?7+5lcVtrLjqxWkGvLPtaW4tC/jlh8bhLLuIkruLDn0YOY6rL5QjAUroiCW?=
 =?iso-8859-2?Q?pHZlH8bABppPoxKCMkqcxLuAUCOYXSDYi3gqgZap0aFgoSYtC8+Q2AbUTA?=
 =?iso-8859-2?Q?SEY1OQRVbOmwaIywdRYOP6S1Cpo7drcXiOm7I6vvpSl+1/a1xI3KnXcNo8?=
 =?iso-8859-2?Q?keO+G8F+fetjA36woaFEHYlkZE8X2pdMsuFp+IeWGLtvn8b3LNmKFWTk4g?=
 =?iso-8859-2?Q?s96iWvsJDvZqH54KIcr9tA7BAIuoqA/WsnlYHbuWHqAkdpYYYAkLLCsVYi?=
 =?iso-8859-2?Q?9Zixoa0/ocnmqDAUChz0/0q4JzXy2XiEEM2PGTBaGTyJuNJSq/Cgkxxy9t?=
 =?iso-8859-2?Q?ojVtvE4Ebw/g/UnsgZsPx4GhqykYPkUti2/GzElKGzgChzNSrXc1ltPoon?=
 =?iso-8859-2?Q?7qD2OJZLsm2/2DPxuN3io3+w8xEBAKq7RvTmwk4VFad+hXn/E/zDXh3U3e?=
 =?iso-8859-2?Q?A8gcKYQDD8InJZX8BabZOVqo7KxBlmKYAxigqV+UfwLYOHwzX8PpaM64qh?=
 =?iso-8859-2?Q?O3B2rYVoWMclnKoUMvgHn0I1R8XeQGitwKiJFIuH/0+ImbTFA2iPOp+yPL?=
 =?iso-8859-2?Q?R8w9bpQApJd55HnDuSoFdQYCGIZ+ePEfJZoIG7pZ7XI8A6RKqvwkrT5ePH?=
 =?iso-8859-2?Q?kO0aaAQqtNKVSD4m19SnzEXfVX45JTG6yJwXVsZYE3Rige0EYz62Sirhdu?=
 =?iso-8859-2?Q?vEyXZhtdctcTT78YLmWor6x5tXYFDJqQcMOJPTCt1M/68z8QCaLysS3N3G?=
 =?iso-8859-2?Q?huu1CHHZXlm6/BGdBILYC+XApSq8k5Px79uuxNWC26L2OkBKVoo/MxR2Qb?=
 =?iso-8859-2?Q?WorvjDTNxbf7nM0977wMJcpBI4CKJezhs+vEK9Vpm5V3QR9C62RtrqJu48?=
 =?iso-8859-2?Q?7LCXPI0E2LfArDTBrsCs9f7jmPXLe0SaKxIOesPdznkAwaEE2rPo9XfGTs?=
 =?iso-8859-2?Q?XNzfSx2ham9Ip0VNhKmTNG761WczPj4E6vsX/GKSIwt70/34wuq4/h15k8?=
 =?iso-8859-2?Q?UHuPyjCJK28wUq0KMqLd8dAl9caUj1KlC7vYRAoyS7ot+cux4raLN1q6ed?=
 =?iso-8859-2?Q?CmFUNLIEYZFBcpIbzr9qbloAUAxZN+jA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?tPCv5iEqtPOGtVHIl12E1usZKa4nFjX7fMxwvAFUG757k/91TLfEu/xFmz?=
 =?iso-8859-2?Q?GkiitfFeRb6MMIgwqVh/V4V5+nt+wr1SifMGqKBfqmd4//1QZK7DrOE1aN?=
 =?iso-8859-2?Q?+hpBMvISBigJQ9ir1wSl4OHvg9Yr8WJw+dG64zghDK/QOuE+q+xeV9WxYc?=
 =?iso-8859-2?Q?lDCmrwxoItoiqyoCjPSQfbM6qVMWrCoOg7+fj5D2vTvEbbtbviT4ijiYk5?=
 =?iso-8859-2?Q?wYLRYq1Gvm7ul9bDKZx8LH5HlGFlzyKr1BjCXsfi4Q68BSnit/aJ/0KZX8?=
 =?iso-8859-2?Q?TMCItAunzWEOovgByk2pyEahUJmPm3/kyKzRNsL8pfSuCraVL24mQIK40o?=
 =?iso-8859-2?Q?HrFjxv53yr/SKX7RE0y0OJpV9Mhbmw5vf/HBJgHh//N9eHQsi96fBheQKR?=
 =?iso-8859-2?Q?vujI6tMTdsDgmi5lFxBJCK+9YE4Ne4pc17evUw+uNjst+pqtiJNZ8/D9Pf?=
 =?iso-8859-2?Q?PAYzz1iAGO5vNFtQMz+Ajx6eFVNJqZLakBVB5/WO4xN1aqxU/7tSXem3M5?=
 =?iso-8859-2?Q?6hOjTBVoa2LEo9TYPXtUWy6bDLRvM+QB77BAmMddAmO2lVF4eSQs2sdZUU?=
 =?iso-8859-2?Q?G8LWEBwNIzqeMKDahHgblqqiiBjjLtfJoSwQM8cxbg1v8x8XICH2i8pLQ6?=
 =?iso-8859-2?Q?hQSfdIFdFL34stVnb62/du+Cg5LdN5aELVxMAYXY9stBKwIbxGFUwD9zvi?=
 =?iso-8859-2?Q?THqh4J+41Lya16AQPeVFi9jcMVBxPm3EYxaxxBp7CY1wPGv0TeUdIr1v4X?=
 =?iso-8859-2?Q?bBVrlH/SwY7nJXomZF+G3Lq15lHJi3wTI6XJZTgWf4hp/aQdcZiLUDTTds?=
 =?iso-8859-2?Q?I8lnK1qRYKl6N6unnJSOHtCSwP1yT7ul5MNm/ZZiO75UdKtLo7Kn+sbXCP?=
 =?iso-8859-2?Q?adpuJGtsn0h6UU/uLk43yRmlOTiNZyiV2ebeGO9aP+ybkJLGXOxn5AQKw3?=
 =?iso-8859-2?Q?UniuSNyf8TR8EKgW8dG3Pmy0VBswVsTjt2jq4iDyqdFtSIG02d08GaM/A9?=
 =?iso-8859-2?Q?hDgokmejsrLCUWXu18lZ66YkOJ6j2FjQqbCRBp4ZTSIfa++T2evP4cmRsV?=
 =?iso-8859-2?Q?tMjHsdhTqu3eV9Zy2eNkqkNDFsyiTVRL+QhkTk2K/qtojn8iDr6bwxyKsz?=
 =?iso-8859-2?Q?bKhR4wzSlowjzc9Im5LSZm1vAhHv4yOieIdAeFyPPsig9CnbHzyDCPi9ja?=
 =?iso-8859-2?Q?F9tBJrBe/MALKTYtRKFUIWj9/5TUau0gn16ZEEBK0ziP7DBWJe4pIAvEgt?=
 =?iso-8859-2?Q?xf5+sYVR8+ExLvSTHmROL1HTaXDSUpvZoA7260+2KRf67zibL2AnDDyKPz?=
 =?iso-8859-2?Q?YDIjdz15dh86weIrOJQ3uBo1pD2Q4ZwvNFah6vkYY1WhVOK43K6yDPH7ZR?=
 =?iso-8859-2?Q?i6PZz3qrr43wovhF00ehd4PuQFxWaO0Yi8Oe5q7XY/teopjkD3SmylN3zg?=
 =?iso-8859-2?Q?FJiS67SwQRvkd+MM4VejjW2KSKag4v+KkCwyltwEZSvY9DOcTGJV/ZtPA4?=
 =?iso-8859-2?Q?69fR8oix05r2DVLQrOr9iWbTb4IBDtUiQ54TcDNxSL3gQJJT1CvKBcF0kx?=
 =?iso-8859-2?Q?5i7B1kW+X3kbqMJ1KfZdB8XZd2LAeZHWjK0dmxI8ezt14gJAffewgz9kPF?=
 =?iso-8859-2?Q?sSmUx0lmdRUMT7pQsQ1LW0Q/aiBMbdlTAm?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d906e9f5-e771-4830-a434-08dcd3c0775a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 06:51:16.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIcARrNaB1MpFpN+9lOz0A/NGJallFc66C2EpF3MDaW3FQ/ntkD5yoN9MmTcSb3r+La41t31Xcz7Zx0YDP7uPze8G+xa8CRVNLOtnBrCLjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8389

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
If the channel selection or deselection times out, it indicates=0A=
a failure in the mux's I2C subsystem. Without sending a reset pulse,=0A=
a power-on-reset of the entire device would be required to restore=0A=
communication.=0A=
=0A=
The datasheet specifies a minimum hold time of 4 ns for the reset=0A=
pulse, but due to the path's capacitance and the mux having its own=0A=
clock, it is recommended to extend this to approximately 1 us.=0A=
=0A=
This option can be enabled using the i2c-mux-timeout-reset property=0A=
in the device tree and should only be used if the reset line is not=0A=
shared with other devices.=0A=
=0A=
Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
Changelog:=0A=
v2:=0A=
  * Removed mail header from the commit log=0A=
  * Decreased reset pulse hold time from 10 to 1 ms=0A=
v3:=0A=
  * Make this functionality enabled by appropriate property in=0A=
    devicetree=0A=
---=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c | 48 ++++++++++++++++++++++-------=0A=
 1 file changed, 37 insertions(+), 11 deletions(-)=0A=
=0A=
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mu=
x-pca954x.c=0A=
index 6f84018258c4..c9ac0f9c9408 100644=0A=
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
@@ -110,6 +110,7 @@ struct pca954x {=0A=
 	u8 last_chan;		/* last register value */=0A=
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >=3D 0 for channel */=0A=
 	s32 idle_state;=0A=
+	u8 timeout_reset;=0A=
 =0A=
 	struct i2c_client *client;=0A=
 =0A=
@@ -316,6 +317,30 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan=
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
+static void pca954x_reset_mux(struct pca954x *data)=0A=
+{=0A=
+	dev_warn(&data->client->dev, "resetting the device\n");=0A=
+	pca954x_reset_assert(data);=0A=
+	udelay(1);=0A=
+	pca954x_reset_deassert(data);=0A=
+}=0A=
+=0A=
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)=0A=
 {=0A=
 	struct pca954x *data =3D i2c_mux_priv(muxc);=0A=
@@ -329,6 +354,8 @@ static int pca954x_select_chan(struct i2c_mux_core *mux=
c, u32 chan)=0A=
 		ret =3D pca954x_reg_write(muxc->parent, client, regval);=0A=
 		data->last_chan =3D ret < 0 ? 0 : regval;=0A=
 	}=0A=
+	if (ret =3D=3D -ETIMEDOUT && (data->reset_cont || data->reset_gpio))=0A=
+		pca954x_reset_mux(data);=0A=
 =0A=
 	return ret;=0A=
 }=0A=
@@ -338,6 +365,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *mu=
xc, u32 chan)=0A=
 	struct pca954x *data =3D i2c_mux_priv(muxc);=0A=
 	struct i2c_client *client =3D data->client;=0A=
 	s32 idle_state;=0A=
+	int ret =3D 0;=0A=
 =0A=
 	idle_state =3D READ_ONCE(data->idle_state);=0A=
 	if (idle_state >=3D 0)=0A=
@@ -347,13 +375,14 @@ static int pca954x_deselect_mux(struct i2c_mux_core *=
muxc, u32 chan)=0A=
 	if (idle_state =3D=3D MUX_IDLE_DISCONNECT) {=0A=
 		/* Deselect active channel */=0A=
 		data->last_chan =3D 0;=0A=
-		return pca954x_reg_write(muxc->parent, client,=0A=
-					 data->last_chan);=0A=
+		ret =3D pca954x_reg_write(muxc->parent, client, data->last_chan);=0A=
+		if (ret =3D=3D -ETIMEDOUT && (data->reset_cont || data->reset_gpio))=0A=
+			pca954x_reset_mux(data);=0A=
 	}=0A=
 =0A=
 	/* otherwise leave as-is */=0A=
 =0A=
-	return 0;=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 static ssize_t idle_state_show(struct device *dev,=0A=
@@ -543,14 +572,6 @@ static int pca954x_get_reset(struct device *dev, struc=
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
@@ -625,6 +646,11 @@ static int pca954x_probe(struct i2c_client *client)=0A=
 			data->idle_state =3D MUX_IDLE_DISCONNECT;=0A=
 	}=0A=
 =0A=
+	if (device_property_read_bool(dev, "i2c-mux-timeout-reset"))=0A=
+		data->timeout_reset =3D 1;=0A=
+	else=0A=
+		data->timeout_reset =3D 0;=0A=
+=0A=
 	/*=0A=
 	 * Write the mux register at addr to verify=0A=
 	 * that the mux is in fact present. This also=0A=
-- =0A=
2.34.1=0A=

