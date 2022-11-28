Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A875A639EBD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiK1BQX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiK1BQW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:16:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A98B63C1;
        Sun, 27 Nov 2022 17:16:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA8F360F55;
        Mon, 28 Nov 2022 01:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB84C433C1;
        Mon, 28 Nov 2022 01:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669598181;
        bh=zGFnFw5hLodsDTBFshb/xlOk9mllkoMi75HfKN09yn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r4mmwuXfjyVsFfqsPEmGDNGDha7QvaxjcJrhXfJAkcW79/QBMYCWMajthI8HLUwbZ
         eM/6XbwqKZPOpicv5yxkq5eF5nNAcZkknOpg+x98vI2jPfAtfq3+8KP09YzySdaNPv
         9E18Hw3i6Zk5qFX78q/LXw4m9zC0NHxiYCYkf1sIyF7vWah26IffrA5E/HBrRbcHfb
         9pTZz6wGzZyGXYdzKDEIlR8G5lcvY0FKJXUZL2UY2pFNcpeQtfh+faDB93BEBX+Ibp
         kpACAJmVznNKJBgFn3knIENJXHjR01H8/zUWL11TuzlH9THFWp4uJ4ToLJFhA7ErBt
         aiNwD0O2ZQcUw==
Date:   Mon, 28 Nov 2022 03:16:16 +0200
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
Subject: Re: [PATCH 005/606] tpm: tis_i2c: Convert to i2c's .probe_new()
Message-ID: <Y4QL4PDj8uK6VBHf@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-6-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-6-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:39PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/tpm/tpm_tis_i2c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
> index 0692510dfcab..18fa8b4672a8 100644
> --- a/drivers/char/tpm/tpm_tis_i2c.c
> +++ b/drivers/char/tpm/tpm_tis_i2c.c
> @@ -312,8 +312,7 @@ static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
>  	.verify_crc = tpm_tis_i2c_verify_crc,
>  };
>  
> -static int tpm_tis_i2c_probe(struct i2c_client *dev,
> -			     const struct i2c_device_id *id)
> +static int tpm_tis_i2c_probe(struct i2c_client *dev)
>  {
>  	struct tpm_tis_i2c_phy *phy;
>  	const u8 crc_enable = 1;
> @@ -379,7 +378,7 @@ static struct i2c_driver tpm_tis_i2c_driver = {
>  		.pm = &tpm_tis_pm,
>  		.of_match_table = of_match_ptr(of_tis_i2c_match),
>  	},
> -	.probe = tpm_tis_i2c_probe,
> +	.probe_new = tpm_tis_i2c_probe,
>  	.remove = tpm_tis_i2c_remove,
>  	.id_table = tpm_tis_i2c_id,
>  };
> -- 
> 2.38.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
