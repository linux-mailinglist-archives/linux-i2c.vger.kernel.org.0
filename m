Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0516DF14F7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfKFLYK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:24:10 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:45109 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbfKFLYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:24:10 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJPviPSTwTzKrSJPziyAi1; Wed, 06 Nov 2019 12:24:08 +0100
Subject: Re: [RFC PATCH 12/12] media: v4l2-core: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-13-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4799e282-2f49-a0ae-8396-ee8f0fa26064@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-13-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ0z9ugTAiIGMFQtuOXFD4BDdp1quJn20dF04acRBYYGdUg5s05sQzKopywruJFux6tz0HVf/rsMOGdrzTN/7PfQ18+cglKE9HM/3EjAJm/wM5V/FRMC
 Pku36bLhs24G5YCZd6scmWbxmNEEfrHDNQVRurOzFKRgQVtzeYFuTKAe4Ie+6xFT+wquLICDb9Uq9RsZzp+BbDc62WVjMLxUJiTHpnNp0SY4wpBcwvioee6g
 wMGb3pb2F26CKQkcu0qXaUfp/fknLMOQvUGKHHdH6a8NulvyG1mLSgZrpXoxNqmTRYWaC8rMV1FdWDTDJ4xAkt4klhrWTEeBKENCUEr2v2tYjIEYsmY4jec2
 woG3FwVqC+0rg4YDIbwixpsloKp+isaxjn5ZXG297xMCVRpoJq6PS1MZFaE4ANVj/epgAWZIoRCUX0odkioWNJciMD7TuA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/19 10:50 AM, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/media/v4l2-core/v4l2-i2c.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
> index 5bf99e7c0c09..25ddda3b7ce6 100644
> --- a/drivers/media/v4l2-core/v4l2-i2c.c
> +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> @@ -74,10 +74,10 @@ struct v4l2_subdev
>  
>  	/* Create the i2c client */
>  	if (info->addr == 0 && probe_addrs)
> -		client = i2c_new_probed_device(adapter, info, probe_addrs,
> -					       NULL);
> +		client = i2c_new_scanned_device(adapter, info, probe_addrs,
> +					        NULL);
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
> +	if (IS_ERR(client) || !client->dev.driver)
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

