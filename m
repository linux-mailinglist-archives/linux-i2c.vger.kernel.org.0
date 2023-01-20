Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FEB674FF6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjATI4n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjATI4n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:56:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB86366A8
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 00:56:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86C5761E62
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 08:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9144DC4339B;
        Fri, 20 Jan 2023 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204984;
        bh=xcazxYodPMzE+baqoAYsSMVUlriGuJhS1YvrjQZXREo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=geSF9GfhMMm4hIykLI4vkubn4TAQfHvWSZDt6G29R7BMiruSjhTFFHHgTXBgiDRNJ
         Qlk0AypWkHMF5OwELDw6gHQsY0MblI+ydl6lNCczB2lIISck1Q/WBWIUHFXfqZEjNq
         xXGaBe/wBD6LojyX0gAzAJvslwG/gDFeD3KBuZ+Ki0rdCiPWnlMCugUbdZwCDU2/Mm
         1vFxifm+VzHb8WtLlqzl+i4QOS1mYraRCC/SSQpCGVhTj52QjO7OfuTrcUXFiBtAji
         OuRMncjQErkeqf4mx7y7/OVURJ4tgq0cppdw0tAz7sXmfhHNzj3/beI4pxO/NIEzWa
         35C1iEi7gPK8g==
Date:   Fri, 20 Jan 2023 09:56:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/5] i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH
 define
Message-ID: <Y8pXNnvXYV/1dnwj@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bYdF5iTlcZX/azOG"
Content-Disposition: inline
In-Reply-To: <20230107211814.1179438-2-lars@metafoo.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bYdF5iTlcZX/azOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:18:10PM -0800, Lars-Peter Clausen wrote:
> The CDNS_I2C_DATA_INTR_DEPTH is not used in the Cadence I2C driver. Remove
> it.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--bYdF5iTlcZX/azOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKVzYACgkQFA3kzBSg
KbY98A//UExfKAAKceQPl9JhrWUnBKqGEsDzr5KR5DCDuHDlTkLpa4dI9n3oUHO4
taW71SbnwCpkKhnwGqeUVbQtzKITs7/oSQF15dEAP32c9aZXohsCtoJdDi+rjVGa
+z1Z4L2r+k4uplSTpqpvvC3mcE7IyTl//bRuA2nlIeahPUSQp17zLTloWKFJTX0n
oe4T6epvqnNd/tjPPLzYeSx0w/E8wb40TXtDg2T5lgziUUC4dm4zkX7HmFc9SlRN
l+bfq0Jq8ULsZJ2+wpSiYlLUjXEaZFyy0/SUbTVNJOAAN8UAw+rlGLrNalS/uEtt
KeP/An1jm+zo8QyO5E/ba2SgizLmgoylPBSRuOV6PtiWEburEFOoXW7cJUze85m4
76qkXhtWxSF/hdNsfvgqqwFasBeP5s1/65qrWXRfAQF8EUo/t1im+bDsQn4HuwDv
tGO80TLtvXvuwzQMYC9mCl6AveGFVy3hbAQgHwmNWex3K+w24KoNvXox5nL1JkGR
rVQcZEohCKxkGgeZhKTaFQ5BUaZ9t0rnOZB9XdE/iSX3915Q0i1a006i6JpVzSFW
UtJMq1xO+C09fcQIunQT3MzUNdNen+NVuvRBKARHSnqxXiUD2va1tashexnqjKrL
mUgFLPz8uFGhj9OkRAODy1q6YVJZFgeO7QweQ0bEPCWs5fMDZyI=
=YoVM
-----END PGP SIGNATURE-----

--bYdF5iTlcZX/azOG--
