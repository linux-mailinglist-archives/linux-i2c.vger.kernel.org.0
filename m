Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27865459E9E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 09:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhKWI4h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 03:56:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:52738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231180AbhKWI4Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 03:56:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7422760231;
        Tue, 23 Nov 2021 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637657598;
        bh=DzcMqbBiB5HTVk6xDoobtMz1OiIR8VRKJKmEiMEeEAU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=F9Cok9x34uEr0GDnsGeC2OQvWfwCKAgvSS9C+IUdcJU6KSZNiBGqFzQg4x7cRZu7J
         Z5o5UV695z/ibCQ0oI1tEqwwhWK5ELBeMjHaoV6X75vedHgCoYPJ5kkdByBHKQzpl7
         fGFs2Mg7FGXhKwxkkwNULoSqLHCYdUrQ5y4xUagsi54A+vRHWCSYcXhEa4CMlwgBj4
         qfsyeFoUIAaRX2fMVV4M1g1w2+2+hafPYYtXCHyY/WWUgFBDnRR1MptCRLBW6To3xJ
         IcpVF4pl8AR4cOyXM9DljJwadGLzpAQ+ydPY8K1huavvOKZ+tajd1MTWZrrsfYWIo2
         02Wlq4hWuuuAg==
Date:   Tue, 23 Nov 2021 09:53:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QM
 compatible matching
Message-ID: <YZyr+pXtjVPwSJyL@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-2-git-send-email-abel.vesa@nxp.com>
 <YZyrxvzRUk3jPMnn@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ai2j28B/WYaqQFoB"
Content-Disposition: inline
In-Reply-To: <YZyrxvzRUk3jPMnn@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ai2j28B/WYaqQFoB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 09:52:22AM +0100, Wolfram Sang wrote:
> On Wed, Nov 10, 2021 at 07:46:44PM +0200, Abel Vesa wrote:
> > The i.MX 8QM DTS files use two compatibles, so update the binding to fix
> > dtbs_check warnings like:
> >=20
> >   arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml: i2c@5a800000:
> >     compatible: ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
> >=20
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
>=20
> Applied to for-next, thanks!

Sorry, I meant:

Applied to for-current, thanks!



--ai2j28B/WYaqQFoB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcq/oACgkQFA3kzBSg
KbaAshAApPthEVHYUaFUOKk69OzgO5mHmqXphIQWp44fhw39SRRl8B980bcT/HTi
E4FmUcnAU2kC5CoCVrY2ylkddNxgjjXAuoYQM+Adm9/mnizJOD2ovySuBnMlNdcQ
7aVMz3kfjjjjupqbRlHuFSGgy90RBFpnZog/cpTdBpHhMqho13M9YOTVxOqKu/gm
1h0BQ+VaMSmmpWEcrvByGUkcry7OQEyXYhOt67Z11QRDgcGHocc4T3QxzM7UeR0t
+B7ybtAqRMDI2HsGOe3zLvO2FYnOIY3KO5tX/I7QVYu2qx90xzlqjj+s4zrWWqs8
uBo84hQXKU9uncwkbolx2dgcjE/aJqMi2MRRIjelpQAeZ2wHTFgYMvp803dtu7V+
u7Zk9KIHvCSuQmshdiXlw5SMbts4dHI+nBkOmLt5OKudzj303sbc+WIS2I7u4Psk
dH77wN9VgGMuAoAGZeueb1BAgB3Uo3BUTYR2BGNQSv7y4N/sedS41KcoOE+73Pvc
7oqcq0dte+JGeXoVpONxl0z8GmPeQhInb6q3+mdf7Yx3P5e46yFUHITa1mM8I4cJ
PZamtfkfOUA1moZn2ynMyt6CUCxS/FLOIPr2ou3Puyb4AP0UoIGiqAzQJA+rhRCz
CHAHUq2Wfz3ZGVR3u1T5Gbe4Ne6Xq4eEGVHHym/5Ret9SCY8vPo=
=7NgS
-----END PGP SIGNATURE-----

--ai2j28B/WYaqQFoB--
