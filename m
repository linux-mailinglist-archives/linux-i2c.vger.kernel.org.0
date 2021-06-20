Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398CB3AE091
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 23:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhFTVK5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 17:10:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230211AbhFTVK5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 17:10:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CF3C610EA;
        Sun, 20 Jun 2021 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624223324;
        bh=RV1dRe0q665rCNfncnH89ttrqFNtElN2unqX84acxys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vCmKbaXvanXPec+PW1+BZooyGCUSyt4KNHWz5AQ/cxQrd8zooIkSvV3NVjDcVy1M0
         lev8GonTnS6dA5tZcayI4PxkXuJhnhljHIVpA/itbL6f3Hy3rM1srP/s0yFR9mn71h
         sOSjfQcEtX2rtb29fvtC0W7he5nriw5NU4S2j9lLX8OvqFWdfH4XpfMRbiVpmk7wb0
         HS4RbaWpQMLswvjL3fLh9kmIKF0YfQcdAbDM97gN/oDe1GVh7/nT2WozhPr1wJb486
         zORZrhVcBf5n1i4hJzCl6xrqGOTily1gQrpBUnIfn+Oamgvj6keBnnso+aDJA9lK6X
         D5Sd9fuYoMXiw==
Date:   Sun, 20 Jun 2021 23:08:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by
 "nxp,pcf8575"
Message-ID: <YM+uWXoCvi7Y/s24@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <cover.1622560799.git.geert+renesas@glider.be>
 <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yGK4jxv6o8Tg62fU"
Content-Disposition: inline
In-Reply-To: <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yGK4jxv6o8Tg62fU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 05:25:44PM +0200, Geert Uytterhoeven wrote:
> The TI part is equivalent to the NXP part, and its compatible value is
> not documented in the DT bindings.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--yGK4jxv6o8Tg62fU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPrlkACgkQFA3kzBSg
KbZFSRAAlvHQWYn7WuznFBAm3WzUAuqHEpUbbz32vQiJxtrX+3RgQ2ylWfaEi30P
LwMnfIUuQxQYUhNF5f+Q/zYIdcHyscL8YdYlbMl2grtmKa68Lm1SeUZj0kJbBZ6c
0hv7k4yT0/2wRFc3pNOi2E5fnU9oKKKdXEB+7J5zrfotCIcyOfMSmekVfcg7e/Lc
dPm3MxH4Aixm2eNxuPRiXAXRvn4WXaf42EEdwERYx/OTIEe+ndm+OmhoQFB4PsqP
7aglnSl+5mCrlGw3mU6/qt9gE+zXd36c1Y1DOMdu6ArMOc0zRugPon57oBSWrAA1
IwvTDnrCAtY2Z8MnDFyYT+BCrxeWHs6y66nFT1M/w9m2t6YBB0r2ZsbstRkYHzK6
4YE3UcZc6bvulO2ds+LZPSdLD6U0CqWjMi/Wv/1tsIz1eHuwl54J/SSneY4R+fU1
k7pzOZF6sVk1MwvZ7iGKIxXakQ0q5YLgTFHrX1XTSAmO9tKFWwaz5tP1qrP7psnY
p6BBWNdxYDqYnyGyzV/ujdoLT/OOHWizJceV+afJNL24fj5NDJU0ERpEH+HnwA0U
vdubHHZN7Feqm059L3EFEA/B5f9yNSpfc359yCR4jE7HbIRiFz5fgVwIF78Q8RUf
Dbf03mWpY2Z4GKdcxPxS7D3Pmq9qtxoLF1tK+ENHSbY1mZ9QvS8=
=fIsi
-----END PGP SIGNATURE-----

--yGK4jxv6o8Tg62fU--
