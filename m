Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245F3639EB6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiK1BPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiK1BPn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:15:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE317677;
        Sun, 27 Nov 2022 17:15:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CC7260F2D;
        Mon, 28 Nov 2022 01:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBF0C433C1;
        Mon, 28 Nov 2022 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669598140;
        bh=CalTvPg8wCdgEbLF3hG0Q+1+uznyY15QtTUtXniSO/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rVfXUSh/F6w3G4uadWMlBKnIMUy+H8TPSbkzGeC1pHV9+ZneKwdRiE4Zqih2lx5M/
         M5wozer4D0TJZlKiLPlruaDSbgQZyt0nElLPQZUGlSZwP9ywrIK5lHj36amMK/w0Wf
         gLsaTHYYmUN0iJxzcQhX+Pw7Gwi/diWQN7/mKamtkHHiHVQk9JLMIZ5Zqr+rMNyLHP
         c0kxXolTTpbukxYEld/W205PTRo5ruq1vPM0pLLX3r0Y8rvPcZ6/r4rAjApr9gJrhN
         2WNKZAvUHl6qUsLhlJchQgeUCplOZQDxHfHt41rh7chCNhvuZ/2s94X8oKhO8rmoSx
         MtOoye/9jFW6w==
Date:   Mon, 28 Nov 2022 03:15:36 +0200
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
Subject: Re: [PATCH 003/606] tpm: tpm_i2c_infineon: Convert to i2c's
 .probe_new()
Message-ID: <Y4QLuBB+HLF4DkWI@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-4-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-4-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:37PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/tpm/tpm_i2c_infineon.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
> index fd3c3661e646..7cdaff52a96d 100644
> --- a/drivers/char/tpm/tpm_i2c_infineon.c
> +++ b/drivers/char/tpm/tpm_i2c_infineon.c
> @@ -681,8 +681,7 @@ MODULE_DEVICE_TABLE(of, tpm_tis_i2c_of_match);
>  
>  static SIMPLE_DEV_PM_OPS(tpm_tis_i2c_ops, tpm_pm_suspend, tpm_pm_resume);
>  
> -static int tpm_tis_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int tpm_tis_i2c_probe(struct i2c_client *client)
>  {
>  	int rc;
>  	struct device *dev = &(client->dev);
> @@ -717,7 +716,7 @@ static void tpm_tis_i2c_remove(struct i2c_client *client)
>  
>  static struct i2c_driver tpm_tis_i2c_driver = {
>  	.id_table = tpm_tis_i2c_table,
> -	.probe = tpm_tis_i2c_probe,
> +	.probe_new = tpm_tis_i2c_probe,
>  	.remove = tpm_tis_i2c_remove,
>  	.driver = {
>  		   .name = "tpm_i2c_infineon",
> -- 
> 2.38.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
