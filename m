Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398862A56DA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 22:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732848AbgKCVbf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 16:31:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:59838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731573AbgKCU53 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 15:57:29 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A012E223BF;
        Tue,  3 Nov 2020 20:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604437049;
        bh=SKMZAGIqsuZOImZtAayRrPkfYz+VIztLb8Fv4Qd1DKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VRjef6+mDj3CZNtdwhhpQXal7Xa6+xqd6+sehXJe8BTVbToWpxrzOTcBySloXLnC+
         V1bmxiBGmYCPhTvF3vwTfhl7ERGqVJWOFLU4R0Nqe+wbiJBPlskWRP/AYfTP5IUTQO
         6s9fnLUpu6CMaIZ4jimb1Gx8zxDBuhulvmqP2ZHQ=
Date:   Tue, 3 Nov 2020 21:57:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 3/3] i2c: owl: Enable asynchronous probing
Message-ID: <20201103205726.GD1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <f343802a4b1a8ab6fc78e5db6d24a350b2319495.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline
In-Reply-To: <f343802a4b1a8ab6fc78e5db6d24a350b2319495.1602190168.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 12:44:41AM +0300, Cristian Ciocaltea wrote:
> Speed up the boot process by using the asynchronous probing feature
> supported by the recent kernels.
>=20
> For SBCs based on the Actions Semi S500 SoC, the overall boot time is
> expected to be reduced by 200-300 ms.
>=20
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Applied to for-next, thanks!


--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hxDYACgkQFA3kzBSg
KbaTwRAAgXLPjvKVBJD2bQkPMflN6/qPXDXM1IDxNM96rsHe/R/chp8q7JNN7SiZ
i3V6dLj6Wj8qXmY1LjTgvom3wYH1zIMJmkZQz0Y1oo/JefnWQ+idwmQqsp80390/
q/XZ+MET/Kf5uVwXJx7uDi7FOgTIpo6qrMK4oLch01ify7MxQbSoxjuanMxf3iIc
Vra/cnhJcuBHdRZLmInzvSGh8XBCLAx0nm8WZQmUmQF5HtcYDwxEdFRsWJ9bkHOb
urx+ixuw3BNNcO+Qlk1DcQ+0Fj7/8HSTz6TNKTk5gUFVzqHYkrsJiCdmENeFolf8
bD368MV1hA9Rwk8d/IzM5fuEf4p3CyCgb6fBfYpErT6tACvMI4LigS1NlaNdezHz
t5t62Ab+P9JSqqjrxyYCInM6N1Odc1ly+NCiEZHbhK5NZF8sZSj9z4rvhi/P4OsK
Mr5OLKsjDWIOt7xjpCmv/FjEZiNd6MNt702eLT3L9sG1eOif9gnLJApHoO7rOm8L
TUo7fev+sFPtUvOE39u5HCOwI6sIMlA+A3/tyf4vsjunhVU5+sh7XtUoLNuaEOEl
8DqHzIDpjNNKDMRqrQfIyoe0bq7kxixuIfUssnh/4ZgROCE5FPZMmV7bON0GG8Z0
e18gpWqxQN2Y8KqJXxvfO6tDauZu+nLc+ZqbU1/K37ZmrpzbTUA=
=E+Ua
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
