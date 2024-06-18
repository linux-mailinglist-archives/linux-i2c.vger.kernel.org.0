Return-Path: <linux-i2c+bounces-4089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F05AE90D871
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC4E282CCB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5054D8CE;
	Tue, 18 Jun 2024 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="iQELp6lS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2116.outbound.protection.outlook.com [40.107.22.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320A13A89B;
	Tue, 18 Jun 2024 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727002; cv=fail; b=rU43GAqTNA9Zerh7hgXnc+5EKkjEU/lrzAxQLfssCI2/LYlQYV+O2deaHTkYL+DOSp1hFwp8GjVI30W4gNnYHq98ArNXwbaWHOW4lHvzH4QEU/8g/JimlfTefoYnMVaIf2bxwj97K3NJOYMZLIKbV1dMcPvQSumYGba37olYny0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727002; c=relaxed/simple;
	bh=jVjVV3OmPcLweOfZYcdLUT2EHxP10k9uBFSa+YKLqMs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=EjsR3+UrNKhx3Umj7gzl0Vmr9qFvRDshvDwQdTFdmgkwQtuvloXL1glV5smhz0DZuQgmSKqyGILoPGll1oI+Lf8emcGxW5bJyEHDohqkbUcI+bUi0TcQFKe5Q3OTw6MDpCthACeGEFSPEVJ8A4vhhWzcFEtyJumdyNOW+h7uTPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=iQELp6lS; arc=fail smtp.client-ip=40.107.22.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTF9xbI4lG6ju0FLt5J/998/mbHfcIPfTrWZ8UOhjAZSEDUYjGJRkfihle5h/U3LTI3QqpjYCrFkbW9h9pT1WFiCR6xBl5ZrOAsedJgLiq/EpelEkBLMFRPhIALN0++wPxEStGBlxNqQiI6tfGuKAXtPFpFFSnyfqe0r7DAVgaWTNYs0VkjMu+6uMuvZKF1oQIziCp+u+VOrmYrfQv+NVT3hYQLaKw4YZI6faYkMHbJlP3J2escpXZdZm1ZOG+fXJjzT/FKgSZah3CbNZn5M2/AKL2QQGovIdFUfAhRxcnazYbEiHgxx62B0F7KJyAGQ8gtOR7sk/qo0vr/I8DvV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOxjhnjd9IQFHs5QVJqoYF+91lKnB8XW10+UFDR+9Lw=;
 b=XJ0oLUajp8wvZ6k9NlbSqc+BKTaLOMpYSq1PooJ+yFOO8tXB4sQWmB5p6gQJfi0NpAmWtU5zuHNk5sVUXQm3W2ohwSTD1MPyU+BYCIqxMUUL0WoxCwoLyQOl1oMTQRTCrX8fLoCnxny1uvNP0G66ngsSgI3TCAUqpGSM8qemYcXyq6s69N+uPjpSnk27EJPBt+JGK76eaUqFalkCOMaDk21+Yt9y4kleyMUCHu8cf6hLmBKLxrXtCy9xcjF3cB3JcRD/hHnppzoww1eYSgh0+3JsGqTisar2j2C4j8rnugelR6eKEgjRAUtenqgYKSDIOZehLj86pUliZ5/WjMtWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOxjhnjd9IQFHs5QVJqoYF+91lKnB8XW10+UFDR+9Lw=;
 b=iQELp6lSKUO8CogVdFf++m89PpoiZ+ueoIriCzrA+DWIkWQaoBQewp2hEnk5pcVxBONSGonsjgOlv51dfreIDD1Xk+bcQGZKkwciLoWB1LI8cGDSPreNffecgd2HGD45UggpF9J0X4FNLX6/IVopkasqpWzMfZ91UAHXMN9qcDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:48 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:48 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v4 0/9] Add Mule MFD support
