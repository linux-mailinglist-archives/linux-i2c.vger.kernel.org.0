Return-Path: <linux-i2c+bounces-14542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF442CBDCB4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8274330656CE
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DAE2C0F9C;
	Mon, 15 Dec 2025 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="D+jwCpJe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FE196C7C;
	Mon, 15 Dec 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801227; cv=fail; b=Cv2atMaqHXLA6WNAruUXJFh2QihIjWg5158wr/F/tWdFkz75Ugd6UF4zwDTjTf0VgeQiGgTysfudemOX38xoL98ygVJBQz4/TjHmO74mI7POGkAyuSHxigc6TxR2HjEZi4kHCyXlhV+9ebvaEhR3Zm7wXvoqAnks61IhxbioCNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801227; c=relaxed/simple;
	bh=+hoOJd0wyMO4m9THNtqsqxgIjthoKptVqwbqnSSPpfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EWl0by+S2YOCoM7TIwDGKmDi2+7Ynu75iV4+bNioFEEHYs0GRrsSWxKPsIZKXcNfxeVKU9BJZpMe3+nsRHrYob7Kg7hvRgC/2T6DHUcFrCEgtlhSgw6fVRkNPMyDFUEvp2IZH+IsdhpYjTM1QLor23ysG4u/rU7GHGiJXsnccY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D+jwCpJe; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCBlvL2338120;
	Mon, 15 Dec 2025 13:20:15 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1kyq3thm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8O20YmVV1rAGITAaPAhybrTMWfKKmlMIUQKUFUKmEOTw3ACBmWJsTrVMEG0pgR21KSMkodIwV3YhpX/l6zAVUDkPj4fOceUHm8IYRjuUbqocjm/4xhXqMItd8Cm6l34ILkadD/nyUYwocQydudNIl+dx6sGe1+7JYEtvMW8kLhGDi39QjQjdgAOsaOeS1PZkSdhlIh0cghx5UWz+8L8fm5HrypNeWz7+hJEclQ0AV7pNSMm9a+30FbOkYg6nAQ8BmPt8cHEl9+S7wIMzkmcdRKvWPuncWCj0DAPjOxe6983uKtCCYmFgwlfFNYYqDgvZdo/DaRvh0iDBG0BGp5tcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEIVseShF0HT2d2wEydZnyDaGoUcCrv/DTVDvEwAwII=;
 b=edmz0y1XOWiG/IcPun+XUL7UjhWOs0rbkL6TdHJQ63QupVJNb9Ynro9cuISXaysjYa8LgwVg1pRDZFIa6xz5hazbHKVTMIC0rviFKZ1Ub2gSqYtI6lEgDbKYL1seqZXdG/c9XqqWtGoL3XGDTk1Fw1EENRVNryemdWcMGOfOGrfl9NH/0dvWXZLH9prlSVgdVoxhdSSKFL2ZxaZW5acUYlM2/GK0VG1gjeZpmOOSBGzBff2pORp4e8TBCZFXFI2zRKYjKPRPz0z2iD8ezZfILc2RrBAnXpyEnRETyBQunTBoHmJg+0u8fao/YiNVEY8NYrB0MsgVnB5WP23f14sdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEIVseShF0HT2d2wEydZnyDaGoUcCrv/DTVDvEwAwII=;
 b=D+jwCpJeh9cYm2LNBTotiszOA2ws1uYw4re/F+QoDcIp7JfK9wYXWKBrDS23RT9MBbx4FO0YyrFh0H16+ntPo6LAaE9Ms7m+w9TadEyDrXDzNDOee5HdYZNwPKNYOy98WAMGlC5e10TV9aqv9bhJFsOcz7gaUxzFW27EjBC8k/f3TWwjByceKzVClJsmu9YuYCaRDsZxj7i3OksJ7Hjj34qsAnaqXSdOa89gvBJed26pnCu5G60cGDWUHOyr1ocQ9/MbC7owuIfRNahmOPD3KmnnP3ofiyokAQ8hES52jEhEMWBAbjDSZfuPo+5J+J1np1IzzSVP63q4xaRp01V7Ig==
