Return-Path: <linux-i2c+bounces-6027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AD969EDC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE78F1F23D5E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 13:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C20A1A724E;
	Tue,  3 Sep 2024 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="H3Z9+jfG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96BD1CA690;
	Tue,  3 Sep 2024 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369444; cv=fail; b=Mh0Eb1bb8fTgtnQc8p1Qx8YRcmJnvGySP0F6pU9f1HLnUSCrjm9o/jOkKLgi/SUuho+vkgmB2JsHx7dgvi2VEYxc5RkEACvVQ8kvu57eC65mCYdyG/IJDuBxTCqvdmjvoaAM0kjHghEo7EWTr481h1ozvPKWWJoOKRB53ThFMmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369444; c=relaxed/simple;
	bh=AllYzC05Gk7l7dCwYhtde6yOP2JgMRAAur3J2XQZeGM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bqsqWw4STu8wCbSTggANOp/vQhFD6UINfyLlQkGjnyPUC3CxxbN9pDLzAruNyyxb6fOywhBmh9Rtypg0Acmkx0PynFi8uTWfkjdKTS3JvnbnsXw3rNcsx0fsrRiUYNkBVx7eIwI3az1SgXxa70z2b1zcxz2x57y4/tUsSV/lSZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=H3Z9+jfG; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta4v7ufEu2fkaCQ22htDwkNuwNxOzkmWEFlN99VIMrKQYfE90kHqOAZ24UNmdxawQFZcxOwhmGL5oTQDLHCZ61l70r5DRsYbghAPjO9TLUjsNLHN1rtGdjDxxULsbT/fh+Y7aADwnOHlBPK07Sxr3Brz9eSQrDmKTIGXEN30keWLA+jzrOa48A/ev/Dwp8QHJeG0crN28sXgeMRMNBlLdBcaQOdUt4IDLg0ojd43Fbxzw3yGZ+xFgx6raqSzNHhMMDdGuvdJvh/9SLDGS6qDI3JZLtdyDMKlcfK+jriQ/JHTRvmgq5I55wu97cIcO9I2MuesPvAsbC4RHzZA0Cmolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOYHb5A0PEYczo9ROVPr7TGa01qXcBqvQp6uoW/3Jz8=;
 b=xUlBkpuYIwsz7iGh5M+IC43ip52U47PycpK04vVJexHZiiYkIvmtO6Tw7DJIQquL054meLuRU3tRJ0Twe03fBOxx18TeXI568K8USL7IMLUTaygOkdGMeUcmFOCtIhdgtQSBLh6vslEx6kPrBOuVB/uWCjSiO985L16lRBtRTlTIy2ZxsCqhY8wxuBaPYZAdjDXjWv70xm7I7Dqy/2TGeTwyi5a4RewR6JA+o5A6TZp2/ssLcFavYnY6n7JRTu0O5bvPDzFbK2l0pk48yD6PwFg+dz4X1HHBFp8WnIj06f9uF7Yi8VIhqdaz4pfVF4yZjTfRelWfPJxJ3MX9juS+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOYHb5A0PEYczo9ROVPr7TGa01qXcBqvQp6uoW/3Jz8=;
 b=H3Z9+jfGCd2e+8HofarozdwnBDU39NxVRFnHiskI7nh/fvtuxnJpYLT7zCeiMoPIAnHyiMdacS0SfAF3uVgxZtjzQDP5J+U0+uV1kJrpqXfLTTkEkjj4ajxduYuzJi6SzCso+aEDIyDTJcSXyP6Gnfn73NeJji6/67Tg93BkLx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS8PR02MB7046.eurprd02.prod.outlook.com (2603:10a6:20b:2ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 13:17:17 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.7918.019; Tue, 3 Sep 2024
 13:17:17 +0000
Message-ID: <dd42f526-6da7-87f8-ad4c-bf18af41c665@axentia.se>
Date: Tue, 3 Sep 2024 15:17:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/18] mux: add mux_chip_resume() function
Content-Language: sv-SE
To: Thomas Richard <thomas.richard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-4-6f1f53390c85@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240102-j7200-pcie-s2r-v4-4-6f1f53390c85@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00004525.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::346) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS8PR02MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f68b5c-9ef7-400f-15e4-08dccc1abbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHd5eHNqKzhnK3c0ODVKV3pnN0VGREZXSEZYMGNtN1hoNFdhS0hhRVFPYW1s?=
 =?utf-8?B?bi9ZQkkvSlNHSkVTajFGdmZma3dXamRVYm5zMzBBU29GNHpySSs4RW5yWWhh?=
 =?utf-8?B?R0tiSFBkUG5ydHphcGNiZzl5djNLb3BkeFYzOUFUTGtXZkR6NkU2bk5uaVFL?=
 =?utf-8?B?eVhzdXAyaXR0Ujk2ak1OU3BYcU1sQmc1Zkc5QWg2SVJJS2lBQzc5SVpvSStp?=
 =?utf-8?B?OVVoOVkxQjZvZkJ4MU5wN2k4QTYwYmFydXVVN293YmhOQ0dqVkYrbHJMcm9R?=
 =?utf-8?B?NkR2MnRBeDFubE5lckhPRU5tM3QySkdFVGtsV000dGYxODZOck1WcDBJdEVE?=
 =?utf-8?B?dkxLSlJMTHk4Z3BZWFVBZHhlQ0pmd0xjazZoeENsN0w0L0FldGxTSEFGc0NQ?=
 =?utf-8?B?RTMzUDR3NWk1SGJQblI5YTRXZ3IybnhBUHcyYUJyZzZrN0NIUDc2aUVtVUt5?=
 =?utf-8?B?WUlkUis0elF1WG1pVFFMME42RDZoRjRaUVJUNVlxVkVZdHp6Y1ZidWpXZWNu?=
 =?utf-8?B?a05WMXJ4ODJQSGRWcnB1d291K2txWFAwTmowWWpIby90U1IySmtXYmhjeVk0?=
 =?utf-8?B?Tllwc2ZpTDZvbm1td0dPUmVnMzIrTE5Hc0xMV1d6ZWtkQzZsdUNXTEpuZ04r?=
 =?utf-8?B?SWxjUUM2RlRrWUhZVjNIWlZvUmpBY2ZETXpLN0J5NGJiY0xSVjljMnlBNWEw?=
 =?utf-8?B?TXZIZVNuQmNrdG5tV0wyVGhPMUhhVkgvS0dPZnFkRXFGZURLWHN2dFdzSEZa?=
 =?utf-8?B?WkdaN3V6c0pMbVJGM294Q0NaNDZxUm9nSnRxemFlQWhnSGhNdTRRVXE0V3Q2?=
 =?utf-8?B?RmxwSFkyYzNqTVlJL1JwbXRmWkVuVzJML0s4MDcyOXE3LzFPdURldUxwQ25F?=
 =?utf-8?B?K2JvZk9mVWpSTTM4cDBRNlJ0Wk1QMXoycEUwVmZISTFUL09mdERIbkNHYVhj?=
 =?utf-8?B?aDViUURubHZpL3E3M2xPODN3cHZCVkdBOUZ0dXdXUGYxL3VaSkRwTVdtQWE0?=
 =?utf-8?B?WjZadTJOYlNEY0RCSmxML2s3eUNPL0NqcUdHaUdmM3pkYUl6QTNEWlBiYkpw?=
 =?utf-8?B?UlNtaXBoTE1lV0p0T3poRmdSUG9yend2VDRyWDFTOFoyTFJhUXhqV1NSazFB?=
 =?utf-8?B?QUZTWVZIVCtJM1lxY2xDaGdQcFFLTGRuV1kyM25WSlhodHpabnYxTHhCYzQ1?=
 =?utf-8?B?azllZ1B3T29TZU5VZDRJM3lLQnZSUmlLSGwvRDdBOXN2eEFnckNybzNzMkFE?=
 =?utf-8?B?TUZMVEwwM2F2NVduSTdpUktjK3BDYkE2UCtlTmptSEFaQlBnR1FFbHB5V3Ju?=
 =?utf-8?B?a0lXM3hoeWlEb2F5M2toNjV3UmlZeTVPRzVlN0pnMllJVS85TGhtRXdQN1M5?=
 =?utf-8?B?TXR2TWtYS05LSEdUbUU3YjF2VlVqRUZVamtWQnZzYjkzdDF1U3kvM0Y0KzRP?=
 =?utf-8?B?Z3YvL3VzamRQRDFrdXFxbFFXNDNQMHN3NE1STlJqQXQrU1lDakdhR2pLdnBL?=
 =?utf-8?B?NHlVYkE2QWE2RlhrNWNWY3NZWXFoS3ExOGJYQk5rM2lzWEI1eFI1enZLZnAr?=
 =?utf-8?B?aWlEZlNvZk5DQUR2OTJEcmNDaXIraUFsUDZpMU0yeUxWNEVndVBGSS9iSXk1?=
 =?utf-8?B?cENYZkljSm1wRjdkZkUyZDJmUWIybjN3TUlHd2VwbHF1M2VwM3dVY3Jobm0x?=
 =?utf-8?B?Nm50UU52alRydFB4QXhadlF4MWNkdkgvOE1mMUNlZ2FoVkQvRjZXRWdtaUZz?=
 =?utf-8?B?TDdKQ3EyN0d2TG9mQUJWVVRZbURPSld2YW1VMTNIZ0g4RFJDQzVlOXJPYnFP?=
 =?utf-8?B?TUYvbGkza3hRKzJ3WFNXd2oyL3RET2M4Sm8vc2djSWROaEY4MThsVk5ackNF?=
 =?utf-8?Q?TEAOmPU+M62py?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNuTG1qNkFrcmNaWkY4TkMxakJhc0VRZk41TFdyZDJnWEUyZ3lxZ0hTSUk3?=
 =?utf-8?B?TmcySDl5Z0dYdEx1VzNrQitQRG9mRHhaQTd0MkNXNGlLWjFQdGNzLzZWWHpq?=
 =?utf-8?B?Z1VUbjJkTjVXNmtTT1o0bG5UMUNwUEY4aWpFNUtVK1RCblY3Y2Z1TnI0SmVY?=
 =?utf-8?B?NTFGakNPaWU4SHlGaDh3TURmWVZlZnhQRFNXS2xLOFp6UXdud3Myam9ocVJk?=
 =?utf-8?B?aHhqTm1JMFBGSlFWWGtMTmdOb0FTbXd3S0NKUnlYR0l3V3hNaVB1aHpaWWZp?=
 =?utf-8?B?ZlR6dWNuYWFVYnpBeXRna3N3VDYzVFFtclVLbGJYamVna015UmV1dEJ5QTE0?=
 =?utf-8?B?ZjYwWjFoV0ExRVJRYXhGVHdGTmVyU3IrbnNCTVVRckFpajd6Tmt6dEV1ODYx?=
 =?utf-8?B?RWY2Q1VzRk9ES1dhVVJ5bXJKTDk0ekoyRjJZWklRcDJyWTZGY3VOSzRwOGVQ?=
 =?utf-8?B?Tm5VU3QvOHdNbExkL0R3dlVFMENGZjVSeTN2NFZzbDJ6ZklLYTAxMGtPL1k3?=
 =?utf-8?B?NUlVRXFsVE9YL0tyY2h0ZytsZ01wck1GSC84b2l6RDFWM2k3dVM3NlR6NThG?=
 =?utf-8?B?T2d0ZXJQS3FraTVTaHpETjBSVEx2WEtNcUFzVElXaWI5N2cxTkxnM3NnUjln?=
 =?utf-8?B?SkZ2TSs3UXlmNkNDL0lMYmphRW5MdERwcXFGckVIYU80MENNbFlscDhqbXhn?=
 =?utf-8?B?bDlTVlRUTGlzNGV6SzlBRk4rYXNSYm93MkZjTHE3MlRYRWpVZXozaFZLQWxN?=
 =?utf-8?B?K2MrTG9yT1JGM2h2VFZMbncwOVhKWmVwVmgwdGp6bW5PU0pvdnd1RkZhQ1hn?=
 =?utf-8?B?MW1kN29rM3dMakd1a0MrallJQnRteXo2VkZScUJoTWVodzZycTBPMEpVdVpR?=
 =?utf-8?B?THRLaVBtbEkrQXArN1hxRkpOLzdhdWhuOXBNWTRoY0Q0VHhOdEpDNHBzQW1j?=
 =?utf-8?B?RTlhdit4bU1paDM4ODhYQm4wNVIrTUFSVkZtWnpJWWtUV1ZtQmFqdlJYMDlF?=
 =?utf-8?B?ck1wTlVuMUxiOENyVkdvdzdzNmdoMUZKVFJFYlBkRG5GSmx0L1FqVlpNaG1O?=
 =?utf-8?B?R0xFa2lvTmZTeDRBYkR1R0tiQURWVVoweHE5cHBhZzFTbHdaSXd4OTZkd1dK?=
 =?utf-8?B?YWpUdS9vWTVhdFpOaWZWWCtidVFLOHBMLzBjUnJmRVhLNDVVTEl3ZUFZU0c1?=
 =?utf-8?B?YkUxK0dkMU5QZDlES3lwOFA4MGNtdXhodnBKdkYwK0JhcHZkeXVLbnV0VkV0?=
 =?utf-8?B?bmQ4MFpWQ3ZlSVdHcU1TNWdXNjRWaDc1TTQ2YTBUbUxkWUx0eU1Xb0wvT3h0?=
 =?utf-8?B?Kyt3SzBoWFJXWUsydENJT2l5QjdJWW5HYkhNc2xKaXN0cVhwVXROd29OQTV2?=
 =?utf-8?B?VlhWaFdHR3ArTXNKdmhDMW9hTGF0dXNUbGtsb01lMEE2SEJwYnpUaURnYTFo?=
 =?utf-8?B?Y0l4ZHFsamEvYStCNm9CWk1XdWZLWUZIbitqVDUvbWpVMmd3SklTMkFISndq?=
 =?utf-8?B?Rkw3eWdPSWtWYjk0U2RRWXlEb0hFMTRobVJ3K0Uxa0luSGx6MzRoanBwWlBZ?=
 =?utf-8?B?QWdIL0hFcmRNYlhPMTE1NnRQSzZhTzhhb1d6R1pYZHNZUkY4SGhNb1JCV2xz?=
 =?utf-8?B?dkVIT3Q4OEJkWll3MnFpd293eXRodlp5bzRLL0o5VFV0MnlwYy9EWkhoYWpJ?=
 =?utf-8?B?NDRhQ0VCZXJ2UllkZzFBVW1RMnpmREIyeVFFNzFLc292ekFTV0ErL3J3NTlM?=
 =?utf-8?B?QS9ndkZtWGYrVnVETVNUVmRSREJTTGxyWll0OGYwSlJCc1NuN0VJQXdEUFRV?=
 =?utf-8?B?dEVKQmRteG1aTGhlaEw2YmkvODA0c3VtYk81aHNiMkViQ2ViS2RidEZ6TUkr?=
 =?utf-8?B?Z1JpajU1WHZsUWZSQjdsL0Z5dXozem1WblJYVkZJTlpYZkU3b2FQRHVFMDFT?=
 =?utf-8?B?QndWbUN4b25sZzZ1TUtXNjdPYml2dHo1ODRaNFZiZTZLeTgva2s0UzZkWWh0?=
 =?utf-8?B?cDFTQ3Ixa0FkTW81S3pMM0ZWWlR4SWVDQkVwdlp5eXR6cVhnaFdjQlY1TzFr?=
 =?utf-8?B?UEJvNEFFb1U1TUhaUnRtZHhGSFlYUDNvSGFlU0I0YjJWbEIvYlpWUkRtcUhK?=
 =?utf-8?Q?ymtZjpRUwfNpzbAwW303p/Vvu?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f68b5c-9ef7-400f-15e4-08dccc1abbba
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 13:17:17.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0TAug1QlioQydTcRvUFkyD2ghftYAmwJDwHZql/9O86kIZs1OnXupovki6iwArg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7046

