Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301A42A08DF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 16:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgJ3PAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 11:00:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15998 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgJ3PAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Oct 2020 11:00:42 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Oct 2020 08:00:41 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Oct 2020 08:00:39 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Oct 2020 20:30:05 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id AF77326B6; Fri, 30 Oct 2020 20:30:03 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V6 1/3] soc: qcom: geni: Remove "iova" check
Date:   Fri, 30 Oct 2020 20:29:57 +0530
Message-Id: <20201030145959.505-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030145959.505-1-rojay@codeaurora.org>
References: <20201030145959.505-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove "iova" check from geni_se_tx_dma_unprep and geni_se_rx_dma_unprep
functions as checking with dma_mapping_error() is enough.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V5:
 - This is newly added patch in V5. As per Stephen's comments separted
   this patch from shutdown callback patch.

Changes in V6:
 - Fixed nit-picks in commit text.

 drivers/soc/qcom/qcom-geni-se.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index d0e4f520cff8..0216b38c1e9a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -705,7 +705,7 @@ void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
-	if (iova && !dma_mapping_error(wrapper->dev, iova))
+	if (!dma_mapping_error(wrapper->dev, iova))
 		dma_unmap_single(wrapper->dev, iova, len, DMA_TO_DEVICE);
 }
 EXPORT_SYMBOL(geni_se_tx_dma_unprep);
@@ -722,7 +722,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
-	if (iova && !dma_mapping_error(wrapper->dev, iova))
+	if (!dma_mapping_error(wrapper->dev, iova))
 		dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEVICE);
 }
 EXPORT_SYMBOL(geni_se_rx_dma_unprep);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

