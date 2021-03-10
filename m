Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB53334285
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 17:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhCJQJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 11:09:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231816AbhCJQI6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 11:08:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C12CD64F02;
        Wed, 10 Mar 2021 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615392538;
        bh=Ow/CgKkE/PJ+8hOp5NJf/Xonmpc0AENmeHEZXVudxf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BKH2QpYz/iP8qF4/rkQqvys4jBM6BxAGJysnaKXo8lmUsnSK7uyPr+2oly22VsfXf
         sTmX89b+PEG5mIhoK/teQ+B/7kXkpnIbtKBpCjXyi5D+glZJ1ICrsmnKay77Pok94X
         59+TPSm6iR690cu4LdhGZlGTPpUrRXXc4deVotJJoDecdoD8GtWd6mRyYyJjXYbKhR
         yi+x3K/8fG33ETPhz8wyhQl4BcLOgIQW/Tg3dSSoHPVqank7rfemmJNd7hd31To1bl
         G4mbfALiB+wOS149g0vQea40h0E0ipcsOKXO6d9HrVcvauSCe1ssCEc7uWzAuAMaif
         D9IoQDr4iP7CQ==
Date:   Wed, 10 Mar 2021 17:08:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition
Message-ID: <20210310160851.GA331077@ninjato>
References: <6660750.UgobAMfxrE@kreacher>
 <CAJZ5v0gCobMbDGt80exScjpGgjnbo+5kMtB6qsx1wfOf6QyiJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gCobMbDGt80exScjpGgjnbo+5kMtB6qsx1wfOf6QyiJQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 03:47:10PM +0100, Rafael J. Wysocki wrote:
> On Fri, Mar 5, 2021 at 7:29 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrot=
e:
> >
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > The ACPI_MODULE_NAME() definition is only used by the message
> > printing macros from ACPICA that are not used by the code in
> > question, so it is redundant.  Drop it.
> >
> > No functional impact.
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> If there are no concerns regarding this, I'll queue it up for 5.13 in
> the ACPI tree, thanks!

I'd prefer the I2C tree a tad to avoid conflicts. Any reason for the
ACPI tree?


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBI7w8ACgkQFA3kzBSg
Kba+gQ/7B6Ia7moxCI0lBWcGBWMpcnSzTXJIZtoonghrWryWNJTlJ7yYyVzJKPDz
ddelDKPX2dtiKquTZwWRq/21aJL0PSt3sPb7LnI1ykcy/Ipe2Nbgj2OhviRuJqtb
nX++egBWiyqC4qySeSmVdSnyIXo+F7L2elNs6AbCZLKeWjzT5gFo7HpzMnsrNMyO
j3dXCecCq/DCrZan2jHUAkplbW3V+OBPLQ90HE8R02U692LN2cP2nvGmr++01pnh
OeFt4pJkguT2BV0S4Je2FiprNBMDkurwSVlrYdrbroJdZNsGd0CRFvQuloO//BGq
lA+tQUZ35/vSs7QsbGjXGJRQWf8pUmAOwBPyBtEQMI7pJ33OK9sPG5uShVtAL9Zn
EMA9y8/aS0Q6kjP1jqwMzEa7W4shVhgK4ExjtWSO8Fku94IRnH5eBd0qYI0U5ELZ
lpfPigQTLnxduq/hC6Q0skx1kj4SRVAYT3dS6Dy+575sXuV7dE1HGGmkZuq/tmH2
n+bYvTsaJT2dE/J0AST9JCw0FvwziPsIB5nesc8cL9eGP+PXM3jdE87fS5vaJ8Mb
qk1ZCOCocNeqHPbkZOD+6VxA0ge3blRvo9GBF2R9SLyFQS7OzubMuNJTSOJ/VHf1
SEuymiMXzjCq9yGz82cYwSQXNV2DrtsfvUiDkGYlCdI2Z9OBlRo=
=5s3T
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
