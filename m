Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9636C7D0993
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Oct 2023 09:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376390AbjJTHfC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Oct 2023 03:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376317AbjJTHfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Oct 2023 03:35:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125BD91;
        Fri, 20 Oct 2023 00:35:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7958EC433C7;
        Fri, 20 Oct 2023 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697787299;
        bh=LuJ0EX2tXxho4nJTr8yfLdNrGYlhYAkXm6+rPpQQTKI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aYIXA7yuJplTFlsba10PHWyASznbHDLRFDB1Jbh0PbjcXOEe1sFLkMRCecB1EYRPw
         65SCVp8asIlIr+gB/DNrCBi/csSwpm5QSWAKuGlYl35CNWAkMySMBHc7Tqd/Xnk7Kh
         8nKuUmiidgseqR5T2PKMLRIFJaJGQNNAT27u6XnXazxKPplRGpGc000k9nfFf8MALF
         FG1TOtK9vc2s70blsMD1P1OUg8/ZdUV36EZuLxZhNwxkYV0RVqkOdUSHbr+TziOSPH
         snu0m8rJhKyD25djVPC2Fd+9TOaWIk0HxJJrfutiU1j5MMhf4u6C7ySG/0law8D/UD
         uKs0mfs2ie/4w==
Date:   Fri, 20 Oct 2023 08:34:49 +0100
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
Subject: Re: [PATCH v2 1/3] i2c: muxes: i2c-mux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <20231020083449.3393191f@jic23-huawei>
In-Reply-To: <20231019101017.425284-2-herve.codina@bootlin.com>
References: <20231019101017.425284-1-herve.codina@bootlin.com>
        <20231019101017.425284-2-herve.codina@bootlin.com>
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

On Thu, 19 Oct 2023 12:10:14 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
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
> Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/i2c/muxes/i2c-mux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> index 18236b9fa14a..6ebca7bfd8a2 100644
> --- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> @@ -62,7 +62,7 @@ static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
>  		dev_err(dev, "Cannot parse i2c-parent\n");
>  		return ERR_PTR(-ENODEV);
>  	}
> -	parent = of_find_i2c_adapter_by_node(parent_np);
> +	parent = of_get_i2c_adapter_by_node(parent_np);
>  	of_node_put(parent_np);
>  	if (!parent)
>  		return ERR_PTR(-EPROBE_DEFER);

