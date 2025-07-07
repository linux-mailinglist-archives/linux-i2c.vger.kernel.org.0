Return-Path: <linux-i2c+bounces-11854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC3AFB024
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 11:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEB0117B3C5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD2F28FFD8;
	Mon,  7 Jul 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a/Q7vZTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE7291C12;
	Mon,  7 Jul 2025 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881695; cv=fail; b=ClEq82/N7yUaOOde1LQdIwkJjvAtplrhSac1j9vu2Jf8Os33YBkoDy3Fio27KCLxmAk1b+XgyozE2/CFpOPbf6Zo0ivIck+xhzg7tRZoH1MbQwFoexG0qAbeKn9fv11MDhb2QVf9z/LeaxR3dRaybWT/leVOFsNaxXo2VBp5rcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881695; c=relaxed/simple;
	bh=mxeZcmQgRE1uBTg2mN1F/APmhNQVzNOsrQ23mFkeqqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S4Z0ETBeuBA+jULfRqUKbKJ2xZtFauu5qpdMM6fNhpk1z3DT9oJ4bjFVgb3DwrY8N5XHATlNcupkyK5XxWN8xhnEhnbhrhJyMKSGVAGnFuWKvRn+6971aHY+/Akc69EE0SMBdm+K7kFD28oxbs3zaTpAJxbFvMPyQtuh2XBZU8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a/Q7vZTS; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQezIr/DfjUhCgXjATEg8pX0z4mCeTYGRiEqTZJFkGqaKYAKcmd9f8I9/0LpxTcc4Kw8WINsRbDajwbJ5B+wx79dK1owq0LZQwvM1NqUbSPTtuDSPbj3KcgzhEhPR8XfevLRZn0/D2nSL1Hsm6NptvZaDF12FKlmvaL2L8lJtL1WoLp6zZf5a7fQsOo7cz82OjoCYv8Tk6BspFIyadId0AOvtLIfpUWg0UDzlZx00XNO5PSAhxIY1XllPO7FrJpjIBmQpNCYsgElijhCZgjw8/wVBCq8L+CwhwFgztqrqEqpCVRJ6ZBu2fdlQtT3UTD/HZDKb8q9UGTmqG73fY63GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz1tFEmQTlgWcqXRk6QSWhot2KTbrIlLeS1bLLDSCqs=;
 b=pXmcFo6qeaqR04gnb/FCZcm3JdWJmG2J+DYuY/09SkIqCci5cPaU+n5HSfGUQ8xdZWifLgXWUzYSMrQ0R/0jx9PieoeuEtWe5VPrOBwu4DhOkrceviRwZzIsIgTOZJ8/u1d0+uofZEn0VPXHKIeC+iXBDPEHGnvHdA7DzuP1SvZxY/BhbfiM3JIDboMfYH/CdQN0WoyRTylxVDHOVO52DC/ydvB03YgFneP/TLlEcxFMssdpFFRVPCjuAKuohcmYyiIYoIc3XcniN6XRBoJj7nkBKhaZj++/AX07pMgHvHbwHpXB7PjakiCYNi09SADtm1/gkJ3lrpz7Xlhx/bkgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz1tFEmQTlgWcqXRk6QSWhot2KTbrIlLeS1bLLDSCqs=;
 b=a/Q7vZTS7f5sKImaeMA0C/ElFUif/KpKvtKk1eE7WhbOWK9joU4rMOA/jiT4A9odikYQrVhbzZ41w5yV8jnrNqRGDgT0ewn0SrX5rfTPvETORyzICbMFTU7rQVV9XkFpAwCZY9gjavepJUoHf+wPt1HrtitSCBc7zVeYdPs+Oh/An3M5dDe2nhCeep6OMr0IqJseLfXzMnBUE50b3UxSzyc3YEz+5nIVZXPtl0f9Adm7bafDLqRb4h64Zk9Bk91/a/W7otxX81iX8FdpOFiPgKzpSrgpLwROr2IRknR7smuQ3Jp4NzFIXcqj3B3UlJYzu9RnLkcTtZ0bTiO909Ibaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10859.eurprd04.prod.outlook.com (2603:10a6:800:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 09:48:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:48:07 +0000
Date: Mon, 7 Jul 2025 18:58:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Carlos Song <carlos.song@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>,
	"len.brown@intel.com" <len.brown@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"dakr@kernel.org" <dakr@kernel.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	Frank Li <frank.li@nxp.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Bough Chen <haibo.chen@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
Message-ID: <20250707105816.GF11488@nxa18884-linux>
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e3e726-173c-42c6-c73d-08ddbd3b6028
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhRqdILfc4kMxhJl/KZPyQL0TdLtAcneVODYoZftb9DsrhyVQEJMs/bfH2U9?=
 =?us-ascii?Q?KmU2w5YJFFrMqEvLZGZZQi9VUlbNhjnpuB+LZ/wUir7267LmhV3A2I2dGCWx?=
 =?us-ascii?Q?dPphJh0hWNnyR8+4oqfCd/l+emnhXPpi/6SZwarszID+L+jiXNmUVDBc/xO5?=
 =?us-ascii?Q?GZ+D2T+bfrKPkgQ7wHTh4zbNQkZfSgM4kjbqomuFNxYWC4S6FTDs2ftffDFh?=
 =?us-ascii?Q?QdMgKVYVmx6UZggBTmBAnlmus+5SNP2fgtGQpd5GRt3GEwVz8vVrl2f2EGjq?=
 =?us-ascii?Q?+1rnWrugVe6v1Pt6UUcGXIJiSxPpA3nGdLFR74WWeq+kpriYiLzVQEzEGbph?=
 =?us-ascii?Q?1mzU8kC1Pemw/FfNwEnP6IMTFCyfYVR5NzGbt7PebUlUOA1I9T/vpY2ajTfz?=
 =?us-ascii?Q?6xBk2ghDM3JRnxU7gt501WqzTJNyniV6xTYAD0Gtq/ZhIhJPuWn6GM0mIe/t?=
 =?us-ascii?Q?TOaeYNrh+HLlpKIdZTm8KX6bVfyABHJ7g6Ft/KwWDDOvrD6vJXAtysStGcbL?=
 =?us-ascii?Q?Z8PU5ah70ZWNwzGV/t/dm7kFQU85yqIsYjA+c/f6LinaGR2o/TDjmwlxqNc0?=
 =?us-ascii?Q?Gegk25kwL62tzCzfkaicghGdUJ8cZ6mGgWhW9nMGvIfBpJeNEBMn3oyxTCEk?=
 =?us-ascii?Q?bnqjMZUGRfY0ZYe1F/8N7kRrfhA8qWUI27uwumFM2vheidAhEmWMXfuOj0Cv?=
 =?us-ascii?Q?ssp/tgqTWM3/c9sswxr1sZlfRT038UjEh65SrCfZy8UlKDsWYG1Pyfw/bR6k?=
 =?us-ascii?Q?YCwX1oxUfmHWZuMWgZPPZAkGVufCAFGPOLNaugxCVaYQWvo0BAHVPmryYQtY?=
 =?us-ascii?Q?KsUbi2+Ak6WLELShjLcSLKGQDklLj5PKgqKny3mHyjGjOyiArE5NeZx81iP1?=
 =?us-ascii?Q?OEn0GOviZe/bEpG7sPo5tX79a4gPSS7eN5Gq9p/FZatikz4im7HNaNf7plOx?=
 =?us-ascii?Q?d8B13wt7cJ3Px4qszqY/Sp5EqpiqbZCPsUBiJnZnG6q0sQl9n7ReV4GY9cbM?=
 =?us-ascii?Q?PFYoSXWkelPov91t1Hy23IDMGWWNhMr7aLmkr5LXhjgdm1ckyGBygwv+1JDA?=
 =?us-ascii?Q?EpKCgYKzNap3pXqsld+Yz4L8JvJLKVOCsUoxlcNGBU97mjApmORZw2N7LXiu?=
 =?us-ascii?Q?rHK7mebVvlCGDhX0jCvzBDaE2w8WUxPWWmehVaXf9D2wnJKPdFwSUV9BatBS?=
 =?us-ascii?Q?ibwknWrMeQOps/np02phxAwm4UktDxih5FBIPj8GNh6uucR9R2EjVuvBROfU?=
 =?us-ascii?Q?trI+hY+2oaQcRxaUK1VO2yGVqQG8od6IF11pHcxQicZzUiwMcVwaR8wZwBS7?=
 =?us-ascii?Q?5XnyV08tDSyMq0KXbe7Dw1Cs72pFH6yAeFsWJ0/A2XzEgmxZlOw+teHS2zRH?=
 =?us-ascii?Q?/vC83d6DcuAPu75j1Huz3oFDtTgOCkyOxgg7HmmCDfZrHajP3F4I7ZVoiQ+b?=
 =?us-ascii?Q?rA1MLoTyVBmr6w6ohfESGzQBkBlvGOcwETE7tV1fcYmLDjBoT2ff7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o1enUBysKn6fmjLVgNDCwPiQds4RBpltv/Q3+EHHz+Y2trP4HwsMCOLTRRTr?=
 =?us-ascii?Q?DgbASaMl4KSozWKceSaUROK4NKbUhi0yiHJ+MsTB3pdCoZ0Ho5IXq6sWH/8f?=
 =?us-ascii?Q?RzC3IxyVn7aVou65MoCjheKEveFHy1WRZLGF/uHSTctEHjDEJPolJ8ZeCEAQ?=
 =?us-ascii?Q?NMeSUWsP06DgB6RDuNqOgMi0kXywPs62EAAjLjFzNZSwkIqRaOgfO4BwM+dQ?=
 =?us-ascii?Q?r24tTQRL9v9Tz/vzNH7rl8ScCM8bQ11K1+wHaSr3RaRVQCZGWMdriAnclcSP?=
 =?us-ascii?Q?M+FeKW4DEe+stO59wu2G+Kwja4dxJyN2Ilkanyw0rLZa5Ne0UwxirGF2zyFo?=
 =?us-ascii?Q?pWIp6zBnpLa9aa7pra4X77oW3XlqdmToCfbHTIJPHAaQQpkw45p9D+QL9z50?=
 =?us-ascii?Q?k+YkoZ12BUyyjXNs5ocB7pv81iiGzMgegLN5ndR6p/i41Wim7DAuYbA/Uloo?=
 =?us-ascii?Q?rjUrLGOYkjloA5YW6tT6mX7SDkG+M8B2WAmcO2luB48qP+kUz03WWVfIHf04?=
 =?us-ascii?Q?ydX4XHDG2IjuTJoJKOiLd+GRDcm7c4MKH9IB/tP3URRLsS31vJ3oN1s1g+Hb?=
 =?us-ascii?Q?EsY5nQiYi9Fpc405+WKcD4PhLuIc/3cLOMhbNsEi/KYGISnVhDPbecl5AfNJ?=
 =?us-ascii?Q?/mi+rw/6bbNffvXP6D5zHmZZB8u4G/QDd7nxNoh0VjgIGJKoaIYnbTyv4qdw?=
 =?us-ascii?Q?gdrtykoG7DIejBpz6Qwa6YMoR2sUuTLMFPJdtR+Cq+d+PIpgCCiZaEsyVT9s?=
 =?us-ascii?Q?V4O3/BeyDJQIbHv+/NttFr8YYPKtx71RhfycLxe07ooczu1e+tat2muP3gTb?=
 =?us-ascii?Q?LhNxHMqCzXyHSD0xCvojqNROscBxZhb7VGvRwMsXgBJrJCnD9GIxgv2+eeZm?=
 =?us-ascii?Q?wBCSM5lk/Xc+B/giSOcI5baTP4KjjmmqwhiQIlRErg/PEhtXdXtZl3b/w1QH?=
 =?us-ascii?Q?d36lycHVm7zriQe8P3SvZYldltK9+e7c8OeJMI2Cxj05RrTVq579myRsTOrZ?=
 =?us-ascii?Q?pBhjpMUOf1QhvCRDu+IgaEjVXJNgWqU6km5pHqsnbaaiRTsL1fUraEBpOS+g?=
 =?us-ascii?Q?Vo/N1HtOlgOHCsy+ypDgOi2tm6hmH9qUTYxCgJakWRhL3gOOnm/We7BmQuQP?=
 =?us-ascii?Q?JZioARLM4gbDNnP9SRCj5xXJzBsDQj8BxUpYd1E5fYhm0T8k89uWhU0+BVDm?=
 =?us-ascii?Q?bTqy8pALrEBymZYTA1dbVTsSMbkwNhgoEXCOK3YFzXc2+YKnBgvXrQto5UXG?=
 =?us-ascii?Q?gvjbhTIGnc3k5KKdYFh5FCAb7pbDTA0GoA+4X3I6DejvVJ9PBZegBrhro7sQ?=
 =?us-ascii?Q?5IaCfUhB1g/O2Q44CF7YjUQW/sdTDOB513uKcDWguJj2a27i2eHbMtKDcjOQ?=
 =?us-ascii?Q?dqLzhEOUucHBQ/72/E/ae4iJ9BdAdvrGBjv5hEzHAEvPhnlqpoGw5JMEQImw?=
 =?us-ascii?Q?CInIpeftUJQ5JjpsIOk4ALaKueVTD1L9hmWwxiMueXYbO14NEdMJT/83UaRK?=
 =?us-ascii?Q?NJuI7v4ITlQ2e1OeP4gNbMxfPZ+yk21iza37ZwpmBXkqDfEqqqNC9VYqwlt7?=
 =?us-ascii?Q?Mz4itBTntBgVeHMS9yaV5ksKhNGDhBjzn2aRWeQu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e3e726-173c-42c6-c73d-08ddbd3b6028
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:48:07.7170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxmGqulY+o/Su4RLHHAvAxvKe3sDpwiUPcHC/AXADGl38rkTgd4kvXdqIbY5jv+bMHHsyPEW95i1CenL+paf7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10859

+Ulf

On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
>Hi, All:
>
>We met the dead lock issue recently and think it should be common issue and not sure how to fix it.
>
>We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio is one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver enable run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random blocked when at reboot.
>
>The dead lock happen as below call stacks
>
>Task 117                                                Task 120
>
>schedule()
>clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait for power.runtime_status exit RPM_SUSPENDING
>                           ^^^^ A                       ^^^^ B
>clk_bulk_unprepare()                                    rpm_resume()
>lpi2c_runtime_suspend()                                 pm_runtime_resume_and_get()
>...                                                     lpi2c_imx_xfer()
>                                                        ...
>rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
>                           ^^^^ B                       ...
>                                                        clk_prepare_lock() --> hold prepare_lock
>                                                        ^^^^ A
>                                                        ...
>

This is a common issue that clk use a big prepare lock which is easy
to trigger dead lock with runtime pm. I recalled that pengutronix raised
this, but could not find the information.

In this case, there are two clock providers that are independent.
So I think using one global prepare lock does not make sense here.

Stephen, 
 I propose using a per provider prepare lock if the providers are
 totally independent. How do you think?

Thanks,
Peng

