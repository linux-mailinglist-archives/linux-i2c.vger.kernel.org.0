Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4506C23F12A
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 18:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHGQXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 12:23:36 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:54179 "EHLO
        6.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbgHGQX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 12:23:28 -0400
X-Greylist: delayed 2719 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 12:23:26 EDT
Received: from player779.ha.ovh.net (unknown [10.110.103.211])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 839B7174A57
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 18:23:19 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player779.ha.ovh.net (Postfix) with ESMTPSA id 947061510A712;
        Fri,  7 Aug 2020 16:23:13 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R006055f1bad-f0c4-4727-ae3b-7a63240df21a,
                    B1FDDFD4E508142116FDFB9194C63E8FBE397CFD) smtp.auth=steve@sk2.org
Date:   Fri, 7 Aug 2020 18:23:06 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200807182306.032376e5@heffalump.sk2.org>
In-Reply-To: <caf1963d-860f-1b46-49e5-ad3acc8d7877@roeck-us.net>
References: <20200807074526.14334-1-steve@sk2.org>
        <caf1963d-860f-1b46-49e5-ad3acc8d7877@roeck-us.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/bOUMBB6UC/Ekh34A4LpQ756"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 9220838763908451598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepveelvdeufedvieevffdtueegkeevteehffdtffetleehjeekjeejudffieduteeknecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/bOUMBB6UC/Ekh34A4LpQ756
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2020 08:23:29 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
> On 8/7/20 12:45 AM, Stephen Kitt wrote:
> > pmbus_do_probe doesn't use the id information provided in its second
> > argument, so this can be removed, which then allows using the
> > single-parameter i2c probe function ("probe_new") for probes.
> >=20
> > This avoids scanning the identifier tables during probes.
> >=20
> > Drivers which didn't use the id are converted as-is; drivers which did
> > are modified as follows:
> >=20
> > * if the information in i2c_client is sufficient, that's used instead
> >   (client->name);
> > * configured v. probed comparisons are performed by comparing the
> >   configured name to the detected name, instead of the ids; this
> >   involves strcmp but is still cheaper than comparing all the device
> >   names when scanning the tables;
> > * anything else is handled by calling i2c_match_id() with the same
> >   level of error-handling (if any) as before.
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org> =20
>=20
> Please also update the documentation.
>=20
> Documentation/hwmon/pmbus-core.rst:  int pmbus_do_probe(struct i2c_client
> *client, const struct i2c_device_id *id, Documentation/hwmon/pmbus.rst:
> return pmbus_do_probe(client, id, &ds1200_info);

Aargh, I usually *start* from the documentation, but I didn=E2=80=99t think=
 to check
in this case.

> Also, please fix the checkpatch issue reported by Wolfram.

Will do, v3 on its way.

Thanks for the reviews!

Regards,

Stephen

--Sig_/bOUMBB6UC/Ekh34A4LpQ756
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8tf+oACgkQgNMC9Yht
g5xYKQ/+Jfm5rek1kCBwaXNseELt3KJsdhqQZTFwAS6yIwlikt+fdTma1O8/67uU
epQtf5/PU6wt3Uu+W1u/ttGW8EPNB7zvJQqLrl4borySSbjgjTUOl/9fQ1MNyj8C
YDjTa3RUqr9+QGo2Am2A5j2AzSDq2SqtiqyZWCJX95ROr8i8DEoJTu9hBx8yPO5O
I3u0Kn6UPT9+wy9dGcAYsgggZco3KFkYNGNUL6dVJMzn8gCAJmz2cEdh3sHTFm32
MMXBRdp9zRYGYBZxqbykQGdUlCQEX9GlX2p4HgRSMTqTadEFQu2V008uyy7wOuWE
kF8ukuR5dzMVX2PlUdQCitgJ4AcrrzSmA2hem0mZvZvTdhLPDM79PHoTqlQzG4xw
AZ78MRr88C0NBsSjGemEvcproNl5eospqIMizXoEzL5s3Pu0rlXbu1lb2T0SfhIc
qEQD79cBltKP43fzCAzYKW3fKxcPAPYyKgcVEXeUUekEJ6QqgOYuBM9x7Sj4AS6D
wgmn0SL5pjPutDO6VqOZEMPpNtxjFtUUtBjwvJTHlV5r6n+0VRjVfY6Q6fQprU0q
QJYsYcU+aYjrh+x56/7PG0nFTrD23kaW/Z975f1BanKp31s8ZN5ClCT1+ZJQkTSZ
/OMfu+/qQCOadXrNTxscuWnvpd0R6OYvupIbr3gafjDxIoj4xjc=
=kmhA
-----END PGP SIGNATURE-----

--Sig_/bOUMBB6UC/Ekh34A4LpQ756--
