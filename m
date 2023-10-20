Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D24D7D099B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Oct 2023 09:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376421AbjJTHhq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Oct 2023 03:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376317AbjJTHhp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Oct 2023 03:37:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D03593;
        Fri, 20 Oct 2023 00:37:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0980BC433C7;
        Fri, 20 Oct 2023 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697787464;
        bh=GI0hZ0zC3w4UUqmfCOExvfTwcUMptnt24qo2d5p1zbE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Vd7RPiiDjoRn2Pf5P5hsRPkxBRtoOCxPVHBrqddJRbvy31jolrs/XDfbrce9fZzJo
         uk7X9vbTNc85QlTeMdscZWrPwfEXxKvpKfsvXR9dKuRv8+ywId3MnH5C4kTGnayD+0
         RDGngcjYm398wLzCBsVfrTX93usg9qtKDUpZBdav1Nqt/irXGymExdD+Z/gTMva75E
         wRWn3Augi+8zw77eaMNV5x99e8IQHoCU7zaxV99Jx4kyCCCJfwvEULjKOkphPFV3fM
         ti7izaewwiOSX2Z9vG3oYxkTwndj0znxoHSDrolObqpRejY6ay9ZscrVlkDyWUGbbp
         4WC2HH73tJz4Q==
Date:   Fri, 20 Oct 2023 08:37:34 +0100
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
Subject: Re: [PATCH v2 3/3] i2c: muxes: i2c-mux-gpmux: Use
 of_get_i2c_adapter_by_node()
Message-ID: <20231020083734.20fed5c5@jic23-huawei>
In-Reply-To: <20231019101017.425284-4-herve.codina@bootlin.com>
References: <20231019101017.425284-1-herve.codina@bootlin.com>
        <20231019101017.425284-4-herve.codina@bootlin.com>
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

On Thu, 19 Oct 2023 12:10:16 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> i2c-mux-gpmux uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
> 
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/i2c/muxes/i2c-mux-gpmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index baccf4bfaf02..8305661e1253 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -52,7 +52,7 @@ static struct i2c_adapter *mux_parent_adapter(struct device *dev)
>  		dev_err(dev, "Cannot parse i2c-parent\n");
>  		return ERR_PTR(-ENODEV);
>  	}
> -	parent = of_find_i2c_adapter_by_node(parent_np);
> +	parent = of_get_i2c_adapter_by_node(parent_np);
>  	of_node_put(parent_np);
>  	if (!parent)
>  		return ERR_PTR(-EPROBE_DEFER);

