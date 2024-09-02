Return-Path: <linux-i2c+bounces-6002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C23968C2C
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D306283BA4
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A801C62B7;
	Mon,  2 Sep 2024 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="eAiQEdNH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91F1AB6DE;
	Mon,  2 Sep 2024 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295126; cv=fail; b=lePJKddzrdB9uc4RincziGf+ce6A8ybNtEAnHsmBQ6DC5dowVOusWx1CMkGBW/U6MmbtTNdzNUpfroyNUBkaAWApCxNFPzpYzO0BZGpd02LNegsmOZod0PDipVVtMzjDuzj6zCuDSAQ2fUkRebf9zDpt9Tw00HdXVAxYpookq+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295126; c=relaxed/simple;
	bh=GGGzzx4ZW0A16uCMEUJBkPezYZy6d2rraWET88P/LQo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RSkTEmJ/640ufjUloJsBZf0oUxIdCjVWL9u025213Ti0MvIhotd7mjnXkrkAyNvba4lFcPgJgkWvUG+3qapBAhxPai/G8TIG3NiXxLJaVxk6WE84ikbM6jVTk0fwJXRr4bIEJ2+WSNVVJ95FxRQJtyLoc6m+JyM7OcmBDXMlbyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=eAiQEdNH; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntW+LTJXvrzpfjiCkSuVlnGV7d7sO7SAGAdNGeWV923UqwBQZljDPdLZ8HE+p80eVB29n3n2qA+TeSWLbCdc8c08WIMSewdRrLDASXfNIfm038HaHvujnANVbDkyPQxur7unqKpvEOOj/W6JNOHlduHYh+DXqvNcEbzglgRp1OkVUZ6aucN61rnN/mzbnI1lp8VY3cQJe65nYPaocwno0fzVP8lzNFe/0HLDHt34uk7xVNV+1lMSrxROdo0TnYTtHOoyKo5DQYv59rNl6ApMgTrYxW1yA0IoWOn8h70I5A/bb8bHaBGlVTrKgG0r9WsDCK2zjJf2AWuqeWABjUvSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+d8kkbjE30ReXzbzXlDkTY6YH4knVAS4Xf0qwtzQOI=;
 b=Hyv/aNhZOExo/Bqd9L7OFjhcwWN5Ws9kcIl4Crb37lnKJsB2+hGIz5lDPINhFbsd8QgjTHNfvEsd32nRD67dteyna5ed5ekmALMMXCflzm8295cNXMdyvZG9dUw5/EFGegxM2689AqgtJA8i8PgNUjaIXxOKpIBUP5hKUCAttirDs53qsUpz/+oy6gIUx0QzZk0me8O1drigQ5l90U7uuA0JGLAZcSU6aC4CsN15nC1VtkxccFgp7SUC3CTiw56JoynPW8QqFY4klaJx2YVeOniCERl1BtS5OF1nwf8lfCVn7i8moNndWDjzJxa1QksKBbmPirLJG8/eAGh7lRNSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+d8kkbjE30ReXzbzXlDkTY6YH4knVAS4Xf0qwtzQOI=;
 b=eAiQEdNHkAo3+WyhNTrx4mLv1WazR8uXHxzO/pd8jtCNMY6TcTGh/QDxeAd8R52XGVH7/xnxoSyk+5ROaFaPskzE0S1WHJeLB//PVwIrLaejJ97YaKeZVCtCojPo1r7L19K0sOx8fmiNqcqswHMKq2i6SYuabc1JvMwM4eMkQ2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:35 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:35 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:16 +0200
