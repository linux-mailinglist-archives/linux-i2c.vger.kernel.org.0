Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE1243D8E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfFMPmy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:42:54 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40494 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731836AbfFMJrW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:47:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 007F825B7FA;
        Thu, 13 Jun 2019 19:47:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0E5E0940483; Thu, 13 Jun 2019 11:47:18 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:47:17 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/34] media: i2c: ak881x: simplify getting the adapter
 of a client
Message-ID: <20190613094717.c7vc52wx5gax7psn@verge.net.au>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-7-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:55:45PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/media/i2c/ak881x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
> index 30f9db1351b9..09860603da64 100644
> --- a/drivers/media/i2c/ak881x.c
> +++ b/drivers/media/i2c/ak881x.c
> @@ -232,7 +232,7 @@ static const struct v4l2_subdev_ops ak881x_subdev_ops = {
>  static int ak881x_probe(struct i2c_client *client,
>  			const struct i2c_device_id *did)
>  {
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct ak881x *ak881x;
>  	u8 ifmode, data;
>  
> -- 
> 2.19.1
> 
