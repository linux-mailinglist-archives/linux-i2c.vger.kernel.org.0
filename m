Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9923936D8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhE0UL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235034AbhE0UL5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:11:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55077613D4;
        Thu, 27 May 2021 20:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622146224;
        bh=1b52DRB5CF3Toz7AYZE3/kXkFMkmvSw6GiqwSIxRLog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LQWf9DHRWuEgTtUl8S/ltyB9zg58YRXEFzSBYgZAi9+nFcLMR5yXmGsb6gF/i1iG0
         7MJRRzA8ejEo1ITZgHp/lu5UvWgewhc19zzT00ol0opgxGCf0tp7AS+O9mAoxuDqaA
         u5h8LPQJPN1Hb4f6MhXyyyUruQPfh8xjxWIoL2GxhvDEse0D8G3dWYgDc23DqYubmD
         mnyOdcKkzBpgH9KvPe+K6fYJV1d++Bjjo1FOva8UATMHMIyeRbLnWRYBRjueJe84iW
         ghes4AiAyPGhb+yHREXqC/f4KNTtNZ+aHp2oQXwO4trh2Wz61sxBRLbgaP186qfVtR
         iNyMZuKlfIeKw==
Date:   Thu, 27 May 2021 22:10:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Use standard PCI constants instead of own ones
Message-ID: <YK/8rQHz1FcFzS1T@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <a4b704b1-278c-20bc-854f-8e1177a530f5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1lE8SfwvMPj46qiu"
Content-Disposition: inline
In-Reply-To: <a4b704b1-278c-20bc-854f-8e1177a530f5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1lE8SfwvMPj46qiu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 11:46:20PM +0200, Heiner Kallweit wrote:
> Layout of these registers is part of the PCI standard. Therefore use
> the constants defined by the PCI subsystem.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--1lE8SfwvMPj46qiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/K0ACgkQFA3kzBSg
KbaIAw//QNy2SbbCYLQaXzNWWTwPRZoZGC9z4xMkqlR/S+PN/z2dkR+AxpElMWuV
LwRN/XkqDcAev1cmo39LrnGTfanDbbbv5Mcnp32QHGrRTZ7uyaTRSBpNpx1jGXZu
gc4utZSe0luX/lNvGiDu0B4c/te5WUoIaGwDbUtXEW9qMa9ODK15EqL82gIHUgUj
fgcAZdH7bqULs4aoybN6eyH6Ge+l48MRocUpUCFVxx3mLAmshQJsJvOyRAbDYUHV
tWDN+Rn+Yj4lra98dLcfN15NAqqHNePl4/MQHyH/QrYkgqTi0f4bCpRAf1qK0Ooi
v7s2sMgSiIw1IqvvHsuy70VSAU13JTCMdg6SI+TN5AIWJvmWifpxI/zhtONn8nb6
Dt1LGDCSTiMeU41QHhGNAa98FaQ21vXm9FQuGRkFLrS6YaXgRkD1egsCPZQC8ERa
vI49JdXz4TGPKUNj+kbNUGy1KiaBkisrpY18gGsirOFqNqgKb6tjQXhv5VWFCFWC
0GGXILunRQurjk1wjYVt4ai/Cska79A9SZF5pFYhfxLYJ7Hr7p9FJcFioadEj+n9
UQdg0GNDYA7ItfW8dnKAEX6QCHBZaX/3v0bjieU7FHZrKgGEq58iubCHSx+VYfyF
8QipjdZZo7oyHocB/mbgfeHqoQb7Tojxp7h4vyJWco1ADocvO/U=
=JHhN
-----END PGP SIGNATURE-----

--1lE8SfwvMPj46qiu--
