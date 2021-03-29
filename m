Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EBD34C565
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 09:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhC2H6j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 03:58:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231332AbhC2H6d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 03:58:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCA9F6195A;
        Mon, 29 Mar 2021 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617004713;
        bh=eknQAZh9tx6gv/Goe1A7cYtMR6Ompu6gofiQO/+UmgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXHWq97TJgLfu7p4qkK9sgfi8Vct43jBL4gjxFNzy2miXw0jxLLiSyNxnnJ+N8Itl
         /ocNUdqpfPIJ3hZEZ4l7P4bykz+uoi6I5Y6SNcXnAi932fhoYiUCe+dDK03iW/lGYF
         ZzTxNC25Wxggy0w5njHsbPJD36eEctOed6stOj3r1wb8YBKlq5fdxyEcfYTZ+FqH3m
         jchIgivlUDT3yPfWy4HLwdabf+IVfAnG0jwTazooS+OVlK6vBuct4vgCTm+ISMm3Ws
         w9MgsaBicHCwjNW5m637g3wpGxCuEUZoUjRD4fG+YbFam8cPRTi9WVlXuSrc64v3dj
         QuQo0bxEOR77g==
Date:   Mon, 29 Mar 2021 09:58:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     GaneshKumar.Gurumurthy@microchip.com
Cc:     linux-i2c@vger.kernel.org
Subject: Re: git tree to use for new I2C controller Patch submission
Message-ID: <20210329075824.GA1315@ninjato>
References: <d2537b26305bdaf89b427174568accac4c4eaf78.camel@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <d2537b26305bdaf89b427174568accac4c4eaf78.camel@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ganesh,

> I have a patch for supporting a new I2C Controller hardware. Against
> what kernel tree I should be generating a patch against for kernel
> submission? Is it the Linus Mainline or Linux-next or Wolfram's tree?

In general, I favor my tree to have access to the latest I2C core
features. As linux-next includes my tree, you can also use it if you
need something from it. Mainline will mostly work, too, though, because
using new I2C core features can be inserted incrementally, of course.
That being said, there are no major core updates currently.

Thanks for asking beforehand!


--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBhiJ0ACgkQFA3kzBSg
KbYGOxAAr4QIlEihDMRKijQBuOr/FV27o8INyiVttLy4mjtFQL4ZwDWRkYajN3Qb
QzFZsTogXKBPVfsj10pVs3ltcK52iQz38JjB7FnbxcIPtS1dhchkt0U8Ol/1CHqg
vQ7MzhSp888KCRIBUYqhD998Q4wWGVUHezloGPcnpgqLepjFGXIZTy1yYLsRh5sE
dq2rBxLqnTdPhy7l1kGj/bEO8uefbGfwbX97hBMKh7BuPtzeTIE3T19dzmiufcQW
zMLUD7+XaG/wnk0jOOCYN4pose8O9j2yd6ZczqZeZ8CPV+MOXitNihmPkB2HVBWP
nHq2X9jGfz9xGg/8rAwgidUtIbT/E9nadm+w4TEc58BCiC464W8gI60XF3G5tADO
fI3cc6R97AtnjgjuFVBrfr8LFiHWCwrNrhiBrgQcEOVnRsjW1XrXvA40nQtwhU7k
aEYX0suhx18ukr4Z/V32RmWF7xPHMep2b+MsNrjPGx53p8OBh5GBRtDdlwbfmBtQ
YfDvFExgnYl5coEY2j6pTSoduCiJEO9WUrBx+mtNTMy92aBsX6gmGX0z0k2+uk4S
dJnauXbRpMbQoP6w++oJO8BG04a5lv4lMkBFd7cVgxU1Isfyw0cgruLsOtNe8pl5
4B/g12aIXRcZRC/36kC3mSZ8Uv76dhHw2c/OKdUUUeBm/vNjewk=
=c3h2
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
