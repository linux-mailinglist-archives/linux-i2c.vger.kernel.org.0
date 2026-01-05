Return-Path: <linux-i2c+bounces-14895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CECF239F
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 08:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39A2302D53B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 07:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C424F261B83;
	Mon,  5 Jan 2026 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="E6E457/n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08226B741;
	Mon,  5 Jan 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597975; cv=fail; b=XnJGbcJ0Kek8+ORik+gUvd+t61ZKhHdR49AcspQykbwK2oEFWZYhubVyT1T9G3oSLOuIJ3Zb1Jg9RI1z81VU0nJaCe7Ar8EDT3Fh+sYbAQ00VFay8Wv/qHkU9ApR6Rg/mPIeGk/OEL6unOOT07aDSGBk1mdCImVlj6ZpQDpKxmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597975; c=relaxed/simple;
	bh=CmC+8b93av85PPbcnBTKPZ01Sv8q86ECBnYEgpu0kbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=seI1FcWBp877y1AI2KV+9fbXzeDbBmWzuatEPBCbDKdtPXwxOez8fKK5DLFUkfDy11yuLr743fDh8KWsHXG6D576u3JfK2ObDNYJiKSIQf/AeX5muWyvatbdgOTU5NE4OO85S69qpLR3c17eTHOwIA/nbquL60Ow05DnC0UGYNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=E6E457/n; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCu9kpszoEsb9w1cDelbtczseOAz4bmshWmrVAoFVCai6PVCLHn3l2kxxTzl+QHKZrgQzM+Cw7NyZjwbsWDycluW1FLsn0xagtc/PYqi5Mlmm05uBz6BiGzq7BxSbiENaAwMgVkPV2+ayKbiV18b9ccUToWF+D+3YPG6TSSQU+z71z4PcYfeN5GpnnutYUzKKq+WT7AVCd8k2iToPZVEWmuBDmQLycqzQJVnRCCbn3QKD8QSD6HAPMh3lrQxHqaaMg+TzD3B8eUepTSKPBTwSem4dRnLqaxtB+kDwFUXd75IHsJgYA4Jn17hxn6BGJuTTRTAv3RnDlK85eWsOWOUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYUEi3AMBgCtF4FBqUes8AGHKBEoECwNZpocuLpSrSk=;
 b=LZ9OQJat/Aiw6MEZLWyzfI68lMZ9AJA+QhmQMX45oHovcmkgSq22to7cleyUQn2dKNkQzx1nAli3A1L6AkQOap16YwlUU38shOPmnc02scqvxK6It3u0g2sPNSCo2y0BBYI3Rx4Jc9U7rO10eYWQfIB3CDdd4zIz4bdAOza+kwGUACE/u57TdL5SzOZBCuMoTYvELCV0n6qjAMB+1Om0GFSgAshPs8gNTMAVO2E+w9JpjacFkN1WgqRTfGTAsTM9xnjxvjnFjCUUyvSLIwLawtTOT9uoHIbo0S5Lupjq+g11dc2yQN7dpk0gLoKKZFyG6kcfDYA6c0AJ4pmSlRsbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYUEi3AMBgCtF4FBqUes8AGHKBEoECwNZpocuLpSrSk=;
 b=E6E457/n64iyq84BJrbjfORSAQcYGhiW3B6M8qCiinDDkuFlu1z+ZVdfGEJE2CMvTmkATY95Hd2yaNQKDCw5oicx8wIIgFthf8/HKEluon9lEWKvTklTZvbDbIIimhqTdE8kDWSTCwwhCyVsOuwpfw0J6aPPN7P1g78MowPPZtk4i46NMwzitbYF5Jm4OOH7OzTCbWHCVycWPuavw6iU3PlO/CVRwG+lnYvpQO9Ja80N376qBQJYCyMLxLkvrIkFXa7Beg5zQGIBYsqQLNXkpxYVRbyDVsIgbWROzwSjBRI0cXzQbzCYiltxOKJa8wTa6Avq4P8sjxcM21m+GN9RvA==
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by DB8PR10MB3306.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:26:06 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::22) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 07:25:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 07:26:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 5 Jan
 2026 08:27:18 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 08:26:03 +0100
