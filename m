Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B245723D808
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 10:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgHFIeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 04:34:02 -0400
Received: from sauhun.de ([88.99.104.3]:52276 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgHFIeC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 04:34:02 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id AF5732C0845;
        Thu,  6 Aug 2020 10:33:56 +0200 (CEST)
Date:   Thu, 6 Aug 2020 10:33:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200806083339.GA1549@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Stephen Kitt <steve@sk2.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200805183149.21647-1-steve@sk2.org>
 <20200805215351.GB2182@kunai>
 <20200806090800.08b77d4a@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <20200806090800.08b77d4a@heffalump.sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Maybe because I don't have the commit in my tree? Can you rebase on top
> > of 5.8?
>=20
> Ah, yes, the commit is on top of Linus=E2=80=99 current master, following=
 the merge
> of docs-5.9 from Jon=E2=80=99s tree. In 5.8 the file is a .txt file, but =
Mauro
> converted it to .rst for 5.9, and this patch removes the latter file (to
> avoid a merge conflict later on...). If you prefer, I can submit it to the
> docs tree instead!

I see. Thanks for the heads up!

> > And please also remove the reference in Documentation/i2c/index.rst
>=20
> Oops, yes, I=E2=80=99ll do that in v2 once we decide where it should go.

I am fine with either it going via the doc-tree or you sending me v2
again after 5.9-rc1. For the first case:

Acked-by: Wolfram Sang <wsa@kernel.org>


--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rwHQACgkQFA3kzBSg
KbZHXQ//c9DIYXPOW2Pp6OWXKnsA47NLi/SQHWhhINgm/Q9zZpC/guVJbgpoQb35
7FOj3e2RxarfIZOkaDFTZuPv+I4noKF3cAVHQTARbB9zDMWm0KKCkn3lkokWvToO
Bw1sZDus7kNi2soeXzbfF1CnlmgjAXSIj1tnG9nUt5iqETY+ov+jq/biAZc3tVhD
R/ODgJLQolvlZs5z8u95D3SLLL1Zi+zSRCGpNMFpS/6RaxOd369vWUlw9xH6+S6C
aqcP6q6pMtIY51R3roWremGcFuWX0OGMG5grucwsY3Vs/kwt1zP+JrwsTLz9Tsjr
fTdS8N7DzUBG21axjhR3FcwonFI8xocPGyuAWHTiEC3nfVbF8Hf2dkm92H5cLKN7
jO8zdNf3wd4UeCkRyU/NU6gn6ohbnJCM+qda5ooKuTgUpsVNSg2vLRL/YdvOODMC
utnLwVwvWr5l/H331fRfrdEL+aoO/wt6iE3rx7+0wXXRvx6/NECwlPGZZ0M9JT4W
oYJk+qsmtcrj46ura0v6Lmy/t2vPyPpmH5zgfFxl4ek3ZMYenWu7Msxtn6TMdzWK
ReouigCAeM+6hwJSsNEz8+2RdDF2iejIS1K/yldqKuFmZGQIgMyDlWQyr/JySWuM
sk9qHULjnlZsuvS+W8HIhOB3282Rtdr6OvFEzhid2nVEnxje98U=
=KhdI
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
