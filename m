Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415E31F0E31
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jun 2020 20:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgFGSqH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Jun 2020 14:46:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:59770 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgFGSqG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Jun 2020 14:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=KMLSh2UfURcetn72D61oTlOE6OdF
        ooRMz6SLcFP6dQk=; b=puekgSe8QJadZ5X8CG/NdjPsGlJKr2ZcX9G07PRuRXVD
        fT+5LGKMr1ELMIeM7R25Ih8rnAdvfogowIXZvNvWf7OrsMbSbJRBAcsf1SBssaZX
        5v+EI755xxXz5MitKTBtGk15cejAekr+UaL8Re2eAAdteVUc++n1QQJDhp/YjGs=
Received: (qmail 2771393 invoked from network); 7 Jun 2020 20:46:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2020 20:46:04 +0200
X-UD-Smtp-Session: l3s3148p1@FAEV6IKneKkgAwDPXy3ZACQyXnoVRx3W
Date:   Sun, 7 Jun 2020 20:46:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: icy: Fix build with CONFIG_AMIGA_PCMCIA=n
Message-ID: <20200607184604.GA12911@ninjato>
References: <20200607182812.9438-1-max@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200607182812.9438-1-max@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2020 at 08:28:12PM +0200, Max Staudt wrote:
> This has been found by the Kernel Test Robot:
> http://lkml.iu.edu/hypermail/linux/kernel/2006.0/06862.html
>=20
> With CONFIG_AMIGA_PCMCIA=3Dn, io_mm.h does not pull in amigahw.h and
> ZTWO_VADDR is undefined. Add forgotten include to i2c-icy.c
>=20
> Fixes: 4768e90ecaec ("i2c: Add i2c-icy for I2C on m68k/Amiga")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Max Staudt <max@enpas.org>

Applied to for-next (i.e. for-5.8), thanks!


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7dNecACgkQFA3kzBSg
KbYwoxAArfkCxw9qH+Qy6A6Slh2+plQr6o4BywjoAJoolZ2/AleathzwM/rH7+g4
QkAuwn/daVjBkDk3BC4HGLh/1iHycpo5agr/EpBxAWGS+cLA58IKS1M4uUVFzOcV
DN1eUVUTTBj+XNzWYQwBngaE6ovbDobFGw82V1q98wmBSSt4vzXRZxLr+XAK+iz0
YzihJa6/K24CRQJOgrsOxCtibUkUkI+yJSb6WzG3QeDUVi78fgBwoO9CK7/As09t
kQfOPFaPPUFG38HyEM3FkfRvksYGi5f0/pekmcsm87B3CVEsOdho22rUAruCEl5F
mmMn0b9r8uqf11oSTHDQ4KsjmqeBcr8wzcQXyYtv6uFdmd5YkSQOFzRNfgmHwV1t
glafoz54RciFXmfuRNgOcJePQuqTYPS9Rd+8EwT2bDhqeV8I1jVRQt9txefYHvOv
h20o8PasqqxooLN0oLFZ1Um389IM8wllhs2mYM6o7BoswAztLSrtwaRNZbTdAwQd
gqfbJLd0xHtHS3Y7fthi7wLazDMSXFm/yzCQtk7LqzYPmhSCAJOVpnWWaprukp+v
hE9GedHD4LHzswVgznAH9fcTByulDwb/uIrY+L+7b0XVV4FZWYPu2xgNUdVnLKqD
ZMVLZwE+BE4F32uUu/e/hE7wpGYVI20Zjasu2YQ4OXQssJ/ZLCE=
=NyL2
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
