Return-Path: <linux-i2c+bounces-1326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3EA82E29B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 23:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24CD1B22142
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 22:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA621B7E0;
	Mon, 15 Jan 2024 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="GeILUdNQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2132.outbound.protection.outlook.com [40.107.13.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB91B5BB;
	Mon, 15 Jan 2024 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neWrLDfLuZGYCCpfp6EalCwCPh5Y65lyVBE4mbffDzqIgKouvD86ypy39JexA4w3SCeXxt1EJdIGa/mwmU70BQ3UM3GnK0FuamagfFjKwBnoH5mFX43xKV3WsHQEORD3EnwtdIIwcUpxt5h19oVFoIaUXR9LqM/GrUqZiByWqqUHvUZqWeZlfQZWfbMWxiG8zuQHsOf0je2ayZ7N+gIq2sIFxr/INxKiI5NXeqb1JSiqsyJ/dI6P0CahK8yIZmbdFtuidUFlJxE9NI92QVn/13WkjXpaLoiTmxOzDBizWCoJa8+h1AqJyuxeiV523U0Zr6yml8VgRxnpnmlzhC6hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QTl0O/f2VIvEidNODRaEcebBWX0rCI4I68ZXLsxDWg=;
 b=l1kucPMhbqYmBn4XqaktP0mVjbnSSpVHHMS2WgcJDyTc/5s+p7hbGzP4p9NqrRtenAaDRI4G6hyDZNbRsBDPO4/mSCRLjrZT7VLRQioG3VWHs39FXLctg6mbMZaYP73x2TDwe2F6nVypRBsz9wkLes0FoIHfppr4m/6Sbl6LWTIj75cTgqUs5uejxH/6StUVZKFzH/mzNDdtT1C4OYXxmRTJUJsjIH00v5TZO59z+6WZlIx0uC8BT1Zw00r82h1Z/X2bJl5T7HdnpCKwpGuCCSO+T6chqxo8Oqs7N/U3ujr0Jdj1HursSs6GtryXJvGfxnhrbWKTYnias0H8VAhnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QTl0O/f2VIvEidNODRaEcebBWX0rCI4I68ZXLsxDWg=;
 b=GeILUdNQbFLUjKKBB/Rn/LszSnLBO+gzA4eXLBWIOWgOmuAUJ5BfFb4r3bHoJLEfETenPrlnp/YdoC6B8GhW72ejq1fr9m3xZ1bfgZXV0dRGNEYR7hAZW/vcCOrbQ688qBl6ezWJAWenmPPzaBEsZWU6WwhA0L8Pr1YLdH1SH3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by VI0PR02MB10535.eurprd02.prod.outlook.com (2603:10a6:800:1b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 22:31:14 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba%3]) with mapi id 15.20.7181.027; Mon, 15 Jan 2024
 22:31:13 +0000