Date: Tue, 18 Jun 2024 18:06:42 +0200
Message-Id: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKwcWYC/23OwQrCMAwG4FeRnq2kWVc3T76HeKht6grOSjuLQ
 /budiooKLnkD+RL7ixR9JTYZnFnkbJPPpxLkMsFM50+H4l7WzJDQAmluKXM++upzNGU5sZbAZW
 xBGtAwcraJZLztye525fc+TSEOD4vZDFP3xiqXywLDhxkrWWDTjl32A4dhUMMveZpTAP1aWVCz
 2Y44wer4R+GBdOtMG0tnartems6inFcWXoB1QdQQvwBqvmbxqLS2BCA+AamaXoAIoMSxD4BAAA
 =
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
X-MS-Office365-Filtering-Correlation-Id: c4d7da4f-0ff6-4909-66d1-08dc8fb11367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzB3dkhaMDNnRytockJMM1o5QWpGVktnd0d5eXBLMlpPakR5cFdMVWs2b2Ru?=
 =?utf-8?B?cnFJcFQ0U25FS1lVQTNYOFg0ZUw1dU4vcmgwQkM0bHZQYXN3VUFhcUtMYVN3?=
 =?utf-8?B?UFlZWWU0SkFYdDdSd0tuYmFmZjYzclZrYjNwSFFVVGM5a3RGb3BlUGFYY3BO?=
 =?utf-8?B?UktmVXBOVFU1N1U5dlpiSWlFSkkveTNkb3g3SHhNTy9jdFNCWVA0a0xXb3FY?=
 =?utf-8?B?cVNKYmRRdVpwZXFOME5BdzV2L1ZGYUpWcGVsSUVUclNDSVVCSmZDU2FRT2xO?=
 =?utf-8?B?aDQvdm5mSlI1bVNsbkhIaVVod2pkb3dJZmtNQzdXT1QyMXBYSXQrSVdZdjN3?=
 =?utf-8?B?cHQ1ak02VW1EUnZ1UXpQRUR1NHc1TTd5Wm10THZxVGxGc0ZnRmtwcUUrMWRP?=
 =?utf-8?B?ZVpCNkJnOXc4aFFVcUFEbEdQVzBXRXdqMDA3eU5DV3lqRWVodTZUNnBRVnN6?=
 =?utf-8?B?TUdmeWY4enVsOXM0N0NUR3BPYW9yNnVmK09RaWVpZTVPV0xJQVNTb0xSMFk3?=
 =?utf-8?B?djVaa0FCLzR2KzVIRVNFd2ZWSG9peENuYmNCMXhjNDB2VEFnVWE3MUUrcWdC?=
 =?utf-8?B?RVhXc2prbFZiaEJpc1ZQWU9jSHBSMG9YcmZhV21VZk9obzI3dGhFaVlCQ3Zj?=
 =?utf-8?B?NmMrTzVMZEp2cVJKV2U4SW9MOU1lYTdEaTBrakhCMmNzZlpMZis1RFBNN1No?=
 =?utf-8?B?bmdiU2c4c0JYcVZBWUR0WC9xdGFBWGN2NkFTb29EMUQvWWNoSXhyMzBSS3BW?=
 =?utf-8?B?V3VhdFltOXZMTnArSGZSWDZIbGppQUtRYkFqV1M5OGJiNUhXcTQxckwyNEc5?=
 =?utf-8?B?VkRNSElqM3FlV2dZNVNoNHo4cHNtenp3SitNWHdGL1VzR0ExK01aODFUOVoz?=
 =?utf-8?B?UWdTRC9Jay8zZ2U2azhicWNuQUtaK0VSWjM0R3Q4dDRGc2RkRVZkSHdyWFd5?=
 =?utf-8?B?REptZDZiUnBrVUY1dFpTelFCSStFRjJtY2VUMGF2NUxreGI0OUR3V2s2Y1hq?=
 =?utf-8?B?UUo3SFJMNHlhb211emp6S0N6NmxvaHY0ci9JY3BJL0pxZGZWZTh2Ui9KT0FN?=
 =?utf-8?B?NGtGMUVyYWR4U2hTdmcvMXU3bitLWE9LK0RKRjlFTVkrODdDbXlHbVhXblhB?=
 =?utf-8?B?QnVyekpTT2lFR015WWlxYlIrU2pLVjF2MU1yVEJKSjRhVWczWHR5SHRtcTFD?=
 =?utf-8?B?UkY5VnA1OFJEUFBpbko4OVdXTFc0MnllRUVtUnM3VHhyTVdPYkJmUVBBWEE3?=
 =?utf-8?B?ZXVFSWpXVGx1ejVjdHQ2aExSS2x0VS9hb2N1Y1ZXaHUvSlp6MDhnNWdRVFJV?=
 =?utf-8?B?Y2tMcG1wSVV5Zmd4Y2JBa2FwNitlVWRTemdvR1lib3oyTzJnSC81aklic25D?=
 =?utf-8?B?U2h6Mmd3VDRoWmpsQkd4UHlpUWd1MWxBb0ljUGJDUWwvTXh5SHgvWDB1azR2?=
 =?utf-8?B?b2cyUkpiWTNZK2tUa2MxcTUvNmxFdE5UUWdhRVBGV3o4bm1iTkxNc2JLTkVs?=
 =?utf-8?B?bVI5MS9pWDJvSzJDaUlpYkwyT2xraWRGNEV4UEIzbytHUlZRcUtkam9tSk1J?=
 =?utf-8?B?S3FscndjcEZ4dnhIZndhMXR5VzVrZkFTRFB2L2RaYll2QVZJQjZpM2VhRGhh?=
 =?utf-8?B?VENvYXY4OW94aFFaZExyUDFwRVFEMEdHYks1anZSVG1ITlRjL1VqRm84Mktx?=
 =?utf-8?B?eGJ5cy9qM0RrYUxiMVlielRJcGVOa21BajBPbnkwazd6LzBmdk9kOFJFanJr?=
 =?utf-8?B?b3gvU0poV1IyWmYvb0JadFlDczlJT0tDSWhzYlR2VnRmak9vODBKTFV4OEsz?=
 =?utf-8?B?S2xVVFFYdmFiTC9ua3AvZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eERhY25helpNY1M1Q2I2ODRMT3RTb0o2TlgwMGRTVklGSGhuN1pzeGRHMjkx?=
 =?utf-8?B?TVZsMkd4T2VUQm1ialk3OTB4MnpubFVnNUlIQkh6NWJvRW95SUpybXNJczhs?=
 =?utf-8?B?QkNFZC9HVFBadjU0anpPRUJWaWlDa0oxSGIwak1YK3hQNkJkTk5ndHc1UHVk?=
 =?utf-8?B?S2ZrZjZldDZYbVNraEdUMGY2NlVhTjRSWGFabUt5ckpKUGpQYWxxcS9NOTY0?=
 =?utf-8?B?L0tsV09xUlg3bjZCT0o4c0QvUEVCZnRwWjNrMFFOYkViMXZGWjd5aitTTitx?=
 =?utf-8?B?c01aMWNiNlBiM1hJaENNaWczZTZ4ZlBGdVZwQ0lJOFpnQ05CTHNzcyt5RTNk?=
 =?utf-8?B?QzFGRU9uNTRrVkRBQW14VTk4aWIzUDVweWRoUTNNMTAzVHRkQmhiRS9xV0Ju?=
 =?utf-8?B?WlM0TDZQMHNtQm1PRTMwOUN0c1B5bGRlSkpwK0c3eEdwV0M1N3BaYS95YVd0?=
 =?utf-8?B?MlFZUkxwZmhSVEhHY3ZaaE12cE5lcFJaakJVQjFmQUphNzRKYlBCZDhiY2sx?=
 =?utf-8?B?aHRjRFF1WnpSWmdGT0kxTXhiT3hUd2pCRzFKdnUzUUlLS1NQYzhtTklLRUto?=
 =?utf-8?B?bVRtVlQ0eXZRNGxvUWxBR2hBdUdCaTBsM1VqejR1eUhlYkU5Uk14VGFUcGZj?=
 =?utf-8?B?Vzh4OXpkTGpRMHNWTE5DREhuSkx3c0dWYTlSTmo3L2ttcmtCQ09LaUd4d1Jq?=
 =?utf-8?B?a1hIekZNSXR3bW14YTlJbTBEa21sSGl6VDU1dWR4NzZrSm5rZU1nS25nUHhZ?=
 =?utf-8?B?UDB0MDNRRGZXby9rMkVKSFFxT2VTVHppMzlyUnF5NlFWUWpYYVlORDBDM3Nu?=
 =?utf-8?B?UTFsNnl1bS9yZEpycGpnUENvRFRTdGVqMnhhck91ZUl3cUFUVXNmdGFEdlpx?=
 =?utf-8?B?TWFPM1IzYnMxMzFLbVB5YUNGZHZZTlVRZHNHOUVYeUgxM0d2b1F2a2dUTmk5?=
 =?utf-8?B?cGdCQkpKVnVUdnZaa3NzbmFjRHFWaGJScE4wbkZzcHRmbU9uMVBEODVzcC90?=
 =?utf-8?B?U05Td25QSWN3T3ZmMmw1ZDhSalZOaWNPdzB6WlhrWDNwMjAyWmxjMmNZS1A5?=
 =?utf-8?B?dTVMQitnaEU4aWI0SUU2cFZ5S0NqOWJFWXZUN1ZUUndwUWd0ZUpxc2lKT09Y?=
 =?utf-8?B?MVJlZVNSd2ppNzJFdzFSRHpMcmVVOGxPelVsYTEvUUUxWlI3azJxOUNMOFlG?=
 =?utf-8?B?OXJFOVNEN1BscUExc01yN0h3bTA2TXgvZkF5NmozTXplZWdIMTZ2RVc0TlVS?=
 =?utf-8?B?WDU3bzBuMS9KcEZTUVc0azFQUmZIazU1Qnhyd0p6VjR5NUdtc2RxYVJVa1hO?=
 =?utf-8?B?Ymg2SkJ3SjFtckllNThtWDNUU05QNjZzSFBmRUlHck9wNnFlak1yNkEzblhH?=
 =?utf-8?B?VzVUMHB6N0FMRktLaHl1akY3VndFL3YyeEVMUGJWbUtTaTVraWVDT0t4c3F1?=
 =?utf-8?B?d0gxTHh6S2tZU2xrcUl3VHRUUGVBSy9uWExrWmhjUUxwaGtlMVdDc0l6cFE2?=
 =?utf-8?B?Z0hGZm1SMUNlNGhTQitSOSt6YXJqTWhFWlV6VGJXL3hIYkZpUjlKRmwwVThX?=
 =?utf-8?B?cEZ2a3RnNEU5blJJWGlkbWFpLzJEZ090L2t5V3NDUmxaTllJTXFQZjAxeitX?=
 =?utf-8?B?V1VGZzVrV0NidUcxdnZPRWRFaHF4TExXUXJ2QzZiMmpFbExDL3ZEQzhiNGxV?=
 =?utf-8?B?ZFI5N0NsWkg0SnpKeFdjcldkRm4rNmFOSnJUbFdPaVA1R1lGVXR0QVNpanMx?=
 =?utf-8?B?OGxnT2NkS3VtSXB0dFJlQlhzZU9leHR4ZDlHUkZCditFTzU0eW9NV0FpWU9B?=
 =?utf-8?B?RWtBazVNQU92MGMxQmtaaExNZTRUNEZTV21XNHlyMHh2OGVaSW5kcDQ5YnJQ?=
 =?utf-8?B?b251NkNlR3BlQkxvRlB2SGJmM1ZxSFN2UzBiRVJ6a3VWTXhFVGdDSDNFelhi?=
 =?utf-8?B?UDJhVld4UzUxVVBJN25SNFhXcWJZNWFQS21xTEpua1VKcmZWV3A2dm5UN0FD?=
 =?utf-8?B?R3F1ZEE0K2puN2xxaGxMc1F1V1RUR08zSHFBc0FXRm5xdmlsQlFPbmN1MnNl?=
 =?utf-8?B?U1BHUVlQMlZ5NnpIUjhLUUpwZlJnOTZrYUJGM2grV3dlWFRZdWNvVG55ZVZi?=
 =?utf-8?B?Qkt4SThjWXJyR1I0TVJhM29pYXNTVVBqVlhOUXNPWEQ3SllYMktuRGVBYzFp?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d7da4f-0ff6-4909-66d1-08dc8fb11367
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:47.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOvqBJokGjc02lRiy4RNo1d2+4bCokO6p2Wm+dSncNHFz4JGs5kBdE1OGaplJgDW8xAVu4EcbCt5QiYN8fvYvNm19UjfyELcniHGrkNM8BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Mule is an MCU that emulates a set of I2C devices which are reachable
through an I2C-mux.

