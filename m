Return-Path: <linux-i2c+bounces-4758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC492A6F3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFB8F28843E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEB8146013;
	Mon,  8 Jul 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="G18nvGtE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3513B7BE;
	Mon,  8 Jul 2024 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455200; cv=fail; b=n8hwylfkylMGXuWE56zIjwtQ4yTiszp6cbtZwkqUJi2AN3QaYxmP98QTB86alCAFDpz2NsFR+gwDAspTGxGjCdtxpQl8yLMNvRR6/5qQuL1uXg0dmguktp9RZpXLfkYZ8QoOPZjGUlR5w+E/RpBDZa3PpQF0ky4x5wSMDtuCCiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455200; c=relaxed/simple;
	bh=uxjNQsin//RpLHGPJiutNOqul2+aED/LlFWL5Coaieg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ab8nvupbrQn9rRdGpvp9Ffe2hkXuq/Wtg2C9iuBNk6oJ5+NCOwZPxvXqm+17ygPnBpiqMvg6i8aayZCD7PLocHmxtQhUAts2PA2MDkCA1I0S+JSHONACfY32NZrkMQYxbrWCtX8VDa3hlNFbghZnESxA5Gf1TCJy3S4xh55Ue1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=G18nvGtE; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWvTdMwIpfGoxklf1P4u6YuzVts5H3pksDgO5gbyB79WfVBSC0BQJYowEdI5cT7R//oNiHktixPqAeg7I5M6nXyqZqMIh9d/VTfQ+UxTFu3S+L/txsYPLOnb/KH+G8Hfm7nwja+C52DTsXUcocc7ZX7XPX+2+ntW9u+XGX54mF3r5UDQMjTuOledrc4BTlP/uzDTALBN5cSvWdm4RCz8O4oR+RDuskauY8eQxqmKNpHPG18QnXdS/kW5pnrlWUGq/Co7z00/h5P7j0LK8na7hAe7IRF2Mu5YBiEVQBrA0VfGrU6xGxzSfCN7IbgBTHDcd6VY26sa9WBGx8gCjYG+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZRaeGul8ksk2vs5d9Ox3E6MuuZILO/56GodZsU2vVI=;
 b=Ryc5JXbBou62mtC1SUBNMOb9L5GbI7lXMHxEJwNJIuK24pjzdHcpf6DIX72LFjKJHCVn62abrTTnStt7mVZszDntpzBIjWqsQawjEVvz2OXMQVt6tIHNTUskpY09sagp4F8kZ7gCKys5pP2SL0mR4UtVdYtnfi0ji9FE8/DOIaba3N8O4Mu1jQrCAw04eJeQQ4HsBZu+Uqk7/DbNmGmS9fGfKlY0DJsJa+Wokx004dt7jwwB7kDn5LAubJ9aqiXcpiHIVnbF0Xr/fVw5yxFNpWAWf5BN6ZTHkaruyrk6uz/q+Ku8aFBfM6C2Us+GnxY9Pw0n0IctOLtm1sIiyfNV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZRaeGul8ksk2vs5d9Ox3E6MuuZILO/56GodZsU2vVI=;
 b=G18nvGtEX7n3AlDv3N04NH4GGc/py1kwYiXpFWG3K5KmgFKf1n9HerAo0nzMAjD8hxQ9sTa3eoLyRuKEqR3WwliwSHg1NrNfWVmZvV49cdxKZm6UXfSIDcZWEZFdeTe5F0wRTWIZn/Xs6BHrp7Dn5Tz1teUhS+uCDbnrVNDl/lA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:10 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:10 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:12 +0200
