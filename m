Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7AE393E50
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhE1ICw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:02:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235665AbhE1ICc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:02:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BE8F613AC;
        Fri, 28 May 2021 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622188817;
        bh=2QLfINpPaMrmx47UIMP8ocbL6I/Btkrp3YTv2iLJbz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ecJI5zkG7oPN3wsHi+qeqoSgFp7FDFAAfHPEcRFJGN5ZxGvVhnmZEld8o4jvJ8fkZ
         IXhg04nl/ik7Ct4xHBsbGaHyPGAR4BLI7bH+43OApJv9PF8nVBENyhPwKC6biVwXAz
         vhfbRYHjRw7etOpbRgPeOzMhWlCuyZ+ybmcqutRfEI27YJzqFOwYi2ePVRLUTfNS7L
         5g6fVxpYOGYNff3roBg5m5VG2XRlpCCERuiMvsMMVuEC8RKNtKB2nmLgEmmNEbLvT/
         jP2p/onSaU+hqC+KQO2T5jH5YhtkPMO2SExtmrzWK/P7fvkkthidkO/x5YHFqmiZA+
         eNywW+iNjJp/g==
Date:   Fri, 28 May 2021 10:00:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue
 pertaining to 'timeout'
Message-ID: <YLCjDHmAG0FcePyJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-2-lee.jones@linaro.org>
 <YK/yyypWeOnBNc4K@kunai>
 <20210528075806.GM543307@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0+YYiPaeSV+yAhVM"
Content-Disposition: inline
In-Reply-To: <20210528075806.GM543307@dell>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0+YYiPaeSV+yAhVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Applied to for-current, thanks!
>=20
> Thanks for these buddy.

You're welcome. The rest will also land in 5.13, but I want to give the
driver maintainers one week more time.


--0+YYiPaeSV+yAhVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwowwACgkQFA3kzBSg
KbaLuBAAnMVOJmD7QuK+C+ERMzimWNk4Rp+tItMwvwImUGZ2i/QIdFp4Vip8yIYd
Ms2bi/k6oJ/Fjmo9KS4NdRh4SmzWKrfN3XiNpBsZbvyA2yecxUVez5JgNsbre+oC
L94f1DjQjVJZHRNN+Xw+xIloe/L6mqOOCwySCBtOUX/Xf9asP5aFFhW4fNOOa54N
WLXGdslvbylvyKzgjNF/lKhHs9N8WLt8uQ3Zp37dONIra+Y8i3n2ouHcyycJZki5
rNi5kDVbGsTKR02Yp0yMMEhn3BTW7aB1w1uGBpmsKMCnnnNdqUNK8mpTASsRy17k
kkD7GW5D0oTA/NtorpsPcnFzUY5eXerMgYNmiAj0v/0qITLveNvOGhQDMTGmbSDV
ofMGRq57rDwVs1a92Sc9dmUGvLXIm39AcH/Fb6B5HdI7Ck8tBRwGl1Y5Vn2I+tom
aOPyxoEHmaY7kkum57osPvLLWp7SLwBZwsHFsXsqlVj7845XjbksQbvM9TQQ7APE
K/W/ijEekcREm5S6EnuMD8OOhII37uC1Q5/fhKfzVUTJNH3UiYhjMFIYcLxahhRn
dhjBOTUz/X+inWt3wTR+NX1vUDB0CE2T6SEw+yRwDiFtK5ZXl94/pPbSFWSzDs+w
/yzu019vGsW9g1XXGu+cphk/4PT4nM1MIlfFEwkAjSVYr8GQIjI=
=Q2Ke
-----END PGP SIGNATURE-----

--0+YYiPaeSV+yAhVM--
