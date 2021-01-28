Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706783072A7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbhA1JUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:20:42 -0500
Received: from www.zeus03.de ([194.117.254.33]:49470 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232438AbhA1JQd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ff4IZzcys1007zJSCI7xk9NGZI77
        yz9N4KDTLk0jEp8=; b=Rtx+WiicowqjzTln5IaynlmowSJDP7h8anMlnczt5gsH
        mUwdEd3Mb5ps73g3MxPfqqeZjptIxP0ti6/mKZaX6B5dBv/qMI6HqytqT1aA/gUE
        s3zwFyg2FLohJUYkBkoRpL/Q4VMaAx7aIp8tw55L4iBXTbcQN0r/F4K+vDj+N8E=
Received: (qmail 166726 invoked from network); 28 Jan 2021 10:15:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2021 10:15:49 +0100
X-UD-Smtp-Session: l3s3148p1@CIxbVfK5epQgAwDPXyX1AEdA8SGgn5QT
Date:   Thu, 28 Jan 2021 10:15:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: smbus: improve naming in
 i2c_smbus_xfer_emulated()
Message-ID: <20210128091548.GI963@ninjato>
References: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
 <20210112151230.46518-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N8NGGaQn1mzfvaPg"
Content-Disposition: inline
In-Reply-To: <20210112151230.46518-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N8NGGaQn1mzfvaPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 04:12:30PM +0100, Wolfram Sang wrote:
> This may be just taste, but I think 'nmsgs' is way more readable than a
> generic 'num' variable. Also, fix spaces around operators while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--N8NGGaQn1mzfvaPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgMQACgkQFA3kzBSg
KbaXYhAAhLB5Rf09IOFYo/D1DyvWw2clnxm9dI9rH/ihV/u8DQpr2yp8GRo3OPaj
tXgHaFzkLlJ5+GA8NmOVSbx535AhdHjpOoxhYxZTCuu/6/Pgh1lhZiXqWthbQORR
6yA/4x1IJJ7dilyjwusU1BNnmLW4IyLo8777U28+P2Q37faAn6QRVln+LXId1aqw
+0YAtPBuTmZ+QOhxFTWtzwLnq+hdlfy/kkLAYsLk/2iMyuuPVA6JTZnsYGIqb2wL
5HwA0aOSjn6jJCnvwmoqZaokeXAtOLQbN1KpEKpbyifmVWghKfKyMDuIFsluRCaY
TaWqFHdOu8ll7uifODi2NQ5sfR79AV2ikyM84H7d6JXyBIodqYvSgTIT+zOnpjuy
P1RcbYiz96EO3GJm1ZETD6rMk26KHqaPWG4p4JDzRYS3hLz0yjUzA0Rqox2Nvi66
dTIBbVtpZHp1qIaG5Vnps3qRqbFyXfiCCr6AD8kf6dvApk3hWkK2m6nXiCtBbie5
NZbhLtaBZQ4tFflOOHCacg75RCPMBY++p1HhJhVMDaU20Ebjy7fY4Ib4GmU9Kp9N
malBVgGu+TYsWtwRb3Pugs9CsnxN6rKx4M2V76xr6WXJLqcWBU1xpRhQTZDfk2H0
1GSht2oN7MSOwKFK+kFOEUTtwjfwo7XKeNFiZ/qD+XsQeGqJeUM=
=XU4v
-----END PGP SIGNATURE-----

--N8NGGaQn1mzfvaPg--