The mux and amc6821 combined make the Mule multi-function device (@0x18)

The devices on the mux can be selected by writing the appropriate
device number to an I2C config register (0xff) that is not used by
amc6821 logic.

The selected device on the mux can be accessed for reading and writing
at I2C address 0x6f.

      +--------+----------------+------------------------------+
      |  Mule         (MFD)                                    |
 0x18 |        +----------------+                              |
--------+----->|    amc6821     |                              |
      | |      +----------------+                              |
      | +----->| Mux config reg |-----+                        |
      |        +----------------+     |                        |
      |                               V__          +---------+ |
      |                              |   \-------->| isl1208 | |
      |                              |   |         +---------+ |
 0x6f |                              | M |-------->| dev #1  | |
------------------------------------>| U |         +---------+ |
      |                              | X |-------->| dev #2  | |
      |                              |   |         +---------+ |
      |                              |   /-------->| dev #3  | |
      |                              |__/          +---------+ |
      +--------------------------------------------------------+

This patch-series adds support for the Mule MFD and I2C multiplexer
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v4:
- Drop the previously added i2c adapter quirks
- Add platform driver probe to amc6821.
- Change mule-i2c-mux driver to a platform driver
- Add dev_probe_err in mule-i2c-mux driver
- Add support for tsd,mule in simple-mfd-i2c
- Add tsd,mule mfd to supported dts

