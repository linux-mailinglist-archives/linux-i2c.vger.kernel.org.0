Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7926C962F
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Mar 2023 17:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjCZPiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 11:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCZPix (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 11:38:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD8710E4;
        Sun, 26 Mar 2023 08:38:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 28A7AB80C99;
        Sun, 26 Mar 2023 15:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4663AC433D2;
        Sun, 26 Mar 2023 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679845129;
        bh=ZXRo4uvGF4gNgO4cKBiMTZRNDq7znRBgZTcFSFWfvLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxhix9dcjXPnhYzB/QXdFvNBUX5kybYCNWZEhI/2ntjW0pWLhxIgYuqsKs12cdUam
         CxF6T299QsuyzU/02huAX13mzSqkwjQSGR4O2INXPZcpJeuMjtCMq1abt/x6nlfQUK
         0Qk7bHy53AjpWiqLzbOEOdG4fPBPZK133ElDywDN0wBNlPxislzpZfEglziQ9NSxGx
         1aP2F+1bUffMDF8ldk2Dn5ksyhiL3RqYiudf8/V/M51xyLdKx0c8/f9/oXTuMItoBG
         dZ0Au29pkMG1fMz96E9Qc6Zg01fRPSFgb+bXusTYiyUHUSCRK04Fq8/BqkNV70cVpA
         Ev0gwnW16RKGQ==
Date:   Sun, 26 Mar 2023 17:38:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v6 5/6] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <20230326153846.zo77mbgti2injnxl@intel.intel>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
 <20230323172113.1231050-6-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323172113.1231050-6-xiang.ye@intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

looks good, just a few questions:

On Fri, Mar 24, 2023 at 01:21:12AM +0800, Ye Xiang wrote:
> This patch implements the I2C function of Intel USB-I2C/GPIO/SPI adapter

also here, please keep using the imperative form.

> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> I2c module with specific protocol through interfaces exported by LJCA USB
> driver.
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

[...]

> +enum ljca_xfer_type {
> +	LJCA_I2C_READ_XFER_TYPE,
> +	LJCA_I2C_WRITE_XFER_TYPE,
> +};
> +
> +/* I2C r/w Flags */
> +#define LJCA_I2C_SLAVE_TRANSFER_WRITE	(0)
> +#define LJCA_I2C_SLAVE_TRANSFER_READ	(1)

the enum above and the bits here look a bit redundant to me as
they are the same thing.

What's the point for writing something like:

 if (type == LJCA_I2C_READ_XFER_TYPE)
	addr |= LJCA_I2C_SLAVE_TRANSFER_WRITE

when the two are the same. You are just adding confusion.

As this is a bit field, you can just keep the defines.

[...]

> +static u8 ljca_i2c_format_slave_addr(u8 slave_addr, u8 type)
> +{
> +	return (slave_addr << 1) | (type == LJCA_I2C_READ_XFER_TYPE) ?
> +		       LJCA_I2C_SLAVE_TRANSFER_READ :
> +		       LJCA_I2C_SLAVE_TRANSFER_WRITE;
> +}

How about:

	return (slave_addr << 1) | !!type;

BTW, am I reading correctly that the address here is composed as:

   7     6     5     5     3     2     1    0
 ADDR7 ADDR6 ADDR5 ADDR4 ADDR3 ADDR2 ADDR1 R/W

[...]

> +static u32 ljca_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

how is the smbus supported here?

Andi
