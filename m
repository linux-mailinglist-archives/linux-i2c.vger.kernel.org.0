Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28E920DF80
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 23:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388036AbgF2Uh0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:37:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:52280 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729572AbgF2UhZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 16:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=EWfaYWeirl3pnTKs+71ODmecYj9O
        pi4u86/kiiI96/A=; b=Dr2u6Rl715BATmfuQ0VGT7UIJBTNpTSsnxv9i1f8WK6p
        JtozOtBTIZg3rYcbNg1Mnyf9nwPRKyS2iGDkF3aN5qawqxseIOctiRKd2vc2g0bA
        3aVmdIjQfMaXXwmchtUxBzl7/HuX0LB+ZSTegamwq3/40O9SyvqRHw15IvN2nQg=
Received: (qmail 2019385 invoked from network); 29 Jun 2020 13:37:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 13:37:23 +0200
X-UD-Smtp-Session: l3s3148p1@gXtzezepHLAgAwDPXwOPAD5GWjq5uCZs
Date:   Mon, 29 Jun 2020 13:37:22 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
Message-ID: <20200629113722.GB1932@ninjato>
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXFgR__hnUO-o+2ukxOYc_6U63wjP1PJyip3KGg277gDA@mail.gmail.com>
 <20200629112119.GA1932@ninjato>
 <CAMuHMdXaXxDJ_bgR=wLnyCjmfH0kC-SuVBPRZv96qzKbvbWsHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXaXxDJ_bgR=wLnyCjmfH0kC-SuVBPRZv96qzKbvbWsHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Lore does not forgive, and does not forget ;-)
> https://lore.kernel.org/r/20190802133656.GA23542@kunai

Ah, right. That reasoning still makes sense to me.


--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl750nIACgkQFA3kzBSg
KbYkNQ/9FSJImu7iLyknpLOqTblrD7HjKzv3ouD/7mNiL/wf1adG9p6HQ3Ee+92u
Kanijo9sS24UAyAmE82s+aVrLus4LISvw3RNEmP7PR+OjSlpT7VdHo+Ax1MoZM7F
KPrvlMhnxIEDLF1w/p8RoT08lsKkQu0W8z043lzxSzDSuEoxGfMECzTMrA3aRP1j
TojQzznIBbYXJrhOyPajiWnN+ZtTaQS/tAYBmnFzoFsbyRilr/G0Og+AiyWPdVzG
WR6AliDqunoQL1BUZ2BIZgfMFoKrxmFfX0mPBocC27VmX4qU6eyNg29ocn06K4bc
Py7Qf7F+tg+2h+QXsFsKWGogu0UmhNoTazEcU078EjRN++RiToiEoh82Kxz5erF3
xDTvR+ryQpp8T1c7pxrKgaDdy73/XjXXpReoHsci2Rr6oLcFjWE1czYfjiLOpcrB
oBLGqr3Lw6jdYUOohDIoIbFzKnEcNUHHAN9qeFcbkDbBy1dt8IeCjjWkChQLzIcC
voDvwI62kNuqoGqOsBZSQjwp71BV9cvQh1k0yH8NTThXmV/NGkfdjZsWGbDjvEeZ
x5viW6+eEezpX36bbkGRXXvqNXEdMF8p72v9zXo5H5AOgm2udxRHUGhWfpV3+YUY
XfYvJwxkdTenFZW1SAuwxtUek3nO27liopJnxbU8XVEFJsUpr5o=
=/yBl
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
