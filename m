Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD1D095A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 10:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfJIIPC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 04:15:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32976 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJIIPC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Oct 2019 04:15:02 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3477A4FF;
        Wed,  9 Oct 2019 10:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570608899;
        bh=++ntxKRvSWOvvroIqsnx23Cq7lZXrSkD/go2481uxUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aogUTJealSc4dmR3mdqA/NgRAH0cmHX7YrCr5WNicv5tBBTJVfy0h3/+Vv0VuUjFG
         ImD7nUNITRrYejOX5O9JqjmgnBhtX7la+MpjaE/IkFs766ggiTViN+QUJJKVF38T0W
         diK0f/vp5PShKgv6QYcD7gDx5nSZvLlQLlCE5lSI=
Date:   Wed, 9 Oct 2019 11:14:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
Message-ID: <20191009081458.GB22998@pendragon.ideasonboard.com>
References: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Tue, Oct 08, 2019 at 10:31:45PM +0200, Wolfram Sang wrote:
> Move from the deprecated i2c_new_dummy() to i2c_new_dummy_device(). We
> now get an ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Rebased to v5.4-rc2 since last time. One of the last two users of the
> old API, so please apply soon, so I can remove the old interface. Only
> build tested.
> 
>  drivers/gpu/drm/bridge/analogix-anx78xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> index 3c7cc5af735c..be7756280e41 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> @@ -1350,10 +1350,10 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
>  
>  	/* Map slave addresses of ANX7814 */
>  	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
> -		anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
> +		anx78xx->i2c_dummy[i] = i2c_new_dummy_device(client->adapter,
>  						anx78xx_i2c_addresses[i] >> 1);
> -		if (!anx78xx->i2c_dummy[i]) {
> -			err = -ENOMEM;
> +		if (IS_ERR(anx78xx->i2c_dummy[i])) {
> +			err = PTR_ERR(anx78xx->i2c_dummy[i]);
>  			DRM_ERROR("Failed to reserve I2C bus %02x\n",
>  				  anx78xx_i2c_addresses[i]);
>  			goto err_unregister_i2c;

-- 
Regards,

Laurent Pinchart
