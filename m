Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D973EF315
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhHQULd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:11:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233849AbhHQULd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:11:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B30361052;
        Tue, 17 Aug 2021 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629231059;
        bh=mlzSI7fFYukfGz1EkMwJQVBn6JU9wHI0KzPqYv6IIvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpapoUN+Ml7cS9vYBAXnfJTfhDuiF+D/v4ZLikPACYmGHfBiDABHecMqE3v7kCWfR
         m/dm2AANtgpoQ0IZTGygzGYHq044PyiPf0MNjLT5lWfUKy6NbVPBZMozw+T607ZU6d
         DfmNMNQJEmckmch4krbLN7XDVF2n226JLCIxLslhgrX3fTGoR2DEo6lcP2xFDaUr02
         uIHkPh6Jm5E0FFFyo4HfKcwu+OvUSuoSofzHnxcBHvsAd6rmrEH2L3UyOeZY0Fmvgd
         nT6+JtiBfjmTTzbSi+VL+LNgGzCI3bvkM0eRB8dYyNTH69ggaTQAUpFxGIMJ2aiSqd
         LULApgTAxAGPQ==
Date:   Tue, 17 Aug 2021 22:10:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/5] i2c: hix5hd2: fix IRQ check
Message-ID: <YRwX0etcgvAO/B1i@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <f6ab965b-2ac1-ee30-358b-a4ca45708f33@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1XxKAMbioDkeTtXV"
Content-Disposition: inline
In-Reply-To: <f6ab965b-2ac1-ee30-358b-a4ca45708f33@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1XxKAMbioDkeTtXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:35:54PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: 15ef27756b23 ("i2c: hix5hd2: add i2c controller driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

Applied to for-next, thanks!


--1XxKAMbioDkeTtXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcF9AACgkQFA3kzBSg
KbbspxAAlA+9LO72t41716XX4qPLtwJ/BOsexl6xKZs7wdtGhrXz9pfH8xVzSSq4
qtcS0Agcc/v7GUYxU+r5dQ1GBzh4zovVE0uo6Phxrj9qVt4Y9Kf5MOjrUKI02Ai/
/+v4i1W0JvMW7fXFeKALXElLxDlYbarW/MB31IQYSXgJs3Pm2deMnur6d2vbLkcC
wxS1wx0kdUEapLZOt5wTszou3p6vTqi4q2l5AEQZHnOv9/KThTqQpkObmugVXMMp
Dh6q+JaWPl/WFW+2VkEiMYku0TZtx8zE1anonw4tvwUU/GxtPRjoUSheRbb5E1RY
EUgFox2Ft3BbMXvUFcemYdeq9C8h+SR7FuOyAyBxpMxYRxASx+gooveDck6NL9wS
udoD+VpJbruQ338C1qrI0XxCoZrd3mBTZ6McbQyaIQlVjxZUIugfvgRpy2BiE7KL
zpjeR0cB6zQqP1YuspNxVodQbt9PLEImC/3UkTlI+oOgZrSj9ltI+GPQq2HUNEl9
oRRHTCt1A12lOolnOXtn2C10I9yQR5fLH5eVhoFuGfpOi0aY5jcRaIwLdff9dnPM
WvhccQbc8/DweSxexTrz1g9BTch+dcpccogvkz/xHktenF8nTFnDtp4iuJy2cNPp
9sWA+njKIxgU26C/C2FEOWtqdG0TRv/exMbCBaRnTJz/IqBDsYI=
=cAUA
-----END PGP SIGNATURE-----

--1XxKAMbioDkeTtXV--
