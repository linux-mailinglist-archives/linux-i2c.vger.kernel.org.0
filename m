Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEA1412F0B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 09:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhIUHJK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Sep 2021 03:09:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230121AbhIUHJI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Sep 2021 03:09:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0FB661183;
        Tue, 21 Sep 2021 07:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632208060;
        bh=PnNXUA5QkxE/YBuCO4ulyMuymuvyGquMaRJZ5y8ElvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmUmiWw4bNJWrunaSJDu/Ctn0ze4ubX/dmFCyB6FJS9noByuAOCVWX+Uxn2yy9yn1
         GiqrRyIVgD+sZWAHRs1QPy21oOpJxw9V4wAW8R+ipLTvp4IYNYcuMKd2XRuscC5Wjr
         D5xPgFHLsbKZgaFrJ+91g1krNZAp0XbBIsD65gcqoVRAJ74ojXHU0Chd6MMHRSydev
         H0G7YruhbVNUyOkrHrJtudU5PvIFv7dWgYHjHzovsvn2shGpLumFelk0AijqcaHGTu
         OG75PbSTQh7aAlP+W/e7MLbJ0HcIFfxaYNeir4JDRvW/h0U/IYuUmqx6+rvsKUzU1f
         qGVbdI0uWE6zA==
Date:   Tue, 21 Sep 2021 09:07:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Steven Stallion <sstallion@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Introducing libi2cd
Message-ID: <YUmEufe0eUPB+SBA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Steven Stallion <sstallion@gmail.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <CAGGHmKF6HH+0cQL9_DK+-osSLFJodQODpaaxxF0r0HYXqo82Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UZ0lAP7Ok/hqUVf"
Content-Disposition: inline
In-Reply-To: <CAGGHmKF6HH+0cQL9_DK+-osSLFJodQODpaaxxF0r0HYXqo82Ww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UZ0lAP7Ok/hqUVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Mon, Sep 20, 2021 at 02:19:17PM -0500, Steven Stallion wrote:
> All,
>=20
> Over the years, I've had the (mis)fortune of needing to write various
> I2C userspace drivers. I've long enjoyed working with the i2c-dev uAPI,
> but it does lead to a bit of repetitive code between projects and
> testing system calls is cumbersome at best. I had some extra time this
> summer to put together a small library in a similar vein to libgpiod to
> help with these issues.
>=20
> I was curious if there was any appetite for having these sources hosted
> on kernel.org to reach a wider audience? I'd appreciate any feedback the
> list may have!
>=20
> If you're still interested, here is the introductory bit from the
> README:
>=20
> libi2cd provides a simple and straightforward API for accessing I2C
> devices from userspace. It relies on the i2c-dev Linux kernel module and
> is intended to complement existing tools and libraries, such as those
> provided by i2c-tools. The design for libi2cd was inspired by libgpiod;
> it provides both high- and low-level access to the underlying ioctl
> requests and has no dependencies apart from the standard C library.
>=20
> The project is licensed under the LGPL-2.1 and can be found on GitHub:
>   https://github.com/sstallion/libi2cd
>=20
> API documentation can also be found on GitHub Pages:
>   https://sstallion.github.io/libi2cd/

Thank you for this work and the heads up. I'll CC Jean Delvare who
implemented the library in i2c-tools to raise his attention.

Happy hacking,

   Wolfram


--9UZ0lAP7Ok/hqUVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFJhLUACgkQFA3kzBSg
KbbxWg//a+Uoa0q9a66r49sELon6VCNonaINElY/s0ElrkLu2piOsSj3G8vZ2zdy
0SgfybProsjfTdL/nikDg3eic3LJ3EaAmer1vh0vVJsWkxPLimI+EEDPwPCgybst
iIAISOfXFGBK6CYvFeGscj8DQu/RcAqnAASiLWFTII7oMfI/5OJg66/Ilpb/Kol/
osxtcS7SX6mDH6Dj9XbmkuxtYioyJ60DRxkEE1bTZFhlyS651Ejh7iBjP9Fd7Zh0
za4+jKrqIPgRhKdWdI9PnHQNJAaKgq0M1SV44DcYjCzU45c/g15m8wxPRHatjqIe
2llmoVNflj7z6k3J8LOea3Xm1RyO62WTl1l7lGKRs9aM1bxBGbgMOFTHtR3D64fT
jXs/p+GNdjloo/6AwNgqo6OPW9yTiAXTQGrpuVqvVATCrttPTTDDd/oKuOU33wBI
khsuCZYxPxjAUVcvF0XgBfPvUesHl10bXgg1AhfDgG4nDQdLQD2wfmXQ/nvp3Bbn
lyaPPeBLIQI5+37fAqCt3zuKAaRDX3RD1A419pguInKZivQz+THdQ+UJtYvz5lZQ
/zzc7r2gelcTm6GRw0wj9xC1D12n5DCBMTTJuPNcVp/D8+rNPe72nDrO7IRCfaHh
k/L+ePrAfVynjf/RIQRidXi/PzD1huVV4kzMw3sWFN0FTNxPYbs=
=ZqqW
-----END PGP SIGNATURE-----

--9UZ0lAP7Ok/hqUVf--
