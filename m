Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686132D30AD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 18:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbgLHRMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 12:12:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:53112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730330AbgLHRMY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 12:12:24 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-riscv@lists.infradead.org, Yash Shah <yash.shah@sifive.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     aou@eecs.berkeley.edu, peter@korsgaard.com,
        paul.walmsley@sifive.com, u.kleine-koenig@pengutronix.de,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        gregkh@linuxfoundation.org, palmer@dabbelt.com, andrew@lunn.ch,
        thierry.reding@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
Subject: Re: (subset) [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
Message-Id: <160744749760.30021.12384107049854621023.b4-ty@kernel.org>
Date:   Tue, 08 Dec 2020 17:11:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Dec 2020 10:25:32 +0530, Yash Shah wrote:
> Start board support by adding initial support for the SiFive FU740 SoC
> and the first development board that uses it, the SiFive HiFive
> Unmatched A00.
> 
> Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
> U-boot and OpenSBI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/9] dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
      commit: 76347344c522da78be29403dda81463ffae2bc99

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