Subject: [PATCH v5 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-1-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c308390-5271-4189-f433-08dc9f68dc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGhzdEhzWFNtbTVrYVd5cCtUN1Nrd25sc0lsUE8wQWtSN3k4Z0ttUGZ3TFZ5?=
 =?utf-8?B?NlBCZjBwMW9KRjVBWFpUd21hWk5UMzEwelFlNUJURkIzTUZWcE9DcnpPak9E?=
 =?utf-8?B?VjBXRmlZb0U5N1NTd1RuQnpuZXVOS2hmeGxDcUlMclpjNTdOVTRBTXpBRnZr?=
 =?utf-8?B?NDhkUHQxUEdtWTd6RzlPSWRLWitQaVkwS3Q1eFBsaDhtdlB0a0o2cGJHOTRj?=
 =?utf-8?B?dGxNdTdtd1RRR2lZdmxhbDB4dFFPMVdidXdDaUdnNmdXRWNWcDVVVWNyMUF5?=
 =?utf-8?B?Q0NJU3JOb1JpdzBzNmJMbG1NTThuOWZNMWZaQml0ZWhEclh1bjROeTRVOE5D?=
 =?utf-8?B?NGlmNm9wbnQ2WE1SWVMwbWdrbVdJVzBMMmRxSWtCY0xSWTM3OFg0OGFhcHFD?=
 =?utf-8?B?L1o1SDBjT2hNKzJ2NVI5eFhtWkFHM3JyQTRTMmFURnNZMjFqZXJCMllSZ0pW?=
 =?utf-8?B?Z0FkRmdOYTRmektXNGtUMXdHODFaOTRvWlFqdWVuVFd3STVuUUxScnlkbE10?=
 =?utf-8?B?MUxXSUZsYWEwSkFoSUJxU0RwU3E4bmVMOWNXbG1jaTRqQTg3VDRwVXE3citE?=
 =?utf-8?B?MjZYVDVBN3lwOW9mWUF0VEVuZUlnY3pyT2YzNkxuSHM3STBvSVBqSzNRdFE1?=
 =?utf-8?B?SUVzYmllckdKWGFGalo1SG5vSlBUMW1ZT09EdUl4bmtsL2JYMkF3SjVWajlM?=
 =?utf-8?B?WUNBZGxueS95YjZSbUNlOEt2b2hLZHI4TUdLbUpBWk1IY0dxZ2RyNVJDbFB0?=
 =?utf-8?B?QU9pUzV5MUxvbW5sb21DeDNuTWZkcTZIRmV5cytUWHllU0RZSGVoOW4yNWo4?=
 =?utf-8?B?R3NCb0pWLzJiOUVDU2d3alZDM1JwQXhtWVRQdHY3elB0Vi84WXZOWXF6UEtG?=
 =?utf-8?B?cTJVcEZNUnB0anQyMHdLS3cwWEhPOGliUExURVordTF5V0JlRGlKWm52WXNt?=
 =?utf-8?B?NXZlK0JTUEpzZDJsMWtlODRka25ZQ1UvelZKcGE5c0pReHQwV2pmdDM3WXFl?=
 =?utf-8?B?MittdHlsYktzSk5pNlArQ0taNmRqYmJoUWxSQXoyaVNFdkJMVEI0WDhjOEtv?=
 =?utf-8?B?ZUJlNTJqWjZaNlFJR3lYUFlzU0pFSkpoeUtXVkNoWHc2MkVMOHVJUmhLRFBJ?=
 =?utf-8?B?ZXpwRGhSN29YUFNwdS96d29aNHRBQW15VnR2Sk5rZHprd1VVaEl5Mmxodk1M?=
 =?utf-8?B?WEJPdFZKQm9PTndoTk94NDVGRXg1T0tLaUM3a0toR052bG4yLytobHRRV2E4?=
 =?utf-8?B?eGdYQitaNlU0a0g1cHJmM2o5Nk0rSkNENitxWmowcWxKV0NvMnhXUm5IZ2E3?=
 =?utf-8?B?ZkZncU5OU0pSVXpFUllUNlNOOXBUd01BdTVwVG9EcXBIRjdQNm9FTmpOVkpr?=
 =?utf-8?B?QjRHWC9rekh2cGFIQlVET01vT1ZURVVCN1lGMWFRSDNYRCtkSHZJZnBGM3ND?=
 =?utf-8?B?aGJkZTJoRFA1MFFZQzN4RHAzb1RKY3Y2UzMzWnpqM0M2b3oxWVhxbW1rNEg4?=
 =?utf-8?B?YkhNMFVsUUlLZ25nakFUMFlyVVJHQWlUVVBmc0cyR3pkZEVsR1duQSsyNXZm?=
 =?utf-8?B?YXBhRXBvUWlJbHN4dUcxU2p5OXZYUVB2WndtZTdsUVVVWFFIdVVCdlFBeU84?=
 =?utf-8?B?cjljR01Yc0ZiNHRhbjhoSHVRVnFEWVdpbmpiOUo4OUp3WVNQR012S3cvQ1du?=
 =?utf-8?B?NXNWV3NFUGk2QU1pZktOQlNwZ0k5b3pPMDJYWHA4R3JBUUR2MG56U3l1RTZr?=
 =?utf-8?B?Wk1rZkY5KzFMV3RNdzNSQzVsdkZRTlVDaTlraGxLbmpmdFpjMUtjMzIyL2Fv?=
 =?utf-8?Q?SJczY6F89jS9euF4XvZU/sQcj9heBSt6s6+EY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUhlRDdtTlBZN0tPN2RnWXVpcVpiNFBrVkQvRzhqVCtseGozVTRPa29tb29o?=
 =?utf-8?B?TW80RXREdC9EM3lMcnlSamRjQjRUWlMzaWZncU5vNWp5VmVoY1NtQnAxT3Ju?=
 =?utf-8?B?U2JSZ0h1allYRE5jZ25VZjlyTFpCemdzZ2RHM0xGV0tYUFUzOTZYZzh0TXRn?=
 =?utf-8?B?a2xWR3FoKzcrczdGMmdsMEVGK0crZnluMjBPdHRhVUlrK2lXNnIzaTFHU2Nl?=
 =?utf-8?B?R01PT2VPRGJJMnZsUDkvdUtoTm9JMjByTCttRnQrcFA3NTV0akNkOXA3aWRP?=
 =?utf-8?B?WEdjZUhTeGJGYVR6cTFSTzd6R3VkMTdPRDhVVEZpd2F5ODRLZ0VjL1lOL1U3?=
 =?utf-8?B?VnhlK0p4amMzUlF5eXd1eGx6NVI0Y004QTFIdDZKb2tHaFVNeGwrQWJ2MzUv?=
 =?utf-8?B?bkFoOTlxWGtxcml5ZzgwbytOQlNoTlFyY2QxbjE2UVJQQ3drK2JXaXR2VUEx?=
 =?utf-8?B?NTlybFlUaEgwVmcxYWh1VHNNVFE2dU45ZURTWHowelBBZHhQRFNOMG9xWldI?=
 =?utf-8?B?c0dwd0hRZWtUdVVQSU1HTnlnS1V1MHMxcFM3VVRkaFk0YWd0S2N5VmhZb3NE?=
 =?utf-8?B?RktQdTlEVGpFNjNoWVQzYmJXRTd3ZnQ5bkQySHlyU0ozR1h1azBUQTRvWk1q?=
 =?utf-8?B?T2czS2grWTd6VTlnT09kbzZCblBycWdDY3ZvZFlSbmdvdWFTZU9nQk9ZWnZh?=
 =?utf-8?B?TzFmeFpPV1gvU05MUk5sRm5aV0gwbXowbloyMVVzam14YjJEL01sdWVheXln?=
 =?utf-8?B?dVNaZ3NZMzAzN3d0Y3RqOXgzSVpJVDNub21ocE5QUmJuL2hUQ25oNGh1aDJy?=
 =?utf-8?B?ODZBMjF6L1FZSXdsbGU0bmszdzhsZitYM00rREpqd1hLYWlkR3ZBZHlwa0h1?=
 =?utf-8?B?NHh6b1V4ZzJjbVluUW5HZXlhdzZyQkN5SnoxQkk5ZzQ1SDFQQ1R6N2haWE1n?=
 =?utf-8?B?b2hFSjFlV3pXZlFQRWliK2dHd2FaRjJwNFU4RHExOVk3M1FKNXEyR2hOb2l5?=
 =?utf-8?B?Yy9rNjBBNy9sSlVEdHJ2aEhSdDl0eHpRMWtuOUd6Vm5SdkN0dzBGLzA0a2ZM?=
 =?utf-8?B?OXk1d3JHNUxhNXBNZUh5dW4vblZFVnlqaFVzUWROSzJjbkFTMGZ4anJ1OWda?=
 =?utf-8?B?MGdZVVhPNnBwa2luNWZmMkJWV3ExVGZnbXZuYVJYbTlJVDhwc290S1U3S3A0?=
 =?utf-8?B?LzJTZ0JhbHJiSzlYamVmWHZnYWtVM2tVM3NJN0RVVXpwQkdWd0phUEJNSFp6?=
 =?utf-8?B?Y2FEZXhFNng1WmtZS0FxdGh1eGFNVXQvMUc2cDB0aTZveXlORWFmdzdWN3hZ?=
 =?utf-8?B?T1JwQmgzbFlFNG44dEZXeHRPQ1lmWWxyWnJId1cxWGhHU0R3VWNTeHcyY0JB?=
 =?utf-8?B?L25YYjhwemJYNDRoZ1RvTnRmWVdlSU1FeWZzOElabHZzcWhiRFBNajlCUFBB?=
 =?utf-8?B?b09VdDRhMWROQWo3Qm9Xb0duWnZoWnExUDFDL1JTbyt1cWRHbzJ5dWVpNW5q?=
 =?utf-8?B?V2tEOThRUlZNS3BqK2N5WXJ4b1RVYk45a2hIaTU2K3lwVnlJNzU5TktXNGFv?=
 =?utf-8?B?OFZEOWZBb2RHVWpRZ0oxNEVlTHN0OHZCSVNmT1M0UG1McjBpakE0c1padGJ4?=
 =?utf-8?B?TjdCQ01KV0lOR3pONHZ3MDFxQlRJQ2pyK2kzbExlYWV3MDhaRjBGTExoaktH?=
 =?utf-8?B?REZRYUVqRytjaFRuQWFTY01XeWpETjRrYk9NU0lmVUVLRE5Gek4vVUlyKzgw?=
 =?utf-8?B?SUllTFJGSHZuNXR0QmxhZDdFTGpsaW5ZSUxOTnlsNmtSYWdDY3k4Tldka1ly?=
 =?utf-8?B?andXaEs5OS9Bb3pWYWFONE03S1lnbysxcWFWMVNpaXY3V3NRbjZJZC83STE4?=
 =?utf-8?B?MFdNTXJWRkR3Q2dwdFhyQkYvdE9IVllQeU1yM29GN3VxQzlhckhZRHB3RWNr?=
 =?utf-8?B?aElUdzRUMWM3Mk9lUFpscSttM3MxRjhGY2laU2xaMFBWZnhOWFczZTdLQWpQ?=
 =?utf-8?B?NlFwYm1Zb3h2V0U4QmpqREpyeklPbkRZOCtMZEF2aXlrbGhYYXVraGg3M0Qx?=
 =?utf-8?B?MklCL1lCWjlTd3A3UElXYVlPS0tSakVVbUk2NW5lT0NEd2drYU1hbHFtSDNN?=
 =?utf-8?B?akFxZjZkTE9kRWRUaElRaXBMcHZ4M3c4ckpVV2hQeEVTR09DWFFOM29MMkdZ?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c308390-5271-4189-f433-08dc9f68dc77
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:10.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1bH401I8OwuVoqMA2q3+AYFrTdERWp1kZW5sEJcSEwRObEB2gb9nkLRWJD5uBEFCVUv2Habv1BdqCvSP/inzhP1+BlaebtJI4pP6XFhzSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which devices that are reachable through an I2C-mux. The devices
on the mux can be selected by writing the appropriate device number to
an I2C config register.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
new file mode 100644
index 000000000000..28139b676661
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/tsd,mule-i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Theobroma Systems Mule I2C multiplexer
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description: |
+  Theobroma Systems Mule is an MCU that emulates a set of I2C devices, among
+  which devices that are reachable through an I2C-mux. The devices on the mux
+  can be selected by writing the appropriate device number to an I2C config
+  register.
+
+
+      +--------------------------------------------------+
+      | Mule                                             |
+  0x18|    +---------------+                             |
+  -------->|Config register|----+                        |
+      |    +---------------+    |                        |
+      |                         V_                       |
+      |                        |  \          +--------+  |
+      |                        |   \-------->| dev #0 |  |
+      |                        |   |         +--------+  |
+  0x6f|                        | M |-------->| dev #1 |  |
+  ---------------------------->| U |         +--------+  |
+      |                        | X |-------->| dev #2 |  |
+      |                        |   |         +--------+  |
+      |                        |   /-------->| dev #3 |  |
+      |                        |__/          +--------+  |
+      +--------------------------------------------------+
+
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    const: tsd,mule-i2c-mux
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c-mux {
+        compatible = "tsd,mule-i2c-mux";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            rtc@6f {
+                compatible = "isil,isl1208";
+                reg = <0x6f>;
+            };
+        };
+    };
+...
+

-- 
2.34.1