Subject: [PATCH v7 3/8] dt-bindings: hwmon: add support for ti,amc6821
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-3-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ea14d0-5290-4bfc-ee77-08dccb6db09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emVFK3ZRVENCZUl5MkpEY1FZaGRTbTNMenJkeEE1cmhkUitCNTZ3a2U5RENx?=
 =?utf-8?B?dzc4YkxGcTd0b01xZElwUzNMdmRQZUFFVmlaV1ROR1B1NjhVS0ZTMWJRazJv?=
 =?utf-8?B?clVjaGxLR0ZwOUJySmtoZVZVQU1sK2l4enowWU9JNGFBR0NSYlRSQmhRR0hE?=
 =?utf-8?B?L2dkZDlSSXZvakFTVmlnbVZlazBHb0QxYW9ZN2lSbUhzVUtTMWM1MlNnaWFQ?=
 =?utf-8?B?ZFRvOUs2dUNwTE4wV3VibkRDQmVSbDNqVkEvSzlLN1N6d1AyMndZVHMrNjRp?=
 =?utf-8?B?M1psZEV5a3oxV3owTjFJTFFhTmJsSW5lcFV2VzFmVFJpUFc2YXpPallOeUsx?=
 =?utf-8?B?SnlZTEZRZHJ0NS9vK2VzZ01wNGJlS3B3SzZLeVdCaDhMR2hLcXFxU3JERnVV?=
 =?utf-8?B?SHVXbjVIaWRiYUJrTGFXcCt2ZUdIYVVJMWdxcEVaUHJlREVTUTFhOWk5dEZW?=
 =?utf-8?B?OUU0RlJ5aXpBWjdDcW1oSks2dGZCTXlva2dxL1UyTHA2amVuNjBvS0NCbkJ1?=
 =?utf-8?B?VDBDOStFZVEyNDU2T0FrendSSnh4SnVMT2xKMkhhdUdWbE11dUQwb2NhKzk4?=
 =?utf-8?B?a3RLUk5zdm9qMW14bzUrVXdGU0hMK3NtUUw3cWpKYlo0TVV2YjQrSmFJZ29F?=
 =?utf-8?B?QlkwYjdXYjVQcUZlNDlEdEhaNk5SaXNuTWYxM3hjNkQ5cStDM3Q4WE9ReXAr?=
 =?utf-8?B?WWxWQ2NVRHBZQ1FVMllzS0lWR0JwNG90aVF0MkRWcUxVdHFuU1VaMDRXeGxj?=
 =?utf-8?B?eGpqdm9Ed1I0SzlNOEhraGNnM2JPQXFtQThvTkIxUllGZ2pxUlNUREVHUUhM?=
 =?utf-8?B?VDNzV29rTUJYYjVJVUFUSXRpOUxZMmE3MlZtQnM5NlpkN1JDTHpmdzFGbGlz?=
 =?utf-8?B?TkVUM1BiSUpkQlpsS0FCZFl0K0tFc2FMSjVVWWZtc1lnaWZSSXBEMjV5RWYv?=
 =?utf-8?B?bnVNSkU3MzJvc2xPNjgzb2VSTHNwUUdoNmdST2RKWGw4SGN3bDBsMXNIcDZZ?=
 =?utf-8?B?NmRIZG1MaStxZndkYzRkUkd3ZnlqbTZFYjNrcWp0eCtlTjk3RnBtMVBFZWNw?=
 =?utf-8?B?WTlNV1JBcUxaTUM5V08yQWs3VmxQQUpSZzh4bUdCQnNEbnZZV2xVeDZKZ0dP?=
 =?utf-8?B?eFVvQ1JXWXU5dVViUkpaekw2WXc0a1I4WmdubUlnUXVzV29CdkVxS1E4c2ZQ?=
 =?utf-8?B?ZVhXRTIxRUdWczhZKzRmTFlsNDdoNkxRdW1idjQrNldKdXZyTTgxcWU5VmQ1?=
 =?utf-8?B?dGl3TWhvKzIyYXQvWWJwS0FmWjhkNlBGSEE5V3l2UEpMbHZ2U0FqWFJxUEdI?=
 =?utf-8?B?bWZ2VjZvSk4yQTJxbDJzODNUR0o3MWJldHRXSnZ3c1VOSWZJZzQycG5VOHEr?=
 =?utf-8?B?aDdpd3R4eEg0RnJVNVpFWXFNTWovVHBtelJoRTV3aGZ1MGpSR3ZkUTN2anU4?=
 =?utf-8?B?dFZJMTF5ejl3L0w5SzZydWtidUdLeVFkZmpObGsycEI4eUJOdVJvRFc5azFp?=
 =?utf-8?B?bWd2Y1BPS2taYjYvUE1OZ0lTT0MySm9pTGUrSCtoN3k3WEo3ZytLbW9hRFlE?=
 =?utf-8?B?QlcyaXlseWRjRWZTZWpRMHR5bWNHM1FwUUlsUGpyVlRJY2RWUkJWRVBmMTZ4?=
 =?utf-8?B?UHFEVzFmZ0txaWl4VkpnY1lFbjNNRUdjeEFid1l0VEZnL3NJbS8xeHQ4L2E5?=
 =?utf-8?B?WENrRHV1dWtDZnYrWlNZY0R1RWo0UkFiT3piTEVRc1hDVlFMTTVrRFltMzhC?=
 =?utf-8?B?Y3FYc1lkNXZTRXFWQktQRDJLbzBNS0pPNStUcEp3d3VqbS8vQXVMMFlsZXpJ?=
 =?utf-8?B?MUJzcjFlQW5lOEZWMU54ajNNNGk2b0FLaVplUUdncXZJa2toTFN6eG5JSW1Y?=
 =?utf-8?Q?DzQ415NcJGssj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnZNdXo1STlpcEpIYVlJZTd6SVNhMFJrcmpXamp3QmorRkxPWmw3dmVBMVho?=
 =?utf-8?B?clJISWp6Mkp5S0xleGJ4dFFhaGdLdHo5VlV6S1BjSzZsN09lQ3AzNktkcWoz?=
 =?utf-8?B?RWhRQWhHQTA4S0ovTTFOOWFHU0g0Yzk1dHFKL0svTEVZbk9ObUVGRDYydWt6?=
 =?utf-8?B?SXVIOHZPMEdZV2l1ZFk0Rk44bHNYbTZnUE5Id2k2Wlc0cTFNWFFEWXNaUTZo?=
 =?utf-8?B?Zjg0U0R4cFlib0E4Rzk3eDRpVXFmT09zZ0ZTZVRrRU9pbG1WZ1c5MUVxdmJ0?=
 =?utf-8?B?Q3BRUnp5QkxMd3FIcUR6eE9vWkt5cDVhbzN0U3N0Ym9Mbk81K1h6ZlBQYlF6?=
 =?utf-8?B?TGtzWE1EbHo1QmJFQ0lZUWRkTTgwbzZKdGlqQlEyd0svZ1QzSW5PMHJld1ZE?=
 =?utf-8?B?L3NxVG11azFDK0V4d2kwb0lOMkgzK1UxUjFCalVpa3Q5MGJ6bHFTQ3F5MWht?=
 =?utf-8?B?NE83dG9TWGNTRitsNHZ4VTJsMU1Bekl3TU1WRCtsRE1mbUhlM2k4Y1pkR2Qw?=
 =?utf-8?B?YmluclBZL1Bhc0pOMC9CRjU1NG94Wm9KVmZDS2plOWtkQTlkaTBXTytJTENj?=
 =?utf-8?B?WjBPMmszOWNIMENZNk9PNWVCT203T2thVC9vQ3J1bXpqWE43Wk9uU1ZwVytU?=
 =?utf-8?B?MER5bmZGVVFaVDE3SEQ0SytYd2RYUlpsR3p0bGR1aWxUU0NiR2Y2SThraVhk?=
 =?utf-8?B?ZHJDL1lOc2NibmNsalFLZkorUTJjT3FIdFlkUTRQM05hVDIwbFlkUHl2UFhP?=
 =?utf-8?B?NG5rYkFiZ3dWZElsN215bkliVDMra21SdHhYY1BIcHRheWtadmtyWWR3Rkoz?=
 =?utf-8?B?eUYwYmQrdTZLV0tuVGQ0Vkh6VllGRFB1ZG1iZnJtUkJMRU05eFE1RkNFc1Bq?=
 =?utf-8?B?YnlJNGVWYmI3Y280SFByNGhhb0NvUm1MMlh5NFAxUjNEUnlWb2kxc1RTWXRo?=
 =?utf-8?B?M2IvNVB6NXllb0t1TTlUT2FPVW02N1ErNi8vcGd1bTY4QzhGZGlpZWdRMUFD?=
 =?utf-8?B?eGd4bVdiZHZTdTg4UW1UODJKWFdoRDIrb2ZWMGlhYWV2bXZwUXBGYms1U1Za?=
 =?utf-8?B?ODhtTXJVaHZRRCtJeWF5ai80RjNsRjlYeTR1Wml0ZVVHN2dEVGNkV2w0ZHRx?=
 =?utf-8?B?empLVVZ2ZDhsZTZMd014cTMxZWZGTWdwRUVtZXlLb284Mm1sYjh4ZU9VQ1Jr?=
 =?utf-8?B?VW9KVTB2ejdaV3pUcTZVYnBDQ1Z3b21wVER0L0R2WnZlSzdYZUp5UDkvZFd4?=
 =?utf-8?B?OGFPd1YyNkNsSW5nWlVwSUZ4ZUxUc05MN1pPQjF5UnJkSDJadElQcXArdFdH?=
 =?utf-8?B?RGhKUzRXaExWRmRrdTZtUnFCRFlsNGhHQmxPUDk3ZHhtQWFRLzVGcTM2T1RM?=
 =?utf-8?B?WmFxa0JjRzBRMlFXdklDWE5iOU0xVHFmVTd6Q3UvKzdwazBHd3cxVGRWKzUv?=
 =?utf-8?B?cDdLdXhRM3p3djQ1RktaVk1wOXEzaUpWUk9nRlVscnMrNTRQN0dxamNTc2ky?=
 =?utf-8?B?dksxcHpQb3hJV0VhdlVlWjlqcElGVU1KUTBPSk5RejYvZngzbmt1MHJMSnU4?=
 =?utf-8?B?VUUrV1h3SlZadjJRb1JabjZYMllqZDU4TVhVYkc5emlGYlYxb3YzLzlvRG1Z?=
 =?utf-8?B?dWNSd3c4dkZ4YTl2QVp2Q1NNNW9xNU4rYy95eXdGVDB5WDNwV0pvSEsrOG5S?=
 =?utf-8?B?M3grQittamVMYmRzT1RGU01hVmErSzFscjVwNTJPMVRUSEhWeWdESUVsdnJv?=
 =?utf-8?B?Zy92aGJBSE4yNWNiYUJmWEpLMk1vRG8vWEdwZ2xycU91RXBLUXJ6Q1EwUzZ5?=
 =?utf-8?B?dXNiMEluMmtKZEZyd2g3L0dybWt6dVRlZU5SNnpuZWE1NkJvU3l0ekVGVkx2?=
 =?utf-8?B?empjWHErSFNpTHlJQ08wdXNtUFZIS2hRb3JNWDVOeXUvV2ZUdEc1TTI4eGpz?=
 =?utf-8?B?YStYKzdTdmpGWUNXMkJFcGNrWUU2MDAwWHV5QW9ZYzJ3T3RiQTJ0aVZ5UGFo?=
 =?utf-8?B?RENacGg5V3ZNcDNjVnE0ajdsdCtud0xZVDFkNk5mem1XS1FkTWtCRm4yVjB3?=
 =?utf-8?B?SUZ3NEZFMUVhVWlCMmIwdE5LYjQzNjFJMUlrL29iM2NLZWduZHhzUkYrYVNi?=
 =?utf-8?B?OTRDeXQ1SmJKRk9wV0I2aWVnVGt6Vy82VFhlNTY2NFUvcFZZWk5JRHk3bitx?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ea14d0-5290-4bfc-ee77-08dccb6db09f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:35.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4Era+LE0+AgF7gV9IjayVGttwHIVACbNXkOG0Z9Ml4UxbagzZ7vjBcJ3e0hzkf4lhxPRAE5dby5azLpTn0Tyrq6i0P9P5JH5v8sXvW5cLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Add dt-bindings for amc6821 intelligent temperature monitor and
