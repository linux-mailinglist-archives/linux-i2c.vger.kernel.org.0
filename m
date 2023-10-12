Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6997C77B9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 22:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347375AbjJLUPs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 16:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344131AbjJLUPs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 16:15:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BF0C0;
        Thu, 12 Oct 2023 13:15:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEDAC433C8;
        Thu, 12 Oct 2023 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697141746;
        bh=uxbafwMSKPAuWsobVTD03FL1mfzA+6nOjp0q9wlUssc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V+oU7ODQy+l57RW4bWyZRK7Ux1uSerl0wn8edtUk8VEVXSI0y/d1sBMe4JG8HGAun
         pRFHcNn/492mMeowUMSi6Z/PN5t2TtgABuW2wy6nax/4+0mJx9Kz3HTyatldrte+PM
         0QEBSPBNda4hF0nY5xPYeOh4FLLljGOPsYupsQ9Hf+FireOhpcJUuzy2WE4Cdx6Got
         iP8sgPFkYupDDQJsv4icPkmwiTOJWhYOi128RRgytb9SxegDRIOgOBR1iPWzAJ7UVG
         /n20nEo5EnTugsDaJ25nlluOL3dmQf7+S4wYn+xBvOJeD8CvHtjrOuWcJ2NE7iu0ne
         un5ziBP4YecrA==
Date:   Thu, 12 Oct 2023 22:15:41 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        pierre.gondois@arm.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: mv64xxx: add support for FSM based recovery
Message-ID: <20231012201541.nzlxyjngm3d5asir@zenone.zhora.eu>
References: <20231006003321.2100016-1-chris.packham@alliedtelesis.co.nz>
 <20231006003321.2100016-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006003321.2100016-4-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

...

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
> +					10, 1000);

mmmhhh... still a bit skeptical about waiting 100 times 10us in
atomic.

I'm still of the opinion that this should run in a separate
thread. Any different opinion from the network?

BTW, first question, considering that you decreased the time
considerably... does it work?

Andi
