Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA70070AF4D
	for <lists+linux-i2c@lfdr.de>; Sun, 21 May 2023 19:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjEURaY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 May 2023 13:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjEURNc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 May 2023 13:13:32 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA28107
        for <linux-i2c@vger.kernel.org>; Sun, 21 May 2023 10:13:23 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id c6755f98-f7fa-11ed-b3cf-005056bd6ce9;
        Sun, 21 May 2023 20:13:18 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Sun, 21 May 2023 20:13:16 +0300
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
        Jonathan Cameron <jic23@kernel.org>,
        Andreas Klinger <ak@it-klinger.de>,
        Marcin Wojtas <mw@semihalf.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 1/8] drivers: fwnode: fix fwnode_irq_get[_byname]()
Message-ID: <ZGpRLLy1Snez94NQ@surfacebook>
References: <cover.1684493615.git.mazziesaccount@gmail.com>
 <339cc23ccae4580d5551cc2b6b9b4afdde48f25e.1684493615.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <339cc23ccae4580d5551cc2b6b9b4afdde48f25e.1684493615.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fri, May 19, 2023 at 02:00:54PM +0300, Matti Vaittinen kirjoitti:
> The fwnode_irq_get() and the fwnode_irq_get_byname() return 0 upon
> device-tree IRQ mapping failure. This is contradicting the
> fwnode_irq_get_byname() function documentation and can potentially be a
> source of errors like:
> 
> int probe(...) {
> 	...
> 
> 	irq = fwnode_irq_get_byname();
> 	if (irq <= 0)
> 		return irq;
> 
> 	...
> }
> 
> Here we do correctly check the return value from fwnode_irq_get_byname()
> but the driver probe will now return success. (There was already one
> such user in-tree).
> 
> Change the fwnode_irq_get_byname() to work as documented and make also the
> fwnode_irq_get() follow same common convention returning a negative errno
> upon failure.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: ca0acb511c21 ("device property: Add fwnode_irq_get_byname")
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> I dropped the existing reviewed-by tags because change to
> fwnode_irq_get() was added.
> 
> Revision history:
> v3 => v4:
>  - Change also the fwnode_irq_get()
> ---
>  drivers/base/property.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index f6117ec9805c..8c40abed7852 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -987,12 +987,18 @@ EXPORT_SYMBOL(fwnode_iomap);
>   * @fwnode:	Pointer to the firmware node
>   * @index:	Zero-based index of the IRQ
>   *
> - * Return: Linux IRQ number on success. Other values are determined
> - * according to acpi_irq_get() or of_irq_get() operation.
> + * Return: Linux IRQ number on success. Negative errno on failure.
>   */
>  int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index)
>  {
> -	return fwnode_call_int_op(fwnode, irq_get, index);
> +	int ret;
> +
> +	ret = fwnode_call_int_op(fwnode, irq_get, index);
> +	/* We treat mapping errors as invalid case */
> +	if (ret == 0)
> +		return -EINVAL;

Not sure if this is the best choice, perhaps -EEXIST or -ENOENT might be
better, but it's just a spoken up thought.

> +	return ret;
>  }
>  EXPORT_SYMBOL(fwnode_irq_get);

-- 
With Best Regards,
Andy Shevchenko


