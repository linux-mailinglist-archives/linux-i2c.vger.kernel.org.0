Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AEA2E2611
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Dec 2020 12:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgLXLNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Dec 2020 06:13:33 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1807 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgLXLNd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Dec 2020 06:13:33 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:12:52 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:12:50 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:42:13 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 87B692DC8; Thu, 24 Dec 2020 16:42:12 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 0/3] Add support for assigned-performance-states for geni i2c driver
Date:   Thu, 24 Dec 2020 16:42:07 +0530
Message-Id: <20201224111210.1214-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Roja Rani Yarubandi (3):
  dt-bindings: power: Introduce 'assigned-performance-states' property
  arm64: dts: sc7180: Add assigned-performance-states for i2c
  i2c: i2c-qcom-geni: Add support for 'assigned-performance-states'

 .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 24 +++++++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 49 +++++++++++++++++++
 3 files changed, 122 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

