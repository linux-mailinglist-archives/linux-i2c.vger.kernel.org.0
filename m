Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE744F067
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 23:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfFUVRr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 17:17:47 -0400
Received: from sauhun.de ([88.99.104.3]:56154 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbfFUVRr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 17:17:47 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 21D772C077A;
        Fri, 21 Jun 2019 23:17:45 +0200 (CEST)
Date:   Fri, 21 Jun 2019 23:17:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c
 drivers
Message-ID: <20190621211744.GC950@kunai>
References: <1560796779-17117-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <1560796779-17117-1-git-send-email-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 08:39:37PM +0200, Enrico Weigelt, metux IT consult =
wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_i2c_driver()+friends - now for those which
> are initialized at other stages (eg. by subsys_initcall()).
>=20
> This helps to further reduce driver init boilerplate.

Uh, no! Using subsys_initcall is an old fashioned hack to work around
boot time dependencies. Unless there are very strong arguments, I
usually do not accept them anymore. So, any simplification of that sends
out the wrong message.


--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NSXgACgkQFA3kzBSg
KbZjXw/7BDQPWzOvqZPNd97wNb483GXB/NYxRB2BDp1AfM5gWiuL/Bboumrl55JP
p4olpY5+yuKMld0e4kFyNHAwtLYwrYtSxu/BORhV4Cw4J0JdgaCuw6fcOEgQ2nze
vE4rBvCZ5iQHWCG077uhNkH1SdO9yiIadcycWst7DhFCCIPj5o5SNNXM6xdnLUO1
DVcZkiO8yqQGemySpJXRGlQH6qQ3JEVTOaliWB8A49JFioI9zNkMEUyLxzw2vNvL
PCfcDjTIDa0nwgFxoty5FNK/UJRBMwO9GOGqUfSemS/INjYp4OQ8e6q+IGYWVSUE
0uwkg/aYvvKLCEPtBOspdRO+larQQIlkykicBDRRzzbbjG4CNgc0pyZCK1u15yQb
Ag1T55ThdT4DS9dgWnPjHnTh6Zb3Ge3KuJu2WuwGitlA+XPKCWMIESUwZ4gyTJd/
joshHaK0TvtqtRVxvtcEqo8JCXHd1IH0OWx/pacGPW9NkmBpjTRHIo1xGPwzFnkj
PyC8qyh/rSDZyfVvGXDcdYOqCzj6Rznqh9rcSgGqxKWKDNaCjwk8xa3p5weahKIc
gPJF8Z/VflyKGhpTBzFRGMpigvqfwINbWvVOi8T9FLlEkAFGNa4Ty/hI3d+xY6dj
pNu2XykPMevZrYs2y2JDiQ1Zb+66MBl6ES5FLspJ6NV52t58wZ0=
=5ptx
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
