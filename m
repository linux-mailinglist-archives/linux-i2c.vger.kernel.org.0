Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FC043D27
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731910AbfFMPjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:39:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40900 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731909AbfFMJyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:54:15 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C61BC25BE43;
        Thu, 13 Jun 2019 19:54:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CD4C1940483; Thu, 13 Jun 2019 11:54:10 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:54:10 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 32/34] staging: media: soc_camera: mt9t031: simplify
 getting the adapter of a client
Message-ID: <20190613095410.3wxbrwy62x5ohwen@verge.net.au>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-33-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-33-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:56:11PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/staging/media/soc_camera/mt9t031.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/soc_camera/mt9t031.c b/drivers/staging/media/soc_camera/mt9t031.c
> index 615ae9df2c57..c14f23221544 100644
> --- a/drivers/staging/media/soc_camera/mt9t031.c
> +++ b/drivers/staging/media/soc_camera/mt9t031.c
> @@ -751,7 +751,7 @@ static int mt9t031_probe(struct i2c_client *client,
>  {
>  	struct mt9t031 *mt9t031;
>  	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	int ret;
>  
>  	if (!ssdd) {
> -- 
> 2.19.1
> 
