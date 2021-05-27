Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2BE39372D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhE0UcA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:32:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:36038 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235263AbhE0UcA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3vRboUL00FaHNtlzucSlpZVziBdw
        CkqVaLtPN0iT4mc=; b=H18322vQvrsvdfrGjT3b+mGfgc/JGcd7Q5VW3qFe/V5N
        Pt0EE+GNI3lFCoEhbOWB/t9kvOuxEwsiJ7eldayYd+IRryZt2YFZ6FNiiXjVleC/
        RlnBdU7lEFtn6rGMHQxTl1vJgv7/IdqUnQi26bifg0U9MCmkxL06+wSQKL/fmEA=
Received: (qmail 2107360 invoked from network); 27 May 2021 22:30:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 May 2021 22:30:23 +0200
X-UD-Smtp-Session: l3s3148p1@senxoFXDdN0gAwDPXxB7AHdFEDpp+qdC
Date:   Thu, 27 May 2021 22:30:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Make debug message even more debuggish
Message-ID: <YLABX2jZFBHntZkZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210428145751.4934-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HFU+PVZGnkS/JI8e"
Content-Disposition: inline
In-Reply-To: <20210428145751.4934-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HFU+PVZGnkS/JI8e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 05:57:51PM +0300, Andy Shevchenko wrote:
> One may notice that dev_printk(KERN_DEBUG ...) is *not* an equivalent
> to dev_dbg(). It will be printed whenever loglevel is high enough.
> And currently it will be the only message in the I=C2=B2C core in some
> configurations that got printed under above conditions.
>=20
> Moving to dev_dbg() will hide it in the configurations where Dynamic Debug
> is enabled and hence align with all other debug messages in the I=C2=B2C =
core..

OK in general.

> +	bool error_or_debug =3D true;

A bool having "or" in the name is quite confusing: "do you want this or
that" - "yes!" :) What about "is_error_level"?


--HFU+PVZGnkS/JI8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwAV8ACgkQFA3kzBSg
KbYoLBAAqIv72cesNSS4sGqi6ULAHBz6/5zx0QDRN16c7JLd67sL7pKcwHO/gneR
pIL2IxDYsJDmsjXl+V/JbfeRCizq/igRLjfiLv1GT4GzE0zsrUnyFMa5sramluKu
C/wArnGinAp9vQeyXV5AoeYHIeDF9LD6hhV2bHJpWuTl3x5GeX+LGJ94zDsh3ZJT
uf39qVKxzkrzQqtVxsENzOBN8kcOlA7/wfXdWHOsNZk9KyoRXIR0pllAliCa/gs0
2hkhPPe7e1MYV/32vJFeR8mrnSNK/cGYZy/Sry77eJhge1mE/nAVxZs5Yy/7xFNa
G457eLh7OZDEwnhnAeOWIWbC4gM4qcUL8lnQLkfH/ACFPs9/vahbPSyOIgFJZnwN
FDempAq/ZjH3ZDwjnjnhfgvWumk25yIV9542XNlqGImWXckbCBpGRM6WkwaouMS2
R2MlkdrJ4yOuXL+R2rOUnfW/BIc9EDGu4Gaa16TKrvLH9zIWqNRVO3DWSSpmEeq4
jnCSwTQp9T2GR6BQag754hrix7X5qj5U3fAPWDbp/ig1f9zNrgt71NqyqlhItdKV
Tg0f9tzcfH8T2pAXOl1nTHQpxGrlU3VhPP7Nc0FrxlyKqS+72gCTAoJpWxk0pXwq
/PPWdH7rHP6dkq3XGOTFrBNPXz6PF7Q+uXaJFz+LcJcegIV/fUI=
=x2Vk
-----END PGP SIGNATURE-----

--HFU+PVZGnkS/JI8e--
