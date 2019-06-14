Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E042046B74
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfFNVCR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:02:17 -0400
Received: from sauhun.de ([88.99.104.3]:57056 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFNVCQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 17:02:16 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 3DCCF2CF690
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jun 2019 23:02:15 +0200 (CEST)
Date:   Fri, 14 Jun 2019 23:02:10 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/5] i2c: improve main header file
Message-ID: <20190614210210.GF17899@ninjato>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 10:25:30AM +0200, Wolfram Sang wrote:
> While working with i2c.h, I stumbled over some issues often enough to
> finally fix them. I couldn't test all of the changes (e.g. all
> I2C_CLIENT_* flags), but there is no code change involved (otherwise
> it is a bug). buildbot is happy, too.

Applied this series to for-next.


--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EC1IACgkQFA3kzBSg
Kbanhg/7Bi0WSYh+A9lGDAngBuhr1lGC9xTWvDBjUAo9tVE2vShn9SIr9Jy2m2qS
97RuEdXuHoyrnnVGn/SzJuF9UEonGFb87XPZBsU0ywcUPN9n+5RTgQy+NsZY4mEv
ut7Ga0sNZjMz7XjAe/++HEQI9oB7SSAcEfCxQ2OQOCCHW9KnNPSI/spSJHGe47vv
o2lAaO/h5yHeWV93kqhzXyvPKTGO9Fp+0HUgRMLZ57bEVQajckyNBK2ZWe2klF9R
vO3ne4tt17FVKvU9xLMrTUG9/aLbyJJm4l7+H332/30X8Ih6lxhbIPbRGf34kHwB
PPuSFaXPMZIWoPiJB9NK+fDNGTHf26Kl2yWlYd67XduCEfIfQ4/3RGEA42NewdB4
Xaa395VXlCDE+pKEE6QKBRBtFaV6heaqDus1oj2fBakQ8FFD8/u8Agu14vauw15w
gFy407WR1pl/mfP8vmk2oN4e6SoJvmqXqZDNdGJA24troNwQh2NoyiIU0QhJFz6v
XCvqFVPAPk1cnSauwZ1s3qK0qxXLeizz1848+qDZS6GODKAq4ofha9t30awi+Z1W
s2nQmMpR3X7AayNfcBu9tcaAcqxCyKzn4FvoUZ7fkOLojRQ1i8TE0IAa8jivvLFd
jPHbSrDFOxWj/kwSjGN7yhab7u5SHAnPvycuxp+kqxKez4NTIoA=
=AFJz
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
