Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B764E39E03
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 13:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbfFHLnQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 07:43:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728670AbfFHLnP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jun 2019 07:43:15 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA9335D;
        Sat,  8 Jun 2019 13:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559994193;
        bh=fx0n19qeDMTimK0VJDa0BLED3Bsk5ypjzYYcWtyI8qM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDPaD+uGBOpeDGvPUnyFI/5vah3s3AzGNxyTy1RxJCRRphTDxgBJJM1VZqVDcP1cl
         EZGYUzEMYUy/3PWydkLoruilef7KKBLifnP6pwg364yGk+Z7xxJJYiwa4KTR+KEyLn
         4r+q6zI8+SEipYfGasvIMBKiQ3P4khCzwqZaDIDA=
Date:   Sat, 8 Jun 2019 14:42:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/34] media: i2c: mt9p031: simplify getting the adapter
 of a client
Message-ID: <20190608114259.GB4786@pendragon.ideasonboard.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-10-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190608105619.593-10-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Sat, Jun 08, 2019 at 12:55:48PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/media/i2c/mt9p031.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 715be3632b01..5d824dd33edd 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1034,7 +1034,7 @@ static int mt9p031_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *did)
>  {
>  	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct mt9p031 *mt9p031;
>  	unsigned int i;
>  	int ret;

-- 
Regards,

Laurent Pinchart
