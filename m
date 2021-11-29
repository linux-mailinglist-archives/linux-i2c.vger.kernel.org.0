Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42CF4610A2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhK2I77 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:59:59 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:35644 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243474AbhK2I56 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:57:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1EE62B80E2F
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35034C004E1;
        Mon, 29 Nov 2021 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638176078;
        bh=tG+g0qpUyzxrH0U8Y5MsCl8YqThQohi0vumLE6Ao278=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DpEAUaBz7FKUsVMTKfGTV0KK+wQjrc73bIizoac9GN/DRkMeK3InbCxK6hhfqq6/l
         kvA8RE97zonZ0Xeylxe8YZPhtgC6LRBQUZkHladv2cqyxwpqTv87NilnQZQVIVdSHW
         2BcH4czbsnnXyk+xJunA6Z0J9mp0EJNnGfyWwjahYEm5mxzUPzSqBFp5pGs9CzXQo3
         qCLFf+j5si9oUT07q/HQT3hS9L1agoSV4+ed3TJZIWumZRv5zcuV/vyDvU0Vc68lPY
         sx1WNUfVOrWTBZRmcyXaLUcv1yjMCXW9W15AroJgjJBneNtF3HE8hWmzlp01bAblnA
         eFUlDKl15Dmpw==
Date:   Mon, 29 Nov 2021 09:54:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: i2c: i801: Don't silently correct invalid transfer size
Message-ID: <YaSVS2BLBZet4bj+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <a5e9b8b5-82af-96a1-b983-d98c2fa140f9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jaFRAQe47WhOdGvK"
Content-Disposition: inline
In-Reply-To: <a5e9b8b5-82af-96a1-b983-d98c2fa140f9@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jaFRAQe47WhOdGvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 07, 2021 at 10:57:00PM +0100, Heiner Kallweit wrote:
> If an invalid block size is provided, reject it instead of silently
> changing it to a supported value. Especially critical I see the case of
> a write transfer with block length 0. In this case we have no guarantee
> that the byte we would write is valid. When silently reducing a read to
> 32 bytes then we don't return an error and the caller may falsely
> assume that we returned the full requested data.
>=20
> If this change should break any (broken) caller, then I think we should
> fix the caller.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--jaFRAQe47WhOdGvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGklUsACgkQFA3kzBSg
Kbbniw/9FV7u2qwSL90MptsJSSIt/oKJdiGx6JiPSD0/okIcNB5bTENrfUdbBRxQ
5HyZnxsvldGrMfL7AdYSWa4t/UEo4OgoBPBNrktOQ+wo6ZhEWKeXPXc2c5tgCOPN
xTBvXGHdm0wgyk1+VD4kjCISyjfAjTZZyRfHnh/vfGunS1c4w5cjxwqXK1+auP+5
laDxBimVQ+DGNbNnXRX3b3cSFJ7ONcvAodDLtqjFmQFYK7YrIAr4onLRhCuuIVxR
H1m6cgIBrEB/jQyMcqiQUVf5Fjo703Zpy5g/LPZxv9KaJqws2soHoi+NKhJqnxcF
2bSiafWr2+WdIom58tdKYCkQVhnwcfcs6mwYn5y9fy0GXdnAJQxjvk/co1JNhiot
lBOwchzuNv+vuC4Hggzk8vgO8LMEhNcnzWdJdw6zCOhG6aPLpxYQr+K17i+lRmFI
q71ZaeeZyNN3TEx+f2tu+7vq2m4TaL9DV1rFTmAlDnjflumodg387xlU0pbhwEJz
sVyz6uKQH1EFw5qUrkVkk9dpU4SLJm3gi6i6ziHcwIzEwdGttLSSfrYhcDOoGfzq
uxhjogxut4Hb6jyCbFKxfG+fwn9v3zAaLwhZ/EMAzs7zN5lULzDY57D2Ns92WIxs
1uo2YplEGJShpfYg7dNY8ixcEcK1oDiGgk9Ggn5tr6VE6rcifTk=
=fWPd
-----END PGP SIGNATURE-----

--jaFRAQe47WhOdGvK--
