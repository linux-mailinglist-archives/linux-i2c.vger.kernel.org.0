Return-Path: <linux-i2c+bounces-3230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F188B3D20
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12EDE1C22A23
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82ED159581;
	Fri, 26 Apr 2024 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="jU5zA7w1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16D156864;
	Fri, 26 Apr 2024 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150232; cv=fail; b=bum7V0WdoPqQc6lGDaC3cNy4GlseeHd0cQCu0jNt9+LzUF6OjAwRtFxzeAxzl9tWvcduvhfnsuiWsAtFDqBI1Ixmoq1hEZEa9OnVUklNamYFIPfKBHNNNvX5tbChM1NW9cgFeLH6MlyAs2XZVZ/qXfrKz+K03Vh0QD7GJKIAkTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150232; c=relaxed/simple;
	bh=UPz3MrjtfQd0nueGsYTPxR9knUuvbgyyjD++GFC1t2g=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=o/f1VdamwFAqaEBMxWqBfL58DkU9MnZhhETo6a5WdZP99F2eE2bYDIKVR1q9LWB8O+BM91I1VbFdyZBzfvvc8ED/SiRtHfurWtiqkYRLyxkCWfWlXWs+rbmu0uLWkKHiCbz7RYnyoQC399HfQJhwL5nJXuic6ZLE6IYBx6ka4Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=jU5zA7w1; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXzgGfSv2+Jz8VdUhPP2WoqVIsz0KLxCjsn4BqE3rK6Rq72nFu55BpUEx3b3be8gB3FUEWWb3a+E86AFvr72BtHUt6/tJDTOdCzDTA/Er2IFAkYbQPPQ9u0sIsGO2rB+Y45IxP0DiGZuE01y8c/xGgi7dgjk+CsLPkouVNzEfrb2Z4Zp0UjgKtAP71p42XHfZdWTqios2+Mqkniotmu8r6QthU6E3hxHE176j+QVBO2UHI3ULpsFcFnivrCcqsdC98ADugNHaHMxi5WIjmPhFcV5LX6HK5IcaqjdtojMOsWhMWntsMls4aUuotd8U0UsBqHd3dKxER6i2EnV2DJQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYBRW4r+i9vMVde6VQIjVU7PiC+AYrrmMIzyCRy8XdE=;
 b=OrnyCoCt9gIP6OJQrBQsV2SMeucAdZqI5/naEmLGDrq1f38+6E7Ua38NTx5Mub85+8iHHXtXi6YF2BtDJrGJOi+bbzAZw4zd6mVdwqTW1dBO/6jVIOd1rROIWY53QIN6TOzKDqeoBe6gMRbOCPDqxl1Tvf9nMrG2xvAHXaWdN3uMuwX5rVbZLI6VFOp00pg4d6qohHr4RCX7HBJPGn/GjH7rfg5Gfdn0No/1Pj8ouhGGaeO1IQER+3SuoQA/iv/lPCA7Cxky/i4Au1uBBnSOjt3/E1nJRZAUkuBSDyN1RKraPnXLOn890Q6inrPXygpTQwNhrj7EaPCrupzAQi+CFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYBRW4r+i9vMVde6VQIjVU7PiC+AYrrmMIzyCRy8XdE=;
 b=jU5zA7w16R6UF2LT+fAOOUS6nHb94xQmbS/tmGqWEJda6Id30puJuhxyAQCWyM2c5bUDZ4yB8Me2k5qsuoYZAEfSncddRvbHw4ezzqzPUnJmDudxKimW2yHODRlDcqiNSXP2V/C8n6hWi/9O2ehI88r5XJRFyRma44tAVpeD+acY7ya1pBIEFhkryRwWpWl+HgzI0CJMKUH5fyTA9dXtxxmSBg0G/nM78nGu61CtwzuxK4FsAeCK74A0itCq7fQl3Si/rCXjwTIqof6wX8tmfPjmpP2EE6EC8ieHB/qGVpp/VbKEE06aVjoZYUEmD51XiOtlzSJnckmk9zzcQhtKfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:23 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:23 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Subject: [PATCH 0/7] Add Mule I2C multiplexer support
