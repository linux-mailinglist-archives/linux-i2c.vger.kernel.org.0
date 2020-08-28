Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3C12554C3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 09:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgH1HCz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 03:02:55 -0400
Received: from sauhun.de ([88.99.104.3]:51416 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgH1HCz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 03:02:55 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        by pokefinder.org (Postfix) with ESMTPSA id D68702C0885;
        Fri, 28 Aug 2020 09:02:53 +0200 (CEST)
Date:   Fri, 28 Aug 2020 09:02:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     ext-jaakko.laine@vaisala.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] i2c: xiic: Improve struct memory alignment
Message-ID: <20200828070250.GB1343@ninjato>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
 <20200827144848.12107-3-ext-jaakko.laine@vaisala.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <20200827144848.12107-3-ext-jaakko.laine@vaisala.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 05:48:47PM +0300, ext-jaakko.laine@vaisala.com wrot=
e:
> From: Jaakko Laine <ext-jaakko.laine@vaisala.com>
>=20
> xiic_i2c struct alignment causes the struct to
> take more space in memory than strictly required.
> Move state -member to end of struct to get less
> padding.
>=20
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> Suggested-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IrBoACgkQFA3kzBSg
KbbgAg/+I9ebJv+mqU7kJD1zHL2z5yg9H9gPDOYcqPxrI5GjNUfvgJWLKotcrQ4d
pEvQpuimMN09WIhDwPxDzJRbqpOAjZpiAENEsTsuxq5cLI3VcLH1DozYk7uFRfW/
fRxKHcoJqwZGYxQGUeGnYzy1i8kEe14uTBHUA6IWRN0LTadRN31AFawrsZO5PfuE
pAARR6DsnmuY6nMoOMtUGhGIAPB7uQ9Krc7/Py87rkLHXuznAhsUe/AErfmUUb/p
Wrq4PBVuu8Pkcl2awghb3crAPWT3EpQCjZV89KocDBUv4nTKdE0otDHAsUebjFla
qXfV/+5fjXUgzkiEwPWNtn76zKnQXtA9xifchvf6ie9wadgttujlQSg5vUvJf9Fz
L8P3nk67ksJPoUtJgvIiPAZVyyQeKZ1Zr1GefY8xgbUKk+btvvCqrZAh6TIvFLEh
kpp3tJgC9csuyPE2a1WooJIW3kLHpX1n/oZoN2OMJ9GQtQuKeD0kDSa8BxrG/rAE
Vnl9VO7FbyLeUzSX4eQFH7KGb9sT0zF6q8LEAeFkM7zHkE2SQ8krz5VZK4IFFioB
fLURRgHLOis3B29RIGpoQYq8wikC6Q0h44l6T2PHDA8LBjHH3KJIkADW8vodkob9
a3n7j5ZceOJMpZRamlxlErq+yhph9Eh5kwB0p/ww5fzr078Vblc=
=1150
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
