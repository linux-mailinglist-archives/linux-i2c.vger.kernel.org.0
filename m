Return-Path: <linux-i2c+bounces-3063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACCC8AE164
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 11:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1204A2861D3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7D25EE78;
	Tue, 23 Apr 2024 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="d60iubmr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2139.outbound.protection.outlook.com [40.107.8.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129731E863;
	Tue, 23 Apr 2024 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713865986; cv=fail; b=PlEmbnIF18V1f5BiZLIMKtfxXstY7JXoh/C6sCrbOgB/fs+Vr4D/k1Zmt9v+5D7vIjEWlUVtCPJsbXrG31L32LOykK/Y2fXslGaHoQ5SBWYohPBUt27VhYBasSsdYROEjL7uSmzrx+PEBmwapl4y+C0ByMRrKRlscMo3ZCAcKNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713865986; c=relaxed/simple;
	bh=hOgw0GWf9fra+ddKgDiMQGavHEa4pmDIg1waKJEUc/I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bXtRslq+QPAWOnz09Gx4jgAK2/mAM89XOqJfFb5bbT2DN6xvvRct8CbTAu0F0+TerqU4Uvb1vhbcVA7Xjnx2nZ39gMTpIzvwK6yWgESUJ0TP91AFQQZQMN9hM+8wH6pSHyvWF61GY0WesCfezBOfemtA1kbNQ1RnA/D5faXftUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=d60iubmr; arc=fail smtp.client-ip=40.107.8.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCwZEyLVxM2AYGFhcmhFknKl5LYVlGDOQ5IHcNRjA6AqAZBeVt1w4LcH2x5mHPxKf8jF0xSEJseFTGLJZsZ6MiWsi12b90y8N26e6pJoQX1jSZCVYj0Q9Yrn/Pr0wzX4J7FX6mijsTO3hht9NUPSvMaiNAg2CslLB7t1QukIUsL/L8uKDOxzzSCeInRY/Lw0KHaENIuiZhWeBSbFcTx781sZrPeeMj2KGnNeXQntZJvdvem1iurOx8WElFmGbstVb9NjsqGQi09AwBKJ8lDCld47yRg6FfMpbjQznFjHIxh7wWs9Ewd5De2k+OrJCKCA03+P9tj5KwSFQe8nOyrB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aqDDPtLW+03CjmA273kXqCvoB6TThtpLzHqTpQoWRU=;
 b=KoZVnLUK4Cy+fupKJnosHdAlgma5S3JHZnH6b5kX8qnZp406IPKzX3sHMO+2SueDAVylef9awF+G80+Gq5kpyb8OEMd9V5B04dtcsGN5L3GoMYWmewy8hUiyuhmLY85HyUVyfXsj34vJqIH9mVkJ61R0LWr4QIqU44CAiJLqDc/1exUM8z5rk4yMQmRFdIFPblHs2YaRimPKTCsJUvHrbE0QRouXJG/fxDOoCyRRQ/vrLFVP24KzcVnZ8zYGYsQJz2XpdGhHfI2Z9M3aF25YtNMk6+P3+K3Up/NVELi3FnocssFL5GHwEQ0X7M0JLFO9NEZc0KAoU9Ia3BUAmK6W2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aqDDPtLW+03CjmA273kXqCvoB6TThtpLzHqTpQoWRU=;
 b=d60iubmrv8d39FFfuF4XItfndt6V9JvIfCVFYUZBzJn4MdxLFmt4VGBngpDPdnkZWUCJdeAHckHBtu0X/ntBKct3fov8IscqFoq9GbsKs5Cc7dCmLPfzZ3Y3JFHfITfQMERVL7A5NCrHbx+sjPDI3mJ5v459mhceWNsltdcz+so=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DBAPR02MB6326.eurprd02.prod.outlook.com (2603:10a6:10:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 23 Apr
 2024 09:52:58 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 09:52:58 +0000
Message-ID: <3f095b5d-ced2-1c8a-9bd2-2ff2a9480fa1@axentia.se>
Date: Tue, 23 Apr 2024 11:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Content-Language: sv-SE
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Corey Minyard <minyard@acm.org>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Tom Rix <trix@redhat.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Randy Dunlap <rdunlap@infradead.org>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240403080702.3509288-34-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0033.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::26) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DBAPR02MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: a390de60-815c-4b1e-f305-08dc637b27d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmR0M09JeVB4b0NBeW1lNThHUlBNUDhlRC9QaURhNjhKTlFTeHZnK1F2TnNW?=
 =?utf-8?B?c09Gd3BrakZXcVZsNzVXTVpkOWFwTUdoWmgyaU5iYTZhVGYvNkErc1hTbnpS?=
 =?utf-8?B?b2pxSkFSektuS2JaUm44Z1VscldFTHgvUzB6RUFGTk1ycmJLL1FhY2wwQ2FB?=
 =?utf-8?B?UEpBQUNodWQ2NE9rVDZjM2dpM0dDdXQ3TkhjdEtveTBBKzlqSS9uLzhVK1Fj?=
 =?utf-8?B?QW5CZm0rMXFROW5VODkxZHlLTjYrUlpxdU15SUhEV1ozQjEzOUY2ZmtnREt5?=
 =?utf-8?B?SjNlY2R4cnhhcUs3dzFkUWpkWWRaTzhiMlExSGxNL0Z2ZFc2aG1SOHh6TWgz?=
 =?utf-8?B?aFA5dUpmcHVsTFFSd0hGNmoveFNPZ2I5bW10TEMzcVp2TzF0R2tQV0tjZ2ZM?=
 =?utf-8?B?QWNUejQ3bFJJQk5HTndPUHBUNHFLVUw4R0wxRno2T0pjaVJkMUNlV3E4NHlN?=
 =?utf-8?B?RFl2Y01reHg3eHBiYUthOWw1ZXI5UHE3YndyaU1FbEljenBIbkRaQUlWWXh6?=
 =?utf-8?B?UGhuOE93ajFzZ3Y0bThtNitlZU5MczJkdk5SVCtTckw5b0pibzEydlZjV0Np?=
 =?utf-8?B?eFRLWGhqOVlLUTh2VTVxRmx6THJoRnY3dUgzZFRmVGxQVlVxWmlYTjlVckVa?=
 =?utf-8?B?N2g1SUQxbTNuenZ2aWFhU01PZUlzYkFMTUdhN2J2a3UwZHhJcElqdURtTlVw?=
 =?utf-8?B?N2M2RDZaQldWRjhSamF3RnZmZjR0eWJERnhVZDB1ZGE1S3kybmFxbEtmZjk5?=
 =?utf-8?B?NXdWZFRaRnR6OWNoaWovb3B6V0o2MTdtbWVDd1pQcThjQWx6Z2VmcXNlZnhP?=
 =?utf-8?B?RWZvb1NJQ0FabUxacUVkT01uTDNKZkFrSkpORFBGWVZRVmxMaTdEdEVQYm9K?=
 =?utf-8?B?WEtJVEtzUkZLMmNhYU1RdXRqaGcwVzlQQUZQVm9OSjZHd0FvMVFKZUxEckRF?=
 =?utf-8?B?Y1piZWhEUUkzam1sUExZbDY0RlNGbTVBNlNMS2piS3g2WFZLaGJPVklsWkYr?=
 =?utf-8?B?Uk92RkNqc0JlUm5sVzNiTzZpYU5aUE15Zi9waS9iM2FLb24zVWRYNXBuT0Vu?=
 =?utf-8?B?UHEwb2J4c3o4K0dSaVM5UzRVU21vWjc2dVd4eW5sd0VFTnl0NnRCM2IwdFhP?=
 =?utf-8?B?aHErNVRYUm9QNko0OFJISzJrK2Q4LzkzWHhBai9GQzV5dU9uOEU0b21iRWpr?=
 =?utf-8?B?cGpjbGtoVzFRMjh4QmFjNmlwTU5qZTNQbUtQVk1TdkhVdklYVEpDUnZVU056?=
 =?utf-8?B?MHlaNzNSL21UZkRsREM2cmU1MXF0T2VNcTljL1ROR2hiSngzb3BpWWFWOXFs?=
 =?utf-8?B?NzlxQWpQYnV1bGNpM0hLVFF6NzBnM1RaRXh3US9VSFVQVDZiaEgzY2kxUEdW?=
 =?utf-8?B?dnQ2ZWt5TXVDcjZzUlgzYTJyNlY1cHhsbVFhK0FPSXdpaW5aMTJsU3ZrcEVs?=
 =?utf-8?B?UStrckx2N1dGekpOeWZKUEc5UnFSWFNvZ21tVjk1RktHenp2S2UvL2ppSTlX?=
 =?utf-8?B?Yi9VdFFIRXBSWE1weWwrNkxaYk1CTEc5WGFhc3l6TWxQZ0NyQm9Yc2RhOU5l?=
 =?utf-8?B?dzl4dmtHbUV5R1lmb0VvVTFHT1dpdUx2Qml2Q3lUZ3F3UytJYS9UR01oNEdI?=
 =?utf-8?B?OU8xM24reGYwK3M0Q0t3TUlCMlQwMnhLVTk4blNGQUJ5YjNpZjN0em9PREhL?=
 =?utf-8?B?OHdPZkhVZi85c2UvL0dmQzA3cURKeHprQVQ3bDMyV0RuVnhyRnYrU21YMFo4?=
 =?utf-8?Q?T1MEmaG+ZFywJAjhH4mhA8Lvv2Kq+TD+89znL7w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Unl1SEZCa28wWjJZUmFETU95a3FnVG4yYWMrSjJBZXpCcCtKRURDU3RxK0cz?=
 =?utf-8?B?cmlBN2tzdml5ZlUvRE9xcEZXRG5ncXFhM3YwQ2NoVi9oY0ViRHJBR2RHVjlH?=
 =?utf-8?B?RWZLaDNvUHdPRFBKc3lmaXk3aGVBRDUrVXlwV3VvOGNnM2RIQWJtNG1Ta3Jz?=
 =?utf-8?B?U3MzYWZiM2hkVTl2L3F0c0trdTh3RzV5R0xoSVpyQld5czI0WGlHL2NCazJF?=
 =?utf-8?B?YzNQT1JsYnNCUXhKS2hDZnFXZmNPV3NQMlg5cTk1ZmpGRUhNWk1jeE1HL0xT?=
 =?utf-8?B?djhiSmcrT2tENnEzR1VTbk9kdVRSNlZ6bTBOcW1MK2x6dGJGZFJkUDVodDg3?=
 =?utf-8?B?WnZ0UGVEMkYwK0Eyc29tamJpN1ZqMVU1VmR4S0VKbndlQ05QbmtCWXRuRURo?=
 =?utf-8?B?S1BzZFc3ditKZThpSjdGZ2hlcjQ1aVNtWm9ycU9jMFc4UkljVFpmMmYzdk40?=
 =?utf-8?B?WXBzMHk0SDFpcUVIR1hZM2t2MXlMc1YrcW1DekNBVzFld0gveUZZVEdaTnN0?=
 =?utf-8?B?QjBWbzFXWHk1RzBBM3BrdU5ycnlmRWJoYm4xaU1nT2ZNOG5IYkExeUVYaEtJ?=
 =?utf-8?B?NjZtczBwVVNVdXhzVHIvSXRMVGRjNy9Ud1JERWQvRFJSMFRpZ0J0REZ2bEJ1?=
 =?utf-8?B?eDNGT0JLZmhHZHJmQUxOYTJ2aUhQaHZrUzkwa215MU41TjhJRzc1c0x1dGNt?=
 =?utf-8?B?OGpUWjVVRWkvZnp4bjNUTDNBcjRCajV6OTZqZTZ6TjJ3bWdVcjRheDY0N2xH?=
 =?utf-8?B?eUQyQ1pJWFFwM2NhbzA3Qko3NDhJb0c3M1Erd3dQN2dIdklLSjg2NEdDWDZL?=
 =?utf-8?B?TFlXVThkWitnYVRoU29ZamZkWmYrajQ5NFdwbGJoRm9VdVFTYlU1WU01YXVj?=
 =?utf-8?B?ZXJQKytJbW44WThSNGdHWGNES3dVNzNQWnNjRzBET2hRVHhiem9NUnIyWmM0?=
 =?utf-8?B?ZzdkZ25XZFVrUmd3NVk4S2JVajBoMEhlZ0l0Mm9mQ29pajR4YmZ2RDVNN3dI?=
 =?utf-8?B?Y3F1cG8wUS9BbmFBeU9mMktKZStVT0Z4c05oMVQvY1E1Q1dIRnloUHd1dURr?=
 =?utf-8?B?amY5ZmdXUlQxZWpKeUtwM1orMk8rdFByLzVaWVZ0RGtxU240VVFqVmhhejh0?=
 =?utf-8?B?Y3pQOEhIUjY4WENJRmd5RUFJMkRTd3ZyaTFlWUFIU1lEUFd2SmhFcXBGZDgy?=
 =?utf-8?B?RHpKcEtSdndkMHV5R1lNR2N3SDY4QzRBYjg2R3FXTXRJOFl2SGtSLzkvTjVa?=
 =?utf-8?B?RXBQazI2WXhTaWEweFhoVVZoN3dtN2RKUlliK011R3NkM2NKVVd1dEhxU2ZW?=
 =?utf-8?B?VjJlT2Z4blFXNGVMLzh4YTRaeDVBRVE3bXBCK01GNytXYU5TNzZtQkxWZCsr?=
 =?utf-8?B?WDYwT0hZSzFBNk9IR0NGWExhTkVld1VsQXVaalpHVm53UWlPbEY1MER5azdZ?=
 =?utf-8?B?eTliWXFMVnU0RUtRQ3QzZmM5dXJBd2xXakpiTVVVK1NOZitrcVZROXlDNEU3?=
 =?utf-8?B?UmlBRVg1NjVrZUNSY2NwVFlGMGo2VUc4dVdPZVlya3BOa3RVeUg4ZVl3VVBo?=
 =?utf-8?B?RXQrQi9sbEdDaVp6T3FPRzlGSjJaRDJIa1M5U25zQjJTQmlDTC81OEVnTCtp?=
 =?utf-8?B?MHNwSnlDN0xKcklMQklqOHBUVFdCM3ZZVVZOZWI2azM1MjdYZ0lXMkpsUVJi?=
 =?utf-8?B?RGMxVEhORUo1cXJWU3kwcUVPdHFlN2JaZGdNTVBiaWhvekhQSU5MRnZoczhO?=
 =?utf-8?B?bElXak9VRksrdE5tZW5aRVpySWZxNXdVbWFnRFR1QzZoK25JS2ltWlZXVmJj?=
 =?utf-8?B?YUpXSzRjeVlZSWo5TEVvb2xSMFh0dm9UVExpdVhqeUVlOFRZcjg4Qm9ZeUY2?=
 =?utf-8?B?VlJpT0VzWk1WQ2cvb2RTOVRNNlRuWXAyME1hSzg5ekNmbmxWMkRUTlFvS1J2?=
 =?utf-8?B?ZnZVaUhzd1IyWmMyaVNHU0h0TEdxVEVKWExadWlhYnVtVXg3dVl1MlJiM1c2?=
 =?utf-8?B?aWRaNCtNeHdXM2NabU9XVGZyM2Q2RUh0K2toOWtJaTA2cmhIa2UrL1lqbS8v?=
 =?utf-8?B?R2JkVTFvZWRQVURlWWUxcDI3U0NLWk1va2psdGh5anNnalJka0VXRkNJODFZ?=
 =?utf-8?Q?MeJcXB9SQvBhJipuMfESL3T51?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a390de60-815c-4b1e-f305-08dc637b27d1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:52:58.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pn1dpT9Y/3FlbsQdjJFMm1KIT6sGNi3KXACwth7VbQVikRHLkJV+FX8vIwXA5ynp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6326