Message-ID: <c147ae1b-87cc-52b1-4ec7-684d5e7cc5db@axentia.se>
Date: Mon, 15 Jan 2024 23:31:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/14] mux: mmio: Add resume support
To: Thomas Richard <thomas.richard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
Content-Language: sv-SE, en-US
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF00003830.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:1c) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|VI0PR02MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: cb70fa68-84d2-4963-b4ea-08dc1619ae6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m0YZiRNLMrMocaIoLNxIeq31qLvuGArwGzit5a6BX+g/ar4UZsvcHrkR3MwJ7GFlg45zVIJov+4newfnfZtLhiXkYZtxaqMpHOS1CBiWWhdMQvG31XQJIxGufhIFitfCEuhzmUVD24uSyYQ0jhttciOwJuIgCsLVwefv3+QAbomoa70Vv/DheJs6rra4Y520UD5DEzViENJP4ekZ/z5e78d7ncEj1zcrrS6HMyLVt/Jjurb8eGIlM2D5GATBy1eHNEgmJXtXYCbqdsapOeJFKPwBpuMmUbcJilDUV4I1y8+GQn1wVjBp7hFKuU3qEqAo+iq9Ug4uGHhQuk10kY9a9NWzAi7WUp/ztd1NXlZNg0WUCy9CK0PS7SuST6CE+423PbmRkHPqHZc015730a4xQQbz4vNEa3TGl5W0wd50E0YzkNAc4BuNphbx2+78sBOTWakd/sxU3Di/o17KHRIBSbmMTKfJaF+EPeY8fAYNrMkxqeaBnIUKfVw0PICphzamDQ5VuQ+SZV8+GPrTdbmjCg/pOOJuMPns6ix5i/ZC37kZumHPTrIJCsBgQ9PMmZNk8cMoPyD3u2g1tz1qTlbkv+YFd2TfPdUmcMw7edwpSEn6rXKE3fdgQdfBYHiOFKldL/6R/kk4riweqH4gWAecBBrjkL9pcVFGwxyHgpIYm20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39840400004)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66574015)(83380400001)(2616005)(66946007)(38100700002)(8676002)(5660300002)(8936002)(6512007)(4326008)(41300700001)(7416002)(478600001)(26005)(6486002)(6506007)(921011)(66556008)(110136005)(66476007)(316002)(2906002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnVGRlU3Z2E4K2VjVlVjcGpSbmxnVE41VWRSTzkzUTdGVXhzT0ExdDk5dSti?=
 =?utf-8?B?UW8zZi8zZlgrMDdZdGZ2TXpzN0Z3cnNuWkJPc21OK0Y1bjdvK0pQUElGZ2ZO?=
 =?utf-8?B?M3pGWjJKZFhJdHk5bm5RRVhORS9mVEE1aWpSSEdkd0R1WjM5dHVqLzBnZEZJ?=
 =?utf-8?B?NnRkQ2JtYTVFanpIcVpkSWx1QVJJd1JQMEptZUM4MHlVRitrYS8rK28rdzVj?=
 =?utf-8?B?ZUMrdVNDVWVEUzNZZzlyM2UxT1NDeE5XaXRFczNIc1E2U0RmbjBIaTBydnVN?=
 =?utf-8?B?Ty8zQ2QrUHJjbFZIRXVoOXVqNnVrYzh3eUZMQVowTEI3N0ZKVEhlRUswdytF?=
 =?utf-8?B?ZmlORzZTZnpwVXF6T3EwZTZwSXZreDR1dDBsaDJ2UDhycjlqcmp5b01heTdh?=
 =?utf-8?B?TUlNVWhKUjBIaUt4WnN0cFMvbW91cytGTDN3U09OaVpXQW9lTG0vd1pvaDBZ?=
 =?utf-8?B?Yi9TMEpEZWY1RGJ0ZlNkL0FJbS9YY3RBSTJIa3Y4cG1PMEQwQlBIM3RlUE9E?=
 =?utf-8?B?NUFMenRSVUM0UTNaNXBDRzIwN0QvL3U5RGtuU2Fpdzg2UDNvQUFuOHlNM2s5?=
 =?utf-8?B?Ukl4Tmo5TmZiOEdHcXJneXh1OTRKZFlQR3N2SnRlUGF1bWw2WGN5dWtoWStL?=
 =?utf-8?B?NE5qSEdvdmdvZXZYTllTTnVYSHFRUFhVSXl3RE1PWEFWTVZueVVYMFE1WmY3?=
 =?utf-8?B?c1BROWlsemhKWFVNTzRJUmhROEpvQXBzUDFDMWIwdEkweERwbVhiTUZmYXd4?=
 =?utf-8?B?eU5TVytXRW9sT3pYbFNPWVRod3FKdXI1dVAvT3VGMFJpSFh6Y3Brdk96aE8y?=
 =?utf-8?B?bkMrSE5kT1ZFcCtGUkphRkI3Qk9IVlp1dGkzRWFHdUo3N295eUE4VExvaFR0?=
 =?utf-8?B?WE5oMEpCVHI2WEN0OGV0cE1mRkVQVU9NRGFJc3kxaVZzQzVEYVFjQUJFL3p1?=
 =?utf-8?B?bEtZeG81QlZIbTRYTlZNL0N1QktrRTFSWTNPVWdNWnZNQXJFTVBuZ20zS0dj?=
 =?utf-8?B?WlZhR0pPYW44T24rc0xMbnRGUUJlN2JBUGMrRjcyYzlKaC9vU2oyOXZteWcy?=
 =?utf-8?B?QnF5OEt6WkhEdjhuTWlZN1pQWjh4Y2FNNU9jSzBuVTloTGRNRHUzQVc5UXFB?=
 =?utf-8?B?TENjeVMrMnlOY1Fic3haU056RDhGL3dUZVozL21EVzNDMVEvMlpCNWdheTV3?=
 =?utf-8?B?YkY4ZTFTbzNubzEwM2JZK3ZHMFZBeHgzQUlEWTZJOVBsODQrTFVPQlVQaEdQ?=
 =?utf-8?B?NDJZMW9pb002SEN6Z0sxak51Nklqb29iRldWNTJMeDd3cEpBNHhGdkovVHpw?=
 =?utf-8?B?dkVpOHEzQStyUXdlSjZQeC9razdqUEhSNUUyVU5rRkE2a3Uvb21NaDhRZmI1?=
 =?utf-8?B?U1Rpb1FTYjU5R3dxMU9TaHgyMVpaVDdyWnNuZDIwY1JPWmNSVGUxd2VyL2Zn?=
 =?utf-8?B?L2VmZnpsM0xSaVdXR2QxMHZJNHRxRmkvSjVXMk9iSGRRT2Zac2lReDZ6RDFr?=
 =?utf-8?B?WkRxQ2JUZkRLaHdGb1ltR0xGbG9Ua1RZMlpHd0g5SkRaTEt1QXlLQnNoTWo3?=
 =?utf-8?B?bk1XY2t2RWZOclZ5ZERmTVVyYlV5THVKeGI5Um9NdWdreFgybFlDQm5QM1hN?=
 =?utf-8?B?L3FkT1YwK0ttTVlJaTV3UFJLbVhaREtRTEFoWUk0Ry9PUEtQSnNQWEhKZDJF?=
 =?utf-8?B?dExkUVJKNFhQWGVQVHY0NDRLT2lvS1VFdTg5TEV2VFlDaUF6RkNmM3VoWlJF?=
 =?utf-8?B?MGsvMnFOR0lPM2R6eStTd1lzcFV1U1lDSGd1L1Z4dEJEWS9qc0hEMkkyWm1G?=
 =?utf-8?B?MGYyQ3k3THpXTGk5bko3bzQvVUZUMHpmZjB0blgvYUh0Q3lJb3QrRHJBaDBD?=
 =?utf-8?B?RXlSRDdlS1hDdDEvd21xODJndU1VTWtsT2Frb0MvRlFJL1ZVbDQvZkxUQUdM?=
 =?utf-8?B?SWhUTkdMU3JxUUR5Z1Z2NEk2QmYrVE9Zb3I1azMxUVF4QWdJWnZEUzJXbUtC?=
 =?utf-8?B?TkVkaGpyZ0JjWEUrN3U5SDNxc0M1a3U1QkdwZkM5UzVRK2xKTlZXQ3I1U1gz?=
 =?utf-8?B?UnNTTU9va240Q1kwSlpyNCtMTnBVRGVNSXYwV3ZsbEo4c0tmVDN4QnNlWXBv?=
 =?utf-8?Q?YfpAVvwRYTuzzv5K842jzkoRa?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cb70fa68-84d2-4963-b4ea-08dc1619ae6a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 22:31:13.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhydkCJxfHzwjonOSyo0e3X3H5e+fm3TparmHQlrVViUiB56e5PPEalqtqJUTtec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10535

Hi!

2024-01-15 at 17:14, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Implement resume support

What Andy said, and please don't omit punctuation. Try to make it a
pleasure to read your patches!

> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/mux/mmio.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
> index fd1d121a584b..ab4ef195fc0d 100644
> --- a/drivers/mux/mmio.c
> +++ b/drivers/mux/mmio.c
> @@ -125,13 +125,47 @@ static int mux_mmio_probe(struct platform_device *pdev)
>  
>  	mux_chip->ops = &mux_mmio_ops;
>  
> +	dev_set_drvdata(dev, mux_chip);
> +
>  	return devm_mux_chip_register(dev, mux_chip);
>  }
>  
> +#ifdef CONFIG_PM
> +static int mux_mmio_resume_noirq(struct device *dev)
> +{
> +	struct mux_chip *mux_chip = dev_get_drvdata(dev);
> +	int global_ret = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < mux_chip->controllers; i++) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +		int val = mux->cached_state;

