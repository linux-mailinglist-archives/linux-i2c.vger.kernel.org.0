Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8E622B727
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 22:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgGWUHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 16:07:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgGWUHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jul 2020 16:07:07 -0400
Received: from localhost (p5486cde4.dip0.t-ipconnect.de [84.134.205.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7EAA206F4;
        Thu, 23 Jul 2020 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595534827;
        bh=ENoIYBug+g53Ale1DfY97zU4FBYnGOgaNeHqmT6v+8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NsAQI3dRb358P+uJJEhBaBGz9ZTfpjluRTp5g2Hn4XDwLzdSwlXQX3HNTuwaODv+7
         S0a5kiFM1SAF6AAqdQx0dEn+T8SrQmf+zHFXETWN+DCtyl2wGhcjzSliSJW0kWbamj
         p0Vza4Qnk6tnUUVF+EW0Nvo2ivak4wpniRMqjaNU=
Date:   Thu, 23 Jul 2020 22:07:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
Message-ID: <20200723200704.GB908@ninjato>
References: <20200721233814.GA3058@embeddedor>
 <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
 <20200722143713.GB22267@embeddedor>
 <20200722143814.GS1030@ninjato>
 <20200722144848.GC22267@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20200722144848.GC22267@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > If you want to resend, please only one patch for all I2C drivers. The
> > change is "cosmetic" enough to do that IMO.
> >=20
>=20
> The reason why I'm sending separate patches for this is because
> the drivers have different maintainers.

I see. Still, people can ack parts of a patch they are responsible for.
I ack this way every now and then for cleanup patches, too.

That being said. All v2 and newer patches squashed into one and applied
to for-next.


--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8Z7egACgkQFA3kzBSg
KbbBpQ/9FnepYAS89xiZarcBJQAWcb+Qn1NfNqRlKkWSJCBVVOXmFLuzzD5bVXvu
OdvLxblLiJh+N/cxuKZPmyifCfmwWcTwyA4ybSKdKaOxfYb9xO2bpbPkFqGgEaHf
O0/bid7pQ1fkZBtwe3gUuvT5t09keufVbI2bRnWavV03tVVqzS2xCZVSMUx/5ZLA
6xM9yaBX2CXLT6aE3zyjQE6SmftaTW5vkJRm/fGJxZD3FREGM7E/REpDf8Te5Tm/
KUm0sqaj7dtTCscJRXSNd0qeQ0lbUl8yUT2N14q+GKBreU/xw20oKgKoUfqA7DCd
GOV7lv4B/G2QL/PAVCJ5MD/gyXKmYJ0tr8thG2ap+ZacLhnfSldZjHjOfY2NBLBe
2LzDh2kWharLwZDG4A7u5cpMG/83ljvA5WL103hBj9HgE8qQFtc94s+C0braWsWx
ez6D7SGH/PcJ43E5htmvLYofydn3xt6sJp3g/io1P18Z3TtT5+fVDaWZaiNhS8c+
fc1WVlStQ1iaGzTo0zffWHQlGzC2eyugG52pphOEWnLBdImz/q0BPqo0od9ArogE
NVbWNl6lrEGUz+0xVEQILMaKZdSc9NSaGrdqWRqr8oTxBfNN1w5/Pfi/jEH9wUVa
nmjsw4DWsmvyI5kmYvd6kGMkgj9t2+ex9tZJXQL4mSCHJjdmevc=
=1f8G
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
