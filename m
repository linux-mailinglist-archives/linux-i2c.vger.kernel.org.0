Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E5177FBFE
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348379AbjHQQW5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353722AbjHQQWn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:22:43 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2106.outbound.protection.outlook.com [40.107.249.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C9C30F7;
        Thu, 17 Aug 2023 09:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U05G2Fi53QMPkTr88x4U9SmJX3bQjp5OB2CxHNyauohvZCAHOSsbsyHa0uYlWDhpU90mHgeApvdG+2vdh1jBgXEAQZ38iMHKl122wtXzMYCvxXMkkjDnScsiN4XEN2jAc7paAmZGJyYbbpLQY/G0WiM6cxat23XhfUyP+arbLde1lyTm24QwAKC63ErXic8Co53Z4beplpM1Evm/YkN1WmkYKc/XmqnMzRWaDXi6VydEy3i5F+rbau/Xt98cQOnkvBz5+1Y4wSbZ2hfG0EjWlg5yhcHyb3c3wzviSnvXs59XMB2zxC9HLIvaFCmeE0oubkZaCVCp5+6BsLANp0o7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phn/eRimzpqrVoAruza13m6PKTezfaQEihp5g/szxYE=;
 b=G0cHV3alOJAOo+QWMyuU4ROoJCFxJivkHLQ4c6ymS5qAE6xSwcYcfbtNX01s2ROH6nkOC1b2M06EqewMJaRzCJSpoyPR7E51BIVCR7uzhj98KJrQ2KLXSoZo1FgckSW9N9hQdIoUNK/pg2pKvX8/Dew9JEvRIFq/sXVZK/0GML9RlU5vuQGSO7zXXDyxWWDkGrBNsUBbd0+iXYMLiDRWOeKYW0XAPzzI1Le538Tvck4FwOTWF/T5Ju3fT7KGEXbhqqYoWg7sfJUlNq9CC9N1jusyQzMlYmbMp1ihwt3Bmo2BY+YOBCd2iJHFJB/WJemymMvndIbPFI3eQ0foeAUZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phn/eRimzpqrVoAruza13m6PKTezfaQEihp5g/szxYE=;
 b=h7JYYVdSHbsyCNIzRnVgfCcIyUTtyDRr5cLy3ItqRsNe+rDhSLx3hjMQZezW/gUv1jZy47NOAXafxom1EdplWbLJjLCKwxfiFGzl8aCyHLygTFjKxEkChY9k33BMAd4VimfwczZ0e1FC1OogRgp1Q36wHMOP8jOEodfQwopBRAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7318.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14; Thu, 17 Aug
 2023 16:22:34 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6699.013; Thu, 17 Aug 2023
 16:22:34 +0000
Message-ID: <1a16242a-36e8-6e12-1ad6-31e8e984b3c2@axentia.se>
Date:   Thu, 17 Aug 2023 18:22:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Content-Language: sv-SE, en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     naresh.solanki@9elements.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-4-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230817071056.2125679-4-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000000FE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:b) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 239f6c6a-dfea-4991-3ed7-08db9f3e29a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSjtWxg8QpM11RHoOORzrChFM8E45UO4J6XsNDDaoQKq2zfF2ZY79Y+BCiAyOzWaL6RCdFu2AbO2QAdN4aSXZKzS79Zct9tncmciP9dSGx8Fdm65m8q7vAabGX4ItJhiOoKSNSC7DZ1sZkL4TM8xwZ7ZfrrEVf4qo7qvXxazgvq5oQgf1EOk7HO+IjN5sV8ubxFJfyjtElyDDeGpKXjOhKcaBOM9+RnMYkHRmnk4q0Xop1Ln7DW3yKbIaW5r3yndB3hhMjj7Ck8Sro7BqxiT5A7rSFJ0vHka4j+h0Ze0YcxLrjNf2sZmwp29YyUVB/tGMVE195TR67fZ0nBeGJL2G/Q6YsIBdFtG1UrLU8j53qu5oNfFyYi6/X2rzyISnpnzqMIUP2S20VBpeM+K+IQeY7qsiBCzxo8R6GzjCRm2zSoS8+IyZU4gJSOyAk0yfsROjTxS7Ly3ReFY3FUmHhwt4754QGxMgXP3fnN7niEVDPGNVhsvgtgFXVXmMoHE/F5lNx8f0Y4/u6bXXh3FfnaLOxbxTigSnmSoXaWGdsG8KOlrlidTgJzi467pcojkYN3ssrp2kz/ac4cW9sPouteKWXzmU27bhAi6Qs5HdfxkXengROurvO+yDOIM2Ej8BPCSbVaLYrlLSU6J8q6FjiHvFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199024)(186009)(1800799009)(2906002)(66946007)(6916009)(66556008)(66476007)(5660300002)(8936002)(478600001)(6506007)(6486002)(83380400001)(4326008)(316002)(36756003)(8676002)(2616005)(38100700002)(26005)(6512007)(31696002)(31686004)(6666004)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdUeDd1RkluTVRNWGtvZDd1MGFSdGxxOEl4Ri8xQy90RGFVYVBMTDVMOE1v?=
 =?utf-8?B?dDRIei9wc2JVdGhmMXdidGluZjdWc1pNRzRoNnBieHRkajVEbFZFeVg0bU5O?=
 =?utf-8?B?bDRsZjFMRXZ4UkNaMTR5ZDRrNkFXeEZURUJwNzNoRWFHS2xNMGdPQkQzMnFP?=
 =?utf-8?B?dytUaEhUenBFbXRiL1NFNjh3cGl6ZVlWcjVqSHJBWmtDZC9XWU9pZTRVODUw?=
 =?utf-8?B?Qlc0NE1wdXdWTDIwcEN5TitGSzJtRmhiU0dSaDhMYXA5b0xXdkZ3ZkFmcHVB?=
 =?utf-8?B?UTdLZm51UWhwdFVzQ3lrTWgwUURjZ2ZFME9QVmdEYWVESktMZXN0ejBWVnJC?=
 =?utf-8?B?dGtNajFsQU9jVlAvbTJzZzVENWN3aVZCb0xLSVJ0eEJFWWpjYTJNU3dRN2E1?=
 =?utf-8?B?dGdmUGI5MXhmcmVOdjBVazQ5Rk83dGhEazFBaXFXQXdPOHAvQTZ5WVdPdGJO?=
 =?utf-8?B?VE9aK2t0b3NReHNTbkZ6Yk9iWjRsQ0s4eGNaU2tmb2lMbWJramgxU3ZKVUM2?=
 =?utf-8?B?MjFNWHdWTU5yTnJ6L2ZrR2EwVk9jTUVpSVR3ZEhMM29LZG5Jck91MTNFWU1j?=
 =?utf-8?B?dVVaRlA4eU5hQzJQRGhsazExZWNmb1lDaDhTS3dtWWovenBjRW96UzdFbVhU?=
 =?utf-8?B?NzBQQ1FGclZuOFJNa01pN09uT1VJRFBZR09zZjZybVpHdmQ1b1Jva21IYUlJ?=
 =?utf-8?B?VjJnUkpReWhSU3NncnNaRnBxbnJyOHc5N0QvQ3djWVl5ZitGeDVjWWJPcFBv?=
 =?utf-8?B?eHYyTGNEOUN0WFg1T00xcjV6Z2xlUDA0dVllWlJVaEZzVHlkdHAzMHNLd0JQ?=
 =?utf-8?B?N2lHUi9jUDErN0Rad1pPVUhMOUZHQjRtektZTmlTaEZXcXE4cnNHTmVreGVZ?=
 =?utf-8?B?Um4wNWhMMFBNVzZzcm9QdFZNZmhncExYTzZOdFdVdWFJc3JOdHZFNjFoN2cr?=
 =?utf-8?B?RjNuWEpOeEZMWU9XMkVzWTdudHQveWpTalBWY21meXMyYUFwOVJDbHJlRGNI?=
 =?utf-8?B?QXVGYlF1RVp5dFgzR0Z1cy9ySk5jNFVrM3pPTFlmLy93azdvbGVieWNiNHRJ?=
 =?utf-8?B?NTFNY0FVa01MWjU3NTI0dTYrQkIzdDdoSGtveWlVcm5FeVRMTGZub2xrQ0hs?=
 =?utf-8?B?c2lONnFodGhMRmg3UFVKYndicW94WjZBTERaZFgrSjZZdGhVMkNkT0RyK1A3?=
 =?utf-8?B?NitFbWFtN3JycFFCbC95aTJVbGNFMHlia2QyaUpBOHFLWHpJNzFTeVpFNjNL?=
 =?utf-8?B?NTNCMjd0Tk9yQVM4N1BWNkxDalRMYlFJVGZXbWVsRGdRbk90SEVQWUdsSTBn?=
 =?utf-8?B?ZkFJdDhibGFNSnpIRm11cVo2T1pqbVdiMm9TczgvdVczbWt6eSt4Wk1oMWd3?=
 =?utf-8?B?OTNCMVV2NzJKUE5LNFlGL2lJNFppbG1UZmQ2SU9MVDVPYXJEaDBuUTNLazVI?=
 =?utf-8?B?Zi9QcElDNVR0RlRmdzh1UGVjaW1IMUI1ZVVpN3lNb2w3Slc1Rkd5WmhpWGlz?=
 =?utf-8?B?RVNLVmRxNVl4eTdCRExmM1Q0TStxL1FCcU0xTzcyY1hWcVZIRUhUNkFBcWh5?=
 =?utf-8?B?QzdOSHMvZDFJNWhzVE9GMnZJWWZCUWRuVTYzM3MvZXY2NFpGRmNIZ2ZSc1NQ?=
 =?utf-8?B?QUpGZWQwTzJWaU83ZlVrdkI3emE5bjFNM00vNWExeDhaYWZxNG80MXZ1OWZw?=
 =?utf-8?B?dHorWUVwcDFVY2J2bnpIQVRvakIwbUNORVplbTlYTkQ3NEFvWDNvTERyd2Jm?=
 =?utf-8?B?d3pmZ25xcm1oZW9DRTRHd09maEc3bFFFb2I5UXVQbjUvQUpTRk9yTUlOUC9q?=
 =?utf-8?B?OWZscWtiNDB5OEc5S0F6YVBMVFJrUFJIclpSVE9tOHNQeFVTWXdhY2Q1Rmp2?=
 =?utf-8?B?UFk0ZmU2K28xREpzeEVVY2llTkdPYkZjZDJicmhjclpOUmczVG5VWGhiZ3dw?=
 =?utf-8?B?NW5mMnhsOTBnaWhFT3UrM2hXWWhlUUlrdmg1MEQ1SW5XdmdKMUdVVGdhTFNo?=
 =?utf-8?B?N1pjOE5zK3FCRkxiS0g3bEYzU1hBSzI4dlI1VXRKZTFXVHFENFE3cTZMWUo3?=
 =?utf-8?B?NXF6OTZRdkwyS3RJU2NLWmxEcHhBZ3I2Nlc1YXJkNVFIOHlOU1plQUE4OFdm?=
 =?utf-8?Q?DNXojDBZ25aUSckFpfZwCRzsG?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 239f6c6a-dfea-4991-3ed7-08db9f3e29a6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:22:33.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kwh+V7bI6XrANmvIow1YpA2yVj0w+3LdJl59hjav6S6DZPjkYXZtXzUWY8DXcR6R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7318
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-17 at 09:10, Patrick Rudolph wrote:
> Add support for the following Maxim chips using the existing PCA954x
> driver:
> - MAX7356
> - MAX7357
> - MAX7358
> - MAX7367
> - MAX7368
> - MAX7369
> 
> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> write selects up to 8 channels to be bridged to the primary bus.
> 
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
> 
> Tested using the MAX7357.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Acked-by: Peter Rosin <peda@axentia.se>

