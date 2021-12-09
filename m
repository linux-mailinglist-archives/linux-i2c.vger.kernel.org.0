Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A3546F4C3
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 21:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhLIUTX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 15:19:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52746 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhLIUTW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 15:19:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3272AB82655
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 20:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FD0C004DD;
        Thu,  9 Dec 2021 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639080946;
        bh=FuC5lY1Nxqn3L5R9SFrcU38uWB+fDJsElPPAuGlGw84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OY8yntYWYVOiB5ZNTywfLEbloTX/kmcP8OMP0Lw5tThdOi20xCYPFQ2Y1VVkHyKxW
         URiq3gM4MoVbd/MjEPeVlDIowKOc2/p+YsPwcAHQgra6eytvsdSenc878Af528w4YZ
         2SfRjwONm9H7Qiuf5/t6WRFh9j/oGzYu2aRxhoq9pI8T9adRjJZLnVO1/K69KXB5Ok
         veLZeTHoZzlWsvJHT/BWdgLqBT5SpwoFQLQ3Zh7g0zbPEM1nIo2irI5+Aj44asE4RJ
         O0qWqq2fI6mvTY03W1i12DWAfaeO8GexcVFGa4HNOsPWzH/96pfA+Eyz1Q9j1/Xfon
         Q43mHw1jYsYEQ==
Date:   Thu, 9 Dec 2021 21:15:43 +0100
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [bisected][regression] Applications that need amdgpu doesn't run
 after waking up from suspend
Message-ID: <YbJj7xyiPs8HBxC8@kunai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1295184560.182511.1639075777725.ref@mail.yahoo.com>
 <1295184560.182511.1639075777725@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S2gOC+f4gRLD7q+n"
Content-Disposition: inline
In-Reply-To: <1295184560.182511.1639075777725@mail.yahoo.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S2gOC+f4gRLD7q+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thank you for the report!

> No issues in Kernel 5.13.13 and the issues exist in 5.14 to 5.15.7 .So
> I bisected the bug with
> git(https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux).first
> bad commit: [5a7b95fb993ec399c8a685552aa6a8fc995c40bd] i2c: core:
> support bus regulator controlling in adapter

Have you tried reverting the commit and see if things work again?

Kind regards,

   Wolfram


--S2gOC+f4gRLD7q+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyY+sACgkQFA3kzBSg
KbZTjA//fKRTKsg2MWfMp3vysUngWfcYn20L2fjatYCY4ki7tD4TAUQ43dE0vM1t
BTOacDB/YkQbbX/SOHLFy+A/icNJv7rczvc+shAhzFw4691fshor6w6/yqwHsdro
gwBLOBT33jx6NrIR3qfQqfCG+XqzICT2FR2Op6+1RhPOYsd9M5yEIKov57aVwHXh
k0bLVd0sIrvcvRquqUx3Zs/lgiWZKxRZQQD1hZkdjS0Nbr+Qxn37SgdLX6crXmvY
Ff8ULmYT5K/yTCmek7sGfidz4bA30J3Y0B4FMw9xenR8h+3ZyZpQ8sy0KZQ1TPuV
MjoMjRxIEJdezMcG1uF1DTcOmfkX/Hvbt9SXV3f4fdOxSVSAjJn9nCHR3ZmZ8mke
ADcU3tRQOxd8YrWLeABDEpXOXcgpKrhikdP9kdiY1aZN63wJLIFP8hd39wKaeQsY
+L3zXlbmsCIJxTKfRJQrzOfjGA2yeM6jgGlNmfepRkxhejomF+MmrRIdhZNGL3t/
/gi5SF7lj/7VvpbHHyMWnPQOMmlyq2CcG5OaQ4M6m7jLjMDZBcJ+RntUi/GRV8hy
LwPJMpQcjw5NnfHrE630C7601m32qvvgWFAleNKHPX516n92DS4RkOKCuT6rp+rs
uYp3QKuAdcFDArH7xx2z08m9E+Jt7jAwkHoFNkOCk46yeAYav1M=
=x7eh
-----END PGP SIGNATURE-----

--S2gOC+f4gRLD7q+n--
