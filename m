Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D089218B3A2
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 13:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgCSMlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 08:41:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55090 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgCSMlg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 08:41:36 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 56D60296D4F;
        Thu, 19 Mar 2020 12:41:34 +0000 (GMT)
Date:   Thu, 19 Mar 2020 13:41:31 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i3c@lists.infradead.org
Subject: Re: [RFC PATCH v2 3/6] i2c: of: remove superfluous parameter from
 exported function
Message-ID: <20200319134131.72715b0f@collabora.com>
In-Reply-To: <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
        <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 18 Mar 2020 16:00:56 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> 'dev' is only used for printing an error message. However, that
> information is not needed because '%pOF' fully describes the location of
> the error. Drop the 'dev' and remove the superfluous parameter.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/i2c/i2c-core-of.c | 7 +++----
>  drivers/i3c/master.c      | 2 +-
>  include/linux/i2c.h       | 6 ++----
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index d8d111ad6c85..710704cd583e 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -19,8 +19,7 @@
>  
>  #include "i2c-core.h"
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info)
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>  {
>  	u32 addr;
>  	int ret;
> @@ -29,7 +28,7 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>  
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
> -		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
> +		pr_err("of_i2c: invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> @@ -69,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  
>  	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
>  
> -	ret = of_i2c_get_board_info(&adap->dev, node, &info);
> +	ret = of_i2c_get_board_info(node, &info);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f8f896fa0c3..cc0549a9fc64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1943,7 +1943,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (!boardinfo)
>  		return -ENOMEM;
>  
> -	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
> +	ret = of_i2c_get_board_info(node, &boardinfo->base);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f834687989f7..d84aaf0d83d5 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -942,8 +942,7 @@ const struct of_device_id
>  *i2c_of_match_device(const struct of_device_id *matches,
>  		     struct i2c_client *client);
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info);
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info);
>  
>  #else
>  
> @@ -969,8 +968,7 @@ static inline const struct of_device_id
>  	return NULL;
>  }
>  
> -static inline int of_i2c_get_board_info(struct device *dev,
> -					struct device_node *node,
> +static inline int of_i2c_get_board_info(struct device_node *node,
>  					struct i2c_board_info *info)
>  {
>  	return -ENOTSUPP;

