Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C326670521B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 17:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbjEPP3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 11:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbjEPP25 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 11:28:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37075FF1;
        Tue, 16 May 2023 08:28:56 -0700 (PDT)
Received: from mercury (dyndsl-091-248-191-196.ewe-ip-backbone.de [91.248.191.196])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E5ABC66058F4;
        Tue, 16 May 2023 16:28:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684250935;
        bh=9Zbfci1TdhO6S4+wcLiRqTU98Ygr/MBClVVcg3Aacnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C1QarmdofT6VuceBRnhEC8QA2IPFK3B3SaZk26W0KRWVXlGUlIglp+j8hZXgrPxdG
         LTeVPM0qZvYgHO1l9oqgcIEQn0gJwiSqEucxe+xaM0LYqLk1TqIBiVuL7Gm/oIKhD5
         68Ij32npBTDNc0taR6+PPTMFtvQjsQliy8dnEghJQqd3bRIcYv9L9xVTFgNE6/C5qv
         rBzBOGihvBPpFDnLWeiA1xKeSk1SGhShAPSdghTQx/XCF15KRTI3kVqum3t9PXxGeq
         WzzNxjfsKP6UZPDajDyqisD4fYCP66aPFjXp91/mZypwjMcmGd6P5NQ7HYSNuTbIt/
         LUOnsiSpa0Xdg==
Received: by mercury (Postfix, from userid 1000)
        id E1D901060F7F; Tue, 16 May 2023 17:28:51 +0200 (CEST)
Date:   Tue, 16 May 2023 17:28:51 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Michal Simek <michal.simek@amd.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Message-ID: <20230516152851.74xcwa7naaniox6x@mercury.elektranox.org>
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uzdssvofxc7p4teh"
Content-Disposition: inline
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uzdssvofxc7p4teh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 16, 2023 at 03:51:08PM +0200, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.

[...]

>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml    | 2 +-

[...]

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--uzdssvofxc7p4teh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRjoSkACgkQ2O7X88g7
+pqZnA//TDDMhr+y5x6WtK0aAHgdZNjN+PvDZjdFdHabNv9Ne7ZbkH8zfacX2Ixj
vcRQLK7IEndRfP76oe/Yd30gDh3af+G/6sGDihy7qDIYKFZ4U59e52eijzGtzOzd
bIQd+nK7rVLLPD6TCQnIMd59dX0YBGWW1NQsc9viEUKa73617ANSXPmUS9/z7BAc
TB9a9Wh11wWkmndxV32Fquuq7mTmmqfBMh7rPnKm8WIqxWfdMZeZy2UvZMBVj2YB
yXzEskCayveuLHQMKZoHrj8nUpItatw6BOupTR5Df1VQ8aZGpiedTulY/dVgusiR
4qO9zXCKpjpRb7X4CgfvWM9L8qVEG1X47iepFNX+CEQXv+3EJCHZEF8QSyPxAk8P
85aI/FZOmLHKjTlu9TMJspG1ruxDaPyhxtfZEpI7+xGhiH4OQN48QRk+PfIpIEqt
9c+PCUCXosIGpX7sNn3hrXGQhPRItiRGDEX2tqt0SWyn3/V2GvG+8rOqIv3F42Bg
5vRf8LlcgEZlAeu0CNwUFmi4T/Wu+/77sa7Tbm+HDIqEo1kHJnlLJTs2LRjSgqSR
/vlgH3m61YKqg9jy5xrmuFeH6Yg2GQQVtig9l1+r1XmHTUXrTvROk5kQ8AgTOYZh
ZAqxk1Gb2IdIBXK0U6iG/7jHEhu3spe5gSzqdFc/+FUfveluN/o=
=1MS+
-----END PGP SIGNATURE-----

--uzdssvofxc7p4teh--
