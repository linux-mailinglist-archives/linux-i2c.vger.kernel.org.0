Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A357BAF3C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 01:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjJEXKV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 19:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjJEXIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 19:08:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5845211B;
        Thu,  5 Oct 2023 16:07:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66543C433C7;
        Thu,  5 Oct 2023 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696547262;
        bh=SLxoCaj8+sjzohhZAKAeitCTwO69mwCyvpBXx/t3mn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eqVpbGcZYRKBnm1peUNSFdaEbGBkiVzzK9XT0+U9GtZSBzyVT0XT1/fzM3QYQIzD7
         vp5vXGgdVO60OwsJDq2ekLnAWy6jMdflpjNR1ZN3hZKSUSyrOJ73vLU/ULSgUW2etD
         a6R32TzhXCg0Z6lGQ+QIsQK5IWGpCKZ/cfWr147n68P4T5zOZVA8QQhjLNJkFwM5Jg
         sSbEJ+TXGxZSgB87hJpTNNdNav1mL6YthEqe8ZqDpehIRgd8kIwFyavyJt62J1DMH7
         Q3k4e3SEynwm59DGiIZoUlRjI4/+Ho2UFrFfg7y/HV5HJt98OtESzPpgP6bHyId4GA
         1i0TZKOZ/Mjew==
Date:   Fri, 6 Oct 2023 01:07:37 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "pierre.gondois@arm.com" <pierre.gondois@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] i2c: mv64xxx: add support for FSM based recovery
Message-ID: <20231005230737.6j57y7d27vnsbws3@zenone.zhora.eu>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
 <20230926234801.4078042-4-chris.packham@alliedtelesis.co.nz>
 <20231005215832.p4mxov6occzqmj2k@zenone.zhora.eu>
 <57c27eb5-1145-4a84-a7b6-ff785d7a1eeb@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57c27eb5-1145-4a84-a7b6-ff785d7a1eeb@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

> >> +static int
> >> +mv64xxx_i2c_recover_bus(struct i2c_adapter *adap)
> >> +{
> >> +	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
> >> +	int ret;
> >> +	u32 val;
> >> +
> >> +	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
> >> +	writel(MV64XXX_I2C_UNSTUCK_TRIGGER, drv_data->unstuck_reg);
> >> +	ret = readl_poll_timeout_atomic(drv_data->unstuck_reg, val,
> >> +					!(val & MV64XXX_I2C_UNSTUCK_INPROGRESS),
> >> +					1000, 5000);
> > here you are busy looping for 1ms between reads which is a long
> > time. Why not using read_poll_timeout() instead?
> 
> I needed to use the atomic variant because this ends up getting called 
> from an interrupt handler (mv64xxx_i2c_intr() -> mv64xxx_i2c_fsm()). I 
> probably don't need to wait so long between reads those times were just 
> pulled out of thin air. In my experimentation the faults that can be 
> cleared do so within a couple of clocks, if it hasn't cleared within 8 
> clocks it's not going to.

It's still a long time to wait in atomic context...
readl_poll_timeout_atomic() waits in udelays, where the maximum
accepted waiting time is 10us. Here you are waiting 100 times
more.

If we can't be within that value I would rather use a thread.

Or, you could also consider using threaded_irq()... but this
might have a bit of a higher impact.

[...]

> >> +	/* optional unstuck support */
> >> +	res = platform_get_resource(pd, IORESOURCE_MEM, 1);
> >> +	if (res) {
> >> +		drv_data->unstuck_reg = devm_ioremap_resource(&pd->dev, res);
> >> +		if (IS_ERR(drv_data->unstuck_reg))
> >> +			return PTR_ERR(drv_data->unstuck_reg);
> > OK, we failed to ioremap... but instead of returning an error,
> > wouldn't it be better to just set unstuck_reg to NULL and move
> > forward without unstuck support?
> >
> > Maybe you will stil crash later because something might have
> > happened, but failing on purpose on an optional feature looks a
> > bit too drastic to me. What do you think?
> 
> Personally I think if the reg property is supplied in the dts we'd 
> better be able to use it. If the feature is not wanted then the way to 
> indicate this is by supplying only one reg cell.
> 
> I'd be happy with a dev_warn() and unstuck_reg = NULL if that helps get 
> this landed.

Don't ahve a strong opinion... as you like. Mine is just an
opinion and your argument is valid :-)

Andi