- Link to v3: https://lore.kernel.org/r/20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de

Changes in v3:
- Change "i2c" in comments/commit-logs to "I2C"
- Fix long line-length
- Warn when "share_addr_with_children" is set and the Mux is not an I2C device
- Fix/stop propagating "I2C_AQ_SKIP_ADDR_CHECK" flag if "share_addr_with_children"
  is not set.
- Fix "old_fw" variable is used to indicate the reversed meaning.

- Link to v2: https://lore.kernel.org/r/20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de

Changes in v2:
- Add i2c-adapter quirks to skip checking for conflict between the mux core
  and a child device address.
- Rename dt-binding to "tsd,mule-i2c-mux.yaml"
- Add Mule description to kconfig
- Fix indentation
- Move device table after probe

- Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com

---
Farouk Bouabid (9):
      hwmon: (amc6821) add platform driver probe
      hwmon: (amc6821) dev_err using amc6821 device struct
      dt-bindings: mfd: add support for mule
      i2c: muxes: add support for mule i2c multiplexer
      mfd: simple-mfd-i2c: Add support for tsd,mule
      arm64: dts: rockchip: add mule mfd (0x18) on rk3588-jaguar
      arm64: dts: rockchip: add mule mfd (0x18) on rk3399-puma
      arm64: dts: rockchip: add mule mfd (0x18) on rk3588-tiger
      arm64: dts: rockchip: add mule mfd (0x18) on px30-ringneck

 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  48 +++++++
 .../devicetree/bindings/mfd/tsd,mule.yaml          |  82 +++++++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  33 ++++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  33 ++++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  34 ++++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  32 ++++-
 drivers/hwmon/amc6821.c                            |  88 +++++++-----
 drivers/i2c/muxes/Kconfig                          |  17 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 151 +++++++++++++++++++++
 drivers/mfd/simple-mfd-i2c.c                       |   1 +
 11 files changed, 461 insertions(+), 59 deletions(-)
---
base-commit: 915c5c8d4bc3c72020b9526cb3cbbd8e14318fc4
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


