Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1168B31BBA
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 14:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfFAMoH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 08:44:07 -0400
Received: from sauhun.de ([88.99.104.3]:49718 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfFAMoG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 1 Jun 2019 08:44:06 -0400
Received: from localhost (unknown [91.64.182.124])
        by pokefinder.org (Postfix) with ESMTPSA id 69D762C54BC;
        Sat,  1 Jun 2019 14:44:05 +0200 (CEST)
Date:   Sat, 1 Jun 2019 14:44:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-i2c@vger.kernel.org, michaelsh@mellanox.com
Subject: Re: [PATCH v1 i2c-next] i2c: mlxcpld: prevent devices from being
 unbounded from driver via sysfs
Message-ID: <20190601124404.GA11008@kunai>
References: <20190529141636.6043-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20190529141636.6043-1-vadimp@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 'i2c_mlxcpld' is a platform drivers and it registered via
> platform_driver_probe() and can be bound to devices only once, upon
> registration.

?? No, it isn't. If it was, the driver core would have prevented these
attributes (post 2009 kernels at least).


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzycxAACgkQFA3kzBSg
Kbal+A//YuEmK108rMiR1JxDxv1zhRwO/HnTAg348wa/UOACg4wEQblHRDj7Tlxa
fELy7hPb+IYI3R+so4b2bqmQDIUTFHf8W48TcNlROLXGeaq5obBBBhSND1v7w/64
ZD/8reOmtUieiNFP161PshnN/nGwwiZ06ipundDiLNgeOvDwryBZunYrgTarg/QW
0GCCivW9UJ9IxsxlT+mnmKKarP7UuHTF4p5ZkkKrVLZnIsMpdkw7hv8Itb7AX5h/
7WQ+Ikp8O/TyjLzdQbC3GEtDDBC+nuO5TI57W8ScPRlWQLzvqhGBgKpM3qJ6ivHk
RBCih8xhKp6E/+vQxDOVGvNk38bPNuxEbnEGdri138D/nkXOUit9/nGfaKl/w1dd
bwCgO4NGTQS24XidmpSo7mYhbRgxeIb9p07vtZJlcfzdBcFXCTUJ1AzF4W2RVp/O
qoOhnX8qF/07Ng2ia6EWVxR+D4RJXz9tv0594I1K3O1xjHALGlzDIxcu4f7ViyqP
1mO4OXJNFbBa6uXPTqbCjGvzILe61Yrtgnf1bqs1O5Fs/zdTJLP3mvTUwKcNXw3S
OAhzKt0Ya9+OTtm/kUzEAEn4zHtoe6QlfvllAQpnTP3X9OBy4rcrnCu2V9R/eapZ
0nFbE5/dlM7Yj2ijv01wPXtgGRCDfMI6bpkQ7pk2a6jKk74n5Ls=
=XEP5
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
