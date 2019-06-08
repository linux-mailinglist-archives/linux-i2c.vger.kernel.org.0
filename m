Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65D539F4C
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 13:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfFHLju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 07:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfFHLju (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 07:39:50 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 338E9208C0;
        Sat,  8 Jun 2019 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559993989;
        bh=xfk2wRGEM4iv26ktKy2rXmXoYgltCUoUo9eEQWOVnKk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pQTRSkU4qclN1APUcAgyy15vvD+kWn8KddareEMCj0Tz3uURVBr/E1blj8GecqzcF
         ytzNymxwMaQLjhnd2RWVB+RUQ5m3j8yLq1P8etg6TPFubbflq8erKCTA+7ywJTH9QU
         rbo9ZcrQGZ5w6fQpqlMpk6s2aasGxd4ejYauI+qE=
Date:   Sat, 8 Jun 2019 12:39:45 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/34] iio: light: bh1780: simplify getting the adapter
 of a client
Message-ID: <20190608123945.4bef51e0@archlinux>
In-Reply-To: <20190608105619.593-4-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
        <20190608105619.593-4-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat,  8 Jun 2019 12:55:42 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/iio/light/bh1780.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/bh1780.c b/drivers/iio/light/bh1780.c
> index 340d64d0ac59..a8361006dcd9 100644
> --- a/drivers/iio/light/bh1780.c
> +++ b/drivers/iio/light/bh1780.c
> @@ -146,7 +146,7 @@ static int bh1780_probe(struct i2c_client *client,
>  {
>  	int ret;
>  	struct bh1780_data *bh1780;
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct iio_dev *indio_dev;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE))

