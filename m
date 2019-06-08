Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7AE39EFE
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 13:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfFHLxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 07:53:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37818 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbfFHLkx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jun 2019 07:40:53 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32632DF;
        Sat,  8 Jun 2019 13:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559994051;
        bh=2pD/DWAV/LFT+GMwf8BuOm6cuztabrBNEg4O9KboG8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZQCx1eiCDJiWj9weXrSR2mt+eVr3vMSmKr2JRXMhLvVr438Kc+9jHmqwr3hqpPEzh
         jyFH/ONeVdRwsAoxiudegAlKmQqfgG4kZCPympvF3msG9Cs4AnrhrJ5GR1XmJDOs7B
         2F+v2IOoHqOBsFh4io/wy3pBapDdqhdLu33dh1RE=
Date:   Sat, 8 Jun 2019 14:40:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/34] gpu: drm: bridge: sii9234: simplify getting the
 adapter of a client
Message-ID: <20190608114036.GA4786@pendragon.ideasonboard.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190608105619.593-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Sat, Jun 08, 2019 at 12:55:41PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/gpu/drm/bridge/sii9234.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index b36bbafb0e43..25d4ad8c7ad6 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -815,7 +815,7 @@ static irqreturn_t sii9234_irq_thread(int irq, void *data)
>  static int sii9234_init_resources(struct sii9234 *ctx,
>  				  struct i2c_client *client)
>  {
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	int ret;
>  
>  	if (!ctx->dev->of_node) {
> @@ -897,7 +897,7 @@ static const struct drm_bridge_funcs sii9234_bridge_funcs = {
>  static int sii9234_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct sii9234 *ctx;
>  	struct device *dev = &client->dev;
>  	int ret;

-- 
Regards,

Laurent Pinchart
