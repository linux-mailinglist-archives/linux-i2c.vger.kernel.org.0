Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1FFD1A0C51
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 12:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgDGKzq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 06:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgDGKzq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 06:55:46 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B77652063A;
        Tue,  7 Apr 2020 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586256945;
        bh=2l/vT4Iy6bAQT51YE8e9gRnPs3uL+EMeRJhWtbxLAzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D3wNVWTzel205i3JqikhF9KThBjcP8CzuSMSS70nQvmcBh2hJr/ytGlwpGBWxFkI7
         Oe16Rc5btc8qctc0NhSUJo6552xtmcxoX+73Eb+yO6Sl4R/FpWd6qrBsMXBAI7Tngz
         ncOrA7NSjao9QmXfU5GDGKGQlnfFt4y5UkV2s2AE=
Date:   Tue, 7 Apr 2020 11:55:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200407105542.GA5247@sirena.org.uk>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
 <20200331112352.GB4802@sirena.org.uk>
 <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
X-Cookie: Just to have it is enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 03:24:42PM +0530, Akash Asthana wrote:
> On 3/31/2020 4:53 PM, Mark Brown wrote:

> > > +	ctrl->avg_bw_cpu =3D Bps_to_icc(speed_hz);
> > > +	ctrl->peak_bw_cpu =3D Bps_to_icc(2 * speed_hz);

> > I thought you were going to factor this best guess handling of peak
> > bandwidth out into the core?

> I can centralize this for SPI, I2C and UART=A0 in Common driver(QUP wrapp=
er)
> but still for QSPI I have to keep this piece of code as is because It is =
not
> child of QUP wrapper(it doesn't use common code).

Why not?

> I am not sure whether I can move this " Assume peak_bw as twice of avg_bw=
 if
> nothing is mentioned explicitly" to ICC core because the factor of 2 is
> chosen randomly by me.

That's the whole point - if this is just a random number then we may as
well at least be consistently random.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6MXCkACgkQJNaLcl1U
h9CEeQf/eaVfeJR9ovqStt0V0zniW7RMpZKG29cmxTS4fPcK6lCpnIJkuFHsCsw6
OJBjpy9Uyb1eKn0tV79iCLQx428YeoOeJFhp7d/JwAOG+lIc4Jp3HIh3mJ+eRmrt
i0HmoPaJygm8PSz/MsgvFQEsuwGhJJ/DKUpAjcYbaa08Y24VKDZgRcvaMk4Xp3x1
bOTk96XEtzCXyQU5uQ9EBJL8PyRO1kAVp5xeUGVNiqT4TKEFd95YWrTrrQa/Z8/w
UDBToWopSQZJjXIBB5xIbxyIdNB1yXAaOKdSjmja/cIqiNYn1pzog0nJBOwANsxj
YRYqsbzHbmLNuoeCBVX9CoSBVOlpFw==
=Rxn1
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
