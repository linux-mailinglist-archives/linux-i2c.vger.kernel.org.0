Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61DBC633C5A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 13:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbiKVMW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 07:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbiKVMWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 07:22:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5E61003;
        Tue, 22 Nov 2022 04:22:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2034616CA;
        Tue, 22 Nov 2022 12:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF703C433C1;
        Tue, 22 Nov 2022 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669119762;
        bh=1RsX6ENFcjBr8IB+4mVrBxY3lKXrZ7Oluu3EWhp/OTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xekBgBAyNYNYAbCEwTr7Omvw1WA3yMh74q4QqUkO72G+lL3dMLrqZtdSA7TBVdBBv
         cTRB2IDnvqSew/Gn2vNdnTSwrxhckZN/aNWq7wjZ7OnzQrHpsQU9L1TazIE0AUiXjf
         HmXarVwyDfAO+hOIydeGMpekwLeHF3x6lvgrJeQI=
Date:   Tue, 22 Nov 2022 13:22:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 567/606] staging: iio: ad5933: Convert to i2c's
 .probe_new()
Message-ID: <Y3y/DxNp+cYu7GTH@kroah.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-568-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-568-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:01PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index f177b20f0f2d..b3152f7153fb 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -674,9 +674,9 @@ static void ad5933_clk_disable(void *data)
>  	clk_disable_unprepare(st->mclk);
>  }
>  
> -static int ad5933_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ad5933_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);

Breaks the build in my tree as this function is not in Linus's tree yet
:(