pulse-width modulation (PWM) fan controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patch 1

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 86 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  2 -
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
new file mode 100644
index 000000000000..5d33f1a23d03
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMC6821 Intelligent Temperature Monitor and PWM Fan Controller
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description:
+  Intelligent temperature monitor and pulse-width modulation (PWM) fan
+  controller.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: tsd,mule
+          - const: ti,amc6821
+      - const: ti,amc6821
+
+  reg:
+    maxItems: 1
+
+  i2c-mux:
+    type: object
+
+required:
+  - compatible
+  - reg
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: tsd,mule
+
+then:
+  required:
+    - i2c-mux
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "ti,amc6821";
+            reg = <0x18>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "tsd,mule", "ti,amc6821";
+            reg = <0x18>;
+
+            i2c-mux {
+                compatible = "tsd,mule-i2c-mux";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    reg = <0x0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    rtc@6f {
+                        compatible = "isil,isl1208";
+                        reg = <0x6f>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 7913ca9b6b54..8ba53cc2672b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -370,8 +370,6 @@ properties:
           - swir,mangoh-iotport-spi
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
-            # Temperature Monitoring and Fan Control
-          - ti,amc6821
             # Temperature and humidity sensor with i2c interface
           - ti,hdc1000
             # Temperature and humidity sensor with i2c interface

-- 
2.34.1