You are not supposed to look at (or change) cached_state outside the
mux core.

> +		int ret;
> +
> +		if (val == MUX_IDLE_AS_IS)

The cached_state can never be MUX_IDLE_AS_IS. Sure, it happens to have
the same actual value as the correct MUX_CACHE_UNKNOWN, but abusing
that is all kinds of wrong.

> +			continue;
> +
> +		ret = mux_mmio_set(mux, val);
> +		if (ret) {

If mux_mmio_set() fails, cached_state ends up wrong as it should be set
to MUX_CACHE_UNKNOWN on failure. Low-level stuff like this needs to be
done by the mux core, or things becomes a maintenance hazard...

So, the meat of this function belongs in the mux core since none of
it looks mmio specific. It could probably be named mux_chip_resume()
or something such. That makes it simple to use the correct constant,
and the mux_control_set() helper makes it easy to get the handling of
cached_state right.

Cheers,
Peter

> +			dev_err(dev, "control %u: error restoring mux: %d\n", i, ret);
> +			if (!global_ret)
> +				global_ret = ret;
> +		}
> +	}
> +
> +	return global_ret;
> +}
> +#endif
> +
> +static const struct dev_pm_ops mux_mmio_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, mux_mmio_resume_noirq)
> +};
> +
>  static struct platform_driver mux_mmio_driver = {
>  	.driver = {
>  		.name = "mmio-mux",
>  		.of_match_table	= mux_mmio_dt_ids,
> +		.pm = &mux_mmio_pm_ops,
>  	},
>  	.probe = mux_mmio_probe,
>  };
> 

