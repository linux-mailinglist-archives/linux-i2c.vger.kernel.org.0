Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF83258BC0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 11:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgIAJfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 05:35:51 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:59981 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726116AbgIAJft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 05:35:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 7045C7ED;
        Tue,  1 Sep 2020 05:35:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 01 Sep 2020 05:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=ybNui0l/20dWyLlPF/bim7Hxg13
        OT0asUU1YsmRFd3M=; b=InbWVd9kzW1+gJl9OPC3vc2zMnyiKfUyJ6KsorIcPZr
        XQhZBVEpP+X96IylJS61QFcqRNaQtXohz4CKkXAMYOziN4IJo58u1P/sg43CRc3P
        +ro10z7MnmPUzPnMzoyhnGgpFCwuTsrdGQLEvv9j9UKgUwAEo7egUHpvgq/x51Py
        tnZom+fH0HUOb26OP+FlS4fFtQqpQNPMRdkivqc0uoPdfiRhHXl019eeS7Eqfbb0
        rpRvJUvcS8kxqx80bKRcB4wwfttgp21xEkuITxvFrEOSsvrf/xMaSwuxVgjWTm8G
        UI+KxDpDPfKJtYWqNr6/OVxgj0jPR+7UOr2K4J8ixPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ybNui0
        l/20dWyLlPF/bim7Hxg13OT0asUU1YsmRFd3M=; b=QztGerPcWYjLyP8Q0Dmnjx
        sZVtcAsE1lVN8/UlQalJQDSW8BMOL9FJws5mmf8h8rLfGXEqTV70pO2psPD3STo4
        F03hIh6PRnwqEX+KRISPWbp3ANWU5AC0J+bAJKgB8/h21lj2ViYxqk+5OCqFaih5
        RTVLjtM8oHQhGgdvZ9cUfL4P03SopEzV4PWxChG+MQDPqRmwPGph8idpDdk/szck
        /2hSIsB6yriaGctX2rLNBlOcTMJA/jIJXqjtKZ2EcfhJELyxAwhJa4U7Y0tT9NIV
        P4J4CST6LQyqVDrRnrey5s+pzTEbQibXQ6+SdtlX78jtl1ehMR4tO9KyuhCas+wg
        ==
X-ME-Sender: <xms:7hVOX4qWzIiGipLxj_QxYxJj6h3ChTrUgyLIR9VasGLbrp7SaZn8xA>
    <xme:7hVOX-owiskxps2zscZIsu-_pPU0q8Pn7m33s5EsR2Vz7aFkOp12WIDzU4G-EbNYy
    D-ojwfszA0Q_zbsDPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7hVOX9Nn4fIoFZO5Cb2I4B3Iuv8g77ecZDCjSSn4rMA2vPsyv7CGGA>
    <xmx:7hVOX_4yqOKb4S8pnNAbYgthEKlQqpkMpF_JckeMP3dAJl0CY9X8Hw>
    <xmx:7hVOX36u2SHcawjAHAAY2jfHOOuNkM-0yUOV4zJJ0HtM_VzTi4xArA>
    <xmx:8hVOXzMpaJiXXLn0b7AL-1t_9cYJARjGGNoP_Aq-hgEiG0zuNhhLqWtTF4Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8C76F328005A;
        Tue,  1 Sep 2020 05:35:42 -0400 (EDT)
Date:   Tue, 1 Sep 2020 11:35:41 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Frank Lee <tiny.windzz@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Ondrej Jirman <megous@megous.com>,
        Corentin Labbe <clabbe@baylibre.com>, bage@linutronix.de,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
Message-ID: <20200901093541.d6swquja2zcyiqy7@gilmour.lan>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <CACRpkdYOKOj4r-9U2iHCkdB74fWkm2J0xHqsnH_sE81SV5g1=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7g3sl2lx6xhwh5sz"
Content-Disposition: inline
In-Reply-To: <CACRpkdYOKOj4r-9U2iHCkdB74fWkm2J0xHqsnH_sE81SV5g1=w@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7g3sl2lx6xhwh5sz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus

On Fri, Aug 28, 2020 at 12:02:29PM +0200, Linus Walleij wrote:
> On Fri, Jul 24, 2020 at 8:53 AM Frank Lee <frank@allwinnertech.com> wrote:
>=20
> > This patch set adds initial support for allwinner a100 soc,
> > which is a 64-bit tablet chip.
>=20
> Shall I commit the pinctrl patches (if Maxime ACKed) separately
> or not? Once Maxime is happy, I am usually happy too.

Yeah, you can apply it to your tree

Thanks!
Maxime

--7g3sl2lx6xhwh5sz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX04V7QAKCRDj7w1vZxhR
xah4AQCxUZNxHo6NRo5x9Zj2xDrcVA422l6tyXJJ4rgQSHuZ9AD/co9QajnIDf1z
KHXkMKfgF9/nNGoBzctcsBYfyMKrSAc=
=FxAG
-----END PGP SIGNATURE-----

--7g3sl2lx6xhwh5sz--
