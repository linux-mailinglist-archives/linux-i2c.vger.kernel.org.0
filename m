Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505A12519C6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgHYNgy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 09:36:54 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:34481 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726749AbgHYNgX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 09:36:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id B57FBCCD;
        Tue, 25 Aug 2020 09:36:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=POEurteasFjtErahfEjgvleBxyP
        Dp8wZRReEbv/IAys=; b=i8UhYGZnZjo037lPyii2wA/CX7LkgMwr9a3XbcVjYtH
        Wmv4F/2SE2c8N6spUbl7zBloi9b8wwCB+yERBHAut3kTCUOpHgNgbOA4LR/Ew0vV
        zHWRGcEy9u2JN0gE1wGX9XTkLkCrA7Mkx86YSG14ttmT+Uj6+qHU7u84BFVAS5sH
        fXYnmp4r3f7OD7prv9BfPZedMze1b1hMbGqK9suB0YzsZo+r1Pwlb71TifHAQdcZ
        T8olniVwYsB8msCX1/AJnol0C48g8QdEGfJm6UpKwcj6f5GUa8fq4cMTtm0kveAB
        Q8qOXt9jXKfa556Nf62m8CjIn3OfmFnNPZlpFx0bL9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=POEurt
        easFjtErahfEjgvleBxyPDp8wZRReEbv/IAys=; b=XJMuObmrP1KF2fiCudIQoF
        Uw9YdDA9nRFLxEgXw4Mjs9KyCgAEczVVNqFx6J1rHndHBdOO5lsN9hYTd5dtYd2o
        SiQ+GHyPrGNtuolY4oY5F0wdDLm6p9aUtcwVif+FX4vxcDyt7PIfORygP+kHk+PU
        5y82npqA9hHXInV1zafBoPumQHM2nxY8MkCgYYQDh0chHba0IOTKOzdhfCFpUmqr
        mRM5PpYFzv8lUAPcy88JZ84iEz+emJjwyCr0JgsRaWbO7k2o/042PGFoKQHO+cX6
        3W2gjd2837hYtUzxOdHL8tBTnRCazMAGQiti0R8NLNtESi0NhEQEDTSm2jxGeohQ
        ==
X-ME-Sender: <xms:1BNFX-4Ec6Wt06BBmqcZp-stJ36Ws-Pz6M9S0fH9vKfHtHaYRipLhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvddune
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1BNFX34Jxf_MxSBsPQgv3osZA2IUOm9RuGW3he0GaDIb-Crt_jqsNQ>
    <xmx:1BNFX9eW9OggrB-x6yam3EuKH9xSnH4r8TBzbmLawHnDvILI2Ef81w>
    <xmx:1BNFX7LPwLSpf-QM7m7LqSbRD0zLgnVPKcNN9eWu5vFhQibCKW1fKQ>
    <xmx:1BNFX6AWjA-EcPGV4346e34oYz6jt_QRUfA4kEdsWppp3Zws0d7Ei3LzJcE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id ABAA63280059;
        Tue, 25 Aug 2020 09:36:19 -0400 (EDT)
Date:   Tue, 25 Aug 2020 10:55:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
        Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "p.zabel" <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
Message-ID: <20200825085532.vv4dpuzmjnshm5qn@gilmour.lan>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
 <CAEExFWuwjmqAh0c3kMLS3Gs6UC2A8TtY-9nJeWxFPRDugtR4pA@mail.gmail.com>
 <20200824080327.GH3248864@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="auueqe22v4rtftcj"
Content-Disposition: inline
In-Reply-To: <20200824080327.GH3248864@dell>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--auueqe22v4rtftcj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 09:03:27AM +0100, Lee Jones wrote:
> On Mon, 24 Aug 2020, Frank Lee wrote:
>=20
> > ping......
>=20
> "Please don't send content free pings and please allow a reasonable
>  time for review.  People get busy, go on holiday, attend conferences
>  and so on so unless there is some reason for urgency (like critical
>  bug fixes) please allow at least a couple of weeks for review.  If
>  there have been review comments then people may be waiting for those
>  to be addressed.  Sending content free pings just adds to the mail
>  volume (if they are seen at all) and if something has gone wrong
>  you'll have to resend the patches anyway so [RESEND]ing with any
>  comments addressed is generally a much better approach."

This is true to some extent, but pinging after a month doesn't seem
unreasonable either.

Maxime

--auueqe22v4rtftcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0TSBAAKCRDj7w1vZxhR
xQ6OAP9rRoEY6LGAwA8rIYGP9nqZkGQvX8jYgLKgy8LDGLzgHwD9FpLVh5zaq2PN
wZuijCenTGRJcOzorN0M0qrwWwjOnwM=
=/bST
-----END PGP SIGNATURE-----

--auueqe22v4rtftcj--
