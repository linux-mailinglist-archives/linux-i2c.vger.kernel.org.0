Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574A33BABD1
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 09:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhGDHk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 03:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGDHk2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 4 Jul 2021 03:40:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33C656135B;
        Sun,  4 Jul 2021 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625384274;
        bh=5CWov0RNs0GzqdK/AQGxWy0Mr9DqYAwAYpHz/WEd4BQ=;
        h=Date:From:To:Subject:From;
        b=OQN491ngeCMSjwUA5pJZTWHlK6cCtt02DvfMvNlOS897xi/CKFSIsFojLy4rVbs66
         bW5E3/5We+e9XU0KbidkQ/vf9KL39r3MBXfvV5qB4eaRhTGj1aApBCLAg3nvg9EEO1
         /VpkmCXykZCs5WTW5XANFxHkdyWoiOiAapveGwRNA+ue+Fksj6pDZBukTJzxl5xMi8
         b93pP8E7a1pQ94+9WWJFfH/sBYwy3N2uJRt5W0S25xIb7XFjE6LXF16QkxpMnH4s1s
         FuHc8Ppc8JZgO1sq0e9RccW6NeGsSV29ZFkRAMFl68LQp3by2vwsCp+ACTO8dOOBjp
         MtxOJRTkVVMWQ==
Date:   Sun, 4 Jul 2021 09:37:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Unavailable for two weeks
Message-ID: <YOFlTrOWahNB2+oE@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PosLEWaIDWZ/TGzW"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PosLEWaIDWZ/TGzW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

=46rom tomorrow on, I will not have internet for the next two weeks. So,
if there are urgent I2C things to fix which cannot wait, please upstream
it directly. Greg, would you be there to pick them up?

Happy hacking,

   Wolfram


--PosLEWaIDWZ/TGzW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDhZU4ACgkQFA3kzBSg
KbaNXg/7BItkjZ0JbFHJqyf7sVFEGLemKZB6Y9iySkzkf9ppe+fJ6MlSvIHA9/Xx
TlGvhWckLNGzcmsh6TH11Uiim0e0rj3AftpH/OVRgMOihxcKcMz4zjxerHTasKMb
/q79/4BscZk4rhTnFZN4wLZUaqs5epjX6HwQ5rqcqms3rOr0NXJCHbV6xtHoPCXk
lgCka1AZYBTMcg/rHU5/2PMYYJ0+saW8dgSyAAyAfWLI6Z4Yqfu2Lzs0I8k52y3b
ZAmLzBIFn/0H53W/ifNLJCiquEBdES06IjJ6sBBYpAzF6fLOv3SVxJoRfDA3YkMj
Kl/uhzJ80XxXJSdggride2njOG3YjYH2HjMuAtUut6N96CorvUn17n1BRv0l2sMv
WYG5j9wDM2vFxpX1oP4H9+bIVQeTY9+xk7oZJQBbMJb5/DiodAQFvWKNHc3h030W
i1tpQfnCNzjDhxl04GSF4p8Tsls0b4Afiya2JJGrVTaT5XGf9mhNR/fiTRYQHR4E
cNPDwLrYhkQwt7S2JS3ox2W6qdOB8IbNo8tTZSQtuDAriBQNoqFO65BSNGOpj59R
VY7b9/XEUUGyQwmEm4/fN3CHahcL8zU4bSRDAehCUY1nHauclAOL3VO8AQBQ+aEG
ohtX3OMhbbF4NOfcYedwPMJZ3Rrw/dABYncpFenMonE0s93dc+c=
=PepA
-----END PGP SIGNATURE-----

--PosLEWaIDWZ/TGzW--
