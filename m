Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE835358EEA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhDHVCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:02:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232091AbhDHVCd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:02:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DDC761175;
        Thu,  8 Apr 2021 21:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617915741;
        bh=i8z9rDDdDV7hBs5qJqiCKju0kSeY9bCPPllda9z7oAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwuMcV8HNkLJ2lHnlnFS54AMZvjvgOluPUbTOYvwhYOISJ82lDNwa3v8YjCi8arY3
         sJIT7ZpFO4l1r9gI9Fl3OqzBh8ue84W/qx1IsPXo+Ii9H1gQ8HdYWMIRO0DGrv9Wfp
         bHxaYJwS9FItT4SNM78qP7a/ZJbGzyzX66LUDMCj1vKS2Kr0UX9VSPEyFkrneeQ2Yc
         7wAxiXYp4qytnHe7wbziuIBm+MQ0qr64OCaRHcgQUJUwCCAXoawOt8yosE9psm3LBX
         hM4aEhl9XgeHLkMCCzK6ZfL0I6wPI0J2axtFx1DLY6JTLdQ5Vr1MOwTqM+y+FckqsU
         tFjNz8VoDHsBQ==
Date:   Thu, 8 Apr 2021 23:02:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org, digetx@gmail.com,
        andriy.shevchenko@linux.intel.com, prime.zeng@huawei.com,
        tiantao6@hisilicon.com, linuxarm@huawei.com
Subject: Re: [PATCH] i2c: core: simplify devm_i2c_new_dummy_device()
Message-ID: <20210408210218.GF1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>, linux-i2c@vger.kernel.org,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        prime.zeng@huawei.com, tiantao6@hisilicon.com, linuxarm@huawei.com
References: <1617884260-15461-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline
In-Reply-To: <1617884260-15461-1-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:17:40PM +0800, Yicong Yang wrote:
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional change.
>=20
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Yes, really nice! Applied to for-next, thanks!


--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvb1oACgkQFA3kzBSg
KbZrHg/+MrWHoIiqffvToQ5Ox8eCfKHedLQa+E0YwcUwCJwCcSUbZwb35xHFRX9s
Th+3p1k7VDeiGvvl1EfgpbiBfZXxcBx82ZRr/kFpvi/WYdqrS1hhok9a7RsgX8Qs
UVuvmhq5Col0HuJsM0GDBUp5IDQbOiFcwzisOgdlHuivP8uiDGOaIDNYzwNwtwY0
J+tJGRCnXYtodJb5LSioV3rUq+uEzVMWAaU2DkwAKbSTyHrGd8rzg+XiGq1mrOQs
ZjXkjFjBHV59IKUIZQ4B7+bd18t6ic/7GV3WD/2nVrKZ5qHJpFMg0JFesXolcrNs
QtnIqsD2svlqLOnUxqMRqfpaFdFbdWlRL1mxmgPWTHK0s+5mp3yOLjeJPmWVt/R0
5vi1Fr8mBQmndH4H7NRUh81EKvU/fy/A++cCz4EF/SGwmqLjbK33+EgJmIIM+t4C
S7w0wunKEbKPVih3qO7PHDCcWNuRDTdaRHP0pJLuCjbcpXfgPqAB00iBprwFBN+9
CxCt4XmE+lizuYhNnxv3/ueooRuXnRwcdfHVsq6qyDVNFJNTUMtVMeiXvQ/AfXgz
QR8tjvLRZ/v2tBu2KSlsSDIbFkDmgE0kUB5fitPELZI/VVivKE7WngUn6W4JtcjX
R0kP9ECetEml0bDqPd3nIPOvpBJVw98J/o++3mw0y2wKsim3I4E=
=hWxF
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
