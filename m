Return-Path: <linux-i2c+bounces-6684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4526977C99
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 11:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284741F28BBC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC681D7989;
	Fri, 13 Sep 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="KZylecuH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF391BF80A;
	Fri, 13 Sep 2024 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221283; cv=fail; b=FwJIPQGZ6QOU4536GgttFw7kmQYoxffOFb9Q+TWyj5ehkDyCuQXd4RiKQqNoF5WfseOyyGfyVfEBApmBHG2Uz7ychjetHLvCqxF/rGU8AG8/Zn0BUfYAccJ/deVFVFXEGQQ3gNdqCOnvUJp7CvMdgkHv+r8aLXCufNwEtODY+Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221283; c=relaxed/simple;
	bh=c3tvKjBYKJSzoVgaMBOvHzsCfkw0j5xH3fa1L9qgjeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rl3l8UOZz2/IvkQtjiy9oFZzeLkorPn3dyUXbeXorJUcAGcYUlYZYQOea4GYYJ4DGGm7dQDyXIg5GtbMnb6jtLaFhFc+qCGRrDP/TTiKdjP/ZeSdBSeooWMelu1WZ6x+usVVDtaj+Q09Qscc+FRYmkZuGgUYFkm4OYtVFiHlLPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=KZylecuH; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D4blLg031903;
	Fri, 13 Sep 2024 05:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1PQxN
	IqEoZxaxHrAZqnX3Rz72GcuSI9dsVQkCus7nX0=; b=KZylecuH+cXUJ6lq8aLjg
	jTqLt7/Vq3KkcRc69cLdwtt2CX0cKpHxLdiIQgt03mT6GbdPZLVmwoIPgefdHJU/
	DdsBzWJ2HGQnZJksPOsYDYQ5NLvLw3/O18Eo13XA0mIM0zykV5g0ZtRy401O2uko
	ot+/Ne7+iiSxNjBTf//tIivZMeVQP+L2wGFhd+AX+chbwsx3crQLkEdqasmCHxYK
	IKGruZ5C1DPanAf/39cmd93XQ4GXKrMopDS1v5HfrG/OE3b9ZmeMrGyzbso9X9kt
	9Dj+SmKG0gdUgoAOyL62bzD6pf9zbv7Aw51E1SxgnR9mEG0AP1AOGnCpwBogIdQ+
	w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010005.outbound.protection.outlook.com [40.93.12.5])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41gyh1rghh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:54:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXOBeznUymiYJi69yh0Q33Bbq3936m/6q0cqmAWoxSq8cznS5EoX+JUPXBrDFhcCogRQHwFFbhBEOCZGov9Ldutmn0fRICVcgGs2XVHVPdTssCFNu75iynFDM9HYh6USaLIcQAl7vGSugTkLHsO/1aEeD9dbqhOQ8YrRyvOPqabLYfdukEVxhVVgnbkb6wveaP/TG1RqolrV8pbRpfj0OsAPKjqfPfqpbhvHuIgC33636IqzLa2DZ/KncLVR2yAWYmq6e5QMMq2jGr7fbzwYR4r5VA9/yhvMVtH8aUC/zcVojK9uw8LLKSh/nLyVCPHgsu86epq+93VnDycTDt+rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PQxNIqEoZxaxHrAZqnX3Rz72GcuSI9dsVQkCus7nX0=;
 b=f3Z8O4ZXqlGQ8h3RYJLJscZAJEXM6GxCVSC3hFt3sevvw/2x+EdYWc1PJm/+i3PksNvrUwISx3+2l/708K13xpybRODP1L8fmnCXxRs2oG/IGZy2hCr5htcJ3OEDmnsO1u0ig3Uw5l56pXGzeTIWvfEYrfYejCBCqYn7u4vYynLCiFvQLJcn7weyslmqx38wrHwdXYrTIx2lyznuCbm4G8NLuO/70NSn0OFi7DwDBkBTs/hcuB3EFTQ2Gg62Cxv4BxCUpMDGldVx6LDO79YDg0KGN1jsI5BQFte9/xX4MJWsfc4sl6jxd5BzCoRigJG4GsQ0kKQLV/+Hs/b+i7m3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14)
 by SA2PR03MB5883.namprd03.prod.outlook.com (2603:10b6:806:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.21; Fri, 13 Sep
 2024 09:54:05 +0000
Received: from CH2PR03MB5285.namprd03.prod.outlook.com
 ([fe80::a7b3:6227:4270:bab1]) by CH2PR03MB5285.namprd03.prod.outlook.com
 ([fe80::a7b3:6227:4270:bab1%5]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 09:54:05 +0000
From: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>,
        Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Agarwal,
 Utsav" <Utsav.Agarwal@analog.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas
 Gleixner <tglx@linutronix.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Olof Johansson <olof@lixom.net>,
        "soc@kernel.org"
	<soc@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>,
        Linux Factory <adsp-linux@analog.com>,
        Nathan
 Barrett-Morrison <nathan.morrison@timesys.com>
Subject: RE: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Thread-Topic: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Thread-Index: AQHbBUBwXHcWLnWt40+s3dG2z6X81LJVX+cAgAATRYA=
Date: Fri, 13 Sep 2024 09:54:05 +0000
Message-ID:
 <CH2PR03MB5285D1CFC6043B9EA446AFBC82652@CH2PR03MB5285.namprd03.prod.outlook.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-1-458fa57c8ccf@analog.com>
 <0929c49e-d906-4885-8e4f-b380358ec6c6@app.fastmail.com>
In-Reply-To: <0929c49e-d906-4885-8e4f-b380358ec6c6@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR03MB5285:EE_|SA2PR03MB5883:EE_
x-ms-office365-filtering-correlation-id: 7da34558-a025-4643-c0a6-08dcd3da00f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1LtKaSQBLoJvzn+AXEPE9O7Yx8CDFGN65DQPxyYav9r5UhJMsNMR7BVovGqc?=
 =?us-ascii?Q?gdKXYBiJQMy6OCyOFwdRbe6m5b53kg3ULAcCqV8U09MKG/WwBQCTgGsNapom?=
 =?us-ascii?Q?pQ09OnyrIY3EAQXb5c57bqwHxrZNY4w9Ke1JEbLhi5H0XJUvmezX7Vji/27y?=
 =?us-ascii?Q?GorOW3PmDoVF4k8wWCLktB1yzbGrFhfY1pYvlNDLIIL2a3MhsBEH/UIp/M9E?=
 =?us-ascii?Q?EKqoVRzSURErsVjFZ2W+aY0ydVvkN2ZXiCnCERHrzj7L1bO7bSqJGnHzY32s?=
 =?us-ascii?Q?B5sRORzTN3TCKAhxzenLwAxwxtpEl2ZLL6CKS7ut/q4258Q5kEBGHelM8SZa?=
 =?us-ascii?Q?1gtxTkeIgkReDUstQ8LhMu2JEk0PgZO7xE3H/ij4fi7de+qdu0YdF3lxqTqy?=
 =?us-ascii?Q?dzUVxcfHtp1rOQ3KqOFpmoxaOF1NhNJV1ySKstbF1ZFmtHUuKfOzJSULznMi?=
 =?us-ascii?Q?SKNMWwRCjMANiLZldiDO3qYVb5qkzFaLDpft2bkDJnZzt5sI99ShNCdeFghC?=
 =?us-ascii?Q?T1Zcbvwr17Dv6CVNlp+xeDNRZUZCoau2IU55dACvUuZ/aZOUqdO9kP8PkWvE?=
 =?us-ascii?Q?bFpFT/gIQFM2MjKqv7JUmv4eVce0ivD15UDemUY4a+iMB293DOX/O1s8b78g?=
 =?us-ascii?Q?tvLu8oLU8P1jBbiN4VP3x0A9PIWzBe/byAOJEZdSBuDPPALFVKwvdsC+PaDR?=
 =?us-ascii?Q?yVlReeQH8rFho3zabA0/U40VrpmgivCF4197EOHd2GOlAW9fpG+VxeKlUZ4V?=
 =?us-ascii?Q?GLuetOOR4Elscbt0mcOS1FwtFmCv4RxkD1MdYenldd8K5Bex/1Bc6+1O/Ct+?=
 =?us-ascii?Q?fStbarcjAUU03nG2z3TcT1AcXX+msbYCDs/1C5L+uyWL3O/O9j6NqENrUDWc?=
 =?us-ascii?Q?/S1VDWQmkHd0JOVtx4jv3iaZOkR3bQQAUYUXNMvMvhw7RqTMLVj+sHYO1ITB?=
 =?us-ascii?Q?NklUb6I+uRYzSU4Lq+6WLEwqfE1NRk3xNwZF+ksEVGd89XenXeUGgYDGk3B5?=
 =?us-ascii?Q?V0cZPzgRqZrEaAzQVIXXObzS9/hGH2KFW89XVPOL4+e/XNCm/BdswCya6IUd?=
 =?us-ascii?Q?S9PB8FYFIEifX10UrGj2QhhCfgwhjFGbQmcVHwTtQljv5UQgLhQeTn97jWcm?=
 =?us-ascii?Q?aBA7q2bGIFY73GcKciNTWmGcPlyh/bAR+5+YkiWEkpHKKCtctMm7KyN1DtVX?=
 =?us-ascii?Q?zR3ueet5cnPttCba7GSu52mHxINHZec6LfAGxT5wTCfHAw49tRgma/rCIwgD?=
 =?us-ascii?Q?TcZa4R50RJJ05PqvlKeDV2mt89ePBvu1cyspQ72NNAz95DNQYjzgxDwmnW/o?=
 =?us-ascii?Q?zdfo1KBDvYamVTb1pqY3gYEdFetErHiBNfq9RGJtZ7uokHk7cK36nHt0x893?=
 =?us-ascii?Q?IQ4UgY8LEnfQ9HifohfiDjQqvUw3+1iLtEBPyFZSv9HK7DOJumX0935dzNL6?=
 =?us-ascii?Q?mKhwbxTTY+o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5285.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ix0a+JnEOzXdDTcll3fiGOhaivGJIZlMUky/ebLQtwfJklDuQj+nU2mwgbLc?=
 =?us-ascii?Q?8OMO1vtOfAlsqJnTFMRMrARuRkrCit8EJ8l25guXa0fo0a8SCAugo35hwAoT?=
 =?us-ascii?Q?zwfdwqZgCNmoqkgl1vA/LC2RrRLybBYbY2xsJC8eMDz0cV3E2Vfl0ePw+z7Q?=
 =?us-ascii?Q?1zNglx+ZY5n3AOUwQr2iS1T/qi7CnUmImkAh7oltLZxSCjjQMJ5i10qMWar7?=
 =?us-ascii?Q?lpOAFehP2voxp6o1b2ccNVVcWAEY44y8vlrJTkIplKQbZbqfNhh6Jn3B92q4?=
 =?us-ascii?Q?wprd7YZBwpViRz9HrMxCNxUtvSMRO6PXAsiW6hkVbS2r5Ak36B1jnt8zPV4y?=
 =?us-ascii?Q?9s83HtEobnmzdbLCtsYbgzOlOBTDALhnS6e1AB172WVcLIXmb8xU+nZWKnd4?=
 =?us-ascii?Q?DAR56kTVSmxdtLRiYwia5W+X05WD8lRZ8xpq3MY3aUBRvl5tNjo9rPuREDl9?=
 =?us-ascii?Q?E7sFXC1rqTlnd3zN/FlettbxUVn8q30xpv3rKi8VafqK/lidp36JrlyEq4H3?=
 =?us-ascii?Q?EPlw3p5iLfxyCBjUMCZ3K5l43ODAAwmS5s0q1tLUyb2/zWZ/xD+sbmbGc6It?=
 =?us-ascii?Q?pa67uK5J+jsABlSNU9Iy3MRRMOHZW4hL6o5xWWIMR9kMmxTwpugSWVO3tJcM?=
 =?us-ascii?Q?Pn3aos1EkUvUuq0JNW516Lc2JHeBc+XpCJsIDW9Y/fUy1r3lt6gZaRMXrwK6?=
 =?us-ascii?Q?psXKt16/4032d9eNbKPIP05J+JUqccO0cXOphi2PlyZBW5A3RwpNmvHz+r3J?=
 =?us-ascii?Q?BTV6+1SftopxU+oTflZLUeiePe96ftO+oq2XlcQcbCdaLIsaQTyZ7z74ro++?=
 =?us-ascii?Q?mOJwU/BpTEZotzz2gj+idoa2HgqeBYwIPCFUD0R5PAhEYwJPIc56iMxWzzjA?=
 =?us-ascii?Q?WIo2BiIAMYoLD+g5xbgG5QGeM8WQR2neC0HmRadhvyXnbslosW3Hb6tjtNuH?=
 =?us-ascii?Q?p/XNddV6KLVc2lUY+MSJDq75e3FYWCdBfZlxfmtpPgXP/hdS266KTT7zPIC/?=
 =?us-ascii?Q?S0PCEd1a01bxxcHoZGqBlGIk5bMnmVLx1uB54kPOsMr5vfR8bPpuE7BJ+xru?=
 =?us-ascii?Q?akQfkmxxowgZGyZ6d1XaL8QyhUeHijV0D7dADdBNEZadw3c7sBxtqBngLNS6?=
 =?us-ascii?Q?rynG/yJNHId1/3ha0+SiKsvnPoir/ydYa5zaYvf1/ZLmhNSpKT8+bz/M1LQv?=
 =?us-ascii?Q?y8vxvMLvyehJxG/emiSEDRc/6EK1rb4waZROZXhlw6aFwnliHhfXQWmST2c7?=
 =?us-ascii?Q?gLBvABNFFgYZ/RXNuMz5k2a3m8qswlVZSkrSBkrfZskE+RZPVI6Co5mc9IIP?=
 =?us-ascii?Q?WKIseWHy1Q3TMhzHg0MezeFiwlE2cFpuB+5X2Z3Frc+5XXoq3O4Nk6Xu0qQE?=
 =?us-ascii?Q?TBJ2uZCVZH6W9l5Qyc5VTJWCWO7YhQKTIDKoCkipD5W7pLLPf9NdsevKg72+?=
 =?us-ascii?Q?qR7227VaKXz7GmU9xuNd9VhZoSzls1uwhONhg5dwcUN58zabAwts/O2r8HF1?=
 =?us-ascii?Q?L7R26Zd/0BVTbjUa+UcBTfjmGW3YSgx5zUwcCtyolf4pksW5+5tgD1tUzdQU?=
 =?us-ascii?Q?SlhewUmrfkmC39RGt5cE+grBmfF1fLaROO3K3UJpI3o89t9k19rlYhP63Abk?=
 =?us-ascii?Q?eg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5285.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da34558-a025-4643-c0a6-08dcd3da00f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 09:54:05.2235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QG5iO3q2LVO4RZeSm1fHHOyedYkQUMfWiOgSk0M8Ejib3KPjMYycMUffXihNICcQHNPFowuFmMTlziFqTcb9vG/voXcy72yWD3SHvW4U+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5883
X-Proofpoint-ORIG-GUID: hXTLHIeFfi4DeN8lJ4ukOoqR7jte1OC5
X-Proofpoint-GUID: hXTLHIeFfi4DeN8lJ4ukOoqR7jte1OC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130069



> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Friday, September 13, 2024 9:16 AM
> To: Artamonovs, Arturs <Arturs.Artamonovs@analog.com>; Catalin Marinas
> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>; Greg Malysa
> <greg.malysa@timesys.com>; Philipp Zabel <p.zabel@pengutronix.de>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Agarwal, Utsav <Utsav.Agarwal@analog.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Linus Walleij <linus.walleij@linaro.org>; Bartosz
> Golaszewski <brgl@bgdev.pl>; Thomas Gleixner <tglx@linutronix.de>; Andi S=
hyti
> <andi.shyti@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Jiri Slaby <jirislaby@kernel.org>; Olof Johansson <olof@lixom.net>;
> soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-clk@vger.kernel.org; open list:GPIO
> SUBSYSTEM <linux-gpio@vger.kernel.org>; linux-i2c@vger.kernel.org; linux-
> serial@vger.kernel.org; Linux Factory <adsp-linux@analog.com>; Nathan Bar=
rett-
> Morrison <nathan.morrison@timesys.com>
> Subject: Re: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
>=20
> [External]
>=20
> On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> > From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> >
> > Add ADSP-SC598 platform.
> >
>=20
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -292,6 +292,19 @@ config ARCH_ROCKCHIP
> >  	  This enables support for the ARMv8 based Rockchip chipsets,
> >  	  like the RK3368.
> >
> > +config ARCH_SC59X_64
> > +	bool "ADI 64-bit SC59X Platforms"
> > +	select TIMER_OF
> > +	select GPIOLIB
> > +	select PINCTRL
> > +	select COMMON_CLK_ADI_SC598
> > +	select PINCTRL_ADSP
> > +	select ADI_ADSP_IRQ
> > +	select COUNTER
>=20
> You can remove the 'select' statements above and just
> make your drivers 'default ARCH_SC59X_64'.
>=20
> It may also help to pick a more generic name for the platform
> in case someone wants to add support for SC57x/SC58x later,
> assuming these use some of the same drivers,.
>=20
> The Kconfig change can normally go into the same patch
> as the MAINTAINERS file update, but should be separate
> from any of the drivers.
>=20

Hi, yes future plan is too add other platforms  like
SC57x/SC58x and SC594. Drivers are compatible.=20

> > --- /dev/null
> > +++ b/drivers/soc/adi/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# todo modularize; already depends on CONFIG_ARCH_SC59X_64 though
> > +
> > +obj-y +=3D system.o
> > diff --git a/drivers/soc/adi/system.c b/drivers/soc/adi/system.c
>=20
> I'm confused about the purpose of this driver. Please
> split this out into a separate patch and add a detailed
> description of how it is actually being used, since it
> does not interact with any of the normal subsystems.
>=20

Hi, yes we cleaned this driver as much as possible, will
make effort to remove it.=20

> > diff --git a/include/linux/soc/adi/adsp-gpio-port.h
> > b/include/linux/soc/adi/adsp-gpio-port.h
>=20
> > --- /dev/null
> > +++ b/include/linux/soc/adi/cpu.h
>=20
> > --- /dev/null
> > +++ b/include/linux/soc/adi/rcu.h
> > @@ -0,0 +1,55 @@
>=20
> > diff --git a/include/linux/soc/adi/sc59x.h
> > b/include/linux/soc/adi/sc59x.h
>=20
> > --- /dev/null
> > +++ b/include/linux/soc/adi/sc59x.h
>=20
> I don't see these files being included in the driver you add
> here, maybe they got added by accident here?
>=20

Should be used in reset driver its removed during rebase, will fix that=20
In next series.=20

>        Arnd

