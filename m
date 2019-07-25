Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27530744C2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 07:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390466AbfGYFME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 01:12:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:34441 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390362AbfGYFME (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jul 2019 01:12:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AFB1C60474; Thu, 25 Jul 2019 06:12:02 +0100 (BST)
Date:   Thu, 25 Jul 2019 06:12:02 +0100
From:   Sean Young <sean@mess.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ir-kbd-i2c: prevent potential NULL pointer
 access
Message-ID: <20190725051202.o47mz4unbn63z6uk@gofer.mess.org>
References: <20190722172632.4402-1-wsa+renesas@sang-engineering.com>
 <20190722172632.4402-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722172632.4402-2-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 07:26:31PM +0200, Wolfram Sang wrote:
> i2c_new_dummy() can fail returning a NULL pointer. The code does not
> bail out in this case and the returned pointer is blindly used.

I don't see how. The existing code tries to set up the tx part; if
i2c_new_dummy() return NULL then the rcdev is registered without tx,
and tx_c is never used.

> Convert
> to devm_i2c_new_dummy_device() which returns an ERR_PTR and also bail
> out when failing the validity check.

Possibly I was being overly cautious with not bailing out if tx can't
be registered; moving to devm is probably a good idea. However the
commit message is misleading, because the existing code has no
NULL pointer access.

Sean

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/i2c/ir-kbd-i2c.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
> index 876d7587a1da..f46717052efc 100644
> --- a/drivers/media/i2c/ir-kbd-i2c.c
> +++ b/drivers/media/i2c/ir-kbd-i2c.c
> @@ -885,9 +885,12 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	INIT_DELAYED_WORK(&ir->work, ir_work);
>  
>  	if (probe_tx) {
> -		ir->tx_c = i2c_new_dummy(client->adapter, 0x70);
> -		if (!ir->tx_c) {
> +		ir->tx_c = devm_i2c_new_dummy_device(&client->dev,
> +						     client->adapter, 0x70);
> +		if (IS_ERR(ir->tx_c)) {
>  			dev_err(&client->dev, "failed to setup tx i2c address");
> +			err = PTR_ERR(ir->tx_c);
> +			goto err_out_free;
>  		} else if (!zilog_init(ir)) {
>  			ir->carrier = 38000;
>  			ir->duty_cycle = 40;
> @@ -904,9 +907,6 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	return 0;
>  
>   err_out_free:
> -	if (ir->tx_c)
> -		i2c_unregister_device(ir->tx_c);
> -
>  	/* Only frees rc if it were allocated internally */
>  	rc_free_device(rc);
>  	return err;
> @@ -919,9 +919,6 @@ static int ir_remove(struct i2c_client *client)
>  	/* kill outstanding polls */
>  	cancel_delayed_work_sync(&ir->work);
>  
> -	if (ir->tx_c)
> -		i2c_unregister_device(ir->tx_c);
> -
>  	/* unregister device */
>  	rc_unregister_device(ir->rc);
>  
> -- 
> 2.20.1
