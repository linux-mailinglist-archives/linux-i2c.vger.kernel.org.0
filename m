Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4297A70FBA6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 18:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbjEXQYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 12:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEXQYN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 12:24:13 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2098.outbound.protection.outlook.com [40.92.22.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD7510B
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 09:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIndk24T39vDSwQhz5sOuR91OY8vOdE/c0mOXx/VO0bU/YxHFMhgfxozqvXrvhA1Rwzsk0d1rJweo+8j0H0A0KgLur8CrkM8LJ4sB2333MUgm6otzioVRyV+7oe98X/XbNFmO0TtBwxndayJG5zNscqLj+pfU7Wgvv/UZzam7kPazFlqpwY6h8AlXIZfGZlVfLxQQcduVDayGKQTlemD4p3FYK4f7gILB8dMvGjFvJWdAE6vN4OJ6ROa0lswYaXEauHXrSRbY1sERZi2DSrJmeSFbCo0jhaXreBU0mCe8WexDswG0XIBasni1AyVrzbO0sK0PomW5Ws7XGbbZYR7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdHq1ME1sLqkegbn7XWPyH0gEL6q9psXnwPX4opi5PI=;
 b=MetLB7yQkWofuLvv3lfrmlOx6LqG6NmGwyFxj2KsLiysGpjb5lMfPTuFDjHfjMLU4Ns8hh0mX3kpELb6RxNYC7swoxJHILvA3vu9C6tUck0N4rZmxb/cTkfpAmngOUuVWpLmdVeMk6qBHo6lA/3H0kz5yI/yP7hiVE6E5SlkijLmHogwPktTKiD+gL7O4wuv1lbRiefCOP0DuWtKfhiw+nNwlZaglNvS2vPdH1zG1FK7iupONSh/JD5vzAjgk3s5z4Zso+na/sKzLU29VwaWawWbqY1xSm/uhmdvRD8uTMRBNnD009LZM44ocYKf0N3bni0oB6JXvmBoRnvnubvu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdHq1ME1sLqkegbn7XWPyH0gEL6q9psXnwPX4opi5PI=;
 b=LEE7sSuGtTgoLUU1vAMIdDXjriQzmYlYBSpmoEqQLPeB4UltF8Q+fhKsYIxbbi/fgWYdnTCdanogup1bXuWjxQP2xGTuFisuObYqzCCIW6cEgNkDSxdRPXtHjkvF+8rpbJ6wrwPhNpzc57nal9HcOic2em9fjto5tU1FF7wLemdzCIWL6hJBs3bFfDAbLDNV9CQ/cwVN788bXjPs+GjqbNiLAKuvczSJdODIxFA7iS59lnJl7DeAP0VCd+1D1uTDbX/3PzwujJhhZcMmOVuPRfI7TifuxjrwOGnjkiaqGhFcGYA9BtT39O3ZjdLpeqfaL+LtPoGWuvCCLd+y1D75ag==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SJ0PR06MB6942.namprd06.prod.outlook.com (2603:10b6:a03:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 16:24:10 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::8fa4:8b62:ade1:9109%3]) with mapi id 15.20.6411.027; Wed, 24 May 2023
 16:24:10 +0000
Date:   Wed, 24 May 2023 11:24:05 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH] i2c: mv64xxx: Fix reading invalid status value in atomic
 mode
