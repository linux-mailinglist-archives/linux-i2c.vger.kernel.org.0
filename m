Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A07713AAA
	for <lists+linux-i2c@lfdr.de>; Sun, 28 May 2023 18:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjE1Qst (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 May 2023 12:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjE1Qss (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 May 2023 12:48:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB80C7;
        Sun, 28 May 2023 09:48:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CA7760FB4;
        Sun, 28 May 2023 16:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C65C433D2;
        Sun, 28 May 2023 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685292525;
        bh=2/Xdzz0f6dHRULVAbV2CIXRJaSLW15lBmvFfiihjXKI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tLWwWYcxzOj9hAqkBMAboJHJD2284sMen1uDmzR6YPQBB/U8HezzseSt2SU7kDoTq
         uOUFEx7r/BJlI0Aly6K0if4JpXqNw1VtlNaRhE9ysgPjDeoRqSWJexmX7+rqLtGAcx
         VQHBA+5mxvG1FGEvV5OJ1EnF42iusIdQijSpIaKk4d72RC9tdMXAiRQrtxruWRiB3d
         LaJilwrPTFNmc+5WL0/7aVxU1fPPg/d1p13rEnVSC3sqo0u8ObbhVO+VUgcRgNVQPz
         PpwU5kfLXFTOv26CpaaPdWQaBI1XEP2Ly7RPp4dfAHnGixz6y4ez85wJbBCh4bLMhQ
         GaUFmQu3jZyJg==
Date:   Sun, 28 May 2023 18:05:01 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Andreas Klinger <ak@it-klinger.de>,
        Marcin Wojtas <mw@semihalf.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v6 7/8] iio: cdc: ad7150: relax return value check for
 IRQ get
Message-ID: <20230528180501.4cb28a76@jic23-huawei>
In-Reply-To: <6de4448e9fe46d706bdeddb71ba6923d89ea8f4d.1685082026.git.mazziesaccount@gmail.com>
References: <cover.1685082026.git.mazziesaccount@gmail.com>
        <6de4448e9fe46d706bdeddb71ba6923d89ea8f4d.1685082026.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 26 May 2023 09:39:14 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> fwnode_irq_get[_byname]() were changed to not return 0 anymore. The
> special error case where device-tree based IRQ mapping fails can't no
> longer be reliably detected from this return value. This yields a
> functional change in the driver where the mapping failure is treated as
> an error.
> 
> The mapping failure can occur for example when the device-tree IRQ
> information translation call-back(s) (xlate) fail, IRQ domain is not
> found, IRQ type conflicts, etc. In most cases this indicates an error in
> the device-tree and special handling is not really required.
> 
> One more thing to note is that ACPI APIs do not return zero for any
> failures so this special handling did only apply on device-tree based
> systems.
> 
> Drop the special handling for DT mapping failures as these can no longer
> be separated from other errors at driver side. Change all failures in
> IRQ getting to be handled by continuing without the events instead of
> aborting the probe upon certain errors.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

I think this is the best we can do, though ideally I'd like to have
seen errors due to not being provided by firmware passed through and
firmware bug issues (where it provides an irq we can't get for some reason
shouted about - with the driver failing to probe.)

Still, it's an improvement and for some FW old code wouldn't have
done this either. Hence let's go with this approach.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> ---
> Revision history:
> v5 => v6:
>  - Never abort the probe when IRQ getting fails but continue without
>    events.
> 
> Please note that I don't have the hardware to test this change.
> Furthermore, testing this type of device-tree error cases is not
> trivial, as the question we probably dive in is "what happens with the
> existing users who have errors in the device-tree". Answering to this
> question is not simple.
> 
> The first patch of the series changes the fwnode_irq_get() so this depends
> on the first patch of the series and should not be applied alone.
> ---
>  drivers/iio/cdc/ad7150.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/cdc/ad7150.c b/drivers/iio/cdc/ad7150.c
> index 79aeb0aaea67..c05e078bba16 100644
> --- a/drivers/iio/cdc/ad7150.c
> +++ b/drivers/iio/cdc/ad7150.c
> @@ -541,6 +541,7 @@ static int ad7150_probe(struct i2c_client *client)
>  	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct ad7150_chip_info *chip;
>  	struct iio_dev *indio_dev;
> +	bool use_irq = true;
>  	int ret;
>  
>  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
> @@ -561,14 +562,13 @@ static int ad7150_probe(struct i2c_client *client)
>  
>  	chip->interrupts[0] = fwnode_irq_get(dev_fwnode(&client->dev), 0);
>  	if (chip->interrupts[0] < 0)
> -		return chip->interrupts[0];
> -	if (id->driver_data == AD7150) {
> +		use_irq = false;
> +	else if (id->driver_data == AD7150) {
>  		chip->interrupts[1] = fwnode_irq_get(dev_fwnode(&client->dev), 1);
>  		if (chip->interrupts[1] < 0)
> -			return chip->interrupts[1];
> +			use_irq = false;
>  	}
> -	if (chip->interrupts[0] &&
> -	    (id->driver_data == AD7151 || chip->interrupts[1])) {
> +	if (use_irq) {
>  		irq_set_status_flags(chip->interrupts[0], IRQ_NOAUTOEN);
>  		ret = devm_request_threaded_irq(&client->dev,
>  						chip->interrupts[0],

