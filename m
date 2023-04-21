Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360FB6EA067
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 02:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjDUAFj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 20:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjDUAFi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 20:05:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4B81719;
        Thu, 20 Apr 2023 17:05:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8AF764CDF;
        Fri, 21 Apr 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDBC433EF;
        Fri, 21 Apr 2023 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682035533;
        bh=jGitmSHw4NxdxcoypkFgSqd6l/1pd1LyamKSK3L2PXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E3qhRfsBiNGwLIGcnGvJi811FkDv7eNitDCTV/DGS9OldX3T+j7dEx26snweMWvCe
         gSA5I5QkAF1jkDufJu4HujIbpJS2X+d7TjYm02O1hbhxfTEETG/2M1kkZBesVbUYTE
         0d90qBOXy09uJ6p60Rl/KLvftVNiaKpmNrRS5ksgxv0t+2t6DpAWQYYPn9EOA2p2sD
         xDx+b+ndwBfVo3A2ZcqeUVw8uch7fZwFRk743XCnGIvXbwcAgojn3JJm0HkYSLuPNF
         9AIWCzkrl8lbeQykMtOrA8ZXfQsEHpb9zfq5ddI2g770ENwht7JO8FcTsBm0xBxLx0
         hKW8hEuXxV5IA==
Date:   Fri, 21 Apr 2023 02:05:29 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     jk@codeconstruct.com.au,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <20230421000529.6awtnawqgbk5orcp@intel.intel>
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415012848.1777768-3-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ryan,

On Sat, Apr 15, 2023 at 09:28:48AM +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.

This commit message is a bit messy, could you please write it
more clear?

[...]

> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret = 0;
> +
> +	i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;

Let's use dev_err_probe whenever possible, at least we keep a
coherent style.

[...]

> +	ret = devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);

isn't it better to use threaded irq? You have quite an elaborate
irq handler, you may want to use a thread for it.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n", i2c_bus->irq);
> +
> +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
> +		i2c_bus->alert_enable = 1;

true;

alert_enable is boolean, make it bool.

> +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap, &i2c_bus->alert_data);
> +		if (!i2c_bus->ara)
> +			dev_warn(dev, "Failed to register ARA client\n");
> +
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER | AST2600_I2CM_SMBUS_ALT,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	} else {
> +		i2c_bus->alert_enable = 0;

false;

I'm not going to review any further, please send the patch after
you have run checkpatch.pl on it. Thanks!

Andi
