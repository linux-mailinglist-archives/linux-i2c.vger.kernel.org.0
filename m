Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD36476F9E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 19:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGZRSW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 13:18:22 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42016 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfGZRSW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Jul 2019 13:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZTdXXHzjtIECvcH9SRFxgzEXd0AdlsTme63IMTdWnT8=; b=P584lDKfa4NmiJ8hHfzMke5wr
        8M1Wua8DsotsnkRBbK/U70BiaP+amK32eFaySdFJf3m7YxOvLi0+64I67QalcnMzT1cz+RyP+iwq1
        GyxdLMz/ORUNmCMDt2OjgwNVzp/ypcWvUcHuLP7vT1C7iDCvdA/xsISEn2P9vWxbSrH18=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hr3r1-0002uT-Sa; Fri, 26 Jul 2019 17:18:03 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 996452742B63; Fri, 26 Jul 2019 18:18:02 +0100 (BST)
Date:   Fri, 26 Jul 2019 18:18:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-spi@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, Alan Tull <atull@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, linux-fpga@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee.jones@linaro.org>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190726171802.GD55803@sirena.org.uk>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
In-Reply-To: <20190723221838.12024-3-suzuki.poulose@arm.com>
X-Cookie: Think sideways!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 11:18:33PM +0100, Suzuki K Poulose wrote:
> Introduce wrappers for {bus/driver/class}_find_device() to
> locate devices by its of_node.

Acked-by: Mark Brown <broonie@kernel.org>

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl07NckACgkQJNaLcl1U
h9A0GAf/Qv4GC1ywijdMO9/GL0PzTuBBqL46oM94b0OCt9PYllKoQ2MkrwSN+eAS
DGfHngyqVnoUtqjC/RksDFvWLJ7/Hg6BRJf0zkPspIu7s/DC2tW4x7C8CTIvfbF3
LbDl5DdTKcj/+2cS7yypDLGUkmUVs0pmfQJ5e9gk0l8qX8UUIoycnIQCKtctvUlr
LZgOv6gh5nuo2Vh8vuJIMi9rUHfe8zeSvMhnDhM/cU4ufM81bxjTeRw/9wdv1KOO
WLCRZm1nIAYCZajxTVgQdYhI/c7w6Dl9ZSc9/dJmzVp5RZyoV7KYT6IcjRwPVnRt
UZpTwC9oSD2mXZB30cpoNy7JmGFAKw==
=+DYp
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
