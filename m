Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E088959B300
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Aug 2022 11:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiHUJ5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Aug 2022 05:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiHUJzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Aug 2022 05:55:50 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B8822B27;
        Sun, 21 Aug 2022 02:55:49 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4AD8232001FF;
        Sun, 21 Aug 2022 05:55:45 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 21 Aug 2022 05:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1661075744; x=1661162144; bh=g+
        4U3HxtmMgKd0ZTdEPPndvyzAVWKCpEbJzi3SzZ3R8=; b=VocTPO+KaoksbBV5gq
        BydTNLf3EozosHtoeO64NFZkk/4q8HKVS2Jhj1lQdk4aYkkD1ipFgfZhKZiez8OG
        oMTAgMpF6qwk7ZolqujcD8KWypEgVywYkX7PyVKWn6vcO23xLft5wlY8qbxBjbRX
        1L9xuw8SqCggPcIkLhwfDL4dqJ01ShqgLzbq5FyVUJYYyaEgojbpW8d07m3Yow7m
        zXRRM0qiXdV0eyRdvG3A0i//IVuf++n2qbqgXX42WWveZoZ+IlDvW1h7QCuMlXy5
        CpHe/M8PjTZkhyTlhN/XxKxJ8R9TGG/RcVz9YaE2PviFMqHQlCGUSIaG+D134a56
        fkdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1661075744; x=1661162144; bh=g+4U3HxtmMgKd0ZTdEPPndvyzAVW
        KCpEbJzi3SzZ3R8=; b=vcLkpYev5z2JjfwPLbYTbP5Fruw5KhTeYwL2o+snWPHy
        lls8vSlwnGaCaEY8H24h0yrk3Bt9kd+RX3JeSQliaHfvgW0nnNDhheJhiyF6Cl9y
        HO8AphNKGKWbWrOr8hh/rOjyUbb26qujaFAJo2WuHY0GNx0IV3RuiajijpvPXhik
        qB7KXCfc6/XkEXMUNfqyLcLXkTvzIHMrlvXMX7is990snTsP8SxiyyEPCZWNCoLJ
        GXAuGY+iDRqHSPrdvA8fZNhZVwRg8p5wuNUVszjEMO9HKF5kQUbv4w7eh/XnLBcK
        EnNb9f7qAEHP94QV1qjVWMWm+i5kW3E73TyEbr9d1w==
X-ME-Sender: <xms:HwECY_N33eWnObpNU8IsYln5nO4pIuZzNzLkzr3q3-yzoW7iKWZohQ>
    <xme:HwECY5-ACm8wVZjATPcq3rpE5PbcLB1NGVrbmwrYfVibanzOsgvTGx0a0-NqKkzOr
    IA0IvDacoOInmZFX6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeihedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepgeegkeektdejveeiteffvddugffggeeuudehvdfgtddvudfgjedtuedu
    vdevueevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdr
    uggvvh
X-ME-Proxy: <xmx:HwECY-T1-yLJ-FoybaQw-CEfcAAgsKzPFok33ybaLGP7XZ5p1CoIbg>
    <xmx:HwECYzv2Re_oy1KdasbRuYg2g4kvCg2-SUqBG0H0rEGeOajzWMrLaQ>
    <xmx:HwECY3edqiBARecogNKQyipnufOSJ0Mq5fp_KfEYX3KnSxQ8Tot4gg>
    <xmx:IAECY5twISE0izCruAtV9zRWyTRV5CSzbVufS8B3WdX_UbVHDG-ebQ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8CAFDA6007C; Sun, 21 Aug 2022 05:55:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <8985e799-64b5-44e6-9da3-f8817f8744e6@www.fastmail.com>
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
Date:   Sun, 21 Aug 2022 11:55:23 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arminder Singh" <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Hector Martin" <marcan@marcan.st>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Thanks for the patch! Some additional comments:

