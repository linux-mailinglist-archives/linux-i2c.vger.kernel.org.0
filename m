Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695A259DF7B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 14:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344264AbiHWLfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 07:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346222AbiHWLdR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 07:33:17 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00113.outbound.protection.outlook.com [40.107.0.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6C9C6B6F;
        Tue, 23 Aug 2022 02:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTbm5nJJu5Neub5SMZzKs1GtN/6cNMiqG80nV5dedA1UaB0lWkU0PJeZ7DvyVs3RHqwX5m6N6hsin9TkjOGMSUJdKN8Z4VHXGJQ11XyI9hRDj+LvZpeOajFnQRhCxXAMjaa13vz/NUGkeVXcjyJC9vOLMmslLD1fQCttpq+Wk+EaRkNniS2medM82N8wVn2u9j5vZk8Kqp9c5Ghd6Ty2UbVQm2UWojlGJ+WdBCTdiEaMzhvxU4Oq0AMH6d1XQt8yAKpgMuwVz0Tyz4RBrvWO21FEW82d4SPyzJD+XQD5yOw8tetdZEGu5Kbk+XRLjQ85BQXg+fRxBg/03quJBr9xoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udy5dhfC5//KzSPXIdB1v0Yr951HIpZCe2N9LmwDUXE=;
 b=lCicIQ6qY8xqYg2pwtGhWyrLi181/KUf0TzoSHwzDHsNOZOVoWhL0DRvUeco0tPUrn/qqcbqIkcBCUT6mfIe6ehnW22mA96biH+jd6YlOpkEwju0uz719u5d+zDCd8sf9Cx1VDDsZF5hXkVgqDzmwIpyXt5Y1pBx+3AEzl6mu0riWp4jHdiDTNUB0kuxoMlyQljKVqR39m55AlNus1rOrbCbeOZ8ufhtmuLwUmZ85RECArRjJMCG6NPB7WVosdHNsaFi74tmgR1uqS97/ptjsge2GjDhyzl59mEcC7exz+GNycuZPMaX46/GD/dUbWiJH5HwXOlgpT+EWH3tb1OQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udy5dhfC5//KzSPXIdB1v0Yr951HIpZCe2N9LmwDUXE=;
 b=pNNP/ukKqVN+M4U4593ZcJfk+zyqYtrvg+Js4sl2uwbS8nPHfqGWZR0CEZUlU+n32awI085oCFVonCvX2EtamJFIR74lnVqYzgrAhwYlLWOgOEyfK6aXKXfCYV0H1vBf3xdstxKVZZ3NuULDuzNZ0r3+QUhVp3dZS2sDRDRisEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7078.eurprd02.prod.outlook.com (2603:10a6:20b:2e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 09:26:53 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:26:53 +0000
Message-ID: <19a22449-c9fb-1eba-9a47-3e3d340a13a1@axentia.se>
Date:   Tue, 23 Aug 2022 11:26:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] docs: i2c: i2c-topology: reorder sections more
 logically
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
 <20220822091050.47099-3-luca.ceresoli@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220822091050.47099-3-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::15) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 323ab08a-de52-46f1-ebe6-08da84e99d76
