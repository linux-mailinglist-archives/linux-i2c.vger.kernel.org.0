Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECEF482431
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Dec 2021 14:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhLaNcD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Dec 2021 08:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhLaNcD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Dec 2021 08:32:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA63C061574;
        Fri, 31 Dec 2021 05:32:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C56BB81D1C;
        Fri, 31 Dec 2021 13:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C31C36AEA;
        Fri, 31 Dec 2021 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640957519;
        bh=qpeIwM0thqsMgvw3bNCKVT58mjFG2wJ3cyEmD9IDKiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=StQyN85OmN8JwT8GKBep0FG2XSoG48wu31JhqFHqBEXZqD+z/I10Eoqwf+LVmpjgW
         /IZ1yhRzjJcvH5SxuI1yZdxv9+jtRjdDRBz8Kx9F42ltE/pm9jzSymQxDyHwqgC9/x
         kh15jcFJwVA2g7G6KiT1TuL7mxkrVVfIb8os955Gsohxmtz7UBquadkJcE2XyCL+TY
         Vr2QbWaImvTkqjGB4jmr15kADLkRsVMQdISXNcSaA1Abo87IzzNskCoEzxbUVW7ZYV
         WTHhpgF1533PpCtc0kMWh5xB6SKVu24rf34EIZkdpg6zm+5yEDo1Jv2LaCMgNHnw06
         ePQU1UEKc/nCA==
Date:   Fri, 31 Dec 2021 14:31:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     viro@zeniv.linux.org.uk, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] i2c: validate user data in compat ioctl
Message-ID: <Yc8GSBr46QHEYcuI@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Pavel Skripkin <paskripkin@gmail.com>, viro@zeniv.linux.org.uk,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
References: <Yc4wkyr7QTs8ao5x@kunai>
 <20211230224750.15380-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vb2aL7dxi1fS/Li"
Content-Disposition: inline
In-Reply-To: <20211230224750.15380-1-paskripkin@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5vb2aL7dxi1fS/Li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2021 at 01:47:50AM +0300, Pavel Skripkin wrote:
> Wrong user data may cause warning in i2c_transfer(), ex: zero msgs.
> Userspace should not be able to trigger warnings, so this patch adds
> validation checks for user data in compact ioctl to prevent reported
> warnings
>=20
> Reported-and-tested-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail=
=2Ecom
> Fixes: 7d5cb45655f2 ("i2c compat ioctls: move to ->compat_ioctl()")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Applied to for-current, thanks!


--5vb2aL7dxi1fS/Li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHPBkQACgkQFA3kzBSg
KbZ/yg/+O3PlS7eGqB/wYCKa1QBaS10COgZHqpt10iiu4RiQx9ZX0y4Pclu94Q5x
LCqew50SPnKCLd/p5A1j924BZTvghPWwxHEjMoGzgxozNaETGY2Zk0nb23UQQHmW
TmPDb9APSlt+XNBQk71WdRN+xFQReJql4rJMX+7xHUZGXZ1z5KGydin8yfEBvZi2
IhDDJjjf85jaETgjhFlV6xi+0WCp159LMBgeY5Xy1XcYTRwzmDRUiKfeH9/WQ3lO
fnr9bPJZVXWLOS1LE9Nk0uKADguhcpg+aK1bWQX6DaIZT0ecNjnmkESfwGOmy9B2
W7kGVICFUvbsyZX6xj8zVv/o9YaOPRnkzADC6acW68wQ0rIOiiJn2eyc1C5jfKE+
y3f4ufggIwPXU6nX6pMK0ilYLlPpysAdnfpaJQEMo+75V0NC6u335tQuSQX0r7Am
9o7i4CXWaCUZkOCgzxX7PGubIZImeuboklZl5IhL5rgCXr54/vU82+4C2DWI08WU
IAfIS+xqyq0dXg9tglZ+AAtGytzK5qkA+le42t+BogCPFuHI/+JfjCWlp0pKn7fu
MHQpJg71w/sRIuj74aMiMU1ZH73Wv1CO8KgRoIjA2hAu8GyheiCvPhLq4m3F/z62
haU9Cljx56Qyzd9QdTnv4bYoIPDxqQ96DfhzKWOs9O1ET+I8MPk=
=E1ZI
-----END PGP SIGNATURE-----

--5vb2aL7dxi1fS/Li--
