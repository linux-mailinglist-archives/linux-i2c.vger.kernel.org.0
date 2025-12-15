Return-Path: <linux-i2c+bounces-14540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C0CBDC68
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78588302282E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5DC1EF09B;
	Mon, 15 Dec 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KNu/+yoN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E843BB48;
	Mon, 15 Dec 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801226; cv=fail; b=sssQwr2auOZm+aTVKQLz605m/xtzHGqBkShn9FNgKYa/WRhIw1aOdV4X61SY3lf2/EZYW4QWHyLl0g62r7rVLoA4MssDvasToyJju/8qID/9Gz8kiw3ExhFu6dU/mMt9We6bOJUva84wY/eU9KwRA2DovYn5LeFQN5yH0oXD7e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801226; c=relaxed/simple;
	bh=bLgsoMQ0UyX8RfihtnVY9qJyo6O1/f0AZ3Bb3Nsooqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qAcXYxdh50Wx1tX3tqvAeNGq+xsBmHEOF1VeeBQBOlIO4F3x5L707b65Xi+spoyVT6Vp3Ym8fIvXYyaOC1kfB8MU9KxflyZZIWauYWRqKnikZKSUgZG29TAkYCebHXCQOoBgtOrqYwL9zT9EbLmkAAw8D8DeUkTowGo4MgbY8gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KNu/+yoN; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCI8kr2350140;
	Mon, 15 Dec 2025 13:20:14 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1kyq3thk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIML6HtWDqIhj6KVjlreNy4V8lQ1jMC79hJ17XgzuuX8w7e7g0uDzT4b5LgTnyQoOsUpsTnqOoXNBaSgRtmp/BXPxp1CYsdH1dqCtocTysQ2CW0rpewB9IU4gslMuQneWND27+zJ0x4s1ZeQinF7rVli1rgipyqNhyiGXofO2Qi6uk+aDP1ugL3YKo6/1a8Jqhhidr1+QF7SeMYI5XqqF0SIGc85RIe75VgHs3GBsN2OAkVV5NtJOjEy/SxmO+zlcc5NaTB0SJhUfVL4JENBZrGioI34GMTwfVsMQgFsCOVauwcSH8zUdhf0f/Ct+bAErQKys32klz05bJR63rkuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpXbZhUVBxW1djQ/EgXRtONG01rLNsFmqMi/uG0EpyY=;
 b=vFd3ja5sJ2iPnqBqwjp1Z7ousQPOPL32n/Vp4BumIWF12OslI6lWLpmSh1XKU4kYqsHp0ADUlZViXI84CgeRkdVFp78kzr9pgNc4BQ61M1cik2R2dHZJnkBsW85QGrxKyEZhUeVsHLywrkyylIeq8isLWP981mmokw0kUBxwwUxy+klgguCIaPvPKpMrL9uTcn92WvBLvCq0lOxauRYijuwHkVNHqzctdMQ1D3aj62ghQu9fZniiImCcup2LMwFJ8lAdCvuNAtyxTqdXRqemXwPBOf0Ld/iTeQoyLLhsKtvOBRnmZUEX8mngRaDlvIiTX+e/pGgZupdoo5u3+uFDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpXbZhUVBxW1djQ/EgXRtONG01rLNsFmqMi/uG0EpyY=;
 b=KNu/+yoNTLkiXjvHKITG0Ed8eEEOSa8cixKGL5MKrjLegH/6d3HvW29FGyB82HoEWRKhz781xgyuXSYegOxVB7zKpPKIOt53EH62k1t08Wnp5sc+CVFK9mAKV1HO9Z/5j57Ow/xSg5Nbn9Pm/6eXMs3KkoqWrGJVl+0K52q2DbQrJ5wVcQML7UC9XY4yweRYd55E4cVzkPyVZfoib3eYgHsJLIyG4j+nVe/yvOcG9rQ53Dbl9KE4UMo4w8BQPBZxJHjVRuhNIGdvliQunY3ZJScbgSzNgaTeY8ZfxvvPFggAa2KQCq0A5baMAbSPBA4KNI98ZXPcCJ9xoOwMWMvdoQ==
