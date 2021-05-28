Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28B1393E62
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhE1IFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:05:17 -0400
Received: from www.zeus03.de ([194.117.254.33]:50654 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235640AbhE1IFL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=VXoMljVzEVECXgf9hg23lFboUn+W
        cDV1QOZKJ8wCwiw=; b=lgsBQ9tct0/9jmHNfPbqEzEAkyAuccG9HDUIr9BOemcf
        2r/FVjPp2cjBcAmpWaOB70nUcQIOz+XGHWNRlOVZkjVIf2pGuHeOCcEa0+j4ic2P
        3f1ZwqIYu8SpzJEICwmDcDRAl5QEARIs/UOmmWqouyPstLaqJInP3cWk9f0fDl4=
Received: (qmail 2275190 invoked from network); 28 May 2021 10:03:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 10:03:35 +0200
X-UD-Smtp-Session: l3s3148p1@6HEJUF/D3N4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 10:03:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: r8a7745,r8a7794: Remove generic compatible
 strings from iic blocks
Message-ID: <YLCj11FAJuIyTnIC@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <cover.1620139307.git.geert+renesas@glider.be>
 <CAMuHMdWJ40hcw9L=MAKH0dTByjW_a8NbLxZ6GDV81MiH+gAk3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T/jI5RAeG32tZ8Av"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJ40hcw9L=MAKH0dTByjW_a8NbLxZ6GDV81MiH+gAk3Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T/jI5RAeG32tZ8Av
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> While drivers/i2c/busses/i2c-sh_mobile.c already has a match entry for
> "renesas,iic-r8a7794", it does not have one for "renesas,iic-r8a7745"
> yet.  Hence patch 2/2 depends on a to-be-sent patch to update the
> driver.

For the record, this patch was never sent because we are still
investigating the presence of those registers in IIC revisions.


--T/jI5RAeG32tZ8Av
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwo9cACgkQFA3kzBSg
KbYPAg/8D4Yj2kaT4/LWhAoixE3PjUzuhzmQyhYj/UietofbPwyRtrftEW/lr0jR
SLRKVZK3Uc1C+tN594MiKDqhW7EO0a4bNN/PJmjtN8qlU21pmqFZdzHIwN/64NYe
MTw2cNlQXtvEDPpu+yTTAQSUFCXxBtYt4XwI2e8yr02zEGvgvg50oi1kzZAeVMaQ
vc93IaotHhtdOu2W8ljx/3DObrIw3TptnZlXZofqQlgdD+YU7TXw50NrWMPu4Hv3
cSUk4fzsU5DQGlkkgSArHRp8UnHJEWe0YsXe8PsZ/Ff7axIw+sWVfKHDRRlFBkpD
VOP2LfXcL5qImv6isnteDoXzED6jXROX14/PLOW7MfjgQiHynIiuqKm2xEPSQsuu
JShoiYA/EGE0/QaoREOpoi5o+SGU99ast92TTiv32s2blq0LAayFmSr/dNaJS1J1
Cf1CwLHdoAH8hC0O8sefBZHwFuLrP/4lCHlosjjxyZbLkuf21kb4TjFPwFj7hpfK
rTdEd6pISSXghRqR2Ewi1+S5gdZldX2MIj+rkU1yf7J3uSQL8/u9VZ0/LOWFw4Ww
6dHw+PkwDFfUijNyrcQPWfzZaAuNzFhftxpyDvw8wQxCfLS6r28ylm8HH1NLcyuz
OiPRCVquq3d+/F06tW7Am6RBy1ZYlqiO+4swW2auwoM1xQloteg=
=hniX
-----END PGP SIGNATURE-----

--T/jI5RAeG32tZ8Av--
