Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1E5729A4E
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 14:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjFIMr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 08:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238385AbjFIMrZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 08:47:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616C32D68
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 05:47:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9BF4616AA
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 12:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B33C433EF;
        Fri,  9 Jun 2023 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686314843;
        bh=z0tFTOtEkgUjPn+83RfuSIGTl+shWawDmOGjLMkiplI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aJgSTqOEd/sAVugO0Zk4LQYqOEOdQt+Lglg5YJFw3lWf356iTn40rwx4Ik2c3llE5
         sEyWMAQisLeDNKHyXbYQvZjxII1Oawp/qctVIpvKebLb3EezgfLk3glBNCJU+qFe3K
         tELP4y1sxcMuswRkIZWMDr1OOVgZ8u1GpdYUqpnvdKSrgVdsTxbzmelROTcdrYJ6se
         fuSHf1QrGfSArbrPxftWh5EGFHR/bnXk/4KVAFkloMrXhW7lRA1FL34iKuLzBOt5/H
         QlCHJZv+u3Q9Z7mPNMA8PX8akS3NLn5Pau6x0BC3eerjfaPrhpjg5O8SlhqBo6XHJg
         m0JrL7IZAo/YA==
Date:   Fri, 9 Jun 2023 14:47:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     krzk@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230609124720.lir2brhmlpiekrvs@intel.intel>
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One more thing,

> +static irqreturn_t zxi2c_irq_handle(int irq, void *dev_id)
> +{
> +	struct zxi2c *i2c = (struct zxi2c *)dev_id;
> +	void __iomem *regs = i2c->regs;
> +	u8 status = zxi2c_get_irq_status(regs);
> +
> +	if ((status & ZXI2C_STS_MASK) == 0)
> +		return IRQ_NONE;
> +
> +	if (status & ZXI2C_SCL_TIMEOUT)
> +		dev_warn(i2c->dev, "timeout(HW), ID: 0x%X\n", i2c->addr);
> +
> +	if (status & ZXI2C_STS_ADDRNACK) {
> +		dev_dbg(i2c->dev, "addr NACK, ID: 0x%X\n", i2c->addr);
> +	} else if (status & ZXI2C_STS_BYTEEND) {
> +		i2c->byte_left--;
> +		if (!i2c->is_read) {
> +			if (zxi2c_is_nack(regs)) {
> +				status = ZXI2C_STS_BYTENACK;
> +				i2c->byte_left++;
> +				dev_err(i2c->dev, "data NACK, ID: 0x%X\n",
> +					i2c->addr);

form these dev_warn, dev_dbg, dev_err in an irq context, what
worries me is that if something goes wrong you would flood the
dmesg with error/warning/debug messages.

How about using

	dev_err_ratelimited()
	dev_warn_ratelimited()
	dev_dbg_ratelimited()

?

Andi

> +			} else if (i2c->byte_left == 0 && i2c->is_last_msg) {
> +				zxi2c_stop_wr(regs);
> +			}
> +		}
> +	}
> +
> +	i2c->event = status;
> +	zxi2c_clear_status(regs);
> +	wake_up(&i2c->waitq);
> +
> +	return IRQ_HANDLED;
> +}
