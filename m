Return-Path: <linux-i2c+bounces-4095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F490D8A5
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA7401F243CF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A073153505;
	Tue, 18 Jun 2024 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="iEDxVhEs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2116.outbound.protection.outlook.com [40.107.22.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06350297;
	Tue, 18 Jun 2024 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727009; cv=fail; b=dwL1WdHB2WM27ApR53BKaXKH4aKS1nVauUjJbgdnjM+3eP141XIWCd39PB8iYWTW76aV1j/xyf9P9GKjPMvEMzKbQA39eQv7YfWyMjBeuZKJf0p2UJL84x1ItCzI/yqxeqWOXUSQOvj6E9TyxmKRICtptOObRJMZ63Jg5OEygIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727009; c=relaxed/simple;
	bh=E7If3br4S8Uf2sF4XOo+1cQpwJ5a9s5Yad6QwfhILIQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AUDlaiD1L7e7Plqky6BTlsipjCBuZNXgXQ8Kj5Hc8mx3dQeWzyU7Sxcx4gQpeBARJUAR1AqZyIUbKFyEJJtqtug0YHsHPMwJXHlPTdNLMJlyndEShj/j1CN7G5GEIse9bfh3ttkZiTUrmIXFypbLabKoZpEK1ZAZ3B0TPimUxVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=iEDxVhEs; arc=fail smtp.client-ip=40.107.22.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwbykTKDFaD4yEo5YzFvnKHubUs/XkvK6LQ+l66Jvzv883KPP8tZy6Mis4WyaqYfvrYn4lCU+8q2E0xPGzpkW9zSrPVP9yIkyxFifCPtiT8hHQtIEC37v8PgKBwucW7Qv26ayTQCoTSlAM1x2+MMwvbBybttfXHULzLUCpcIlmlZzyqFiQW+Jjjosty3QTSLrPl9h3timx0AFALUcHBJ8dyO6VucrFB/OOIFUgP0CaH9+dUSGhc4Ds7q/Os8bw0B2YBlqEgrPCpVS2oQMdbYMoFju7n/FO+DS1j33aZ2lvu+MyS98cO+ZAiZT97YD+hOqg4zlF/L8q0au5Z5H1gZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH9XbuZw25y545jskZu/aOPTcM93uZ6UG+Rls/bNY74=;
 b=drcTPsu2OCXQYU/di9am+2/1JrfYeK0uG34StbQSB4C4DppE1SujNgzM80F5SyIcNzow1n+iy9hDVEssPqx9EU3qkKnkMesRZBhG3i9vvZeQ4RWQsAXDARAU5WDuYDHMMI95+l4x5HyGTyGR8jnAww9jVraGD3Ky1NAeMvNOnHVaZfdWlLRx4rqkbx2iia/tik4/6NU9uOxRorgBby5qXtUO94gFKfmfsKhuBpZlGTJxER/Djn2QbDzQ+GrnEmFi50b67q1KJWHtTKcRU7rLIfsl1x38DxmBOLvLgIPHB6LKhGvW5oCFv4A2AFsfJVBcjITQihjmEyKc8Mc5l+KdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH9XbuZw25y545jskZu/aOPTcM93uZ6UG+Rls/bNY74=;
 b=iEDxVhEs7mXDtcXUQthUZTH1af576QTrx5r1235Pa2mMOyQeD/O7w+XxEuTvNsEgfqhzShOY4YZXYxVzJL4a1/m0V1uUrFGMPr3tlgPOOQQR+G4Q7N+R5jAKJChU475/Kn2D4SS1NULFxFBpOseGzzqtAK+vSxffzAXxWFlFBew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:51 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:51 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 18 Jun 2024 18:06:51 +0200
