Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E9522DF04
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgGZMcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 08:32:39 -0400
Received: from www.zeus03.de ([194.117.254.33]:39224 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgGZMcj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 08:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rV48EOw/XHZgIh8Rf3XOuwwLGTBQ
        mqpNtP9V3+sf2NI=; b=pjhGarbzjhZa3JegYtTIOJKnPx9pwW/Nebyp+uktSTIQ
        +ELjdIfUVut7laF/PogFtng4AxQn9UgTFSVmWH50nlunzre/QSWQ9zbQi7CBjlhU
        QoN5sBh0dPp3yWi4YCJd9mg5gQ56ALVVnOB6ucC34OxY5MSEW2+K7+lvE4d+spA=
Received: (qmail 39817 invoked from network); 26 Jul 2020 14:32:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2020 14:32:37 +0200
X-UD-Smtp-Session: l3s3148p1@Drq+Zler5I8gAwDPXy27AOM4pzPBFrIA
Date:   Sun, 26 Jul 2020 14:32:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: slave: only send STOP event when we have been
 addressed
Message-ID: <20200726123237.GB2484@ninjato>
References: <20200629153807.15744-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <20200629153807.15744-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 05:38:07PM +0200, Wolfram Sang wrote:
> When the SSR interrupt is activated, it will detect every STOP condition
> on the bus, not only the ones after we have been addressed. So, enable
> this interrupt only after we have been addressed, and disable it
> otherwise.
>=20
> Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8dd+UACgkQFA3kzBSg
KbaAjg/+LF0OnVmmVoGioK9iz+OqH75HU7g9ZMKAyk+7jYr6rO6zdAkzPnNPbSRV
ngV++KELB2eEH5jKPb604v9oYhSkcZkJhofkpubZ5WOaD5EAS0++Gl4mMh6rF39c
BwQIXJUNmaXFbAFSX/NPQUAyelwWZnFemYsCY4xftq3gjSoj8d22RsKqLZdZAWVq
VNZ5bgrdnx0blftHp65O4HrwzS2xuFUzVGLfBE3BPH+grkFIc/i6OHl18B5T/4A3
YPvs7qxhZOOolSAOz72HBMvc0Y9XRhD4DugQi+yLih2j0wu7Od5iSqxu6Oz2GJgT
Q2b2OKjZsbR6aPhTnMPs6+6QQxOe9TRfhvAiNI1WsywUpHa3f90gsiQWZLdXJfGA
h55O/zkaZinzz657YaTKG8t1B+MtyweLiHuUQcFEa/xH9rX++U957hvdxwyfC8Zu
JR7/t9DbgMa9VTw0jb+z4g99AfzgURdPR8zDt/PAgtQLnPLCv8azS8wztxYnc9KW
tvj3bi4yqtizC5bj771jX4k4SzaOdLyDq7QZQmn0W6LMSWsq6cpVzbHVAqqI6Gxy
HuJ+824NnQo74bLngYHTYANN5jkQlo2WeTYJQ+GvSYmzTnGGwsVEFMpfR1neS9oN
6HQ4TYSOGJhMGIRxHrfqjWFrLOJaJCd02RZuubahAiq8odTWv78=
=2uPx
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
