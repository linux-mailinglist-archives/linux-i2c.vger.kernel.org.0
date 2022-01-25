Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AB149B201
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 11:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345190AbiAYKeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 05:34:11 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:32956 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345277AbiAYKVR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 05:21:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8A4361645;
        Tue, 25 Jan 2022 10:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85412C340E0;
        Tue, 25 Jan 2022 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643106071;
        bh=dDZYgGbA0BHGN18HiUB3PXb8Mel6TNqbFMOFcstIxX0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Dk+O+jx9RNfAIRNl+G5yibdxkkq8aTGXmW91f6mxjLCST3oy+fJt+u4/SRVhCxwpw
         V4COe9T6WaXtk7IlXR17mBCgwBp4NdpQVxrZVQBMRo4fukpDBetZZE/3AhUipDYJfZ
         xDjnOl5awl586lrBjMlr+/CxVsQxyeLRfUN/t+E2n5TSLam4ejfcYmGSP8J+81pjOo
         E1JEbrV6QM5bmj7eTrXB6ABpB8aUHr/6lJay6YVAuVOwXsam2ucGeIdLB6MC6PKHJh
         rs61dpnbb/ib/qZXwyOem11DRLndWGy6AorM4XzUTNqRuyGvWbZ7/xy4q12565R+d4
         GBF9r1mIDxWGQ==
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linus.walleij@linaro.org, conor.dooley@microchip.com,
        linux-kernel@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        lee.jones@linaro.org, jassisinghbrar@gmail.com,
        linux-usb@vger.kernel.org, thierry.reding@gmail.com,
        palmer@dabbelt.com, linux-pwm@vger.kernel.org,
        linux-gpio@vger.kernel.org, gregkh@linuxfoundation.org,
        bgolaszewski@baylibre.com, linux-crypto@vger.kernel.org,
        robh+dt@kernel.org, u.kleine-koenig@pengutronix.de,
        linux-i2c@vger.kernel.org, paul.walmsley@sifive.com
Cc:     geert@linux-m68k.org, bin.meng@windriver.com,
        lewis.hanly@microchip.com, ivan.griffin@microchip.com,
        krzysztof.kozlowski@canonical.com, heiko@sntech.de,
        atishp@rivosinc.com, daire.mcnamara@microchip.com
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v4 00/14] Update the Icicle Kit device tree
Message-Id: <164310606421.75071.15666469655719890555.b4-ty@kernel.org>
Date:   Tue, 25 Jan 2022 10:21:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:41 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This series updates the Microchip Icicle Kit device tree by adding a
> host of peripherals, and some updates to the memory map. In addition,
> the device tree has been split into a third part, which contains "soft"
> peripherals that are in the fpga fabric.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[06/14] dt-bindings: spi: add bindings for microchip mpfs spi
        commit: 2da187304e556ac59cf2dacb323cc78ded988169

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
