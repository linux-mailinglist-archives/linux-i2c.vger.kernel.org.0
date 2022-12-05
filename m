Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73BC6425FB
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiLEJnq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiLEJnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:43:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E20AE52;
        Mon,  5 Dec 2022 01:43:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76E8560FF2;
        Mon,  5 Dec 2022 09:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EE6C433D6;
        Mon,  5 Dec 2022 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233422;
        bh=5xf073/b961k8/MjmEOBXqIE5kkvS82SCt+RaD93kNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dDMy2d+nA+QcxIvDmIyhA40HpJ0ZguqkBLLWbm7rTZ74FsuCzcbaMsq1lDJ4gpsrE
         ZBwyHolbKy1MVcmpEFzcjdIVHn/Og12ajl99PtFag6EBmiGE3RJDfdJj4wnAtO9JrI
         7+Xmkp4aXsu3uY0R5fjT5RSlsL2punPXVfEsyx71ORI+aGzdcNNnNw2WPkhM1nux0s
         ZTCFIOuT1Bs4LZBYz20pzY9HftoxnwoEokBzl+vYnf2rUWvn6xq8cp0mLHEV9gsovE
         8VPDJJG10dpd73dMSMUZiHc2Top60CJGBmyY5awhwpHe0ETSKkWQNkvd7TfbJRV9W7
         S7+7Rd+tBnOqQ==
Date:   Mon, 5 Dec 2022 10:43:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/i2c: use simple i2c probe
Message-ID: <Y429SywVngrf2Q9I@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221012163647.3930565-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qTaLEuURhpk3LiI/"
Content-Disposition: inline
In-Reply-To: <20221012163647.3930565-1-steve@sk2.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qTaLEuURhpk3LiI/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 06:36:47PM +0200, Stephen Kitt wrote:
> All these drivers have an i2c probe function which doesn't use the
> "struct i2c_device_id *id" parameter, so they can trivially be
> converted to the "probe_new" style of probe with a single argument.
>=20
> This is part of an ongoing transition to single-argument i2c probe
> functions. Old-style probe functions involve a call to i2c_match_id:
> in drivers/i2c/i2c-core-base.c,
>=20
>          /*
>           * When there are no more users of probe(),
>           * rename probe_new to probe.
>           */
>          if (driver->probe_new)
>                  status =3D driver->probe_new(client);
>          else if (driver->probe)
>                  status =3D driver->probe(client,
>                                         i2c_match_id(driver->id_table, cl=
ient));
>          else
>                  status =3D -EINVAL;
>=20
> Drivers which don't need the second parameter can be declared using
> probe_new instead, avoiding the call to i2c_match_id. Drivers which do
> can still be converted to probe_new-style, calling i2c_match_id
> themselves (as is done currently for of_match_id).
>=20
> This change was done using the following Coccinelle script, and fixed
> up for whitespace changes:
>=20
> @ rule1 @
> identifier fn;
> identifier client, id;
> @@
>=20
> - static int fn(struct i2c_client *client, const struct i2c_device_id *id)
> + static int fn(struct i2c_client *client)
> {
> ...when !=3D id
> }
>=20
> @ rule2 depends on rule1 @
> identifier rule1.fn;
> identifier driver;
> @@
>=20
> struct i2c_driver driver =3D {
> -       .probe
> +       .probe_new
>                 =3D
> (
>                    fn
> |
> -                  &fn
> +                  fn
> )
>                 ,
> };
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Dropped the mux-part because I applied an older patch doing the same.
Despite that, applied the rest to for-next, thanks!


--qTaLEuURhpk3LiI/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvUsACgkQFA3kzBSg
KbaZtw/7Bw8qWJ/EO16/DWsZFw3b7UK+vssIrQB0ygAmIGAyef7b9VN9nuJAw+fD
fqbA/xTn0bylU4In7nB7ld0YJ9l1iPTnoXsK7J1QkEg1T65MDHugz0iwLXopc+lx
y3WvupwfSa2D3o9R1YR4iBOGYjcc3+XAGF+9WFwoZ21Az2HDGPVChQQHAQHplJpN
nYepLm1/MZ2qqoEpB1kZoNSdgvCtXBCVCutWpufRA6TqZSOxs6hARBsQ/mFAGL7K
STSlrzybN/UVhI27Z03x6kiEC3sCcXlCo/pXu5hY4dRZpkcO80TXJ1jaXnR40nWh
T6EiNzAHsqCDdy7/OysCDVrZAOyxynxjaILrhdxQdRnKauTEsa+3S90rXpgXCEkf
Y3iE8mh2Lpaq87zPTEPgQqH2uETsnJb/f3CD1igjTA95wx5+WwNNzNm7H+G2c0be
Zoiv6iJgNOtb+JzYDhz175owFV8zVuXWK6crOScywqVndUR3P4mpbbSbWsq/YjTi
9lElGSIVZt3CKKccdHojPBdK15cTD7O/EUDSOdOlK88fkxeVhQG93d07QqQ/oeoq
ra4oX+ewiEY7v2cm+jnob3O6RBBn1f6USOACQRvaolKq9V2aCWmPC6ppxPgSLnBX
JhL01EkzdVsOgHAEXt+cZT2qvzaBjuHw65vEM4EU5nXsW0RcUuA=
=f7EH
-----END PGP SIGNATURE-----

--qTaLEuURhpk3LiI/--
