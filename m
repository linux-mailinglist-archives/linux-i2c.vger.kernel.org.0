Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EEF53FBEE
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 12:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241914AbiFGKsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 06:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241695AbiFGKr4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 06:47:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADAFED7A9;
        Tue,  7 Jun 2022 03:46:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6177B61577;
        Tue,  7 Jun 2022 10:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D994EC34119;
        Tue,  7 Jun 2022 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654598813;
        bh=hlj2Yw+EG0pWKoO3cXlRjHbXss4PXj721LR0qzOjcRQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=lLjZE/ozDwyHnNNLv6KyRqV2xvU5uJJz9u7TCauhLkOPhBG38x6MdtEwI+8UIDQGw
         uwtQiaJiwSNPU3upK6sgPC39kbtNdgB+CJfvt4RS1u1WkKKQpLeo6s5YlC3hEycLWK
         DZ8Pjgv0h7TbVz5Vt1jDWfcTuWpK/D09EzsT4BVhx4hbG2e1VCKQHVGbNkyCNRk8sg
         k6i/de3UcYlJTd5vP0lgvg+Z56k+nzRjJukId3zcOJcHo7YFPUDXs4S3klIjdIoaFE
         QhfEG8FvKM9beX57uQhEHDZQEfg+6mZSxo/qgqEJSsXBAY9yR2jt850+wpSUTN7I+A
         ZsaWxiF+LqPiw==
From:   Mark Brown <broonie@kernel.org>
To:     linux@roeck-us.net, robh+dt@kernel.org, vkoul@kernel.org,
        matthias.bgg@gmail.com, jic23@kernel.org,
        srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        chunfeng.yun@mediatek.com, fparent@baylibre.com,
        ulf.hansson@linaro.org, wim@linux-watchdog.org,
        qii.wang@mediatek.com, chaotian.jing@mediatek.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
Subject: Re: (subset) [PATCH 00/17] Add support for MT8365 EVK board
Message-Id: <165459880859.302078.17715085151206065145.b4-ty@kernel.org>
Date:   Tue, 07 Jun 2022 11:46:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 31 May 2022 15:50:09 +0200, Fabien Parent wrote:
> This patch series adds support for the MT8365 EVK board.
> 
> This series has dependencies on the following series:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646256
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646091
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646083
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646081
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646076
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646068
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646020
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=646052
> https://lore.kernel.org/r/20220504091923.2219-2-rex-bc.chen@mediatek.com
> https://lore.kernel.org/r/20220512062622.31484-2-chunfeng.yun@mediatek.com
> https://lore.kernel.org/r/20220512062622.31484-1-chunfeng.yun@mediatek.com
> https://lore.kernel.org/r/20220524115019.97246-1-angelogioacchino.delregno@collabora.com
> https://lore.kernel.org/all/20220127015857.9868-1-biao.huang@mediatek.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[09/17] dt-bindings: spi: mt65xx: add MT8365 SoC bindings
        commit: 901fc8e8079e401f3240006cab6629e65579701c

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