Received: from AS4P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::18)
 by DBAPR10MB4025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Mon, 15 Dec
 2025 12:20:10 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::b7) by AS4P250CA0012.outlook.office365.com
 (2603:10a6:20b:5df::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:56 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:09 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:19:44 +0100
Subject: [PATCH 5/5] arm64: dts: st: enable i2c analog-filter in
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-5-2738a05a7af8@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|DBAPR10MB4025:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c9eabe-c677-4d2b-d0ff-08de3bd44a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUswTjJmMTdlaitlUHdZMHhMUHRCUXBmVEtzRURRM3BXRENYdlhkeWw4akgx?=
 =?utf-8?B?bTNIZ2lsR1lkRWlDY3J1VlJjaWsyOUwxMzJWVW15bXhTcGExTUFxTkZkamRm?=
 =?utf-8?B?TlMwdVYwQVJCdHU3R0h2V1JodnNLeEhzVkJ1VDFoazZzZXdVbDlYK0FDZkli?=
 =?utf-8?B?cloxUmNjTWo1ZVM1NXV5a0dkWXBKMVd3amY3d3pCL2M0KzI5bU9kaXJ4MXpT?=
 =?utf-8?B?M0o0YTdyVDNsTjR1Q2QvLzlKay9ZWUVKOFJneDVXdm82ZlRSakFkeDF3NnZ2?=
 =?utf-8?B?V2NLdXFlWHBHSHpWU0Y2MlN4ZWZocDlqZGFsVVdrUmQ1bGpPYlZFbWxrR09N?=
 =?utf-8?B?anZKNWllN3ROL2lVM1MwdzVOaVpRMzJjWFBCU2pCajRtZ2NiUFlSM3ZWbHZo?=
 =?utf-8?B?NmlvT3F3eE11L0VxTXNRU3k3eFBvOGVFOG1oZE90cXFWUGg3TTRpREpxN0Nq?=
 =?utf-8?B?a2hmNHVCRXhPZjFrZFg4NTNoWWkwUXVIQVJ0dE91bWtjcnd0UjNaNnQwUlBN?=
 =?utf-8?B?dUFacmhDNHVwTUtXelAzbkRiNjNKWC9VZHcrWnp3Snd2MjYyYUZRYThsWkRx?=
 =?utf-8?B?WDVZdWNBTGIzeCtsbUMybXBqS2hGQW4vZmx2UkgvOU9ibm9WMDU4WVpHNi9Z?=
 =?utf-8?B?ek42NU5UaWx1cStEK0RqdDJKU3orS0o5ejcwL09OTFhwOEpPaUEwOXlLS2hi?=
 =?utf-8?B?ZTVveWF4aXZjQmwrYnI4aWdXSVZHQ3JEbWZ0UnZsc0lFSE9sdVhXc0hxVzRs?=
 =?utf-8?B?M2pLVDNhZEUvSkJMZTFSTWJaU0p5S1hwUjFhaWFHd1pBYXhuaHU3MnIvYTU1?=
 =?utf-8?B?UStRdGd0bGNtR0VrdVQwU2xmSldPb2dMV1N6VTNkTGFjb25EZkY2cGl6K2dh?=
 =?utf-8?B?U3VkbmpXUHhXSHZoU0hJZVFWQkVLQnYyandHbHJ1RTkrWlJNUTI3cGp1R01I?=
 =?utf-8?B?TW02UlQ4UDB2ZHZWN1lYTWMzeithZ09rVzZQVThxMXdNbnVLdDd0TWRvRFhZ?=
 =?utf-8?B?QUJYWHF4b05BS0toSDZjeUs2QitJc2FBbndyR3cxMmxmZEtndTFTVFh5UEdh?=
 =?utf-8?B?eXp2M1B0WmovMjFaa3dZK3FnR1pZNDBwWExGRXdMVzArdTFIc0lpRG5tMHJ1?=
 =?utf-8?B?a0lNV3owVVc1YnVHRDVLU1JvbVZaaGtjc3dUcWQ3dVQ0VUdNZzFCbCtWSGIv?=
 =?utf-8?B?dFg2VmMycUpjMGs4SW1jdTZxMGI0aTBmeFBLYm9sbzJCZU1uWSs5ekZ0Y09H?=
 =?utf-8?B?MXdsaWlCVGRyOStORXpJenRCeXMzWFRIVDhGU1I3aWJBaXk3T05ZVWhrYjRl?=
 =?utf-8?B?SzBnUHA3bktBTk0zaWdKMmdXLzNtV0h3ekZvTnU0bTlhbmRlamI1clpRb0hT?=
 =?utf-8?B?WkV0NHAxSElYWjJVMG5CM3VucGZCVUM1TzhONkxYR1pWZFlZeS9RTHB2TDU3?=
 =?utf-8?B?emxiNGI2dEJrVFE3K2dVN1NhZzMwWjJyRXprYkJmdkxhZWVMaFVzUEtnbERX?=
 =?utf-8?B?NC9ORERBOE1ZcFpmVlpuaG9hbkg5VjBiK3JvODZPci9NMDBxWDNjN21Sa3RJ?=
 =?utf-8?B?L25zRFNkTTFoT2JvYUVBaFJ1MUtTVldXK1J4YUhEMDRONmpkWjJ3Um9JZTVC?=
 =?utf-8?B?cVBvRDhWclk4WG5tYk8xdmhqWUJlYzhBYXRQYnZhaXl1bUFmbytyRkh3VHg0?=
 =?utf-8?B?MDMwa3lPd1U1cjN5ZTJRM0lRRlpMK1hVbG8vVVp2VzkvN2dnbXhidmU0UTBr?=
 =?utf-8?B?VFZFb0pFZURhRHFUeU1jRXJrQXlLUU1JQTNEZWhrR3l6ck9vek43N0N4Rm1q?=
 =?utf-8?B?d3dqZktqUWZOU2tZRS9lbmxyaFJyWlZzUmxiVk9kSnBkRkJ6VUlyMi8vbVND?=
 =?utf-8?B?OWxGbGpUUUg5dmpUa25Oajlvb2hZQ2pmWkt0bDd3QnBLQzRaSkFVN2JJNU9n?=
 =?utf-8?B?ZWliRnhiZVRrWGc3TU5QRUZKWm80RW1acG8vTTFsMGx1YnBDRzlyN2cyRWJr?=
 =?utf-8?B?b2lSVGtOSi9TbzVYSnJJVjFKdkVSTThVVE0yRVdTaHgvNENHV2NsZGRhbkNQ?=
 =?utf-8?B?ZlRqUTRpS29JSXR4cExqUmVwVm5MRjZLUFRXL1Rka1ROMXdaeFJiUkFsbTRx?=
 =?utf-8?Q?Ct48=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:09.8796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c9eabe-c677-4d2b-d0ff-08de3bd44a59
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4025
X-Authority-Analysis: v=2.4 cv=DtJbOW/+ c=1 sm=1 tr=0 ts=693ffcfe cx=c_pps
 a=k5WsYE8Ox4pil86Zu4gvjQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=8Ej6hIyp5kiNeztgdZYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 2aQiTM59ejSLk7hJ-eslwZUzv4ZleMUI
X-Proofpoint-ORIG-GUID: 2aQiTM59ejSLk7hJ-eslwZUzv4ZleMUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfXz6jdiJrd7oY1
 G1xUrKSIUVYQ/8bnxIiIbXHbiPaPTixw2o98UB+DwDOqHHC4rCWsgNi1N7c2X03zA7MlZ+PhbV1
 3hrRrRLQ2chZsd4/u6i5n0qcqph5A7UvdakdG36+t00WAVTjmiz1O9Kh42cm4JkkSEHlmv840hV
 N22bNLzBK6bUQ8Xqu1wCCIHdQGYzTFFq/f50ZQYeTB6H2O1Ft0KKd36la9W+XJxoFJ4CDBmo50O
 gcVCwRZTk+ibyoUBnVhHGepcBqC4Ux+FUsMaxdITomH9obZaHIpo9gMlVQaRikJMrAQoRoJIKZh
 ZgZuMDMFyr9Laehcbq9H5wSZfVruU3Ptbkr3Z469qSg2Ukt2KzSd2GPTABXybFKDxxGLfmc3FxJ
 kXzggILkikK5JTcSCpFAFEmYdJjVsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

By default enable the analog filter on all i2c instances on
the stm32mp23x series.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 3d2a71e0341f..65c0a0de4141 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -360,6 +360,7 @@ i2c1: i2c@40120000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
 				power-domains = <&cluster_pd>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -377,6 +378,7 @@ i2c2: i2c@40130000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
 				power-domains = <&cluster_pd>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -394,6 +396,7 @@ i2c7: i2c@40180000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
 				power-domains = <&cluster_pd>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 
@@ -668,6 +671,7 @@ i2c8: i2c@46040000 {
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
 				power-domains = <&cluster_pd>;
+				i2c-analog-filter;
 				status = "disabled";
 			};
 

-- 
2.34.1


