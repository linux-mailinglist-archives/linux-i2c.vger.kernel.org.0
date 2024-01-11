Return-Path: <linux-i2c+bounces-1266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BD82AADD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 10:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA5B284780
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 09:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C3110979;
	Thu, 11 Jan 2024 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="LIcgHMW0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2139.outbound.protection.outlook.com [40.107.21.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477D11C85;
	Thu, 11 Jan 2024 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSoGyOab7Ujqip8zfkzlKsWzrhb20+kWN3jD+sVBhcH547wrym1EcKiOIaxd24ZUoPDRu7Q8MNUaSaYIkCt0hVXBiObdRbqbQEsZmIUTP74E3/uyZOiobLvaWEnMz8IzlIcHlMaeI3s4U5VYkNuhCzKqT1ij6GfjEKxazVcKDT9VFlbKBy/G+9K62JaotpV+/d3/hz7eohFu31zVtzawPNkI3WV/m9ocB4i72yXEAaPiK8KYWGw5TEAS/KTUhr4cyaS+058Woi4CS56pt1n979e6N5Um6ZnJx8sH0sgMP3MUlOTzD15qNLarjM7C1w67pUnSBSWIAQhUNNlNzoQDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHPDclFgNkng3mdMgi5PMvS21uG8Kw2BdGJF8FFrKjo=;
 b=kDETzdsGA2ehbgDK0Qjs7OGFTdDmzn7spwh5dj7RZgJTbU5idZAdcN11g7l5Nz/ODPyI5gIA5E1yOfERMYpY1sz6zbSaOVzVqlXKTt4+ipmsyqiBli/zuycj8IkL04aHikgubksf6V38RaNMg1tqpYpzWlBex2XNT6gLee7JrEqRIr7cVSDygHimtmlxKMQJTpUaQO2dV42BFJZurBP1uuPfgZs+uilarQIWteMYvfJRtu8nrsexKM+FYy/rq9cV+ZUK9k7+pFdlXpdM9WjjpRw2q1OMa+oM/yvd4Yx2wLLLnvYBNEQNLlEG/S9q3HPi14whgzJQxcsTXvv6TNgynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHPDclFgNkng3mdMgi5PMvS21uG8Kw2BdGJF8FFrKjo=;
 b=LIcgHMW04MK/TxdDIIP3aiGHWp/GCw2VFvZ1b0JCRZow2ZDqhEIgXlJCaaTWXQm/EGRQpyBgCY+S6KOTd3cdPcECsRwWt3LRz68kOBGMkKwD64sjYjr+W2fvena2orXtgQjOrTN23GY3aSe+ewXu3yubRWBy2Un9a4/ZnnQePUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB5PR02MB10286.eurprd02.prod.outlook.com (2603:10a6:10:4a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 09:27:48 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba%3]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 09:27:48 +0000
