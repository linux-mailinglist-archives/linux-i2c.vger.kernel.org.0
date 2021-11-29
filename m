Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9474610A9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241241AbhK2JAx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:00:53 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:60052 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245262AbhK2I6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:58:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59787611F9
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0674EC004E1;
        Mon, 29 Nov 2021 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638176134;
        bh=Bgd9cb07mL4WJE5Nzqt4GNOAOJPRP83zleQ54J9jl5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KNmxBWYLSjUIbHzMFHMP32xVrvHqxr5XRdarPiZEkazezm+GNiqR3hDhZs3Ndxoge
         gjEWSVdUPIwk/cAbV4oTZN4Ejd2Mu6hY4LMghSW3KCmgb1CJnvlLnnQFm9Eam8rgCh
         irwSjf3VwgpgXDia2BuR1PIPZvQkKl3ROSvIHGtmuu4iDJXW6iXs4bzU54QMNwb3BR
         MoykZ0sP5eAGwUIVnNiPTCDtcF4Pk6n9ynZ7SEqPQkMlXp+cIS8NEB0sLs+KfSpss7
         i0UwZcgbYTQyzYE5r8eK6ZMELCZUSRRO6Sj6Ve7td607phC+GV+hVL2TscqCGEbUJl
         7NeYDVW/Ky2Vg==
Date:   Mon, 29 Nov 2021 09:55:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Remove i801_set_block_buffer_mode
Message-ID: <YaSVg37N+TY5Tccv@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f6e13674-7f86-529f-10e2-6b34bc5f8f6c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d/tuIzvysDK/fZAb"
Content-Disposition: inline
In-Reply-To: <f6e13674-7f86-529f-10e2-6b34bc5f8f6c@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d/tuIzvysDK/fZAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 11:58:17PM +0100, Heiner Kallweit wrote:
> If FEATURE_BLOCK_BUFFER is set then bit SMBAUXCTL_E32B is supported
> and there's no benefit in reading it back. Origin of this check
> seems to be 14 yrs ago when people were not completely sure which
> chip versions support the block buffer mode.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--d/tuIzvysDK/fZAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGklYMACgkQFA3kzBSg
KbZR6xAAl+EoMDbpDOJhzImxJy6fKW2IIq6HnMC29+1D+0fOalD8RqsLt7XONCDn
GXPn1gxM2vwUxyvqf0ANW2a74TaHH0jbOPFoNepI+rNRXFGAJimMgcwkdjgok8Qi
haBE+exgPm+zKV7q3ACQYTLSih1VNoG17LUQFwkfa06v5WQHODJnm++Yq813tgLi
wTQ9F6a6VyQy41c9cqaprQNopeBdlZBJorcnoC3yRY2FuHvG/S0dM4csXlO01lvq
einPrk3IUTqnXAEDamIckCFoDs0rWVNYr7XEggcX7osp4d45RUknoE/NkpRcycYd
QKd6KwU8ibcOL6+0/LEtm+DhvkCbPl/s87WxCugRnNc5EtIoYoakrzGPune+UGSd
fuQEZWO8cDife7krQjCXx4ofyRGmcvGUrBwFoFc0ADfHlYQASSEX3Q+e5sJzI7B+
/MCUBN+w/MPqnaRok06s2Gtr1FVIGclaX58mbz95vgenD0m1GtFQbvxT7+zx3YT9
bcMqW/Tjg2RCyQ76qMfoFxXz2nYrenOqgrjmESVn0qcNWq1uiJGW6yq+03lyMLRw
GNSONpMrjQepWXZ8wzFKScwCOztUDAZ3U1l8LnmxssN8OjEXX2CqOqdli3Jl6+Fm
1KkMFg0kWuxiNT7Cdd78AOXn/2LuufEg64Sw8eZWBYKJ8Vz9R2k=
=F0Ca
-----END PGP SIGNATURE-----

--d/tuIzvysDK/fZAb--
