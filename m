Return-Path: <linux-i2c+bounces-6693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F84977D40
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFE0C287E60
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5311D7E5C;
	Fri, 13 Sep 2024 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="wz3R9JIO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0E1D7E41;
	Fri, 13 Sep 2024 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223001; cv=fail; b=t/ekyER6fko12cQ+1jlxjUZJIjLuSFTFEhi3JaMH5xLmniGuMo3L6nMisQA5VbkNfZ2gqCa4wCL2eD0pnZMCBNBZDLfej1AGGbqkuarLq5VNJGjPvVa8jXR+iZ8riIZzY6dpoVQpGoiE3mg70Q1FmMv4k8QHE+Ux2dNIf/16b7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223001; c=relaxed/simple;
	bh=UXodRyl32N1s6rcdn8T5P0Vsq5LsmPTv+nKK/Ktzr0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XkUOyxBxN0m7Ix+l+J1yBnM4PgL/eBpY7dyKqYhxKiZVY3NpLSae44FjPRRchJxWGgnLCG+zLX19/0fqLyjOS8t04VjGInj9uUnxLW38frBN8OGmi27oIE7JL3acYLJgF47bK8MVitE+r7LEAkZarUGIat8ERynmX8NFuDZoMyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=wz3R9JIO; arc=fail smtp.client-ip=40.107.104.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCRKaUUJ4HB8RTORJSjVCNIALIpHw3oSq81GNsgeUGq6WjtulyNduO2I4N/iJGDUyVA8JDd6LPPX9bIWqhYWeUG/j9GAePZBcfkktPK2GnmFliG33DtaDv45CT6/F+2DIN8S47R2bej1aFaN6sHKQer9f2qXWYGDagT8e9TKpT83s6f/GgHjEIGkBVtFzD0dsSFHTCsqYU329xy+bJkWOEukBmBKE3tcD1nvC/rLpf3KlwGUgSAWpaTm/jWfIWhJI7zgu56klpAmbkOPO00NMQzCh9WkWgRUjRouaorHP2BtC/OhuTTcPnxF2pxHah97qEYcAb3DCbsG5gGBE1w7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXodRyl32N1s6rcdn8T5P0Vsq5LsmPTv+nKK/Ktzr0Q=;
 b=nWfn3s3rg/+pH6Vsonq54jMr7FyFTBzr27CC/jSTV3z0B6f3GGVOGx19Jw0z7MZCQE3teS9mQ+rt//2LihfcAhqIPhDGi6jaWzg79Zwtqfr2wcH6ynVBejSHTPb0jtieSCtpnNur6lekmKSCDO+MPatExRa2fPimIjBrkL66UMXBQ4yAoZjNMinLxzKP+2LmhNZ3qLd1Pf95/NTyLQQwIeACtd7xrnJYld4tO9mi4IAVZlZ9W5N+TUdCMCVBaJFZLmgNCrhbk4ciVBj3bxpV7lrgycsM8Mp+9/mbvUkNI/OH61/lrfTf1YSShLONpCXocjFRH0Q3pIpDxEKRaAN+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXodRyl32N1s6rcdn8T5P0Vsq5LsmPTv+nKK/Ktzr0Q=;
 b=wz3R9JIOqYJinx3EsaZcBGxpX6Q1DEp+nQNDLNLeNuL7Fd3ZgwhPp23oQW4KRfzwVwQi3Tjo/R9XO/TkWOhuZQTP9EYUMW5Q9+6mRIC8bsZ2Ku+6hWsLgX/jp4fJ7Hj2kLI/8hcBirlfgkZVcFDQfyhJ6ZigEx4E5FX8RF2uOAnqZv/OPKXh5a4lGsRmPyR/b+DU8uyuc7le3H4U/YVa8U3rNeepHwiO4TTnKS3CU7DscYwUnUA9BVHwhBKUgH1LnImimphao051VNO/V86mWRXnhWpQtLv3ikVvBZeljtJlE0ZqZiCevqjGojtfO31pIv2rNI1nGQTqL9Xf7324Ag==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 DUZPR07MB9763.eurprd07.prod.outlook.com (2603:10a6:10:4b0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.19; Fri, 13 Sep 2024 10:23:17 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 10:23:17 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Rosin
	<peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 2/2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v3 2/2] pca954x: Reset if channel select fails
Thread-Index: AQHbBakvQJCOfWHDv0+K266wlnTGW7JVe14AgAAGjpU=
Date: Fri, 13 Sep 2024 10:23:17 +0000
Message-ID:
 <DB6PR07MB3509E45E975329EA62723F179D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
References:
 <DB6PR07MB35097CC094E6995B2F66A17A9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <20240913095730.GD21327@pendragon.ideasonboard.com>
