Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C201F3C49
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 15:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgFIN0u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 09:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgFIN0t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 09:26:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF8DC05BD1E;
        Tue,  9 Jun 2020 06:26:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s88so1399988pjb.5;
        Tue, 09 Jun 2020 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PjgYBNZkkJ+Dumdoc0Hlqfs0IRx7oFITY6Yyd4osHSM=;
        b=qlWkEznIMn5JbwERE/cmdiBazioDv1eZrG6VG5S/M5gPRqhS99hbVPE22TkTnN1d0B
         bPEUEE+QfHcp3rG0vk4cBhQPyULjAXBoN6eZ3vInSBQZezYpO5OH662IVjbDHdDQM7Pn
         hmVlApyWWPV1Dl8fQYMK/0ztzObKC+hDYu9Ag2iLsHAuBxtuWYIHEIhsIWkNJL8TJyVS
         POwrnx2FsVRGqPFILSnEylscqhuiYMuobqB9oqpHXUK3qclRlF+NY1rIXG1iMyB92duk
         u7KGuZae9lhXYVh0uHWA2njeca95MdeTGBxNOa8HjxQPyGiPRzC+kLtVRj3zigIKaTS8
         sLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PjgYBNZkkJ+Dumdoc0Hlqfs0IRx7oFITY6Yyd4osHSM=;
        b=Y1VtlRQFh7Ei5vC9MbW5Xz56v8SveE//GB3MGywl/7zbKan+pv3h74BNCelAQnpZAI
         1qRhQCuK0jG4F4DpqhAzOyRp13r7VE0hxUxjYfnQQy6/aYJMSm7lJaTnQkfyPJzKvSdI
         35xNdcLPv/LvUSBnGAt8PFm4DP3wHC7ezdZA8pP8TRwt6FkUS7W5qDhJnJE/zAAbWx77
         kxwYzVrLWGzJSUnLbZ6FUVoBjwTwjLuMvn1Noft7QcRxdB2BPWMyFsxXMu8k8yvizbF1
         bzmmEc/yl0LTj36S//ZdvagbO+9L6Cjm53+EOaQYy05BmiML+VlZyu5b1wAmRQKEz32E
         6IgQ==
X-Gm-Message-State: AOAM5328lV8pX7mQk1cWbl/BtRz5g31Hg7s5mmPfUIyqcc93UI8AzTbQ
        STcMGeSnzpcFJ55kpWGg4Kw=
X-Google-Smtp-Source: ABdhPJxxfhUMGVH6Bs+zE9AXCufQP4t+CEN0WSM3o76ybXzA0BlMm1MQxbpCBPvFTgA2PHmmY4X1tQ==
X-Received: by 2002:a17:902:aa4a:: with SMTP id c10mr3469848plr.0.1591709209326;
        Tue, 09 Jun 2020 06:26:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
        by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:26:48 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        pierre-yves.mordret@st.com, philippe.schenker@toradex.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 0/4] Enable stmpe811 touch screen on stm32f429-disco board
Date:   Tue,  9 Jun 2020 21:26:39 +0800
Message-Id: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset is intend to enable stmpe811 touch screen on stm32f429-disco
board with three dts and one i2c driver changes.

has been validated by ts_print tool

Changes log:
V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot

V3: just add change log in [PATCH V3 3/4] below ---

V2: remove id, blocks, irq-trigger from stmpe811 dts

V1:
ARM: dts: stm32: add I2C3 support on STM32F429 SoC
ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
ARM: dts: stm32: enable stmpe811 on stm32429-disco board
i2c: stm32f4: Fix stmpe811 get xyz data timeout issue

dillon min (4):
  ARM: dts: stm32: add I2C3 support on STM32F429 SoC
  ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
  ARM: dts: stm32: enable stmpe811 on stm32429-disco board
  i2c: stm32f4: Fix stmpe811 get xyz data timeout issue

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 +++++++++
 arch/arm/boot/dts/stm32f429-disco.dts  | 47 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi       | 12 +++++++++
 drivers/i2c/busses/i2c-stm32f4.c       | 12 ++++++---
 4 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.7.4

