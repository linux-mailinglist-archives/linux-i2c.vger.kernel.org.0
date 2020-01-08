Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193FA1343B3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgAHNWY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:22:24 -0500
Received: from sauhun.de ([88.99.104.3]:34998 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727782AbgAHNWX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 08:22:23 -0500
Received: from localhost (p54B332C6.dip0.t-ipconnect.de [84.179.50.198])
        by pokefinder.org (Postfix) with ESMTPSA id 3588A2C05CE;
        Wed,  8 Jan 2020 14:22:22 +0100 (CET)
Date:   Wed, 8 Jan 2020 14:22:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108132221.GB834@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +} else if (ret =3D=3D 0) {
> +        dev_err(&adap->dev,
> +                "alien found at %02x, please add it to your DT!!!\n",
> +                addr);
>  }
>=20
> Wolfram, do think this could work? Do we have all the addresses listed
> in DT marked as busy early enough?

Not sure. We could do that, but we will still have the transaction you
guys worry about.


--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4V140ACgkQFA3kzBSg
KbbdCg//RQ9gfkxB1c6YBVd4eCZo0EUHXmkk72LNLT9L6A2Rv8kbfFLXcHgzaOrp
bpU0tX0XBHa0TB3c+5+bhwCcdHhhMkaHQWWfnPy+yvAYjAmo6OFFHR9tr9zzp9C/
4FUx1YHUnckmBMvLYUs7c0s0NQefGw3AlNOfnmCAlkXdS9/4or/rTdbEo/pX3ScM
tyjLn3xEVKZQqnLMXfkdSKOklKd82XxnARF05H63REj4C+Xe2gvSUelkAJIdzFYa
4WUifPqE2E7sXtCmpb4YDFK4aAGvoFnP3joT1R0u/M0xc4UxzxHCYgdtuVnCPzyA
5L9DjG+JcLq6jV39n4O5gL87c3VD8+lRTRjqj8M7ocjrqS3HUK6wfTNl5KV87PHu
E1PtfZBOb3G3qsBkFKtxfO+3Go1HUoP0+ETudBKT+LWi47z81mERNDwuaqJFhsM+
Nmr8PWp7J5ynVHwLMrhVSp4KBViqZdW3LFRkHsTC5VI0cqE7Br7t+PsDXFODttkB
j7e7MdAq5loCeo00SwIqHrOwltVdHUVMKUwJa/qbNQGFsQduaY6li1O6ws09qzxg
PST6KkeHCAw6JNDQwwaGpnHMtGwUL7/72WJwJx6/5E13cLDSIzH5d7GFjzHumwYM
eeBDAhvVtNKtJnqu+6+PrUH0MEnaCroXPsF4rBAa0TguR+k/T54=
=dylL
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