Date: Fri, 26 Apr 2024 18:49:31 +0200
Message-Id: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvbK2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDINRNSS3TzS3NAYobJQMZFbqWhgbGySmpBuYGRoZKQG0FRalpmRVgI6N
 ja2sBX1N6rmIAAAA=
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b96f515-648e-4859-7057-08dc6610f6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3AwOTUxOWVsU2FJN3FKM0RoRmVzUWZYZVNxSXQvMXpEWU1sWkxrTTVYWVBw?=
 =?utf-8?B?bWpNNmhFcTlPU2dzMlNhQ3pRRG80dHV0SlQ5cnF0cGwxaW1QVXZkWVFNY3dq?=
 =?utf-8?B?d0tiTEdSZjdPL2lCV0MwVWNsVTl6bU5UNi9yYXFpR3F3cEZQQnRBdHpXNzNO?=
 =?utf-8?B?dmV6elkxTWxYbDFFaXJiQXdHU25qTXhtTGtjdTViVmtocm1wODhvY09wbTlF?=
 =?utf-8?B?MmMzaU1PMjBvU0xhajdRL2N1V2F3NmQybzhuakFnVitZckNnS0d2UUh2WW9k?=
 =?utf-8?B?T0dYZWxYTDBWTktYUkYxOTNGV3BjYkl1Zmo3RU9NR1kwOGtpcXVHWm51M3Qw?=
 =?utf-8?B?NCtYRVUydEJMemdxa2JORE8xMlFWbHZtQS8yZ2xtUFFQV0V2clJQTk1YaXJE?=
 =?utf-8?B?M0RqSjdLRzBFV3FldEl1NEQ0R2hwRUtqQ0E3YVlYekk0MHlmR3RydnNWdGZV?=
 =?utf-8?B?MElTaXNTZTdic1NORFY4eXdnRk1KMDVVZDhCUkQ0N1RtSkRscDhrWVA1bmxV?=
 =?utf-8?B?NTBsYWZHK1Q1dDNDMEV0WHp0Unh6Z2R5K3QwWTZPd01xNTZHdUZLaWM5Q2dZ?=
 =?utf-8?B?TWh2aXlGaXgvNkUwVk9lL3NiSDdXeUkwT3VYRGg5blIvVld4bnR5Ly9ZYXBI?=
 =?utf-8?B?REZTY2MyVGsyQWVHaHFpSXAwZmVndkszeThCcjM5OTBVNTR6N2h2YmR5dm5l?=
 =?utf-8?B?WXJibWJRWHJNSDJRZ2d3SXlJZGJOVVFpSzMrc3U2SjRRTU1aNmlLdTRhYThj?=
 =?utf-8?B?VklMVkZFamU1a2JJdE5FM0w1NE55N2YyU2FQV1FvcTRsL1lqUzh4alpRR3Bl?=
 =?utf-8?B?Rm13Tk5yUGZtc3U3clg3VkkyYjhJZ0dwQ2lSdzdFNHRTczB0Smdib3VBbThL?=
 =?utf-8?B?ay9WQUFVUWJqQkY1TUpmUGs1UmlDMlhYRzQrbDdVbEQwc3lLVCtJOVVzTC9B?=
 =?utf-8?B?VXJpOGtPRm1ady80WnJhUm0yam1wOHNrWGFLSzh6S0kxQmc4LzRmb0pPUU02?=
 =?utf-8?B?K1RCMy81Z2JISDduek5HcUFrRkdBTTdmVVcyL2tyVEhpbThwK2RUZ3E1U2JS?=
 =?utf-8?B?bllEOUhCZUhMeG12VVdndXhKNnNKVjByc29aU1FqemJlemZUUkhUcjZPeHVC?=
 =?utf-8?B?S0dXSTlMdFppeERZSGVuTlZRQitwbHg1UWIyeng1cVZtZFJqdHlsMWZwblR6?=
 =?utf-8?B?WDNhVWpHVVI2RXBXSmw4K0J6WDQ5eThFUWRNL1lsc01zczVOSjh3cityNEpU?=
 =?utf-8?B?WFJmQk5hZnBqNlRQQkpOd1pyalkyQWRPZzBMTnpwUngybGNLSGtRM01jOWha?=
 =?utf-8?B?djRmbmtQdHhVT1NCN1JPQzhKNlZhYk1qWjA5cG1BZGIvQkVMejRTSUMrMWF3?=
 =?utf-8?B?VG4vbmhFVExDeUZIQ21CRHpmMHMrL1Q4MHJpZEdobHdYTmJ1Nk96bEFhMm9V?=
 =?utf-8?B?OGFmYzNnbVRrTXNWWFA5T2l1eXY2TVdvRXFCZ0JkT3ZPblhSNk96RU1Ndm1i?=
 =?utf-8?B?clZNclZNdE9Sb25CMHZjdzNLS2h0NmExVmFMUE5YSnNDSklNTEVxQXlDZGVu?=
 =?utf-8?B?RmRCVTJpOExtQndXMGFJNXlrL01UMTRkQkMraElHc1hDU0pHcFJpVDM2YUpu?=
 =?utf-8?B?UzlHSFpIZFhjNHBMVW5IeHBaVjNFWEE0NUlJRnErOTJMU1ZTaEdGUXFGNy9n?=
 =?utf-8?B?dEhTVmRNeXdxRndqN1VMeXdnVTlLZXVrMTVwTGpLc3RhdWZvTVhkOWl5OWFo?=
 =?utf-8?B?SjlpZ2RadnpoS05lRFJ1enZlb2VwNWZWdGVzcGs2VlFldHd2bFlYMHJ3TTJV?=
 =?utf-8?B?ek9ZQ0o5SmgxNGI5cStrQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1B4R3hqMHNGV2Q2bXhQQUpyOVBhbTI2UUVSOHh1YUdZSXdBNzI0UkhmZ0Vo?=
 =?utf-8?B?THFHZ2J6L2k2QjFMckJqczZ2Q0lEMTVkN1N2NG9oV0ZXbTkrQXlqWjBSWCtq?=
 =?utf-8?B?VFhBUXYyNVRXeXJrTGVjRXpyRlJDWHN2NjlBK3F1b0VZZjFvME9kcU9iaTE1?=
 =?utf-8?B?akRiVmVxNm1CL1lkMHpTUEhSemJma2lTR1QvbW9UMmU3YnBValE3bnIrb3BH?=
 =?utf-8?B?eGdkNk9ZMWFMQXF2L3lUeHVrdTVvdnViK0FBaGNpbk1KcTQvLzIyc0JiMFZr?=
 =?utf-8?B?cnVJV1BObUYzMWw0UWhmSHRYcmR6YUxLcGZXc3Y2L1NoY3Y3aGVXYXphUXNQ?=
 =?utf-8?B?QjZvUVZXeERXalEwSkhybzN1UnVrY2dyTTNZS055YWtERnNzSklJcWtHQUZX?=
 =?utf-8?B?dXFLaUxwaTAxaVpER05ZL2J3L3lQU1NFOUFIMjNuTCtyQ1Vka0VMZEJaeXg4?=
 =?utf-8?B?TTdENFhRR0xkUmdyemY0SUx6RkY4NkMyQWlSbmJlUmxIam9OZVNDOFkvRytQ?=
 =?utf-8?B?U3VNL1dqc3o4ckNNNUo2QTlVa01tNDZuYjhLblEvNE1kWmdKblRBMDgrd2FD?=
 =?utf-8?B?S3BIVjR4RDFheVpRY3BDZ21RQW44N2hBRXRGbFBzYkJLRTBkdGZMeW9lVzFp?=
 =?utf-8?B?S3VmMzI4cFY2b0FId1BjWXVicmZ6T0p4UFJQQm5YUHVLWWVYREhyYXVLdXMx?=
 =?utf-8?B?b3lnQzg2amcyL0ZvelJnaDltaTdXNjJrY3BNSFJzOXVDL2hYYUdIZXVsT3RD?=
 =?utf-8?B?N0JSZDJqRXVjaFhYUFNUcVpITW5kUWRub05JWExLVlZzbkRRY0pBRlRJbGhq?=
 =?utf-8?B?Vlp5UkFBeTN1NlV6Y0srYW0yYXc4d2ZUSUl0VmdXVnJEZlNmdGFKRzBIcXpC?=
 =?utf-8?B?K2p1YlJNeGFXYUlZUzRudFBZeWRNQ0hTWGlDVjhQOEV3d28yUDdvNzBEVDVJ?=
 =?utf-8?B?NzRYODBaNjgyY3VnTkR1ZGZqSUpmODFOTldtbGNWSW91NnRUVDllQUgrWWdu?=
 =?utf-8?B?dE5mRlhMSlYwTnJGRG9zK2o3Tld2aWRzeHE4ZE9HQVNKbEFoVk11eGxjSExK?=
 =?utf-8?B?Q012RjVhYnQvd3ZkUzlMV2EycGNpeS9KMXJJN3JBMWVjTDFySGhsZXJjZHY3?=
 =?utf-8?B?SkwwZnZMNURiMWx3K3krL2pVcXhjVjFLV1FSRFpsMitHY2NBUCtlb0FCNXpN?=
 =?utf-8?B?NHFCTEw3WExrVytGemMyN3gxbThyMEtzb2VtbURFdGRwZHNINjMxNWhoOW9z?=
 =?utf-8?B?U2RuRHJIVkdtdWRJZDhtWTlUOUJ6enlCV0xwODZ1ZlF6VVhsVXlHZW1JRFd3?=
 =?utf-8?B?MEc4MWU3K1NsNWpIVzB2bzJ0aXJyUFlJYlRBRFZwL3hXcVF3SmpxRTJORzdB?=
 =?utf-8?B?b09nZkNPQVdWWUt6cXhhMHNmdG5ZL0htQjB5UnZvcTU1dGRYTUlpR3ZGWGV3?=
 =?utf-8?B?c0NFTFAvWE5makZuL0c4YkhyTDJHRjhHTXdPK0dWckxhRDFPVXBtQTNFczk0?=
 =?utf-8?B?WnV6eGl5ZTQvYUZ4d1Yyb3lhVjJnVVpLWnBKUU9jYkx0M2lqbFVYN2pnNzBU?=
 =?utf-8?B?Sk9Ya1gvTWlvdGQ0ejdpNDI4K0ozSFhQK0Z3aW56Nm90UkZ6UXVKQ0o5azJx?=
 =?utf-8?B?WWtFT251TEhpUWgxbTZNRkd5VUZCRXIydG9GSGczWkdHL3pUZDlCbW5VbTVv?=
 =?utf-8?B?VkRoRFBtQVlOTUxLdmlUbE93cWQzbXVKL0p2NUQ5VWlVSDRXK1JxK2hSQWhm?=
 =?utf-8?B?U2hSUi9uM2VOY2dHNXNIU1grbDMzMU5qellWTTl4VVYyZWNZc2dUYjd3eTFu?=
 =?utf-8?B?QlpUbUFxcTBYb2RmUFgyTXdGWmhzTGhFa3N1cUpmaUh6bTk3OWRxUWZSdm02?=
 =?utf-8?B?WndKYXRONFF1VkRpRW1adktZMi9YTiswaW1ZN3lybGQzKzBueFBMREZCMXl1?=
 =?utf-8?B?aUdjVkFPZ2E2NDJ4TjlvcGkwSGhKUm0yc1VpSmdueWVpQU44aStzOVZoRm9q?=
 =?utf-8?B?dVowWklZbXhnZHliMGcxWHVQb1RKZDRCc0VIL3VHM3FKN0lSK014WnArMDZl?=
 =?utf-8?B?cVZOME9Kd29rSjBURXhHTktQakFqT2hMcWM5Y2dCQmw4cDEwVGYzOHFQaGF3?=
 =?utf-8?B?Yk8yU2tWYXlRTktBSXdCc1lvakVzVE9FNWx6RU4wWDNhQno5cU0zN3NmT3N1?=
 =?utf-8?Q?Vc2U/sUvb6GJLGXSKlgeGBk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b96f515-648e-4859-7057-08dc6610f6de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:23.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvvqemZ8njvqR1TvyLgM1KjNznkMp1IBBFXtdQux6Rm20IGUH59nXNtpXEsjXEtF0K3TyW4AaCKAVHzA3RgY7Lc5WImy/FaCdoOLLKqYOBXNhYjH34sGGdieonfZ5Ntx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Mule is an mcu that emulates a set of i2c devices which are reacheable
