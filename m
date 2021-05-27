Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FA8393659
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhE0Tgl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:36:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234834AbhE0Tgk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:36:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91BD96124B;
        Thu, 27 May 2021 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622144107;
        bh=gNRnh/ZYsEziysFzw+iGHZH5+ZnsCCJNELb7hV/a/EE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rXsCRwWGbTa5aSeYCC+YO775/JLth1McM9IUc01MtrydEEPvOOfcw5khJ5NBjRgcO
         oU76gk0Y0UMSPc5rKJyy+XPmL58DnQLGGvquvCyZpPxUebJs/vMQzFfGMD3JrhTdbv
         Huy/6jgrBy18ZcILOFx7akpgqCNd8KXF+eWZOzb4yL8z5Cx0nDdjfeoqZ3BRIFmkA9
         OnHa+axPLRR2lNT/nTL92NCYbaPj7UljJVDePM9Rpm/31fUHpkmO/zY66zsIc98Duk
         6yber8eMOWhnfvoEdS3gYPClWkHu/T3xRdaJ/iPOC0S1fgMLe4Hj9jxXNeXK3geG8D
         1WPUJLrJSnRnQ==
Date:   Thu, 27 May 2021 21:35:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 13/16] i2c: busses: i2c-st: Fix copy/paste function
 misnaming issues
Message-ID: <YK/0Zhetnb5+msqq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ECDFn6VnfNGxwXBs"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-14-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ECDFn6VnfNGxwXBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:01:02PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-st.c:531: warning: expecting prototype for st_i2c=
_handle_write(). Prototype was for st_i2c_handle_read() instead
>  drivers/i2c/busses/i2c-st.c:566: warning: expecting prototype for st_i2c=
_isr(). Prototype was for st_i2c_isr_thread() instead
>=20
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Maxime Coquelin <maxime.coquelin@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--ECDFn6VnfNGxwXBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9GYACgkQFA3kzBSg
Kbbi7A//WQ/NQI+2/eqPz8CB5xFbHflhOjAOk8oV11vJ98IPHHt6POIuGYRb3eQI
v51DWu/O3Pb8xxMpZoJ3qrldd7IgrsemowQmcxhdV/xnudEXfZmjT9tpQvRJVb0Y
ZgeiTsj7cOHg3rqScROV92PXz/9QW6dMsAqNIFXYaG7EN7jaM9PvKHzTCtHwIlOw
7CimSL/04pEIIY5mHkI6loqLPepHHITMa0h9tX88UuwzFuHVUdMQSgEqdLrSblUc
Zt7MHGdeSmXXgJvtxrcgK8ghb6vhB18tFojUXNmsJa7StRwZXPgcs5zoh3QVyaQr
eTuek4Yi4nw3utZWal81xcEinc9TTIwybD159/o6OPK/cicoXvy/Nrjz1VTT1pQd
AjELua7V18CMTCbKfdc2TrO5yGpYbaOIKxVADkBEHMrfM2nNdJsyJmn6ITiB0tk3
4QtuTv0P1O9NE3KQyjbyjSvvubhL7GYwIzztiqogGX5Cfvg1TwAUlMMC6tAkNNCl
1ihoVs493t4zZ2UCV3gSPzG8sXIouz1D04LiNRT0OHRx8Q9WGbKt3b02O90EENnO
/NsIHLe7c/Ss+/kijW3lgkIvtU38c5vqyM+4YYzQYs3mVLe6bQV3yY1NEL2oldDR
LWFmSJISoSDf2g24WXp1Ld+ytxrODZGMgawhMshflGNkOGLu+M4=
=1RrF
-----END PGP SIGNATURE-----

--ECDFn6VnfNGxwXBs--
