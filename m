Return-Path: <linux-i2c+bounces-9876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED509A670D9
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898AA42116C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F00E205AC1;
	Tue, 18 Mar 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tPA+JLaf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC0207DFC;
	Tue, 18 Mar 2025 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292721; cv=fail; b=MgawEezS3HFd88TNO3RWeiWxVxXlk5DxeiNL1Ds0RP1upn78ty9DyElAT6kw+pt0/J+hzEiQIaNMS4imYylkHOeLy7pJgoAbj6z26pfl3x19uc9rdjyiIWL2N6xtJPk3isZaepFdk7MkiXLMz9ytoW0qc/2Yx09jXaENk/IaSPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292721; c=relaxed/simple;
	bh=B8fvmwoOIRQzCSt/HeJzPJvjktVEegfuFrKApqE2Mdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J07MNSp87r8QTBRmIJce+iPCqB9+DAM6DvUcqVgZkjQ01/mABKpexjBTRZkGmtXLjrZe8dnIXYhOLWfkWueTDrpaOPwLwAsjtBVe19jy1DFf8WaNFbjyJ0sQcCHxXuHYyW20Q+ZMRf9l7fygSFWfnOF+IU0Zhhr41uaA4sJslYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tPA+JLaf; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I62QcT007306;
	Tue, 18 Mar 2025 06:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IczqG
	zh9RTKreN5RMOTBJEiOtb/S9hEwu5YoXHkPOjQ=; b=tPA+JLafTw/j/dsCqZc9f
	mjqUTxxSnQSCS1bF7ED258DCRIPKy+xzxeqiAMZDKFVXbhfccfLm7zLVcxpdQwvX
	NuKTEOzYGkVk5YZtl2dDDzGdyZQzc3qYMvFc2LxL+Gl2fAJxhFSPKYXjLRCGv7G+
	wlavoE/CzsLnZ2ftbHu5BhJTe96Tj9oAjzKIePG24B7SRXwGD58eUuAZorhr868l
	JAAINSttWkz3hnpdzfkFJ7ihIPT1/8KGS9SjBlS3VIZK6g5E7+1WlNttvZ1Fo/3K
	QNWDO01YfeaPxZseYLC7WFFlgWErjNyzkt8zvwfclLcuqooAxkKn/XwIUsAVqKTG
	g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45f379rvyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 06:03:45 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+UdqycE69Kl1F1VmGHZVr4918E7WOUjGGvTArM0zuHvxvVobkiWgTii7codk3VQFDtEKnx7vds4AOAdSy5dTyZTV41btuAcWFdVgKzLb7lj83osr65eIfHeY1KL3yoJQaVNLP5ilwhZa4Z8Qs2znpi4sQT97g/tfGiE3ApuiwZXCz+pej0too7T8uiJ3Qwt4uSTc+B0UhPB0YPNUk3GHxBMTRDMyF+XeNM/STtJf8vKMd6e2P6S4Wg3BhEjUhgv/uqDl0JzSadO2mTkUQSE7R00njy/RAAjQ09ARcF6GiTN6RsckHI3JhB9nxmE4eHrfR9BR1LBL2MX+47Q1IHaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IczqGzh9RTKreN5RMOTBJEiOtb/S9hEwu5YoXHkPOjQ=;
 b=f6tM9gte3G5DmEgDMCC5BC3YTqRt4qJfl+/0Ndi8nPLKoM5ZagSejzFY7LBpi096SncjYZaTxGza8FWo8gtt9yl1Es5RbTDVkTkwD6d9i/+nJaMtb3P4WAXN+e325nrxgJLE5syMalNfKdVHoeUjLfYMMC8y0P27Zkl7cWA7Z6C6VhcxBPxf5vdnRhZoVnJAkriX8e4gqhtkfXmN8WhnnWQYpdZABLsHs4vSVapnTDlwUupXO9IANBSRtQlOYwzmuPm0HRMQ3G9g+dOYFDjDcXZF+oDx0E/7LlDaLgUjJPEko+GrOA2aJ3FZ+juLYKGWGcnPPXn0p7kp4+bQqpw5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by SJ0PR03MB5518.namprd03.prod.outlook.com (2603:10b6:a03:289::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 10:03:42 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 10:03:42 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@wiwynn.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Thread-Index:
 AQHbh4VxpikJXQqM80uP0g18KkqRJLNZP5kAgABvcICAAEgqAIAA4wiAgACBPwCAHWbz8A==
Date: Tue, 18 Mar 2025 10:03:42 +0000
Message-ID:
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
In-Reply-To: <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|SJ0PR03MB5518:EE_
x-ms-office365-filtering-correlation-id: 89f52665-f02c-42c5-8f9c-08dd660429f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NVaRbLjmUOSfLjCzxXaCfq3wNbCALBcERjMZdgIOYE4jzY5Mgoyl1RKOSQlu?=
 =?us-ascii?Q?Bjm2Jg/J1B+iNW4s29lf28oVb6OTp3FUX2n7hWGpiRUQJL70M1mI6T/DOc+g?=
 =?us-ascii?Q?tiERA9cPKLUVMmt76wrrY8g3GBIxkUR9MklCku9ZXQtoaOQ5zNGP5D3Fpxga?=
 =?us-ascii?Q?Dwtq6ngd+WFNBFSKKorUZD9wGlb1svYbDNPuzIY0SISA5GqAXFIF3wsmERJw?=
 =?us-ascii?Q?MgtbqqCxpwmaO/TNSuAVv+GjPHtRGGXCudVR7+pEQLH5LKBFGjXOBhhhgavU?=
 =?us-ascii?Q?AdHgzfsa+BKhhXafUuXyEnUasmQJqZdpMnVwRKFYFqRm97qRf51qNjZm0QnN?=
 =?us-ascii?Q?Gq8m4EYS/BulBgh8N6vRL0ojxzo2VSXsU2tph4vlyuEwkWRM8p4Wm/iztPq+?=
 =?us-ascii?Q?743YDUFM1YM2/9c9M4ac4ncbVpTwfCNdQD9PYc3kuP+qLw4xfKBkxDppnyh7?=
 =?us-ascii?Q?C0yuZGkl3vKXppqCrK9oY5YgjkGFmm4dfNmJc/jbUMpfUYuAQZdRUieiExYW?=
 =?us-ascii?Q?9FLKonMngXsaUZEJFLID+kYISK1VSU3jmcS1PCI4vXALn4a+Ls+p6T1Mcukl?=
 =?us-ascii?Q?xNu/gAKIyhaBLvRykfkFHpDFD36M9edlMl7un01Q0mIPkKHXxL9p72hmg6Xc?=
 =?us-ascii?Q?cC3iKrli6xNyRfUtlLWVvuNW2qgYiS3Rlvk9R00aAeQZeqttwMpfMCmx9ITu?=
 =?us-ascii?Q?G8MKJIrB9vQ0JC5paCKV7g+xz4QX/nfz2rKi9xu1DY5xA3GpM730UnI49olw?=
 =?us-ascii?Q?2GCdnFy3hgyNA0fMa6/FNfx95Ga8lSZbI0pRKI63+SjYda5i5DcT8RYA4OQg?=
 =?us-ascii?Q?cmw7WZ3HbbzaQ+NaowmlEzczjSBXRgsCiyqaJXtNUSgldgjBHPK6Lf/1M/wy?=
 =?us-ascii?Q?KaDS8bNJB1NUt02tsuwMxkU6BwexIiU1MKRA+ry1rBrxuKs48/k5l2JC7p81?=
 =?us-ascii?Q?+HItpgkivYs9dxpNiUYdbJJ8JSzBuY4sqcjjTPuVChD2yAfBzDut9wUAHqr/?=
 =?us-ascii?Q?Uz2UtbDv3xa2rJQ1ireMMBug4qBwfpGZirnl8Sf26oUhwHK7XmWlFXl6ycPf?=
 =?us-ascii?Q?4aOo4i0hVdw8BS31CFD2CcLC7qYHUIYc5a9gR2wB/KTz8WjxhK5dZENZplO0?=
 =?us-ascii?Q?fjsOo6N/ZKPunKADgsrrzSPctFgaKXPxexWV2GKsyzdz6RS40Bm0i6Ak21DS?=
 =?us-ascii?Q?7a9VY2wnbaI9CYFSdlby+RPbRDNl/AupPyFtXAXyEroZv+YcFmdh4L4zFQla?=
 =?us-ascii?Q?dmfUJ6L/VQx4PiT+qliH803Yukb/THwymu2BW1l+d1DOWU/ChSjmxu7D8E64?=
 =?us-ascii?Q?z3ldaGDViFYLtA9YCOWIc6DXQKG6Kpuiwz6uXtTDqiSUODapvq2GUwwOPFXO?=
 =?us-ascii?Q?JTvHpJM+K7nV8+q+GrvPtRB4EHNzd41e56YUv27klIuq3tXjiGbKRDp+nTjw?=
 =?us-ascii?Q?hejJGPWm6R3e++/egGWPpIIk0TRdjo/R?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lhl4Wbb4FvA1BGHDgcLE100//ThoTSzza7RGCVSzECVNbR+N0DW07gLBRA3y?=
 =?us-ascii?Q?gBuiIQS20x03fvHVHK8Dsz1WMPen2JMtTOEJL/0g06kmIqKHyQeMPYhnY4GP?=
 =?us-ascii?Q?O13WDiRFsVFaWsFBQWJso5eRmkTTEsDy3vl6hYy78nTCAmJ9AOEFu+MjosNZ?=
 =?us-ascii?Q?m7jyDldHrE72TpAAYqHkVPWGJkL9fwIk5whu1PViJhKTxI81zJj02ykYm2Dj?=
 =?us-ascii?Q?2QDPlHkvv0+CFJRMKvvs1oJAk+T/xvcqo2JIlCL2oFXR+diCHe8+TPrqHHEb?=
 =?us-ascii?Q?NEWmMwQMpv9ljnqniAY74JeQrCyL6nX7EW2+L8k8LWw5DdBJkm3KXTOhJWJA?=
 =?us-ascii?Q?MKKwe7CbGblMNQWxVeM/kgqPgSQ2NFbdHIf525+gXDYopghEC/QTMyebWb+g?=
 =?us-ascii?Q?4ICWNqQ+5Q3KQT6ViLBxEIj4irNFZrXJfcFKeL7BDSE3GnFfQDia2iNdkKSU?=
 =?us-ascii?Q?eRE0XZagAkPgAhpKwAeeWB4D0Gyzl4v+gJqbhKRjv99G2JRhvBv8peTKSSBA?=
 =?us-ascii?Q?/e3NSeIdxB6ZCxt+pCu2CwVyPhIa1/Q2DyjNVlvI9G60k4xBtD4dZudDqcp/?=
 =?us-ascii?Q?pFx+Tzv28SRnG9PqmI5DymAt0gicKyqCcyAf45INB6BaPu+m1KQlYaSCvWZE?=
 =?us-ascii?Q?D99LXq9+E8mTGcX/ZSoqg51VREebethitETCV5q90P8WK5RQ9z3qDTX3s//0?=
 =?us-ascii?Q?CmnjuvVIn6dL7aHhMrS7Xm43GY7BbrFRs7LWsuIaDxyyEbbTpzK6tA6AXkVZ?=
 =?us-ascii?Q?xSRcXiWWoqTJQnONc45qGbrkcMvtgzromrtYzsanKzlZUKjHlUKkguO9TpsH?=
 =?us-ascii?Q?rVpWGiC/E2UJ58Z8QmKH1jJHu2sjY5t9cbsnUeSa3MQfBZ2ZXeHR/FjfWVTs?=
 =?us-ascii?Q?sDGwjyCHL++3ZJrQfCqOkLkUI3Pt8mTeooalfTyzr/5iusZJ+6ukN8900FAG?=
 =?us-ascii?Q?emVKopei5JjT9m1o3DiXKWdn3ri/itwWWPZrM+Zjjeq0cTdFVDT3o4XJoH5k?=
 =?us-ascii?Q?GUnAHZm4tkEcIrrttncyIwmEydsFIqcE9Z9hLTpGJq9jqQuw+rjebwSoJ3XV?=
 =?us-ascii?Q?s1xyk6zE+AIjPtvtC4PD0+vLtXZ+utaplBFzmzemDH1FMVYEkGbYh39a0I8J?=
 =?us-ascii?Q?+mVherEpelar9tByxoKj5/Vr1C+ITljcP4mGDJxQ2bJThnh4HOhpSHnxITV+?=
 =?us-ascii?Q?GcyCBXtEDn1PO1y2ZUO4gNH/0bdHrqAqyv0G8zCjB0qK9kR2DG7L2caaB+om?=
 =?us-ascii?Q?KJmZXnXmZXU1RoGlpbftUhdjoRvpbSLOspfUcTs1CVYkHZLCki0ThV4gVyB3?=
 =?us-ascii?Q?tuBnVkMKhuV+bofhZszeC2JouTkm1F/0BbD0ihW201gI5+FP6lPmYHvTEBfc?=
 =?us-ascii?Q?duhmm/Xjmwjnp260S2/JmASU5ArFEnMMUuFpH3i7yuSWv3fCn/mE6cIHPSS1?=
 =?us-ascii?Q?CPXUrg0kNbG+SpF3jHORD/SqgJVzDhziUVDpBuTrMcyMH3oG512QETjTR7S1?=
 =?us-ascii?Q?5uQfaCKkj3RF7Tk2SIFDJy3kmOSXWLg6IZu0jJwLSJtmYQnpRQFMr2feBTti?=
 =?us-ascii?Q?iQUQAgyKBS9s6Ym8ToPEo1Ga7hZAMFPfMZwFeUUpcOEJt9Z96MxEttX9VLOs?=
 =?us-ascii?Q?mfi1O70OmerHPVwpHvQp71o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f52665-f02c-42c5-8f9c-08dd660429f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 10:03:42.5904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7rPs30tnd5/W1i6T+c50x+sVYgQSK0lA+KjthsRuBseX08K1+88k+XVcBChHhvKrz/+teRKaAWsSa6q+KlXrEtNktldp1o+q6I5dXt7WYRX3vlhQXECQon3cMBq9Rp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5518
X-Authority-Analysis: v=2.4 cv=Pfb/hjhd c=1 sm=1 tr=0 ts=67d94501 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=T_VWj1rYENkTyV2mFTYA:9 a=CjuIK1q_8ugA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-ORIG-GUID: ftHOmmifTDRXBC-Ny5s19TlN5ajmVhX5
X-Proofpoint-GUID: ftHOmmifTDRXBC-Ny5s19TlN5ajmVhX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180072

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, February 28, 2025 12:33 AM
> To: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>; Encarnacion, Cedric justine
> <Cedricjustine.Encarnacion@analog.com>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean Delvare
> <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-i2c@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>=20
> [External]
>=20
> On Thu, Feb 27, 2025 at 09:50:23AM +0100, Krzysztof Kozlowski wrote:
> > > > >
> > > > > hwmon code might need some changes, but that's not really
> > > > > relevant for proper hardware description.
> > > >
> > > > Normally, I would agree, but it seems generic pmbus code expects
> > > > this structure. This just came up with changing another binding
> > > > maintained by 'Not Me' to follow this structure. We're stuck with
> > > > the existing way, so I don't know that it is worth supporting 2
> > > > ways forever. OTOH, is it guaranteed that these devices will only
> > > > ever be pmbus devices or that other regulator devices which are
> > > > not handled as pmbus devices currently will be in the future. If
> > > > so, more flexibility in the bindings will be needed.
> > > >
> > >
> > > I would appreciate if someone would explain to me what the problems
> > > with the current PMBus code actually are. I have seen several
> > > comments claiming
> >
> > Not exactly a problem but missing feature. pmbus code (at least one of
> > macros I looked at) expects regulator node and some sort of child of
> > it (vout), while such simple devices should be:
> >
> > regulator {
> > 	compatible =3D "adi,lt3074";
> > 	regulator-name =3D "vout";
> > 	regulator-min-microvolt =3D "100000";
> > 	regulator-max-microvolt =3D "100000";
> > };
> >
> > so without any of regulators and regulators/vout subnodes.
> >
> > > that the code should be changed, but I have no idea what the
> > > expected changes actually are or, in other words, what the PMBus
> > > code should be doing differently.
> >
> > I did not investigate much into pmbus code, but this might be as
> > simple as accepting arguments for .of_match and .regulators_node and
> > then accepting NULLs as them as well. Or a new macro which assigns
> > NULLs there.
> >
>=20
> Unless I am missing something, the following should do the trick.
>=20
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index ddb19c9726d6..289767e5d599 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct regulator_dev *rde=
v,
>  	{							\
>  		.name =3D (_name),				\
>  		.of_match =3D of_match_ptr(_name),		\
> -		.regulators_node =3D of_match_ptr("regulators"),	\
>  		.ops =3D &pmbus_regulator_ops,			\
>  		.type =3D REGULATOR_VOLTAGE,			\
>  		.owner =3D THIS_MODULE,				\
>=20
> Maybe someone can check if that works.
>=20
> Thanks,
> Guenter

I'd like to follow up on this one. As of this writing, my understanding
is that the dt-binding should not expect regulators subnodes for
simple devices like this. There is already a similar binding as
mentioned in this thread particularly
"dt-bindings/regulator/infineon,ir38060". I think a binding without
the subnodes should still work with or without the change above.
With this, I'd like to know what the specific next steps are to continue
this patch series.

Thanks,
Cedric

