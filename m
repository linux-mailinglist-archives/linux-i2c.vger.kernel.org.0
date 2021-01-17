Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F9E2F9226
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbhAQLzM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:55:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbhAQLzK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:55:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 456F2208A9;
        Sun, 17 Jan 2021 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610884470;
        bh=P/l7DcbXXThfMa8Bgtb8IcRN7BkhTfOynj6nvXtxxVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uRE9y7p9aWuxvDv6xRwThTLdPejk77WTQspD+ac760kTW77HcjPK2xjM44wSnJS6g
         YUKPcln8Ei9Aexngj5eejX/yU/o7kuRJ0YeymgggMh+dDXNSdDZrQdzooTAgnkQ9Sn
         gdna3qyyEHCiyd32dcP7Uvj9cfs7DeLhoT7kV3SiIm1aA165jm51ub5h7InkpHjy3o
         JeJ0i6kPNDEabg31Clma4wr2Suledk4AgDmacuA6AvbVNYbL8o3b+Vm0UKekxhFeNu
         rwbxnOCqMTrJ4y/5gccj9bvkj7wUP2s5ammfdcxNEsZVMZmpzoV9f/YxWkblL2J8in
         DcE11TBJlb7lg==
Date:   Sun, 17 Jan 2021 12:54:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
Message-ID: <20210117115426.GH1983@ninjato>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7J16OGEJ/mt06A90"
Content-Disposition: inline
In-Reply-To: <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7J16OGEJ/mt06A90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 03:40:25PM -0800, Evan Green wrote:
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
>=20
> The i2c-parent binding is a relic from the days when the bindings
> dictated that all direct children of an I2C controller had to be I2C
> devices. These days that's no longer required. The i2c-mux can sit as a
> direct child of its parent controller, which is where it makes the most
> sense from a hardware description perspective. For the ACPI
> implementation we'll assume that's always how the i2c-mux-gpio is
> instantiated.
>=20
> Signed-off-by: Evan Green <evgreen@chromium.org>

Applied to for-next, thanks! The code Andy mentioned can still be
refactored later if new ACPI helpers appear in the future.


--7J16OGEJ/mt06A90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEJXIACgkQFA3kzBSg
Kbb1vg/+KdOXIWsXRKhM/WY5e4lYT/wZh633lzos59SDuTmM4+iILPjJDN6uQF4T
bDKKwePHPafdhuTAyv465RrAHgxJvDoS13ZYgZqT89kfVd2YnUrdaixRIaSUkgXj
nH2cJmMN67DR0srGOheyqBqiUYvQKaEKrX7lDHjf4tu6wwh/kkOkaVzjM9ie1Jp1
PwDeYmtpmGntIEaA80xnbVV0QR6TtbC+DPx8A46+gxSpinsAKJQzP32v5FmP5DPG
/nxRh6YQyadsCfv9g3R48vFhKinr6LhEwfSlqmNWB8+xwSA53P9vqF8+yW6g+jqp
Jx24xk2g3XYZS5ZfjXriGV6wKAfgtAzh5ukazlF0Q9c36z6OT/x3oDBZZOarYsUZ
q7osjT2jlDsobHE1eLP3MAtQp1+X0MaDOrl4gy8WIi4SYAMkHmTxv53hXhw8lTbi
X2ZBJhuem+xk/EDtNCF/4FjjM9I0Ule6XjEoMT7yuKjeq0IvCJfloSHfte7UR85P
Id4FjW1C9mcwMlNITl4ospzBSMwb4VsP2G+MhG7ZG0PODT3j1pi3lxIH9xsZFxD2
bo0KAW61LDC807U/PRpYDmR86Agv3zYQww1KmhRv3OFzob3OASeV1hk2nNvUFAVC
yFURvrC98Sx3lkFLm9knsIrzZgQNFqxj3XETnYwsaEtqjou5QkI=
=YX94
-----END PGP SIGNATURE-----

--7J16OGEJ/mt06A90--
