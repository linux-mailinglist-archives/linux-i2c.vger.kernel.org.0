Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822C49090B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 21:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfHPT4m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 15:56:42 -0400
Received: from sauhun.de ([88.99.104.3]:48456 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727542AbfHPT4m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 15:56:42 -0400
Received: from localhost (p54B33308.dip0.t-ipconnect.de [84.179.51.8])
        by pokefinder.org (Postfix) with ESMTPSA id 8437D4A14FE;
        Fri, 16 Aug 2019 21:56:40 +0200 (CEST)
Date:   Fri, 16 Aug 2019 21:56:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c
 drivers
Message-ID: <20190816195640.GD6886@kunai>
References: <1560796779-17117-1-git-send-email-info@metux.net>
 <20190621211744.GC950@kunai>
 <c669a041-f025-693a-492a-80ce888db737@metux.net>
 <20190624084427.GA1014@kunai>
 <205d0ef7-d487-006b-d104-88958f40e197@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <205d0ef7-d487-006b-d104-88958f40e197@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


(Found this mail in the offline draft folder of another laptop)

> So, then the current approach of using subsys_initcall() can't be
> changed easily, right now. But planned for the future (or at least
> not introducing new caes).

Yes.

> But: how does that conflict w/ just moving the existing redundant
> pieces into a helper macro ? The logic stays the same - just using
> a shorter notation. (assuming my patch isn't buggy ;-)).

It is not conflicting. My thinking is that such helpers, in general,
scale better and are less error prone. But there is nothing to scale
here.


--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1XCngACgkQFA3kzBSg
KbYWTRAAjHFuFmxp6ayjp/MNRyXYjcRadDc3TrI200+v/8QzljjpaQ4oBTmXoKPU
2nqyXXulIQZU9Bfy4IxgNHkbv9X3Au5mC3rJP+Mp/77JfFyk5EDFl2sPWlg2gt2g
kvgjFTv70bOso6Md3V88f0XppSFDj0rXJ33dMwTaDIEVVGBCE22o6ei0AQZfs5qb
PS4UtuLBxD3nahjziH6GIbY69CxCOPgXcLY/WVT7FjhyQu+RmZzRVJ9MCJRyE7Nb
2at41jzk1fMpsAligpgkVGRDLE2yvGgoDwiCWO96SqUsM/8ARmXk8PmHCUsn123G
MJbtl9D96AkGSKTe3JRXuPkcztAzENWF8en+AT3OfMwuB5aXSv41UTCTEy61SWWV
eQlCtX5h89NIreEmwU+n0tVpQG5Q0C3ds5toCHyuaXvSHWfucmMVbY/pDyezBuV+
ON8qCGii7VJpsafs1ggn59bxKJJRRkztN5SVahqUAafIGNGNLZEQAl1S+fmVuEZn
iadGjmQFnv89hDpniObnVvfV4hPYEaNOfrIDwydGpL4mB/wKLp/xLE+Oz3Qd0Okg
d4JHRahfTM7Dq2YkWkd25jTkTe4UugGM1kxxOWIwjyYEM7mULa87npP2ZRCboIiv
CEc8dk3c3Qke9oEtYsQ7SoXuLjtURRSsGgSr+rgQrk0AaMsXNVk=
=QklQ
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
