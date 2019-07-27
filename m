Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5CA77BA5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jul 2019 21:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbfG0T4q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Jul 2019 15:56:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388004AbfG0T4q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Jul 2019 15:56:46 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C66272083B;
        Sat, 27 Jul 2019 19:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564257405;
        bh=CGf2yeOtB5OppLv91IleKJBexkBJqF5tbvujn6zHJ6k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aOv8MxEtvpMMK6M9IOLoVkGdCrLbYDJA0n3cbtmC0v8JNWULBbXiv5DWOGzJuU5UM
         9C49qcxQyXzqd7k5IDK9sDkmDLAshGyJ/DWTtNhOZ3xrD6PM5NFFMB+yZHJ6lCijt2
         azLW6f4v6MSYAcDPgyM48NZ8lNyLNrxbbgp/RWr4=
Date:   Sat, 27 Jul 2019 20:56:40 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: light: cm36651: convert to
 i2c_new_dummy_device
Message-ID: <20190727205640.2686db5f@archlinux>
In-Reply-To: <20190722172613.3890-2-wsa+renesas@sang-engineering.com>
References: <20190722172613.3890-1-wsa+renesas@sang-engineering.com>
        <20190722172613.3890-2-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019 19:26:11 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi,

Hmm. I've been rather busy recently so the IIO tree is based before this
got introduced.

Meh, it's early in the cycle so I'm just going to rebase and hope it
doesn't cause anyone too much pain.  I suspect the number of people
tracking my togreg branch is very small to 0.

Applied to a rebase version of the togreg branch of iio.git and
pushed out as testing for the autobuilders to poke at it.

Thanks,

Jonathan


> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/iio/light/cm36651.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/light/cm36651.c b/drivers/iio/light/cm36651.c
> index 7702c2bcbcfa..1019d625adb1 100644
> --- a/drivers/iio/light/cm36651.c
> +++ b/drivers/iio/light/cm36651.c
> @@ -646,18 +646,18 @@ static int cm36651_probe(struct i2c_client *client,
>  	i2c_set_clientdata(client, indio_dev);
>  
>  	cm36651->client = client;
> -	cm36651->ps_client = i2c_new_dummy(client->adapter,
> +	cm36651->ps_client = i2c_new_dummy_device(client->adapter,
>  						     CM36651_I2C_ADDR_PS);
> -	if (!cm36651->ps_client) {
> +	if (IS_ERR(cm36651->ps_client)) {
>  		dev_err(&client->dev, "%s: new i2c device failed\n", __func__);
> -		ret = -ENODEV;
> +		ret = PTR_ERR(cm36651->ps_client);
>  		goto error_disable_reg;
>  	}
>  
> -	cm36651->ara_client = i2c_new_dummy(client->adapter, CM36651_ARA);
> -	if (!cm36651->ara_client) {
> +	cm36651->ara_client = i2c_new_dummy_device(client->adapter, CM36651_ARA);
> +	if (IS_ERR(cm36651->ara_client)) {
>  		dev_err(&client->dev, "%s: new i2c device failed\n", __func__);
> -		ret = -ENODEV;
> +		ret = PTR_ERR(cm36651->ara_client);
>  		goto error_i2c_unregister_ps;
>  	}
>  

