Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5055D21B8A3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jul 2020 16:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgGJO2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jul 2020 10:28:51 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42259 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726896AbgGJO2u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jul 2020 10:28:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 7221E845;
        Fri, 10 Jul 2020 10:28:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 10 Jul 2020 10:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=H
        dz4DLRipzbxKr7xR0rS1IxGPTkOR/aymG5+qu4SFKM=; b=jV50f32ZMRdGcju76
        xcs/nSGrdpE4sQCUUYddJx+6vd3QI+FpCNHseVhWJenXZoTOWJMiYs/YUNAQTNNW
        PU55R+LwHyRxfw256L7LIIq3Q2BnW2YQcYNnsH1GwO4F7/rdyMUXVk3NDUe4Y3t1
        eO71ZXvnNzThn1D+LrGlcd8YvW+5E4lHSj17KJItj7TgcM36ebwE5EbfZrGaBL2l
        dXej30v/9U+QZ4kEs1TA7Fi6tvsVZBqg+I3m6QDVxcZTZkaVmgEkvIQ4aBsex8iK
        Jnhg9TqzP5U9No3sggCzsC93f0iFX//nBalF5zXJeUac+qQKehnw5ojyiQ1i4Mum
        HElYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Hdz4DLRipzbxKr7xR0rS1IxGPTkOR/aymG5+qu4SF
        KM=; b=tWKhw0vlIYAWv/vnpEOC1/V1izkAJhSsxvOd8t1hnSOetf7YrD91FY92t
        7EtKZxvzWKhvPD+iHya/YIDJHLZq6EQKmOMIFvYwRpinOLecRV11LaNaLCvn/9z2
        5NBpIH+BfTslNdKaK/ZHPLMPLS5XF2RfMUhs4b/L1npO6XHVXgBVgNAeyz8Hb8i4
        QrmZnOSiPPzU6YsheC/2ue54Cg3pJR013mEyiKr8Js49lUd/B7+Thn4khI/O/bVc
        SUvXmz1c3FEoDg50MA1UpPTh0VzmhB7MfBPqUM365vBHLwkQhiTJVUyWbThhQV0j
        j7XjmzDlmAT0v1vpy4GpQ351uQBWg==
X-ME-Sender: <xms:G3sIX1j919aLyVbZGlsNUWj6vR7vsR79oT4U1QOaDVJWSVllp1Ncgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G3sIX6AKqqw4oIjXblUZJxow5lSiJ1xp5zMy_WasLxuR-CrJp3t6Xw>
    <xmx:G3sIX1Ge0sxNOXKYSnkdK3ZqxYgdQW9-cvkHcb7WAh3NaCxvXlIj-A>
    <xmx:G3sIX6SaeeXypihV_rnGMCvvoehNkBb8beRw62slq9K7H4gONHnS3w>
    <xmx:H3sIX6cBl607v9CFjrFgJw6pOcZr-BlnLHwaY9VCXOP8HYBseBZp9HGd4R0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8389E3280064;
        Fri, 10 Jul 2020 10:28:43 -0400 (EDT)
Date:   Fri, 10 Jul 2020 16:28:41 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, wens@csie.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        huangshuosheng@allwinnertech.com, liyong@allwinnertech.com
Subject: Re: [PATCH v3 00/16] Allwinner A100 Initial support
Message-ID: <20200710142841.7ue3xtracowexjct@gilmour.lan>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Wed, Jul 08, 2020 at 03:19:26PM +0800, Frank Lee wrote:
> This patch set adds initial support for allwinner a100 soc,
> which is a 64-bit tablet chip.
>=20
> v3:
> -Add pmu and nmi support
> -Add read data mask for calibration
> -Code style
> -Some trivial things in yaml files
>=20
> v2:
> -Some naming consistency
> -Repair email address
> -Fix mmc clock
> -Don't export system clock
> -Fix checkpatch warning
> -Drop unneeded pin function, convert to jtag_gpu and i2s_x
>=20
> Frank Lee (16):
>   dt-bindings: clk: sunxi-ccu: add compatible string for A100 CCU and
>     R-CCU
>   clk: sunxi-ng: add support for the Allwinner A100 CCU
>   dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
>   dt-bindings: pinctrl: sunxi: make gpio banks supplies required
>   pinctrl: sunxi: add support for the Allwinner A100 pin controller
>   dt-bindings: nvmem: SID: add binding for A100's SID controller
>   dt-bindings: thermal: sun8i: Add binding for A100's THS controller
>   thermal: sun8i: add TEMP_CALIB_MASK for calibration data in
>     sun50i_h6_ths_calibrate
>   thermal: sun8i: Add A100's THS controller support
>   mfd: axp20x: Allow the AXP803 to be probed by I2C
>   dt-bindings: irq: sun7i-nmi: fix dt-binding for a80 nmi
>   dt-bindings: irq: sun7i-nmi: Add binding for A100's NMI controller

it doesn't look like those patches went through?

>   dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.
>   arm64: allwinner: A100: add the basical Allwinner A100 DTSI file
>   dt-bindings: arm: sunxi: Add Allwinner A100 Perf1 Board bindings
>   arm64: allwinner: A100: add support for Allwinner Perf1 board

On a more general topic, which bootloader have you used to test this?
The one from Allwinner's BSP I assume?

Maxime
