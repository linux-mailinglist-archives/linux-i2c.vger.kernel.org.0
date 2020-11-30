Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8CB2C8A8D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgK3RNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:13:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgK3RNb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 12:13:31 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0430B26;
        Mon, 30 Nov 2020 18:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606756369;
        bh=6VQyvAaUE8HxXXzA9oVZtTfhgSUB6K7rr16cFaqVi64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nlFn1S/mpFokHinyu4adMtkCO7Yf0yKGuEGeCxtJ3BeTVC/T9lvZITxKROoX4a3OR
         Ep2BsQd4pKesYclfpf7Bxc3HyzAub7H8AiXTj3h08n3CdyImZsl7OnyAdm/wVXFGi7
         aCUDb4wTuP5WjKWVlMBbu+kUCBF7jWGrtFeTMKyw=
Date:   Mon, 30 Nov 2020 19:12:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 16/18] i2c: i2c-core-base: Use the new
 i2c_acpi_dev_name() in i2c_set_dev_name()
Message-ID: <20201130171241.GP14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-17-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-17-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:27PM +0000, Daniel Scally wrote:
> From: Dan Scally <djrscally@gmail.com>
> 
> To make sure the new i2c_acpi_dev_name() always reflects the name of i2c
> devices sourced from ACPI, use it in i2c_set_dev_name().
> 
> Signed-off-by: Dan Scally <djrscally@gmail.com>

I'd squash this with 15/18, which would make it clear there's a memory
leak :-)

> ---
> Changes since RFC v3:
> 
> 	- Patch introduced
> 
>  drivers/i2c/i2c-core-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 573b5da145d1..a6d4ceb01077 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -814,7 +814,7 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
>  	}
>  
>  	if (adev) {
> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> +		dev_set_name(&client->dev, i2c_acpi_dev_name(adev));
>  		return;
>  	}
>  

-- 
Regards,

Laurent Pinchart
