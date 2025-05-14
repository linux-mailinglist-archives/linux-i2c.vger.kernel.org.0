Return-Path: <linux-i2c+bounces-10970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0056AB60AE
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 04:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA9F4A2F12
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 02:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836E41DEFE4;
	Wed, 14 May 2025 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V6ADBOmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008F15278E;
	Wed, 14 May 2025 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747188702; cv=fail; b=msG4ME6fGqi0yI4p5peBtu7IldKATnA6oM6goFYVY7dVLU0vMBQQvr4NPhu5W3Jlpu4b+lwrS+dsR/wMt8oZH8Ys/KTgckyQzG4JTVsL4eQGmtiMue4sf0WZkgNbcx05XEM5PoFBeHJlG5dl2CfH8lc30t4+ym9j5tdmHb4Z/Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747188702; c=relaxed/simple;
	bh=7uUlPhS9QYpD3FsypYqJrGpvv2fMt6NGUIUER2bOsk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PB4vloEkcZZ+TsK39SMZB5b2OhZ8ZjzavXHmO09Ka/jhtV4vxs/JU544E5aYqLNVOKJcoIxJLwgKSzaZOp+HjXMK35UQY7jydrBxNO2MXj7fPIE0siyKZEqaezNSMnHBPjtn1r5bbkHj8Be55UN9K1oeFamj/mrJ6ja7WfbF9Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V6ADBOmE; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u26rCTVgIT3PBL3fwuQVD5+3j9QDSMrCxtp3T+OqGAFpTj1pfYR5LHMJ35DqI1ahVmb7fkfS1z06vsovJ3e8r5vVlGEX1NACM4Czlqps4VTL5CZg73enc2JM3xTP0l+YJ5ZmMMZ0+onLeJrk/uFZ6DIDFmLZkMMJpc8Q6KHsJuywUlxWXnV3K6D5LPcOJqQgK9PQdjEBiCRM43OJmkPcaZOqW8LTMNX/Rz/pVN5Y77QewzXTkbBuaygsgL7zX6tQIzlS3tfPH6ITajYqtOLr3URc8mPJM7tG1Br47/jmelVZr/CN85fryg4QJ1v2LzP9dwpEVXt1TUkUV4TcsCjRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uUlPhS9QYpD3FsypYqJrGpvv2fMt6NGUIUER2bOsk8=;
 b=nBTpQ64DQAkGqxaZglcqawtCgtmCDj6R7UjIrs6ApNLNrmoWTZRonQn1LyT6e/cluWb+pOoGbSgjDblGYLasUqOhKnQqRbTHyovsfVfPU2biGk6TaRcJLfMh1Gyon2pFckOTJ8EYb9vMGbSDmJ1tM2wKJfeqnlEFCaqQ44drt7GZBK6ttlaMLj2lWRYD7mmgxRQFzbEG1IeE2+1/7jxwD/WxjkDdPdIhSqAPw+Hr+pocetE8aG9x4CDCo31W85ub+INIK72mRd8dQdlSPMX2pVSQBpINPW1VA5TPEIjZ+RHQchmLW4PfQZGP9YCksI7hFSIKl6MckLJE6Y62xWZ8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uUlPhS9QYpD3FsypYqJrGpvv2fMt6NGUIUER2bOsk8=;
 b=V6ADBOmEhJ2BCmlV3pdutYbC4TJKejtKgnOyW5HAdg4+V5ENS/SpWUEhvXpsE9AxlPYKJrMqzURHTGbFcMArq+QvyjoyChilnEsKd8R0GFlYF0w2I7vns5SpFGXF6Pa6yPficAdGUk7vPrj+zrkflk/N5OSnPUe248ZGkKjF5Wym8gm5rrb/MwoA9Sz0afJhS7dWetquc1ZTlhlx+BY0VDXERWh13auGDZVhknquN6dFIcKS5z677fNLg+JHoTmT0sj2nvpOaj1+qat1LmBik+3ZwnZC3q68w5cXAuO0jRRIZCY6wmkGDzvhXcX3HAC0O0lx2pjmOoabV7L4RjGVqg==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM0PR04MB7105.eurprd04.prod.outlook.com
 (2603:10a6:208:19b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 02:11:36 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:11:36 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Troy Mitchell <troymitchell988@gmail.com>, Oleksij Rempel
	<o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Yongchao Jia <jyc0019@gmail.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 2/2] i2c: imx: drop master prefix
