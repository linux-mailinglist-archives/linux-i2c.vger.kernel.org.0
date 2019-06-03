Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0FF33488
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 18:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfFCQGl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 12:06:41 -0400
Received: from sauhun.de ([88.99.104.3]:38874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbfFCQGl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 12:06:41 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id 766722CF690;
        Mon,  3 Jun 2019 18:06:40 +0200 (CEST)
Date:   Mon, 3 Jun 2019 18:06:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
Message-ID: <20190603160639.GA2749@kunai>
References: <20190530210421.24941-1-linus.walleij@linaro.org>
 <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com>
 <20190601080245.GA1012@kunai>
 <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ah, right!  Even so, CCing LKML can be a helpful thing to do for
> patches.  If nothing else the archiving on lore.kernel.org is
> valuable.

OK, can do, no problem. Still, wanted to point you to the ozlabs
instance to make your life easier :)


--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1RYsACgkQFA3kzBSg
KbZT0A/9HkZ/QTn9myLRWEph3uaLZTjJ30AL1l6Q7BNwXahEQoAws/sge+wEvLqM
JXfr3kQSnPIpZjjWiTz+bt6EuXC3w4AZDqMDnzmemCjDyVqyAAp1P923msJ2xqjW
QaqMaMm3YErNOtiXmz7Nsu6C2kxv8BgKor4nShqvVImaGgLwiYHtiLUzjsej6qpc
Zu5IbbeLmvO2bzZiiWewQKWI2dJLnXAmnyvz2LJmxVEXEoF7SaelnB64d2re54uP
ZPsAfRdnSLWD3tTAl9b7nF1iBMd4y7nk2+qpH/wBFCIe8mcyw8rIdNg4FzHbAvdJ
Yoj554s8rjUTQeQugll2xZfYnlhCwc4JY/4KksPLkCyIPNyMml5mOHf411xU02vo
0UwSijYmqte/KeG0wFfQTjH2Y67QavMW3yzJcX7JuzgnMWBW/pF2CKDiBV2X2PhN
R21WadPgf0GxNzUBmQfNFcN8cMSstaE9cZwGk9NthSCJqI7knJMVK3YuXdr39k9t
FV0Riei3XiAZHwCbXX74pS8tLedl8l/ntCTRRGBaq88qJ8K32MVhfK/9ywPlwkp1
CqndPyUhgxnII+qIzsOs0aXJXi+9NpQwdQo7MDh78mowqPw/nNiLyo8m6A7zLQin
y/283zrlEZneHxLU2AmPH6ruJDtoiXVorDjvLBtC5GaH/9y2o8I=
=RrWi
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
