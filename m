Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B129639EAD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiK1BPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiK1BPB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:15:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA1463C1;
        Sun, 27 Nov 2022 17:15:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C4837B80B42;
        Mon, 28 Nov 2022 01:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED66DC433D6;
        Mon, 28 Nov 2022 01:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669598097;
        bh=c0qMKTEcqXedIwJS4OLE8R5q7iGVfm98yENhYrrVEIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lqEcxi3VHqUhzqI/Ce6AzwnTSLpQYfaQ7re7csCtVWdY4IU6ed5ZqOJaDB0Hky0L6
         Ri4eJRZVmM+n9bxUW+mXxJGWrEiOm6iQkA/RENjTMJlaeV+FaDfg3oCP0iJTtIqARP
         0mrQG9mVhpmVcvZwDClfQQouwJ/1s5mD/Z0hhHbRJAH7XxuxVpRqBBSWP1SQ9E+hyj
         JVdxEf399wmLHKnf/lB7y1Rx9y5qhJbjUXys36lRcirL/hU9JaioiiR2sr5aF8tsDC
         0CWsunx1Wa8F0qMCqoySfabx7ByvHOsUh0pzpBir/dovLAOJ+rzySXxbwuQElOcDq3
         vDIBv9mlSHQCA==
Date:   Mon, 28 Nov 2022 03:14:53 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 001/606] tpm: st33zp24: Convert to Convert to i2c's
 .probe_new()
Message-ID: <Y4QLjYWvqYQUtohO@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-2-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-2-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:35PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/tpm/st33zp24/i2c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/i2c.c
> index 614c7d8ed84f..0cd614933b4a 100644
> --- a/drivers/char/tpm/st33zp24/i2c.c
> +++ b/drivers/char/tpm/st33zp24/i2c.c
> @@ -101,8 +101,7 @@ static const struct st33zp24_phy_ops i2c_phy_ops = {
>   * @return: 0 in case of success.
>   *	 -1 in other case.
>   */
> -static int st33zp24_i2c_probe(struct i2c_client *client,
> -			      const struct i2c_device_id *id)
> +static int st33zp24_i2c_probe(struct i2c_client *client)
>  {
>  	struct st33zp24_i2c_phy *phy;
>  
> @@ -167,7 +166,7 @@ static struct i2c_driver st33zp24_i2c_driver = {
>  		.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
>  		.acpi_match_table = ACPI_PTR(st33zp24_i2c_acpi_match),
>  	},
> -	.probe = st33zp24_i2c_probe,
> +	.probe_new = st33zp24_i2c_probe,
>  	.remove = st33zp24_i2c_remove,
>  	.id_table = st33zp24_i2c_id
>  };
> -- 
> 2.38.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