Message-ID: <SN6PR06MB5342CC8EB6FB7AE6D68A9954A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230521121940.27057-1-kabel@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230521121940.27057-1-kabel@kernel.org>
X-TMN:  [LVjEs7aDskpYoF+y726AJZexinjNcXIw]
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZG46Je0nULrM5Co2@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SJ0PR06MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 4301da80-9002-4072-6f70-08db5c734d77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWDihWdGHNZsoZoswIVo+rjuW8y6ZDyUw11J/tnfgJzeNRbPETBSjqatUUxY5w//L6vuOleX9oD0BgtfOJPTWOBrZiWvptndTiiD2hTmluKDTxyw1rIKgcuHzCfS6dAvUh+2TXy0ZEjrFwjxttBUojlhoVxxRoA7tLg/SeT2s8jDyApnOgmeOgKUBdQ5/CUCN7StewpRNvatPoVb87REx+PgmCsfTr40ZQl/QRc0ie1Gb5XRTDNAk1P5UAcgez1on6UaxDlWeEwRyqP39Eu28GYFPvJRTl/vAE5cN0xTp9Mlrcb4GzZnnpoHmdkwLHksHFdJYXkN8TZkuvSC7RpixbnWAiRaRIFXwRB4Oj1fioeGQucauMMdo8ic6BsGa/oES4MhWkfHMdOinmMhxuhnbqbAUD/Af4mp3fB8a9xdl55pyMLefcl02pB2zLG2TR7HO1XO875dx3zt/l0kp+IGeXH/9a9N4KjnHvzW2tNLIU1WMahe6ex3FK7QDgAt/m/IgiQs/8VFM6NZYo4NgOx3bJliF5lag7bVzBFgd9ur2Ua0JEbPpBz3fz27iPsLKI7h0U6YjGKwsYtGzoCwK0w1oj9SKNNpg9AL2KnvLRqWsN0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/0Qz2Rx6Yc32qNJ98BWbi72nOCbwJiscqjZHF+CY3R+uWAxH+7xSiF7XAv?=
 =?iso-8859-1?Q?a3pjhW7ZqDYc/NPA2rMYf7M0a7FgfHTZMoUK0eJ2n2iXmSP8tNrEf8tSGz?=
 =?iso-8859-1?Q?pjlGOZhgXc6XbILcIcyuLa2QHsogmkj47V4TYeX+pjLW8VmLGDq7Z2a/WF?=
 =?iso-8859-1?Q?P/OmI5lU74yGH9KUmNupbSTOEg6fbxx84tPuK8dvyZfeei1hVrsCbn28QJ?=
 =?iso-8859-1?Q?GtMGGbUEhY06LoQvkoMx19nokiQ1STN31lWzRdKjkRGlUyOK49KPwcDbQc?=
 =?iso-8859-1?Q?mpNI+ENDu7yjlYIbk/kYP54KcI/Kpv7pbvKuVuJlbnC+CaK1HyBKRh1WdD?=
 =?iso-8859-1?Q?dxP9z+tlPzZWDU51d6FgfkijdQTbQb634bYkGV1Y1ofTlO4RiN6EIJlQIP?=
 =?iso-8859-1?Q?o4Qi0191PYNl31xgYGFdv0+ovwa9QIJ4f2mCPXdKKQiAkT9KeWb5+g4xJ1?=
 =?iso-8859-1?Q?rtQyjeuxquUYzz+GLPrEo238KvwOJuhe751c2/ZXzYAlB4exnbaMJp8SBw?=
 =?iso-8859-1?Q?ee2mVnnGK2+D5a+rVHZ7eOzo1A5iJObaIn0tBYDLQ2RVXR9R8oNXoLDjk3?=
 =?iso-8859-1?Q?OkpWldDF+8NMXSUybFe87XitkAL5XQG9zoguxKUv82g9L8qzHMoJZD7Tn5?=
 =?iso-8859-1?Q?amNJP+diIH6tHZszKL53vkrmPmEMg4d6aKivuuvFb+YoajgaVRTDytxpD4?=
 =?iso-8859-1?Q?zMD6cnWTK8UUoV6ltinngMFYYFmahKPrNXPMmy8b6RqnOumIYxjbzFd4i4?=
 =?iso-8859-1?Q?yNTmFbs/N+qAPgDwtgo/HT4z5OS2l9ndUSMo3Vndjw7TH35rzmV3TlTzq3?=
 =?iso-8859-1?Q?HOBah+Z7w8RWWmPkr60hSJhIj/SXED1MpOBwRgmiUamsc67rY8MuqNGHxU?=
 =?iso-8859-1?Q?H4KUHjK1aQ+VVSYTBWneEVtevwLzXk9gzLujYvjZ5jUNM6LrsfeK7qbiNy?=
 =?iso-8859-1?Q?Go8KMooYtKWBAXFY4FVoHLkJMuGCHtWMVnPINR1dzp70JO9o8r2RHAIm+b?=
 =?iso-8859-1?Q?+l/Ntkb4zXBZ9P+qLnbzzyRZNAmCMVX7pCnqU1EvTWY/J6RgcmliRINx8f?=
 =?iso-8859-1?Q?NHatqAcf+qcHdllbJCu8mOO+ZOj60Ov6LOpg3g0lnJ6fBOpE/TnZ/HQem/?=
 =?iso-8859-1?Q?eGufLbuZWoH48dG3kO7+BPjFsSOxWTtmU0wpdfwM1Q0I6UW8OFMteavfaL?=
 =?iso-8859-1?Q?Q9B8EcS29HLh4JoQUYv44TeS6VdlVnV/gsumAYZxEthLAohi190bzJkP2Q?=
 =?iso-8859-1?Q?c9STY8wHw29m6xNnC9r1o051ZoWXvg7aaF4hgtx1o=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4301da80-9002-4072-6f70-08db5c734d77
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 16:24:10.1109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB6942
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 21, 2023 at 02:19:40PM +0200, Marek Behún wrote:
> There seems to be a bug within the mv64xxx I2C controller, wherein the
> status register may not necessarily contain valid value immediately
> after the IFLG flag is set in the control register.
> 
> My theory is that the controller:
> - first sets the IFLG in control register
> - then updates the status register
> - then raises an interrupt
> 
> This may sometime cause weird bugs when in atomic mode, since in this
> mode we do not wait for an interrupt, but instead we poll the control
> register for IFLG and read status register immediately after.
> 
> I encountered -ENXIO from mv64xxx_i2c_fsm() due to this issue when using
> this driver in atomic mode.
> 
> Note that I've only seen this issue on Armada 385, I don't know whether
> other SOCs with this controller are also affected. Also note that this
> fix has been in U-Boot for over 4 years [1] without anybody complaining,
> so it should not cause regressions.

I've never seen this bug before, but don't suspect it should cause any
issues for me. Thank you for finding/fixing this.

> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/d50e29662f78
> 
> Fixes: 544a8d75f3d6 ("i2c: mv64xxx: Add atomic_xfer method to driver")
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index 047dfef7a657..878c076ebdc6 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -520,6 +520,17 @@ mv64xxx_i2c_intr(int irq, void *dev_id)
>  
>  	while (readl(drv_data->reg_base + drv_data->reg_offsets.control) &
>  						MV64XXX_I2C_REG_CONTROL_IFLG) {
> +		/*
> +		 * It seems that sometime the controller updates the status
> +		 * register only after it asserts IFLG in control register.
> +		 * This may result in weird bugs when in atomic mode. A delay
> +		 * of 100 ns before reading the status register solves this
> +		 * issue. This bug does not seem to appear when using
> +		 * interrupts.
> +		 */
> +		if (drv_data->atomic)
> +			ndelay(100);
> +
>  		status = readl(drv_data->reg_base + drv_data->reg_offsets.status);
>  		mv64xxx_i2c_fsm(drv_data, status);
>  		mv64xxx_i2c_do_action(drv_data);
> -- 
> 2.39.3
> 
