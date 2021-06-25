Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522FF3B445F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 15:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhFYN1n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 09:27:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhFYN1m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 09:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81FD66197B;
        Fri, 25 Jun 2021 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624627522;
        bh=2jRgXYYh1suuTSb/ARhd+TKxo/8YGzp2hFUNykuCvxI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XyQD4b6VgjtIRSy8BYEXVl3AatJZYBtublHC/DMNIEuu1jDlBuMjRd+JfxD7TEif/
         qC4C7vNKSKFhbZzNqg4x5XaR2d+/CyRa47SbRI8BRcJUTL8hyqqKCBSj+x3vYY1tpX
         mr69oSFD1LhJIvvn1FOlYqTlPFbfjD0unS75dqeZQcIPv/0XkRJH5TWhdXOka+8FZH
         uIvaqHWaglDI2bj8+YHKi6Nn/qJWqsdWkjCuRHazLVuHlHEPnKrbBvGy8HTnDegskX
         dsB97Sm/204SFNoARe79rEQvQ3SOYKsIAoqeTJKHQSbXSgyQx8XG8y4gkHSgGJTm/y
         RAh6W+7sAJPzw==
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/5] Add and enable GPI DMA users
Date:   Fri, 25 Jun 2021 14:24:54 +0100
Message-Id: <162462715508.45765.4709893375922153018.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 25 Jun 2021 10:52:08 +0530, Vinod Koul wrote:
> This series adds the GPI DMA in qcom geni spi and i2c drivers.
> 
> For this we first need to move GENI_IF_DISABLE_RO to common
> headers and then add support for gpi dma in geni drivers.
> 
> Also, to reuse the dma-mapping in spi, we add a new field dma_map_dev to
> allow controllers to pass a specific device for dma-mapping
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[3/5] spi: core: add dma_map_dev for dma device
      commit: b470e10eb43f19e08245cd87dd3192a8141cfbb5

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