In-Reply-To: <20240913095730.GD21327@pendragon.ideasonboard.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|DUZPR07MB9763:EE_
x-ms-office365-filtering-correlation-id: 3f47e91c-d768-43af-e507-08dcd3de151e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?9lc1QgVmV2gJQJ0RTJ7AU8Yc2341SpEF6vBlTh80SEWYx51fe7M529I9Pt?=
 =?iso-8859-2?Q?RhQd86CsbVGVhZ0OfYFV4N8N10Y8mX3ShNOcOM8Wc97pfmGYoZ9HOlbSKB?=
 =?iso-8859-2?Q?OPjisYg3YWm2pGGh6bXuO9NWgnj/9eUdTjT/Tk4A8A99d4AYmtyiTRbhcT?=
 =?iso-8859-2?Q?hudsXw/+ijTUx4P1B/1cOomVPcDB9Lsw+01FxCDbL1pshHdNOaXGMtXqZs?=
 =?iso-8859-2?Q?W4idhvbJ4q7ei3a7VZtci0O537IT2OoNinKZJPnwWIBxZ+pK60vOitbkyE?=
 =?iso-8859-2?Q?nK3t5k6cXKfIb5lLJNuBSfaTfKI2tjm7JnHrZCPqmDo+XfMn7oM+/9U+Z5?=
 =?iso-8859-2?Q?2Fk+Vzn8gnZY363Ge1i9XxpvVwjLawqmpl1qLYPuHU+giYSM9GdZJHi8Wl?=
 =?iso-8859-2?Q?jnEuWWQU4eyj6pZ8rR+VcZxAbl9KgYXfXXf6tH6k6Y5meRzj9aMkFc5z9x?=
 =?iso-8859-2?Q?3pmGB8kRTGw4KvZtJHZrL9q55k9TKyj7Zo5TNm8RDdPBvrwMx03jTEICYT?=
 =?iso-8859-2?Q?EC0mHDtUPxmJZoX+ny9W5Jk0AbXh/a7/GhokoT+EvfgEgRPs2QoEP0LXWk?=
 =?iso-8859-2?Q?3/QpTsN3mUCbAvsOcrXnSmhgyK6s8FVzXn4CqpzIHuXl9sgnCBE/drLF/W?=
 =?iso-8859-2?Q?FDfzyIE0nyKQp9/9FsTXvQDC7UWBLeODDY5bKpH7Ng2dEOCVeypmkX3HHu?=
 =?iso-8859-2?Q?vxX8haROCWIwSm41UhVVvYAB/HBCkq/CI09t9CCto7JHhg7jqkcPuYByGA?=
 =?iso-8859-2?Q?c3wnQfr2gYJtvLgpLBqUcqk+trjap0a0RDOjWom+XBQlUqbKPWipMLK4vn?=
 =?iso-8859-2?Q?33VGDYtZS/rwaFN0sm/z0qMRMGrDEb96VADt/1HUYwflOPFmXmMnBrix4D?=
 =?iso-8859-2?Q?yxUFKZ06u/Wixu3ZnmIAlp4soZEvQ1QL7KYXCmY5dug+qX/5MypdNGAwMJ?=
 =?iso-8859-2?Q?Trs1Iq5kGt0Koe6A3sBon6O+Lc3gUzcTZk2CvBphzouOAjhWclYzb/DwQy?=
 =?iso-8859-2?Q?qD6KASwR4bYM7XtNLI9rlHo5FQBR4LW44JIFuNXWkDnnL6rjdS7ht1Bqof?=
 =?iso-8859-2?Q?0kVRBvz2sv5uodSwVrrLpdl61chH6aZo9aeHNmY2QdVcXuWn3B6xc7+0j/?=
 =?iso-8859-2?Q?hMQUVl5ce06EyWziJDC/LaK5ucof2FQqUB3U11YE6Ld4YkZjoBt9fulAhu?=
 =?iso-8859-2?Q?MLZ4cWhHrgiM5Qm4vAUTWSh1EZJC3n6t7IPrRBHS9WDUMvfqaNpe+W7FXM?=
 =?iso-8859-2?Q?5RYTx8rI7VbQFs6ZWa4UTgfbsx5aNTc4CyFoW4vEd/NupXCIzXEP2u8bAl?=
 =?iso-8859-2?Q?90QsjuiRhtQWQhAnTn6dB79441vTkaZMPgL6lTqk6bYGO/vBbrZe+5RJvm?=
 =?iso-8859-2?Q?t9KBWAyAcSDd6I/DLE5y75luinoYuLG5XwG/FvVIK3OP+4SZGMCr/0q6Xl?=
 =?iso-8859-2?Q?kiwnvpXRh/hP0fy8hOM+doiH5DVYCZtulK4biA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?6lS2IK2bM9N29LYD/mLdJVAwGTMOokMgCpIA9DWC3bCc9Xe9iVfKDFxtL2?=
 =?iso-8859-2?Q?zg9wkAqb19KbUJmwiTWLItsQvUHlc++sJ9eNB65awTX8Mw3sm+yDXSZ2tk?=
 =?iso-8859-2?Q?6g/SPwAJn6OrbPRpHY1VmUHmLA4fkvYczEI1v3PQ15DrUVAb8+zy+f03oQ?=
 =?iso-8859-2?Q?PJu3kUQWjzoGCmdMsBX4Byi14zqV97/bXEbLJbEtmYEansi+B6Bt7nY/98?=
 =?iso-8859-2?Q?wU6PhKdLCDkjTEdQLs5eBHw89EoyQrRl2MODZuHkI4Gt87vTNrLalhWpLI?=
 =?iso-8859-2?Q?CpyIfgBUawR5RShOMUTBRRyLj3+wiBnw+WC5AbGrRoZQkVcp2KAlKPBMPN?=
 =?iso-8859-2?Q?XoItOP5sT0/hq587YSaPlkwO6rTi9iftzyb7uesSRiHvJMVxdDZWrSiAYF?=
 =?iso-8859-2?Q?YyXUuPGkpRtSqVaOoIlpi2jYPyJHF6AGbnlKrOr0VJRCNsUFV0hLFytWvA?=
 =?iso-8859-2?Q?/JiKO6IekVj8WC0yqMEd2c0VwSa0tV7TGWKIYFCzi92PHidEq7dOCWQDPG?=
 =?iso-8859-2?Q?zACmE9QY0vFKXQwyQ5KZY7Y8g+PvviEFxhihv6lqQMhZ70I4JvcWmxr4Nm?=
 =?iso-8859-2?Q?2NkDGlpK0IEkJ1AD4WPPVkv8z5NUjEX4HKgfxOkCYNV57SA75bQfFd/lkg?=
 =?iso-8859-2?Q?kmAvRIOHeGnWxCCBRhxM9RsvYE81BmDXsXA8E6Z+xrLukAzc1ZD0JOoy1C?=
 =?iso-8859-2?Q?DP4PCuWQVOCUnlR8sw5OAK0kfL2r+xkyqJhJ+KfumOGhhWL5o9hq3fM8nF?=
 =?iso-8859-2?Q?7+NiAmm07Y7BMHrzPVWw5UsO0f0Jw2MqrPF+8lSoTRV/okxm4CGWIIqR46?=
 =?iso-8859-2?Q?fkmKvCzkuJwcMKmdssSZY6VkDGDWh4skWdBW+yFUBETQEUf2ei/UalKZHT?=
 =?iso-8859-2?Q?RDQ650wlPFlZtds00aLrrKBrZIzaVx17HZQlVcHs+/Yv2h+eJvv/92Mhvr?=
 =?iso-8859-2?Q?eJ00rvFsBEsm9ieWRsfLmdUuz2EvRCybwPvDoG2psdLSLOrTiov519v5yW?=
 =?iso-8859-2?Q?6+/UU/WH9YQRTOQpujld35vYW+jc/5o9Gt9EbsDERYuNVvpap2OHDIvgLd?=
 =?iso-8859-2?Q?Y0ZYaLwgH67SBB/sfLvb96o8wMVbPgXGrfOaj3lXpMA5DvCDzM7x9L7dxh?=
 =?iso-8859-2?Q?XQHOF4a5ZzLoosS7wze2Y2PX0viQpdfPfl8JB7fuAzuXk9FR99Alwbc5+l?=
 =?iso-8859-2?Q?Uh642pC4riY7zDSxeue+SN9GjhePEOZ6DeR4qFzORU/IZFdXoyFhQTafxL?=
 =?iso-8859-2?Q?W/4sVo7uUyZ7Tdh3zILSgOpPccftglPdgMoZnswPCysQ5Qg3xMeJK9qbE2?=
 =?iso-8859-2?Q?u0El4PJsCciBXQvOKZx7iu7uxPWs8M1xV6wtqU71u3J68srKA11Y/Cnrsg?=
 =?iso-8859-2?Q?5hN8NYRIkh9eyAnRR5enYSjutHaZc0+2eDXbpTegKSpshH73FxsJezAS1L?=
 =?iso-8859-2?Q?m5/LVD7aCe++s/3U/csLjD8I7YlXzc5zkrXPp1qV2rPk2NNz2Q/wyaxB4c?=
 =?iso-8859-2?Q?VovI1OvMhDLmYOeIco0kNvfKgrOE+W7InVgKHOJforr5ig4grWkKKDdGRT?=
 =?iso-8859-2?Q?C5p8tZ23CVQU17CZgEp+S8ZFzU3gayhlwsAeujSFwacbOX8gdPNH0KILbP?=
 =?iso-8859-2?Q?KaLYTD0FkAepXVkeUkWGE/+/JPfEEJMjz8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f47e91c-d768-43af-e507-08dcd3de151e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 10:23:17.0113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Ym4nvJd+mlTB7NLS+qKo3tVW2J5152hDasmmVLk6tN4Z2Rh4jGV9cipXFzPpr+pPCSTihv8LGE1ZF3Ma6c29FlGpoI8huyWRr69yHxSggw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9763

Hi!=0A=
=0A=
> timeout_reset is set but never used. Am I missing something?=0A=
Unfortunately you are right, it should be in this line as additional condit=
ion:=0A=
if (ret =3D=3D -ETIMEDOUT && (data->reset_cont || data->reset_gpio))=0A=
=0A=
Please look forward for another patch.=0A=
=0A=
Regards,=0A=
Wojciech=

