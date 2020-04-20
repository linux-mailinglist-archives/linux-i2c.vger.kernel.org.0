Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670161B05DB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 11:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgDTJnf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 05:43:35 -0400
Received: from sauhun.de ([88.99.104.3]:44126 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTJnf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 05:43:35 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id 4DAE12C1F4C;
        Mon, 20 Apr 2020 11:43:33 +0200 (CEST)
Date:   Mon, 20 Apr 2020 11:43:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200420094319.GA2094@ninjato>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
 <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
 <20200419163600.GA19772@nuc8i5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20200419163600.GA19772@nuc8i5>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> 5. Run `codespell` across drivers and subsystems

I think Colin King is already working on that. I regularly get patches
=66rom him doing that.

> 6. Fix ioremap(..., 0) [size =3D 0] across architectures, now some return=
 NULL,
>    some return address, some may even have leaks

This sounds more useful to me. Would be great if you have interest.


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6dbrAACgkQFA3kzBSg
KbbpAg//a7VBPjU9CxmvXm0e+WF8p/lYWBPqyoFvF1RE4Mf3OcYFDgWL4b3EAB7I
AMWn1nAblXDoj12Gg3uUXN/v2eTk/9T8NcyPOn62t6W/S0S5P6XhEzAeJV4QvQUz
y4P0CZZs9rSzBu414Oya+vRgQhYmJhb7IPVsxQ7IxxYYjpQSWOeCUyUn0dWiM4Qv
QVmZhCCCW4tP0wyEt7gr6XHtQC4GFl8sxJvU2PTlv6b0hqh9Ob2/IriCshpFER4j
881PVWv4nDrEcNoEMR824+zWne3Yfv1z567IcmfB9Yas77nv21BaBrIs+7WjOuf/
oLvD9K+5hULpoY5AjqNKzq2aBzrWwmmvE7VppBi2/rKpdfIEl8LhtAgyJ9ni01eC
v+zZpABywUcdHUOntCAva3/p7p5rFvwCWtWVCpfVCIKl52ey+ofiO0oWCu4ZeAjy
w0ReoPSwwk+pYP7r4xaeUqtm7D4rt0ZqRQfQy/SgEGWNJHbkTjHrl3qmQl2EOHq1
cc/id35NhBSp8vhc2LI9pIFy7+50gjnpsI3eOOQ5Qys9N5D21UL8359OULjuBQ/9
jHPMOBKWwlGrIVd/akJ/sn+UsSgt9yLaxR2AZLpCVaVerdZxwaLyotGa0joKWw+N
oienTq/OtbthD+peXreA/3q27/hSySwFBGMUl6WpD9mx8LCVB1g=
=EcMF
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
