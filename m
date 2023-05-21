Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCA570AF5B
	for <lists+linux-i2c@lfdr.de>; Sun, 21 May 2023 19:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjEURnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 May 2023 13:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjEURmy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 May 2023 13:42:54 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F6D10D3
        for <linux-i2c@vger.kernel.org>; Sun, 21 May 2023 10:21:03 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id dacd9c49-f7fb-11ed-b972-005056bdfda7;
        Sun, 21 May 2023 20:21:00 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Sun, 21 May 2023 20:20:59 +0300
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
Subject: Re: [PATCH v5 4/8] pinctrl: wpcm450: relax return value check for
 IRQ get
Message-ID: <ZGpS-13CozLp-p4f@surfacebook>
References: <cover.1684493615.git.mazziesaccount@gmail.com>
 <42264f1b12a91e415ffa47ff9adb53f02a6aa3ea.1684493615.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42264f1b12a91e415ffa47ff9adb53f02a6aa3ea.1684493615.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fri, May 19, 2023 at 02:02:16PM +0300, Matti Vaittinen kirjoitti:
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
> Drop the special (no error, just skip the IRQ) handling for DT mapping
> failures as these can no longer be separated from other errors at driver
> side.

...

> The commit message does not mention if choosing not to abort the probe
> on device-tree mapping failure (as is done on other errors) was chosen
> because: a) Abort would have broken some existing setup. b) Because skipping
> an IRQ on failure is "the right thing to do", or c) because it sounded like
> a way to minimize risk of breaking something.
> 
> If the reason is a) - then I'd appreciate receiving some more
> information and a suggestion how to proceed (if possible). If the reason
> is b), then it might be best to just skip the IRQ instead of aborting
> the probe for all errors on IRQ getting. Finally, in case of c), well,
> by acking this change you will now accept the risk :)

No need to repeat this. As I answered the case c) was in my mind when I made
that change.


-- 
With Best Regards,
Andy Shevchenko


