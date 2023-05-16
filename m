Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B901B705094
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbjEPOZq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbjEPOZn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:25:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A823772BD;
        Tue, 16 May 2023 07:25:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09A7D63AB8;
        Tue, 16 May 2023 14:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3223DC4339B;
        Tue, 16 May 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684247138;
        bh=56JVyKy+1Eo3iWQR1rFM2KRacIvVANlyt7QmXSsxXog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sw7ItSmQIbLslllD7oBOkdF9j/FlOj5dsXDqMdAVYTGXVePqgKGiqHLCWvHm2ORRr
         6kGi23wPgbqtWH++GyKPDbfnOGJYRSItd42GnFFL9NiTCxbS5MlCYoaE7cja5CINAl
         MBeAVXmYMLL0CaHOeAmMhwc3cfLmYm36VluT5zcF9NizSc+259zobJFUL5N3gEno4X
         9u5F6216HG+frqCDI12sd/qoLpfPnHwDmm/KK8Xl+b3WsdT+JxGuGo+K5vAgHOJtRQ
         LNksR965SsJyjo9psN0LiFLlQFkAsgnNiK5I91CtB8U03VZ1stI7eAzP3ggkislL7X
         wgwUE3IVrbIFA==
Date:   Tue, 16 May 2023 23:25:33 +0900
From:   Mark Brown <broonie@kernel.org>
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
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
Message-ID: <ZGOSXZs3H0wNxoOn@finisterre.sirena.org.uk>
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdGB4dh9xyA/RRNs"
Content-Disposition: inline
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
X-Cookie: Avoid contact with eyes.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fdGB4dh9xyA/RRNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 16, 2023 at 03:51:08PM +0200, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.

Acked-by: Mark Brown <broonie@kernel.org>

--fdGB4dh9xyA/RRNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRjkl0ACgkQJNaLcl1U
h9DxbAf+IuWAJWHJfAChVJ2LTNEpiPn0Mmuqlf3KjNCljNWlid6xXrK7PpDqYv57
CudgrzknJ/lP9snwYZ91h2fY4sOq/WBLUY1lZlxH6sracfVVk3TkIUW5UKZXevF3
PkB6wC87xozR2QVCGSUGz99xymbPuCE6GOiQ5fY9/vXNvXtKHCtQiUKukggj8Iaz
jSMJB2YZutlpAIumPt4YIDaAbEQtw0Qq56CDc0/A3m9creP1/088rm2okN2cPGI5
8Ubhinc4INz/rXmxXOo6HULZ9ym6Bq4Lc0uE9fpFVnY2dXIVou+bRC7ilmxrPMmU
xecoraefCIfYW/zmw3mnSGKzXaf30A==
=tMxy
-----END PGP SIGNATURE-----

--fdGB4dh9xyA/RRNs--