/*
 * However, if you find yourself doing a v16 for some reason, please
 * update new multi-line comments to match the preferred coding style.
 */

Cheers,
Peter

> ---
>  drivers/i2c/muxes/Kconfig           |  6 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 64 ++++++++++++++++++++++++++++-
>  2 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index ea838dbae32e..db1b9057612a 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>  	  will be called i2c-mux-pca9541.
>  
>  config I2C_MUX_PCA954x
> -	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> +	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>  	depends on GPIOLIB || COMPILE_TEST
>  	help
> -	  If you say yes here you get support for the NXP PCA954x
> -	  and PCA984x I2C mux/switch devices.
> +	  If you say yes here you get support for NXP PCA954x/PCA984x
> +	  and Maxim MAX735x/MAX736x I2C mux/switch devices.
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-mux-pca954x.
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 0ccee2ae5720..968111442625 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>
>   *
>   * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>   * chips made by NXP Semiconductors.
> @@ -11,6 +12,12 @@
>   *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>   *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>   *
> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> + *
> + * This includes the:
> + *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> + *
>   * These chips are all controlled via the I2C bus itself, and all have a
>   * single 8-bit register. The upstream "parent" bus fans out to two,
>   * four, or eight downstream busses or channels; which of these
> @@ -51,6 +58,12 @@
>  #define PCA954X_IRQ_OFFSET 4
>  
>  enum pca_type {
> +	max_7356,
> +	max_7357,
> +	max_7358,
> +	max_7367,
> +	max_7368,
> +	max_7369,
>  	pca_9540,
>  	pca_9542,
>  	pca_9543,
> @@ -90,8 +103,45 @@ struct pca954x {
>  	raw_spinlock_t lock;
>  };
>  
> -/* Provide specs for the PCA954x types we know about */
> +/* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
>  static const struct chip_desc chips[] = {
> +	[max_7356] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7357] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +		/* No interrupt controller support.
> +		   The interrupt provides information about stuck channels. */
> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +		/* No interrupt controller support.
> +		   The interrupt provides information about stuck channels. */
> +	},
> +	[max_7367] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7368] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7369] = {
> +		.nchans = 4,
> +		.enable = 0x4,
> +		.muxtype = pca954x_ismux,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
>  	[pca_9540] = {
>  		.nchans = 2,
>  		.enable = 0x4,
> @@ -177,6 +227,12 @@ static const struct chip_desc chips[] = {
>  };
>  
>  static const struct i2c_device_id pca954x_id[] = {
> +	{ "max7356", max_7356 },
> +	{ "max7357", max_7357 },
> +	{ "max7358", max_7358 },
> +	{ "max7367", max_7367 },
> +	{ "max7368", max_7368 },
> +	{ "max7369", max_7369 },
>  	{ "pca9540", pca_9540 },
>  	{ "pca9542", pca_9542 },
>  	{ "pca9543", pca_9543 },
> @@ -194,6 +250,12 @@ static const struct i2c_device_id pca954x_id[] = {
>  MODULE_DEVICE_TABLE(i2c, pca954x_id);
>  
>  static const struct of_device_id pca954x_of_match[] = {
> +	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
> +	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
> +	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
> +	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
> +	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
> +	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
>  	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>  	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>  	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
