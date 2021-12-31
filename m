Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB2C48243C
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Dec 2021 14:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhLaNnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Dec 2021 08:43:19 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54374 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhLaNnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Dec 2021 08:43:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67D1D61795;
        Fri, 31 Dec 2021 13:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BCAC36AEA;
        Fri, 31 Dec 2021 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640958197;
        bh=riLwjw8krb8OxQcZBIqxR9zTPbsU+dtHc4Y6gmVcaRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b0GQhItaBGknP/vQFDElSAT8a9M/Jp72U/iVPQYVaOn8ZNQa06z1ysQpGNQWlDMEJ
         ngK75KAJ8FsJI/n/2EHnVvOeaLhFgD6kdptzUeodgapqr/ht/FcwwErIF48VnoilBy
         N1boTHiktp75CQ9HNVJq2P6mFnerzSkVrRJtk+VHWP3/i8r2nLSLL2TmiQQXDFY809
         2g/HzeB1KMt64ASAsD8FIEoBuWcFbzUN/y5S47exX1G9HVCX0dzuoV29yAC91Pfx+G
         IVthbazen1jbidDwaQSc20RirPbxY3jluzAKs0IE68gybkDkTwDRdOA2ZhBTz/XKD5
         4opmHEbjSROrQ==
Date:   Fri, 31 Dec 2021 14:43:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Deep Majumder <deep@fastmail.in>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Docs: Fixes link to I2C specification
Message-ID: <Yc8I89eEqN8CcgDv@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Deep Majumder <deep@fastmail.in>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211119061401.19852-1-deep@fastmail.in>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GW+rflw+5+PYEx5W"
Content-Disposition: inline
In-Reply-To: <20211119061401.19852-1-deep@fastmail.in>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GW+rflw+5+PYEx5W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 11:44:01AM +0530, Deep Majumder wrote:
> The link to the I2C specification is broken and is replaced in this
> patch by one that points to Rev 6 (2014) of the specification.
> Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
> specification, it is behind a login-wall and thus cannot be used.
> Thus, an additional link has been added (which doesn't require a login)
> and the NXP official docs link has been updated. The additional link is
> not the Wayback Machine link since it seems that the PDF has not been
> archived.
>=20
> Signed-off-by: Deep Majumder <deep@fastmail.in>

Applied to for-current with minor updates to text and commit message as
discussed here, thanks!


--GW+rflw+5+PYEx5W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHPCPIACgkQFA3kzBSg
KbbKeRAAo1baRRpnMxfXlwvvTi2yv1LkZN+CvFKDH7SwMao3B0j+mh/JiVrjOIMT
E17qBiZAerhIpaoJu2/PBrD5ZiVScUbb41Ij0vHMONjFUytRgdCLkp/WDVWVkskm
v/l3YvQlLiaMLv+J6rj4/ABwGOq5Ayrzrrl81xsZN4peEiMV2FdUHyS7YIMBmdJW
BmltfbFboQsMBULiSV2OoJrqKP9mRgbqCrsHdmotUq3zj6WHgVZGg4ebpErWYm4d
6qgW40MHklJ5r9eqy4LQb6q1pK14hm7zXeepKku/EmNrgC9IqHfngfOWlAj3lYKB
JAZygZ5tu0aVxZBmYf6ppgwjDZvyzjBnvcKFpTThWQsvAvNdDGNT6pVmDrrH/Uyv
+Po03Tq44/rHBuZDh71uB+B71z5kLVRvpLY6K69ICn/+2T702LdiIWDHkIXGjUNE
UxdvZpuGSDMjcxpbtA0HvUF5gEABWHRSY2o+A7epG0P4rmWnD3Dy9de24JTxCJ6+
jhLUifQ1sQM7KM5gAT/5PYKQyX7A1nKbY8NCoE8RRQ/N1yFVh+HxYzesWCA/h+ZU
0vX/mRKuZaLoch6FW+cnM+tVTnVkx/7+AuN23Mrr9xisdLJOSkJOwqCi69XMOJ1u
zZylOL1XHINBXgBSBFVEsdTbJwQsXFliCeegiC+o+KKUW3kGfmA=
=QDyg
-----END PGP SIGNATURE-----

--GW+rflw+5+PYEx5W--
