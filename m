Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DCE45A05D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhKWKk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:40:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:48674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235412AbhKWKk4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:40:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4415460F41;
        Tue, 23 Nov 2021 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663869;
        bh=QHPy8jN4E1B6G1qlFMQZYM3JfIS0NJHiirezl0NGSYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQkqrWq/91bwWfTJ+FncjNTp05bxlwjpsYHP5aGvyhnHvIH7NmNtG+Zj0r9lLJDSA
         8rLuK2Q4htdkgoVFieW5deI9gpbedN46dWJGSxQNfv4qB0WG8KLiOMon8+jhCWp7xd
         LFRJDrBdI6SLoaoA8R/wxWCHPQgD/r+kiRyFyoemyW/iDjRMLUqQMqlxbawmm27Pe2
         XBVXHvBt7AG7mFu03C63x9BX/ej7KZjzepQKUHO3CVXJhZ/2F6spXnyDmKONlTZzxe
         3vnHr6x/TUGugywrbf3y/8HG9yI3W2DAPXDOaZbS2/1zQCiDt2Fz4QthUexHkgzeua
         MgCfqMhs332vA==
Date:   Tue, 23 Nov 2021 11:37:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Deep Majumder <deep@fastmail.in>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Docs: Fixes link to I2C specification
Message-ID: <YZzEeeVuI/8hLxD0@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Deep Majumder <deep@fastmail.in>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211119061401.19852-1-deep@fastmail.in>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pRh1ykX5gp1PIsDE"
Content-Disposition: inline
In-Reply-To: <20211119061401.19852-1-deep@fastmail.in>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pRh1ykX5gp1PIsDE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The additional link is
> not the Wayback Machine link since it seems that the PDF has not been
> archived.

Sure, wikipedia uses this link

https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user-guide/UM10204.pdf

on this page:

https://en.wikipedia.org/wiki/I%C2%B2C

And I agree with Randy about saying "cannot be easily used" in the
commit message.


--pRh1ykX5gp1PIsDE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcxHgACgkQFA3kzBSg
KbanHw//eACvwAeblxDU4KVBDD9Qr8utMR7hjptP2NY0psSC7FkWGqdfnvbQ7oei
iEl86HWQxaLGlRvEtqV9MkdLqAPeCjcWa8gdDRMEHr5QMQEpxtAmt4RqqzKsVyxG
D3+arRkj3BjpGkWJfLclb1Y3jkdEz/hxVkTkRypDYwvCv02kco1yYP7nkMTXPXrG
inwRRgVNTjkC9aPhKzZB8d3k59K6x+Y0aS85jcc52hIanzERU9u92iZsWKOc/PUX
Pcc46R4Vooazyb3cd7TU3XuHoVbval1tV+p3HlfqTcUZhPUYJgE+QbEfztEXn2q6
8ztqPvKwXzjbRimjmQmn8044edQ0YVApsYh2NhxY9Iq10lo1jAdSkHc6LvYdMJVf
e7j78eXoRP3vA+2IiGWNzVaKxTrzQn5xfAeWvNal72AP+jVSqV1ULGk6JlADasFw
6DIIUz3fbpT3rJMw1Qa6zYH0u9WxFmi6TKXD6z7v+F87947zI3Zd+Ez+Hy7oO039
IHvIYYcFNgwQZ4pIHvLjiPKW8KvWzgDu+6wwK2GiBMg2CFXCVqCVYhjYbXbI1Fdu
inr7fZDZHaoHukEDVV2QCV1noDsnFUoiH+wEZlnykXCxrH9QpCzdyDsncR7UErKL
N8ukFeyi8JVc8sqWW2rWXR+zdA1WVzyP9WnsDCPYja6A3nrfjJg=
=b1k5
-----END PGP SIGNATURE-----

--pRh1ykX5gp1PIsDE--
