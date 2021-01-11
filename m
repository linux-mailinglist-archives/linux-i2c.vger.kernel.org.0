Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3AE2F195C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731713AbhAKPRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:17:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:53920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728444AbhAKPRu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:17:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDB6422795;
        Mon, 11 Jan 2021 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378230;
        bh=QqIEqDXkBOPauIfpjp6CQHoxGmT+IBo0bjk1fPqQook=;
        h=From:To:Cc:Subject:Date:From;
        b=PxuROWJgIsfrtu8forYfa8hejmiYwSla+uXHR2V933YSPJwboBxAYKqW2aQ+c/SJK
         GXQmEJVaduwCJQSqygrtNt+8FzINha1ExrFFF8t4khOGuQz1qzCduj5qI6zb9J3UOL
         Rex/sXPobf4TxXfmRI4Ts1ibUc1fBFpYUQYrgqWJf7ZrQcepko8Sv2D0ONjAtSQ3RL
         VXqAem+9U2EUUxX3/JXMi4VBD5A10xWiu7ZZiiWmqscakDZmiIwHFp13hcAdftZ0M8
         xBNKaNYTRdVCPyIewaKgdkPDQeF4fnnfWP5Q5r1ytzbv8k8ONlxbpt7A7F5Tgvwh3X
         g/YAZQR8BhKaw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add and enable GPI DMA users
Date:   Mon, 11 Jan 2021 20:46:44 +0530
Message-Id: <20210111151651.1616813-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This series add the GPI DMA in qcom geni spi and i2c drivers. For this we
first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
headers and then add support for gpi dma in geni driver.

Then we add spi and i2c geni driver changes to support this DMA.

Lastly, add the GPI dma nodes and enable dma for spi found in Rb3 board.

To merge this, we could merge all thru qcom tree with ack on spi/i2c.

Vinod Koul (7):
  soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
  soc: qcom: geni: move struct geni_wrapper to header
  soc: qcom: geni: Add support for gpi dma
  spi: spi-geni-qcom: Add support for GPI dma
  i2c: qcom-geni: Add support for GPI DMA
  arm64: dts: qcom: sdm845: Add gpi dma node
  arm64: dts: qcom: sdm845: enable dma for spi

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |   4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  57 +++
 drivers/i2c/busses/i2c-qcom-geni.c         | 246 ++++++++++++-
 drivers/soc/qcom/qcom-geni-se.c            |  55 ++-
 drivers/spi/spi-geni-qcom.c                | 395 ++++++++++++++++++++-
 include/linux/qcom-geni-se.h               |  20 ++
 6 files changed, 747 insertions(+), 30 deletions(-)

Thanks
-- 
2.26.2

