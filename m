Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BAE230F66
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731513AbgG1Qds (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:48734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731191AbgG1Qds (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:33:48 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6EEE20792;
        Tue, 28 Jul 2020 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954027;
        bh=DtCFJacsr6CdI0tGB53RDI4b485bWpqMFwYlC6VK2wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kk/27EblgUcXZbFkpySgRDHWvU9q4nbOdBY7CGgzEM09surZC9Cm1dn6Q3drgVp04
         I14RirqQkUDrlzwne0ThSDDeKp/VMskCM/8AdAoHq+HrYTOtT9crK930N4HG1rdfuC
         Qa3EqEH4Tc3Xy7+5+7ClSgKcQuLHsfPABN1eSvOM=
Date:   Tue, 28 Jul 2020 18:33:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v5 02/14] i2c: tegra: Remove NULL pointer check
 before clk_enable/disable/prepare/unprepare
Message-ID: <20200728163344.GB3736@ninjato>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <1595883452-17343-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:57:20PM -0700, Sowjanya Komatineni wrote:
> clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
> implementation for checking clk pointer not NULL and clock consumers
> can safely call these APIs without NULL pointer check.
>=20
> So, this patch cleans up Tegra i2c driver to remove explicit checks
> before these APIs.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gU2gACgkQFA3kzBSg
KbZ4Bg//f73NpFO093mNmSj5dYQr2/bFr8E9IEDPd6Ll/V0fG8mALZzBDssn7igW
ob+FOzpAm/Chj3WNZOEig1XLfV+Z+z0XyofEN1FN497KXi2TH7JoEsCOutFeJ5YI
6WaPcUdrvZ0mSMqolzVVuy4SJtuUU2myE9FfQomz5OPICON0ojHQPXgFGTxOVObp
+FbUWu9ROysYJiRyflMIeXN2lZQti81qHxnndifrPiPKX2ksxOHRHHXLfWaDMRmY
A5gcTtOpKhfZuQbOKVEq89PX9Wfeg8heNlOgZRjWhTHJv6BN6i806UNwwLHwFp9l
YJ2d/cUAi823jTxcMg7dlLRM2cqcuKGLpZSeh/EHxKkmT6tH+AECTWGNcKLCHHY8
nVqf2+rpr9cQzukl9FurtTZgbPJeM8qbwl+wRhz5AmAVh7gPRjdkk5TJpAlcPfyk
8a/NaIQcet1sMv3UxHy9ivya8DcdsVb61zy58uCQGUSvZjD2fq3qxz9seN1haMI3
rgNYBCWJfYq6lrZlbaZPbVH3R9ipWVT9UMjlS8ZvDqUXt74s1k691HtHsDLRLb6/
5LTre9Pu8plX/IxQJLNXQUx0syBVQkSQGalvKyqvPQ62JU7qwcT2aY7gzvuviTsH
Jnwk+rUKR+CFhBlwS4RAYR8zLFF0TxIGypLNMCbPTM4A92tvq/Y=
=gsR6
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
