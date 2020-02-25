Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540EB16BFCB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 12:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgBYLoD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 06:44:03 -0500
Received: from sauhun.de ([88.99.104.3]:37606 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729178AbgBYLoD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 06:44:03 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id 8E4AB2C08C2;
        Tue, 25 Feb 2020 12:44:01 +0100 (CET)
Date:   Tue, 25 Feb 2020 12:44:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 01/40] i2c: qup: Move bus frequency definitions to
 i2c.h
Message-ID: <20200225114400.GC3677@ninjato>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200225102233.GA3677@ninjato>
 <20200225104708.GF10400@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <20200225104708.GF10400@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> Motivation is simple:
>  - Standardize the (small) set of mostly used bus frequences
>  - Get rid of repetition of (subset) of above in many drivers
>  - Reduce amount of potential typos
>=20
> Let's discuss it here. I don't think new version of this would be good to=
 have
> without initial settlement.

Well, for me, this works. I agree to the typo thing and having less
magic values. It's all OK; I think it is just nice to have some things
in a coverletter.

> I aware about that, but I would like to avoid I=C2=B2C subsystem storming=
 for
> another change like this. So, let's consider this as a trampoline when in=
 the
> future we will switch entire subsystem to Linux wide header at once.

I can agree to that.

> > Furthermore, I'd prefer to
> > have 'MAX' in there, e.g. I2C_MAX_STANDARD_MODE_FREQ etc. Just to make
> > clear that I2C can have other bus speeds as well.
>=20
> Works for me.

Thanks, that's the most important point to me.

> Btw, what about Vladimir's comment WRT STANDARD -> STD? My personal opini=
on
> that STD is a bit too short.

No real opinion here. I think STD is understandable enough and I
encounter it regularly. However, I also don't think the saving is huge
enough to matter. Your call here.

> I'm fine with either. For reviewers it would be better I think to see only
> their portion. Since I got a lot of tags already I consider I may squash =
it
> together. So, what do you prefer?

Sounds good to me. Keep collecting acks and squash all patches and tags
in v2.

Thanks,

   Wolfram


--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5VCIAACgkQFA3kzBSg
KbbQ5Q//fiV/IXsIbWndAgbXdKlCN3M6ojXZaTj4dOsoqdU4Wp+xMaRloWVntlll
Q8kMd0yU8jQyJrruZfLgzpWY/XFkOQX7SltbnTxy/jGd7H1XJ28bPgsfMuLjKoBP
lq+qGnhAkDkM00mKum8pBbbU46tbTEZpIywMkttu/yKh0jfVZbaJ0/CcTBj+8Q7b
KnCmJpoTOUIELvh3pACBveQoAZc+oh0eqaZCMQtERg524UgIsQaS7YAaeUaN6rLk
9pICX5Ju4PDRI6lqXf/ZG1BuVu/hmjHo5JiKFS5zNB2+6voI20LvuaU7b3iiz+86
Ui0r+AKo0MdMdPpa8Q0qvkMXmcjHhkGiGL0IcNQhKSQdTKHhhxlgAepQMdnxojcL
O7pyB1phdX+QFSz/zi2srbtM0M4XQWZZPJfRiCAIrpSd91UBTbuuvtHQyQHoCG4y
VGvOhMoc6H0Ez/44XawuZkYiCaYq6SdQ76t+m8WV8Gae8YLYvDO91ZHSk8ZlXkA+
rhSgB9gR/of88T1ncd4qjgJw6LhetsXsI97EY5HOnzzJZptJDX0uJCZG+JQ7IoAg
b6T2KtYIHmAYjX0tqF/G8WDZ6lKnt7T2cVYeX0tqba0LWcpIGvwunh+eTJBueHn8
OsNCGaIhsSu/0L0HsdyQWwwkqYbBZaHVpjwqzCMPlE6lCv41/zI=
=uKbN
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