X-MS-TrafficTypeDiagnostic: AS8PR02MB7078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vzenU13wT6Lo57SYtHkRc27ojLvz/37ddaceDg/SWRG+VWQRfBMKETywqTOompg6fDtMPDA8xiW4sCnvZe6nDNonUO7WHYMY8skaUJJBRNvsWnuNpM8J6N76Fhz+51usVRclNN77aAvPdSdc+2/7PJBgInRj4XCSbQu+oWn0e6+WCcKbPrtZK+1D7kkiC2cGP7rBd3IxgosrlMTAzV+nYCFKN2wa4482G50BEqZUJ9uhw66rD7jW2Ezq3a7MUrWX4XIH+aI9xPP9jd0GylxSBxGOpe4AK0Yi9JeK7/jJiEVXi/cwYMSSK7XmCK6UfpQg/ggBxKiBve4QXldPgMyV7obOPeekznoAsU1uAiFYzQT7HfBXRsem1A3I6u3J5Ehl5nJMRk3X1URlZ1z64eSvc8I27Rb9grLySFsn69Zx+Yi6dCZamFcCbcOaa0ANfggojIDXfsFgMHOb3+uRF2+40Xh21mX5MQoGseasuZ0y4xb7+BII7b0MhIeILeeDQ4lGWsDIY+77mxUogkVoByPxvz3i+oqB4YVGymruV4DiSiUhvPf6AP7kFHJKtTTcy3GTA8GCyPKNBVAaMEh5yRlF446o/gfF+Whmg2z8LrFGxdvIdIHq5D1l7nLdbTuEkg3CzeDoqVrmOgz00dHJyJZziD9zxXyd7CHvnH/0iPjnKbLuv+MfTFOsRHMHZv7QT6H5n771rY2gJuuxxPqwplK9C4o2y7fO53l31Thcg7ieH1agm2+0LKtM7szTPPjfJalu8osdqpf0sjB3BCpU92SRwM3T3IewGxHa7Bv1yYLENaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(39840400004)(396003)(478600001)(6486002)(316002)(186003)(2616005)(83380400001)(6506007)(41300700001)(38100700002)(26005)(6512007)(2906002)(5660300002)(86362001)(8936002)(30864003)(31696002)(66946007)(31686004)(36756003)(66556008)(4326008)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xjL05tYnFJdDYyUWUvbm44ekZmVk9KcDhXRFhva3BoVGN2WnpnKzlpcHlU?=
 =?utf-8?B?WVBYQWZNY1VvQnlqNklpZ1laQ2hCL3R5NnlCVE9FRnJ4KzNoZ2FOMExQOVlZ?=
 =?utf-8?B?SjBEcnlSdWhrbkVQR2lQUDNpMWNoUzJDeTltY0JHa0tIaGQ5RUVZcVFaRXVQ?=
 =?utf-8?B?V0dibitVQWdiUytOa2krMmN3SlY3OU5WU0RTcERwNTcrMm5kWi9JYTg5dXlx?=
 =?utf-8?B?QTk2Z3RTWm9ibzBvV05jaW13RVVGK056bG5NazgzM1U0aHFTZUM1ck95WERo?=
 =?utf-8?B?eGRFcWdiMlozMTlmVXRKNzRUWmtLUGZDS2w3Mjlrck9lckhSRStGSmxDMFI1?=
 =?utf-8?B?U2VoSktUL0ppRGRONTR5MWdLSnR6UmpxOXMwWm9aazFibnMvNm5lTzFqakRF?=
 =?utf-8?B?NlV4OXMzWWtTcGQxWEhZN2NoaE9tMUhBdGdVbVdnL0dFQTFmQllSZFhUZ0x3?=
 =?utf-8?B?TjVYaGRxSWVMaUV4V0hGY0ZJaDlsZTZ5dUlWVkhoWWxKdXU1VnFtNGhnbkY0?=
 =?utf-8?B?d2VsUCtTYmhVUURhejhMd1cvZHhlcEUzQXU0b1JPQ2IydElDL1hVaGNMRmFk?=
 =?utf-8?B?MWhsOWhsZURISFpXRjQzYVRtd1NrQjllZlBWVnc4QzhjQkhQYlBOaUdLTmlh?=
 =?utf-8?B?RWZPZWlOd0RHRm9aZW9PelRWem50VTVaU2p4bmRKUksycGdxeFJMZEhxMHhy?=
 =?utf-8?B?MXUraGdoajZMY3poM09NTmxRZ0xaaG5FQWEwQUtZTThSS1NCZThxOGNRRTlV?=
 =?utf-8?B?SGtzUzdheXJxOEplQnZzdUJ3Q01ld2R3RzBYZGUzbGVhcmJOMjVRY05kd0RF?=
 =?utf-8?B?L1hIM0M3WlR6eU1scWpjbjVMODJkeWRxNE9FOGJWQjk4YlhYbncxTTdTUlFh?=
 =?utf-8?B?dTBjV05rbE9lQlg4SmNnWGJ4MDU1dHhnQzZjNytPNVNWY1dIRFowQ3RyNGdl?=
 =?utf-8?B?Q21EaWtvR1ltMjArR2d1dERRT0tsVHVCVS9XRVV2YmdDc0dvQVFFYThyTkV6?=
 =?utf-8?B?d0lsY2lWUjhrYTJRWFlpWFRhVEpXOW12OXl2WXEvV1l5UFZjNUJYNkx4ZktR?=
 =?utf-8?B?YytPcElNRjVlSVBQdUpUUmZUT3hheExMM0k5UFVOQzRGYnpLcGtud09uZkw3?=
 =?utf-8?B?NTZ2RVduQ2NneUhIcWY5VWdzS2ZQL2RrOVZyYncyVERLQ0lydkgyd1ZpMmVO?=
 =?utf-8?B?WmNOWVJ4MzdNVmFQMzFzZDIyNy9sWTZkNDhqaEdTYkdqbndWY25QUWZjVmFM?=
 =?utf-8?B?MnRuS3N1NjRicnRsbnp6YTBRTTI5MWgvalNFSmFxa3BQbUliMUhYWW90Zkp1?=
 =?utf-8?B?WHZMZ09YbXlwbHJDNUZuSVFIdFZHWkVjaldyZmU2c1ZWelI1ZlhoM0Vyalo5?=
 =?utf-8?B?WUxiYXFOM3E5R3lPSWR6SFJabmJMTW9pNFJZRkQ4ZmJaTUEvN3h5bC8rdWgv?=
 =?utf-8?B?Qzc0Si9uZGxzVlVhZWJQMjFzSXd1alkyU2l2VlQxRUZSdUtMSTZKaUttTXlI?=
 =?utf-8?B?L3dRK29jWkR2SHNRMUdrZE84ak9LVXF2S1pES21vVE1KTVF5cElvUDA0L0Zt?=
 =?utf-8?B?cVZwTG9IVkxNRGpPVDZCWGlKYjQ5RU9VMm82NVFyTExrY1pZZVF3RE1Ja2ZF?=
 =?utf-8?B?MHFoaUJDSWlDREYzM2ZrdnY2TFR3LzM2UW9tbmxsNk5oNmQxYkpyTDZWVElm?=
 =?utf-8?B?SGVNV3o4OVVQTUJFN3pJcDFsOEN3a2pJR1VhMDRQSjNnOHg5WUhPZ3l1eVdG?=
 =?utf-8?B?b1pBS3MrKzFjQ01wQkcwamZTeUM3bDRDWVVXc09kc0NlamovUHF2SHFFSkZQ?=
 =?utf-8?B?a1EyRzNXV2d5M3EyM3daVEphRG5Oc042ZkdiSC8yQnUzK05uLzVrc3FnN09L?=
 =?utf-8?B?M2NReHQ2aE14dDVQdkxwR0dvZHgrdHRWcWpJVjdzTGtOMUNPdHVXZ21JQk1y?=
 =?utf-8?B?MG9sQWo1SEtnMm94WEFKVDgvT1kyWlRna3pHK2ZvS0xxQ1RrcnRoaFRqYlpw?=
 =?utf-8?B?c24wRCt4RUpnbWVORWFSckdaQlFqamg0aXFCWkFlYXhSVE9xUlJkV1R3bDI5?=
 =?utf-8?B?S2tjWi9oRkk5YmdBa2VpYlV6SjArWGcySE9vaytuNXhySzYxbnFNR0ozamxx?=
 =?utf-8?Q?1FZkGyMCKyityy+oIoinCOqq4?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 323ab08a-de52-46f1-ebe6-08da84e99d76
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:26:53.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zxEmWvDI9JgZgyw/iFNfqkDoujxMb6UrUg+6CfBPuqOAgm01M8Ap9THIplZFEta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7078
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



