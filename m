Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C1F72F7AF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjFNIVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbjFNIVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:21:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A772189
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 01:21:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 321B763725
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 08:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C31C433C0;
        Wed, 14 Jun 2023 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686730909;
        bh=Ns1MiWR6esOI5bHQkePdBLVbg25z7F+DWRDefAzhr20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dfN77VBSYWz5XrbTUEcD793Z1xFF+qIGUGQODty+RlCaQ2xvmC8WPELZvPacAejLc
         vMPo++KRgnrB1YKKxF7BbbQlIQ67mYLK0WQJ1KnaR3s6ykRu8CzdnPIGFqudC5E50w
         4MH/bcs1UsQTBxwGTh6JxNPEKPRM6jY/1/llDDnQ8EQZHJdjjgQTKry1GhDSLRY+4f
         rmn9JrxrBGFn2+/SXO1jGBJAQnaIyQduqufSrTkZWB17hE13NJkgTkxqxJDzPN68+h
         6UeCd27UyQ9Vjb1lL5o5i6rMLI/xassJ0h7rSgTl1I5atbk/xvT3cjfZV28qOuegzy
         0K0JuLyBvvLnA==
Date:   Wed, 14 Jun 2023 10:21:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     krzk@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
Subject: Re: [PATCH v5] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230614082146.ogcgsxsqdzgfhnur@intel.intel>
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
 <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Wed, Jun 14, 2023 at 03:34:33PM +0800, Hans Hu wrote:
> Add Zhaoxin I2C controller driver. It provides the access to the i2c
> busses, which connects to the touchpad, eeprom, etc.
> 
> Zhaoxin I2C controller has two separate busses, so may accommodate up
> to two I2C adapters. Those adapters are listed in the ACPI namespace
> with the "IIC1D17" HID, and probed by a platform driver.
> 
> The driver works with IRQ mode, and supports basic I2C features. Flags
> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
> the unsupported access.
> 
> Change since v4:
>   * delete platform check in probe()
>   * move config interface under ACPI in Kconfig file
>   * add irq disable when access error
>   * fix some trivial issues
>   Link: https://lore.kernel.org/all/20230609031625.6928-1-hanshu-oc@zhaoxin.com/

Looks very good, almost ready for r-b, I have few little nitpicks
though, that are more a matter of style.

[...]

> +static const u32 zxi2c_speed_params_table[][3] = {
> +	/* speed, ZXI2C_TCR, ZXI2C_FSTP, ZXI2C_CS, ZXI2C_SCLTP */
> +	{I2C_MAX_STANDARD_MODE_FREQ, 0, ZXI2C_GOLDEN_FSTP_100K},
> +	{I2C_MAX_FAST_MODE_FREQ, ZXI2C_FAST_SEL, ZXI2C_GOLDEN_FSTP_400K},
> +	{I2C_MAX_FAST_MODE_PLUS_FREQ, ZXI2C_FAST_SEL, ZXI2C_GOLDEN_FSTP_1M},
> +	{I2C_MAX_HIGH_SPEED_MODE_FREQ, ZXI2C_HS_SEL, ZXI2C_GOLDEN_FSTP_3400K},

can you leave a space here between brackets:

{ I2C_MAX_FAST_MODE_PLUS_FREQ, ZXI2C_FAST_SEL, ZXI2C_GOLDEN_FSTP_1M },

> +};
> +
> +static void zxi2c_set_bus_speed(struct zxi2c *i2c)
> +{
> +	u8 i, count;
> +	const u32 *params = NULL;
> +
> +	count = ARRAY_SIZE(zxi2c_speed_params_table);
> +	for (i = 0; i < count; i++) {
> +		if (zxi2c_speed_params_table[i][0] == i2c->speed) {
> +			params = zxi2c_speed_params_table[i];
> +			break;
> +		}
> +	}

the brackets around the for() are not necessary

> +	iowrite8(params[1], i2c->regs + ZXI2C_TCR);
> +	if (abs(i2c->fstp - params[2]) > 0x10) {
> +		/* if BIOS setting value far from golden value,
> +		 * use golden value and warn user
> +		 */

the comment should be

	/*
	 * if BIOS setting value far from golden value,
	 * use golden value and warn user
	 */

> +		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> +				i2c->speed, i2c->fstp, params[2]);
> +		iowrite8(params[2], i2c->regs + ZXI2C_FSTP);
> +	} else {
> +		iowrite8(i2c->fstp, i2c->regs + ZXI2C_FSTP);
> +	}

[...]

> +	if (num == 1 && msgs->len <= ZXI2C_FIFO_SIZE && msgs->len >= 3)
> +		err = zxi2c_fifo_xfer(i2c, msgs);
> +	else
> +		err = zxi2c_byte_xfer(i2c, msgs, num);
> +
> +	zxi2c_enable_irq(i2c->regs, ZXI2C_EN_FIFOEND | ZXI2C_EN_BYTEEND, false);

can you add a comment here to explain that interrupts have been
enabled inside the xfer functions? Otherwise someone might wonder
why this line.

> +	return err;
> +}

[...]

> +static const struct acpi_device_id zxi2c_acpi_match[] = {
> +	{"IIC1D17", 0},
> +	{},

the comma is not needed and please leave a space

	{ "IIC1D17", 0 },
	{ }

With the little things above, you can add:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thank you!
Andi

> +};
> +MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
