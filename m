Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF5A4598D0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 01:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhKWADz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 19:03:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:44224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232678AbhKWADo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF3DB61027;
        Tue, 23 Nov 2021 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637625635;
        bh=01cYwVbEdh0X7Ig5gVg6S/mgZIzXX2UFJSaD0Nf/IgU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=U1nmBoWjhnKgcYW1P9S5O0K0Rs11K/69Wj8qIMIwjMYyqTSq9SSAFIvwKX46MCafv
         bzKXJmvlxQfZ96AyBeB+jN1NZHMYBe1gJ7eNUTWvU7RFnJQFeQsHUNTWr2I2h6zLDs
         gH6aaEAr75ufBXmH79TfSd8EAGD3NX716TmMcNtk8csTCVWeFZkWmIzJBBp9k7ASdG
         K2PuMIsmI99E0MK1tlq8fKQ5hQrpmALZjV5BmVplWZXNKDZaIKvK4uNe8TxtotADZv
         H2Sln2ND0ACs8GbYP6iiLLWccxe9xFzttrBoEXugXv3gYH6EuehNCPKvRhbOQeOHqf
         Uta6pbTYeOIbA==
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        wim@linux-watchdog.org, s.hauer@pengutronix.de,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, ulf.hansson@linaro.org,
        linux@rempel-privat.de, linux@roeck-us.net
Cc:     kernel@pengutronix.de, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org, daniel.lezcano@linaro.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        festevam@gmail.com, Peng Fan <peng.fan@nxp.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Subject: Re: (subset) [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
Message-Id: <163762563048.2472045.8052329194047350725.b4-ty@kernel.org>
Date:   Tue, 23 Nov 2021 00:00:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 20 Nov 2021 19:34:46 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 
> V5:
>  only fix patch 8/8 "arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board"
>   - Correct bus-width to 8 for eMMC
>   - Drop pinctrl enet which no user
>  Drop patch 1/9 in V4, since in merged in linux-next
>  Add A-b/R-b tag
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[3/8] dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
      commit: 49cd1eb37b487036f51bd57b591f7b5760a10e02

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