2022-08-22 at 11:10, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> The sequence of sections is a bit confusing here:
> 
>  * we list the mux locking scheme for existing drivers before introducing
>    what mux locking schemes are
>  * we list the caveats for each locking scheme (which are tricky) before
>    the example of the simple use case
> 
> Restructure it entirely with the following logic:
> 
>  * Intro ("I2C muxes and complex topologies")
>  * Locking
>    - mux-locked
>      - example
>      - caveats
>    - parent-locked
>      - example
>      - caveats
>  * Complex examples
>  * Mux type of existing device drivers
> 
> While there, also apply some other improvements:
> 
>  * convert the caveat list from a table (with only one column carrying
>    content) to a bullet list.

I want to be able to refer to a specific caveat if/when someone has
questions, so I prefer to have the caveats "named". Not that this is
very frequent, but if we do remove the tags now I'm sure I'm going
to need them a few minutes later...

>  * add a small introductory text to bridge the gap from listing the use
>    cases to telling about the hardware components to handle them and then
>    the device drivers that implement those.
>  * make empty lines usage more uniform
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2: none
> ---
>  Documentation/i2c/i2c-topology.rst | 206 +++++++++++++++--------------
>  1 file changed, 109 insertions(+), 97 deletions(-)
> 
> diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
> index 1b11535c8946..6f2da7f386fd 100644
> --- a/Documentation/i2c/i2c-topology.rst
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -16,7 +16,10 @@ Some example use cases are:
>     from the I2C bus, at least most of the time, and sits behind a gate
>     that has to be operated before the device can be accessed.
>  
> -These constructs are represented as I2C adapter trees by Linux, where
> +Several types of hardware components such as I2C muxes, I2C gates and I2C
> +arbitrators allow to handle such needs.
> +
> +These components are represented as I2C adapter trees by Linux, where
>  each adapter has a parent adapter (except the root adapter) and zero or
>  more child adapters. The root adapter is the actual adapter that issues
>  I2C transfers, and all adapters with a parent are part of an "i2c-mux"
> @@ -34,46 +37,7 @@ Locking
>  =======
>  
>  There are two variants of locking available to I2C muxes, they can be
> -mux-locked or parent-locked muxes. As is evident from below, it can be
> -useful to know if a mux is mux-locked or if it is parent-locked. The
> -following list was correct at the time of writing:
> -
> -In drivers/i2c/muxes/:
> -
> -======================    =============================================
> -i2c-arb-gpio-challenge    Parent-locked
> -i2c-mux-gpio              Normally parent-locked, mux-locked iff
> -                          all involved gpio pins are controlled by the
> -                          same I2C root adapter that they mux.
> -i2c-mux-gpmux             Normally parent-locked, mux-locked iff
> -                          specified in device-tree.
> -i2c-mux-ltc4306           Mux-locked
> -i2c-mux-mlxcpld           Parent-locked
> -i2c-mux-pca9541           Parent-locked
> -i2c-mux-pca954x           Parent-locked
> -i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
> -                          all involved pinctrl devices are controlled
> -                          by the same I2C root adapter that they mux.
> -i2c-mux-reg               Parent-locked
> -======================    =============================================
> -
> -In drivers/iio/:
> -
> -======================    =============================================
> -gyro/mpu3050              Mux-locked
> -imu/inv_mpu6050/          Mux-locked
> -======================    =============================================
> -
> -In drivers/media/:
> -
> -=======================   =============================================
> -dvb-frontends/lgdt3306a   Mux-locked
> -dvb-frontends/m88ds3103   Parent-locked
> -dvb-frontends/rtl2830     Parent-locked
> -dvb-frontends/rtl2832     Mux-locked
> -dvb-frontends/si2168      Mux-locked
> -usb/cx231xx/              Parent-locked
> -=======================   =============================================
> +mux-locked or parent-locked muxes.
>  
>  
>  Mux-locked muxes
> @@ -88,40 +52,8 @@ full transaction, unrelated I2C transfers may interleave the different
>  stages of the transaction. This has the benefit that the mux driver
>  may be easier and cleaner to implement, but it has some caveats.
>  
> -==== =====================================================================
> -ML1. If you build a topology with a mux-locked mux being the parent
> -     of a parent-locked mux, this might break the expectation from the
> -     parent-locked mux that the root adapter is locked during the
> -     transaction.
> -
> -ML2. It is not safe to build arbitrary topologies with two (or more)
> -     mux-locked muxes that are not siblings, when there are address
> -     collisions between the devices on the child adapters of these
> -     non-sibling muxes.
> -
> -     I.e. the select-transfer-deselect transaction targeting e.g. device
> -     address 0x42 behind mux-one may be interleaved with a similar
> -     operation targeting device address 0x42 behind mux-two. The
> -     intension with such a topology would in this hypothetical example
> -     be that mux-one and mux-two should not be selected simultaneously,
> -     but mux-locked muxes do not guarantee that in all topologies.
> -
> -ML3. A mux-locked mux cannot be used by a driver for auto-closing
> -     gates/muxes, i.e. something that closes automatically after a given
> -     number (one, in most cases) of I2C transfers. Unrelated I2C transfers
> -     may creep in and close prematurely.
> -
> -ML4. If any non-I2C operation in the mux driver changes the I2C mux state,
> -     the driver has to lock the root adapter during that operation.
> -     Otherwise garbage may appear on the bus as seen from devices
> -     behind the mux, when an unrelated I2C transfer is in flight during
> -     the non-I2C mux-changing operation.
> -==== =====================================================================
> -
> -
>  Mux-locked Example
> -------------------
> -
> +~~~~~~~~~~~~~~~~~~
>  
>  ::
>  
> @@ -152,6 +84,39 @@ This means that accesses to D2 are lockout out for the full duration
>  of the entire operation. But accesses to D3 are possibly interleaved
>  at any point.
>  
> +Mux-locked caveats
> +~~~~~~~~~~~~~~~~~~
> +
> +When using a mux-locked mux, be aware of the following restrictions:
> +
> +* If you build a topology with a mux-locked mux being the parent
> +  of a parent-locked mux, this might break the expectation from the
> +  parent-locked mux that the root adapter is locked during the
> +  transaction.
> +
> +* It is not safe to build arbitrary topologies with two (or more)
> +  mux-locked muxes that are not siblings, when there are address
> +  collisions between the devices on the child adapters of these
> +  non-sibling muxes.
> +
> +  I.e. the select-transfer-deselect transaction targeting e.g. device
> +  address 0x42 behind mux-one may be interleaved with a similar
> +  operation targeting device address 0x42 behind mux-two. The
> +  intension with such a topology would in this hypothetical example
> +  be that mux-one and mux-two should not be selected simultaneously,
> +  but mux-locked muxes do not guarantee that in all topologies.
> +
> +* A mux-locked mux cannot be used by a driver for auto-closing
> +  gates/muxes, i.e. something that closes automatically after a given
> +  number (one, in most cases) of I2C transfers. Unrelated I2C transfers
> +  may creep in and close prematurely.
> +
> +* If any non-I2C operation in the mux driver changes the I2C mux state,
> +  the driver has to lock the root adapter during that operation.
> +  Otherwise garbage may appear on the bus as seen from devices
> +  behind the mux, when an unrelated I2C transfer is in flight during
> +  the non-I2C mux-changing operation.
> +
>  
>  Parent-locked muxes
>  -------------------
> @@ -160,28 +125,10 @@ Parent-locked muxes lock the parent adapter during the full select-
>  transfer-deselect transaction. The implication is that the mux driver
>  has to ensure that any and all I2C transfers through that parent
>  adapter during the transaction are unlocked I2C transfers (using e.g.
> -__i2c_transfer), or a deadlock will follow. There are a couple of
> -caveats.
> -
> -==== ====================================================================
> -PL1. If you build a topology with a parent-locked mux being the child
> -     of another mux, this might break a possible assumption from the
> -     child mux that the root adapter is unused between its select op
> -     and the actual transfer (e.g. if the child mux is auto-closing
> -     and the parent mux issues I2C transfers as part of its select).
> -     This is especially the case if the parent mux is mux-locked, but
> -     it may also happen if the parent mux is parent-locked.
> -
> -PL2. If select/deselect calls out to other subsystems such as gpio,
> -     pinctrl, regmap or iio, it is essential that any I2C transfers
> -     caused by these subsystems are unlocked. This can be convoluted to
> -     accomplish, maybe even impossible if an acceptably clean solution
> -     is sought.
> -==== ====================================================================
> -
> +__i2c_transfer), or a deadlock will follow.
>  
>  Parent-locked Example
> ----------------------
> +~~~~~~~~~~~~~~~~~~~~~
>  
>  ::
>  
> @@ -211,10 +158,29 @@ When there is an access to D1, this happens:
>   9.  M1 unlocks its parent adapter.
>   10. M1 unlocks muxes on its parent.
>  
> -
>  This means that accesses to both D2 and D3 are locked out for the full
>  duration of the entire operation.
>  
> +Parent-locked Caveats
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +When using a parent-locked mux, be aware of the following restrictions:
> +
> +* If you build a topology with a parent-locked mux being the child
> +  of another mux, this might break a possible assumption from the
> +  child mux that the root adapter is unused between its select op
> +  and the actual transfer (e.g. if the child mux is auto-closing
> +  and the parent mux issues I2C transfers as part of its select).
> +  This is especially the case if the parent mux is mux-locked, but
> +  it may also happen if the parent mux is parent-locked.
> +
> +* If select/deselect calls out to other subsystems such as gpio,
> +  pinctrl, regmap or iio, it is essential that any I2C transfers
> +  caused by these subsystems are unlocked. This can be convoluted to
> +  accomplish, maybe even impossible if an acceptably clean solution
> +  is sought.
> +
> +
>  

