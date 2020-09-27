Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086C927A14E
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 15:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgI0N5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 09:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgI0N5N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 09:57:13 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5DA8221EC;
        Sun, 27 Sep 2020 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601215033;
        bh=RJsbyoo+cFGkEJnGHckyZfuCofyfwcfBqrA23B8Kp/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M4p+xD3ZZAoVKSBfa/en7+HZzjXJUlIwByXLW8wbHdBIu67w6vP6VkosuUsf5LEly
         m2GjDedFwuJMbTGo6Tf6fsAX2JddAtKWLl3HoHQf3Y7qdI4xID29Ga2XqlP/H/8h0K
         JVZPse+0orPTBcdq5EFK4/eHo8H+lp2GLaLjXyAo=
Date:   Sun, 27 Sep 2020 15:57:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Message-ID: <20200927135710.GD7298@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Rob Herring <robh@kernel.org>,
        linux-i2c@vger.kernel.org, Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline
In-Reply-To: <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 06:49:38PM -0400, Khalil Blaiech wrote:
> From: Khalil Blaiech <kblaiech@mellanox.com>
>=20
> Add device tree bindings documentation for Mellanox BlueField
> I2C SMBus controller.
>=20
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>

Applied to for-next, thanks!

A first incremental improvement could be converting this file to the
YAML format. And add the new file to your MAINTAINERS entry.

All that aside, thank you for your patience and for keeping at it!


--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9wmjYACgkQFA3kzBSg
Kbbibg//V1AwXr4VpJWRj91oTNN0gZiWp+UI4ohkVqVYuopFVohwJYqA8hwT+zcT
+pp9zwl2ELSj42Y3Od6EHIdoz2EydK/xSxxF88viyu6eWkkW0XVw/6LakUXKM3gx
zm6tFhSwkgsosMm+ugq85jMw0mwB5XI2HKDSnqJ25BQgLCBslaIVOGFcJiEG+vNb
SPLaJyr6RYpnPNigMzMLoUBCcXRMA1/2jHQgZydR008j1ozLtSMAoK1tU/rodbUL
gtcdrfZ3Ekf0J4VjLhOsDx3Ly5q3jVHbyKG5U7L1DrRZRq/xWiUniL7Nk00UHFNO
4G0uzuE1RKkxvVKpCpys/rkipCe+uEKGjiTiv5LasxLMtPWK1rzbz7bBF8FWFmjA
vyzKz7PovBi7muoGl/PGzn+PA6DkkU9bylKL9iUQ8ttD3khUIW2AGcHfgIhOsSBw
kzm9SjgAFeq/banO2nIv28p7WWReAPhLfa9rGFEnTCZViFILgpSr5+3NMMTjtelE
ZG6uX7otjXwHm2deUmdUqEtGdyYTO2HBSkb4JZSQzSG4PDsJSTJstGBCFuQvhceX
S+pdhvBUu6J5zerW0VfxZv5CXnddm+9cXanSIOv56aG3MdxupABDpOG3zXIIGwOe
oaRP5z4UH94LPcM8tE0AWPQ5FiAQFHzpjqB9F1KvVLQHlYyq0IY=
=NL1i
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
