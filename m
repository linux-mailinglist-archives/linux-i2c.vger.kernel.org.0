Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C512F18492F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 15:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgCMOVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 10:21:18 -0400
Received: from sauhun.de ([88.99.104.3]:52356 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgCMOVS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 10:21:18 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id CC3B02C1ED4;
        Fri, 13 Mar 2020 15:21:16 +0100 (CET)
Date:   Fri, 13 Mar 2020 15:21:16 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 2/3] i2c: qcom-geni: Grow a dev pointer to simplify
 code
Message-ID: <20200313142116.GD1852@ninjato>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-3-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:43:57AM -0700, Stephen Boyd wrote:
> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful. Finally, platform_get_irq() already prints an error so just
> remove that error message.
>=20
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied to for-next, thanks!


--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rltwACgkQFA3kzBSg
KbY4AQ/8CVKrLJXk7rkvQCfZwrhJdGlrnOIxGDAbK5yrYFM0xTzIq/AL1sXfb85o
y0W34Xzv+l4lDibQCQHE+3zMQfN/tytDYVUg9jeYDpO3KaamIH9qPVZsPcKEdQjo
mtKaT+E/0CVfcTVj5l8tVdyl17+CGPK3EnkcuA6+eKDsgZ+AnAXzs7gxiI67jFvO
r5Bg+aHiElw5r3/ASu5NW2F55svWdOnyKdR6ip8S0bkfmG+ZW83FhV5huewblQMC
6rwh1Rsm8AT9J7yE6CcX1n+DUiQ+sxdq+DJwDRVMFsBLLODK0MXftQYgB9sDSfZv
TxFIWlFiRNvW6pk0BOv/akg1jlpkQF73vN6wNt8Mvpgd4UEURL6p1H6MZGwzl0m4
ig37T88L5ZnM9Wst6m6zB5v+f10/Jh+B0xYAKVYW/p35WkH4zEuakyR56HIu73cA
azeh0TiUKaFNJ8NvVvSPUSLozRhff8jDSwwP28NsgCg/E18fGHaQu4hme9OQpMHI
iCCH9Q9spzOV0q6mY1qktJj8O6dRfad6jFn9M0KFfM5ixI4DJ/DQSTAr32FG/1SY
TQKy9+/qjJCeykfS3mBOFdi2hTYAg29mX6S6hBknNFbxwfOFp+4bR6F8kBrYlPoZ
jE37K3KzSns6kL8wOsqlB0T7J3NVWX4pmaEvVKybduTCsf7eK+E=
=2oSq
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
