Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F733B52D1
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jun 2021 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhF0KaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Jun 2021 06:30:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhF0KaI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Jun 2021 06:30:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 188496162A;
        Sun, 27 Jun 2021 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624789664;
        bh=vVw5PZgFN+xiXyWsqG7wR0O+gaVJo4vVjfd2eqIso80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sis793UlgHMkkbOCbvj0kN5C6nla2o+iQshcI97DFaNMOiX5TTuptWVrDtgMOmYo8
         23WVR5t6IkXIaO6MH4L45lskJGsYx8wpDAfb3T0upBBAQUhM2VFj4SblWVqoCM3Ufu
         Mj+YtSl2tbHzmVDaIP1O6o8Pyd0SvHZCy+WNvuISeVpnU4eqCeYAtkj5BSwFSoytJW
         FEyDfhf2WIvXjI00IhS6a7/9bE6ZGPRBWXZ5wMAa4f7s+Q7DvV2gIVm/VQxlT/29jw
         9JMuwDFmCtfgEJmTtIOgvaS4z9Xsz0+6NbQE5TCYLqE6FoXRPtCnc20Skl810FFvfT
         fGJVpiK79rBiA==
Date:   Sun, 27 Jun 2021 12:27:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Crestez Dan Leonard <leonard.crestez@intel.com>
Subject: Re: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <YNhSnBcspC276w66@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Crestez Dan Leonard <leonard.crestez@intel.com>
References: <20210608172338.0cf520a1@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xg2KXkE0Ca7EKXOy"
Content-Disposition: inline
In-Reply-To: <20210608172338.0cf520a1@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xg2KXkE0Ca7EKXOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The idea would be to get the first 6 patches in the upcoming i2c-tools
> v4.3, and apply the 7th patch "later" (either immediately after that
> release, or some time later, I'm not sure).

So, my tests so far went nicely and looking more at the patches didn't
reveal any major discussion point. So:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I'd vote also for an early removal. The code cleanup is too nice and
i2cget is, in deed, the better place for mode 's'.


--Xg2KXkE0Ca7EKXOy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDYUpwACgkQFA3kzBSg
KbYYdg/7BvQtfzyf26yb6q8FRvuqQ/FirGko01DeLNIA9YW+adC0/MNnonjwKFn8
7KtM8F3n678xBntNzZbon5JCWt2h6i1RmtVMN3qGAbMZ0oNHNXysqEJCcHCa01Dm
R+ts+0EO0spgByEusR24OWH8V8TJlizIpBKWduLz1MGP9OZN5A6H8SDPYzR2z3UY
ry5NaiRYOHeRhg+DPGFssW30lMpK+ejRT1Jjm34yBhR4Dx3IRpzJKwZSwsQpzuF7
EyUpHfmrSTl4vhGOamZhC8mmktaK6SrWUwITFHO3+Ocj2qHb9ldcVflvV8CVlM7y
2mLGHgm21++4G19xn/p26yMyrA/uMMp/H9DWX5RvHyGQ5GP9BggWBtHascvkE1OA
lQ2y7X5KXifNC5/ZjGMrsxr+gmI/snaVmPuHHmC0yMuq8ZF1u7yb93iABuEjrz5p
nZDy5b6C1fDYVXmJgO8gQL4a72VRKrHUrBoAR3pxcW4gRR+hDfUQecNSRC8eSxuN
R/NVi8WCvRGBhPHXNxjPS0YEDxClWitgMLX5SX+M8pnQ9rFEaEhJZPX1eYyFUNxl
VxZC0dB8t9M7UnlUXhfRuliVowo3AthzZEwrTOcjsY3a8e/fIH53vVH0FLR9WvK0
ZeM/HiQ/8f0m2RIffIhXuq0dgoYfwf3dQgrj8FNIt8ty1VJiz58=
=BIVW
-----END PGP SIGNATURE-----

--Xg2KXkE0Ca7EKXOy--
