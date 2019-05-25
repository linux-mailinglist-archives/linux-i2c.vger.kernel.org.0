Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7D22A6D4
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2019 21:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfEYTyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 May 2019 15:54:20 -0400
Received: from sauhun.de ([88.99.104.3]:46472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbfEYTyU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 May 2019 15:54:20 -0400
Received: from localhost (p5486CB33.dip0.t-ipconnect.de [84.134.203.51])
        by pokefinder.org (Postfix) with ESMTPSA id 665A02C016F;
        Sat, 25 May 2019 21:54:17 +0200 (CEST)
Date:   Sat, 25 May 2019 21:54:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v3 1/5] i2c: nvidia-gpu: refactor master_xfer
Message-ID: <20190525195416.GA12538@kunai>
References: <20190522183142.11061-1-ajayg@nvidia.com>
 <20190522183142.11061-2-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20190522183142.11061-2-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 11:31:38AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
>=20
> Added a local variable "send_stop" to simplify "goto" statements.
>=20
> The "send_stop" handles below two case
> 1) When first i2c start fails and so i2c stop is not sent before
> exiting
>=20
> 2) When i2c stop failed after all transfers and we do not need to
> send another stop before exiting.
>=20
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>

Nice! It was only a brainstorming suggestion to use a dedicated flag.
But I must say I like the outcome; much better readable code IMO.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzpnWQACgkQFA3kzBSg
KbYnoxAAlOYKXyr2nn5llU8SCVD/VC4H0NutVS+IiIVq15EJbgrj9T1MscwhSijx
ruoLkN5JieuCWcG/QgGPQXE77ALn5bPG2sbYCoQPsoXEMTo3isU/bdTszHbd2bvO
jJ0IDkrmGgttxwg58GGpgwOZ+LVfiZ4vdmZ63Mg3VZUD2yv3/AA3ZN4s4hmJItIO
1yC+tsvYPzte8jMliICxO/3Qvh2lSkD1UEWz7BcOvFjJxEmCLHUoLAP1/8o50Szs
vT9f96m1g58eLeNqnjlgWHZdx4e/Fbsf61gfig55rM6gaScZhjroOJX9zwurXmVf
JTMWg8XiGNcKaN77vxNJBplbN90E/5A5DFDMkyQLkOZ9q/pKKvbuIxXbTMG0rIDL
UQUelgiavTo7KZ/o000w+R8DDQKBay2Swc7YT3AC5Ly4hoMluxyJdGW3116FvfV2
hwByNAkt4lv8V0rd5AbqlOSFkeFgFvZbaqdy2QOwXgzBs0WKVMK+T7KGWtpOcMNr
CBipVNFqiCXwEbfsGoxB+F9GDWMgVoJCBkxzWBurF/++64wdkqklTNN0S8oUAoFu
dD6R4lDiFudhWMbMhikxX32Xp4aq3EU+/zAKd8gUzahkacInDItMgT8aKVAI5lyi
P+mJal781Sny3ugIXvxcKcu9MCFRPZIw10C2BDw0E1Z8Dk9Zzes=
=3eKO
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
