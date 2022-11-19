Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6186311F9
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 00:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbiKSX6u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 18:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiKSX6t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 18:58:49 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BED313DEF;
        Sat, 19 Nov 2022 15:58:47 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 386471BF207;
        Sat, 19 Nov 2022 23:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668902326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=17CqComxe+k6h8f0mE/chWaXjRFAVcoSj3D8bZumfx0=;
        b=akFF+cTrOMDG+B+BpYqPxd+pmuBuDC3i+6oD0CJgq9R0IhWRKIX36egShNIOdpyA/XueLh
        xGdSUiSocTV1O1UzmNSL7WHeI1bojNgcUILzod+VhYa4ymUMg3fyUTLTS9r4S5oAeAYO+y
        Tf5cOfyOKlH1WbrIdFptcgjVWprnnDoMIY+XrUoaMk2yzhb51qSJV0LBF/WDa7tXOWzwda
        TNdfx7Fc1cdZhQg5P0tcnzkHYX49S2r2crrkPPR0uHM1ge3PnlBCjVrPf3RVlFhNtaIyW6
        H3D5XazNjHRejV+wXtEYXYZhEwmjUniS1nT0j3nCJL+BdaeBhT1Wyc/A6fWMXg==
Date:   Sun, 20 Nov 2022 00:58:44 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 561/606] rtc: isl1208: Convert to i2c's .probe_new()
Message-ID: <Y3lttA22QlR46RXz@mail.local>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-562-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-562-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/11/2022 23:44:55+0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 

This is already done later on in the function, please check the rtc
patches as I took your previous series.

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-isl1208.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> index 73cc6aaf9b8b..fca9cc440296 100644
> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -799,6 +799,7 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
>  static int
>  isl1208_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	int rc = 0;
>  	struct isl1208_state *isl1208;
>  	int evdet_irq = -1;
> -- 
> 2.38.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
