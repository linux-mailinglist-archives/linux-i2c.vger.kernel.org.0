Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD472CD3B8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 11:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbgLCKdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 05:33:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36077 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388701AbgLCKdw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 05:33:52 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Dec 2020 02:32:44 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Dec 2020 02:32:42 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Dec 2020 16:01:59 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 31E3F2819; Thu,  3 Dec 2020 16:01:58 +0530 (IST)
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
Subject: [RESEND PATCH V6 0/2] Implement Shutdown callback for geni-i2c
Date:   Thu,  3 Dec 2020 16:01:54 +0530
Message-Id: <20201203103156.32595-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Below patch is picked:
[V6,1/3] soc: qcom: geni: Remove "iova" check

Resending below patches for review:
[V6,2/3] i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
[V6,3/3] i2c: i2c-qcom-geni: Add shutdown callback for i2c

Thanks,
Roja

Roja Rani Yarubandi (2):
  i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
  i2c: i2c-qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-qcom-geni.c | 104 ++++++++++++++++++++++++-----
 1 file changed, 88 insertions(+), 16 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

