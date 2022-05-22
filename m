Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1299530484
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243706AbiEVQ2Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239510AbiEVQ2X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:23 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808221408F;
        Sun, 22 May 2022 09:28:19 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id B6911CCD0A;
        Sun, 22 May 2022 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236896; bh=cFYMSBAR5nSWZ0V5OXR+W0l5hCGPr4sB3AoRi8xys+4=;
        h=From:To:Cc:Subject:Date;
        b=iVZTYNDWMtYnxOqKI2d4yO/XY1JfnODk3MAUvdBefihwUkYHlS0jfyJSF5YL0O4pP
         OwDLMqLOELknLhzYVhHLIKP95udmQbml9g1dqKEx2+4qJnAByos0Z/W07SESrs2DkY
         Ucx6f33YBZK9LQBZcCpKQJq8OGmgFNx1Pp0qP3vA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 00/14] CAMSS support for MSM8974
Date:   Sun, 22 May 2022 18:27:48 +0200
Message-Id: <20220522162802.208275-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This RFC series adds support for CAMSS and CCI that are found on
msm8974, including the OV8865 found on the FP2.

The only reason it's marked RFC is that CAMSS doesn't behave properly on
this SoC without the last commit which is obviously not upstreamable.
Not sure if this should be a blocker for including most of the other
patches because other than that it seems to work fine and I can get a
picture from the camera sensor. When/if msm8974 gets IOMMU support I
hope this should be resolved and it works without this hack.

I think at least the CCI patches could get applied as they're not
dependent on the CAMSS hack?

Luca Weiss (5):
  dt-bindings: i2c: qcom-cci: add QCOM MSM8974 compatible
  ARM: dts: qcom: msm8974: add CCI bus
  ARM: dts: qcom: msm8974: add CAMSS node
  ARM: dts: qcom: msm8974-FP2: Add OV8865 rear camera
  [DNM] media: camss: hacks for MSM8974

Matti Lehtimäki (9):
  media: dt-bindings: media: camss: Add qcom,msm8974-camss binding
  media: camss: Add CAMSS_8x74 camss version
  media: camss: vfe: Add support for 8x74
  media: camss: video: Add support for 8x74
  media: camss: csid: Add support for 8x74
  media: camss: ispif: Add support for 8x74
  media: camss: csiphy: Add support for 8x74
  media: camss: Add 8x74 resources
  i2c: qcom-cci: add msm8974 compatible

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt  |   7 +-
 .../bindings/media/qcom,msm8974-camss.yaml    | 321 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 184 ++++++++++
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |  70 ++++
 drivers/i2c/busses/i2c-qcom-cci.c             |  35 ++
 drivers/media/platform/qcom/camss/Kconfig     |   4 +-
 .../media/platform/qcom/camss/camss-csid.c    |   3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   7 +-
 .../media/platform/qcom/camss/camss-video.c   |  17 +-
 drivers/media/platform/qcom/camss/camss.c     | 161 +++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 13 files changed, 801 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml

-- 
2.36.0

