Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DE323E737
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 08:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgHGGXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 02:23:38 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:55212 "EHLO
        7.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgHGGXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 02:23:38 -0400
X-Greylist: delayed 47724 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 02:23:37 EDT
Received: from player697.ha.ovh.net (unknown [10.108.35.119])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id E29611E2FCE
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 08:23:34 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player697.ha.ovh.net (Postfix) with ESMTPSA id D71D3151467EB;
        Fri,  7 Aug 2020 06:23:28 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-98R002924d5bf1-2994-4c8b-9b6c-5998cd15a743,
                    B1FDDFD4E508142116FDFB9194C63E8FBE397CFD) smtp.auth=steve@sk2.org
Date:   Fri, 7 Aug 2020 08:23:27 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200807082327.02e8a682@heffalump.sk2.org>
In-Reply-To: <e378e4e6-73b3-0a11-bca6-ec0d4225a010@roeck-us.net>
References: <20200806161645.9437-1-steve@sk2.org>
        <5f7b5828-cb7c-127a-e454-6c8b8d98777b@roeck-us.net>
        <20200806221232.278c3878@heffalump.sk2.org>
        <e378e4e6-73b3-0a11-bca6-ec0d4225a010@roeck-us.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/ZP=p/855_tqUdr_mQhb1AN/"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17538705802184117518
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevledvueefvdeivefftdeugeekveethefftdffteelheejkeejjeduffeiudetkeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/ZP=p/855_tqUdr_mQhb1AN/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Aug 2020 14:48:58 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
> On 8/6/20 1:12 PM, Stephen Kitt wrote:
> > On Thu, 6 Aug 2020 12:15:55 -0700, Guenter Roeck <linux@roeck-us.net>
> > wrote: =20
> >> On 8/6/20 9:16 AM, Stephen Kitt wrote: =20
[...]
> >> Also, I am not convinced that replacements such as
> >>
> >> -	{ "ipsps1", 0 },
> >> +	{ .name =3D "ipsps1" },
> >>
> >> are an improvement. I would suggest to leave that alone for
> >> consistency (and to make it easier to add more devices to the
> >> various drivers if that happens in the future). =20
> >=20
> > From reading through all the drivers using id_table, it seems to me that
> > we could do away with driver_data altogether and move all that to
> > driver-local structures, in many cases covering more than just an id. By
> > only initialising the elements of the structure that are really needed,=
 I
> > was hoping to (a) make it more obvious that driver_data isn=E2=80=99t u=
sed, and
> > (b) allow removing it without touching all the code again.
> >  =20
>=20
> I don't see it as an improvement to replace a common data structure with
> per-driver data structures. That sounds too much like "let's re-invent
> the wheel over and over again". If that is where things are going, I'd
> rather have it implemented everywhere else first. I am ok with the other
> changes, but not with this.

I agree, and I wasn=E2=80=99t intending on encouraging re-inventing the whe=
el in each
driver. Let=E2=80=99s focus on probe_new for now...

What did you mean by =E2=80=9Cto make it easier to add more devices to the =
various
drivers if that happens in the future=E2=80=9D? There are already many driv=
ers with
multiple devices but no driver_data, dropping the explicit driver_data
initialisation doesn=E2=80=99t necessarily make it harder to add devices, d=
oes it?

Regards,

Stephen

--Sig_/ZP=p/855_tqUdr_mQhb1AN/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8s818ACgkQgNMC9Yht
g5wjxA//Ugr98eRz3F0dBjgb/dsdKZ2f7yN68V/HyjcOU+Qy/lKbqqhaICkDSBlz
9qfG5Q6fZFzZTSIJKJMBdBX/LimJP8EdqqsvqMv+oTdFF2rk/xU+GEa5GO2GBGR4
rY6fMZwkaQAT2tFrmjj9DkGyCN1oOXuTjESGWvRNZddNCG/0jn3JmjAI3cfRIJdm
CFcpu5aPGO/kEBEM9iwWdY3BnGXisaxMkpqblJ3IfI+O+qNDu+I74TfHEKeuTbxv
xwbew9yP8DveTOJmRaJqJLlHYVReWH4lw01u6XJ/oxeYwK5KvG1b52c9pBug6SlK
HmKfr9fPBhd0jY11UJf6tdLbD6lYY4Sl4pXQ+MMOWYiyzkkxXHEx4RXrZGCtlhfQ
vMfhpw1YtRvaye6D9cbiAbR/xlAtFp0FlA2dH9kepy352pAWjHa5LZg0nGqjYtE9
zN0JJkTmumYjvyCzcia9XNJB83kz5vU5gvlDZpMvUO47jwHTBlpUWW1cy2K0WfTW
Y3hhxGB+NkbfxbEUStbIiA4BEBn0yEK3LT3CZ7prExgLsy8SqulTCA3m2jdoIIVq
P/S6ZMpMHZAhxEG4Ygjl77mJ6gZlrnGY3SL1POOUpwJ9F3yGbneNBXaywpSrEzQq
IWFlrTjVIcg6MD97OR2muSRnTKKdcToMqwPSkHNRwtd9oCycZug=
=sd2Z
-----END PGP SIGNATURE-----

--Sig_/ZP=p/855_tqUdr_mQhb1AN/--
