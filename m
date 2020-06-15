Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29761F97E6
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 15:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgFONIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 09:08:19 -0400
Received: from sauhun.de ([88.99.104.3]:37898 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729875AbgFONIT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 09:08:19 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id C91C82C1F6B;
        Mon, 15 Jun 2020 15:08:17 +0200 (CEST)
Date:   Mon, 15 Jun 2020 15:08:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200615130817.GD4423@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdW=WfGNtKo6y1RFPydFeQ-UqFq4ixOTqQzuW7x3oGmHjA@mail.gmail.com>
 <20200615125015.GC4423@kunai>
 <CAMuHMdVjJTjuswQYkTfWs1oxA676rEQW5TRy35XFecGpeLrrCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVjJTjuswQYkTfWs1oxA676rEQW5TRy35XFecGpeLrrCA@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I meant the one with the "data" var.

Ah, okay. That makes sense.


--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7ncsEACgkQFA3kzBSg
KbYcuRAArq0Bh5xSH2MWpohzM3frrWZ7RnlpjuK6C9Pdqg6XCaeVDCUeZpU/OaGo
80KMBYm01yQcYImYpDO1Y0ULebxNGQ+Dpg0Fmre5uP+yJRkwZPIJzvTzXnjnO0Ei
I5iBnyEDRcOYHjHlsT81M+Et6VgrEgw5A4o35UW/3o9+AgIUalsO1gS2BN3FMpxC
p7PHyFbd3YC0Vw5Zh+n95e7BxnFiAKl7Gx5+wd7sPMU8i/kPQqLlVM2zDgixFCh9
4f9wxOxRZ3h4v6XJnWea58BL2SiPn7ChhphoJqS1NCWUpKGmCAVHVl+iP6TtsjHn
xQx8+SHpjHnr/WQGiKGBQaMR1Rk3+Cgh7l/OweYzrpWiMwmzpgsAZPljYp5uoEFI
aonKOqV9329Tw9YqRp6UvJrPmkHh4+wDSgxDZoZJUa/aDqQ4xnuW0QF8jgJjLtAL
7/1OPGzbj85efpvOO+U2NTKNZSf30OQdXLSflMS376OkWjf3s3JmcPicwamjcU+v
MDDBTX6mik7yCFYxiQryej3c5dS13lzX9iPZV1VoUjeJCGVwCdD4/d0jlm4bpc5u
roiV/Pc+Nse/PBp4TVDWWeYrU9wrtZ2+JTr3FKFM+jreATSV7JUxgdammiDEauIr
vCkhzh0Yr/5+guQcY30l7FfK+VkvFA7HMju6Wgp86Dot7zYNAkw=
=RsIN
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
