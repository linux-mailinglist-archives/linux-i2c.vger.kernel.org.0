Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7100F305827
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Jan 2021 11:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbhA0KUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Jan 2021 05:20:05 -0500
Received: from www.zeus03.de ([194.117.254.33]:60240 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235711AbhA0KS5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Jan 2021 05:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PPiP/ibzC5qvpAjqZLJI3QP1DFP9
        9sVIpItAR82zC04=; b=x9Sm89cskKvp0s3bJMCTBvIsFwiP0cv+D2lBJLcym/n9
        Q8/EJYH+pozrJM8bsrdVesN89p+KeIPu9xhLEYcOJ+cBoUNOvNqAKYpQUxWH0b5P
        R9uzzox1E+AndLeXIOmAquP8preQqMRgjB76rfF71YFZ/93Wv1HvpK65a6nNyk4=
Received: (qmail 4019814 invoked from network); 27 Jan 2021 11:18:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2021 11:18:14 +0100
X-UD-Smtp-Session: l3s3148p1@d7PBFt+5bL0gAwDPXyX1AEdA8SGgn5QT
Date:   Wed, 27 Jan 2021 11:18:14 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: adv7511: remove open coded version of
 SMBus block read
Message-ID: <20210127101814.GB928@ninjato>
References: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
 <20210119093912.1838-3-wsa+renesas@sang-engineering.com>
 <1b3f4451-20e5-4f73-acab-d0deaa7ba63d@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline
In-Reply-To: <1b3f4451-20e5-4f73-acab-d0deaa7ba63d@xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

> > -		adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
> > +		err =3D adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
> >  		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segme=
nt * 256]);
>=20
> Only call adv7511_dbg_dump_edid if err >=3D 0.

Yes.

>=20
> >  		if (segment =3D=3D 0) {
>=20
> Change condition to: err >=3D 0 && segment =3D=3D 0

Yes.

>=20
> >  			state->edid.blocks =3D state->edid.data[0x7e] + 1;
> >  			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state-=
>edid.blocks);
> >  		}

So I guarded the above block with an 'if (!err)' clause.
adv7511_edid_rd() returns either 0 or errno, so we can take the above
simpler condition.



> > -		if (!edid_verify_crc(sd, segment) ||
> > -		    !edid_verify_header(sd, segment)) {
> > +		if (err < 0 || !edid_verify_crc(sd, segment) || !edid_verify_header(=
sd, segment)) {
> >  			/* edid crc error, force reread of edid segment */
>=20
> Hmm, this comment is a bit out of date. Change to:
>=20
> 			/*
> 			 * Couldn't read EDID or EDID has invalid content.
> 			 * Force reread of EDID segment.
> 			 */

I updated the comment but kept it a oneliner.

>=20
> >  			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
>=20
> Only show this message if err >=3D 0. For err < 0 the adv7511_edid_rd() a=
lready
> logs an error.

Yes. I used 'if (!err)' again here.

Will resend in a minute, thanks for the review!

All the best,

   Wolfram


--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmARPeUACgkQFA3kzBSg
KbaU5RAAoHPCy8g/Hy0fafsjns1bhNX+atshAy42bkGoW8bcd55VZisvgAdk1fg3
WKpPWVRDKxVJ9vTSEjB0TpYPQGm01kvi0l8britPcsRNkJ8VQ9uQGHqM6Jd9JY8P
hMtJccF7RJDqKVXPRlGPH9k0BBr1jRhfa74pvCI9I3W4+TAqyPat/WbuLuhxHLGn
xbFZjUSaJBwP/oyznL04HQ9aDV5YIOABzLmQHjLFraofn0HEtL3MpFZtuvs3nHuF
D/rVjgs/6y//b4KUmaJweD3tbuVyUCruOwYLjljdJK1Se79FHukCHOcowNpbOnb+
ow2Er7S+U05gjWiJOcMYjUJulryLGg23QLn7HfdvM6BJuuYi0qxQiU0O/cEtH1IB
liKeGaWcDWWrmWcBinUx3Ldiyxh7wHSCL+22FyjNM8xxqTw5fslc+5CJR5lPMFHB
WNOppwqO6cKnyql+lkaUijoWept+jDcOLjyKzVWxBaRpIH2z03P8EKt+a/DF2ysa
cVOjaSfq5I/23pyeByh8yKud3N9tqS/go6j/79eQrhul3CNy7Urk3GraaAOcJUwL
rodqyQ+upIVh1fNwzzwj/TwMZUPrxzD2Z+BodnSZ8DiNt0YImZtWuGys0XghWcIQ
AzdL8U/W+0EIvpifOVNokVq3UpisBkVo2VA6ZpTeXl2f+XgIju0=
=1s9r
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
