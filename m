Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26AA184933
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 15:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgCMOVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 10:21:22 -0400
Received: from sauhun.de ([88.99.104.3]:52378 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgCMOVW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 10:21:22 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id 330972C1ED4;
        Fri, 13 Mar 2020 15:21:20 +0100 (CET)
Date:   Fri, 13 Mar 2020 15:21:19 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 3/3] i2c: qcom-geni: Drop of_platform.h include
Message-ID: <20200313142119.GE1852@ninjato>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-4-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:43:58AM -0700, Stephen Boyd wrote:
> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
>=20
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied to for-next, thanks!


--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rlt8ACgkQFA3kzBSg
KbanARAArDA45z3r/p8RS4cS0YA9pzniWuqLZLnmKi3N3iWwXK2Eqq6vqpb6cZRk
/IPO6RvMUv97Pep+LORSITnG8PS346N4xzRj8d05rbCzMqeHxIWdGtXrxa91LoGl
txQKifSEjo1ijf2oZc9JX69djQ1WJjZtGhuh97S2wE7ydDbG5gBdRvlzJfwS2gNA
5VB1jZQ1avaI1H7X6GXUWg8H3w/2cznu6iDqyco4choBuDJeM47z7L1m9s6Dqk6p
TzMWzjA0Y7hFCOCNM9oTbZn9L49FvA48gdRrxogbdkxtcU87jlzBuKESP19J+a4a
p3GY8WylzWEsSNgKHSq9IBfXdpBBrBMGOFb8vGocyvAy0FsrVX0+ZpoGA8qt9XTE
xQxR4vaZsUFj41W/VuN1hZOH7rireBN+UQpVDu/E5uIGdZ2tZS54UVUtUDNtm8jV
krGSOq7CDsUs+7b5z2cv74B4pFrPrYqNiHT+T9ON0NJIorDc9VyqpjLHtlNanMLp
X+PcFd0nrXrIUMCpBnPw+7mC/8sgMHaeVV4hzKp/27AeLvlL3+B+jYf44M0ZoH8+
h1koF4NiroDnh40n2tpIBBBmdhRkeoU8MjI4o8zQBkcdFiIxdcpf9hbDnKep/Iwz
ndz5voFMXJ18g7wQlJG6zudhBA12jjdbqmEWCLpeYd1WYSK7xoo=
=zhuG
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
