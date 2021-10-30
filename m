Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB553440C26
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Oct 2021 00:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhJ3WeO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Oct 2021 18:34:14 -0400
Received: from mail-eopbgr50129.outbound.protection.outlook.com ([40.107.5.129]:32836
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232008AbhJ3WeO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 Oct 2021 18:34:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tix73ES4NUetldB8DC7nUC9HUdIDYECkqrKtSNydcsPTWsiU1Znp8X3coqQ3prfps1DR/MB5WQZfVgIdn/VdWnMP5nTKlgaGMs1X/prJXsxx0OoD3d94D4KSLCEDNF5ZrtmjYTk6QIppBXBUFqUGok3+vw4YpxsjjiF32Jw/cgDeYZnXyZviv+XJQxi98YnwiqwksKuRAs/1mHMj2n/7S5oKXYwGC6/d09r457PA/zDs8G4MvnihdSuQH0j8f7Ryvt1CKTQFv0wvE+6GbZe7stXizS8G5emdbUVQV39gfHAZOsFSzeXyruEJzvI08c5MPLVLey2+H3376uW6+tB2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9YQJze91j3BCSvfJu5o4PZBkRO03+pVrYud727gs7U=;
 b=HiG/TV9wBfZgMkLDzyKM31egsn/L8rqluhoEjdajvbNJsjQkoknaQ05eNdgEjpsyd3KzoIinzHuUEfMOogc6Ze6rxa+s7dNhwW8BSHgENW751e382s1r59k1rgyw7Izg+X291owqZGIMhVTuZ6ACikJr6TTYQAqzzfnjqToSUm1ENhLpQpQKxqa2KquIaR/v7OtzRg3SDJ6L+0j7V01LysEzZfn1yq4CLTXvgYBOJCgJcUeHMQ+Ms4eTNKrmm5yzbh1Ej94/Vcn6rOSJrJs+kubB4GjQmtnlnEgad9zbdJpxlp05VH1pzWhmHamlQH96VvRhN4Z4BRXKFR2nfoF7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9YQJze91j3BCSvfJu5o4PZBkRO03+pVrYud727gs7U=;
 b=Bxc2IHaewjljjKIsX4fNcqx9Qj67GHRfiJTC0Gt+rmM+e/DO4m1/bfE7fKZFkak6lkuzI93LO+ne1xNBnfUJqdWwI2n9kSn77LLTLm9JkdBC/E4VjOTgOyX05Av8pskPReQ0uDnr0NM/9D7+/c2cACpm1AeljCxxAkuooqeHqwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4474.eurprd02.prod.outlook.com (2603:10a6:10:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Sat, 30 Oct
 2021 22:31:41 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4649.018; Sat, 30 Oct 2021
 22:31:41 +0000
Message-ID: <e84733ca-ce46-9f4f-e082-f04c18301389@axentia.se>
Date:   Sun, 31 Oct 2021 00:31:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] i2c-mux-gpmux: Support settle-time-us property
Content-Language: en-US
To:     Horatiu Vultur <horatiu.vultur@microchip.com>, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lars Povlsen <lars.povlsen@microchip.com>
References: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
 <20211028125341.2457171-3-horatiu.vultur@microchip.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211028125341.2457171-3-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OL1P279CA0006.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:12::11) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by OL1P279CA0006.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:12::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Sat, 30 Oct 2021 22:31:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18e686d-31e5-4f35-e2f1-08d99bf50bb4
