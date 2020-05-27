Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D8B1E3D50
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 11:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgE0JNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 05:13:42 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60915 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725820AbgE0JNm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 05:13:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 458BF580184;
        Wed, 27 May 2020 05:13:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 27 May 2020 05:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=V5epjiDGiclpAXJJpB3JE24jmk6
        thqQZcHWLQmvyuUI=; b=afFk/O5M5iUdGGh/mcZZQSmWP9l8zSgz9lNVaE199Em
        nbgE6W8CSw0zFL9SnUP7uXSR7qT1XxQX8tDdeDIuY63lN0z5jgxQp4K5Lzt2PKyf
        tHXjyQicYV5VWtE3SKycCHL1AQqxyyxm30+2DEW9afNDHrvV5Vd9FwJXmT1omEjC
        YZV4G+4eDO7d/2maCVg0uHcPCT7HbYcuC35DsDs3+0/WTRsb0gq23xUK8F2IlYX2
        RjXIdbJykAIb8SUnCbhyKd2QczXXB1GyyYlOAryCe7ZNnjGl4O8Awk148iQP3fV/
        0s0yWscW+JB8U/aPOF0BQrBhdHzJgelUb3Ju7GZz0Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V5epji
        DGiclpAXJJpB3JE24jmk6thqQZcHWLQmvyuUI=; b=NfATUaw901WlNTfX1Pg5wf
        VzyV0ZCjREZzEubzT29J2zNQtbxmxgarGmO8OTcLnJFZDbjLIXpU3YkLFpApRf43
        d65r9jucWdefHFKo0BDbhE7aiqT7SY1cq1i6OnXfumEe+D/Tof39+ge+z5byB15/
        ow68Z6xgT68Q0RX2pF3Si0qRS9tOce+bAZdreEyzfvLOFc3JTg9wayySAW93iUgz
        NtanODdCevcGOpqwweMlK8Gr2cUnF6hj+YrjQXuEkwsfWySc6dNXD5gmkrYuqboi
        Tq5bKPkejPCobXrRhfgT0iKOemYDwJWFeUdfk72nOQz13dPB0YYxNb0M0zZ5/diw
        ==
X-ME-Sender: <xms:QS_OXsbh5mG9N37eoM9wr1nZmwvzQsVZK5HS5wtVD4XrBkrpuZoLTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QS_OXnYhpDwxYPnG140lqFLRlDN_P27ktwVqvxghdhSeN_ZdlZWniA>
    <xmx:QS_OXm-bGmz1PUWtUlPhyx3yvXa3lF9sSUY1SINUu-poX_q3iI8POQ>
    <xmx:QS_OXmpUMcCGukOP73oVLStJAyFaG9_8rlFR6rCrTeTgHqNJxkMotw>
    <xmx:RC_OXq1jTEytyhpvWEScpxh_pvTdwfI8yH08SfBPb187Z1Mw3FSxjg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E95C43280063;
        Wed, 27 May 2020 05:13:36 -0400 (EDT)
Date:   Wed, 27 May 2020 11:13:35 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Drake <drake@endlessm.com>
Cc:     Jian-Hong Pan <jian-hong@endlessm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kokco5kof5hl45yv"
Content-Disposition: inline
In-Reply-To: <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kokco5kof5hl45yv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, May 27, 2020 at 11:49:36AM +0800, Daniel Drake wrote:
> Hi Maxime,
>=20
> On Tue, May 26, 2020 at 6:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > I gave it a try with U-Boot with my latest work and couldn't reproduce =
it, so it
> > seems that I fixed it along the way
>=20
> Is your latest work available in a git branch anywhere that we could
> test directly?

I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) if y=
ou
want.

Maxime

--kokco5kof5hl45yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXs4vPwAKCRDj7w1vZxhR
xaGaAQCg3gZaUrnvSNp3BzxW8iTAVt5FCWnVgDC2YFeAH5wRnAD/RUVn5pMYOZX3
CW4nLRVoZ8NFLwZqHrhV/v6g5LHIhgQ=
=WuzX
-----END PGP SIGNATURE-----

--kokco5kof5hl45yv--
