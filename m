Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC736271E86
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUJFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:05:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:35538 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgIUJFi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9+Qa5uMivobbLAqrb6nQQsRVrTga
        eSR2RXdlO+MUxvI=; b=zID3ZblIZ7nLH8U1xkNaTZTRABzqOQGZpWviV+zdzEvu
        c6t/I4gmx+JiNmtsjyfnVRNzg0SmsCvYU54fEad5OL+6vn4HpLWdOOcjkjoK4cuL
        Z7sTItdwnK10AX5nmkVTyG/t1q78bwHhUgC3xVsa86KU9ov1SF/GMNGlnThrEQE=
Received: (qmail 68820 invoked from network); 21 Sep 2020 11:05:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2020 11:05:36 +0200
X-UD-Smtp-Session: l3s3148p1@rgZSJ8+vYLIgAwDPXwWzANnLaz0lJiia
Date:   Mon, 21 Sep 2020 11:05:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: add HostNotify support
Message-ID: <20200921090536.GB1840@ninjato>
References: <20200910091118.13434-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20200910091118.13434-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 11:11:18AM +0200, Wolfram Sang wrote:
> The I2C core can now utilize a slave interface to handle SMBus
> HostNotify events. Enable it in this driver.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obOAACgkQFA3kzBSg
KbajMBAAtgtgvbgQezuoW7Mxlq0YlvQDnlzDHPmMYtqNX2TshttLrhzSRiDU1RYg
oMfdSvNCqh7qY0zKwnoeWZymnMYsLmJmR2l+PqbhRnwP/oVdYlynf5eSic9WUDCa
Z7iFgAergfhIVKtfw6gYCJwOdeduppG1p+Z7q5esnrAMv7lpZbMmmh7wOzZL7qi1
dgckzxDLFe5vf4czJD/qNZnQdISBJvSoRfKg3FbiCJG/LD9SknYCr2wldNF/ooIv
IsQdIvKEExT5ys+C3PWQwSyG8Axdpk5YdBpO4Nhmug06urBzDUUIPomAksv89hNd
UmTJgBEIuRY7rplp6LjPKBspDTCK5wh7w33CETLDAr1tNPGdc/mqfvFyZCJRyF0/
x9U4UAu3jUKQpd0umw1XDrCFVPORzmjWoktswxJ+3dgW97HbBOuqR4DVSwiLc1Ud
rGVOSiAW1m+vrbq6+X4O0/S/+y5moIbBRMMnMdWSyj9iPf4EU+AT19y9guqFLpf1
w+sveG3vSYvFTMt/Oh+TYNDkh8uCooH6QoE/a7VI+oMBjxCMKjzicjnqWUYhXjL+
PdKRXEIOIsNj2njEQEwdqa2gwGuSlPRE1a/Uyvqk6t08dDPRTDaHOQ/8LhylcKjK
l406DMpVUNBGN1MvuTPqjKkN/2FLIQqhEm8qrqrvLxkN3SaEV6Y=
=JbBp
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
