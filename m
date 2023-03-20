Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388CA6C1B02
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 17:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjCTQOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 12:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjCTQOG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 12:14:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6B749FB;
        Mon, 20 Mar 2023 09:04:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77BA8B80EE4;
        Mon, 20 Mar 2023 16:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7A2C433EF;
        Mon, 20 Mar 2023 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679328186;
        bh=f+Fe3d6mcU/e1HJlTyNQZ9rPA6EQCcDs3cZYrQ8vciQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W5HpTAr5VQRNB+R4cL3cWwRs30gHBL/s0oZP+WbOvrSrobL8s3wQZdDgyzu+sIgj8
         UYKgTt2ooTgm9S6YNZs2mx0K9luACqnVByf42eAiPyTOtdEWR/WBOxip0hJCfeYNgH
         pdnhtboFyCf8rXdDKq2vyD7pMc8WQ7mAPob+LhcilyNwGLL9Pvh9TZXl70upbAE+QK
         NKzJVyCdnn9NPD13+iGuVp6TY43EGdt33ufxd96dox5RwvWMcvmPWIPtkVg2H5YvYL
         i3FUyuTErEWzKP0qWgSy8eyHgd+QI5HYhLRvR1SqwBFjn2PYjODODQ7+XZpVfrowrV
         CHbVCoMrkPJfQ==
Date:   Mon, 20 Mar 2023 16:02:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] treewide: Fix instantiation of devices in DT overlay
Message-ID: <42406441-3933-4781-a450-42930bd1f6b2@sirena.org.uk>
References: <328e557aaee9d3f5f1bcaf2b8ac2de0e04c4fbb8.1679049188.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="em2KL6o747ySzM/d"
Content-Disposition: inline
In-Reply-To: <328e557aaee9d3f5f1bcaf2b8ac2de0e04c4fbb8.1679049188.git.geert+renesas@glider.be>
X-Cookie: Keep away from fire or flame.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--em2KL6o747ySzM/d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:33:18AM +0100, Geert Uytterhoeven wrote:
> When loading a DT overlay that creates a device, the device is not
> instantiated, unless the DT overlay is unloaded and reloaded again.
>=20
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device. Don't review the code, it's not meant to be :)
>=20
> Based on a hacky patch by Saravana Kannan, which covered only platform
> and spi devices.

Acked-by: Mark Brown <broonie@kernel.org>

--em2KL6o747ySzM/d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYg7EACgkQJNaLcl1U
h9ABegf+PF2PVDH8Dhw/efe40xzJUJWJZRQJLiBX1X0iezwm9Krg6Z4IaDYjXRs1
73vmt/yXhAIkmswkOpASrsUvH/59U6xxBImYqFaTFVbOkZoQHCzWArwWvnUwxZQ5
KYqWEBg0ptn9Y/m5b990euIqTqWbuvmSHOh4ds9fDC6Av2jDS2f6TmZb95jKbFkb
AjR5sTEunETufUPr1eSEibRT2lkwCZbEDuZ/epXewy9O3EG9unGKvwflJHqlEgIw
TyUYa3fQ30VUP8qjEFXBAvaEtuamuFgRJbngk5eAoMLDDthIdHpCeo957wP839hM
9OYloUvwKeEyf8yQLdAzmtRXBZ1f+g==
=0W/T
-----END PGP SIGNATURE-----

--em2KL6o747ySzM/d--
