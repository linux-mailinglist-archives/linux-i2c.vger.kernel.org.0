Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1349A15D487
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2020 10:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgBNJSG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Feb 2020 04:18:06 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46047 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727965AbgBNJSG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Feb 2020 04:18:06 -0500
Received: from [IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382]
 ([IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2X6ojHIFp8i432X6pjP8yE; Fri, 14 Feb 2020 10:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581671883; bh=LUh4di6zAEFWeam3N6EsoQ7folItL0XQ9ivPR1ITQ6k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cI86KwOSdMtRpQryg2HtvffZf5WTNw0mipNbVmgZEsb738bcsrBMHdzJQhUcjQiG5
         Sl8JAhQV7lGwgltkROkEGKi/RuIvB/4DVpdgFiEa1SvmdtDKxetMDstCv8RRiWoSPP
         Di1j/PW0YBqEx9Rulrs1psbh1uHrYMJ854OliKAsuqH9saK8o3ubZ/Ic65qGzyOpVK
         OBice3mt5Y7DSFdW6I/ETK6njUmUezXnmYRsM3l33WbVeB4TifHgfCwMh+vFMdChKW
         4re7brsnLmSGjnZnpgsovECzxN3Afc2NM/tSc3hq44rkrVYdr0+x5dElglLA5NotTv
         OmL2XItqc99Qg==
Subject: Re: [PATCH V2 RESEND] media: v4l2-core: convert to new API with
 ERRPTR
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200210165621.5189-1-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1e7e14b6-964d-0715-8cfd-364ff4806e22@xs4all.nl>
Date:   Fri, 14 Feb 2020 10:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210165621.5189-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEa7FPJGZFYjpQh5PtkqfWiV30ZCOs7H02d+T6Ksf1Wr9Mpl7TIdPAcreVdKP6TYdbdthezFywee/7UtsuxpEtxDAizJdHgkz6jpGbpg0KbrdZf0UQto
 Hq9BMC9k926IEVY6oFNYNiZISBrisjerdlFXzul3VSpgsSqFv86ocsLj2FcO/7OkdwWgec5ENK23AgkqkzD5/Stpq/17Hmm2eSfjMR1RPyqWpqv/7aLszkR0
 I4fLpC2OSb8Wr/jx5J6ytVxCv3JSkP71LfLimV3Ce3kp61hMWvcrLT+kIRhChORf+WhxsI+TZlwJnbDTOTHI8pxmabnN7i/7VowuBuuPoKYnIerqW286Rdt+
 sYdIY+CEg+hgw38q5JyKXRG/bdSqT7KBw6WW1Qpnn0dm4yIwZ0w=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/10/20 5:56 PM, Wolfram Sang wrote:
> Use the new APIs instead of the deprecated ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I'm dropping this resend from patchwork since it is in the still pending
PR https://patchwork.linuxtv.org/patch/61113/.

That PR missed the cut for v5.6, so will be merged for v5.7.

Regards,

	Hans

> ---
> 
> Resent from proper email address. Sorry for the confusion!
> 
>  drivers/media/v4l2-core/v4l2-i2c.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
> index 5bf99e7c0c09..b4acca75644b 100644
> --- a/drivers/media/v4l2-core/v4l2-i2c.c
> +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> @@ -74,10 +74,10 @@ struct v4l2_subdev
>  
>  	/* Create the i2c client */
>  	if (info->addr == 0 && probe_addrs)
> -		client = i2c_new_probed_device(adapter, info, probe_addrs,
> -					       NULL);
> +		client = i2c_new_scanned_device(adapter, info, probe_addrs,
> +						NULL);
>  	else
> -		client = i2c_new_device(adapter, info);
> +		client = i2c_new_client_device(adapter, info);
>  
>  	/*
>  	 * Note: by loading the module first we are certain that c->driver
> @@ -88,7 +88,7 @@ struct v4l2_subdev
>  	 * want to use the i2c device, so explicitly loading the module
>  	 * is the best alternative.
>  	 */
> -	if (!client || !client->dev.driver)
> +	if (!i2c_client_has_driver(client))
>  		goto error;
>  
>  	/* Lock the module so we can safely get the v4l2_subdev pointer */
> @@ -110,7 +110,7 @@ struct v4l2_subdev
>  	 * If we have a client but no subdev, then something went wrong and
>  	 * we must unregister the client.
>  	 */
> -	if (client && !sd)
> +	if (!IS_ERR(client) && !sd)
>  		i2c_unregister_device(client);
>  	return sd;
>  }
> 

