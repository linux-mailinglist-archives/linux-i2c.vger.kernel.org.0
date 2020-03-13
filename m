Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553AC184ACE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 16:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMPdv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 11:33:51 -0400
Received: from sauhun.de ([88.99.104.3]:53134 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbgCMPdv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 11:33:51 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id EA01C2C1ED4;
        Fri, 13 Mar 2020 16:33:49 +0100 (CET)
Date:   Fri, 13 Mar 2020 16:33:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: fix for v5.6-rc6
Message-ID: <20200313153349.GG1852@ninjato>
References: <20200313151246.12356-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline
In-Reply-To: <20200313151246.12356-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 04:12:46PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Wolfram,
>=20
> please pull the following fix for a bug introduced during the last merge
> window.
>=20
> Thanks,
> Bartosz

Thanks, pulled!


--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rp9kACgkQFA3kzBSg
KbaqCA/9EWol5r5JE+IZ6SsqhFPDWEjEz94bM+0lw+orat7Xr4n0grDWxkbQJH1n
b2QOzPnTyOfl4B99h1st7cVB4AYBb7YyBKOjn/kkDsu9yoasxo9b9cxdka7naV5l
749NM7GQxYyr6gfvAwzEPyrStkuxAQbYqUQExwvfCAGXR+rePzRhPnThlJzm1Yse
mU6rlKayvx/gacZ6YhyKFGbG51wDmDeYlfTe34mPOQWxrDGVcJX5jq7ViPP28o4i
4DcecUjk6ls1k+M6lTOkyVz26FAPWwkiWIGpHw4J6FJjz3NzgX180yy25MHaw83r
OXJdoDOAb5au2FIMJdlUTBVBkmyM9Z43l/Qrqr7wAPpmEv4QHb1IUARypstLFO5h
wonpO0uUE8xcq7zHo5n/6xowqpHcU73TsWlE8zHCDnDlcXINpiNmpHS3uX3SBot/
ArB7ZJwf0ylHfk2U7c9UJZY+P22pdbkXEZdJjixldeSU6OTelwcFWCgivt3nUyth
zzgBV+goAk5dH2cha6WEnrpbDhaTYyEVl+7VMcRt+zcHlEBND9FGQAe9EUPPE5Xh
aptsAmqgGnS66Ctwt6pGGkS66o+JTjo0pw/VwKztBYghnYvXafcNinlbq/3Wi7xk
DPUzun0ghWfdrQYaLiviD5KhX4mAgCN16iV+14VGieLTcKvxOJw=
=Qzwt
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