Hi!

2024-04-03 at 10:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> warnings enabled, a lot of driver cause a warning about an unused
> ID table:
> 
> drivers/char/tpm/tpm_ftpm_tee.c:356:34: error: unused variable 'of_ftpm_tee_ids' [-Werror,-Wunused-const-variable]
> drivers/dma/img-mdc-dma.c:863:34: error: unused variable 'mdc_dma_of_match' [-Werror,-Wunused-const-variable]
> drivers/fpga/versal-fpga.c:62:34: error: unused variable 'versal_fpga_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
> drivers/memory/pl353-smc.c:62:34: error: unused variable 'pl353_smc_supported_children' [-Werror,-Wunused-const-variable]
> drivers/regulator/pbias-regulator.c:136:34: error: unused variable 'pbias_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl-regulator.c:552:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl6030-regulator.c:645:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3635:36: error: unused variable 'sas_v2_acpi_match' [-Werror,-Wunused-const-variable]
> drivers/staging/pi433/pi433_if.c:1359:34: error: unused variable 'pi433_dt_ids' [-Werror,-Wunused-const-variable]
> drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]
> 
> The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> that remove the reference, rather than adding another #ifdef just for build
> testing for a configuration that doesn't matter in practice.
> 
> I considered splitting up the large patch into per subsystem patches, but since
> it's really just the same thing everywhere it feels better to do it all at once.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c          | 2 +-
>  drivers/char/tpm/tpm_ftpm_tee.c           | 2 +-
>  drivers/dma/img-mdc-dma.c                 | 2 +-
>  drivers/fpga/versal-fpga.c                | 2 +-
>  drivers/hid/hid-google-hammer.c           | 6 ++----
>  drivers/i2c/muxes/i2c-mux-ltc4306.c       | 2 +-
>  drivers/i2c/muxes/i2c-mux-reg.c           | 2 +-
>  drivers/input/touchscreen/wdt87xx_i2c.c   | 2 +-
>  drivers/mux/adg792a.c                     | 2 +-
>  drivers/net/ethernet/apm/xgene-v2/main.c  | 2 +-
>  drivers/net/ethernet/hisilicon/hns_mdio.c | 2 +-
>  drivers/regulator/pbias-regulator.c       | 2 +-
>  drivers/regulator/twl-regulator.c         | 2 +-
>  drivers/regulator/twl6030-regulator.c     | 2 +-
>  drivers/rtc/rtc-fsl-ftm-alarm.c           | 2 +-
>  drivers/scsi/hisi_sas/hisi_sas_v1_hw.c    | 2 +-
>  drivers/scsi/hisi_sas/hisi_sas_v2_hw.c    | 2 +-
>  drivers/staging/pi433/pi433_if.c          | 2 +-
>  drivers/tty/serial/amba-pl011.c           | 6 +++---
>  drivers/tty/serial/ma35d1_serial.c        | 2 +-
>  20 files changed, 23 insertions(+), 25 deletions(-)

As far as I can tell, this triggers unconditional use of the
.of_match_table, and the compiler will have a harder time dropping
that data. However, the wasted data is negligible for the parts
touching "my" drivers:

drivers/i2c/muxes/i2c-mux-ltc4306.c
drivers/i2c/muxes/i2c-mux-reg.c
drivers/mux/adg729a.c

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

