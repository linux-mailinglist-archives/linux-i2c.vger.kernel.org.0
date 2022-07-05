Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC288567777
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 21:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiGETLD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 15:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbiGETKy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 15:10:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D1A21812;
        Tue,  5 Jul 2022 12:10:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22FBE61B0C;
        Tue,  5 Jul 2022 19:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1ECC341C7;
        Tue,  5 Jul 2022 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657048250;
        bh=DZjCJJL0Yv/6HD/E/v6p0fOtpAocdv+3cV77tazWrKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sYOW0yhQip2w1zZZEmV4YnPpYe1Dy4quQmSEs13vh2JajXJKLLGWCI3l+iBtPG4vj
         h+EAgUVB5rnMUc92yTA9RfRbfck+yWdLp/RjaYs1kCykXLv1b8Mjtg7QQb+rIK97EQ
         zx/5yHoF/yOxitslbjIsCJ2bn3esa3E8oFa8X4T1usa1/pHHSFevJccuJoGgbd3dys
         rDy/74rj/s8Pxlm/hAZ3qRvla8RFMdt3f06haSb++zMFm9h2lRaUWEtyBdWzWYsHce
         iHBLMJ4NTSs8jcNJWRmsxsjvBUo9f7epFDJC9YovFkPabWqsJeHYdbNZ19f3OvqNeV
         WbLP+F125vMOQ==
Date:   Tue, 5 Jul 2022 21:10:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     William Zhang <william.zhang@broadcom.com>
Cc:     Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        joel.peshkin@broadcom.com, kursad.oney@broadcom.com,
        f.fainelli@gmail.com, anand.gore@broadcom.com,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        philippe.reynes@softathome.com, dan.beygelman@broadcom.com,
        Al Cooper <alcooperx@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Conor Dooley <conor.dooley@microchip.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sunil Goutham <sgoutham@marvell.com>,
        Sven Peter <sven@svenpeter.dev>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tyrone Ting <kfting@nuvoton.com>,
        Vinod Koul <vkoul@kernel.org>, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH 5/9] arm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
Message-ID: <YsSMskwYYsJRRCyO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        joel.peshkin@broadcom.com, kursad.oney@broadcom.com,
        f.fainelli@gmail.com, anand.gore@broadcom.com,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        philippe.reynes@softathome.com, dan.beygelman@broadcom.com,
        Al Cooper <alcooperx@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Conor Dooley <conor.dooley@microchip.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>, Jiri Slaby <jirislaby@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sunil Goutham <sgoutham@marvell.com>,
        Sven Peter <sven@svenpeter.dev>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tyrone Ting <kfting@nuvoton.com>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
References: <20220705172613.21152-1-william.zhang@broadcom.com>
 <20220705172613.21152-6-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220705172613.21152-6-william.zhang@broadcom.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 05, 2022 at 10:26:09AM -0700, William Zhang wrote:
> Update ARCH_BCM_63XX in all sources to use ARCHB_BCMBCA instead.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C