Message-ID: <c50cd8ad-3bb0-e6fe-8ae0-c18ec53b2ce2@axentia.se>
Date: Thu, 11 Jan 2024 10:27:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
Content-Language: sv-SE
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 krzysztof.kozlowski@linaro.org, p.zabel@pengutronix.de
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240108041913.7078-1-chris.packham@alliedtelesis.co.nz>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240108041913.7078-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0008.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::30) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB5PR02MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: cb09a0e3-caf7-4ed1-0016-08dc1287931f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upsRfirgha7pKbkpBKzh6NPOpDp9Me9rAkEZ4SKmO9nZRuio4tCw8YM11jzIIcPy5vLLxWQv+rKYj9loM4gRzs9yIART5ZwUlgj8j++v3mJVZS+iDUgG2ZVLtnFqoFVwr4qhO5knd54zjWCZbgfIfUz+G4qNsXcXxXYaJy9cGVEybsciV81mX9B67BkC2z58DVtmyiQPyVU8/soObTrLcqwkjAY9q5PWphGkFo/CBl9VWABpOpb0N9S9lAQ8+U2LYC7zmNluNIrABGG8LNGCEd/nY6sMzdwnQaUY89CkYNSzhcBAe6kX+qng9+8IqeGZiTp9bdMLKBZ43UBjnbuPj8pf3CYEHhXqciVBCeLbXVwPkwN4duxxiuWW6naJ3rbDeP1Bc8V0yGh5PpCQn7WnrI/CLfGgOUivXxDzgeTLtqshqI6e82wMJR9ffHdXjb+W7gDqnFZDlGpvQLcWl/fczZDq+lpMWv44ZYZTcCuhuZUgSlV1qk6DSbkDpXxAAkSleLX58yDTHoB2DSsNPqpFLJxCXFCqoaKbEhrZylLmv7QFE30/D7Po4ut9BzeAwUOpLlWLK04z8rQMAzXRKBjcf3LKVh2jCHCsiqMWjG/JCUb1DokOSu3bT+/tN6TG+D/lABT4NuLA0MsO/VQxqLzjSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39830400003)(346002)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(66899024)(41300700001)(36756003)(86362001)(31696002)(2906002)(38100700002)(478600001)(2616005)(26005)(6506007)(316002)(66946007)(66556008)(66476007)(4744005)(6486002)(5660300002)(8936002)(8676002)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlrN2NWTklYSy9xV0dETHhLQnQxQUV0Q0tIeUx3NVprY3JTaFlTZXN5blpJ?=
 =?utf-8?B?ditkVnpBeVBuY2dheW5tZkdJY3F5RCtOci9aMGo1cC9QenMwajJSZ0REdG5Z?=
 =?utf-8?B?dTRhTk1Iamt5cUxVSWNGL3M3bis3Q01LNkJ0THFyTURjOFJHRE1tY1p4TnM2?=
 =?utf-8?B?SUNyUGZwQnhIeFpvOS9xdW1JdDc5RW9VOURIMzFJWFlka2JONmZGeHRScVhr?=
 =?utf-8?B?MnprK0Uybmd1cmJtRFcwVm5NL2g4QmExdVRUekxGMGJqZ3Q3QTdpMjVxNnlk?=
 =?utf-8?B?cG5nMm92SzdzeTBwNVpnNklwenFVQXFYVWY4SktpdnNWNjBkRlByeERka3hH?=
 =?utf-8?B?aVZDK3FnM1IrNE5tWnlBdE9vbnpocXFOQnpUUEM3RzVva0UyOUs1SU5rWWR0?=
 =?utf-8?B?YnJ2SmdUbHpXRTlBUzZRQUR2STJQRG9NcHpJc3Y2Wkx2allobE90ZDhtWVF3?=
 =?utf-8?B?d2FvSUs2Y1J5UENEMzNMUUJwcE5mdEpydFN3TjU3bWtnMHR4VkxJRVQzZElY?=
 =?utf-8?B?QTUwTjI4SjF6blNXWE1yUGNlMDJORkJWMVV4MlZWcDlkMDVQNFVqT3FxQjdx?=
 =?utf-8?B?bUs3RnlvRzVLMVhoMWY0NytKK05STk5qaklNT2szQ2dFWDBRN0QxdENIclpa?=
 =?utf-8?B?QjF2UkJBNGFpZk5ZaUcxVEdZb2RDeGFWQWdaazd1SzRzR2hkUXBNaEZSZXBC?=
 =?utf-8?B?NzRPN1dPZEJnRjRpQTdSUDJoZThwRHRpOE4vZjJNWmo0azBOeW1hbkhrQ0JR?=
 =?utf-8?B?VWJUTnlvMnJGRittRjY1ZFNPWjNYOWg1SnNXc0UrMjRVbW9LelNWQkpzUzBq?=
 =?utf-8?B?RWFNSXlBTEpNdUNnKytqZXJ6Y1RnMjhaeDhkekdhZFhNY29NMmJpb3FUUWxl?=
 =?utf-8?B?OFlwQXdEUFluZ3h0ZXhYU3FFVVBrVHVkZE01Ti9Ld0Jrc2wzY3NOUjlCcXhv?=
 =?utf-8?B?UTV3cWhmb2tPSnVENGd5Z3J0T3NaMU56dVNoKzhKalJNUHVoK3VsSnc0RXlN?=
 =?utf-8?B?Y3FySmlPUkw0TWZYdjVkOFBOZzRncHBwZktYbEN6YkVIMkowVW82bjRjaHoy?=
 =?utf-8?B?QlRVbGgwUk0xSENLMGZIaGlRQnNyVWFYM3RkcEtUYmtOcEJIbDFEdFZSc2hD?=
 =?utf-8?B?R1FBTk8raEFxOGZtbW94NG4wcVhzVkhHb2x1NUYyekozVTlGNDhqTm5DSGZM?=
 =?utf-8?B?RDA0Mk9ucEQwcDlGZVVhMnJSUkptUnpaWDRKUWJ6V3RLWW9EelFXaFR0TlVl?=
 =?utf-8?B?RXUyNnFzL1dOTXpCQ0hJNTBlc0M5a2hwQlhNWExuQVNvNTZYaEJrM3dZa2Nj?=
 =?utf-8?B?elpSNCtzWmM2OWpaZlFwenBRck5wVWQwbVFqbWw2WnlXZnRselhJdDRleFVF?=
 =?utf-8?B?am1JOFo5ZVdtc0RNa0k1RFFzc005SEpFTENuVXM1MDJxQndoSWZqeUNHcVBL?=
 =?utf-8?B?bmhUN1pTZmZDMkIyNTNtZkhMb1NtcW5mdW9BRUhQYzFUZ1B5QXhERVhjZ1hv?=
 =?utf-8?B?YTlTdVpRV3FGZHRoUTR4elV0cUNKQlMrUU5MZUJaellzZXhQbjVDc244SU1G?=
 =?utf-8?B?c3ZGRmtISTAyanJlTmNjSE5KTVBaKzR5T0gwanp3OEtMZWdxRytkekp6UVVL?=
 =?utf-8?B?UnVvZU5nVXloREM1a3A3THNKZFBYelhsRzRsTUpMMU15aktibTdPSnZ6SXdW?=
 =?utf-8?B?SnVaQjFNcDVZeE1FWU5MMmdnYVkwMUZ1by90MmM4SkdncWFSdGF3K2U0allt?=
 =?utf-8?B?UFFRTXJSeCttUHVnZnFVSG43RkIzSUhDaVIrdnAwZjI3RjJyVDNZWTNqYUhJ?=
 =?utf-8?B?RDhuWDYzZ2hlU3dVQmZxNkJrdVJjMXoxY1drWFN0Z2NJVGF2UVpDeHhRUmx4?=
 =?utf-8?B?Ulp1ZnBIeWdSVkwxS3BBM0kzVG1MVDhvZDVZSnV1WmZLLzJyR1VBWDBRWmRx?=
 =?utf-8?B?RDVWY1lMVDlqeDE2TFY0WEgraDdBZnJxdUhLQWszdHQyekdJOVhIZi9VQnJ4?=
 =?utf-8?B?eGVnSjQ3dzBsNzY5YlVqdS91VDFaYTlnUjl2ekd4TDRxMDJKdWF4Z2ozYTUr?=
 =?utf-8?B?cStVazhMK0dTNVRmbkhEbEtKY2FzRWErQzF0UUJoWWRra2wrMUlOcjBuRVNl?=
 =?utf-8?Q?AzNw0m+hczWxFpc87LXV5hXG0?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cb09a0e3-caf7-4ed1-0016-08dc1287931f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 09:27:48.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V4ypuqOcHvp0b2d+Hu+ofgFfSWkOryA3K23gCt6Euy7DulOA0dVi5LCl4k1zIyd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10286

Hi!

2024-01-08 at 05:19, Chris Packham wrote:
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Looks good to me.

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

