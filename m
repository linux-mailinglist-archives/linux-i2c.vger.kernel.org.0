Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D6570A8C1
	for <lists+linux-i2c@lfdr.de>; Sat, 20 May 2023 17:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjETPQq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 May 2023 11:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjETPQp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 May 2023 11:16:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712A4EE;
        Sat, 20 May 2023 08:16:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C71160A4A;
        Sat, 20 May 2023 15:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A72C433EF;
        Sat, 20 May 2023 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684595803;
        bh=UGvLhlhaGVuZ1xNTf9EdfX6bmO7ekWIS/JxQ4csPyO4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Fk8RBRN4CpUt2XfHmROjEBC6rq1EM5kZM+neDoJm+QOW/TFLuzJb+OVPs9Ka546V6
         zxjXdoIvK2neuvr77CwHUI8Qs8GDjdCoqO9VUkbXv8qld00GuRL70NfeyyrA8jPvmp
         9VPuAgV7/biO6/3p/NI9LQuhgSNercRdPA7WnAClUu31zIB3H9w6hWMl0tLHA+jhsB
         GQMHQF9D+Ewv1+JSjD6gG7bgpl/rDOrip1hn7nuQhM0sZsPRqs8bLFTGoBBLi1BS1Z
         KTtNUn9fKOJTKYwS1Bdf4FUtRHY647HYY3rLAMopGe4tbdLCwXhNM/hQqDOqwrCwWO
         qDFvoT+MzECuQ==
Date:   Sat, 20 May 2023 16:32:49 +0100
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
Subject: Re: [PATCH v5 2/8] iio: mb1232: relax return value check for IRQ
 get
Message-ID: <20230520163249.56f1e56d@jic23-huawei>
In-Reply-To: <05636b651b9a3b13aa3a3b7d3faa00f2a8de6bca.1684493615.git.mazziesaccount@gmail.com>
References: <cover.1684493615.git.mazziesaccount@gmail.com>
        <05636b651b9a3b13aa3a3b7d3faa00f2a8de6bca.1684493615.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 19 May 2023 14:01:23 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> fwnode_irq_get() was changed to not return 0 anymore.
> 
> Drop check for return value 0.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Revsion history:
> v4 => v5:
>  - drop unnecessary data->irqnr = -1 assignment
> 
> The first patch of the series changes the fwnode_irq_get() so this depends
> on the first patch of the series and should not be applied alone.
> ---
>  drivers/iio/proximity/mb1232.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/proximity/mb1232.c b/drivers/iio/proximity/mb1232.c
> index e70cac8240af..3ae226297a00 100644
> --- a/drivers/iio/proximity/mb1232.c
> +++ b/drivers/iio/proximity/mb1232.c
> @@ -76,7 +76,7 @@ static s16 mb1232_read_distance(struct mb1232_data *data)
>  		goto error_unlock;
>  	}
>  
> -	if (data->irqnr >= 0) {
> +	if (data->irqnr > 0) {
>  		/* it cannot take more than 100 ms */
>  		ret = wait_for_completion_killable_timeout(&data->ranging,
>  									HZ/10);
> @@ -212,10 +212,7 @@ static int mb1232_probe(struct i2c_client *client)
>  	init_completion(&data->ranging);
>  
>  	data->irqnr = fwnode_irq_get(dev_fwnode(&client->dev), 0);
> -	if (data->irqnr <= 0) {
> -		/* usage of interrupt is optional */
> -		data->irqnr = -1;
> -	} else {
> +	if (data->irqnr > 0) {
>  		ret = devm_request_irq(dev, data->irqnr, mb1232_handle_irq,
>  				IRQF_TRIGGER_FALLING, id->name, indio_dev);
>  		if (ret < 0) {

