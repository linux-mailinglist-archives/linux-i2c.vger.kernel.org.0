Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF0524071D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 16:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgHJOBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 10:01:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgHJOBp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 10:01:45 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05930207CD;
        Mon, 10 Aug 2020 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597068104;
        bh=WCDaCy20DVEAybtQj2JAipVIVLVeA+07NPBI/qUjUgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCsWRc2A5LjW0oRcULhT1PZ4XJw6hwAXAKjDaJSlgB8IrtLO1Q0Ar1TtuINrybn/E
         rjd2Xay6KM2mgu0KtB/POyWOUWT0SXzwiZvVa/IMRQy1hxuPwdmerig41Lun8Dbpu6
         HspKw/k5dGapFv+7awzEguoNDTu9JpGBpCMWttz4=
Date:   Mon, 10 Aug 2020 16:01:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] i2c: eg20t: use generic power management
Message-ID: <20200810140142.GB3923@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
 <20200805193616.384313-3-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 01:06:16AM +0530, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
>=20
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions, as through
> the generic framework PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
>=20
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied to for-next, thanks!


--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xU0YACgkQFA3kzBSg
KbYAdA/+J9rwtS0UF/2vN+uVvGd+HnTm8hJ5KEylc++CpWBrk/Jlme0JgKxB3Kzu
R5jKfSY9LIMHOwvjmoSfQb0vG78PeiV67/ro3lmxj264Vr2v+alnkiLLH6pyJLg7
5h07jNAHYi5zjr6ojn8SKDkyQRB2OENewTL0zSkozIkxaK3oOO6SFiRil9g143w7
JUwoW3SgzoFTlfU3MuywLO5YGVDerGBPR5BJcDVOotuvpLdbFuCaeTK8hAc3N9PP
u0JpclUO9WiApOcpfhia0wxudXOXeEM5meftdYxNIrJ6fbN8/ftWtB0pblKGLu/V
w36n0bezcfE+1pAhWsm4/XIKjuH+S7wQUq4kT9u33gEjYSD7bI95mLHGAfYuIVf5
Z0PFKmebLIil5GblIYeEWH+PnZPgGvd79FiRotZU4NvecRjW17wj4n4xC4bjLcTB
eITKZWdTrtphPCmiSVdV0r1CNyEXz5eRaDvabz8cQwYlN6yjRwL+oCHV9bAwV26s
IrvUkihTeOQN4EV4HAfAQLbqj0pvUgsfg9ZojwEwB3P+XKUyESTiPjvOCIZ4M9Dp
wnzqba7Y4c6Z0qb7VWQxNHi3beTbdUwCk2JB7aELlEYdoJGCia4sgmc6v6+2+Eob
LKgGLsOBpcZ1Q8n37RZ+E96vYoCAu3jcniMfFm8WgkgW2MDcLsM=
=wlnp
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
