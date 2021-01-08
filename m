Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D4B2EF47F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 16:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbhAHPHF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 10:07:05 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33390 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHPHF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 10:07:05 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Jan 2021 07:06:24 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Jan 2021 07:06:22 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Jan 2021 20:35:49 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id AF91228B9; Fri,  8 Jan 2021 20:35:47 +0530 (IST)
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
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V8 0/1] Implement Shutdown callback for geni-i2c
Date:   Fri,  8 Jan 2021 20:35:44 +0530
Message-Id: <20210108150545.2018-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Other two patches of this series have been picked, posting this patch
with fixing minor comments.

Roja Rani Yarubandi (1):
  i2c: i2c-qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-qcom-geni.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

