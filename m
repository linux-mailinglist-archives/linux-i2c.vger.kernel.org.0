Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6B6393668
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbhE0Tju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235262AbhE0Tjt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:39:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B749E6124C;
        Thu, 27 May 2021 19:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622144296;
        bh=6yCYrb3lWShCqZYfxBU/X/so5AzWEYFsM0Feb0Sb1yE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=NqxKvcsD2OT2Y0refy57h04VkZxL4T2ToC9MQY76pNz3Ew+Y7evxxdpJ26r7K5HQO
         5s5wSGuLW3B47jYIpFZiYGT1p5hx3kZIkK5DjULnNyd/zsLq+4xw8jMiq4FYZIDqQQ
         /vPqWqRKkcm1XBsSxpdIYjB1Fy81oXkvjU+oTKCwSrTj1S8b/IAmLhCyvn3QDfnRak
         m1MC4nIvD9FdiuVkHcOhA9Yg6q+RBE3evZIYlOIWDbvhcynwXIXCgEgk5Eixqq2n7P
         XIxd+BWkNdW31E5XmlGNjWYd5XcpdxpRYeok8yF7A3nBaua02NUDYR5DldcV0fw5PJ
         9y7vwoWMd9whA==
Date:   Thu, 27 May 2021 21:38:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 16/16] i2c: busses: i2c-st: trivial: Fix spelling issue
 'enmpty => empty'
Message-ID: <YK/1JX62ClfRQYfX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-17-lee.jones@linaro.org>
 <20210521142349.GD17641@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JCQv7L2LO5Px3hvq"
Content-Disposition: inline
In-Reply-To: <20210521142349.GD17641@gnbcxd0016.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JCQv7L2LO5Px3hvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 04:23:49PM +0200, Alain Volmat wrote:
> Thanks for the patch.
>=20
> Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>
>=20
> On Thu, May 20, 2021 at 08:01:05PM +0100, Lee Jones wrote:
> > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > Cc: Maxime Coquelin <maxime.coquelin@st.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>

Squashed the patch into the other one for i2c-st. Thanks!


--JCQv7L2LO5Px3hvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9SUACgkQFA3kzBSg
KbY77xAAgdbQSQreMsVlkRrmLqfbPB3NxMl4WrSUMSENNcBfY8Jn26sX378Z9374
yuD1JxqH3Ue4OQC4lvsP9N98DCQPjachray0LEEnZmtx+cIp97HYyF66niUg+DiR
FLYez/GaLnt8zPbUdJIk9VPTBnsPiuTGQ2xjGeOaRbp9XLi3c/KZGbDnBB1p7TTN
seP4o98LrZparAfk5btQ08PPDovz552ZY0mf7tYvBeM1kQ5uaA9WOxUSrZ5oHyOv
FZLLmFP34dJXuMmn2wYYvhqbm/7HSFgElOF5kDzqdJpdydLTjwNKcVT+3PTwcwlk
TyKDjvp9+4cs6USsXgvP4C8RA/bmyMFZQvCYxsaC//osc+J8l28/C55pgZbN1Cjf
XVE2cP1V+mpepcAXZ/CPZGIEK2uVRKSwajH1m8RpcUgU7hMHJMvZKaEc7nHOKFYt
/2CvTOc0HKMZjLrdl7SfyKkAsz9i2PTIzWhzS+8CywL5u2SYFYc3jhpkLEl5jYj+
/b9U9X47kfwK+6XUIPjpFqriNxVdLcxxUJbYOEhFlhNY3nNlgRoZdwfztxC6Eg4V
wI6QLZ/4dHOWeUcxYM8onEw68g//+A+oc8WrOb6c/AMRylt4nmf344Ql5hCptedq
BxwdbtNFVUQ5zhQuPqlLbvET3VO1U+H052sJQkO7Fd3cu2/7XY8=
=y1z6
-----END PGP SIGNATURE-----

--JCQv7L2LO5Px3hvq--
