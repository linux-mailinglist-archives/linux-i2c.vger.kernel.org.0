Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD182A50F3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 21:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgKCUfa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 15:35:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:46350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbgKCUf3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 15:35:29 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E56121556;
        Tue,  3 Nov 2020 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604435729;
        bh=tHwc8s6fjbwKaViOlHw5mcgc1zaRkVkv2Q0CYANhwtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nv5unKjohu5nlqbhgYokpHXosGgIz/ed/asRvGTl9SkILFrnBDoiXtcVJSqytx/ff
         UQENQefcPq67w2b0Q4dp22zGEH4W0ontG7DGC8VVPBzAtVxI68gDpR7dKP9xrT+ugp
         2+fY1pwL75wpgz4ZUhpHt0NJre0BNS03UVzD+vH4=
Date:   Tue, 3 Nov 2020 21:35:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Message-ID: <20201103203522.GA1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>, linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20201013212531.428538-1-dianders@chromium.org>
 <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
 <20201026150500.GA26921@builder.lan>
 <20201026151351.GB1044@ninjato>
 <20201026211534.GA4001@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20201026211534.GA4001@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Sounds good, please find the series applied on top of v5.10-rc1 at:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/20201=
013212531.428538-1-dianders@chromium.org

Thanks, pulled.


--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hvwYACgkQFA3kzBSg
Kba8CRAAn/BrUUlHmwubxRWenvHPX3jpDDj+laBwUX1/U4xkmXURTubzHzNk26lA
kuucdInwqvKNP40l8Gnhr9N1m1o3XstLND3Tt2mdcvdXINSTdjU6kKdIHr936yFs
LNYc7QIaOIos6toeySuKGJVjaRnbXyzcvliexw3sz/7khoSG0k/H804n483TiDQt
CdfGZhenWTv1vYyojs29rU1qEuoDey40rzbKGVhrGPXfCSyH0NfYxsHRN2KTaiMk
oqwDlc2ddcTlAdzLHdNNvZkq2L5jS9nUeScicmQpgoor50UcpeLV+CTbr6tu55RD
FfzIjzroabstIbmTVjArfMqRdHBJupSQVuCVQo76N/9F2tyce8PSDEcCpMLjyf2Q
SQ8Mu98qOeOUtcQw8hrZDw7BgVZoG/4kMG3O25C1OqhnqTwxUjmNLVEdi6j1bOes
hGa3JNCPlFWVI2xeZH/zG0gdycNN12K7OE3fJK2UWrtX6al04gKnC47SIYMZirl1
Hd44JpM60fAo8UNKH7GvJObPiIQ+lEIAjQw6FvsC9R0BikH7kjpK2vqOaJecPIMh
UiJRNEfJftyltNk5fVNJrKwqbnsWyZyCZIHqfSHjwbbLJvzKOvulYtoPnGo3XqvG
6oqCttv3hGY+/fsRe1K59FwVA4Gw3z2c9KG8kJ69AjXXxhG44uI=
=Sf2P
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