through an i2c-mux.

The emulated devices share a single i2c address with the mux itself where
the requested register is what determines which logic is executed (mux or
device):

1- The devices on the mux can be selected (mux function) by writing the
appropriate device number to an i2c config register (0xff) that is not
used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

      +-------------------------------------------------------+
      |  Mule                                                 |
      |        +---------------+                              |
    ----+-(1)->|Config register|-----+                        |
      | |      +---------------+     |                        |
      | |                            V_                       |
      | |                            |  \          +--------+ |
      | |                            |   \-------->| dev #0 | |
      | |                            |   |         +--------+ |
      | |                            | M |-------->| dev #1 | |
      | +-----------(2)------------->| U |         +--------+ |
      |                              | X |-------->| dev #2 | |
      |                              |   |         +--------+ |
      |                              |   /-------->| dev #3 | |
      |                              |__/          +--------+ |
      +-------------------------------------------------------+

The current i2c-mux implementation does not allow the mux to share the i2c
address of a child device. As a workaround, when creating each i2c child
adapter we do not assign the parent adapter to avoid the address-match with
the mux.

This patch-series adds support for this multiplexer. Mule is integrated
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
Farouk Bouabid (7):
      i2c: mux: add the ability to share mux-address with child nodes
      dt-bindings: i2c: mux: mule: add dt-bindings for mule i2c multiplexer
      i2c: muxes: add support for mule i2c multiplexer
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3399-puma
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-tiger
      arm64: dts: rockchip: add mule i2c mux (0x18) on px30-ringneck
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-jaguar

 .../devicetree/bindings/i2c/i2c-mux-mule.yaml      |  80 +++++++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  19 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  19 ++-
 drivers/i2c/i2c-mux.c                              |  10 +-
 drivers/i2c/muxes/Kconfig                          |  11 ++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
 include/linux/i2c-mux.h                            |   1 +
 10 files changed, 327 insertions(+), 11 deletions(-)
---
base-commit: c85af715cac0a951eea97393378e84bb49384734
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@theobroma-systems.com>


