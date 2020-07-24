Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CF722CEE3
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGXTwI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:52:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:59092 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgGXTwI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bNIby+nW8sgH3vCDAzYUuWgOjA6n
        Xrq3osKrKwO71K0=; b=jeX0+76Bb7h3xRtZuCfSqPxKqC9zqlFMoIozyTDgx8wS
        vDmLh3VOUd1nz9bsf+1iT7YsEXaMuw6MqOtwbXybW9ZhfWK+m2p2Yi6/KaeIHNTr
        Put6MVsIuTPAkiS9ZHvRxIsjiflxMhCU9zog/WBCsrhLKdQheySKKn/VFmhOZdw=
Received: (qmail 3786999 invoked from network); 24 Jul 2020 21:52:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2020 21:52:06 +0200
X-UD-Smtp-Session: l3s3148p1@7M7GTjWrKp8gAwDPXwcRAJKYSnl1dekZ
Date:   Fri, 24 Jul 2020 21:52:06 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] i2c: revert "i2c: core: Allow drivers to disable
 i2c-core irq mapping"
Message-ID: <20200724195206.GG1227@ninjato>
References: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
Content-Disposition: inline
In-Reply-To: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0qt3EE9wi45a2ZFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 06:24:40PM +0200, Wolfram Sang wrote:
> This manually reverts commit d1d84bb95364ed604015c2b788caaf3dbca0262f.
> The only user has gone two years ago with commit 589edb56b424 ("ACPI /
> scan: Create platform device for INT33FE ACPI nodes") and no new user
> has showed up. Remove and hope we will never need it again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bO+YACgkQFA3kzBSg
KbZJjA/+JhWi+T1nIol01d96qMqdogmBhi9MwgrnetkXMJ+aCYU/UBsIzCWbxoxn
a+awZ85n+Qds2YS9c/J/NcNWi1X1/8iiNx2Hn0Sq7yh/cHjiy3Z1FJoXnHt7CAWy
KZiiTRA6MR3qCH0CGd3Ems6a0DuuLwNMzhvLJZ2YrZqLyiX/UCTdMt40tuoFlPJF
GHjX/SWp8Fjj3C+Dk6uXlce4qTVpGxWZ3Er3+eLLljhHzeGw18X1C2lXdZPeq4C6
3SZVSoYHbhKnm9f0IKQkK/6LXn2elVZ940eV6Ju5UIPJdG2OAN31aO/wG6E5XGsa
UXVYmdjnDhBw6MqltFO5HYsdeGJN6OAUc1iqze4oLXajWFfADrJ3NqNN06bNrFHp
mPVJ7K8P6iBD1diJv1/130pLRhieOYjh5INACkLpsilj25KS25ulW0LsWdeQARli
9NgDSw/QeBFrcB7crjbFduWINo45v+sLYYuFfFWyqvuRGuPkpY6LgBu6RVuN4RLJ
d/uq6zSxQ4NuRSNn6nXXDOWzxfcXy6i+DG+tEDugpYWH96GpZ3L/WLiVrMd4BDPW
YbGY3d2Kjbx2nyMDqPOUpb3DPD28lOoQj/yXtXRCahXdXlo0ix4vIKFU8x4VBTfA
uhKqFqcT2Bhu/xWEmObXL18ipHtNDjO13Ih0PVZ6fC4PwP81wF4=
=3Wys
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--
