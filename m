Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779A823E385
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 23:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgHFVcA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 17:32:00 -0400
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:41040 "EHLO
        10.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHFVb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 17:31:56 -0400
X-Greylist: delayed 4200 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 17:31:54 EDT
Received: from player797.ha.ovh.net (unknown [10.110.115.215])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5E4EE1D12E5
        for <linux-i2c@vger.kernel.org>; Thu,  6 Aug 2020 22:12:45 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player797.ha.ovh.net (Postfix) with ESMTPSA id 733BB11028092;
        Thu,  6 Aug 2020 20:12:39 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-105G0062b87a758-947a-4325-be91-5786992cb203,
                    9D5F4B8471F7AF6BEF45141B8B52B4DEEC6DEFE4) smtp.auth=steve@sk2.org
Date:   Thu, 6 Aug 2020 22:12:32 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200806221232.278c3878@heffalump.sk2.org>
In-Reply-To: <5f7b5828-cb7c-127a-e454-6c8b8d98777b@roeck-us.net>
References: <20200806161645.9437-1-steve@sk2.org>
        <5f7b5828-cb7c-127a-e454-6c8b8d98777b@roeck-us.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/FbGeJp=0MdtdV4bDqgXCQEv"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 7222929379186658574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevledvueefvdeivefftdeugeekveethefftdffteelheejkeejjeduffeiudetkeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/FbGeJp=0MdtdV4bDqgXCQEv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Aug 2020 12:15:55 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
> On 8/6/20 9:16 AM, Stephen Kitt wrote:
> > pmbus_do_probe doesn't use the id information provided in its second
> > argument, so this can be removed, which then allows using the
> > single-parameter i2c probe function ("probe_new") for probes which
> > don't use the id information either.
> >=20
> > This avoids scanning the identifier tables during probes.
> >=20
> > Additionally, in cases where the id information (driver_data) isn't
> > used, the corresponding declarations are removed from the id_table,
> > and .name is specified explicitly.
> >  =20
>=20
> The ultimate idea seems to be to remove the "old" i2c probe function
> entirely. This means we'll have to touch the various drivers again
> to make that happen if they are not converted to probe_new.
>=20
> With that in mind, since we are at it, why not use probe_new() in
> every driver and call i2c_match_id() in cases where it is actually
> needed/used ?

Yes, I was planning on doing that in a second phase, but I can do it right
now (perhaps as a patch series) if that would be better.

> Also, I am not convinced that replacements such as
>=20
> -	{ "ipsps1", 0 },
> +	{ .name =3D "ipsps1" },
>=20
> are an improvement. I would suggest to leave that alone for
> consistency (and to make it easier to add more devices to the
> various drivers if that happens in the future).

=46rom reading through all the drivers using id_table, it seems to me that we
could do away with driver_data altogether and move all that to driver-local
structures, in many cases covering more than just an id. By only initialisi=
ng
the elements of the structure that are really needed, I was hoping to (a)
make it more obvious that driver_data isn=E2=80=99t used, and (b) allow rem=
oving it
without touching all the code again.

Regards,

Stephen

--Sig_/FbGeJp=0MdtdV4bDqgXCQEv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8sZDAACgkQgNMC9Yht
g5zUtw//T4ogD7rGy/Ecq0wgWYSJcZ7q0mB+9R6Rs3hJ4/NvVTM6U7Bf+nvNIKwC
TX6RvB1ucbbhxjwZXEzHy/+jOYYBD7/Cy+zDrJkizArvsfAvxcQ15nIBDtEJ/LdT
zkcInTdWOZxbvPPfsvmkEiYVCaDrch8nN7wpbpWhaaDvMUYPKBPLYBM1YHkUcB6k
/9t0kUj9vIQzeFQeqPMbVxD8sZH2wmjF9tL9uYhKqMTHH2jeWkOSOf65+khjxYJB
y5y0sw1O0pRruDGpdjMEq9bw4TQLiElFvjQa3JGoV/VjHnDG3O/4FXb8oJd+Fsso
W+B+rOp1a/i18CAd1Y+pptxx/t8YWPy4xPjX0zcJ7dcgWBdJng+CkyQdOvi1gQ6E
2pX6dP7ve2l1n+WFqVZz5RRyEPEnr1ACK4W+MOZpwOmDxDFNOkRIv0+REF7n1qOx
6XzaNnRt4rzcVQr0y/LdhNu9ZwNoDt9UsceJV6clBes8wrvLHXyTvBXjcIIKrZGW
4BYhZEB7VzYMndG4VJAtga521ph7HV9J2RD3EbL9Ad+RyZ9vkqYUS5JizECEuvvO
ofSBEaesYZgkaRVeF+bEaw42BmYR3bjr1K8hY4ZLqV6UPokV5sjL0mn4FfuWl+bA
oV6cVxwVPirVYd7smYbViflVGmKBFw+nAYH8WFYoMWWAhbJwr/A=
=1Q6B
-----END PGP SIGNATURE-----

--Sig_/FbGeJp=0MdtdV4bDqgXCQEv--
