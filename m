Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49296230F6E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbgG1Qdz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:33:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731191AbgG1Qdy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:33:54 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92DA22074F;
        Tue, 28 Jul 2020 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954034;
        bh=P3s2vLrUkoPtpWsgHnMNHnfzyTA1ZnLqpfxWfpMaeyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmVzQijZMe3MQ8CgPNz02MhvuDClbYbJWKDHBgb8RiMP5VQ7zSFhV6prXFGsoXl+l
         rGdW/hhCRPW5n1MNFjclalgwC1LmlMPxni9n2sdgl9/YEd7x1vWLN06dWI1ERRtvSF
         j+UeL3T5KdzmPcwoAbFXFSG3ouwh35hy/jGBIrwI=
Date:   Tue, 28 Jul 2020 18:33:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v5 03/14] i2c: tegra: Fix the error path in
 tegra_i2c_runtime_resume
Message-ID: <20200728163351.GC3736@ninjato>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline
In-Reply-To: <1595883452-17343-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:57:21PM -0700, Sowjanya Komatineni wrote:
> tegra_i2c_runtime_resume does not disable prior enabled clocks
> properly.
>=20
> This patch fixes it.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gU28ACgkQFA3kzBSg
KbbmDhAAoX1GzWiktnMfjqHwm3rkcqamBWXVqsWEGRjEdMUDfeD6uPttYDx8YGph
NUaP4CjvNwdoATSH2geHWjJ59/Aj5mzDZfTil2c3uQtfczA+CtMjNX7h9sh1qpY0
m5kqnnOytv6nn07R6R6htknVhMRLMlAuOqtnyBgd2hSaNo/3i2oe3XldtwFnwVQg
4b5J8ohKh27fqfYXIqMzTkBOmH7qjNX9flgdik5T4V3Jx3zKGOA2P7Somp8pRwWk
HwHCUiWEBF6lCKFFvGkSXJEin3lmL5xBk9Mxg1YO8xUlA8L3/6bmIUKXZaDHz2Ez
8sKfqHx1wy2PqLHMK4RK6pCCRkLmFw+qemZC9QEl2/4BY5MT8ZvGNhjxD5+ThT1u
T8QZkBDLTjvcKIilQ43mHMplMsHYvdfi6Do4de4TXkif6uDWc+nGbYNJPxxpEoen
HnZO7jPCTvoG7uPlJGjcIeoIiqlJIDc2LIecBA8V89xX9T5Cw5vpKyFPhZbqyOCC
o55rDDsnaWZvDFMEzsX4gQIOjXYyE7QjN1W8l4VkYaEEjIkLDclFfv9DGJ46gWPs
kU+sBU6bpR53Vfpv76ocU7B+yDKR6vTZvYzsAUeZ7R+DgNkMzj2CCa5UQLxbcMHL
9B4RMSTnGYRe8XEqQ/zCZ+Qq8TZvOnJ/M+VKYPmkgSUw4vryzpE=
=gkYV
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
