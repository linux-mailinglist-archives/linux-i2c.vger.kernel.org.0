Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E094244781
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgHNJ45 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 05:56:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44178 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgHNJ45 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 05:56:57 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:56 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Aug 2020 02:56:54 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:15 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id A98061AC8; Fri, 14 Aug 2020 15:26:14 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 0/2] Implement Shutdown callback for i2c
Date:   Fri, 14 Aug 2020 15:25:38 +0530
Message-Id: <20200814095540.32115-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add tx_dma, rx_dma and xfer_len in geni_i2c_dev struct.
Implement Shutdown callback for geni i2c driver.

Roja Rani Yarubandi (2):
  i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len to geni_i2c_dev
    struct
  i2c: i2c-qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-qcom-geni.c | 59 +++++++++++++++++++++++++-----
 include/linux/qcom-geni-se.h       |  5 +++
 2 files changed, 54 insertions(+), 10 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

