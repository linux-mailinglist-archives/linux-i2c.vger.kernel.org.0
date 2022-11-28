Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E69639EBA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiK1BQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiK1BQB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:16:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EAF10571;
        Sun, 27 Nov 2022 17:16:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EC4ABB80B42;
        Mon, 28 Nov 2022 01:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D89C433D6;
        Mon, 28 Nov 2022 01:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669598157;
        bh=1P4pxW2c213T3wYV+j34kdjRX+OqpKJcDYcXB7R3+7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aMM5ArRWO8g4L01vrxXHVlz6nQAKG0ImyC76Qxwhwxg40eMCffdyVH7IFIHNWdD7e
         xkjGG5MxnfRiViE9jXfE3/51tFqlHTvHRShnxp7C6Nw+g75UTlAeHs73KBvi6CFtHN
         C+gNrgf9n/oy9Eb1fCT/gRGM9p5qM5udqGxWTI/LMESSILeTvylYLyiCIFjQOh5x0i
         zaX3tILyZItYVuOaPT9M47Qck3HId7O40AXpODNeT4icrNyZWo+XiM9TfYkPz0FjHV
         dBQsuvqtEeEFOtSPEAY0Z/KdLuVrfMZIKGhp+3dDRmTHtiOZAM1Gog+Y8r8d8t2CEF
         dGTO1phY5KQRw==
Date:   Mon, 28 Nov 2022 03:15:53 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 004/606] tpm: tpm_i2c_nuvoton: Convert to i2c's
 .probe_new()
Message-ID: <Y4QLyWrkTxiELkFf@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-5-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-5-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:38PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/tpm/tpm_i2c_nuvoton.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
> index 95c37350cc8e..a026e98add50 100644
> --- a/drivers/char/tpm/tpm_i2c_nuvoton.c
> +++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
> @@ -522,9 +522,9 @@ static int get_vid(struct i2c_client *client, u32 *res)
>  	return 0;
>  }
>  
> -static int i2c_nuvoton_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int i2c_nuvoton_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	int rc;
>  	struct tpm_chip *chip;
>  	struct device *dev = &client->dev;
> @@ -650,7 +650,7 @@ static SIMPLE_DEV_PM_OPS(i2c_nuvoton_pm_ops, tpm_pm_suspend, tpm_pm_resume);
>  
>  static struct i2c_driver i2c_nuvoton_driver = {
>  	.id_table = i2c_nuvoton_id,
> -	.probe = i2c_nuvoton_probe,
> +	.probe_new = i2c_nuvoton_probe,
>  	.remove = i2c_nuvoton_remove,
>  	.driver = {
>  		.name = "tpm_i2c_nuvoton",
> -- 
> 2.38.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