Hi!

Sorry for being unresponsive.

2024-03-04 at 16:35, Thomas Richard wrote:
> The mux_chip_resume() function restores a mux_chip using the cached state
> of each mux.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/mux/core.c         | 29 +++++++++++++++++++++++++++++
>  include/linux/mux/driver.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 775816112932..0742aa2a7c73 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -215,6 +215,35 @@ void mux_chip_free(struct mux_chip *mux_chip)
>  }
>  EXPORT_SYMBOL_GPL(mux_chip_free);
>  
> +/**
> + * mux_chip_resume() - restores the mux-chip state
> + * @mux_chip: The mux-chip to resume.
> + *
> + * Restores the mux-chip state.
> + *
> + * Return: Zero on success or a negative errno on error.
> + */
> +int mux_chip_resume(struct mux_chip *mux_chip)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < mux_chip->controllers; ++i) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +
> +		if (mux->cached_state == MUX_CACHE_UNKNOWN)
> +			continue;
> +
> +		ret = mux_control_set(mux, mux->cached_state);

mux_control_set() is an internal helper. It is called from
__mux_control_select() and mux_control_deselect() (and on init...)

In all those cases, there is no race to reach the mux_control_set()
function, by means of the mux->lock semaphore (or the mux not being
"published" yet).

I fail to see how resume is safe when mux->lock is ignored?

Cheers,
Peter

> +		if (ret < 0) {
> +			dev_err(&mux_chip->dev, "unable to restore state\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mux_chip_resume);
> +
>  static void devm_mux_chip_release(struct device *dev, void *res)
>  {
>  	struct mux_chip *mux_chip = *(struct mux_chip **)res;
> diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
> index 18824064f8c0..2a7e5ec5d540 100644
> --- a/include/linux/mux/driver.h
> +++ b/include/linux/mux/driver.h
> @@ -88,6 +88,7 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
>  int mux_chip_register(struct mux_chip *mux_chip);
>  void mux_chip_unregister(struct mux_chip *mux_chip);
>  void mux_chip_free(struct mux_chip *mux_chip);
> +int mux_chip_resume(struct mux_chip *mux_chip);
>  
>  struct mux_chip *devm_mux_chip_alloc(struct device *dev,
>  				     unsigned int controllers,
> 

