Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A7C5B4752
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 17:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIJPmo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 11:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJPmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 11:42:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398E614D26;
        Sat, 10 Sep 2022 08:42:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA13EB8010F;
        Sat, 10 Sep 2022 15:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F99C433C1;
        Sat, 10 Sep 2022 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662824560;
        bh=luECLScAoXW4trye3u3QR5BAVG50o9WKq4LURxl0cWE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=OglzfM37e36vzr8RIz38aKNhfmFgibKtibSrXPxPXQxdygFx+atkOZh3JNt71PUY6
         2S0Eip2IqnsZuGY7oggCvdwm42lV9aRNn7Dn9nUzGuh/E4BcZYjwkAAn+a+jtNxp+8
         FOXE46EQA4dSN2Km2LXB6ukzhgc7QWaVgmbUb4i2klVbVrzmJNvLapw+jTc4WgP8Sn
         gT6sTIx/QE1RnpSC++ABbUzSwSDvU1GBgjd7UB997SV46FyILWCbmjKFFIh1JSPvq0
         8RJ0TU+fU8kaAQVZSguBGoaIlIokY7BL2FEZpfhephsISRy9GGuv5q5iKanIgYycUH
         ILd1FW78uL9qw==
From:   Mark Brown <broonie@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc:     linux@roeck-us.net, vigneshr@ti.com, sjg@chromium.org,
        miquel.raynal@bootlin.com, gregkh@linuxfoundation.org,
        linux-pwm@vger.kernel.org, richard@nod.at, heiko@sntech.de,
        robh+dt@kernel.org, jamie@jamieiles.com,
        u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
        philipp.tomsich@vrull.eu, ulf.hansson@linaro.org,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        vkoul@kernel.org, zhangqing@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, kishon@ti.com,
        linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
Subject: Re: (subset) [PATCH v1 01/11] dt-bindings: serial: rockchip: add rockchip,rk3128-uart
Message-Id: <166282455399.474671.11726724099870642599.b4-ty@kernel.org>
Date:   Sat, 10 Sep 2022 16:42:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
        commit: 14c3ffd7947ef3623682148be07b9c0bb8737f37

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
