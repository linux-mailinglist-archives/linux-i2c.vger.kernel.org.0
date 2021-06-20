Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D0E3AE084
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 23:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFTVGj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 17:06:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:32782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhFTVGj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 17:06:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BF966052B;
        Sun, 20 Jun 2021 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624223066;
        bh=ffFwCRSzLLjjq9FwdvPYYwFdJF9+0LtokTDChUJ5Lhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UHhy+L0s6JDvzMtHJu1o3xYQwyq2JFoue0xrtBsI9HDDkWEuld72GAmQilQoKPSde
         XeVHdwZCcXlKqhQwwTynw1QzvLFUpQVc/EWygiI0aPwwgCH/fPBQIUBOIxIt1XPbd3
         2x4RgsYb0IHcxKBeVlWDneKyMQm743vINT0dv9weGecI6YypbdQ1Z4mbPU8QJwuFlA
         TIoRQMA0iRnSKNIjGQflD4kdwrAvUtn0264fcVMGacPRuFm3ihcjTQRPOIUAR1z9gn
         3bsO/yWPxUMGMcXK5VEFRjgaCtGzQ/8wEEiuoK44HLoofrSdAqm1DgNq/S1fntNjQT
         8Zp1WtObtvwbg==
Date:   Sun, 20 Jun 2021 23:04:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: core: Disable client irq on reboot/shutdown
Message-ID: <YM+tV9zH9SC+TQcW@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210604232744.1259150-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eGP/TfyAsjMxFXWH"
Content-Disposition: inline
In-Reply-To: <20210604232744.1259150-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eGP/TfyAsjMxFXWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 04:27:44PM -0700, Stephen Boyd wrote:
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> If an i2c client receives an interrupt during reboot or shutdown it may
> be too late to service it by making an i2c transaction on the bus
> because the i2c controller has already been shutdown. This can lead to
> system hangs if the i2c controller tries to make a transfer that is
> doomed to fail because the access to the i2c pins is already shut down,
> or an iommu translation has been torn down so i2c controller register
> access doesn't work.
>=20
> Let's simply disable the irq if there isn't a shutdown callback for an
> i2c client when there is an irq associated with the device. This will
> make sure that irqs don't come in later than the time that we can handle
> it. We don't do this if the i2c client device already has a shutdown
> callback because presumably they're doing the right thing and quieting
> the device so irqs don't come in after the shutdown callback returns.
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> [swboyd@chromium.org: Dropped newline, added commit text, added
> interrupt.h for robot build error]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

I think this is for-current material because it fixes hangs. Or better
for-next to check for side-effects?


--eGP/TfyAsjMxFXWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPrVcACgkQFA3kzBSg
Kbb2JA/8DCFgeCoLZunw4uFkcW3ia2gSGs1h1R5nv2r/RZzK2+2d3FSrnSAhRjZE
3yq0oYiCmgsHXwOy987rNdKA5K5ZYqFfl7RWS7R5AlC0rC2dxXk4M25JkLfHS2fR
bxqAsjRXIgm0SQR8IS5ScZ+49JIP5PV0MdZLMRrdCXbdoMJmOzurpAjniGLOrthm
yunqtWRfF1ul6UszgwUWWpRzHe3NCBGk/I7JSSzo7yBDqN+V0BlFCiLbRL5jdpih
jlrhZ0nVnjAArLlRQQMoG68oHn9D3AbicEQUlxOSFfPGt8jmN8PpZuxHfRP+20GV
tkh8A8uTmb5a2uBXAYhzlmhzu/p4mJs297w+nZqWLkeevSzmbwO/qXww00hioRtX
BVaRCeOxvQnGFQUhhKnNHcSbVKJ6x36J1TvnspddRTEfAoODBrpqAoSgxASSuyae
NUjRFsMyevf7VeyhNjlgGwYz5DWKv031igBwhZJUV2oae/OYhgknVpiTApdvJmra
KkxG/6495KBbCbcoMsRlILieZhlJy24I/c66Vx8S+Y8WqnRMRstLYn01IHZ2cBmt
h6ZP6dPnqxNt++DHDUzGtjUmj45r5c55lMQ4JFgWmXrAxcdcaI3/gMz2k6CzGTWk
78mUXLhXOOXZtZMmVYtcbGY3D633aV3VEWpXJzBpGqGz2saM6+w=
=aOFK
-----END PGP SIGNATURE-----

--eGP/TfyAsjMxFXWH--
