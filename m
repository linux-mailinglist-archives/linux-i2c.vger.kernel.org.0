Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2324F7D0995
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Oct 2023 09:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376396AbjJTHgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Oct 2023 03:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376317AbjJTHgS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Oct 2023 03:36:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9614F91;
        Fri, 20 Oct 2023 00:36:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA54C433C7;
        Fri, 20 Oct 2023 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697787376;
        bh=AymAZO6gbIxJ9L3YYTUNFLQW1Cg2kqmrNd2l5JYo0to=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S/kBVDryf8JHx3Z3OUXqZk4g//GJcCeSq9f3bmle451XltZ7TeCoU0ezXsvALksLh
         7o1sm0eDDhFv3LEN/46ypYtTH5QrLqkqHKZIbzYAEzMWZtWBnbeQg/ek1OrT3qa6o2
         c+jA6rn9/Ev09QyAXWRJD8MRUtChRBO8j67h6G9utgPmX6cmAt3Rq/YlAGti76FiFL
         SNKpqJBynfboqC7imSBnh7UWdd4xNdr+fL8yF25LskO3mwFAAXwfE7pbT0CQeJ+/Us
         zIZ6pb9SxQueTn3rO4Q4gFk65ihb4JQc6NP4pERvzJZLi0okupDZRJvZH1ibQnE7DE
         QTtu4nUZUCShw==
Date:   Fri, 20 Oct 2023 08:36:05 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/3] i2c: muxes: i2c-demux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <20231020083605.278df5f5@jic23-huawei>
In-Reply-To: <20231019101017.425284-3-herve.codina@bootlin.com>
References: <20231019101017.425284-1-herve.codina@bootlin.com>
        <20231019101017.425284-3-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 19 Oct 2023 12:10:15 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> i2c-demux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed,	i2c_put_adapter() decrements the module refcount while
Odd spacing in here - looks like some tabs sneaked in.
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
> 
> Use the	dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 22f2280eab7f..9f2e4aa28159 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -61,7 +61,7 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
>  	if (ret)
>  		goto err;
>  
> -	adap = of_find_i2c_adapter_by_node(priv->chan[new_chan].parent_np);
> +	adap = of_get_i2c_adapter_by_node(priv->chan[new_chan].parent_np);
>  	if (!adap) {
>  		ret = -ENODEV;
>  		goto err_with_revert;

