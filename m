Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8123B3C1C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFYFYr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:46076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhFYFYr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:24:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 738BA6140B;
        Fri, 25 Jun 2021 05:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598547;
        bh=NA/PKUB9sUEfGTtChxFr08NQkrRdfdT5k6WfEW3Pdjo=;
        h=From:To:Cc:Subject:Date:From;
        b=bdLdzKfVYFs0zfV/gIIrjH4LZvgya9n1yUGJaXJzynTfse/2SqmIDSyCbsVIPoVZE
         KdjQb4aNgO3wHN9C8qnp9K2thYqIpIEFCTE5jpcRDY0cOxLRB8/WVBgzhZ8D/IyvmP
         hBuRFk1klXFadPlb3LLUvaKMnPNXhOro1Wqc8D4BtsUGT2A4z06KN0Txtvs1IodRZi
         HSxHq9KQGxQnRzor1/v8i9SLpO/TMSfNeAKICNiRpv6lGamQbhZgsdqLzG0iEPJ0SW
         RSqFKUVe893fKv5lNRUFjFgCsWLHswrAB8GIxtocIAtIroW7R47qemlPtv17KtBFEy
         05qvKkXbYuU7A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add and enable GPI DMA users
Date:   Fri, 25 Jun 2021 10:52:08 +0530
Message-Id: <20210625052213.32260-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This series adds the GPI DMA in qcom geni spi and i2c drivers.

For this we first need to move GENI_IF_DISABLE_RO to common
headers and then add support for gpi dma in geni drivers.

Also, to reuse the dma-mapping in spi, we add a new field dma_map_dev to
allow controllers to pass a specific device for dma-mapping

Then, we add spi and i2c geni driver changes to support this DMA.

Changes since v2:
- Add core spi patch for dma_map_dev addition
- rework the logic for getting and releasing channels in both driver, also
  ensure proper cleanup
- Fix the comments recieved from Doug and Bjorn
- Add kernel-doc changes for enum geni_se_xfer_mode

Changes since v1:
 - add r-b from Bjorn on patch 1
 - add more details in log for patch 2
 - Fix the comments from Doug and Bjorn for patch3, notable use read, modify
   update for irq registers, use geni_se_irq_clear() for irq, dont update
   single bit registers, add a bit more description for gpi dma etc

Vinod Koul (5):
  soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
  soc: qcom: geni: Add support for gpi dma
  spi: core: add dma_map_dev for dma device
  spi: spi-geni-qcom: Add support for GPI dma
  i2c: qcom-geni: Add support for GPI DMA

 drivers/i2c/busses/i2c-qcom-geni.c | 309 ++++++++++++++++++++++++++-
 drivers/soc/qcom/qcom-geni-se.c    |  30 ++-
 drivers/spi/spi-geni-qcom.c        | 329 +++++++++++++++++++++++++++--
 drivers/spi/spi.c                  |   4 +
 include/linux/qcom-geni-se.h       |  19 +-
 include/linux/spi/spi.h            |   1 +
 6 files changed, 667 insertions(+), 25 deletions(-)

-- 
2.31.1

