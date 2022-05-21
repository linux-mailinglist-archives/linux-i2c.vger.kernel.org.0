Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A50852F946
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiEUGft (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiEUGfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:35:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DF1135
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:35:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8E125B82F47
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 06:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3053CC385A9;
        Sat, 21 May 2022 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653114942;
        bh=KKQqI8kOC5rIvIIWwPl4CL51ZVKLHBbwlqhXPOoLCEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k1nn9xxQNeYJlrEzUOxtFUP5SSkexyO87GGLjRXvr1HPYAN22lkaRJE2YcE72prpG
         sa743XfV/wTpzguN3/HH6OIknlCXkrVpCyCowntM01yb/N6bU+DGm2ZERlfoAm6ZnX
         E2d6JqHXjC7FzZxLAjdJaEns8e2yGCpFGWH32YC5FqZosbrW+smdM7GlQSktouLdgv
         Jw7xW7rd20g+9U/OvsXGh+150qs0gUFQp241m9LrKzIAP5WiVOhIGDr5pZuK4Zdsv4
         Vtsl7h/JS5rdpnYVPDfMrkQIKEv+taO9JJm7rFS+4JIFxHaWUnfESUU6u00bn6EXgv
         au/txuIxiMJ5w==
Date:   Sat, 21 May 2022 08:35:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-i2c@vger.kernel.org, gregory.clement@bootlin.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] i2c: mv64xxx: Add atomic_xfer method to driver
Message-ID: <YoiIOcmeOnbPIafh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Morgan <macroalpha82@gmail.com>, linux-i2c@vger.kernel.org,
        gregory.clement@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
References: <20220330171657.9039-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hrPLV8z2cN1FzJkR"
Content-Disposition: inline
In-Reply-To: <20220330171657.9039-1-macroalpha82@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hrPLV8z2cN1FzJkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 12:16:57PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add an atomic_xfer method to the driver so that it behaves correctly
> when controlling a PMIC that is responsible for device shutdown.
>=20
> The atomic_xfer method added is similar to the one from the i2c-rk3x
> driver. When running an atomic_xfer a bool flag in the driver data is
> set, the interrupt is not unmasked on transfer start, and the IRQ
> handler is manually invoked while waiting for pending transfers to
> complete.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Gregory? Looks reasonable to me.


--hrPLV8z2cN1FzJkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIiDkACgkQFA3kzBSg
Kba1rw/+IKOnem11uXodh9+MaFM7jikdkYTBUMQGWyNLPgNp8d7mrE+O5xx4htOf
2D/CiI6O6zu6zpPP6Tfp7XN/NMOm8veyuIZMoVXfwBa88L6kreSeCJXkTyaOGfVS
eboLnB6Hxg9F34MR8m45KzIP/EMkrE3UkNcccCWmoLy2nbhw/7TMiB+zj+SPB4Ss
O7zkzjKrchTiMXQjLxkgoSempoSuL1b+tXPfhT+03hHT5aXiR25AuvzUlSC+uZ5m
H/6X0Yj0yOVPfo4T9CYY4iIKlWbQDcFWT86BciGH6y68XiupyN66RvhmMHFMaQY8
lCYYImqmsbFXI86oMd+AZHKkqXMSSYw/VpYiRWG6U3vph80nBSZsF0IQP+Alj/3K
FVh7l4wKh9jHo5GvqBrTnSjrC0M9S9yBSwHxcYbxIBS+TEpTbRAPz8nc6weEbi2T
Wroz2fX/fQk/oGx+bPwd+H69UqG3JUz5db/9gO/thRCv/QeIWu1baEgIgFBCIHpO
PEglrLijVt0D0wj5Z48LglvMIbxAoJW2zyUzfknQTd0NcY6Sdv/WbsN/3q93/c+Q
hDAZFII4Nx2nrhbmAmlTgVq/rcPPXVw0GrBR2fPyypaxpjMnwRpBQx5UrHvPMunB
pwH4gvC9e232a122Nupx/47Zhi7WRQBjHejKXXlCj3X0jh0MJYI=
=9Zrq
-----END PGP SIGNATURE-----

--hrPLV8z2cN1FzJkR--
