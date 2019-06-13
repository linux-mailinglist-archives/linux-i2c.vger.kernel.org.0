Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5FA43D7B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfFMPmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:42:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40554 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731861AbfFMJsv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:48:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BF2E525B7FA;
        Thu, 13 Jun 2019 19:48:48 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C67CB940483; Thu, 13 Jun 2019 11:48:46 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:48:46 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/34] media: i2c: tw9910: simplify getting the adapter
 of a client
Message-ID: <20190613094846.bveex5pb7qfw7pmi@verge.net.au>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-12-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-12-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:55:50PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> Please apply to your subsystem tree.
> 
>  drivers/media/i2c/tw9910.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 4d7cd736b930..a25a350b0ddc 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -934,8 +934,7 @@ static int tw9910_probe(struct i2c_client *client,
>  {
>  	struct tw9910_priv		*priv;
>  	struct tw9910_video_info	*info;
> -	struct i2c_adapter		*adapter =
> -		to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter		*adapter = client->adapter;
>  	int ret;
>  
>  	if (!client->dev.platform_data) {
> -- 
> 2.19.1
> 