On Sat, Aug 20, 2022, at 21:45, Arminder Singh wrote:
> This is the first time I'm interacting with the Linux mailing lists, so 
> please don't eviscerate me *too much* if I get the formatting wrong.
> Of course I'm always willing to take criticism and improve my formatting 
> in the future.
>
> This patch adds support for IRQs to the PASemi I2C controller driver.
> This will allow for faster performing I2C transactions on Apple Silicon
> hardware, as previously, the driver was forced to poll the SMSTA register
> for a set amount of time.
>
> With this patchset the driver on Apple silicon hardware will instead wait
> for an interrupt which will signal the completion of the I2C transaction.
> The timeout value for this completion will be the same as the current
> amount of time the I2C driver polls for.
>
> This will result in some performance improvement since the driver will be
> waiting for less time than it does right now on Apple Silicon hardware.
>
> The patch right now will only enable IRQs for Apple Silicon I2C chips,
> and only if it's able to successfully request the IRQ from the kernel.
>
> === Testing ===
>
> This patch has been tested on both the mainline Linux kernel tree and
> the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
> M1 and M2 MacBook Air, and it compiles successfully as both a module and
> built-in to the kernel itself. The patch in both trees successfully boots
> to userspace without any hitch.
>
> I do not have PASemi hardware on hand unfortunately, so I'm unable to test
> the impact of this patch on old PASemi hardware. This is also why I've
> elected to do the IRQ request and enablement on the Apple platform driver
> and not in the common file, as I'm not sure if PASemi hardware supports
> IRQs.
>
> I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".
>
> Any and all critiques of the patch would be well appreciated.
>
>
>
>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
>  drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
>  drivers/i2c/busses/i2c-pasemi-platform.c |  8 +++++++
>  3 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c 
> b/drivers/i2c/busses/i2c-pasemi-core.c
> index 9028ffb58cc0..375aa9528233 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -21,6 +21,7 @@
>  #define REG_MTXFIFO	0x00
>  #define REG_MRXFIFO	0x04
>  #define REG_SMSTA	0x14
> +#define REG_IMASK   0x18
>  #define REG_CTL		0x1c
>  #define REG_REV		0x28
> 
> @@ -80,14 +81,21 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 10;
>  	unsigned int status;
> +	unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
> 
> -	status = reg_read(smbus, REG_SMSTA);
> -
> -	while (!(status & SMSTA_XEN) && timeout--) {
> -		msleep(1);
> +	if (smbus->use_irq) {
> +		reinit_completion(&smbus->irq_completion);
> +		reg_write(smbus, REG_IMASK, bitmask);

s/bitmask/SMSTA_XEN | SMSTA_MTN/ and then you can just drop the bitmask
variable which isn't used anywhere else.

> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
>  		status = reg_read(smbus, REG_SMSTA);

If the irq hasn't fired and wait_for_completion_timeout timed out the irq
is still enabled here. I'd put a reg_write(smbus, REG_IMASK, 0); here
to be safe.

> +	} else {

You also need status = reg_read(smbus, REG_SMSTA); here.

> +		while (!(status & SMSTA_XEN) && timeout--) {
> +			msleep(1);
> +			status = reg_read(smbus, REG_SMSTA);
> +		}
>  	}
> 
> +
>  	/* Got NACK? */
>  	if (status & SMSTA_MTN)
>  		return -ENXIO;
> @@ -300,7 +308,7 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
>  	case I2C_SMBUS_BLOCK_DATA:
>  	case I2C_SMBUS_BLOCK_PROC_CALL:
>  		data->block[0] = len;
> -		for (i = 1; i <= len; i ++) {
> +		for (i = 1; i <= len; i++) {
>  			rd = RXFIFO_RD(smbus);
>  			if (rd & MRXFIFO_EMPTY) {
>  				err = -ENODATA;
> @@ -348,6 +356,8 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
>  	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
>  		smbus->hw_rev = reg_read(smbus, REG_REV);
> 
> +	reg_write(smbus, REG_IMASK, 0);
> +
>  	pasemi_reset(smbus);
> 
>  	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
> @@ -356,3 +366,12 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
> 
>  	return 0;
>  }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +	struct pasemi_smbus *smbus = (struct pasemi_smbus *)dev_id;
> +
> +	reg_write(smbus, REG_IMASK, 0);
> +	complete(&smbus->irq_completion);
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.h 
> b/drivers/i2c/busses/i2c-pasemi-core.h
> index 4655124a37f3..045e4a9a3d13 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.h
> +++ b/drivers/i2c/busses/i2c-pasemi-core.h
> @@ -7,6 +7,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/completion.h>
> 
>  #define PASEMI_HW_REV_PCI -1
> 
> @@ -16,6 +17,10 @@ struct pasemi_smbus {
>  	void __iomem		*ioaddr;
>  	unsigned int		 clk_div;
>  	int			 hw_rev;
> +	int          use_irq;
> +	struct completion irq_completion;
>  };
> 
>  int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
> diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c 
> b/drivers/i2c/busses/i2c-pasemi-platform.c
> index 88a54aaf7e3c..ee1c84e7734b 100644
> --- a/drivers/i2c/busses/i2c-pasemi-platform.c
> +++ b/drivers/i2c/busses/i2c-pasemi-platform.c
> @@ -49,6 +49,7 @@ static int pasemi_platform_i2c_probe(struct 
> platform_device *pdev)
>  	struct pasemi_smbus *smbus;
>  	u32 frequency;
>  	int error;
> +	int irq_num;
> 
>  	data = devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
>  			    GFP_KERNEL);
> @@ -82,6 +83,13 @@ static int pasemi_platform_i2c_probe(struct 
> platform_device *pdev)
>  	if (error)
>  		goto out_clk_disable;
> 
> +	smbus->use_irq = 0;
> +	init_completion(&smbus->irq_completion);

I'd move this into the common probe function. If someone eventually wants
to add irq support to the PASemi boards it'll be required there as well.

> +	irq_num = platform_get_irq(pdev, 0);
> +	error = request_irq(irq_num, pasemi_irq_handler, 0, 
> "pasemi_apple_i2c", (void *)smbus);

If you use request_irq here you'll have to add a remove function and
call free_irq there. I'd just use devm_request_irq which takes care of
that automatically.

> +
> +	if (!error)
> +		smbus->use_irq = 1;
>  	platform_set_drvdata(pdev, data);
> 
>  	return 0;
> -- 
> 2.34.1

Best,


Sven
