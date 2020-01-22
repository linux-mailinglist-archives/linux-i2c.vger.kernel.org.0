Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04B71458DA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 16:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgAVPhu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 10:37:50 -0500
Received: from sauhun.de ([88.99.104.3]:43786 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgAVPhu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 10:37:50 -0500
Received: from localhost (p54B33378.dip0.t-ipconnect.de [84.179.51.120])
        by pokefinder.org (Postfix) with ESMTPSA id CC5B52C0713;
        Wed, 22 Jan 2020 16:37:47 +0100 (CET)
Date:   Wed, 22 Jan 2020 16:37:47 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] docs: i2c: smbus-protocol: enable kernel-doc
 function syntax
Message-ID: <20200122153747.GA21343@ninjato>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200105225012.11701-15-luca@lucaceresoli.net>
 <20200120154444.7c1d3863@endymion>
 <211da679-154f-15e3-52d3-a24d50c526cf@lucaceresoli.net>
 <20200122152608.40f7c90c@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200122152608.40f7c90c@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 03:26:08PM +0100, Jean Delvare wrote:
> On Tue, 21 Jan 2020 18:31:23 +0100, Luca Ceresoli wrote:
> > Good point. For v2 I added a new patch to use "Implemented by" also in
> > i2c-protocol.rst.
>=20
> BTW... I don't know how Wolfram feels about it, but I don't think
> documentation changes need to be split to such fine-grained patches.

I don't mind too much. I think for a first version, fine grained can
make review more easy. Maybe the second version could be less patches.
Yet for me, since patchwork can handle series of patches, the amount
doesn't matter too much. I am super happy that Luca did the work and you
did the review!


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4obEcACgkQFA3kzBSg
KbZgnhAAobbez1AQk3ARJKpDVlYmSo8NsQHWUwQONM/7EffLjD8urWlZiCmTVhCI
ca6MeCXcItFaoEzhlisYPA+G4sbkOhAjuXD1nmyAoEV5oTh3kPZvOQ5rUyrpBsIn
5iK79er5tXUSjIBJUMUfEKiX4Ry95jvXZRv50ynnJdupFGbY4egbUElcDIjh4KYe
0oJtDlat0ClqmcybeIEASfY1zebscTaJE2hbzIO1OZfyAxWrlwGp4FczDIFUUL0D
FuGUVDz/nPy7EpHCfZQnVkl+MLVWzGX0pnhKCHZQIYsw79spwl4E77KR/N8y+PFo
y7MZsOQkwbymQH9WjgNoqIR4GvQ7VS3AkiAjXHdw/Pf48JcGeEJ61rbjSWWEI1QB
6BMu5G0vstmjT5uA7CGEj2YCU7KGZFSem5fcp9aU/iM/lAqp5mVIsbACNFbyO99H
IubbvmIDg7stVVY20iJYS9L/vRRTs+o2g0aTZyFMr+tzLARQ8gRc1DhfJl09enCJ
uqyyWXp9g+zidR41kDMd4kTB4Amq5xEHHJxYD0KIi8o/scSTWH7TNvz/okV3k4F8
b84l5G641Xi2wL1Icme8xWncGfCs8vEHYyIdiPDCTPKSNhyl10QxRvtr/Q9Z1ess
Ry8vKii/K276wptiVWJgf00qdl5w9CBfAYI3jY304job+8tdiiA=
=gqj9
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
