Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2790C1CF50C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 14:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgELM4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 08:56:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728085AbgELM4o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 08:56:44 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 850FC206D3;
        Tue, 12 May 2020 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589288204;
        bh=cPsBmJJP+6Qh3Vr+QAI5Nhxpl2klgoaErTdBEfzdb3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibwhBXiYDwV9QFOHLmZFFBH+jOyNvDQbE8vRWjcP+eN8gp8AOyC1qSCKJpB9zTxGx
         DRc3mHF0NjU/ZBpacfA5XfGyN4eKkhAOeZJd5eqw2s2EmcpMAInkBdj+57TdXoB/GZ
         EoTOiondY6Zr0rtu0nfGAPKtskQaTFYXKkH/kgYw=
Date:   Tue, 12 May 2020 14:56:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for
 writing
Message-ID: <20200512125641.GA13516@ninjato>
References: <20200512122450.20205-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20200512122450.20205-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 02:24:47PM +0200, Geert Uytterhoeven wrote:
> "258" is an odd power-of-two ;-)

Geez, you got two additional for free, Geert ;)

> Obviously this is a typo, and the intended value is "256".

Obviously.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66nQUACgkQFA3kzBSg
KbYQ9BAAsuHP4dwKs2aleW0gb7U53oIvcbFwy0rSjBmVkldgihRfBx5Tu2hI9Lfb
Whxarj5wOBXk/WPiT1ReJ0NW22S5QcXuHp8oWeqDAWHoe0s1Yx5X2qa88/xA1PzL
w9DL3TdufvugzDjYgnEqyM+LuEklkma1HGOU8QVYD2s/ol2KtKM4k0v9y10TnLPr
nw9vJFEd3CMC3Dnw+dh121r+LjQ0mv8+HpwRyLoTB8IRs/2vhryb0795VeFCZgYs
WxuakNEDDoraOwehY8cQ9m7nkQFRMD3h6LpbQbiWBih+lflcsl9ZcOarGroo0gRz
G3Wr3pdXR5+ZaGLzAysKfGTHtUGMMqhmaL4KpXJhI1EjHCmr1jm960Dc027fvc4l
itYNzKdJYIuaxUU/sQmKowP0kd68iGl2M5IBy9snHEfjDqkyTT3aiJZ8vsjGKMuT
hfwNHlU7FBTeJVo0zVgm7zeFxMLnOsC1pWrswyaVKBSpBtluRATKXEXExp7RJyC3
E/xQgpmK/AiPLT/5BYMDdfb0b3AzBS3GRN2nk4pNMvxinXVQZYyce9AqWmTi4+UC
+74RI0yqaFWdDNwdi5uPOEGcmQu+xJpxgM49xzXkSum2v0RbGFbH5wQVbjwAHMi/
KdLM8OMTz6oibAytH3W3TBeSbp7HSmw3hICNNcoYECpP/8zhMIA=
=Tjw4
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
