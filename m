Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66959509282
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 00:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244738AbiDTWOT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 18:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382865AbiDTWOM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 18:14:12 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10132.outbound.protection.outlook.com [40.107.1.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550B820186;
        Wed, 20 Apr 2022 15:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zm0ywnVqmxvQYnkkx/dHQdeQDGpKLkGJfk1/qw0ajcjWpGgtstHxlHWDGvik10/ex4dksmAiTLfpH3Vc4zTlCJKmJejoQnvTTVHWWQ3nU+fl+80z37bbvYzk8CtL8pPsiM2UGa3V9SlyHop+TqM19e1g96d+WRwCO7u18OAB+KkaTHaToXKti/hrQ0n7pLQEMLsZJBoF6/80sHmCMkt0UL0xTGw+lm+gtdtiZ19oiss/AyXIql8+FY4X0d2udujlJMAZz18Ne3k9teRcFLtQTRs/Hd53+7cACcGEG7EB9B/RbG3FNCrpo3s2wUn4z3TGnzxmeHwIxTbfQdXLrt/yaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcabncyoTaIrkjmSMRbtHJftFsW+cSB67HacsVkHlNU=;
 b=Gd7o8PzBYeIBDaBzh8EX35DoUC0FcqNEzWFtL3B7xj23rcWQTZrKC0Wnsh6BOs7qUdYE+qZU75zfOKrQihbqSdnstoohHKjO+PYdRxUqjH360OcX5l7plpzVQPs7Ru/o1NQUigweWgUB3omJt5jbXykJYjeqXFS9X5eseY9bfKxFkIZDoS2z0mwExWHzxkf4Sv/TwRKjk+k7msgsGPvaQH4wzpKNe3X1vbDepJHmiXLnl86Vdx4JhBc5JuP9tv8PS8C6RZXaU7gVf3rhe4wJoB+R8P3RczJooqKa2ZQR74bFUA2cGUQ3SP3RhX35P0RPq2lBkm5r8D8ouYixQ2sBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcabncyoTaIrkjmSMRbtHJftFsW+cSB67HacsVkHlNU=;
 b=dqo6X0iLW0/yUPHo1qvUMmbP70n0OXaExoTXIy4v0JunxCs7qjGMaO81jwnjYbQ6rn8JESzfh1OeUnZG65sUYv2DI6u6oT6luphet9Ut9rVAzGLV9+1DEzNmtnZa49nVHUpIzWOb/v3J4plPB1KO4m2ZLwTvQdm19VPKS0E9BrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB7194.eurprd02.prod.outlook.com (2603:10a6:10:24e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 20 Apr
 2022 22:11:08 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::d038:3d5c:e37f:4423]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::d038:3d5c:e37f:4423%5]) with mapi id 15.20.5164.020; Wed, 20 Apr 2022
 22:11:07 +0000
Message-ID: <fb6fbf45-03f3-5d5c-cf98-21e808959389@axentia.se>
Date:   Thu, 21 Apr 2022 00:11:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [v8 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
 <20220419124025.1733230-3-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220419124025.1733230-3-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0052.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::6)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b267263-dfb7-4d76-1f98-08da231aab46
