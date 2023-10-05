Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12D7BAE3E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 23:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjJEV6l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 17:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjJEV6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 17:58:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDF995;
        Thu,  5 Oct 2023 14:58:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44926C433C8;
        Thu,  5 Oct 2023 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696543119;
        bh=wg9da7L1CQtw+tuYOmZfz5J+NgLFvScI+3C0EoG/geo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lG/Y1i8OpAQPQat88kfyzi7NWqcNQ9Cz13NjQkWCQDOP2ullmbktnb7+j7T7OUkOb
         f5JlDNF7/gNrGv6WsIbY9PvLXmfivEukYrAgLUezsgB+ory5ukH15S8Xv4FryuoHvm
         cV6XP4Z6Hh8AKexq5/ZCHA5kDyDTcR1bhFJGILAMXqivj54d0rEwKfK6rNAAZDIKju
         4UmdJQrB8vGY0vpbClN4hFjfJpvZNUa0FqIuD82KqRjuSbdHiAIHw7AxVLYJ98X3s9
         Ahf54l68UPAnMvovAyIJZLRuXff0bqHURlk7YlgOcDStezWyy6odd8F6NpHTigPFWo
         88Q1dlHsLuGAw==
Date:   Thu, 5 Oct 2023 23:58:32 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        pierre.gondois@arm.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: mv64xxx: add support for FSM based recovery
Message-ID: <20231005215832.p4mxov6occzqmj2k@zenone.zhora.eu>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
 <20230926234801.4078042-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926234801.4078042-4-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

Looks good, just a few questions.

> +static int
> +mv64xxx_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
> +	int ret;
> +	u32 val;
> +
> +	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
> +	writel(MV64XXX_I2C_UNSTUCK_TRIGGER, drv_data->unstuck_reg);
> +	ret = readl_poll_timeout_atomic(drv_data->unstuck_reg, val,
> +					!(val & MV64XXX_I2C_UNSTUCK_INPROGRESS),
> +					1000, 5000);

here you are busy looping for 1ms between reads which is a long
time. Why not using read_poll_timeout() instead?

> +	if (ret) {
> +		dev_err(&adap->dev, "recovery timeout\n");
> +		return ret;
> +	}
> +
> +	if (val & MV64XXX_I2C_UNSTUCK_ERROR) {
> +		dev_err(&adap->dev, "recovery failed\n");
> +		return -EBUSY;
> +	}
> +
> +	dev_info(&adap->dev, "recovery complete after %d pulses\n", MV64XXX_I2C_UNSTUCK_COUNT(val));

dev_dbg?

> +	return 0;
> +}
> +

[...]

> -	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c")) {
> +	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c") ||
> +	    of_device_is_compatible(np, "marvell,armada-8k-i2c")) {

should this be part of a different patch?

>  		drv_data->offload_enabled = false;
>  		/* The delay is only needed in standard mode (100kHz) */
>  		if (bus_freq <= I2C_MAX_STANDARD_MODE_FREQ)
> @@ -936,8 +973,21 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>  }
>  #endif /* CONFIG_OF */
>  
> -static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_data,
> -					  struct device *dev)
> +static int mv64xxx_i2c_init_fsm_recovery_info(struct mv64xxx_i2c_data *drv_data,
> +					      struct device *dev)
> +{
> +	struct i2c_bus_recovery_info *rinfo = &drv_data->rinfo;
> +
> +	dev_info(dev, "using FSM for recovery\n");

dev_dbg?

> +	rinfo->recover_bus = mv64xxx_i2c_recover_bus;
> +	drv_data->adapter.bus_recovery_info = rinfo;
> +
> +	return 0;
> +
> +}
> +

[...]

> +	/* optional unstuck support */
> +	res = platform_get_resource(pd, IORESOURCE_MEM, 1);
> +	if (res) {
> +		drv_data->unstuck_reg = devm_ioremap_resource(&pd->dev, res);
> +		if (IS_ERR(drv_data->unstuck_reg))
> +			return PTR_ERR(drv_data->unstuck_reg);

OK, we failed to ioremap... but instead of returning an error,
wouldn't it be better to just set unstuck_reg to NULL and move
forward without unstuck support?

Maybe you will stil crash later because something might have
happened, but failing on purpose on an optional feature looks a
bit too drastic to me. What do you think?

Thanks,
Andi
