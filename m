Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFE227A130
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 15:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgI0NPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 09:15:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:49876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0NPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 09:15:38 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1DDC2389F;
        Sun, 27 Sep 2020 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601212538;
        bh=+0TXXPW/oD9wCbCygzReTtRb2GRtQdrjRaKFqm0nWPI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ysJDSRxPT9ICI1jx0MKW9SxuEhj5LJtqtnR40uIBunQarHO6FFZMNZEqNmWavNCe3
         Vn/0CrWIIoX5wi+SMecvcefs4D22VhsxAmbbLP/jiV11xMmsrsWa6dfA3d61xsNIa4
         iSWW3i5FcJOXRlH5wiqaE6jjBei89hP1RBXZL4R4=
Date:   Sun, 27 Sep 2020 15:15:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     nicolas.vincent@vossloh.com
Cc:     jochen@scram.de, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cpm: Fix i2c_ram structure
Message-ID: <20200927131535.GA7298@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        nicolas.vincent@vossloh.com, jochen@scram.de,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
References: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:08:40PM +0200, nico.vince@gmail.com wrote:
> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>=20
> the i2c_ram structure is missing the sdmatmp field mentionned in
> datasheet for MPC8272 at paragraph 36.5. With this field missing, the
> hardware would write past the allocated memory done through
> cpm_muram_alloc for the i2c_ram structure and land in memory allocated
> for the buffers descriptors corrupting the cbd_bufaddr field. Since this
> field is only set during setup(), the first i2c transaction would work
> and the following would send data read from an arbitrary memory
> location.
>=20
> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>

Fixes tag aded and applied to for-current, thanks everyone!


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9wkHQACgkQFA3kzBSg
KbZZbQ//dMU2zZyKOm+GR1Ymwzvxgkt54AF4geyr0wx3e1is7O8ya7h9i6fZl3tD
o+yY5rzpbahchBMzfDhwFpP1ykdyybOGIhwz7+K0HmBCCrtnNNFPUNI0JS5RyK3B
gSmdSU/8ZvbdpQvGjhYOPJB8xezmig2g7eOMw9STvTZWYeDxyeC61AMJO13TLkD0
DFISITaN6Y0z8wLy0dKDTzCPybnHUThkOz1kLNvPXB0F2MNIy/o7pNFzhLL5fyRR
qbMSL8baerrSTrowm/7NmfQmbZJpPsk14Xuns1w7nnrLmtUHh0f3w+9GZeV+xOO+
ReT+IAvc262F4qOV/x8xgBWrL0F3wCyGjwLmC7zqxMhHqWQ/Luo3iFx+VhN3yLHk
JDFHRCI0ufGvIiIau2zNq+VcvhXGbggDtJrJ7kVnMHPa5230vosM6pUIdxDvDfhU
nD6FxK6d0g7ZKBTktUms/wdqgkqMbgohTMejbgaeNZbT3fW/LoVEe9VUaaSXc5o9
dS9Oeq+Uvd6uwVkyIpO2dN8PZXfMNXGBOCMJXxAVUUfsA0NOwjlGIGI7qVCAcoNX
mMsIXKPtjjsxMKfdV2OPYyx7l3NF3H+qfBl25mJ4lWZ6HljAtvSTJuNczIFSGsB7
8WdPZ4Uk/28iOmx59JwD2dTT9bNUcx8JCOfimmLV45McnTcgZEg=
=37tR
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