Subject: [PATCH v4 9/9] arm64: dts: rockchip: add mule mfd (0x18) on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-9-5462d28354c8@cherry.de>
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI2PR04MB10642:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2af6d7-26d7-495d-7bbc-08dc8fb11573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm90MVhOa2VWVHpRYnhTWDQ0UjRpcDdmemtpZXFHK3ZSWnZRU1FkeFVqNS9n?=
 =?utf-8?B?dXlMS0oyYWlPODhrNTN6SFMzbkZnK1IzTSthOUh4N2tKdStVQ1FnQmRpeEZC?=
 =?utf-8?B?SGtFN1pwUFhhS1pYbEhWWnJSMHdSVWZoV3Y5WjFMTlFya0E0bjRBL3BvTDgw?=
 =?utf-8?B?OGYrRXhDRmRNb3hIY0JJZ3NxM09CRmx6VjUxY09ocVpZdUpxUGk1R0s1bGVt?=
 =?utf-8?B?aHB1c0NjVGFZcjhtT2pnZ0d5T1BxWFpzZndrR0MrbG5SR0IxTFh6bGt5MG1K?=
 =?utf-8?B?SE9uMWx0S1JPNWcrSmxUVWtLbU0vMmtpNlpSYWFSYzdYVHZLNU5zSDl2SjVT?=
 =?utf-8?B?RmFWOXlGaDhXUkYzSk14QnRZZ041MnpPRi92eXljR0c0MTN3MlhSTWVnWU03?=
 =?utf-8?B?VG5BTUpQeE5IeGhqYS8xc1VaZXZSdzZ3blhTa0ZlTjFnSWxMZElDQzhGNWpw?=
 =?utf-8?B?SnUxOW1ncEFxUVFhdnRGaG9WOHQza1Y3UkVEaWlvbzl1d2VXSVFtWWhnWlM1?=
 =?utf-8?B?WHhWREpKYWhjelZUTTJNWXBpY1FETFd5anZBMUczb2tsbGViY01lMElyejMr?=
 =?utf-8?B?NGVtZFRUMmVxVTVrZ3J1dXdMVjgzb1VGSEROb3RBWVE1UHdmbGMyanpZSkho?=
 =?utf-8?B?RGJYSEtjZnE4alF4NDh1ZXJmUVRMOVd0bUd4Tk9vcjlnNnp2dkJxNnMwc1JP?=
 =?utf-8?B?em1DYmNEeUxJSDRRTjh4R08waW9Ta3NpVnArMTExejZxbXVKNTFJR3NVcTZq?=
 =?utf-8?B?TWl2b2ZRRHplREdDSlFQVUhMdXp1T0NWQ1RwSjlJVkVwcCtGem8vWnZIM0Vx?=
 =?utf-8?B?dVQ2N0pDTDVuZzBQdXBrRGZyNUNxVWJ6WS83SVBQdU0razNLNWt4L2ViMnBT?=
 =?utf-8?B?b0hsKzBUVlJ5ZStyUWFzUnNaN0FKeGh4cnp0UDQwZmhaeEpIY3VqUmZTZzdG?=
 =?utf-8?B?M1RTaDYxdnAxeXdxQlNCRUZ1SDhMOUlFMEZpdjhWNENBSXFsWWhHTlN3TXI3?=
 =?utf-8?B?aFBHRmN2VStpYXZhaUNYdkdDamRwSlU2d1Y2cTZKaHl1VWw0TmlhV0xISVF0?=
 =?utf-8?B?aWJGNlBENFB2cW0rOEE1aVR5YXJVU3NaWUQwM3A2anJ1TTVyV1NLNHpxUzRX?=
 =?utf-8?B?M2xWdzZsZGlPd3ZIV0RaWFVNSUs1dHlMMGxLOUd0WUxNUkdqakxxbjdrb2Jr?=
 =?utf-8?B?QzJHZjJuZFZob2ZvVEJkMHlWODA4d3VUenNzdGJlaXNEc3V6L2pMVkdiclNL?=
 =?utf-8?B?ZzBIWUNPZG5EZkZyaFg0Z0RGZmMzTU9sWmpDc25vZktKS2ZQQ3cvWkk3RFFC?=
 =?utf-8?B?TlpLUzNrTVFEUlRPYUI3TUE4VTY2dVk2cjduNVdNRHBNcmYrbTFudmtBb2tz?=
 =?utf-8?B?ekU3U1VjdEVVdGF4TE1xWVBRMWxuT0VLb3A1YmgxN3U4WEVTcFUzMTJNdVFF?=
 =?utf-8?B?TkpwcmZaejRJWlBLSXJKR2ZxRFo4N29rVTFtQmJrTmduTm9VdlU2bWUybTB4?=
 =?utf-8?B?TXlGUFB6akV5LzhaSWo1OHVPYUEza21hWllsYWRmU3NIdnlBY0FxNTE2L0Yr?=
 =?utf-8?B?VVZOVFpvclZiQXR2T3I2WFcrY1I2V0I1QUF1anRZVjBnMlFCOGJ0UTlzR3Q2?=
 =?utf-8?B?c2hIVHBFenRzRWpJWTNRTjNnanJ2VGFmTjFPeDFrTFVHQlYzWU4raXBPWHQx?=
 =?utf-8?B?TmpleEtpLytscDJXbXlZTDBVTUtrMS9uZlI1QmJOenlpbVBSdzNNbGIyaTdV?=
 =?utf-8?B?V01IUHRGZGROa1lLMGdUR2ZXOGlHRXF3c0lYMWx6VWtzeVpVTGdSMElqVVV1?=
 =?utf-8?B?VnByRk56YW1USEc4OU84RE5YVmZDSUkzMkx1SWFud0orc3Q0bkxnTWd0QzhM?=
 =?utf-8?Q?eJoPSzr7dwSz6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXRMSTRGb2hDUmQxWFlSM25BWitrSWFQMDlLN0hBQWtrV3pCVHRmNnZYOCs3?=
 =?utf-8?B?NThpSGk4YmhxOUdjdEJDeXF4UXVYWVZodnVMenBwSWZkWERQSlEwQnVvY3cv?=
 =?utf-8?B?S3AyUDRtKzg2bEJVOFJZa0FQekEwcXVFdElWZ1Z0N0c1T0FrNCtaaTZBWXhP?=
 =?utf-8?B?N1FxLzRwSm5QdWNLaXZBZTh2RDlxM0JGQXJpZzlNaVJGUGVhRjFNSmRTOVhl?=
 =?utf-8?B?OHpLYVZ4ZytuUWxRais1S1BVNnJQek0ybXQ4V3kxNDRIZ2xRcTAyS2wzSzZ1?=
 =?utf-8?B?ZGJDS1NLNVNHTDF3Z1MrSUVYNkJWTXBjdzBHOThFeUZ5bTU1UittVzd5Uk9p?=
 =?utf-8?B?RnErU0x1TnVJNDBLNGJZOEVITlB4MEJSM0xSbmlKNkovY3I0R1NFRzAxUXBV?=
 =?utf-8?B?V01TcTFEblMyVG1rd2JYL1B3aFdSYkNnLy8vMEpveGtxc1FWajRXK1ZJT2tV?=
 =?utf-8?B?elFGOXBVaUk2alpLMGNrZ2cwQUVsZ0FNRU8vUWl4WTFWdllVNGZObFVlT0Iz?=
 =?utf-8?B?REFCejlDNkMxbzAxS1puNlZXOGd5dzNUVml0eHhSWW1rYVNodllTOEZEanZH?=
 =?utf-8?B?VldyYjFITGpMSWhPYUkvZ3ozaGJqcW1Ta09uaVEwTTQyd016YWloSk8yV3lE?=
 =?utf-8?B?TURnV0VVb3BpRGo1TEtTWDk3bnJsdGtra1VvQ242NEFBSWMzZjRHQXpHN09B?=
 =?utf-8?B?NFJCRE5uZytDMWgwaURCbUs0Z3RmM0dJaEt6eE54MXQ5a2NvUlU2V2Faaitx?=
 =?utf-8?B?OHZveFRCOVVuYkVtL1FMclFxVmRaWWJTYnNmRTZweVRkcXdVZzdPdS90b1Jo?=
 =?utf-8?B?QmwzdGU1dnRyOW8vMTN6dzlOK1QySFVvSWhQNjR0RVFidm5WYS9kWWFIRXk3?=
 =?utf-8?B?aHFsSjU1a25nUmU2YXRVbjlEQzZlZGdITHhJd3dyT2toempPVVprU2VDTHJT?=
 =?utf-8?B?U2xHOGFXM3cxWmZ2ZnlQQ2tIYXBLRVE2NXpwdE1jMldUL1A0ZW5CWTk0bFdl?=
 =?utf-8?B?RGF5cFFDUjMxTWt4R0JueWQwZUJINlZ3Ly9yK3Voang1OHlNRWJmb1VGQ1RS?=
 =?utf-8?B?Ulc0TnRmdDlDRlpCMEMxNmFQTU5HMElNZlExNHBpMTZ4Syt2T2lvc3Jac1Fo?=
 =?utf-8?B?VVAxK3VYc0p0VnJsc0UzbW95cHZIVk1YeE9uejZUNDN4R1JGVmVDeER6L0Zp?=
 =?utf-8?B?N3FFU244N2NUZitXMjFSNnkzRVRzTXZLbHZ5Ylk0V1pnK3NZZFUzbWpQL0t5?=
 =?utf-8?B?WUQ4VVBmWFZCdmNoK2dVelp0WS9nM1hScXlMb25MTVJPbnpTUk5oclpTL1dh?=
 =?utf-8?B?Q1Fsd1U3YXpvMWdVajJ2NkdKam1qRHFiWWtjSkJoMmYvTHhWUndSVnB4Z3ph?=
 =?utf-8?B?TFc3KzJsMnV1eGVQcHZZdUxSNzI3cHlpckJXK3M3Mnl5MkxUd0RuY21TK2dS?=
 =?utf-8?B?WHBqdDY5d0ZidmRMOXJQMnBEaFIzajY3ZDZtWVU5QS8xNzQ0cm1mcmhQNlF2?=
 =?utf-8?B?c3A0QkIxVmk5TTE5YVpRNjRuWlpkS2ZsNkNiNHFBYm56ZjRsZUo1QXNjdnNn?=
 =?utf-8?B?YmJJUmpmbnFnY2Z2eWtKcWtoMkZaK0hjc0wzdGM5WG5DdXBRWittcEtwdVly?=
 =?utf-8?B?OG1YSTd4WlZ3c0Z2dVFjM2RNTjRSQWcvNFN0NzdiTGw2WHBOdkorVTBvd2V5?=
 =?utf-8?B?OTFDWWd6SFFRRmtXZmhkb1VGYjNhTDUzUlgzS2dhUUxuL0NHSG9PNkF4VHNB?=
 =?utf-8?B?RnJIWGFQU2F2QUhUZEFMRHFzSklseU1vNXFva09zMFpaSm55ODZpQTJCNS9h?=
 =?utf-8?B?ZFlDNk9veFNPOWZUTHE1TG5IWjlYdHlJMlRjazUrY2dORGFXNGh6WmdxSEho?=
 =?utf-8?B?cjhGcm5yVVFZSTU4UUNwaXNJdzV3eHRmWkhuVEROQVdtaTdoUE93dE5BK3V5?=
 =?utf-8?B?anYraTF4L2hEbUV0eks3MWJuQjFyTlNIZlFLK29Dd3IrWjF3TllVOXVtT1hk?=
 =?utf-8?B?TUI1b0d2NStLcDA3WGRpaUxTUFVSZkt2RkJsRE5mTmFBS1lZRUVKdFBtSkp2?=
 =?utf-8?B?SWtDVEdnb0RMTThtbmR3UExxR0hEL2hVR1ZVTFcyMDZxTVJ5MkMxVlhlaHRq?=
 =?utf-8?B?YnBnSmU3TE1UOC9zdkVIU0FjV2tvS0ZWbTNJNWYzcHNKU3dVL1orZUlFNUFJ?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2af6d7-26d7-495d-7bbc-08dc8fb11573
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:51.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OQnwMSj4S837q2UyAyogROOIqTC0478rrDBJhVRsfav5/e2R90uDD6JuulUvmjhzfowUMaz5tLCqxI5gFopHZrrqiz6RY3cr+6hC54Dy/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Mule emulates amc6821 and an I2C mux (mfd:0x18). The isl1208 is exposed
behind this mux.

Add the mux node and isl1208 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 33 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..cb84295f118d 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -291,15 +292,33 @@ &i2c1 {
 	/* SE05x is limited to Fast Mode */
 	clock-frequency = <400000>;
 
-	fan: fan@18 {
-		compatible = "ti,amc6821";
+	mule@18 {
+		compatible = "tsd,mule";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan: fan@18 {
+			compatible = "ti,amc6821";
+			reg = <0x18>;
+		};
+
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


