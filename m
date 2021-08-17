Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1123EF2BE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 21:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhHQTmy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 15:42:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:46128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhHQTmx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 15:42:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E3F761008;
        Tue, 17 Aug 2021 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629229340;
        bh=8vwSU/yZzOg0ZOh2nWEiUk4FqXkEglZANChwOG/xNEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8i+dlZpUH+QP8mXCecrPC0ne8OSvTyVA1QI1IRmwK8DORWVBvvG4mLJoRRQQ0tmr
         WoD9JPUJAvsQjvDAUUURQXMuhxEFBzvSEuU+dvUHXKNnvIC2g0CnsrTyLmywbVQech
         8KkJQ1XgPgynPb4k8Qvhx9OOabSsRQlgO+gyfWvZlVPgHJUhQLzu1gQr+luXh7MwpW
         230eh2teCXY0Iv1KVohwRPLZtl1P3ckAQLArO7T55+in4yHcf/XQ3VzomWCxjS9K+U
         mI3sCdLqm4uXt2q3jag71oaxopkeDxeJb9fOpYCODztAK3GDannGkXkXzXrDEozKbu
         SR/x2Kyu+7qCg==
Date:   Tue, 17 Aug 2021 21:42:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: synquacer: fix deferred probing
Message-ID: <YRwRGRNFIRlrFgLp@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
References: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
 <1ab424b2-95b8-76ab-9d18-9362d1595887@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ExzbcEZ1O/YpuoZK"
Content-Disposition: inline
In-Reply-To: <1ab424b2-95b8-76ab-9d18-9362d1595887@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ExzbcEZ1O/YpuoZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 11:39:11PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error codes upstream...
>=20
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C contro=
ller")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
>=20

Applied to for-next, thanks!


--ExzbcEZ1O/YpuoZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcERkACgkQFA3kzBSg
KbYmuxAAkgvQDcMqp4VeYFK1CIqnRYKjtXsy/R5ndzrBfm46bWXGQZQOMQyis3XC
45r3gCO/GqFITAXrieYtCOPj2Wo1It4I8kJ5MG40cnjK50EOTe0YO72cklnnxneU
EsH6kkjepd0FP9t2TnYuBhmoyvhPE4I8oiMsVqaaUpXe1VBk6II2Xr8K2s37hoHy
FzR1WJPM93DlJ5F+YI/06PAdI2xk8tuENruIbsrz2qREJobmhkUJq3dtlnTdhA21
c2paDoN/AD78bIPC7UcbqnodkVrgLl6sGrH3v4xhCeZiBkEyib+NKaSnN6Nxr+Hd
bh6PZdpwezEqGYAUxtDtXhFfZv4gR0d9HvfdCvI1nUFK4+rbwHqi5+Cidyt9GrrZ
rGvdZDeihoz53i7j3KMlhhXJrCqaiN72Lphpn4bWHmTXX+xJToadt1pABdsgVz6o
BVhO7TFhNUbdWlHgRN1nQw4Vr7Hnr7p3NKRTwbrj8Q0jrCqyczf8ckuaVooUBkPJ
TH7pMoChHtiLsAhRr6+VWU2s+Jzt2sgsFvRsbh2lM4jN2tAUW5+CmMMkGi7BDcBy
5FklHkCIhS4KuGsgqG2VU4Nr/iW/zBcDZlO7QOnRh5ClELnKr+xw2EupHGoybpWg
pPST1LhTvSWsQe1+bqODueZPHxbZmz4dDyLjhROthq1d7y+EKyQ=
=te/n
-----END PGP SIGNATURE-----

--ExzbcEZ1O/YpuoZK--
