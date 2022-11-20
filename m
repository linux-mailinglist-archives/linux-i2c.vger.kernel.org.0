Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B809E6315B1
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 19:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiKTSlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 13:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiKTSlQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 13:41:16 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDF424BFA;
        Sun, 20 Nov 2022 10:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS+w4uQeZQ8hXJ5riYIDPHbtfbypv/oiRor7RQ38RWwn8buWAMx2qwGP3/tnAcbPb/zlXS0Zt++a9X3OE8kvf40FEFcera0YC2+g2Y4U1cHFtVVXauBSeCuGzEUhnFTJJfEUfSQUIM1y2z4rbQelDy9HwOleUEF3z8PoqD5tZEHqeNtzMk7gfG5R33o5VZHHwG/OpYr2I0mSWqEBfgdtDSj/U1lQzBJkFbB/w6aP2VpyjK1wYjM73pgdaBW2TwLuBDOOeMCxKgXrK12eSlJR31WNpRJ15Bvaq1kVZzp5LkRwoM49+f78RAbxG5sqvD0L08HATDCPno5RYPhs3OVL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JddZJqfFxE9DKmwTlm5mbrCnBzKKMbnIxbC6Kb1FnI=;
 b=dJfwPNXsGro5HyEhERLzfjS14nyko93vZ8FSDRXW77VQBbg99V8+uS0dyJ/LrWXYdqEcA5x2mezX1Rh7KLdLng5KgUHi9k9+8nO6ct1Bcau9gYAix6bMyRKD8b3YAz/fBM8em3imgI+OPgEhPCGMAgsyiV1nRBAs4AinKQgDCdBOfjdDFbaJ9M9t+jhwkMIAL4ET8YiY3R3icHvt8gVdgQUYcA58BjqkjustnbvXhfT756w5PtdqxDGpQr7cVGeqwxjEw2CkU9l+EkYf2e44ZqhMwpIxKGFkbgwGcbuHTmqkAjCECBnpt7cqmwav+g+Q8E4pROEQtNuWaayVi6B3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JddZJqfFxE9DKmwTlm5mbrCnBzKKMbnIxbC6Kb1FnI=;
 b=QLZGRDaZ8ZDHWUi2jUDiaFyamHXevrcL+Z0R7NIurxFtVahgNj4TIOmKjJ8jK5qD8tk4kXJMMVesdKVWuOWII53szx1O0w1jNVsTvi/Sy01pR+mmNwYWphVjj0LaL99C5Vis///FfX01tGClitKrLPN1eou9g2S7RZILNoGklQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM5PR0801MB3830.namprd08.prod.outlook.com
 (2603:10b6:4:7c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sun, 20 Nov
 2022 18:41:12 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Sun, 20 Nov 2022
 18:41:12 +0000
Date:   Sun, 20 Nov 2022 12:41:10 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 247/606] Input: iqs5xx - Convert to i2c's .probe_new()
Message-ID: <Y3p0xgsvyWLwzzWb@nixie71>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-248-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-248-uwe@kleine-koenig.org>
X-ClientProxiedBy: SN7PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:f2::8) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM5PR0801MB3830:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e4b31e-d9c5-46c7-ac45-08dacb26cc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HM2bwf9JLFba9GzRHnmiXDh2B8GA94WHwOOjLlVivH9DLGyrq3yTvHeF2T0l86soCp8ZgOOc9TunDwfaTAGokNDx2EVjGxGYyS+Gkrzh7s6ffAlvY/NWBMjJPsOr2j8CuZ8NhSF2nJDEKS2xLIUWxlUKoT9iIOEHIQwQQv98GnrT+mNA925w2Td+TSzNwqMV5PvWmw72pByUvfScRmowYEaC7TYYDRI3ncrq1d6SUqUGAg9wRbonnbGbyh3ntanSmmIBmkvq7TowYJFKr3GVYEgE3rO7kR7TYda/10WBkgJexKG6l6bmDfwPvomDfcZZzsf9aao39lyVj3R12qyws6nIkwinj3kEGRN78uewh8vhz2BQU/QZSx9/+lZ5KQCuXJjkNYkeYlD+Q+EnZ53KhTsqOUqOuWma8gL5kh49mOJDPEbZpImOef4KaKAcYZslmMUwp4yiW3O6PK3RXv6ZB7lv1zocYJUkI00iGv2ine5kSN/0+fmPMeWjoBfdAFKTltk1oxltkGJkpiJrvD/pQvKTBxPrJ+xHGw9GeAJNHBUl+s+wYLOX/aqUwQSJv8lADDUPwzzDS6aQHMT1zWRquqINkp6d4QzA56Od3nCcmlOc7k/IqOOq4hrL7NgYdjL5Xo3mDRTa2gyj2wpXXCs6WJgEj/u0hJDV27JKMYHQnEiKtWw2dDDUb6EYLqdjsN3Nr6UNbu+olkhQd0v7cE8T9M7oKSHQ4EktqRjJAkEEDLvX4oLKvEoWuveZT9UxFZnS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(136003)(346002)(39830400003)(376002)(366004)(451199015)(2906002)(8936002)(7416002)(316002)(6916009)(5660300002)(41300700001)(54906003)(6486002)(478600001)(66556008)(66946007)(66476007)(4326008)(8676002)(186003)(66574015)(33716001)(6512007)(9686003)(26005)(6506007)(83380400001)(86362001)(38100700002)(42413004)(142923001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iDKVO1bfzGnOEpYqCjOGg3dkwCsRrRgHrqp6TCMKBYqrpSW43yJkyaQbOV?=
 =?iso-8859-1?Q?oXErgqJfjHeSVSNiVe7y49OMgBD+I6AUrqh5T2K5Y8wdP5Ou8fBz+nBftD?=
 =?iso-8859-1?Q?Q9Fq7YrvOJBoqdGsPBCrh3I/4oLMr4zTKvDF6NdyPXBqdzltm+HooNfCcc?=
 =?iso-8859-1?Q?WBuJ9Fw+VG83UitbvyP9+TYTplbJQUM/b7P6FPYi98KZs4yyMxfA8M4Wx+?=
 =?iso-8859-1?Q?GPNQ8GzutvaFDxHe95Ix7wj7CtqivMDt1RgbUIiPZSQHqDDZKEvovuPyCr?=
 =?iso-8859-1?Q?SWzbPDO17aEzJjPVujp+g5WriuHNi2xLDa2dRosY2UaUYVv16YZMTeC9gU?=
 =?iso-8859-1?Q?MPOLW2jOglrqKbw3D/cA/EaPGwEHeLeqoRarbGo74lJI2T/cAkXq7mE+Pq?=
 =?iso-8859-1?Q?6hk8xjhe+qzVvuRQjtRCctLkauhPvGfmvp0TKBtzERta2J2oGMQep7uhU+?=
 =?iso-8859-1?Q?cvcBD1X3W6x0LYndT/3oH2iRA1hsA2HnmXAnHw6FP7xPiRfk7sl1qj2BT2?=
 =?iso-8859-1?Q?Q/byhrcZjIKvOCkHoqn4vs6F34A/Jo6ixfkiqOm85/yKQuus1/FobKQ5To?=
 =?iso-8859-1?Q?fTE40ESUPDBE68TMzfS675T3KdRoXIhTMHZDGm2WwlPqwhe0Kakph6ZnqY?=
 =?iso-8859-1?Q?0h9TDcenscbR/4iIHA1guT7ihgS1bhLj1ZPC8kq73k0KWj5xvMEOMcbyPz?=
 =?iso-8859-1?Q?5awFb01h1DfhltMM2CGwyewHf4C3kiduWk94jlOSFFgWtiADS/bqJCS/4c?=
 =?iso-8859-1?Q?Ie9QdxEIjAtwTTNoW1U7kciK4F8Dp1L9aEnbgAsyhwdzRGUpDl5Z/otcvR?=
 =?iso-8859-1?Q?GwcBtouEYJXenFmJdN/bqHECa/EaogjXTgy7ek9y05fNuMj6rjr9o4tVvu?=
 =?iso-8859-1?Q?Xym/u6rzWQ3psrgIe6LcozCY6B2NY5/hHNbYsO5a3ueA6mBdDZbsuJLDWt?=
 =?iso-8859-1?Q?QupN03kdr63XtWu1P1GEvKwZWIDo/AWdnv7eEDjLOoZDfd13Af0IMxhkx0?=
 =?iso-8859-1?Q?hPY/u3zkI+1gO0wmI///zYYvXlqIN8WPCwu7qKYPoSeJDwWQVtsx3mSfvG?=
 =?iso-8859-1?Q?qSoR8Yi+14j/welGSEqio4pJ1+S/x1qAndXgSSLJBssGSn4LrAhhoKm0Mp?=
 =?iso-8859-1?Q?3rCBCMgahyWiBfxWumg6bSObeSYLhlg9sKxmzVooTp8krQqvjVkUy0isCl?=
 =?iso-8859-1?Q?0SdlkxdqslI/ElUrQzQNY2eNOtk0auOz2OqGxhgka+SK/LOKf1zLWK1zn6?=
 =?iso-8859-1?Q?G0NYynxO9zGQZ+9vx+B3PcNGb1Qk9umxo5g5qPBhoN1F5BVLA6udjV9CN3?=
 =?iso-8859-1?Q?gCx3C9Uoe2WNr/9sNKHb7IXqPeAVuPlqSijvJ9Fy3f9zUTsaAXQdoqjj8M?=
 =?iso-8859-1?Q?fliR60P/i/0mfIKwF6qBAWqFIyTVhkDf5TCMZP162MgOH1YvTW9aN0Chsc?=
 =?iso-8859-1?Q?svLOq7JIFehqZXxTm6ip5YyBwEANgksB0ONAAmYIh27wlHncPNaHWNMmqv?=
 =?iso-8859-1?Q?UAPJimsp6sLJWau/EWuQkisqStW8BeAKFejrnv7dhv1aIiG48s0CpxRcBM?=
 =?iso-8859-1?Q?8S6BCxQWoheKwb7fcAyryJOU7aBzfJRj+HfZQCVYaiRs6NTRxq6Jd6dOFh?=
 =?iso-8859-1?Q?YL5xQ5THoC1ITI2RGZM0e0DcryFg/d4y7p?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e4b31e-d9c5-46c7-ac45-08dacb26cc47
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 18:41:12.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfcwshEM6qJ3kf9SvAfsBJ1d48w0/CyQfw1hXa7hga6v9Pakb+VRpXCdVpCweWUhn0mu1jCopKszWu3dwW3O8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3830
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:39:41PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/touchscreen/iqs5xx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index 34c4cca57d13..dc3137a34f35 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -1019,8 +1019,7 @@ static int __maybe_unused iqs5xx_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
>  
> -static int iqs5xx_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int iqs5xx_probe(struct i2c_client *client)
>  {
>  	struct iqs5xx_private *iqs5xx;
>  	int error;
> @@ -1094,7 +1093,7 @@ static struct i2c_driver iqs5xx_i2c_driver = {
>  		.pm		= &iqs5xx_pm,
>  	},
>  	.id_table	= iqs5xx_id,
> -	.probe		= iqs5xx_probe,
> +	.probe_new	= iqs5xx_probe,
>  };
>  module_i2c_driver(iqs5xx_i2c_driver);
>  
> -- 
> 2.38.1
> 