Thread-Topic: [PATCH v3 2/2] i2c: imx: drop master prefix
Thread-Index: AQHbxHWF4zbXSOrs/UG1vaBzZot9aA==
Date: Wed, 14 May 2025 02:11:36 +0000
Message-ID:
 <VI2PR04MB11147FB3ADCB122291962D911E891A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
 <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AM0PR04MB7105:EE_
x-ms-office365-filtering-correlation-id: ff03219b-85da-475a-81c3-08dd928ca796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTUvNUg2eFhPN2pUM25mM3drRUdac2xNR1JuVXMzR3EyajVObEgwZlAzZ0Vp?=
 =?utf-8?B?VmR1N3hBaTFSZm5DWnZxK2FLT2F0R2h4WlV4cWs5U09JRnl4QzhkK3F0YWhG?=
 =?utf-8?B?V2UwM2xTNHNuaUZrRW0yWjRycXlJY3lnWjJQc0Jqd2tmMUdTTktCbGhnN0hk?=
 =?utf-8?B?bFhMRVp6M0JjVUlqUHR6dXd1WE5MK2s4bWpyU3NjNFZ3NDF1SndtblNFN0xn?=
 =?utf-8?B?MndITGd2UlNSUys3akRlcldoVXhKUEhtclVjakVMbnQ1UGV5MnZCZDhPWkNt?=
 =?utf-8?B?RnZVSWUzbTZZclhZVUtVNVlqTU9hK3NnZTRlbzlJeDlzUHRvWElxRlp1bW05?=
 =?utf-8?B?Nm5mdHRDejB1UWZhTnZVUlBSUHdQU3R1eC9MUjZQdjdJdUJWbC9lSUNkWU5T?=
 =?utf-8?B?eFNyTElaVzZwZHdneTBqSTE0eXUyYUZUK1doRUdvL09hYUp5aWlwR054VkZI?=
 =?utf-8?B?d29uZ2JVNk9SUU4vektaODhzRi95NURzcURQc3RkS3pYdXdYKzgzQlBDWm1X?=
 =?utf-8?B?d21ISmovYzRtQmMrL0svUXloQ3hkYjZ6eEZIY0U3dmwyREx3dFo0aW1KQ0t5?=
 =?utf-8?B?YmJBOHp0WEkyNzAxajdQdlpSd2Y0c1hrd013OG95cmYrOEFsQmRkQ3ZsaHRS?=
 =?utf-8?B?UkpsZlpZSklwWlpKVGovdUhKS2U3S0pUVmd3Z041Y1BxL3VCclJvUVU2TTM3?=
 =?utf-8?B?ektLMjZiM2FpNzNHNmlESy9XYTkwd3EyejNoakQ2eUVNbG96bUxwME1FZmNq?=
 =?utf-8?B?Y1dsZVM5dnduKzF4bTNIaWZTS2pHOUhoQ3VIRXo3bnQwSkFISGdvUnozQk1U?=
 =?utf-8?B?T2k4MFRRVU5TR1dZbGJTcjJzVUI2YlpuRU9YZjFiYW1KOEdaN3VWMGRsK1N3?=
 =?utf-8?B?UTlBdmVqODBVNXZ0SUxJa2FzbnFJaWtUWm9vbWhndm9Cdi9iUE1iTUUvSG01?=
 =?utf-8?B?bHhvTjFtUnc5QWEySXhRdERJSFdGRGFtdEtEblpnWVQ1V1ZXWForYXBoWm5T?=
 =?utf-8?B?VzV2QmluczUvRzdFazBEemVvS3Q4NzdSTFV4TVBaMXluMnpXYUo0OWU3RzJ3?=
 =?utf-8?B?dUIzN0l3QTA3cTU0cWREcUhuaW5LNGltY2MxQkhyMWM5VUVSM1htNDF6VzFH?=
 =?utf-8?B?SWxuL0pTam5MS2J6WU5uZEo3bHMxZ3p3S2VveWdkOEdqMTAzTVUxd1N2a1Fx?=
 =?utf-8?B?ZlVyK3owTEtVbXFvOVZFclVDeTNXRmg3VkJVQ3JSTWdMT1Q3bEJPb2N5S2pz?=
 =?utf-8?B?bFJMM3diUXpoaTdTYkVYZzQ2dGZlSFBDYmN0Ym5rb2ltWnZOMVdGUzZvRjh6?=
 =?utf-8?B?Vzlja0ZYNklsMVZNaVdzVi9mVXlRRkx1c0ZkenJHcnBnSDhJamdTM2d6WTBy?=
 =?utf-8?B?cUVxeUtBUWxCSEZ2WmlISTloUlYzMG1lY1NNSGVjN0xsZ1JtYmNZcjBobFU3?=
 =?utf-8?B?NGFqRWdSdWVKdnpsMTNGRGtqWGdqL3lhUVh0OFdxRWRFeEcrak9xWUhEaE03?=
 =?utf-8?B?SUpSRlQ4Yy9XanVmUWwxd2RLM2lDeDlZWGtPQ3RPcUNBa0U2UzJFeUhuMnZu?=
 =?utf-8?B?UGRhcXpORFZ6bDB2NU1HR0RaaVlleVFWT0tJK214S2RRM01PSk9salRLdVRC?=
 =?utf-8?B?Z21TSFJMazZENWpxTURHaTR3dURwVnpUMDNPMlhhUFpTbWRyOXUyeGU2VzEw?=
 =?utf-8?B?UFdnY0t6RFdkNkt1bXQ3Z2thYkNLYkFYbXdoV01PSTBJN2svOVZabm5xYlZo?=
 =?utf-8?B?ZU5maFZpdlVvNGVFS1lpQmt0TlM2c01iTXZjQlh5cXNVRUJiZ2lqdWhoQVEx?=
 =?utf-8?B?TTdKN0c2OG5oVVJlWktYdTNNRWtuTzM3ekNhMFFKZkJOQ1NhSklRaG82NzNj?=
 =?utf-8?B?YnFOY0JYOURCQ3hyZXQ3UDdhQ2tYb2dwdEtob0hkWUFxVFJhT0prQVk5U3Vt?=
 =?utf-8?B?UEM4VnkrL01RallrdkpsUHdoeUxjenVzbVBlZ01adHhhVWdtT3gvWFNVM0Jq?=
 =?utf-8?Q?xhfuSDzl476E2a7dvCcPwKm6fOp7SE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWRMMm5kQWIzTm84Q1BRTkhMS3pkMnJqbkRrM0FPWHg5WjNJV2g0VTBrNFVy?=
 =?utf-8?B?TGt1VE9haXpXVDh0TVNPeEhQaklkS05EZ2IvOTFxVmFFeWlpczIrUmptQmsv?=
 =?utf-8?B?ZGRhSi9wSEd4RmFMb29mUzNmaWE4MXdWY0dOM1cxUzFzeHBvTnhRditJa3dX?=
 =?utf-8?B?UXVOQk5SdGppbCsvV0UvQVVKcDVRRjlHZ2VkeFFzQk5LMzRwRWtNVHlzVi9G?=
 =?utf-8?B?NG9YZ29ZZGY4OFUyQVhCSHEzWmNKQ3k1Q01VU0dnaGF3MWNPd0NJdlIxMVZU?=
 =?utf-8?B?OU1PQ2grbHdyZWdLeFRJZUMyWU10RXNTTk1Cd2NVL3ZaOGEwOUFFRnBueFRB?=
 =?utf-8?B?RVNkL3NTNjJCK3B0Q1B6UkcyKzloSFdiQmliSmFPbzRTZXBsbmRhcnpwUjU4?=
 =?utf-8?B?L1ZaZ0djaW45OHdOTmtJSm1hU1RKcFFDdGJHNmVhcC9BSVgyNWJMY3I5bmhE?=
 =?utf-8?B?QURzd0tYMEdRbFBGRW05TzV0RkdKWnN3VzE4QU11S25qeDI4LzZWRnZpRlEr?=
 =?utf-8?B?dVphUzFhTWFDVnNMVENIOUU3aXV2NFRYNTg1cmo0T3Z1SnRuL2h6WUZqMWVy?=
 =?utf-8?B?QzNCLy9yTGhobkhudldVemJRcUR5ZVN1SVQ4OVNjY2RaUjZFR2IybHFOamxy?=
 =?utf-8?B?OFNpV09RYi9ESVN5Q0hmdDU4VGtzdWN5YkgwdGFXZUgwbGJLUGJCa2tLOGZr?=
 =?utf-8?B?eHdCT1d6Vm1WeGE0bFBXeHNuZXhSNlcxSUN5NWg2UzhLZUdQQkN4S1NFV0Vm?=
 =?utf-8?B?eFByL1R1UXBNTlRJcTh4bHN0T0Z3S3lycEZQVHBVYU82Wk85endpeUZIalBh?=
 =?utf-8?B?TmFkdFlSM3B4TktoWnNHTGJ4ZWFrNmFUV1ZhMGhoSGFkdmNVRVJNVFFqTU9W?=
 =?utf-8?B?dStVQ1BTUmZuK1JJa21KVno1KzFSMEppTklPVGtYNXJiTENrNHhCZWUvcjRu?=
 =?utf-8?B?enN1ZnFkYnFBNnRVSUdXQmFqUE83aTlhUy9KTDZYV0RiV2RiSkowRnJmNFhJ?=
 =?utf-8?B?czErNXkvSmc3SjFPckY1YXdwNlBIdTlyZ0ZZYTFRc3RZdzFFTUlPVGxXUmY2?=
 =?utf-8?B?YVNVazUwNGtvYjduNW1GU2tnK3N3SzlrVmtzbXcxZ1kwSU5HOElBK254OXZp?=
 =?utf-8?B?dHYrcWtaL3krQlhRVHAxTW43OUFTc1QwN2RqVkhWdFVUUyszN0Z2K2JCdWsv?=
 =?utf-8?B?NmlnNnB4OXI3bEE3WlMvN0lYWUpiRFQ2MGlLUlVFeDRoQVBqbzM2TkxHbHNa?=
 =?utf-8?B?SjFvUURlQUVjK3JWTTIvOU1saWdmSlIxWTdXQmJ3REJ3WnZad1daWjBGWjdU?=
 =?utf-8?B?S3Z3M0VFeHJ0M3NiMVYrSjJkanYxdzA0OVg3NEF4SnBnbm9Fa2c3UGxnZFlF?=
 =?utf-8?B?ajcvOWxwMkVscjAyVjNzNitQekVPbDhERXJuM2lic1p6V0I5ZWZ4UU5DdSti?=
 =?utf-8?B?UnVIZnNwVHAvc2xQQTRBdVNza1ZUY2h2QzBSNDYzWTdpbzFBdHNqVVNTVkdt?=
 =?utf-8?B?amFpSkRtcy9rQ1E2dHB1R3g3MjhFK1BSb1BUVTdMRzJxTC8yR2YxMzBTdjlJ?=
 =?utf-8?B?K0FvVlZBZWFrMzgxd01pK0pYQ0FHQmlZeTFQQk1Kc3JhQkIzRGRMZmRDQU16?=
 =?utf-8?B?eDNnVWJod1FwR01aUExHSWppTlBYRzlyclNXSTd4SDNVMkFTUC9EMGZOTG11?=
 =?utf-8?B?cTQyY2FlcFhiTDFHbjkrY3hvbmphMUtSWmU4Mk9GZTRFM0FCRGtzL1RyVjJG?=
 =?utf-8?B?VEJPMERxZWlvaDlBYnkyV1lhUUxlRHFQR2wyemdpZ3V1OGlWSTFrVUt4ZkFn?=
 =?utf-8?B?emRKRVp5eEJSS2gxQS9oaU1JSEhMZUc2OVNpbTNkaVBPK1djcVFNQm1vbGsv?=
 =?utf-8?B?NXkwbUtuU29GV3JCNDY3U2ZydTg0akhxU2ZzbVRYMldKd3dTcUdwZktFb0hn?=
 =?utf-8?B?dU9SVlphNzIzUkwrWEl1dEh3WUQ1cDhyQ1hkQUV6aG96T0Z3VUgyNmRsRkpG?=
 =?utf-8?B?eGZOTTM5RWdGWnlTVVNURHBSMXRYNm5jSXFMNlBuN2E4ZzZzVXN6cWhDYklV?=
 =?utf-8?B?d1B1enZQV2FmSml5OWxKWlhMZVRTS1JoYVFZSituS21lZjM2RTVIZklQeTJu?=
 =?utf-8?Q?DGclhlB+dIYIQhvARttekuJtv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff03219b-85da-475a-81c3-08dd928ca796
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 02:11:36.0916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQYK8kurTrvT5TN8jfM1pk9X3I19HcHhZSJgFJcU/GBPm7X0/Afp6G6hRQDi/AzEFLBjZJ39jbOOlKU2ESTnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105

