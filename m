Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B7C3901C4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 15:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhEYNNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 09:13:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38222 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhEYNN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 09:13:26 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 06:11:45 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 06:11:43 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 18:40:56 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 074A4334E; Tue, 25 May 2021 18:40:54 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V11 0/2] Implement Shutdown callback for geni_i2c 
Date:   Tue, 25 May 2021 18:40:49 +0530
Message-Id: <20210525131051.31250-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Please review the patches.

Roja Rani Yarubandi (2):
  i2c: i2c-qcom-geni: Add shutdown callback for i2c
  i2c: i2c-qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM
    ops

 drivers/i2c/busses/i2c-qcom-geni.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

