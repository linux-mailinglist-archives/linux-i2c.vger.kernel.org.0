Return-Path: <linux-i2c+bounces-6664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2C9778F3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E67C2884E3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 06:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBA0187563;
	Fri, 13 Sep 2024 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="h8akG+Ad"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2055.outbound.protection.outlook.com [40.107.103.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC89323D;
	Fri, 13 Sep 2024 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726210104; cv=fail; b=kOEJ7rCqpGaxlpfbmFzUMz4rwexeW11ymJVrGbybP+uy0LH+1CNQyAHx0xmDBUQyPI60Lq4/FXYY1kUVx7A9yDNlgIpvy0hQtxtlDAhSGdL6f7B8ZhrsMndKCoCd9qReLd8jz30BFqGCwR9B9gl/cNfD0NNYywTxD2AvO64h218=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726210104; c=relaxed/simple;
	bh=8eYQWhGCaDHfUBlRj820Ux7EgHWS034hPCxdoRkeaaY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P+3WElGZrM2SPd+V99ghq8HlRx/Qo7DfkyJpK5zirpzLFPGJV8SjgAZTbu0OEajsVp6PH+56wgdFi1pUZGynfn9aiQ5ME78fpTWDUWhvh+PVNhkEtn1it72B4iN0jziygN+snOitPaazPqThOhj/rcgh/PuzerVwV6RMp1N/QHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=h8akG+Ad; arc=fail smtp.client-ip=40.107.103.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzS3GOGyLPHyrEAOeleJi1omVOl/dSZ7yRkTrxOvHPXWgfps2iAdsmZfmVasNN49mj2Jog0uKHBiUM3NTDj0TKmFhWmDkur9HBHQPlj8NypCRsDZA5tTe073XIoR67syO119+vssnviDViQXR0Lqsc7LEwsKS9HZW0ONwTsKMCSr/bFCJFhr1fInp/b1a4QDSxpBZZFNoc4iepaapyd9ubPsp413i5CwRCfOgYjhL6yClOSMSr92qj3KlLOG9zIpchgJ0ygcP/dfqwXhKtE9dkpSS6+4Lt+ic3uA5oJDCvVbNh7TnlExVVwgsLGlZoYFnYcNVsVPGLm1RxOdbB3DeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQCqCwiM44PlU66e1oU6TRJPTnOkG4mzAGMviDKZ2fA=;
 b=T6dsEVI7qswjXM1d1BaqDa1U6N9Sls0vtF8QV3se2x44e5eE7HIVTg7VBUV/RHqYLuGtwMGkaSVhORFb4jBrhbA/JAyNGxZRVNr4Jhb7J3mt2UpZ2Jprcr+zGgvuohJjiwnizBNVjgwjUs4UjRY6UM9rnIcfoo7wXIEUbLovi/XDjI0ZziqkiIywWfg/Ovvtf3Vos7Xmp38eej5S62/7SliFWjc0WQtT73sYBGyIWS41nksIiC2eXZDqmG4mnFYDyw7B9T2SjWw6zwoffqVQu9djZqfTzcp5gZXGNDjzMbzIhoHsIkS7/WnZ8EwxFPt2QqCW+S0c6V6+K/K5ho7syA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQCqCwiM44PlU66e1oU6TRJPTnOkG4mzAGMviDKZ2fA=;
 b=h8akG+AdDBItKDsn13W+nTgOjpcnSr1gUIWQDY50iX0a9WYZa2hjVnjqJs08zoilBE66Oq0HKxMLYdvqbCu1fM8DIPkvbMS3uYtgZjtiIH1Q5ERJE/sDe5PftsrqJJS5QnLUmt/HaLcvceQmD0tuYTioxKI6mN2o1LFGEaZP5p7KKj9G3zr5kX682cWshsO+MgLXJyKAsSpG9+8nHVuVXsRuALPBOLjiMyBSORk02VyUu96KvSiQxgno/eny+nsPhpwWwogAIJZjaL7cI2BsxcFlzKIf/CvkDP0mLF1TfS/OZ/3JnE5JbIZoPzpunyisBbhoO3fmRNNgVS1OvgUhRA==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 PR3PR07MB7049.eurprd07.prod.outlook.com (2603:10a6:102:7c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.23; Fri, 13 Sep 2024 06:48:19 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:48:19 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "peda@axentia.se" <peda@axentia.se>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/2] pca954x: Add DT bindings and driver changes for reset
 after timeout
Thread-Topic: [PATCH v3 0/2] pca954x: Add DT bindings and driver changes for
 reset after timeout
Thread-Index: AQHbBagDIAKDVzc8+0uhDm67jHcvJQ==
Date: Fri, 13 Sep 2024 06:48:19 +0000
Message-ID:
 <DB6PR07MB35095EB1C81FC212D9A6D91B9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|PR3PR07MB7049:EE_
x-ms-office365-filtering-correlation-id: d624f2e6-9208-4160-27d5-08dcd3c00d6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?Wsci6YmpUucgJUz0MtLftcGMcEIptRdQMoVgR5pc8iBlKA2/wIaSk2b8hk?=
 =?iso-8859-2?Q?KtSnS80w2uUeAEn3kpWmJkWGZXGgIsQDOdPlEG0Ijil4HJ5w12k71sbASY?=
 =?iso-8859-2?Q?3MU6UyNaaq30syqnhxIxWCLLQE0G+lkZA/YT4uby88W24OtZWU+f3WKQpR?=
 =?iso-8859-2?Q?9zdGh7Tc6orrkbLr4V4BlwIPEm4lszRmNLTwiOtywXqCMt8Rmq6/qe4qz1?=
 =?iso-8859-2?Q?+Aw+CTY6p7027nCM4uvA8kNzk+vvEKCha+DsYJkpuOnHz6H1jR9gR4nfSt?=
 =?iso-8859-2?Q?Xi8fbFywcGLmjsC08JC6JUm+bWFcyCBVLcUQ/M2EnDY/SC10ofmzLMSUey?=
 =?iso-8859-2?Q?s1b6j4o3eS3KhDS/GfQHtetMHw7tv2+7MoRT2NQUTIKcfuYwXTXyhkm0xV?=
 =?iso-8859-2?Q?1vZ0WZgg8C23YXnKz+kZH/b8p0ppRWzL3YqWYr6G6idGtQj2Tn55jPKb2i?=
 =?iso-8859-2?Q?yavxuQmD8jdZbz3s3nQ0jzGw3BR6N/EfZQ/qaiIcvMxnFyDLOnUit1/sFT?=
 =?iso-8859-2?Q?+QZGPZsc28CCL4ImvO5Cl50UaPGXtbfPu97AMREJMEgI/rTkP9o154hl4D?=
 =?iso-8859-2?Q?DKYj7rM42e/hm7XSf/ZGbWFvJAwv5mBtQeK0W5OpWhEELcVzBWXX7r75y9?=
 =?iso-8859-2?Q?P1d7wjqriB772Sk+Rg+taycqKRPtCRcKyfX51jd6pTEVNDnmQxQc2/NxRx?=
 =?iso-8859-2?Q?BOe2m2babGe/2b1FJvaKSAJnGm4Xqb9+8L/cKxo/AcADcU+sZp+h8DFWe0?=
 =?iso-8859-2?Q?a+aaEgRDgVABnZs9DUzbWO3157r7d19ykY4sSAJAbDIpONjYpzkrBcbchF?=
 =?iso-8859-2?Q?WawaC9sHYITuFbKWMEWVqCTX+/4nLUUHgi+stV1XOB7Fv7ymm9CTpBB8+p?=
 =?iso-8859-2?Q?EWANTURO1h+tLS8mMh5KGpuhPfczIGQ0wMVJGm0ajrSygmhF0RrgeaBTiT?=
 =?iso-8859-2?Q?3EbLy43eJJR52BbLKRQxwo6WJpul5x3cMYxQb9swZ7VLqZf21jwfP7APK3?=
 =?iso-8859-2?Q?uUFA1rdMg3tuLVsA/pENkndBcNUK5DKPtGPBQzpBX3+Cye43J5PSOrHlPw?=
 =?iso-8859-2?Q?Cbc+5jFkr24FoRrDBCKLIyhHDtOaiJcJvncoA5yxPZPAh1y7uNcHSjsgbp?=
 =?iso-8859-2?Q?AEbIn2iFUmSmUL5kzy3Ji4yFvy+FYECZsCoxwcYHvzbYTuZf42UOIh/y8x?=
 =?iso-8859-2?Q?ILI7ZzBeCRGv+WcoULKOCfcf3yyXtMRxznS2W1WnqI5Qrfb7zOVCy2ZyM+?=
 =?iso-8859-2?Q?k15CD4enDpXxa1rcmDy/yBrGVTVc3K1atNE+Tvsp0J7eHMTvb3gjtFuJVA?=
 =?iso-8859-2?Q?dXcw0KLQreHyVPxQaJLr3HnHylQojYgrJJJdruz1AkfaXFt4JwVr2p2Fz6?=
 =?iso-8859-2?Q?hhARIQ2epzzYs+sT3HChG359Tpg+TKmw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?jqJOm7bXGrJb9Ikb8zBvW1CX0Vmau9caxUm9IzUGJ+vp+/Y1pzGPgaAiIE?=
 =?iso-8859-2?Q?mlYUtioIQ4F3qlHFejkgmeRzJfmzjsn0mseh8KpXn1lPQN1wLH85JXwVXl?=
 =?iso-8859-2?Q?NlGwTrFqFGQV1/0+97ZD8bOaSbgSWgkXffCawkACoGDivEG1dwP+Pb5cd8?=
 =?iso-8859-2?Q?+1RwYyzvKyU3XE5XOOYOEycWPIqMxhcwmUWeVXYSzsXXk0wBsd1Q7xWTbF?=
 =?iso-8859-2?Q?cnXic4ao9NjGl2nBdQ9WapQiMSNU9agbhRPe0R1Y9QBLF/NS5peBizxzhZ?=
 =?iso-8859-2?Q?I6P+ymWNgHhziykSYp+PbNp6BP0fTz5qutkb0SBxa9QXnCrrzcqiHa4iiN?=
 =?iso-8859-2?Q?ggdlWsC8SYZuEM2JS43+s+ctNo7J6oORDE5pomEpHRz7SvaXPNbF+G2CDl?=
 =?iso-8859-2?Q?QMfmAsOPXFsl+PpkxsC8hQSoxNOxq6Ze6Qrjvsy4SRKUnkcNNn8l/la/rQ?=
 =?iso-8859-2?Q?JW3YJNtJZDi8IsBnXOZKlLdD/NB8Xqjmn4Pp14VBs0Ot5EgPC5OUSz9DLV?=
 =?iso-8859-2?Q?vtw2wbP/HiwZkglji0SP+jdkqxpxo/vRFpGytyUox9G1RFdv/bJAlApvp6?=
 =?iso-8859-2?Q?DVTIYN0oesLX8YmEOvbzo48WoXa0iLYCq9iTPNOKnq9bdcUB3PkO0w+ayB?=
 =?iso-8859-2?Q?vbCEoi/FZrJIAV/xSJeRwBCJafI9kPGzLVUbqqozRlTejLArcilRLVfYiG?=
 =?iso-8859-2?Q?LSSpz/xZNMie9+JmxaLVjoFyecrtyCofQAtwHJlaxhpr5dgkPm7I8eW9PC?=
 =?iso-8859-2?Q?t+d8zmayynk3SvUicZgYdC/FpBx2WyncBIYBF4mdWelH9edJCa5UB9Ffdv?=
 =?iso-8859-2?Q?HkSFhMlhkGYNi2Y+D3A3EWRr+smHJJIOQA3EbRWr+ZXzQaoKoQ/9qBZOZe?=
 =?iso-8859-2?Q?SpVuxOL0RR5z4ekbof4LYUHIkZZT2/kvMJhZM46hGgIMXj0cWWwbB4wkzD?=
 =?iso-8859-2?Q?L/2JWi22IpaHIQjSQXbPKs552iXsChXlFZXUriwlDPZO/zRsZ8wcLA5MVV?=
 =?iso-8859-2?Q?+ReAkaf+S3Ot0PWlbqjputm5Y5Rp57V4d/hY/oA5KgZXrI4DdBcnr1/Zra?=
 =?iso-8859-2?Q?xXQzQ+sDUNrLMtzxbtZE6QMCSm3+t2Pe5bp6hZzslMV+GKCdaoRKkC/9JZ?=
 =?iso-8859-2?Q?rvN3ad+CSmwN2IO3V62oe5gf4DZOXI3w4JX3LMPYgX4uXnltSzqrcXh3gf?=
 =?iso-8859-2?Q?v5qcYOq2T/73J1NULTD7isGVcCSI180SYstKN/y2G9UukewwXV+G1hfnkS?=
 =?iso-8859-2?Q?CqN0+HDw6Nm24GkKamXIzKHGqan+URGkKFZYTvlWfcGd1r2H4UHdErLVt2?=
 =?iso-8859-2?Q?E8RJlecxGXykpv2wss4c6o0hwF1S5VHm78K6zM7+a0A6R2XFlGvT9jkgry?=
 =?iso-8859-2?Q?h0mlye5UeQpYrQbBi9gHB/w+RUsok5sLAC3CnyJXnig6Jjk6Kq/Nsmi33Q?=
 =?iso-8859-2?Q?QXxQzJasUz22X61y5x3Do95r46yPfsZApAgA2DbkHtobA3mKEYSGOtMlp+?=
 =?iso-8859-2?Q?16yuSgsuw+G1cSDnZYGtYvOQKz7eS6hgBkt7/Fn0DrfImgiOvDi5Bz7p9o?=
 =?iso-8859-2?Q?yFnLteYp8UITjZI6tRXk9OcfgZeGwo3zcW6v4PAcu/2Oj4obhxBM5TvxEc?=
 =?iso-8859-2?Q?IKs/fW3xmhdx3hVpeT2k5RfBW35Wnlj6Uh?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d624f2e6-9208-4160-27d5-08dcd3c00d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 06:48:19.1685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUO5l5jrB3vhoP/DM+sNoZAsObKeyKdRR2n7Hp+uNUqYmMdALE2SUj9L5Ningj2mSK8aGLg38vfA0RBfbA2dN1CF9EH/0Zi41xON7E6m99o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB7049

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
Wojciech Siudy (2):=0A=
  dt-bindings: i2c: pca954x: Add timeout reset property=0A=
  pca954x: Reset if channel select fails=0A=
=0A=
 .../bindings/i2c/i2c-mux-pca954x.yaml         |  8 ++++=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 48 ++++++++++++++-----=0A=
 2 files changed, 45 insertions(+), 11 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=

