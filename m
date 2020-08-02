Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE23239C39
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 23:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgHBVib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 17:38:31 -0400
Received: from www.zeus03.de ([194.117.254.33]:58040 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbgHBVia (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Aug 2020 17:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=H5jUuppRkl1tEjzWf/uhB04yDBLC
        zti8FSVrOAoBxA8=; b=QTb+obTTrLJjWsPz7chInWSxrubroqT5oP7U31njEJPX
        RqJEDBM26EEdBc1LjK0TMNzsqZYtOo93vtmJXHFuOgtWJpCadoiY3INicIakTWwz
        RnTfuWhV8Yhxy1pOYoLv5Q+cbTa0TvtccqjUWL01YQCxAUxlveAwkFfYtBoBWDI=
Received: (qmail 2191119 invoked from network); 2 Aug 2020 23:38:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Aug 2020 23:38:28 +0200
X-UD-Smtp-Session: l3s3148p1@ZM+61+urVJVQT+F6
Date:   Sun, 2 Aug 2020 23:38:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
Message-ID: <20200802213828.GB13339@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Stodden <daniel.stodden@gmail.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
 <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

> > +		__u16 len =3D recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
>=20
> This is post-ioctl()? (Sorry, still not familiar enough with i2c-tools.)

Yes, read buffers are only printed after the ioctl. And 'print_msgs' is
probably the most complex function within this tool :/

> It isn=E2=80=99t wrong, but shouldn=E2=80=99t be necessary.
> Unless the adapter driver you=E2=80=99re using went astray. Not ruling th=
at out.

I have just checked existing I2C_M_RECV_LEN handling. Quite some drivers
do it wrong. And there is no consistency in what they return. Lots of
things to fix there...

Thanks for the quick comments,

   Wolfram


--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8nMlAACgkQFA3kzBSg
KbaMKA//a45kGWTlX++MSJmaThwb1GsNHd0asZpJjTyv/opbA0g8rGB1JXp/ug6b
NDBiYUQJUKYV6tOr2/WFs8Xk/fG//nlWWsmh8VeTemVULzfVTdTOwxjFKHQenv6D
NVlSX0nJ2QZaKp9uSVsECKKUKW8ljekiqFbutQP7GaoApv5aPBnIfx69PyprScTv
QWNGOBufp4gkU2o6H7MkCzwa5Xz7Ea5vkTDqBhXjV3ZNbcE0+Ml+vexYzZG3KOVr
xJgYiyTtfyfyMgc6tjR72Q++hcKteNLevSSlZGFqrhoNmbCrmj7Qyg8L5HJ7Mvm4
KixgwpiSNRmyZBVGvgkxxPmZuVTCHrRNut8q7ViusFZw6WNgNlhKbbrMjmZARQHA
fQieORuj23KGNBm6VIgGG1PkbFnPrfRoX4fFHfxMG7VmGEmF7I/YK2jz8Z0YtPHe
z3Mqk+5yXuhQn1zNVTrRXm81AVFgSb+KiCMbs7JpCCDU/EvK+apGgz8Z7JBGvmcv
zzlFUYV4mB4lvPLfV/GhttDOHLK+hC96pyud2SDdP+m0qznS6T6TZsXyW6VYqQc+
So6B5vsjf9ZI8Acoeozjf2+0q2qR5LFnOqkJae+bpT63h/ifQTFf+sDVl8iA7Ite
1j038GGwJ4WKo/EfBrJCxyHpFFneBrDRacGD7BepDEsehupt2Aw=
=OXwG
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