Three empty lines is excessive and inconsistent with the other two
===-headers.

Cheers,
Peter

>  Complex Examples
>  ================
> @@ -260,8 +226,10 @@ This is a good topology::
>  When device D1 is accessed, accesses to D2 are locked out for the
>  full duration of the operation (muxes on the top child adapter of M1
>  are locked). But accesses to D3 and D4 are possibly interleaved at
> -any point. Accesses to D3 locks out D1 and D2, but accesses to D4
> -are still possibly interleaved.
> +any point.
> +
> +Accesses to D3 locks out D1 and D2, but accesses to D4 are still possibly
> +interleaved.
>  
>  
>  Mux-locked mux as parent of parent-locked mux
> @@ -393,3 +361,47 @@ This is a good topology::
>  When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
>  accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
>  all other devices are locked out.
> +
> +
> +Mux type of existing device drivers
> +===================================
> +
> +Whether a device is mux-locked or parent-locked depends on its
> +implementation. The following list was correct at the time of writing:
> +
> +In drivers/i2c/muxes/:
> +
> +======================    =============================================
> +i2c-arb-gpio-challenge    Parent-locked
> +i2c-mux-gpio              Normally parent-locked, mux-locked iff
> +                          all involved gpio pins are controlled by the
> +                          same I2C root adapter that they mux.
> +i2c-mux-gpmux             Normally parent-locked, mux-locked iff
> +                          specified in device-tree.
> +i2c-mux-ltc4306           Mux-locked
> +i2c-mux-mlxcpld           Parent-locked
> +i2c-mux-pca9541           Parent-locked
> +i2c-mux-pca954x           Parent-locked
> +i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
> +                          all involved pinctrl devices are controlled
> +                          by the same I2C root adapter that they mux.
> +i2c-mux-reg               Parent-locked
> +======================    =============================================
> +
> +In drivers/iio/:
> +
> +======================    =============================================
> +gyro/mpu3050              Mux-locked
> +imu/inv_mpu6050/          Mux-locked
> +======================    =============================================
> +
> +In drivers/media/:
> +
> +=======================   =============================================
> +dvb-frontends/lgdt3306a   Mux-locked
> +dvb-frontends/m88ds3103   Parent-locked
> +dvb-frontends/rtl2830     Parent-locked
> +dvb-frontends/rtl2832     Mux-locked
> +dvb-frontends/si2168      Mux-locked
> +usb/cx231xx/              Parent-locked
> +=======================   =============================================
