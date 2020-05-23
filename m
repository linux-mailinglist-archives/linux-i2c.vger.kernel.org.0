Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F9D1DF6BA
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 12:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgEWKtJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 06:49:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbgEWKtJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 23 May 2020 06:49:09 -0400
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 114212071C;
        Sat, 23 May 2020 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590230948;
        bh=PwN7sbTfwjxokBMf2pQ6vdFoh1qOEfNMu3Sb2acCJLk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yqU8BxaXnxk5yfChKX00KjJi6wXK8AyKSi9Ck6/1vjD8GC+44IkzsTpsLfB5cru41
         ub+p9rhbNL/pla+G9KANF73zBDVhc2ZRXUsD5TAadIgiaJecjat+okf4qH2DodX98j
         1DO2+VcMYfxk9RmNAQk8s3A7NVskaf7RnGSpKIIk=
Date:   Sat, 23 May 2020 12:49:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 2/4] i2c: addition of client reg/unreg callbacks
Message-ID: <20200523104905.GC3459@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 07:51:09AM +0200, Alain Volmat wrote:
> Addition of two callbacks reg_client and unreg_client that can be
> implemented by adapter drivers in order to take action whenever a
> client is being registered to it.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Sorry, but NACK. After years of work, we just recently got rid of attach
and detach callbacks. They were abused in quite a lot of ways. I think
we can find other solutions to what you need them for. Let's move the
discussion to patch 4.


--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7I/6EACgkQFA3kzBSg
KbY8sw//eYS5M5Hm0dRPhWdFSAPvlR6gpu7Lij+OZODRclsET4UCmF1C4JPJEivx
XVs+jQuhJ+IEt0g8Uxp4xFVyCsPXH8Ryf/crCWEFuspbxsB8EK7CIV3dsPIsl2xQ
zlH+nE53j1osvtMm0eKPjQXv75/nDrjePqqz6FIq8DHcIkj5OJBFvCsP7eIaADXM
w72rJ9kGijPvwXgtigtDmD4wNuK46yRY1PkKH94f9t8qE3HbYULCu5UvkhjhrvPs
ZwaE0zUcquaYiMFj2zn9FYIBVceFKSEvajYwGKr2cMWYotdwZwf4SgKRKMO7AgWE
EEYdU9V/vIfHXMpEMFzMtv2qznWc1EHQBFQ6tk3El15KCc/DjGc2QywOQWaOJG2H
Cn/FOePVGd7bBtJSyaC+xxee6gShx01q6RhfeOI7GyBkAIt8pqJtKD9XeLeSg3zl
3Zjs1F5xZ2kYoogjgOJc+y8cb5Ht+STS84CfE2ZcbJw14kx4WYsIlckkNVlLS+vW
+AfUUX5pmB44cW304TPZdj9AN2wpKsKb5qpMOE8Grx8S3sJ/5sGAjhkjyp8o865b
bdTfS68nBRj4GpDQAzO7ugyfffPABndGm89RDrlFCeqJIn5WG3U2uOVAr3SCYhLX
nt6VRQ/O5/uE1pbDlafNleBv4NV8rzXC++jUyRGQqjT04vL7rfc=
=OrqO
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
