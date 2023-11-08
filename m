Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E137E52A2
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjKHJ0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbjKHJ0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:26:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6CC9C;
        Wed,  8 Nov 2023 01:26:52 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C617CC433C8;
        Wed,  8 Nov 2023 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699435612;
        bh=T4hIKUG3QVwydSPQlJlNEfKgB5jonSv9w3FXDX1eBzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZVMRhhlI5bYIT+l5VF8OZ3I20sBxOfKuwlTyEJr9T2B2pK6BrrpAx0U6JYBeEUU28
         jnYiSnMQgr49dwQE3iDA2v3BPpO6QSURANZcImXJHVVfs9h6y/UWPFuYFJ8P9DUcvO
         Bj0zNbxQgwyrIfKOr4xVrl40+A3jy/Ts0Hw/Km/M+r44HK8P+9kPy2OWS64kmewMl1
         rJxGNeKnNt6KaZ3TITq/SE4TMVBPxus30mgaCYxyzakPHQCo0lVEQAgv5YNzhMIBG0
         otihExTLyR+amhGbuop2/cMATNn/JgpeOsNnEBonDXe7sEaTcxviDpn/sfwdaeqyO/
         wWs05NRFJnK6g==
Date:   Wed, 8 Nov 2023 10:26:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Philipp Stanner <pstanner@redhat.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drivers/i2c: copy userspace array safely
Message-ID: <ZUtUWTcrqHG6MNZa@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Philipp Stanner <pstanner@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20231102192612.54066-2-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ffyKkaJ+lhi8Ay+A"
Content-Disposition: inline
In-Reply-To: <20231102192612.54066-2-pstanner@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ffyKkaJ+lhi8Ay+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 08:26:13PM +0100, Philipp Stanner wrote:
> i2c-dev.c utilizes memdup_user() to copy a userspace array. This is done
> without an overflow check.
>=20
> Use the new wrapper memdup_array_user() to copy the array more safely.
>=20
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Applied to for-current, thanks!


--ffyKkaJ+lhi8Ay+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLVFkACgkQFA3kzBSg
KbZPNA/+IoqT1gc0e33tx+y9HPuZPHZ+8npzS7DrNSkKzopyRkDBAyuzj9yXC8+e
kkx14bty1KXXMPrgwJuXZm4Yq5WfAS4EFEpsnpduheqzWLMw1BxsAR+eq/GYhkCJ
j38t0+UisJ3j00uchbwbM18s8EEi40Tg7iQ8xaElEtmdouZs3P1pWyhL0VffjtsO
ktDPKE9oO+fcTWPYfcf1t6Pu6Pd+prDZs3rHveUxSjsfac1OKCdIkoEvTPWuEUfJ
KZzQ26yw8761O3DrEvh9dBO4DqIKwJh0jSlwXEya5g9c8dbJj//zyFjb/lrck3t8
uNruIeBRtFTjBu/+/YCh5TbgmcQSA4zDJAVqRk9tJek51lLNG8OTevdl0OkWirRe
NbAXJEbM/kX5IoNmlSxovfArQv4h9LYAYKdsHpzFYkOsINQFUXje0y5BYhr3Nx8j
1XJL2L0iXtQbS6ZVSgVIqoZGC95N/ZK2+OMQszGxCMN6KGOVQoQ6V0LFiLXYZl3c
YzAV8l90EUQH5FSGibSb1Ikk9LfH4UYmCuKFFaHhkHaXDuztHTZp0aYO/AKTdvoQ
tb3dCNmmsJiyHJm/BGXwvVHpIG+cBJlwzBVmTKqg2vOfP04AAnOok9KqNWbrje74
DfgHKok5ZYubhwgQEaGIb64mMstfABhairESdiHWya6GmxK9SSM=
=pDJi
-----END PGP SIGNATURE-----

--ffyKkaJ+lhi8Ay+A--