Received: from AM4PR0302CA0026.eurprd03.prod.outlook.com (2603:10a6:205:2::39)
 by PAWPR10MB7197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:20:10 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::64) by AM4PR0302CA0026.outlook.office365.com
 (2603:10a6:205:2::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:52 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:19:43 +0100
Subject: [PATCH 4/5] arm64: dts: st: enable i2c analog-filter in
 stm32mp251.dtsi
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-4-2738a05a7af8@foss.st.com>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|PAWPR10MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: d719ce7d-e226-4530-d8ee-08de3bd44ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3FxWjJlZUEyTzlpQUJEV0t3REZJVFdmZ3l6OGxENFRQNXJvblZyQ1d1d1pT?=
 =?utf-8?B?K1Y0aThQQmF3RGt2dFFWQjZEeXZJZmlLOGkxQ3Y1OEIxRzBTSUE0M0FYT3Nh?=
 =?utf-8?B?Z1JxcEdBcndaMkZTb3RGQ0p6ODd4dkhDWnJwdllTcTUwTk9CL3pnWlp6ZkxT?=
 =?utf-8?B?enBDcC83eFFQbUY5YWFLem50SC9uSWo0cGJYRDdSeVI2c1ZhYWltVXNINUZo?=
 =?utf-8?B?dmd4cTI1WUJxS0tONXN3RmRCUkZPRlRDTUtheVhNRnl6SVl6dkEwcFMvT2RL?=
 =?utf-8?B?alZJUUFzbHJvRlFGR1pBL2tpMXpTalhGWTF5dTQzSUhqOHFXb2NQeE9OTWhj?=
 =?utf-8?B?MWx2RVp4VUZQODNpd1E0N3A5Q0FlKzhjaGRpZUhBcDlJSkowQmg1eng3dHpi?=
 =?utf-8?B?VU9xaFRvREhVRCtQUlY2ZVFFS0ZmQ1hWaS9TRUFEa2xsSWNhYko5blI2bWJI?=
 =?utf-8?B?NTkzcWc3Q2VjdXhXckVuZHVrbUE5S29oTVBWUzJSeGhXOHlYSWxtdmhqQmlD?=
 =?utf-8?B?Y2trV2JkTVhRWmhYZmNYRjZlL0lpNUg0dWJpTUV5SHNVUlNxSk5lMDBwcXpo?=
 =?utf-8?B?U2ZMcThDRTZBYzkwMi9GVnNtWUpNMTU1dWh5S01KRENubVhZNXFpSXJWQ0hF?=
 =?utf-8?B?S3RoY29aRGhjU2Z6N3dzaVRIUmFWSHN1UG1pREtFdTdyZEFGNE9XOVdCUUVI?=
 =?utf-8?B?YmliREtHV3pVa01VcTFSQk5NVWptaTZpUkZXVzNtdVgxZXhtSnl5allkU1Er?=
 =?utf-8?B?MS8vWUZCa1orNDNtL3hFaVRMbzEvSXlydk1xVlFFcFowMnlXV2lmOXd2LzBh?=
 =?utf-8?B?ZDB3VnpOdklSUThuTy9OeDhiK01XNnRKWTdRL1F6TTNpbjRJSit6NklCNEY2?=
 =?utf-8?B?V1FET1NiNFZ4SmhwNmVSakQ3cTJkRFFrNHVZRXFSOEV0aXpRbjY5dmFkNkhU?=
 =?utf-8?B?TVpjeTVzaTRybEhkbHdkcmdHVmVBTWp0MEkrbDU1VVl4NVNCc2RlK0srZ1hC?=
 =?utf-8?B?TndEMFlNZ0s2a3VUcFhSRjRQaDh3K2RCa2oreFlzbjIyWVVtOHdHYm9SN09Q?=
 =?utf-8?B?UEVFendMTktXQUQ0MDExREJJWnBHZ21ZK2Vpb3F3OHpIYmlUWGIvdlV5Qndp?=
 =?utf-8?B?bFVRYWQrMTZER3k5RUszNFNxZzlhbkNuWWNjNllQa0N1dFhvQ1hsWVdKQitO?=
 =?utf-8?B?d0tiTVNPY0s4TFdOWWd0c2RvWFpmQUQvQnh0UFBSVTlKMXJJcThSTStvWVVR?=
 =?utf-8?B?SEtHblovbVMrN1U1Q2NvdGlVL20yZUJFazg5M0JUZzRMYzVEczBsdENQdlM4?=
 =?utf-8?B?ZSt0bzZMT1J6T1FEK1JEMkNPd2ZiSnJaRkdXWE5hREYyd0JsSnF3TWhHVkVK?=
 =?utf-8?B?czNvVm5xTWl5dE1BTHNyUWMvYTg5OE9BNlMvckthTmF2cWpIZGIxOXMzR1h6?=
 =?utf-8?B?NnFyNkZGZVFCRUZlWjB3RTU4TTFYUTZ1RWV5Y3RIbGprN09ybFNBSmJOMzQ3?=
 =?utf-8?B?WE5WWFpNTlVIVnBPdkx1WmJLV0lUZk93dzA4a3F0Nmt2RUVRMzQ2YjVxN3JU?=
 =?utf-8?B?WEVsYjZWRk1pK0dtaEE3STJsaktzNzFvRU41VFVtRU1VVG1zRk5SR2grQ0VG?=
 =?utf-8?B?UFprbUlDWVBQRlFMV0JzQVhIdGpmVzRnZUtBYi92MmRabndZb3BNS2czWDJY?=
 =?utf-8?B?ZU9nQlNFMVp4R2lCOHhWQ2U5bUFHUGIreVFxeXNQWW01VzIvNHBaR3hzN2Np?=
 =?utf-8?B?NFhiQjNHSFh0bHdiUnRKeHBiSWdZTysxTEtpQ0ZVUlFwMUFweHgyVVVBQW9F?=
 =?utf-8?B?TVgwOFU0eGJPUy9iNmZ4bURibU1HU1EyeXcxVkdGNlhGMDM3d3liRFo0Yith?=
 =?utf-8?B?R0sxd1RJYXhQODAvNFE4VVh6cFNjUHRuZ0tCV0V4anlzWUk2TVZ6NGF3eGVm?=
 =?utf-8?B?bnhab3QvcmdINVo0OFdsVEh2ano3Rkg3Unh3dlBZME92Um85dmpOMzdSc2tp?=
 =?utf-8?B?SWVKMngrR0JPOXNXeHlSY2hVTHVvRjhRbkJ1TGxrYkNyMXVRRm9DYTdndUs3?=
 =?utf-8?B?VHdLQmcwVGZVbTV3UE5kV2tOZmFhQURVdXFrMWlVQ1hNTFk0TGFLTnlUTHdq?=
 =?utf-8?Q?NgsI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:10.7161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d719ce7d-e226-4530-d8ee-08de3bd44ad7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7197
X-Authority-Analysis: v=2.4 cv=DtJbOW/+ c=1 sm=1 tr=0 ts=693ffcff cx=c_pps
 a=Z1aKtg390Pb53hnSiQipVg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=1M4ktJjbI9ath-Ez6AEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: _o5Lii2aCRB2E4Gp9VWAKf4bPrafXEoo
X-Proofpoint-ORIG-GUID: _o5Lii2aCRB2E4Gp9VWAKf4bPrafXEoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfX3Mi5TygI/HtG
 VhZlDhpffR6mM57BaiHQmESIDeywG1IBLwjEBfoXh3ydnfDb4EP0ZaUJQ0yei0beLY/fRiNydRX
 UvMU6N6+sJxCnTi8++d/tRbftgWM3hkTbEbMnzk03QvxpORCH8sEU9HzsGqLKU0BRXvOsypvq4G
 /HJ6P/2LcDeF7qcW3shrzPtzOu6WQwfyqCiMeuz4wZnWtHTdIj6WCbfX/XFmzPxngl0bRRsirHo
 fd/5v656KrsbO/xJD24erhzMw3/N42sBuyg12OaSOjms+VaeNoLJsIYzJQ+v6FeSmjn9uoNi8+r
 36FjLZK64JwZgGtRcjTt8hMu7XuL5GjtAoypJov+81MJ4iXgthYk40qxLDCDK6uXbEL+02LIOtj
 Y2FOQGZuBdOFm5pDyJq8viIYjLtT0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

By default enable the analog filter on all i2c instances on
the stm32mp25x series.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 4d5222698a16..a334e92cac4a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -781,6 +781,7 @@ i2c1: i2c@40120000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -798,6 +799,7 @@ i2c2: i2c@40130000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -815,6 +817,7 @@ i2c3: i2c@40140000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 43>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -832,6 +835,7 @@ i2c4: i2c@40150000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 44>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -849,6 +853,7 @@ i2c5: i2c@40160000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 45>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -866,6 +871,7 @@ i2c6: i2c@40170000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 46>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -883,6 +889,7 @@ i2c7: i2c@40180000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -1468,6 +1475,7 @@ i2c8: i2c@46040000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
 				power-domains = <&CLUSTER_PD>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 

-- 
2.34.1


