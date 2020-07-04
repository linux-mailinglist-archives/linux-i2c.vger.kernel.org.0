Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D7F21444C
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgGDGR1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:17:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:56832 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgGDGR1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=it7tgk3eC7mBPk1II/6tf4Z7/Dwg
        MoVcTCt/5sMq5Ew=; b=Cxe/CLQCjNknARJkryp36AojnovLUTlwK4MgfZIOhAQg
        4CWuUNbjG2JrILm6E75gg9429n7qz+Y4dq1j5kDHrtI77/dS9oMBkjT/UHEW/X3L
        g/YdRNLADZ+jhkC5xlhtRZZxy4Nl9ntHTMPHqEhUB7P+BVCykZ7aLQArUBNwMm0=
Received: (qmail 1448005 invoked from network); 4 Jul 2020 08:17:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2020 08:17:25 +0200
X-UD-Smtp-Session: l3s3148p1@2XJomJep0KcgAwDPXx1yAKkmpyXOLnhi
Date:   Sat, 4 Jul 2020 08:17:25 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
Message-ID: <20200704061725.GE1041@kunai>
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 08:55:22PM +0200, Wolfram Sang wrote:
> I can't recall why there was none, but we surely want to have it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AHvUACgkQFA3kzBSg
KbYx6BAAh/PiVUODzRD3P6rmh8z1uGUfykSS35OF9XcCX4u2gyHkGB1eIh3wFPvJ
yCh4q4KjMlnplUZ7npk+l3U3SMG9av3/qjPMpEmxsOmojRzw0SQnH7hpQa+oZW0w
zXjyYOZ8AxA8lstLagOlwQEhzSQ3lSU5aBpiqv5qyacHoHF7DgOtocK3aR4S5NBY
9wxYSPbMD2SkMcknEYFUfStD2fzHzlh4zLzVXe/benMYQ+VXTX9JuY/0nA4G85fa
AOy/AWy5nuq+wx1kTUUszYwznnwx+8yEybiY/W1rUUPWBDKZxzK8OSCVe1Cg2xwJ
ULS+2Hp/FAjxN8aK+XIjlF7XP2O3MEjJGhzCobmPbhUl6DZb7FN5ijXhLZ6yt6/K
8lxLhbxfXKtP5hDmUPWLa3wWPQmt40pK0lS+MVEMNcm9xGEwhkETx42wTMyLJP0X
boVvkOpH8zC2EpjTibj3dDVW9fQH8Yh7OINW9CtQfdUYU3XhQFvsPx/zMs/XFK/1
pmE3webaqrh+ROiMfcOax8XUm/PIi39xA4b3EUEDrTcug9GzPQQxWrimEsIMH00d
JLLDioKHJ59R1OmrdMH4TjWuFEmqhEGHHMgqDvXfCHExCad21khKDIvIGP4jStea
wr5KFsSsLBhbQAVHtEIbxk31TlgG1ZXEeBoNiJblOaOPb3NZXzI=
=sBXw
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
