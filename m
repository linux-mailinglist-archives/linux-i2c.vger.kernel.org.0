Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B3441FA4B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 09:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhJBHc4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 03:32:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232457AbhJBHc4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 03:32:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D37261ACE;
        Sat,  2 Oct 2021 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633159871;
        bh=AfSwbh326VH5ih2OvGg9tgEjvj6so5avAy8i6A72/6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ungqM0anqIM7VnCn9rkUrLdABHxKy/DkI7ZUk3xUwuqHsZ+PUKj8yEZs/wGK82xoj
         jcoUt+B4QaOf1jwEjYRFSL3Pdz2Zui3lIYPnV8siQI+kTcz9/Xg6uSzi80aN3vbNoH
         N6jQh7/yKI7ql5cjp8p7jIBWBJk+ufl47vLZGHa6nxNusDwTH52Ew5qdzIBBD7QGdu
         2iScnw1wDmyEU2xeQxOhg73/rnPuuhDAosYbkkL7yhNjz7KvLMBqzvQSUFTCNmVO78
         QG0wZGwvJGC2XiQrR/0Y1MKz8s8cM0ASaqoQfLFnMpMbl/KFtAeFd/MBRGafrEf3y4
         QULtIjUG9uN7w==
Date:   Sat, 2 Oct 2021 09:31:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: pxa: drop unneeded MODULE_ALIAS
Message-ID: <YVgKu5IEr3kvdM1n@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20210916170517.138035-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ua67x3+IoRzvlqc"
Content-Disposition: inline
In-Reply-To: <20210916170517.138035-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4Ua67x3+IoRzvlqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 07:05:17PM +0200, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!

Good catch. Do you want to fix all of these duplicates in the tree? I
found two handful of the same pattern and could assist you in removing
themt. But I also don't want to steal your credits. Let me know if I can
help.


--4Ua67x3+IoRzvlqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFYCrcACgkQFA3kzBSg
KbbOpg/+LyUCXip8qXBqadH+/r1wRXvNbmat8vhPdXPN4l8zxuxxtZISEftdSdKo
vlR51k9tkl9Zn1QV+TvETe0ToKBC19l4FSJ4VZo9g6zT/9Jp+flw/+tev85zTA28
HXYQNBIYZtk9ebbGPNsvOlW5bG4FArXm/9dqFNsLtC26xmG0rMT4E/zwItn1A1xq
aRbYWxe6smLRuhBL1f9Lnbc3CIjys+Gv5JLn8a2Cdnj0VrCgVq8UM+NGqCoNschT
A8T3WCrEdF+2IyIsEj8dehmKAf9drW/NAbr9YLxKjXg/Q/tkykRrul115pndnnkP
xOYiBxZp/qmLKR9tMwmJ2JB4B+F2qkdm4V5x6atmAqzMCY47+lNsJry0ZgxVFdXe
94HNC4fcfRmP55s4GB8wDjV1K1h/Ry0kWHxcWxsq1pqBkp5gmOrGtbptxTLCB5s8
722XF8Tbcg3/DjYuG8gQ8yB73jMKD8CW7uSDOrmuS3zZjyyvaDakqBtlEDFBEDOo
8t6SKask1Zvp9cKOg9RcuJXc8QYJHSJlU1AcdRiY6oHE4/A8aJt7pghi6Oy+yN8m
xohIXLziwVlO9GK4Ah9WYSCbskKcc79beJmTZmWhUrVsH9CqEUX0v+mAju1UuUys
xUZVj3b/1zx4FO7RAhXeNbhr4jU/bw3M3UcmMFrsyYFiqi42dRw=
=OrKQ
-----END PGP SIGNATURE-----

--4Ua67x3+IoRzvlqc--
