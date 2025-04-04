Return-Path: <linux-i2c+bounces-10100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F5A7B539
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Apr 2025 02:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73A81189A36B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Apr 2025 00:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083A414F125;
	Fri,  4 Apr 2025 00:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="CYQIrOgh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4818481B1;
	Fri,  4 Apr 2025 00:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726550; cv=fail; b=nhW0OpJzP589OVH5CuEt0nvonE1fYtCG77E6YBUPxPOqjgV+qBbCbuwi3iteYgrnp8T3Vh8o9VeaXEfJQrkNYvg6kKOc4Bdg6YmEfFcJRfcsXJrtM5vH8oEtnL/nLcLR9+NrWvsQOxjbXljEO+kJC4zy0nsD82gzgqfyG02igXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726550; c=relaxed/simple;
	bh=JfuZKUwPj6DlnfUU2nK0ouqOHawFrkWOOKUwxXQRzKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IoakQ4rQw5Mf9jM8pUVo/QUkLTa+VHZZTn0jfOwn+huYaQcr6oACiFRVup+5MQ3TE8Kk1eBqUzTYZBofri2P0JivBeYkyAvUSP6wQCgmidl4aZ0L25+B5zNKtJE4dHO3jABRZaS0vYRz72Cs4UWLzETkqBUaJ3n+ONNHbgiT8Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=CYQIrOgh; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533LeRML022905;
	Thu, 3 Apr 2025 20:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wk6v6
	O+ESIXbizv+oClSfVzMXyiNxhHQXFiRWF13Hf4=; b=CYQIrOghBA3qvFRlXhBTa
	sW9aws7kWYP/qHx1Ny3SrOQYPAeYSKrAXKtZwYnXkscOsZL4WP6YWMlZNuKvS2kz
	DW41fYGjuezSIEJYPg+Excnp/hgrd8+jO3QRij12t7Pjn+MR3KZAKkyAEvXnFhMz
	Olh+frh8KgDUIQnyWNNqz/IihE9fhfpimLLSjJ92bRGWZHXCgTkQmibPo4cWkNsJ
	tFF9aL7Ka3G8Bli3HkzDjMvsNxx8/VPbU1NkOjQhIkZv4TD+3ehhJeWKJcfXCg0P
	C5nRub4hyjXmzIH+p2eLK3HOALAfyK8Ix/iJTOiq+qDH+bxs82eGZMPdEMj0bMK1
	Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45t2f28ek6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 20:28:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7GwQIr0XCIx5b51qIrj1LVGdVXLUq7ve/oLUkmIIXkERiJMa/dKL24Mlpybnw12m4BRQrRT/gni89su6zmkrfEwR2MTdrOV6WF9sZBuX4Ih18xVmQMk3SuGczeUbxGUxGw8Vux6JlovHi215Djvgu7r7n6HOTZ+edpvU2L8Z+vi6EOLsmzAD25G9vA9dGfKaq8BOkTPWOOP5CU55nwExGOKHafQqTrR6xV9U98bjAkGzgpA+0pLKWh6QKFAsNeiZq8p5lmxEVYfwkXxdyKHnlEJOeuoCd6xc5p5eRsPlAKy9DgAYQwET8hHgnSLR7/EttYQ2MeDgQpUSSorvn7O4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk6v6O+ESIXbizv+oClSfVzMXyiNxhHQXFiRWF13Hf4=;
 b=M67LwnJRsZyFTvAATapDhuTUlJSp4CRpOdaP7eOu+OOKkyX83exNkEWU04ZobsRuIAkTJZ6qMRAva0JFTOixP1f9SEmx/Ka5yqWhZKHYmOlEd2h4eFbakgy1YxHGLHub+Q7aQNldIDfwls8QQy5USs+zoNxPqBtb3doFcylMwivPXig6CqJ2CnDtZwFynFFNV/f8DO6Pi7K+GBIah5Gi8l0i/ZwGfw4vz/PPfqiBKtuhUqi2jlMMjzHVgfllxvNnyHhJm/tiugM+LL746j7xcCl5zbowDmg/hLeZOV2e8nxMHAYZA216UNb50yrf69t+mWoPAww8yUUGyGWiXIV6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BL4PR03MB8076.namprd03.prod.outlook.com (2603:10b6:208:58e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 00:28:49 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Fri, 4 Apr 2025
 00:28:49 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Thread-Topic: [PATCH v2 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Thread-Index: AQHbpFeb5xuhX/HLf02m4uk+Dq4nObOSI14AgACDvnA=
Date: Fri, 4 Apr 2025 00:28:48 +0000
Message-ID:
 <PH0PR03MB635158DB70EA4D463AE1B4EAF1A92@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com>
 <20250403-dev_adpm12160-v2-1-bbf40faae988@analog.com>
 <2234425e-b676-4564-96c6-57c0a635292c@roeck-us.net>
In-Reply-To: <2234425e-b676-4564-96c6-57c0a635292c@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BL4PR03MB8076:EE_
x-ms-office365-filtering-correlation-id: 08687fc6-bcfd-45ad-c9c5-08dd730fab32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?J0FK+GR8H3Pcdrb03xd8JDaWjXTUgvBZTavNAKju1QBt4EITLReEm7zds6+f?=
 =?us-ascii?Q?1PCQwSFMgABNdP/roTMbQPO/RAV063mbX/9tTV9fSgndrulgA4FeN3MCfrm/?=
 =?us-ascii?Q?XrVZvUSf/MIdbSC9zf+BRHGdE7/0jmZf5Kj8OE/XHSdxWWlVb7F+nLGXPUUP?=
 =?us-ascii?Q?oilCuhmyRsiI+4jeVMvk0tmREqAKD8JE32r78HyacX92sm6DRM+Ii4HD7BHj?=
 =?us-ascii?Q?bq4a6JR4vDQTwqGTSb9Ju1Wy7FeVJS3FpSXBVubZL8hbU4dvBEaZsU/LUIeL?=
 =?us-ascii?Q?tHJrAyu2bwcYBD610vTyZInPvEW+Nt4ou8AOziF/hl3XjUoZX7Gsob2lswhz?=
 =?us-ascii?Q?+vH+Nh+kAZH2Q+lrmSx7W6kzbrFgD/MtDZC3tqv4k67AIIv6eQQ117DNclRB?=
 =?us-ascii?Q?CeA0a4iSd1cho6Ngz4N/hSgWDwFyCt5vnXcAhaRcX493ytW/err31P0T0YUk?=
 =?us-ascii?Q?7G9KaCDudujDjWymo0rd1K5SihLpz8afF4MZAVf140c17+IlFBIX4mP+ikGa?=
 =?us-ascii?Q?kuAotjgTJLmEB5qWfpO5Yrdv195JGMIH5womcleSy43m0uPI72y7WtM7sz3S?=
 =?us-ascii?Q?Q7TiX49crdIa+g5Ca+mKMq0YLdWePzT9ypcM9jNRBULIXD9PDTB/Xe9yJfFN?=
 =?us-ascii?Q?kn/ANuJMWfsOanfMSR801GaXeIWLnNSPmL23ZarEsz9XnmUIFO5xDAyEeABY?=
 =?us-ascii?Q?eLvRyheHfZXpoOZLC6E8P3b1D8fOKpsogtQM5B+Y9D+aNHoBzHvPpise9U86?=
 =?us-ascii?Q?5TmY4eKlh52Q72Qg8WTFLNQx0VTL+W3u1bj/3TWuqj4EFXKsgmpO9K0NAEhY?=
 =?us-ascii?Q?gN6oLxo/Vv/2YX/xokFWGdMfrsKIyxdMvtQOfdIzAdjCGytz9WvNMKU2+a/u?=
 =?us-ascii?Q?WxalJ8ew6nwyEBIPWs9C7RVRzTQzLaDXqSaGvQU7x9SF7mg79iJM2iaIdc/L?=
 =?us-ascii?Q?iIr9KsI2uSVAjkbjrtaPhhMosZQm8n3f7NF3aeJwzJv8HtAihbIey6REHyhL?=
 =?us-ascii?Q?q9hvNR3oRVRwsAPT0x4RwsOqiPtXsBSLRIkMRil4kki3Pm6LSUS8KDPkOABW?=
 =?us-ascii?Q?HosD8axcqWKFILV9X2IVU2r4HTujUKJ8dXZ8vgRfuZMGmNPcz8EeAeQdl+vH?=
 =?us-ascii?Q?pNBXXRKyAMbGKpFY0BBDbx81AMmWtXVXeNaTqStN5t+iEYqhP5c5UrhGT6B7?=
 =?us-ascii?Q?BNUDTcJWVKEnYR541strrwlLGLMITJGmC+ZhSjlCtdec01UYukoa8E8jb7jI?=
 =?us-ascii?Q?vdADAr27UEoHk2Kh5AMhYVy2ooLUT2hUjpwKr7AE2IS0Bvl5xoE4PpLC/hLQ?=
 =?us-ascii?Q?Y+TeYXCNRddeYP5sk4Hul/PdJQ6gzsrxQLrZp8vh8QtZ/w9+K+u/0FDErXOg?=
 =?us-ascii?Q?Wa5w4Suv3JDXLTmJV0C1wJoHtj3pvi5fM9lX1vq+oT0bLUCQ3GqSQHhCnT7J?=
 =?us-ascii?Q?0q3+leyL1WL18M9oXl+TLy1zu/ogw3PB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G9xaV8VaxsjNN2frI2Z/SRhms08L96o2u5gbldUc2qKxuUmdDj3VuWv9+uuh?=
 =?us-ascii?Q?C4v6OR1qzLbVjxJoVUyH4taG3n366SRVWhVp7kEUyrisLO6s0mfqMftOopYG?=
 =?us-ascii?Q?ANvmDPZo1tsZnefjxfRC6XT5rBkZloQ1WkG5jQ34arWXZeiMvF9zkka9oJkb?=
 =?us-ascii?Q?KlbtW6oQLORYg4vRTun/OWDGZi4xk2kcp1/SrCOK5w7WHG+Xi+V6kUghKEHu?=
 =?us-ascii?Q?3rfyaBkFbMa15773o4SmBjxcvH3/msTZazU3B1Qwzjgc3J9Cn0eqYwWXm/yc?=
 =?us-ascii?Q?Kb3n3Axr0qYZh7vKNTXhpPrn3kT5qGI3ctYx8njIW4zAQU/Y9YmgrlO/5ywO?=
 =?us-ascii?Q?5G+AkU0+mcR9iFeFadB3AXxhVICBHFFyhXz48TMi0ijsgMyHbsKa7EpK5YCQ?=
 =?us-ascii?Q?wfJn3Q3PlhQXMCXMciZWoLKVWwkUFMJrcOcUSWJ+EIkyHNMa5Ujo5SL2MO6r?=
 =?us-ascii?Q?awRvV9ub0D0sytkleGkMQMSHLQHBRPAPjce17rDi63z39Qr5tSj/k+yVK7s4?=
 =?us-ascii?Q?bjYNstSkR6eTCZTIvlhpLJYOiD35vfC9KfW6ObCBezl7G7CbTdQNP8x6onb7?=
 =?us-ascii?Q?FM+6N57D3qPJZGHhW2KVg3J2xuTwaeimSiEKXTLcuj6LHOinrYM4svwhuu37?=
 =?us-ascii?Q?QpbUI6XMsVLxDG8yPxWUcAI9RfbEWa0VvoyAbFPPEBIOvm0i3PpIfDwsgzVk?=
 =?us-ascii?Q?dlDzuQaD3Wt20AsHIPkpFmeHaU0nlXEaX3DtCm9HQZfUJRDpwF8bMnDYxA/b?=
 =?us-ascii?Q?NUujooaFfRDPbcgxi4HEr4yqtQVhIA0bHBqbu3T+bXjFRZmidHsgQ9plPHkA?=
 =?us-ascii?Q?0Mjeu4pdaYa++QmOMQb9QFcxlCewNud315DdfNMhzQ4ob575K3Cp0qqeOOmY?=
 =?us-ascii?Q?uFj8+HQo7aGnxADdO+p8d1uD/uBm84nMBYFJk1t3sBkBMd32gRN06RppkSNh?=
 =?us-ascii?Q?792GM+mqP/1ZoBr8elaMawR27e8/njIWZbToyLF3foE+v5WoitkUxkzLkhXK?=
 =?us-ascii?Q?epEN56h/L5sbvcg/YpUWy/rkOcUUnd3k8XMiW4hZRqSlHyTwyyYBCF1eFLtg?=
 =?us-ascii?Q?r+CZi3a+AdAHB7NMeSr3VreJjhCzsrefHkgYz54lsXrit65O65ExzoL5JNUH?=
 =?us-ascii?Q?ck9i8SXrAxZ+4Oe+1e2qeoNcVfaGlv5IJ9TtKzrAEY9VWtTjczxCdzwXte12?=
 =?us-ascii?Q?TlH5zqvIPFLUbzYipdzrcG9l54RucR39X3rhJ2rZhYAvZVSGIAlch2RI3mMY?=
 =?us-ascii?Q?RwSnAO7jkIehpo5X78fjGrCA8fxym4wIVVgJQ65p3b5Tq1Iagv7kcYH7jMDk?=
 =?us-ascii?Q?YhdFkHCBNePOYWUTA9b1WKagf6MlfKCSqewf5DV8xYDxAvBhG55464m4Wu00?=
 =?us-ascii?Q?jXrvksh+j5WefoXiVHM1yQtLuRhZqndumEJZShTYRHFde8P46NYvadVa73my?=
 =?us-ascii?Q?m8HEJqC1pmWFsmqCuab2JAxNb40Mho5kLmQSTj16KgZDZRM20KNVSvVjg039?=
 =?us-ascii?Q?SGa7PWUH/475Nehtp+LtxBFJDDQqdra+k13ZaOZHYxNc8sK2xZlZCQzUN+yV?=
 =?us-ascii?Q?3S+/6hCYH6YCOirXvJX9/wa0SYWuaS2MpKPps2HM+urtciecCpDYNhf8wvGu?=
 =?us-ascii?Q?qg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08687fc6-bcfd-45ad-c9c5-08dd730fab32
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 00:28:49.0181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gV5nj7BnfctE4wFG9HE+6MPJerxx52AH6hKOun7IjawHJt6URGnv9QE0wQnsvHc1hHsg7bFCF5mzaucpNj0uK4y2nivk6jEZQT47rF9QG/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8076
X-Proofpoint-GUID: HBtOsdkNjwAkR9KTQ087OFqcV0386jEC
X-Authority-Analysis: v=2.4 cv=A4dsP7WG c=1 sm=1 tr=0 ts=67ef27c4 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=VwQbUJbxAAAA:8 a=jg431nGE5sWvl1LrVhMA:9 a=CjuIK1q_8ugA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=e2CUPOnPG4QKp8I52DXD:22 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-ORIG-GUID: HBtOsdkNjwAkR9KTQ087OFqcV0386jEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, April 4, 2025 12:33 AM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: Jean Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>; linux-
> hwmon@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-i2c@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/max34440): Fix support for
> max34451
>=20
> [External]
>=20
> On Thu, Apr 03, 2025 at 01:16:18PM +0800, Alexis Czezar Torreno wrote:
> > The max344** family has an issue with some PMBUS address being switched=
.
> > This includes max34451 however version MAX34451-NA6 and later has this
> > issue fixed and this commit supports that update.
> >
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > ---
> >  drivers/hwmon/pmbus/max34440.c | 55
> > +++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 51 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/max34440.c
> > b/drivers/hwmon/pmbus/max34440.c index
> >
> c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..585746806663409bc970426
> 47f6c
> > 0aba4c6f520a 100644
> > --- a/drivers/hwmon/pmbus/max34440.c
> > +++ b/drivers/hwmon/pmbus/max34440.c
> > @@ -34,16 +34,22 @@ enum chips { max34440, max34441, max34446,
> > max34451, max34460, max34461 };
> >  /*
> >   * The whole max344* family have IOUT_OC_WARN_LIMIT and
> IOUT_OC_FAULT_LIMIT
> >   * swapped from the standard pmbus spec addresses.
> > + * For max34451, version MAX34451ETNA6+ and later has this issue fixed=
.
> >   */
> >  #define MAX34440_IOUT_OC_WARN_LIMIT	0x46
> >  #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
> >
> > +#define MAX34451ETNA6_MFR_REV		0x0012
> > +
> >  #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
> >  #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
> >
> >  struct max34440_data {
> >  	int id;
> >  	struct pmbus_driver_info info;
> > +	bool pmbus_addr_fixed;
>=20
> Unnecessary. See below.
>=20
> > +	u32 iout_oc_warn_limit;
> > +	u32 iout_oc_fault_limit;
>=20
> u8 would be sufficient.

Will change

>=20
> >  };
> >
> >  #define to_max34440_data(x)  container_of(x, struct max34440_data,
> > info) @@ -60,11 +66,11 @@ static int max34440_read_word_data(struct
> i2c_client *client, int page,
> >  	switch (reg) {
> >  	case PMBUS_IOUT_OC_FAULT_LIMIT:
> >  		ret =3D pmbus_read_word_data(client, page, phase,
> > -
> MAX34440_IOUT_OC_FAULT_LIMIT);
> > +					   data->iout_oc_fault_limit);
> >  		break;
> >  	case PMBUS_IOUT_OC_WARN_LIMIT:
> >  		ret =3D pmbus_read_word_data(client, page, phase,
> > -
> MAX34440_IOUT_OC_WARN_LIMIT);
> > +					   data->iout_oc_warn_limit);
> >  		break;
> >  	case PMBUS_VIRT_READ_VOUT_MIN:
> >  		ret =3D pmbus_read_word_data(client, page, phase, @@ -133,11
> +139,11
> > @@ static int max34440_write_word_data(struct i2c_client *client, int
> > page,
> >
> >  	switch (reg) {
> >  	case PMBUS_IOUT_OC_FAULT_LIMIT:
> > -		ret =3D pmbus_write_word_data(client, page,
> MAX34440_IOUT_OC_FAULT_LIMIT,
> > +		ret =3D pmbus_write_word_data(client, page,
> > +data->iout_oc_fault_limit,
> >  					    word);
> >  		break;
> >  	case PMBUS_IOUT_OC_WARN_LIMIT:
> > -		ret =3D pmbus_write_word_data(client, page,
> MAX34440_IOUT_OC_WARN_LIMIT,
> > +		ret =3D pmbus_write_word_data(client, page, data-
> >iout_oc_warn_limit,
> >  					    word);
> >  		break;
> >  	case PMBUS_VIRT_RESET_POUT_HISTORY:
> > @@ -235,6 +241,24 @@ static int max34451_set_supported_funcs(struct
> i2c_client *client,
> >  	 */
> >
> >  	int page, rv;
> > +	bool max34451_na6 =3D false;
> > +
> > +	rv =3D i2c_smbus_read_word_data(client, PMBUS_MFR_REVISION);
> > +	if (rv < 0)
> > +		return rv;
> > +
> > +	if (rv =3D=3D MAX34451ETNA6_MFR_REV) {
>=20
> Sure that this is only one revision ?
> Would it be better to use ">=3D" instead of "=3D=3D" ?

Currently yes this is the only revision and the latest
It is nice to future proof this just in case so will change to >=3D

>=20
> > +		max34451_na6 =3D true;
> > +		data->pmbus_addr_fixed =3D true;
> > +		data->info.format[PSC_VOLTAGE_IN] =3D direct;
> > +		data->info.format[PSC_CURRENT_IN] =3D direct;
> > +		data->info.m[PSC_VOLTAGE_IN] =3D 1;
> > +		data->info.b[PSC_VOLTAGE_IN] =3D 0;
> > +		data->info.R[PSC_VOLTAGE_IN] =3D 3;
> > +		data->info.m[PSC_CURRENT_IN] =3D 1;
> > +		data->info.b[PSC_CURRENT_IN] =3D 0;
> > +		data->info.R[PSC_CURRENT_IN] =3D 2;
>=20
> Assign register addresses directly here.

Ah I see, will move.

Thanks!

>=20
> 		data->iout_oc_fault_limit =3D PMBUS_IOUT_OC_FAULT_LIMIT;
> 		data->iout_oc_warn_limit =3D PMBUS_IOUT_OC_WARN_LIMIT;
> 	} else {
> 		data->iout_oc_fault_limit =3D
> MAX34440_IOUT_OC_FAULT_LIMIT;
> 		data->iout_oc_warn_limit =3D
> MAX34440_IOUT_OC_WARN_LIMIT;
>=20
> > +	}
>=20
> Thanks,
> Guenter

