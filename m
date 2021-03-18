Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899B634044F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhCRLMW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:12:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:53738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhCRLMJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:12:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B664264F2A;
        Thu, 18 Mar 2021 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616065929;
        bh=UqSQW15bDrrL+cdZcRqJ6fR6MAT53nCPdnQjzPbCIjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qHvQ1bqSHZInMCqB+dRNptRlP2k4wTv5LTxHqHtO5Nrfa85f34YpF2aB9Mj1ceA4J
         AlCWDTJISLlX7JyH1ZFDfbZd1CGJHIJ5+UBocpOFzT4twxs+gwU7YQjdIOcIZBqtKm
         CRAH17Apiio4sMFQjbPE5QRCacja94a4VDERriFjxUIsrp3e0TbFzeDlSIShBNuxE+
         Bj3RwLeoZyWE7MtbeoHKMuE3l4Fq6dmNjgFz5mZstxMxW1Ef+NAKdc2uR8VZFbR+0Q
         kNOcCoC9X0Cv6iYeyjKH2PJJ86194DtD6IYDV4TRv1AaCkO2HHt+6tpqdsYVB9KA+4
         Zkg1R17s9KlYQ==
Date:   Thu, 18 Mar 2021 12:12:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-i2c@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition
Message-ID: <20210318111206.GK974@ninjato>
References: <6660750.UgobAMfxrE@kreacher>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BOhpupldhMlYbdva"
Content-Disposition: inline
In-Reply-To: <6660750.UgobAMfxrE@kreacher>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BOhpupldhMlYbdva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 07:28:30PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> The ACPI_MODULE_NAME() definition is only used by the message
> printing macros from ACPICA that are not used by the code in
> question, so it is redundant.  Drop it.
>=20
> No functional impact.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied to for-next, thanks!


--BOhpupldhMlYbdva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTNYUACgkQFA3kzBSg
KbacUA/9F0ROxzF9VeSC9gvbm6/JYUiV2jHwkK0Y7luCqbYxl0o1YDl/OHuL4XBJ
eIopPGFKcLMxD634C2fhEd+VaI168FG2XrNYavBZpSInTA5jjecWlDrNt08Ayurf
wLlQFR2JM4/C7NLvEXhmUbpAtYM9YJ9UVPCqhmwcVgK8Z1sHLXa7RYK8Mh6SnUGR
Kp9F9zP5orGYiAhnAIZLXJXnfhm2Gy2p8TloBpn0JP10/jqIKS/BKthVTus4VuNi
KvMaUlUn7DTFFHtJjV2UcKK2wtH+o+Y0j/g1JLu0K5cOiCVjYbuJA07f1q0nNwMS
JMTacp18RTQSkKXLH9Cfl09ABhE57jU4Hxfg+yO73Ab3HVhPd2uEdu+Zxhj5mn/i
1wee+0qLOlmtnm/Mr6ZGVGLGnqVpnn38NcAwtUtzao5vmF1smT7o4ddNdhwMrTeM
LQvolBy2iGmNwx0O2ljK9q+gSiy1T18PQr64y3lB4YnMBq+9CZ4/3IGBFGmLRZKw
jvjzEUz56/F+YOZ1bGfVP9AcunMayGAjhCun53cs5eO0j/MdpqOnSIlSaZia3lum
cBIS1VshATlToWSFjS/2fk7J1CTDNxLdOP2ufCXi3YD1Qep2VFS3YBVkw8heoqcF
iLUrbbc+OxR+5aYmfc7PQaEzDe6b35hVnkqsrdJxdWwZ8bwDeg8=
=VzbQ
-----END PGP SIGNATURE-----

--BOhpupldhMlYbdva--
