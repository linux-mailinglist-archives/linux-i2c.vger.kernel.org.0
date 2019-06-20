Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EFF4CBDF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 12:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfFTKab (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 06:30:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35187 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfFTKab (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 06:30:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so2491152wrv.2;
        Thu, 20 Jun 2019 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=owokrRNK0Zi2Bsb2Xuro2mxPfcj4PsE4YMJW0gn1uDw=;
        b=YxLr3lcwJHQak3aqif33hw/1EfmtsIHcEPQENBPqLndK9hVD/cts2VEMg0vjeZc14o
         s/Rm/PHsc9QGN76ZlEAMipcMSxlwh2YKBgGelpVYU4h1Z69r4poR9F/TDt6J4HKYxr27
         AT1KQ4cK+egJfZK01dFCq66F7kkIRXVobuhbIp+DqpQAkBMQCgJtAz0EGYhj3swkNYwb
         Bx/r1sH7VdGpRISamfeuDvlUk4e+a4PVlA/pYZK1fu07GEyoJVJvMl9OUAhkmWHXQQy2
         Q2UvlDl38wtNwYjVn9bp/g4LlDpN/Aw55S7Bl9vQbF9Gaqpy2o+9ypC0tLlIEcd6gXWK
         nmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=owokrRNK0Zi2Bsb2Xuro2mxPfcj4PsE4YMJW0gn1uDw=;
        b=kRi9ljmww9vzvzfkGbLRGxPhu2TseQqp2yHz4mvXcz42S/ROhmW8bt3hByYqGEfr+g
         v0VayCDOj6QhXzpXK2B/0cSO2mITmpnxu0bkmuyLQAVYAPapO0bZ7vMVmRG91hyN8/D1
         yBvSEDWjQT3Sbpjrqz7xuaF4/c1HPmHkQ0Go2BEduJR1FdnDZrz2hGpcJexDvk/NKBDE
         9ma5HFCE2UhuYkep8cc9DkQDpRXRDtdnzoZ6i8tGMgqXmQydStnzyk9ZTcL8VBP5ixW5
         V/xAd/PojEg7zDacAHVoAze6G5AlgFivN7oWTq4VYUxonNgMuFUbF/bBJ9o4FjJfBRUY
         X9BQ==
X-Gm-Message-State: APjAAAXZGs9+rMMbv6kq3j/NGkRHbI8FqAd1+fwIDL2m1pFH+206mCcc
        gIq2ZJJFRkOVQUPlFyFAY0A=
X-Google-Smtp-Source: APXvYqzR4k7THbgMN7+pjORuiXLdd5zoxC1Lgis513ucLLXvsbQoRRrkcKJdek0n+IKA9LRI6niTyQ==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr67649654wrn.94.1561026628462;
        Thu, 20 Jun 2019 03:30:28 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id a67sm4705772wmh.40.2019.06.20.03.30.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 03:30:27 -0700 (PDT)
Date:   Thu, 20 Jun 2019 12:30:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
Message-ID: <20190620103026.GC28703@ulmo>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 04:09:42AM -0700, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 47 +++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 39 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LYEIACgkQ3SOs138+
s6HbJg/+NQD27bmKZrCzUK7vAXwuLegaM2bwf05Oef7h97iDtPkokkYDCRqeIlyh
9DK5MnHOAesPTgJBnrAB5+5zcI0EVthgi1QGRcQ5FmAuUElJBtbImnUVC0ky6Mxx
349RLIaYMPWskOxiPLLo6hiuVqe4h1KaQq0yKrLFk4UjvhHGIRa2OvLXMpUgnmSz
jGcjnSI0wNXDOkiuGLMHsAeL/UDHvj+r+omJLz4N5rcD62p7d+JUJ+0h5FZSNutj
T+eepY98x3DVy8Kafc7UJeddwHlaggYtGx4neX4LKKUwxle06lkWZqpz8kp1MD3D
I7I47AuY+YdqMb1FS6+dAl2FGfd+H5qSkjzn//2TLS2rco3oZR+tABcRC/KqSNxB
oXihIrV80rhVm7PRyZLyTs+rsOrQP/GKZf4AeLRbJECgNSldocqkLvDCAWnY1KTy
woXVGlVco9mihisM0gflVv/9EcGWuV+wmObhTYbxYL4QhWOe57BGqDXkCqcu3AGU
C2TVTloPFg3vmB5lZFoE33A5fC1Q2mIzBqi9nEFHEbVRiYfVm81lSGf4Zof2Zslq
DR/tv+RqDJ4bzwIpruVYj6sZY99VEodvTUTqxqTlijbPYY6pdJVkD++zypnFj7tx
jY/H2lDmTTVX4SBzCec6QIZ+VPsdBrAh9xAJwAEyvRmxtoTCdUc=
=i6uB
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
