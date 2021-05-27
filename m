Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC669393639
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhE0T3w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:29:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhE0T3v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:29:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 985EB613C0;
        Thu, 27 May 2021 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622143698;
        bh=VZOoaPsOBzv8C0Yje3kVtf9Qi3JsLElEUzuvZK+Ee/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vQjP1hSYwvUXxqwlm6zXRmjeoYlz98LjCpIDUE0fE3l6SL/5yguvgOI96WDkR5Pf9
         KTdtfJPLck/uoOBdEvY3JWk19pMewLDX+cZtZyeGjVDjx7CSIltW+Hu8lP8CgIw0Gn
         45tfK/XcSjBhLpbxDVH7pVFup59GlQzKT1fzhnh72GU1WJDieFH92u6wetn3vX7opd
         8tjYlFrOqfGRTcyRimCI+KBCdjCwyzCgI1kEACyfHxKUglq2oALXtCRjIWDRKQ76+u
         xHDgFdlv4sJtSx8o65m3nz+BbJ/1kCKLY2L8Rpp61B5e5LiKfmAjFgcIntMnLrkWSJ
         eEshbBnUvgJFQ==
Date:   Thu, 27 May 2021 21:28:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue
 pertaining to 'timeout'
Message-ID: <YK/yyypWeOnBNc4K@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HQSd1tkK5Tvx9OXc"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-2-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HQSd1tkK5Tvx9OXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:50PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-nomadik.c:184: warning: Function parameter or mem=
ber 'timeout' not described in 'nmk_i2c_dev'
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
> Cc: Sachin Verma <sachin.verma@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--HQSd1tkK5Tvx9OXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv8scACgkQFA3kzBSg
KbbvexAApTusSzMqzrObkcrUlym0RePoV6lS+OKbzAZdQbvbWlh9eEbs96Nsaier
GeQ32L33gzmpKcTH1hVv4zMLbkejCfSxKsl4AoaG++A97G95wcUFEOplPFW8qC+M
mu4j+/ZiEwb8D9K/dYoX9L8WKTiXgoDO+WHWK/TbD5eMPeHU/s5Tcw6kMCnrDIls
NEyLfsnkI5V1Eyqztl63kmDXzK9Ni+WEPHytEwDcSFVchtrHIt9fwMpDD+KuCf9X
V2xX0L/krkh6uERDGfxWU4E2ujnTK7w/Tk8wEXFZfwz+ar1S9uAtsJCmwDCfX39y
G8EcuJAVGsjFIfFYlMQo0bWMGSkzjKO2Sjd5q/SCBhpc5FAml9jkVHRIGePwwXFR
1Lsoue+HJqIGIVaaFE6C278wKm4ZVdLiCoVYQS/unByYSuYXpYKV0KLa8vZOYI9T
+fsY4kB84fietcGXiPqB0Jnyp7HhvYm0xGJJhDYGtnPvhEfuPy40GcV2qfqXMtTG
hKNoi4JHzYoFS5rLFM2gnLJGDFHhCsDE/lAmV6rhzljfCcNUPN2lk7SLk240VGIx
dHuhIbSJiFu85Z+xuLfjvOw750QHygJqXnKbOAw3nYoI4eziy6KggzKY/I2QMu+o
kWsdglAELyv6fFgZ41KliiekkxiiFNcGocpP7pvWVFwcATEt8hI=
=Uacm
-----END PGP SIGNATURE-----

--HQSd1tkK5Tvx9OXc--
