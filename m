Return-Path: <linux-i2c+bounces-14174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42CC6FF16
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 17:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 498C129B8B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FED2E5B09;
	Wed, 19 Nov 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iJ6D7pF2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B82E7637;
	Wed, 19 Nov 2025 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568368; cv=fail; b=fCOmmHQdYIm8UysMBiuEfYb7b0JiJSgahQ8YC/fwxGG2kS5h94J6n8rFUjRgVmxy649E7cAMzJyNqiYm+E5y4gJr/8WJebcy3zHztEwMELf0aGRcL7JV2eASjc8vQD0p8hUT6l6GdYlhxcEroc574jjyt3P3fUhzivFZiACqGQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568368; c=relaxed/simple;
	bh=JQhsO/dODDg9lu0sq4SfEOvl1kXhoHQn/a9NOkBwX64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IISx2YF3NF/SppYBqXUV1MzC0eMPLg6NiMlu+hoa4Wuj+DRx4IAeLtBq7hvyAHfQf1RH2sUrKZ82kiyDQ6Lb2X1ZZ9jjlgRJkTeznyfnxL9H7wT4l0MlmuweNWvalL8ZZ0xpOP0ucy71zIhv5af813UmW6sDzmKv02lQLM+7sfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iJ6D7pF2; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwJEXC3/nGaxMsUlpIA3fYPOW2IQ1mVkn4hPc2A2Tt3cFoSnkdiTpR1geNlqc1AwAAZubOCyHPcZohDKeZvAAaMxmOShGqlIzKYaobj1KwP+ssD2T93PuYiK8OtexSrSZKYCjVJSIfPLzZSDjUkUsKaupEWcV5j1ml+xV0jL/UdtrXPNimMfAGKCMvFq+5d5SRdFWL0h9q407FciZH7uak3LBFXhy9PdP4EYUbPUtHwkX5OBlHiq10hMaXiupKd69Nh9JIyM0yYmBaCYftM1/UpH6Ag7P84zjKt41mbzotZX9M9NrKNgaGUX2AxU+YdMJVJdmzV61sr8fefbO0tVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3zQ13wGj4PwRD+lyTjkT7UXgljB8QkyzV2vUDygpUQ=;
 b=TvPdDmpMkOMnTtZALl2UdCz5lH1Jxw/fYNfFTlPPjzLF84bykosgcnnavlzkWx0D07WHwDza4DUQhMUg+e7EuOwpCj+ea+j6zhpzsZ8upvhDjD6/kmWcPVnYOXb0+gyVdn09j519o56FR87csnwpaVJ/A4/2989cbEFJao0uZA+q6TEmXT1NPomIIadTlni/pock4b7uXtFDtwndSsa7XZn6s+w46h/ih+3HtUB9t94LlMedNrm2qsPefec5AI0u9CiDyYbTYrsnmdx2ZvC1gL2TZCpwX6A1KQoKF10vlM3I/1uTF6A8gCHlfVxEI9fpVQB2Z5wYq9/lIdW9KlBkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3zQ13wGj4PwRD+lyTjkT7UXgljB8QkyzV2vUDygpUQ=;
 b=iJ6D7pF2NWhHanCTYSGLqp5rOGh2rwDOIuWBzGcRe+yKqDib9sG+lAHWLW89qt779pBa8aLAXu04k0BZAdy6mbQaILNkrnZQNAh3C6mQslSEkYkZETRHI6uDCNNNxXPIpezAnM/shHka+JcY3ylsIps9Iv1/v1o9Y3jvNWC+4FtEKVAB9WijmTucbKSqn0QWF5eDKvpZkTnjnJJyoGv/XKPurU8siOsUlNq65pwrmM1ZR0mXAjDdLIpsec/IT5XB3Li4e4qahFHaPuBdZBBDkuQLoL4y0bqtDcTD34o4ZweEeEHd5rwCGA99fSyzN6nOookT+r2Tn+bahKHV8dmVVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB7020.eurprd04.prod.outlook.com (2603:10a6:10:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 16:05:58 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 16:05:58 +0000
Date: Wed, 19 Nov 2025 11:05:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aR3q3KA0j2Qn+bCU@lizhi-Precision-Tower-5810>
References: <20251118071837.1419558-1-carlos.song@nxp.com>
 <aRyXjUF+x5BdK+uS@lizhi-Precision-Tower-5810>
 <VI2PR04MB11147CEB59F804078F2136107E8D7A@VI2PR04MB11147.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI2PR04MB11147CEB59F804078F2136107E8D7A@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e37ca75-7597-4d0b-85f6-08de278586fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUJEaTBFUE1XcGUwanVCbXBSMDhvTnArWWVEekVQNXBIZ2s1a2ZaL3NsM1pS?=
 =?utf-8?B?ZGJjMERNNDE0VytKZ3o2dU96ZXVZOG5uaG9FL3VDZm1wRThtVUtmZUw5eDlz?=
 =?utf-8?B?b0hqVXB5R1dFOVQ4R3lsMEtLNTJudVBoWHJTZURaZXZLaWZDQ2M1V2EzNG1K?=
 =?utf-8?B?a3ZmV2NOa3hDVldaKzVjT1FqRUg0YWxJY2ZFWW9wNkxXdEY0WHNXRUVkZGR1?=
 =?utf-8?B?WTB3Z0thOW1KaFJPZFRzTzQwVmVXQkl0cVN0dUIzenJDYjcrMFpBeUkrbzVy?=
 =?utf-8?B?QXNaQWhDUEtDdzE1NU9aZG9RSlpVR2wxTjhqVzZoR2pHc0tUWXZoMjA3NU9u?=
 =?utf-8?B?NXhHYlFjMGp1MjJ5K3pjRmxLKzEzaEg3aE5OMHN5OEN2V1paRGpxLzQwbjNh?=
 =?utf-8?B?OTY3WURoN1FPRUg1MXJZbUMyTUh6MVZaQVplYi9lRVBxUDB0UVlzYjRiNjlY?=
 =?utf-8?B?eCtiTzdXVjFFay9EeXlRUmE3UUQyU3R0YXFrWGFZUWpnTG9kRzlEWFZqNE9u?=
 =?utf-8?B?bDFUdWdaZVE4d2xOVTNlbzkxYXE1NktyQlVWUUZ0RHRyRWRYNEhLTlR1Unla?=
 =?utf-8?B?QkM4WnRvcUMzdVZPNG1LMERyUE5jbXRiajl1QjdubE1NRlQ3U20rTVFJNDgw?=
 =?utf-8?B?bVVqZkxqbWZ2blFkdURIcGdscWFxVkNXZzdKZHJKOGsySjc5M2Mwdi9nSGor?=
 =?utf-8?B?SlVLbm95UWpSaEllc01CbFBtdzFla1FrUHFrNmF5czcwYytTbDBrSEZqN1Ru?=
 =?utf-8?B?TnFxRTIvbXJSRmV5YjZ3TFd0anhzQ2w4aXpoUXkzL0RSSEJUNmlLcVFjOVNI?=
 =?utf-8?B?djdxWVkxZExPSXhVUDNIN3JVYlJubVdSalpyTVZyR3orb2lWa3pNMWQxdXY1?=
 =?utf-8?B?OGJ6YkdORytEZVRxeElvakVzWWoxNXcxTVFlZCt2MWVBQyt1K2ZvNE9QNnFQ?=
 =?utf-8?B?VGovQ0dhSkhadHgxalJ0UkhlZTNaZ1B3MDJrQ2Z1SjhlaS82ZmZlRTllV1F6?=
 =?utf-8?B?WFVXN0JlTytFNVRGeUljYm5ySjFwZnY0Mi85TUozTm04RHplR0tXaHgwVENj?=
 =?utf-8?B?SWRuM1B3OGR3Z2RiNXIzRGlQS2RpN3M2alVMeVp2Vk43eXY0VmtBU0lnT0py?=
 =?utf-8?B?QUJ3MktQaXltNUpLYm4vczJCTmVvUUxzcmN6TC91VXBieVR2cnpWakxqcS9j?=
 =?utf-8?B?TzVkaWRtdmNkSlE4WVRkdWVMK0RLM3VKY21jOFJ2Z3FyTkpSbXRGODlpbXhC?=
 =?utf-8?B?UEFoNUtGcElBcHJnUTNHWldpem15RXZuNW9DM3F2Ty9RakNERFNadHdjQURG?=
 =?utf-8?B?a2ZaeEE5RUlWUUhzekp0U2xXblhmUHBVcUgvMWFjVjFVTC9IUm8xRlRhdDdI?=
 =?utf-8?B?Qy9SbWhoclR5MDRxMURnL0dXa0tGR0ZLMWJJWTZiWTlnRENsY2NJV0dOb1V1?=
 =?utf-8?B?bSs3S1oyeEROZmdzZnhkcm5zdE9PbU10N1dwa3FPb20wbnVzSHRKY0pqenZ2?=
 =?utf-8?B?VW1XVjY4M1ZwTFEybE1xZGUxTHV6Uk1leHpKeGF6TTgzWFRYd3B6UFRvU2lN?=
 =?utf-8?B?WWx6ZVl4ZDlzeVhuN2lWQWU0MG9GeWloS1VMOGEyTGN6NDcxY0xNS2Jnc2JZ?=
 =?utf-8?B?K2JvTUVuSmM2UXBqb3hsSmlXT2NVclZiSXhnWWlxR1BKLzJyRjNIcUMzNm1P?=
 =?utf-8?B?THkyZnEvelIwV0Fld1JWcHRBS2U4bDI2L0QzRlA3OEdjbkZYaUVQNDRKaHdq?=
 =?utf-8?B?VjRWUXh2SldSekxaZkNXU0J1SW51cnIvc2ErZnhxYjlidGFSWFR3SzlQQWpC?=
 =?utf-8?B?M1Y4V0g4UFBBdTVTR2NIUlRqVCsxRzB3bDFTdmpVd2FpbmkrcHNIY3NUbVdX?=
 =?utf-8?B?dWpqR0JqYVdhYkc0dlVPdnc0S1FWRER0WExtWXNwa2dxS3dhcE1qV0plRTBn?=
 =?utf-8?B?S05vZ1lzdXpYbzhFUWVUWExJbUVQNVZrNXdPK3k5SDhBNWM4eUYwUHdTSFJv?=
 =?utf-8?B?V3pEN1pjVGlZWm5LSXhQTWVBalJDZ0VicjI1YVpaOE9CS1E0QkZxU01NdHVi?=
 =?utf-8?Q?srD/3S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djF2Mm9oOHNlSFFmemFraUdQU0RGRU1aN0lNcXZpQWJmaEhWYnlqbW1UajND?=
 =?utf-8?B?bUp2UEhCVm5ZTnZCVWhLd3A4SUtiM0FSaUJHR3FRZmNrUk9lbmRGWVNvWWY1?=
 =?utf-8?B?cXQrVHBJMDlDZmZHYStyOEc4cHBZeWh5NVdtNUhBVitIbDlnK2xQUDd6YXpq?=
 =?utf-8?B?TUFUWHRDb2U3QWczaG4vdE1JbDlTUFByM0tSUzZ4dWpZbmFBK3RaYTZqRHBu?=
 =?utf-8?B?ekI1WFd6L092TzN6WHYzZlR4aDhqcGcxeW1TY21HbjFnalJuOW1BR2ovVmwy?=
 =?utf-8?B?QS9oME8xQUlIcGo0NitWeE1pWmxJby9Ieis3alQvMXhyaDE1MjdJeG53R29T?=
 =?utf-8?B?cHlyVFIwa0ZIdHIySWtkVitndHdoVHZETVV1S2c2SUxGbXdiYkVnOStnMnJz?=
 =?utf-8?B?MTNhSDJVYWZ3b2E3QzRrVVVzSDVyZ3E5Uk94aVREMUlPUDZyS25TYTQzNWJ1?=
 =?utf-8?B?eEsxKzFEUU03RWRHSVNuaHZYRE1vdHJlMVIrZ0l6NkJJL0hvWm03VnRFUkFr?=
 =?utf-8?B?ckhUNmZZNFprMHBOUHc1eGExM2xQNHYzRTNvUnJpNFBRcit1OXNmaWxweUxI?=
 =?utf-8?B?MHJ3Tkt6WFQ3TFlkTjM3ZWhNTEx5dlMrd0dPVG0wSWx5Wkl4MmxsL3ZROEtE?=
 =?utf-8?B?MlFpSzlDRVc1WDg4dFYxekhSSWZQR21oRmZveFkwN2FRUkV1a2ppNWZ6b2ZL?=
 =?utf-8?B?ekI1QndCR3VyT0R5bk9SV0FEeENjTzVtZGlncnF4NVU3ek4yKzBDd2J4Y0FG?=
 =?utf-8?B?anRIalpHUDhON1dxSG1FUUoxWS9URTd4MmpVYmFWalJieDNLbU5EUU1DL21Q?=
 =?utf-8?B?WmQ2UzY3OFpPYW45b1o0eTF4Q1duOGVwMndheHdhNzQxQVYxenJzUHFuQTlt?=
 =?utf-8?B?N3JUUThFTkZ0d1VSYnpiODBRKzNzWDcrb2tEaGhmOGNKODZtVDI0cU9TNFRy?=
 =?utf-8?B?ZWZSdFk2alJ1MUZialdNVGJFWjZsa05rS2pyazJIZ3FFZkdJWEpTcm9pWHlX?=
 =?utf-8?B?U0pXSUpPM2RoMDgvd1hZNzBjeHNvcjNabUlpZitqQ2VBcTd3OE5rc3lvQVhC?=
 =?utf-8?B?cDB1Z3lvaHAwTytpWHlKVVFFcS82QnFGTGg1ME5yUFZtaG5PWUwvNllvVXlH?=
 =?utf-8?B?ZjNtQ3pzL3Byc3E5SmdRcmlTanNRZE1GMlZNcXlXSExxb2dFeUgrNlZKb1Qy?=
 =?utf-8?B?UzE1UXFqWDB6QkxWY2F1RmU4UlZKMm9MRFJaMWNlRVZrYUxXS0lUWEdHckRY?=
 =?utf-8?B?ZFgxRHFBWUlXdjc3SzhPZk1hMGJJMHhNN2NqUnFNZm0wRjBzN01DSTFjcTBp?=
 =?utf-8?B?M1FwYTAyS1lnMEV1S0FMb05peXU0TG9pYlNJaENJMGswdWtuZHFOUktmcTFI?=
 =?utf-8?B?eUVRMTE5WEQ3Q3FUbStPTk1xK3A2Sk1WTDZKUGs3clVNZGVFN0lYUUVVbjli?=
 =?utf-8?B?RUpwbzBPK3dQcVpkd3JVU3g3U3pZTUt5V3h5dnhsZGdVNmxBcmRKV0UzQUla?=
 =?utf-8?B?bnZMM2tzdXFVbnBGU29HME52VExxeFIrWEZoeWdCQVhRMCtQb0RNN2xaQ0J1?=
 =?utf-8?B?NkwyL1ZPN2dLeWhpSldNRmpVK2ovN1lPSVRIZmVlSkIvRzFWdzBTbm9YbVE3?=
 =?utf-8?B?OWdMYWNSRlRvbi84YiszY0ZteWFLL045dWRicSswU0kyRVF1K1ZDZ2pIMmFW?=
 =?utf-8?B?WkErdVpSZjNMQ3NIeHMzcStqL2VyL3ZFMUJjazR4a3ZQbGl3Y21xb0NLeW0x?=
 =?utf-8?B?MUNqVU01d1pNUG02ZWNpRXZvMUhlOVU0QnVZMFNwdFRUc2lCU2I1QUxFOEZm?=
 =?utf-8?B?TGRZSHpEWWY4YWpDUjZUYnhZV3ZRUUdSbHk5Z3lQNlBlVkdXTUJydE5iUmRW?=
 =?utf-8?B?Qkx5Nm5yaFdSTnBMQVhIOHpjR2VCOW02SEtvZE0xdnVIN1RrRW5ibCtYK2Vx?=
 =?utf-8?B?TXl2dXRkYmNwZUhmOVk3ZEE2Z2ZRVVpEODZLK2UvdmVXQysxVXJoWE4xSVVV?=
 =?utf-8?B?MmJPMTVMa1htRUtvNkllRzMxQ0VPVHlKRlpWNkEzV1Z0SVNFSDZoVlJwTTkx?=
 =?utf-8?B?YmlTcTZBQW85ckprZ0pEeFNZQk9iQnNxTFdNVHV1M3R0bmRjRFNjSFhkNG9F?=
 =?utf-8?Q?ZbCOw2WtEQfSEp4TjgAqz24Ie?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e37ca75-7597-4d0b-85f6-08de278586fb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:05:58.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJc15CX6HOyfSjfXljb1WlKkJe9MwUKFqw2wvX5golu9eJEivemlEb3Eac9GZFL+wKL5f0G8CrbtQ96on/4BpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7020

On Wed, Nov 19, 2025 at 06:02:45AM +0000, Carlos Song wrote:
>
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Tuesday, November 18, 2025 11:58 PM
> > To: Carlos Song <carlos.song@nxp.com>
> > Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
> > suspend/resume progress
> >
> > On Tue, Nov 18, 2025 at 03:18:37PM +0800, Carlos Song wrote:
> > > If a system-wide suspend or resume transition is in progress. LPI2C
> > > should use PIO to transfer data not DMA to avoid issue caused by not
> > > ready DMA HW resource.
> >
> > Currently there is no device link between the DMA engine and its DMA
> > consumer, which allows the DMA engine to suspend before the consumer.
> >
> > To avoid this, switch to PIO mode instead of DMA during suspend/resume so the
> > transfer does not rely on the DMA engine’s state.
> >
> > Notes: I suppose DMA engine suspend before LPI2C. Do you meet this or other
> > reason cause DMA HW resource ready.
> >
> > Not sure if below
> > https://lore.kernel.org/dmaengine/20250912-v6-16-topic-dma-devlink-v1-0-4de
> > bc2fbf901@pengutronix.de/
> > can fix your problem.
> >
> > Anyway, I think it is fine to use PIO at suspend to reduce dependence. But we
> > need know why DMA HW is not ready.
> >
> > Frank
> >
> Hi, Frank
>
> EDMA resume is in early stage and suspend is in late stage, but LPI2C resume and suspend are in NOIRQ stage.
> So LPI2C resource become ready earlier than EDMA. When IRQ enabled, immediately slave will trigger I2C to read data and
> the length meets the requirements for DMA usage, the DMA will be needed at this time. Within a very small time window,
> EDMA is still not resumed. The root cause is from here.

Put these information to commit message.

Frank

>
> dev link maybe useful in the same PM stage. But in different stage, I don’t know if it can help some.
> Maybe it is better that DMA move PM stage to NOIRQ, but now there is no dev link for EDMA, the resume/suspend sequence between LPI2C and EDMA in NOIRQ
> still cannot be completely guaranteed.
>
> I totally agree your point: use PIO to reduce dependence.
>
> If someday EDMA support dev link and move PM callback to NOIRQ stage both, this patch can be reverted I think.
>
> Carlos
> > >
> > > Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for
> > > LPI2C")
> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > ---
> > >  drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > index 2a0962a0b441..5050e14a9919 100644
> > > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > @@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct
> > *lpi2c_imx, struct i2c_msg *msg)
> > >  	if (!lpi2c_imx->can_use_dma)
> > >  		return false;
> > >
> > > +	/*
> > > +	 * When system is in suspend process. LPI2C should use PIO to transfer
> > data to
> > > +	 * avoid issue caused by not ready DMA HW resource.
> > > +	 */
> > > +	if (pm_suspend_in_progress())
> > > +		return false;
> > > +
> > >  	/*
> > >  	 * When the length of data is less than I2C_DMA_THRESHOLD,
> > >  	 * cpu mode is used directly to avoid low performance.
> > > --
> > > 2.34.1
> > >