DQpUaGFuayB5b3UuDQpZb3UgY2FuIGFsc28gYWRkIG15IHJldmlld2VkLWJ5Lg0KDQpSZXZpZXdl
ZC1ieTogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHJveSBNaXRjaGVsbCA8dHJveW1pdGNoZWxsOTg4QGdt
YWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5IDEzLCAyMDI1IDI6MzYgUE0NCj4gVG86IE9s
ZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtlcm5l
bCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBBbmRpIFNoeXRpIDxhbmRpLnNoeXRp
QGtlcm5lbC5vcmc+OyBTaGF3biBHdW8NCj4gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEg
SGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbw0KPiBFc3RldmFtIDxmZXN0ZXZh
bUBnbWFpbC5jb20+DQo+IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMu
bGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFRyb3kNCj4gTWl0Y2hlbGwgPHRyb3ltaXRjaGVsbDk4
OEBnbWFpbC5jb20+OyBZb25nY2hhbyBKaWEgPGp5YzAwMTlAZ21haWwuY29tPjsNCj4gQWhtYWQg
RmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4NCj4gU3ViamVjdDogW0VYVF0gW1BBVENI
IHYzIDIvMl0gaTJjOiBpbXg6IGRyb3AgbWFzdGVyIHByZWZpeA0KPiANCj4gQ2F1dGlvbjogVGhp
cyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxp
bmtzIG9yDQo+IG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUg
bWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzDQo+IGVtYWlsJyBidXR0b24NCj4gDQo+IA0K
PiBJbiBsaWdodCBvZiB0aGUgcmVjZW50IHVwZGF0ZXMgdG8gdGhlIGkyYyBzdWJzeXN0ZW0sIGRy
b3AgbWFzdGVyIHByZWZpeC4NCj4gDQo+IFJldmlld2VkLWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0
b3VtQHBlbmd1dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95
bWl0Y2hlbGw5ODhAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
aW14LmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgu
YyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgaW5kZXgNCj4gNWIyNzZlMDA3MjkyLi5k
ODVhZGZiNzNiYWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMN
Cj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPiBAQCAtMTY4Nyw4ICsxNjg3
LDggQEAgc3RhdGljIHUzMiBpMmNfaW14X2Z1bmMoc3RydWN0IGkyY19hZGFwdGVyDQo+ICphZGFw
dGVyKSAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2FsZ29yaXRobSBpMmNfaW14
X2FsZ28gPSB7DQo+IC0gICAgICAgLm1hc3Rlcl94ZmVyID0gaTJjX2lteF94ZmVyLA0KPiAtICAg
ICAgIC5tYXN0ZXJfeGZlcl9hdG9taWMgPSBpMmNfaW14X3hmZXJfYXRvbWljLA0KPiArICAgICAg
IC54ZmVyID0gaTJjX2lteF94ZmVyLA0KPiArICAgICAgIC54ZmVyX2F0b21pYyA9IGkyY19pbXhf
eGZlcl9hdG9taWMsDQo+ICAgICAgICAgLmZ1bmN0aW9uYWxpdHkgPSBpMmNfaW14X2Z1bmMsDQo+
ICAgICAgICAgLnJlZ19zbGF2ZSAgICAgID0gaTJjX2lteF9yZWdfc2xhdmUsDQo+ICAgICAgICAg
LnVucmVnX3NsYXZlICAgID0gaTJjX2lteF91bnJlZ19zbGF2ZSwNCj4gDQo+IC0tDQo+IDIuMzQu
MQ0KPiANCg0K

