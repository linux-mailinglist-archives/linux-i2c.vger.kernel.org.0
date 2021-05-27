Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C7B393653
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbhE0TfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:35:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235064AbhE0TfT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:35:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC8AF6124C;
        Thu, 27 May 2021 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622144026;
        bh=TvQZ16/UGmoa9yxvoMiQl+XBpYesXD1RGo48P0vJEeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8A/J1Wt9kaUM+cefTWoR0OhWmkX0nmg3+xppq7liq4bpSS31c84M+JNC+DzzbeK6
         E2nSIEs+V8coYUj04xCK89JhMSViUn4q35afuqzJMjvnjkgfCy8QVwhmanQ40F5tnB
         EjwNYmY1jBOO1KGS+sEvpgnx35f+RtfLjJu/MwqHUneu+Mma2JXk4bXAMnvgun2v2G
         C/6JpG0yKCVOTIVNGDpxBmq6DnIrh+DFhxEWf5OkF5Ec1Wuc9aqLAyzzVTlhAv5AKk
         x69E1iDmpBR9IFzJwzSeCW0e8cERIfXm2yqfFiAEwKQhHXxV+rwTSSDEYsJMiDYQkX
         YYnAbMWIn89IQ==
Date:   Thu, 27 May 2021 21:33:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected
 function names into the documentation headers
Message-ID: <YK/0F1Usuccf90Ls@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Cf+dOQDvq50YH7O5"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Cf+dOQDvq50YH7O5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:59PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It=
 handles an IRQ(). Prototype was for ocores_process_polling() instead
>=20
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--Cf+dOQDvq50YH7O5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9BcACgkQFA3kzBSg
KbZS7g//fLenLeqiftxDzn+Nkh+gHetgSFVjKOHR3pDLvod+2crf9gy4YORAeMOb
JN1kmpunXMagFfp3K3YGHZneFXWb1cEg18HDH3a+GlA6lf/IUpd3+mrnO5arFgOR
i1tODQo+WmgT0s/fdkKkX6BwX1Ygf9GYXnVQ6tQ3Tu8UVxUAv0bir7EZaFnlFsd9
oEcBBA+jW9Mu7LAkAaGnGglxDa1GtSdI3zc5XwpW2K4mx/ieaA8yyIpnSyLaIk5F
UnSmiQkmBvXyS/wZUWZ1Myhs4ChmDA/M5yx1mGsfIDvQ4ZNBribRPMb5rESBNxJi
0lPXfB5pUwZ7oB9IyJh5XDBat2LxQjuBQO6C6db4QqOT4IOLlIxl0UVcyf6+VyTQ
UPwZTXWSLV0ce9Q9VemkchMvV31MBb/iROORtuEAXuSXwA9MMJYviR+PXuxjejIh
aqmzjOhSQ10BH3qwget7vRi5RqACIFjfbTO4hB8kG0u3JPDDxw24vXGyDN8EweaY
arSb1K6DdxMLGANAMV65jvqw6EiMWAAt47xpZxBX4ytdYwA64o75NlNNOou4Fcog
TApQR7b2GZ3P4KGPJj+byQMVtJYVnwmxSpl8IPEm6+vLjdtIKDyLiVttB77X+lSn
KY3ROKLq3RuuV29eJZdqJIaRRDW6uBt7oGNoNsAzy0hgZbkz7CM=
=FkD1
-----END PGP SIGNATURE-----

--Cf+dOQDvq50YH7O5--
