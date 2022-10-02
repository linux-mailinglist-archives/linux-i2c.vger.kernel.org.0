Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD935F22E1
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 13:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJBLVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 07:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJBLVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 07:21:51 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E6E2A704;
        Sun,  2 Oct 2022 04:21:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 85FAE320076F;
        Sun,  2 Oct 2022 07:21:43 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 02 Oct 2022 07:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1664709703; x=1664796103; bh=Xy
        TkOYjp7qHSJy7Vh33q2FfWjqZiZBOoMaARDU2oKvc=; b=3M1bqt4us/hBBA0KeR
        OjlQuA2nk2ZakA7U7qKNH/r256oyzfooo7Q6u8iasAtgER/i6bv/B0LEsrJXeITH
        lqAhWs7R/OmVgRPk+6oTmWcauWD/douNH6Chz0nwBdni5jl6hc2B+ZKRmfuJso2L
        lUgNhrMFUIr60NThEZgMyAL7dpHAXH3p0cPGdVMma44PeGOLQ8EIBvBpKyQzC/e6
        0aSPGilcVQjUOFM23FKs7TInHjscHV8ZBofbR1rqvHGy4Zm3cEhPN9RzDMRWJesE
        ekGf0kTRrpxUJdKu7FwI1Ob8fAneaupPR+GUotSeRcUkGYFQoLof0+j2HmRUJ0mb
        Wcig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664709703; x=1664796103; bh=XyTkOYjp7qHSJy7Vh33q2FfWjqZi
        ZBOoMaARDU2oKvc=; b=a4YoVWTYQ3R8nepw6FHUQjUxLg+fcyJqYmr5SfFGNdf9
        fa5UXzO8JbOiwtjQtZWWhwXDD8nlcxx+WUwnUi2Ih4x8IMYQZ3L4q1u6gXQfiYie
        uUevIQy6H/Pg7CyrDEtBashRUkqFE0PSKDqufDXf+cfi0XpQ13c2/8/sRErHbRQ+
        36UGBh/3nwk+tKLx+UfyhjA3MRMnNUuz1SGv5QqvqgW5FnrjbLPua4eH+wz6TeDL
        3jsdR8nrssKz+giMauZum5Wbr8yelgUwcY1UVBk+tKwOszVbugpkUldcQSL7lKqG
        1wTRM896DT7bhseO1GujvnISlpnUc/0I1DnJ9omjHg==
X-ME-Sender: <xms:RXQ5Y0qTzBklDuYi5rv8XNZxW7ShLCkz3rR3q8cSJ9uEbWhWj6hd8Q>
    <xme:RXQ5Y6pOnQRR_4jNLMZXUr2vLFNs_tvrZF20naPkFPEreECtZAduOZBaoB4jbE0Bb
    Vnw-KhK4fbEge_oiBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehjedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepkeelkeduledvvdfhfefhlefgffefgfdvheejgeejhfehjeejgffffeei
    jedtteejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdr
    uggvvh
X-ME-Proxy: <xmx:RXQ5Y5OSvzPUufzNLdSPO_KfGp1n0ApWg0KCkqfyGLhVL-g0OubHiA>
    <xmx:RXQ5Y77mqARLDEGCtEJH6jIYalHc__2d22NSDI0qaGXrWdsxruV-fw>
    <xmx:RXQ5Yz63pHKOyQonFZb53K6zPyejzBeY8yRXARkquyXm8qbuS4v4sg>
    <xmx:R3Q5YwyVvz0jvkEeD86Qt0f45RFxLAHgZZ2OK8hXHN83e12c6cKYrA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8B28DA6007C; Sun,  2 Oct 2022 07:21:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <88f8c24a-70df-4b47-a3e8-033f6580d0d4@app.fastmail.com>
In-Reply-To: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
References: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
Date:   Sun, 02 Oct 2022 13:21:19 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arminder Singh" <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        asahi@lists.linux.dev, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Hector Martin" <marcan@marcan.st>,
        "Paul Mackerras" <paulus@samba.org>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Darren Stevens" <darren@stevens-zone.net>,
        "Christian Zigotzky" <chzigotzky@xenosoft.de>
Subject: Re: [PATCH v2] i2c/pasemi: PASemi I2C controller IRQ enablement
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Looks almost good to me, just a few minor things:

On Sun, Oct 2, 2022, at 00:25, Arminder Singh wrote:
> Hello,
>
> This is v2 of the PASemi I2C controller IRQ enablement patch.

This shouldn't be inside the commit description.

>
> This patch adds IRQ support to the PASemi I2C controller driver to 
> increase the performace of I2C transactions on platforms with PASemi I2C 
> controllers. While the patch is primarily intended for Apple silicon 
> platforms, this patch should also help in enabling IRQ support for 
> older PASemi hardware as well should the need arise.

This is probably the only paragraph that should be the entire commit description.

>
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
> Tested-by: Arminder Singh <arminders208@outlook.com>

I think it's usually implied that you tested your own patches ;)

> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> Changes from v1:
>  - moved completion setup from pasemi_platform_i2c_probe to
>    pasemi_i2c_common_probe to allow PASemi and Apple platforms to share
>    common completion setup code in case PASemi hardware gets IRQ support
>    added
>  - initialized the status variable in pasemi_smb_waitready when going down
>    the non-IRQ path
>  - removed an unnecessary cast of dev_id in the IRQ handler
>  - fixed alignment of struct member names in i2c-pasemi-core.h
>    (addresses Christophe's feedback in the original submission)
>  - IRQs are now disabled after the wait_for_completion_timeout call
>    instead of inside the IRQ handler
>    (prevents the IRQ from going off after the completion times out)
>  - changed the request_irq call to a devm_request_irq call to obviate
>    the need for a remove function and a free_irq call
>    (thanks to Sven for pointing this out in the original submission)
>  - added a reinit_completion call to pasemi_reset 
>    as a failsafe to prevent missed interrupts from causing the completion
>    to never complete (thanks to Arnd Bergmann for pointing this out)
>  - removed the bitmask variable in favor of just using the value
>    directly (it wasn't used anywhere else)
>
> v1 linked here: 
> https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/#m11b3504c2667517aad7521514c99ca0e07a9381f
>
> Thanks for all the feedback on the previous submission, I'm sorry
> I wasn't able to answer everyone's emails, was just pretty busy, I'll
> make sure to be more responsive this time around! Also wasn't sure whether
> the v1 changelog belonged before or after the '---' so I put it after
> to keep the commit changelog short and concise.
> (This is just one patch, didn't think it needed a cover letter)
>
>  drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
>  drivers/i2c/busses/i2c-pasemi-core.h     |  7 +++++-
>  drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
>  3 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c 
> b/drivers/i2c/busses/i2c-pasemi-core.c
> index 9028ffb58cc0..05af8f3575bc 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -21,6 +21,7 @@
>  #define REG_MTXFIFO	0x00
>  #define REG_MRXFIFO	0x04
>  #define REG_SMSTA	0x14
> +#define REG_IMASK   0x18

This doesn't seem to be aligned correctly, this file seems to use a tab
to separate the register name and the offset and you used spaces here.

>  #define REG_CTL		0x1c
>  #define REG_REV		0x28
> 
> @@ -66,6 +67,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
>  		val |= CTL_EN;
> 
>  	reg_write(smbus, REG_CTL, val);
> +	reinit_completion(&smbus->irq_completion);
>  }
> 
>  static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> @@ -81,11 +83,18 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  	int timeout = 10;
>  	unsigned int status;
> 
> -	status = reg_read(smbus, REG_SMSTA);
> -
> -	while (!(status & SMSTA_XEN) && timeout--) {
> -		msleep(1);
> +	if (smbus->use_irq) {
> +		reinit_completion(&smbus->irq_completion);
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
> +		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
> +	} else {
> +		status = reg_read(smbus, REG_SMSTA);
> +		while (!(status & SMSTA_XEN) && timeout--) {
> +			msleep(1);
> +			status = reg_read(smbus, REG_SMSTA);
> +		}
>  	}
> 
>  	/* Got NACK? */
> @@ -344,10 +353,14 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
> 
>  	/* set up the sysfs linkage to our parent device */
>  	smbus->adapter.dev.parent = smbus->dev;
> +	smbus->use_irq = 0;
> +	init_completion(&smbus->irq_completion);
> 
>  	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
>  		smbus->hw_rev = reg_read(smbus, REG_REV);
> 
> +	reg_write(smbus, REG_IMASK, 0);
> +
>  	pasemi_reset(smbus);
> 
>  	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
> @@ -356,3 +369,11 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
> 
>  	return 0;
>  }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +	struct pasemi_smbus *smbus = dev_id;
> +
> +	complete(&smbus->irq_completion);
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.h 
> b/drivers/i2c/busses/i2c-pasemi-core.h
> index 4655124a37f3..ba6d6ccf9cdc 100644
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
> @@ -15,7 +16,11 @@ struct pasemi_smbus {
>  	struct i2c_adapter	 adapter;
>  	void __iomem		*ioaddr;
>  	unsigned int		 clk_div;
> -	int			 hw_rev;
> +	int			         hw_rev;
> +	int                  use_irq;
> +	struct completion    irq_completion;

This doesn't seem to be aligned correctly and the hw_rev line
doesn't have to be changed.

>  };
> 
>  int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
> diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c 
> b/drivers/i2c/busses/i2c-pasemi-platform.c
> index 88a54aaf7e3c..e35945a91dbe 100644
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
> @@ -82,6 +83,11 @@ static int pasemi_platform_i2c_probe(struct 
> platform_device *pdev)
>  	if (error)
>  		goto out_clk_disable;
> 
> +	irq_num = platform_get_irq(pdev, 0);
> +	error = devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0, 
> "pasemi_apple_i2c", (void *)smbus);
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
