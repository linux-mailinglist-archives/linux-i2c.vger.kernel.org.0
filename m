Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35DD543D1A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfFMPje (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:39:34 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40930 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731921AbfFMJy0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:54:26 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 31BC625BE48;
        Thu, 13 Jun 2019 19:54:24 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3954E940483; Thu, 13 Jun 2019 11:54:22 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:54:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 33/34] staging: media: soc_camera: soc_mt9v022: simplify
 getting the adapter of a client
Message-ID: <20190613095421.qmi7665txyszhkwn@verge.net.au>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-34-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-34-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:56:12PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/staging/media/soc_camera/soc_mt9v022.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/soc_camera/soc_mt9v022.c b/drivers/staging/media/soc_camera/soc_mt9v022.c
> index e7e0d3d29499..1739a618846d 100644
> --- a/drivers/staging/media/soc_camera/soc_mt9v022.c
> +++ b/drivers/staging/media/soc_camera/soc_mt9v022.c
> @@ -883,7 +883,7 @@ static int mt9v022_probe(struct i2c_client *client,
>  {
>  	struct mt9v022 *mt9v022;
>  	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct mt9v022_platform_data *pdata;
>  	int ret;
>  
> -- 
> 2.19.1
> 