Message-ID: <92c8b930-adc2-4204-b9c1-0dc1e31115f3@foss.st.com>
Date: Mon, 5 Jan 2026 08:26:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] i2c: st: set device parent and of_node through the
 adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Mukesh Kumar Savaliya
	<mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Vignesh
 R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Andreas Kemnade
	<andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
	<rogerq@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<linux-rpi-kernel@lists.infradead.org>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
 <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|DB8PR10MB3306:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0cac0e-5012-4f9a-14b2-08de4c2bb02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1JCU0Zsc1BIRHVJVCtTakx1bFM1ZWlWR1Vwd2RtZ0NVVjR2SEhkcXA1UE03?=
 =?utf-8?B?aFVGekNBSjdScUdKS0oyeVcxZlVBWmk3K1Ezd1crKzR2dnRMQnltU1NCdTUv?=
 =?utf-8?B?YlFMYkErZGFpNEJJaHAvQ3duQmpWWm93RURBVEpuS1hLMXFUZGJzT1VhOEEy?=
 =?utf-8?B?eGtHSWJsSGNVaWMvU0xsMnBRQ3ZhQlZPZ0lHOUdpRkNBODM3bDVudHF4cENk?=
 =?utf-8?B?cE9sS3Y1cGowbjRSU3V5UjFjRGxXSWllMldYU2h0VGUydnpWeTdMUGk2ZWt4?=
 =?utf-8?B?dFNvOFVIeVcxZElCb2xnVUxpSlIzSlVIQ0FYZU4yaEVmSUtrSmxHeVZ4Tnph?=
 =?utf-8?B?RTlnVzdyQWgwTStySGMrWGU3dXhXcFM1eUxpYmdRSnROTmZQUUdPR2hzeVdM?=
 =?utf-8?B?a05GWXFYM0gydGhwWVBxR29oaGF3d1R0RWFyVVZ0K0lHMnJFeGV0S3dKQm1R?=
 =?utf-8?B?MktCRjRBZkhXTTYvdW1ZaDdNVzRwUGsraVdmbVBFOGROSDhzWDNwYU9aOWJH?=
 =?utf-8?B?TVBSY3MycExlYW9aVkVDTm5ZMGdvL05TV1R6eUhweXlHSi9jcDMreVNtSGR4?=
 =?utf-8?B?cXBROHAzNEpIdVhHQ0JpN1VzNGhEMjZYK0VvWEQyMkk3K2d0bHFrN1NhTjB5?=
 =?utf-8?B?bUlkazU4czJzUlVTUmdESWFyUHk1VU4vTWFkMWs0UnJMWlhJTzZPTXJmZUpz?=
 =?utf-8?B?Yy94SU1RQTV5SlRjUkFFR0N1bHh3cTZyVU5ieFV5cStDQ0YvMEQ2WnQvNkgx?=
 =?utf-8?B?amhPOTYwcWdjbXN5WFN6VmMvUytWbE9FcHd3L0krZVlscWlDR1VEaEp6NE1x?=
 =?utf-8?B?M29iNGxOanN1TWFBV0d3TWNTRk95b1NYOEN3UzJpV0lqWHRDdzNTOHM3WUhx?=
 =?utf-8?B?TEt4M1dUWkx3WW5kcFFLeGFaRytQd1FJVlFZeUxKclZ0ZXQ4eml5UE8wMXh2?=
 =?utf-8?B?aml1d0d1Q1B5bFo4YlFUbkwrYlROOTFWY3hmakRmd1J4eWNTQnF1M1ZRZ1Br?=
 =?utf-8?B?VmdWMHM2SklmbzZ3RUcrZ2NNK0hTKzlXdFJuSVZpd3Z4MXhCZkdTSnF3K0Nh?=
 =?utf-8?B?SXo5elA5VWxKV0dPQzNSSlNibEcwVlltSzE4b3RlSzV2RFhaMWVGREJIUnNB?=
 =?utf-8?B?aVYvZ0NuN3NDWTl6V2pORHlJNStYeDMwR3pFZTNvSHlJc3pjLzd5eXlhbkFo?=
 =?utf-8?B?Ti80TUZlRG9OZEdVVENtVzV0NVhNQnBjVS90dERIcitKNWdzMEJlV0xZeEZ2?=
 =?utf-8?B?S1N4THoxdTVoZm1ieXVpNTJWQUlJOWd5cWFyWDdtTUxIdklzdHhmZmpOc3Nk?=
 =?utf-8?B?R1ZjeHdSdDJYRjExb1Q1VVdFWDNWUGRWdTdyTUpocHh1ZW5hck1wNFQrZ000?=
 =?utf-8?B?VWppSWxHY0wwVURBSEZjQjZrdnBEU2EwZmFuRWowU0N4MjRFRy9wb1h0SWcx?=
 =?utf-8?B?cXJ3eFYyUGlaVERZT1FXZFl0emZoVDNlTExVNFFrUjV1TlgyMlVxMWE3Y0Ft?=
 =?utf-8?B?SzliTHoxQkIvM0hST1BRTHpXWXc5UU1haDNWSXd5bTBESnkwRGRiVXArSzF3?=
 =?utf-8?B?OUVzOEN0cDVaMHQvWFVrY3drK0h0S2NHYW1lMHlna0RablVNNTlsZUh2cjJZ?=
 =?utf-8?B?OTN2TUJBZmhiWHBYWGQvNi9XMENRMkZXUCttUDdSd3VNcHE4b0U3VHhQRUha?=
 =?utf-8?B?WFNFdlR1SzdhVVB4QlNCMFZ2RkVwWWlIOVlabGw3d3l0RXpyZWpzTFRnTE1i?=
 =?utf-8?B?OE5vVDU1a0h0aERCQW1BSUVqeUQxQ0phaC9xcGxPOUtxckE5WWxZSzNrcDVT?=
 =?utf-8?B?aXdjZXA3eHV0VW91Tk5sUkdTT0pCeGU3Vy9UY1k1NGlQSlRYd2hmVU83WjB5?=
 =?utf-8?B?VWNsSHdOOStFUlRYT3V5UjNZQjFNRnppTUFwbnVWMGhOWFRYeVA3UUp2bGdR?=
 =?utf-8?B?TFFuVno4c0lDY0VzYnlOOElFWSs1bTBSM1dUMTQ3M2ZvQ2Y0QjNhb29td29K?=
 =?utf-8?B?ckh0bjA5bkRlcDNBUTFvbTA5SHF5bzkwc0w1VU9QU24xQmVOdVJ3RlZpWVFP?=
 =?utf-8?B?SUtuRHBQa2IxemF1NlYyQ0lpVmFUYWI4eXFTRFRxVjJrdHZBeG1jV3RGVnQ0?=
 =?utf-8?Q?dCkLI7yqYPYS6AvM+ckZbErSs?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XhOIkKigiqcgBC4YONy8k00dBReqFN3Dao+NmHFl+fQrxIN3tHsnEI8MWfYyPy0IYibIDTMDMar1uYpi4Jm5nBY9IhzBJmfoMIEGyIDOBgIasF7d2TWq5NchNtknip5M9cJDAkUwgjnizgQrqznK3GSY+yLd1K7Chpjcl7plM/p2Zm815000zu20YrMtltLguN3ePqOqpHMuTvAefGymZGOtLLe9VGAJgzMTJL/KfjXjbUwVFXMIusaoBGLkArRr8dh2w7ktVG3NJ4Jfz7hvLTi7wssY2rzZY1HMf1FrPNOvz6fmy1nFS7Cd1OfJk4mU5Fq3ejBfRAy9WkmEnTSaHBYR5ivvNZBwQp/D9hsXVxoUSnTp4Lm04tT1wEPEq5IhHl5cR1jTP9h2N0Zy58VM7VLjXbNe+I4FS5u+8ZBM0yz4nspouO6SuhxWoJh05Lwl/WPNtJDGKVIkAPuS7sN6C6/R43WCab3ifFiD7L6mCbbKS/3hALpWJK1zde8mh6uLmkRaZ+G6ca7ARrEDfXMROI+2S31i4x00xXY2QqKewcXcdbifBpDbMlfKNP8rgF31qDJ7ITtphodNMRWqTofuqkXrTo+Owi1YuX2YrR7tj572EA5KMsrQojYK3d+O1JI2ixf0AQ8DYcdCK/wRMuPb6b/gIJvrYUcmnmKlVYXiDk0EQFHFSoUgWOl44VmQoUvt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:26:05.5599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0cac0e-5012-4f9a-14b2-08de4c2bb02f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3306



On 12/23/25 11:04, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 97d70e66722706f242cd97153387c3a865abc12d..b50be2c39eaa4b9b95a71b038a4d63f3c5fd7c4b 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -849,8 +849,8 @@ static int st_i2c_probe(struct platform_device *pdev)
>  	adap->retries = 0;
>  	adap->algo = &st_i2c_algo;
>  	adap->bus_recovery_info = &st_i2c_recovery_info;
> -	adap->dev.parent = &pdev->dev;
> -	adap->dev.of_node = pdev->dev.of_node;
> +	adap->parent = &pdev->dev;
> +	adap->of_node = pdev->dev.of_node;
>  
>  	init_completion(&i2c_dev->complete);
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

