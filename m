Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5C8713AF0
	for <lists+linux-i2c@lfdr.de>; Sun, 28 May 2023 19:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjE1RBi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 May 2023 13:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjE1RBh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 May 2023 13:01:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB94AD;
        Sun, 28 May 2023 10:01:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84C2260B08;
        Sun, 28 May 2023 17:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC785C433EF;
        Sun, 28 May 2023 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685293294;
        bh=puQYi3Gammo1pbYrhpE6z2DzxrD82G53/ALPZGIYroI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h3do2+xOi7KHj2BdXbEoyVOWTqtt9V9UBpP1ug1xnrpWvs6djl9+HOzu1I3HQlbm1
         r/lL7bhBdw5TYULJNq+K1BEeSwAkRNExCtpl4/+yqV3XIe0QZ/np8eFdVbxTI5TRzD
         sMv21zoaFQZXsgxSFkH+Mb4IC38lE+Ra2zC2EGXYtbyNr6RXrmb4g8RXwBugrakkzt
         HypfKRBjLNQJnA/VxHyoCkHQJA1dE3w4oIa0h/HN09lX8MJLbdCA6pj992/awD5hDE
         FtH7vXEYiyUpFcIoLSZ+XGXAoq59wK+O9YrvT9fhdFRCXR9hb1W8uKwjNbJW34KrIh
         bjpX8xye3tTsA==
Date:   Sun, 28 May 2023 18:17:50 +0100
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
Subject: Re: [PATCH v6 4/8] pinctrl: wpcm450: relax return value check for
 IRQ get
Message-ID: <20230528181750.599035ac@jic23-huawei>
In-Reply-To: <830e6e61cf51d43cb7a99b846ab4676823e4e78a.1685082026.git.mazziesaccount@gmail.com>
References: <cover.1685082026.git.mazziesaccount@gmail.com>
        <830e6e61cf51d43cb7a99b846ab4676823e4e78a.1685082026.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 26 May 2023 09:38:05 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> fwnode_irq_get[_byname]() were changed to not return 0 anymore. The
> special error case where device-tree based IRQ mapping fails can't no
> longer be reliably detected from this return value. This yields a
> functional change in the driver where the mapping failure is treated as
> an error.
>=20
> The mapping failure can occur for example when the device-tree IRQ
> information translation call-back(s) (xlate) fail, IRQ domain is not
> found, IRQ type conflicts, etc. In most cases this indicates an error in
> the device-tree and special handling is not really required.
>=20
> One more thing to note is that ACPI APIs do not return zero for any
> failures so this special handling did only apply on device-tree based
> systems.
>=20
> Drop the special (no error, just skip the IRQ) handling for DT mapping
> failures as these can no longer be separated from other errors at driver
> side.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
Seems fine

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Revision history:
> v5 =3D> :
>  - No changes
> v4 =3D> v5:
> Fix typo in subject "elax" =3D> "relax"
>=20
> Please note, I took Linus' reply to v4 cover-letter as ack && added the
> tag. Please let me know if this was not Ok.
>=20
> The first patch of the series changes the fwnode_irq_get() so this depends
> on the first patch of the series and should not be applied alone.
> ---
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 2d1c1652cfd9..f9326210b5eb 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -1106,8 +1106,6 @@ static int wpcm450_gpio_register(struct platform_de=
vice *pdev,
>  			irq =3D fwnode_irq_get(child, i);
>  			if (irq < 0)
>  				break;
> -			if (!irq)
> -				continue;
> =20
>  			girq->parents[i] =3D irq;
>  			girq->num_parents++;