X-MS-TrafficTypeDiagnostic: DB9PR02MB7194:EE_
X-Microsoft-Antispam-PRVS: <DB9PR02MB719411854BFFAEC518CF5585BCF59@DB9PR02MB7194.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rOv0IOls4AOnnNE9WEy2Ut5pYl26QB083bxCX4PTqK7Z89r/AclultvRTUMoQ1kHS+YMxd5/PS5iVnTQH9A0npNzapbPy02xvfd8v/M91f+g195a+Xj2wq1CnwWh77lqE9WyyVogESecoQgkR/Fu79MfNut9f8zNhQUDh9k9YClm6Koy7KUkQV/FSd3+ebzt2FlnMB4aulaabqU9c7u33Ru9cMudPBZD9zrzd9lgsWyF+uDyBdCXn0aSYq0DzJXIR/6kgyMLZR7MSP3SNjoQJ1zDgQNSshFM9C3eytVk0SQrt6xPK6ZR0z+WwZ7LHZ8xEwHSx/y+0fa4hbCD3RnhY10CviK7UvEYLTXbgVZmA9R0JhQOyVEprFrDvPapc+eVorBK2hQQCG67zzZidvvCpJ5lF3b9PjKmj3FnBGWn9RUHG4B4CfXSu9m2T5qNNv3LgObk3GWUXPL86odfv65XlgNPAYlk09jizIy4toZLsGjMH/vAka4jFFqzgVyjVk0Xdit8wBHDOAv6vjC4z6KKZqS4UxvrniCXs7EBykBw3wKDw6m11ONe3RCcvavBg7GabxWPM/xz+YORNNSOTfnItVJue/Jq8OO75xp4R2Yh6AAN995sdC1hU6ynaZsWND+/Zor+syUsC45odZjELa2qA3uYnuE8hhhSKZVHgqmgOakW/c+c/pNOJiro8ccfAgpX7mfTDRlqYItPacXyDW8jgE0m7T2tWZkDmrGMIQdHbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(376002)(136003)(346002)(396003)(39830400003)(6506007)(508600001)(2906002)(31686004)(38100700002)(6486002)(8936002)(66946007)(30864003)(86362001)(31696002)(316002)(186003)(26005)(6916009)(4326008)(5660300002)(36756003)(8676002)(66556008)(2616005)(83380400001)(6512007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjc3cGxGYjZiOUQwNHkzSTFKZ3JhNmwvWnZYcEg4VFdlRW1mWGhqTnhobysr?=
 =?utf-8?B?Y0VNTjZoWXQxL0FXK1RaaU81a3FjdUdDT1d1YVhoUHpnNXNIQXlqV04yMktn?=
 =?utf-8?B?RkU3dVFPMmF1YlBveTlGNjhnaGRLSk5IRGFUdmN1YTFNSEM5WktEdUNscHNM?=
 =?utf-8?B?OVFxeXhHdE5rTmk5WUNyRHY0TWZXME9LY05HTTBVKzNXejBnNkJ6ZTdPMGx3?=
 =?utf-8?B?WWtnM0RBUkVNTktZTEdCMjMydE16aEFxeXY1VitBTjd5OEZESjBFWmVxamJa?=
 =?utf-8?B?NTdCR1lKTElYcUppSU8yUXkvejQ4anl6clczNERGOG5uUU5CQ29QK3JvRUps?=
 =?utf-8?B?alRjYkE5MWc2b1d2dlF4a3NzNXpoNkd0dFphUUM5SG15Z25Sc2w1aFRNdUFk?=
 =?utf-8?B?cTBiZHFlYzFneHZPNEh1dE1NY3dibWFMZDVQUXJnZGtEWHRuT0ZMbTJXdG95?=
 =?utf-8?B?eXlXUUs1VVp6NTdSaTErUUtMTVhiSndOUkxyaWIxaERieXZkQllhVHdzeTNq?=
 =?utf-8?B?eU5nVGlaSUVWZ3l5UkpoZUd6bXFuL3VHM1NEdEJBUWlQQ2JrOWpLV0NjVUtQ?=
 =?utf-8?B?NEFGa2Y3RlhkWkN4RWFWLytXOUNwMXg3ZWpSalBQSW5pN3daVW1xVTB5REk5?=
 =?utf-8?B?K2wxT3FKSHdhM1lqNmFZUzROOWRjZUgxVWpmM3lYbzR2ejlGZmZCcktrRE9P?=
 =?utf-8?B?NlpvS1NqVDM5SXRvWktiVkl2eGJWRXdWVXRUVUFsTUlHTi9RWVlxSkw0bk5H?=
 =?utf-8?B?dm56dHN4SCtza3pKcXRGZ3hPRS9tMnZaUmRFZWdRRENHVFJVSE5oRzhSdGxq?=
 =?utf-8?B?ZTRnTkd2bm1rN1lnVXVpaW1OQXFiTEZTR1pjVjNOVjkzQllYWGRsQTVzWTJi?=
 =?utf-8?B?eGg2bEpwRDZNZ2VZMmdHRklGRGV2RFNrZXJod0NmRHk0Z2ZDL2lrdEhCMjV6?=
 =?utf-8?B?ZkNJeGg1bE5Mc1k0bUF2UW1EeHJyZ0hUcXBwV25CanFHYkVZUVpyZnlGekhq?=
 =?utf-8?B?UFdJTDlnbVRTdXhDNU1qcExwKzJlY3BwaUZyQm5QaFVTMHJZYjVIUExqSUZ1?=
 =?utf-8?B?a3pyakR6SzRNSXF0R1pwalp1dEpvWFhtOGtkQ2JaNUVzNDYyL1YzaENsTmVy?=
 =?utf-8?B?ZllmNHByVFZBTlM4bC82MW1PVWFhUDBxUnhmNTMvYWVHeEVXNFVUVUhidVJx?=
 =?utf-8?B?c0FzM29WNWVXWi82SDNnWFlFWjM0TTVuVUw3MzZZcDZ5RytpbDlXVzRTQmpp?=
 =?utf-8?B?R1pBRGpNK0gxTVNVNXJFQVl4S1pNSU9oNWR3bVNieHRSQkRaU0FLM28xT3ky?=
 =?utf-8?B?Q0NtSHk0a2RlYitqN3ZTRy9Vd0VPKzdJZkdyYWZ0azQ4U21Hdmo3YXZjTDdt?=
 =?utf-8?B?eHpvbnkwUDcxci9VN2VUUDRzTWl5Yy9IMlhadXBRZkFiRjZEd1l5ak1OWmx0?=
 =?utf-8?B?d1dTSitMcUhaQVhqQWo3SiswUDcxd21pN2NGNGNUWUh0a1BsdnlicDZmUjdn?=
 =?utf-8?B?TjI1QW1ZVjI2QlFhYm9IbnNGMG1GL2RiM3JLMitMRGFVZnFadStOOWV6N0cw?=
 =?utf-8?B?SnVpV05DK1NxYmJDblNuZVFZZEo0RUM4aTM2TGROWXdNOEZrdzE1Z3RYUURI?=
 =?utf-8?B?T0p5eTAwMlN3M2pJRXFwN0JCckQvbjl0b0xCcTVQdE1YMGN2NjNLSmRMVHRq?=
 =?utf-8?B?b2ZJNVM0OWMzaGRaSlFkQVczNGdtQm5jUExuRFVVZzBmckNwbmRQenBTTXQv?=
 =?utf-8?B?a09OMDE0YnBMdFYyYnF2ZXZHWGpQTUNjQlZXeUtNd2o1RE01UlRwWGhPL2tr?=
 =?utf-8?B?aXBVYWYvRjFLWFRnbTlRZWpHWW0xUW50bDIvTDYyajRVSFJ3aFlReWZzcUZs?=
 =?utf-8?B?cU9XV3g5azRQaG12UFBacEZRMW9xTjhKOVNkei9XUGdzWGd0VTl2dkgwVEFY?=
 =?utf-8?B?akFpZEZVSldzVysrQzlSR1hGRUxicEM1Y0hMa1Z4YWlDMmZxcXE1elk1Vzln?=
 =?utf-8?B?aVJ3eHczK1p5cWR5cDI5Rm5RNmgxT0xJOTNtNnE3RnlDNGlJbWJPbTdMWTZs?=
 =?utf-8?B?K0pVRXZiMUZtaUdyTmk2SEE3NzRmY0tWMXQxSUkxVkJJU3puS2NEWTVoTlJT?=
 =?utf-8?B?SXpzdWRycVptNHB4WmJvR0VRbjRZMUZQM2dSb1h6dGsvaHNFTFJ5Z09BSVpU?=
 =?utf-8?B?ZC9xcG5XRWhPSHlweWdGaEFoUjhMaDlZWTVRVHd4QXpoRlBhd244QmZTakV1?=
 =?utf-8?B?ZnBCZ2NwWHEvVnNiQ3hBaDFXWWEyZksrRDhpSS9Sd2kxN3huemliRkJYUkFp?=
 =?utf-8?B?bVNFQy9YbUQ5R0lSUVBWajBEeHdqWHl3Z3I0M3FZeG5FaVJUTzhDUT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b267263-dfb7-4d76-1f98-08da231aab46
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 22:11:07.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtF0fP7YkHlp1Wc8j8qzyVjHRck3hNad+7Doo+EieLLcodNC+CZ4AKu/YALkp1oG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7194
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-04-19 at 14:40, Patrick Rudolph wrote:
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
> The MAX7357 and MAX7358 have 6 additional registers called enhanced mode
> in the following paragraphs. While the MAX7357 exposes those registers
> without a special sequence, the MAX7358 requires an unlock sequence.
> The enhanced mode allows to configure optional features which are nice to
> have on a I2C mux, but are not mandatory for it's general operation.

s/on a I2C/on an I2C/

> 
> As I don't have a MAX7358 for testing the special unlock sequence the
> enhanced mode isn't used on the MAX7358, but it could be added later
> if required.
> 
> The MAX7357 enhanced mode is used to configure:
>   - Disabled interrupts on bus locked up detection
>   - Enable bus locked-up clearing
>   - Disconnect only locked bus instead of all channels
> 
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
> 
> Tested using the MAX7357 and verified that the stalled bus is disconnected
> while the other channels remain operational.

How does recovery work if only one leg be stalled? Does recovery work
differently if the MAX7357_CONF_DISCON_SINGLE_CHAN bit is set? If so,
I'd expect some recovery support, no?

 From just reading the patch and not looking up any docs, it looks like
you might need to interact with MAX7357_CONF_LOCK_UP_CLEAR, no? But
that sounds like an operation, so it doesn't really fit in a "CONF"
register. Hmmm, I'm just asking questions and don't know how lock-ups
are handled with preexisting chips, so I'm by no means any expert...

> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>   drivers/i2c/muxes/Kconfig           |  4 +-
>   drivers/i2c/muxes/i2c-mux-pca954x.c | 92 +++++++++++++++++++++++++++--
>   2 files changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index 1708b1a82da2..2ac99d044199 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>   	  will be called i2c-mux-pca9541.
>   
>   config I2C_MUX_PCA954x
> -	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> +	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>   	depends on GPIOLIB || COMPILE_TEST
>   	help
>   	  If you say yes here you get support for the NXP PCA954x
> -	  and PCA984x I2C mux/switch devices.
> +	  and PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices.

You still have this double-and thing going that I commented on in v6,
including a missing "the" for the Maxim half that is there for the
preexisting NXP half. That makes it unbalanced and difficult to read.

My suggestion then was:

	  If you say yes here you get support for NXP PCA954x/PCA984x
	  and Maxim MAX735x/MAX736x I2C mux/switch devices.

Was there anything wrong with that?

>   
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-mux-pca954x.
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 4ad665757dd8..122b7a28fc60 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>    *
>    * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>    * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>
>    *
>    * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>    * chips made by NXP Semiconductors.
> @@ -11,6 +12,12 @@
>    *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>    *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>    *
> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> + *
> + * This includes the:
> + *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> + *
>    * These chips are all controlled via the I2C bus itself, and all have a
>    * single 8-bit register. The upstream "parent" bus fans out to two,
>    * four, or eight downstream busses or channels; which of these
> @@ -50,7 +57,30 @@
>   
>   #define PCA954X_IRQ_OFFSET 4
>   
> +/*
> + * MAX7357 exposes 7 registers without extra commands which allow to configure
> + * additional features. Disable interrupts, enable bus locked-up clearing,
> + * isolate only the locked channel instead of all channels.
> + */

The information from the commit message that describes this as "maxim
enhanced mode" is needed here as well. Also, It makes no sense to talk
about not needing extra commands to open up something unless you also
talk about some case where it is indeed needed to unlock the enhanced
mode. I also miss an explicit description that the below bit definitions
are for one of the mentioned enhanced registers. There could also be
some mention of which register index this "CONF" register has.

> +#define MAX7357_CONF_INT_ENABLE			BIT(0)
> +#define MAX7357_CONF_FLUSH_OUT			BIT(1)
> +#define MAX7357_CONF_RELEASE_INT		BIT(2)
> +#define MAX7357_CONF_LOCK_UP_CLEAR		BIT(3)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define MAX7357_CONF_BUS_LOCKUP_DETECTION	BIT(5)
> +#define MAX7357_CONF_ENABLE_BASIC_MODE		BIT(6)
> +#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
> +
> +#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
> +	 MAX7357_CONF_DISCON_SINGLE_CHAN)
> +
>   enum pca_type {
> +	max_7367,
> +	max_7368,
> +	max_7369,
> +	max_7356,
> +	max_7357,
> +	max_7358,
>   	pca_9540,
>   	pca_9542,
>   	pca_9543,
> @@ -69,6 +99,7 @@ struct chip_desc {
>   	u8 nchans;
>   	u8 enable;	/* used for muxes only */
>   	u8 has_irq;
> +	u8 maxim_enhanced_mode;
>   	enum muxtype {
>   		pca954x_ismux = 0,
>   		pca954x_isswi
> @@ -90,8 +121,42 @@ struct pca954x {
>   	raw_spinlock_t lock;
>   };
>   
> -/* Provide specs for the PCA954x types we know about */
> +/* Provide specs for the PCA954x and MAX735x types we know about */

Not really your fault, but specs are also provided for some PCA984x
parts that "we know about". However, arguably all of these are
PCA954x "types".

So, either drop the change to this comment or also add PCA984x to the
mix. I vote for the latter.

>   static const struct chip_desc chips[] = {
> +	[max_7356] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7357] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.maxim_enhanced_mode = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
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
>   	[pca_9540] = {
>   		.nchans = 2,
>   		.enable = 0x4,
> @@ -177,6 +242,12 @@ static const struct chip_desc chips[] = {
>   };
>   
>   static const struct i2c_device_id pca954x_id[] = {
> +	{ "max7356", max_7356 },
> +	{ "max7357", max_7357 },
> +	{ "max7358", max_7358 },
> +	{ "max7367", max_7367 },
> +	{ "max7368", max_7368 },
> +	{ "max7369", max_7369 },
>   	{ "pca9540", pca_9540 },
>   	{ "pca9542", pca_9542 },
>   	{ "pca9543", pca_9543 },
> @@ -194,6 +265,12 @@ static const struct i2c_device_id pca954x_id[] = {
>   MODULE_DEVICE_TABLE(i2c, pca954x_id);
>   
>   static const struct of_device_id pca954x_of_match[] = {
> +	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
> +	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
> +	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
> +	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
> +	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
> +	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
>   	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>   	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>   	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
> @@ -401,9 +478,16 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>   	else
>   		data->last_chan = 0; /* Disconnect multiplexer */
>   
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> -	if (ret < 0)
> -		data->last_chan = 0;
> +	if (data->chip->maxim_enhanced_mode) {
> +		ret = i2c_smbus_write_byte_data(client, data->last_chan,
> +						MAX7357_CONF_DEFAULTS);

You are using i2c_smbus_write_byte_data() without first checking if
the adapter supports I2C_FUNC_SMBUS_WRITE_BYTE_DATA. I managed to
overlook that in the previous review, sorry about that. Anyway, see the
call to i2c_check_functionality() at the very top of pca954x_probe().
Probably not a big problem since i2c_smbus_write_byte_data() will
hopefully fail nicely if/when support is unexpectedly lacking causing
the probe to fail anyway, but it's better to fail early...

One could also perhaps fall back to not using enhanced mode if the
adapter does not support I2C_FUNC_SMBUS_WRITE_BYTE_DATA? Don't know
if it's worth it though -- probably not.

There is no support for programming anything other than the defaults
you have selected. If those defaults are the only thing that is ever
going to be needed, why are the chips not hard-wired by maxim like
that in the first place? How are we going to add support for other
values in the enhanced registers? Do we need to have a plan for that
up front, or should we let the person that is eventually going to need
that worry about those details?

Cheers,
Peter

> +		if (ret < 0)
> +			data->last_chan = 0;
> +	} else {
> +		ret = i2c_smbus_write_byte(client, data->last_chan);
> +		if (ret < 0)
> +			data->last_chan = 0;
> +	}
>   
>   	return ret;
>   }
