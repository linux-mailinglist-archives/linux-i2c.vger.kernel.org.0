Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AF21DEAA7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 16:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731228AbgEVOzb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 10:55:31 -0400
Received: from sauhun.de ([88.99.104.3]:33148 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730167AbgEVOz1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 10:55:27 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 8FDCE2C203F;
        Fri, 22 May 2020 16:55:25 +0200 (CEST)
Date:   Fri, 22 May 2020 16:55:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: designware: Get rid of PCI driver specifics
 in common code
Message-ID: <20200522145525.GD5670@ninjato>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 03:50:37PM +0300, Andy Shevchenko wrote:
> Do not spread PCI specifics over common code. It seems to be a layering
> violation which can be easily avoided. Refactor PCI driver and drop
> PCI specifics from common code.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H59kACgkQFA3kzBSg
Kban/w/+Leova5+ND/tlQzcmFQ1Jf7rnDyU26nWdrFmszbudmX7lDRq9juummF/K
zc15LeqNvvrOatQ58MtiaMGDkbuXWT7QVCeapBfnCkIMbsJ6tstRJinSORsfCTMf
ysODDey9bAhN+CgQnJyYg99OPklTlIuUC/DQD9dEC6Z5ExVXcA6A/C78hzrNDdBZ
wO1CY1k+Ce9R3IdnbTjDP4NmVZtCFJJvTa2yfnrhZjdgyuYhJkpAq+vbujv5+fz6
kr82xP0awuBrJ5QrMhaIh3Kj/MHeQThxkp+iDyFYew/uKt2iEf7VN+6d+9bAOObG
lH0A8TXBlg/3u9G59aSMyzKxZPnMnoef6INuACav0yEgltS5Dm8u4WtPYhQC53rW
8fHhMiygkcbD2fZAa5An9XNWdizuF+moLYwH4cS+fUctEUJG/yRw9WaFMzwTXAgb
u0VvneihP3oMcni1YnD0FizVbcyyjOhJTvHFZd0woTQ3nMcd1S/2XJ8YaVQSZz69
FzSktMz93o4nd2LROkaIaurQ9PbQZDgJ867UVmL7VHzyHvNAG6W5LGzmGYPEA8lG
NPVmLUyPv4THMe3Xbjpi2oLOtOSGAVUX4Tm1hzG+f9egop7v1ppbUL5ES+Zow8TB
GuAYmcTM0H80OZzeFAATQEwiZUilZeNWJUnNq7a6r48f2lekxuQ=
=JfRe
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
