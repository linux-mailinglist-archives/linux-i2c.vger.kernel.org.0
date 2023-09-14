Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8641C7A009D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 11:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbjINJpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 05:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjINJp1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 05:45:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976051FE7
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 02:45:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBA9C433C8;
        Thu, 14 Sep 2023 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694684723;
        bh=YT4iHK2mX4vSNfOwiC02MGXNp+5swxQo6zZBxvOWIao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JESl3BeqITx3nWZnAuVTAvZV7XBo6skYBVHwOzHDhzyt0C2/ULV1VTsBZ72IfXarY
         qaNgnabm9vCuI+RRhKqpG6aPIUiMTvle+iShhkhQotlUlptxuRUzzrboIrj5e5jpc3
         T8hehx+ku2Nqw+WvvIIz6Xv9fh4A9XQZ4uZF9DN1tjxWM8wJRRiVMIXKMdUlELVTvf
         2iut9hSLr8JqBqk3SMFkoq3ZiAAWTnbOijW4/g5kUMm455EOTCwJPJMoZ2Qyeko0QO
         rhKUySHmPcrEJgShwfUmeQr941FgMH2Y7CTI7VlDMl/bF/pGY8Z5x9j1KQ0MzqYXe9
         Scq2uPFZUFp9A==
Date:   Thu, 14 Sep 2023 10:45:17 +0100
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <20230914094517.GK13143@google.com>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 05 Sep 2023, Uwe Kleine-König wrote:

> Now that all drivers are converted to the (new) .probe() callback, the
> temporary .probe_new() can go away. \o/
> 
> Link: https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  include/linux/i2c.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 3430cc2b05a6..0dae9db27538 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -237,7 +237,6 @@ enum i2c_driver_flags {
>   * struct i2c_driver - represent an I2C device driver
>   * @class: What kind of i2c device we instantiate (for detect)
>   * @probe: Callback for device binding
> - * @probe_new: Transitional callback for device binding - do not use
>   * @remove: Callback for device unbinding
>   * @shutdown: Callback for device shutdown
>   * @alert: Alert callback, for example for the SMBus alert protocol
> @@ -272,16 +271,8 @@ enum i2c_driver_flags {
>  struct i2c_driver {
>  	unsigned int class;
>  
> -	union {
>  	/* Standard driver model interfaces */
> -		int (*probe)(struct i2c_client *client);
> -		/*
> -		 * Legacy callback that was part of a conversion of .probe().
> -		 * Today it has the same semantic as .probe(). Don't use for new
> -		 * code.
> -		 */
> -		int (*probe_new)(struct i2c_client *client);
> -	};
> +	int (*probe)(struct i2c_client *client);
>  	void (*remove)(struct i2c_client *client);

*party smiley*

Good going Uwe!

-- 
Lee Jones [李琼斯]