X-MS-TrafficTypeDiagnostic: DB7PR02MB4474:
X-Microsoft-Antispam-PRVS: <DB7PR02MB447444DB6489F7242C24C912BC889@DB7PR02MB4474.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5W0FgXy5LWisvF0sxfGZjmadDrz8UIE8GdE+kK9sYMXNOFczOr+1c9rPPg8/Ri2Cj4S4Tq00kvPZqFvzLRRCtex8tuhUhLcms6eECJbR8WfpyQX0q482xbeSDTQKOLW+WMO4P7RHPDSoSG9sn3hh1rUxcWlnwNPq134cUkPSPXoPQrwIW3iK3VsgzdSTQ62f+sbv6NEoGZIKgW3Fs2VsDrs6Q82uutaEN4I8tNGWxxOmc1zOEbrnQ76l249g5GWNzrI0Vwq5lMX2KFILjTZRv/joZbBq/74yvyODIc15Agx95E1jV8Le3vWyN0DIBLoMhsc3LwK4ldI9NajhByaIFjOz6KQjUfsDaK3Cz4V830Kd11oqLQmZfBOXr27xYrjVBo07D75OGKr+Bp/ZXvQjy6KKmgLxaCIXCHlhgLLNGSdaiigkDRWDZrotSE7EjoTNNM8qIH34BYT/HtX3W7bJ5nLtOJvryQTdxuH00i9ns5SB9g6Idct0WgEzDSdwMmO6bN3j6/7G8ZIYvCwyI1LYNVXzwtIHc00uHVPn99mX0dhRBcBc9+6JcP7zPMZtakwqyGKHAI/sGmuv31PqOajhFtLT9ZAhH30s9MFnJ11GHnVGMecfR4wbOL75HOo5jnDTFyUHzA5d6yHJfAKiKgmsShtWfhDLQS25EiMSexguP0iypV0PzkN+N0NNbfJW3iBSMms7OEXdhVkz+vyp2xZnaFuHXyjJVd0LKEF9p4Uj50=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39830400003)(376002)(396003)(136003)(36916002)(66476007)(38100700002)(66946007)(2906002)(186003)(956004)(508600001)(6486002)(2616005)(53546011)(4326008)(16576012)(5660300002)(66556008)(316002)(31686004)(86362001)(4001150100001)(83380400001)(8936002)(31696002)(26005)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNQZ3lWT2t3K25XZ2RJTlVXaC9aOFZxYVAyTjR4SjZlZTBMQnNvOXdtL0Vj?=
 =?utf-8?B?eFBlUmhCU082czdzb09OejVob2lnTE85aXBqYkRkTnpKWmdZK2NKcTRJUTVT?=
 =?utf-8?B?UnR5QUhMdDFPeWhyWWE3T2hyS3hDMG1xeUZkaG1GblhvMXdTWnJtSWthTkZJ?=
 =?utf-8?B?ZnVYV1ZKSEZ2K3o3QkRVdUxkci9IQk03ajVQWnQxU1p5Ym5SQ3VMUWc0NmlV?=
 =?utf-8?B?VW0ralpnZWtoMjJHamxPRTc4b0dSTU90K014NFloZ24zTDB1SmJRZ0lOWUoz?=
 =?utf-8?B?UDVYTlJJa0I5UzB6YUNxUDZjOVJEc1ZySWxKd1VzMmxkSlhNU0Q0clJFL3FJ?=
 =?utf-8?B?dWViV1c2NjY3anFIbFErNXk1bUlPODk1cEh0aUp4eXRHekROdzJTMEo4U1Ns?=
 =?utf-8?B?S0tVU2dVaVlaWjRFZ0YvMndKU3Z3QkhRVHpBQklMbm1XbzdPaGRVazd0ZDkv?=
 =?utf-8?B?ZnNidndVLzlmNW5aZGwzeE04UnA5OUU4b1lEK1BFMU5YMXYzbnlvOXhtNEha?=
 =?utf-8?B?NnpZM25ubG5OQjgxK21HaUJaaG0xenhndnpSdkFkN0p3K283ekNCajc4MGc3?=
 =?utf-8?B?SFRnaWl1Zy9QTFUrUE52TkRJSE1jTExPYlBiak0zYXgxL3hkVUNFVzdaUXda?=
 =?utf-8?B?UnloVERlNlJ3eHhZQVVOc1p1bjg0akM3aCszTmRKTURIRnJMQTRPZExCN1dS?=
 =?utf-8?B?VVVVczU4N3NKUFFCTUVubjBOUVVUSU5SRk03L3NRUjhmTTFVSUU1SHNUcHd0?=
 =?utf-8?B?RFRCWngraG1CSzllWTFmVllvVjN1dk1wRWk1NWVXSWRVeFNoZ01hbWNnR1lY?=
 =?utf-8?B?d21nWXByMlEvbnNuZDE1cFFtNmtyWHE1M1hJVU9paFV1RmY5b2JxdTFsRXFY?=
 =?utf-8?B?U1NIWDgwUkxnSjZ3Q3dlRHpRYThFdmZUNHlOYjlVY2pZY1I5SS8zQnNUaUZl?=
 =?utf-8?B?UU53Z0xVSXU1VGsyYUNLUG9BSDIvSXZtTzljZkpTWjNldjA1Z0lBR3JoR0J0?=
 =?utf-8?B?Qlp5cnh6c1lZTXJORW1jcmdVZWVxSWs3NzZlZFl6WW5KZmtERTE4cndaNXNz?=
 =?utf-8?B?QkJPUVY5N3UxaWFPa2J0QzBVb0gyUDZzMWowMjVlVjh0NXpvMGVCUE91U3Ba?=
 =?utf-8?B?RWl3QndSb1NVRHRzVy8wem0veC82UWcwYmlBZm9ad3FjbTJ6Wnc5ejBGM2RV?=
 =?utf-8?B?WDAwRmQ4M2V2RW1oTng5ZTR5VVdmOWZPTVFnWVRaRHF2Ly9vbkxMYk44aVJx?=
 =?utf-8?B?QWxGMUh5aEtrWkZRQVVidTRlckJvd1AwNWFUS0h3WmxmeTFScGhwOEpabjVv?=
 =?utf-8?B?a3VDMG5uUFg2czhnUk5lemVXODR5dndJTkpWZEU2a25BUDdiZCtxY3lYWEx0?=
 =?utf-8?B?U1ZPK3lHNTl0eW9sSzlLN0FBMTRieHhmcEp1NWVLVFNpaitQUEZ6NzB1MWdN?=
 =?utf-8?B?c2QzMWNUNmgvNjYrTnBkNGpRWWpXdE9hRm5WVFppZkJHOFlReVAraXJDenJU?=
 =?utf-8?B?UXlyRmkwZ1FPNDhnWDJ0UWdZYk9nV3BzZTlwM0ViWXEwZ0NZQlB2OGFnbG9R?=
 =?utf-8?B?SmNZaDVrWmtSa2JMWjJwNHJrSjg1YjlGY09KSmlWQkprZU42dzFnd2h2TFJG?=
 =?utf-8?B?RmpidGoyS3BRbHZhbTB1Nm5UcHcwRHhOUWNpcjI2NUZOaUhIQlV1NHBoSDFn?=
 =?utf-8?B?RjVsb1dpblZ3Uk5mRzdoUXlwTDFzSmRKZTJhMiswdFhuaVN4aHFIWHZVaFJE?=
 =?utf-8?B?VGhDQ3hzWFhhTEkrSlZZR2VLKy82amR2OWJBZG5XdFFtYVNZSXp1U1FEWWNl?=
 =?utf-8?B?U2UwdS83YnA3ZmEwVGFzclZMK0l2ZFJhMHlnZWJpN01yQ3E4Q0ZZdGtJSjJC?=
 =?utf-8?B?TzEyTUFsSHU3amF2Ymxodko2WkhjakdxTHAyR3FGVHlZWXN6cmk1QVdPeVdZ?=
 =?utf-8?B?YkZ6SnhDSTBlOEpmLzdLcjBySGpqOFp4b0ZUdWw1SEFrcGpheDhuTkhNZkxx?=
 =?utf-8?B?aGxGQmdFdXcrVncxd0MxWHpGUXJHWXg0Y0FyNkpxVlp6SmlYcUNVVVJ4dm9q?=
 =?utf-8?B?RkNrSjB3NHN4b2Mvcmp0dHVZazFUWFYwc3czeitaWDA3Tk1Fek9idnhkQ056?=
 =?utf-8?Q?27D0=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c18e686d-31e5-4f35-e2f1-08d99bf50bb4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 22:31:41.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENif/0bMaPO3kOsY9pt/OLXYAPmguki3+my0+L1pb+k4h6QsqjUX3PEC6lMsr6DS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4474
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-10-28 14:53, Horatiu Vultur wrote:
> Add support for settle-time-us property. If this is defined in device
> tree then add this delay to mux APIs.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpmux.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index d3acd8d66c32..569de1d8fdc1 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -16,6 +16,7 @@
>  
>  struct mux {
>  	struct mux_control *control;
> +	u32 delay_us;
>  
>  	bool do_not_deselect;
>  };
> @@ -25,7 +26,7 @@ static int i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
>  	struct mux *mux = i2c_mux_priv(muxc);
>  	int ret;
>  
> -	ret = mux_control_select(mux->control, chan);
> +	ret = mux_control_select_delay(mux->control, chan, mux->delay_us);
>  	mux->do_not_deselect = ret < 0;
>  
>  	return ret;
> @@ -89,6 +90,9 @@ static int i2c_mux_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(mux->control),
>  				     "failed to get control-mux\n");
>  
> +	mux->delay_us = 0;
> +	of_property_read_u32(np, "settle-time-us", &mux->delay_us);

Some nitpicks, zeroing out the variable is not needed (the memory has
been cleared already) and I would like this a bit further down next
to digging out the mux-locked property.

Cheers,
Peter

> +
>  	parent = mux_parent_adapter(dev);
>  	if (IS_ERR(parent))
>  		return dev_err_probe(dev, PTR_ERR(parent),
> 
