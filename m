Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67057687E8
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jul 2023 22:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjG3UZN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 16:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjG3UZM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 16:25:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80318E6F;
        Sun, 30 Jul 2023 13:25:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1316D60CA3;
        Sun, 30 Jul 2023 20:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DAAC433C8;
        Sun, 30 Jul 2023 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690748710;
        bh=x1t0wCpNg2HmSz334jJtp+B33GOT7KvodGTWYjxWMcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O96Knyjpbnv+P1a9fe0v+3sttKCx2Am5WWJ36UC1DFi5g9hoFz0bdOv3aBbGkg+D1
         loE2omnCWusus7JTKey3qGoR/scHz1jZ0N2Me99L2hNTTe1NrKPZbDIYXtRo8gTH5q
         fbN43ZRtzAGIkCyPoQs8/b8aID+vWwBbTDky51dG3s6KAszwzpYxxkdjoYHNsSUJIr
         HG/0xsYAmaC/Lg2+3r0kaE1GNv5n8MmHOrJwGMBhDmdPM+38WQqgSc2KysE7bx50Gm
         vMTpcDAbSeZHc4SPG+EZ+bksDwH/0419N7cQoEfybCiNJ+7zOk8w+d6kOvi/H7Ng25
         aOi6PupPCaPhQ==
Date:   Sun, 30 Jul 2023 22:25:07 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <20230730202507.ojwinyjsx7ygyavp@intel.intel>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230729160857.6332-3-clamor95@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Svyatoslav,

(I'm not going to comment at this stage on some coding issues)

On Sat, Jul 29, 2023 at 07:08:57PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Implement driver for hot-plugged I2C busses, where some devices on
> a bus are hot-pluggable and their presence is indicated by GPIO line.
> 
> This feature is mainly used by the ASUS Transformers family. The

But not just Asus, right?

> Transformers have a connector that's used for USB, charging or for
> attaching a dock-keyboard (which also has a battery and a touchpad).
> This connector probably (can't be verified since no datasheets or
> special equipment is available) has an I2C bus lines and a "detect"
> line (pulled low on the dock side) among the pins. I guess there
> is either no additional chip or a transparent bridge/buffer chip,
> but nothing that could be controlled by software. For DT this setup
> could be modelled like an I2C gate or 2-port mux with enable joining
> two I2C buses (one "closer" to the CPU as a parent).

the description looks like it's hiding many doubts for a commit
log :)

In the commit log we want to be sure on what we are doing.

[...]

> +static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)

there is no point for this to be "integer".

> +{
> +	int ret;
> +
> +	if (priv->adap.algo_data)
> +		return 0;
> +
> +	/*
> +	 * Store the dev data in adapter dev, since
> +	 * previous i2c_del_adapter might have wiped it.
> +	 */
> +	priv->adap.dev.parent = priv->dev;
> +	priv->adap.dev.of_node = priv->dev->of_node;
> +
> +	dev_dbg(priv->adap.dev.parent, "connection detected");
> +
> +	ret = i2c_add_adapter(&priv->adap);
> +	if (!ret)
> +		priv->adap.algo_data = (void *)1;

You want to set algo_data to "1" in order to keep the
activate/deactivate ordering.

But if we fail to add the adapter, what's the point to keep it
active?

> +	return ret;
> +}
> +
> +static void i2c_hotplug_deactivate(struct i2c_hotplug_priv *priv)
> +{
> +	if (!priv->adap.algo_data)
> +		return;
> +
> +	dev_dbg(priv->adap.dev.parent, "disconnection detected");
> +
> +	i2c_del_adapter(&priv->adap);
> +	priv->adap.algo_data = NULL;
> +}
> +
> +static irqreturn_t i2c_hotplug_interrupt(int irq, void *dev_id)
> +{
> +	struct i2c_hotplug_priv *priv = dev_id;
> +
> +	/* debounce */
> +	msleep(20);

can you explain this waiting and why 20ms?

Andi

> +	if (gpiod_get_value_cansleep(priv->gpio))
> +		i2c_hotplug_activate(priv);
> +	else
> +		i2c_hotplug_deactivate(priv);
> +
> +	return IRQ_HANDLED;
> +}
