Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189A0264337
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 12:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgIJKGM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 06:06:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730260AbgIJKGL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 06:06:11 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CA7A20BED;
        Thu, 10 Sep 2020 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599732371;
        bh=eIs4Saiw+133hqlCLXwCeWfV39nXcWZNtgt8DRHyIgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O5ac4xErBk7BTcwJSFCBWKSt06o5l2XIydsRh9gB18QV0Unf6Fy5rao/c+zFB59aU
         HHw1uK8iv7hTw6AieJEuHYXyC5GVoXhofvaRyjDjrIhcvmOh4U4eDZMWyWDgh9523y
         H5LenXnZSeQUzPHiDicb6bCjsn6qmzPbJCo+lLaI=
Date:   Thu, 10 Sep 2020 12:06:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: stm32: do not display error when DMA is not
 requested
Message-ID: <20200910100607.GJ1031@ninjato>
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline
In-Reply-To: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 11:32:29AM +0200, Alain Volmat wrote:
> DMA usage is optional for the I2C driver. check for the -ENODEV
> error in order to avoid displaying an error when no DMA
> has been requested.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> This patch should be applied on top of the patch [i2c: stm32: Simplify wi=
th dev_err_probe()]

We can do it in this order, it just makes backporting to stable kernels
(if that is desired) a bit harder than a self-contained patch. I am fine
with both approaches, but just wanted to point it out.


--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Z+owACgkQFA3kzBSg
KbbUKA/+KTSoRH7YFrNpcdKxwqC6ptIuUxtoiGHylyvgNwJHVhKqkZUgWRVHriJ1
aKzYvs+yRqbCavro4dsUyfcQuGUMiTtFd0y01cw7+HjPpJrkeTXwsn08Ongk1rJF
vveoKMep7H1Zey1Da0LRcEUi/AcsJ+k3D81AZkwmrAOd3zR2/bKSNhGxYzxQZ9pd
QvPI2LzcKy6wndnycDcMtOoXstFn4GKm936TsYYhKKZ9rnAQhttLzVGriJhRZUHb
xRD35j7YMCa3jctQGFyIcF0aXDHvjM4dsPKNw3Zd/SxEd4rRb7Nfjm2G9qFHWbQq
Z6lY/pcmi7vez8LNl6iYRoVWsmvHOWLCUijmZzgGNTDZ1Q1uuQUn5NxmSkBqI3Eo
veZhypF9MPwVTalVcC7mJWRu6LgJxneLqIOfLqHHPk40iZewbFIMPzOclJhsC0Lz
O9XC9s9BxXROggJmd47Y+yfAGhftXOMcwYuIDwvOBo4OYrRNIUvYJ0TESfSch9Ac
MFcC/MINTsuRulclYQX++ITYNa+qg8qs7TAavl+h7rlFT5KuU71Ushm17gZqLTO3
M7nxKWohyFqpdoTCBt3VPHPVYSvGW9Zevd92crEZ2dqbTJYAhxC9oycTBuikSZPP
extoO8W0+oZ8ThZDSgCU1fIr0zZvs4mNWWHGwgt76qvTOuRhnY4=
=f0DT
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
