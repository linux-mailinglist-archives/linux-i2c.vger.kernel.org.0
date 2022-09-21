Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB215BF654
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 08:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiIUGbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 02:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIUGat (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 02:30:49 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1E626AE1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:30:47 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id d17so3308045qko.13
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ynq2EL20CO6hM5n78mikzYmKYVR0vy9jxqLHwfMIlh8=;
        b=cWIUc3dJWuEwYUSz2ou4UAE89B4CrXEk8zbIYIpbQ4edujT50r2OrlBK+Sx49PUV8U
         DisR5DjmeqxnNcZBowjXUQsPKK8QNvljsiHXMqkv3srkoO8rcKUMjCL+sCQG6bmkxEtS
         LZDBCGnSPQndbho1fB5Q5A2CBcg1NWsx4HF8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ynq2EL20CO6hM5n78mikzYmKYVR0vy9jxqLHwfMIlh8=;
        b=5yW/0bCpSIz75kS109CpY1LHRSakXc2RRa4n3LzV6xmL9ZYvhwAWUu27eaESjZ7SVi
         rdI2AFlpVaLbakE81x9ZBis/fWwmB7flQqNsvpdsfHV8iI2Vkf+ya52be54dPmlEDvuK
         Jn54BHVLmBepi8vWiSO2JsvgvmKZj5KM89qTzFB0pEhvX0VeR6OZC4Oelm2GnPNMje9b
         FC+1l4WH9TA4kBBCLrdqqsJVXyWxX0EONpJQ+y5db8/NT5qemrXoO06Za7nBsBUNhYG/
         SurNQPY6ab6JLp2LMtRdO++/JHyA4xdIgv2/Jz9cMHifacMW0IY5ItAAkURFLYLOMnj6
         hiBw==
X-Gm-Message-State: ACrzQf2yXRLYfhBnqFl23effqsxBpSIv6tREET7VPy5owqqcFGZnurPW
        uPOOQSCDH9ZkRYfWkDnPnNtAWw==
X-Google-Smtp-Source: AMsMyM6G36yO/HaPzW90E2W3HOgt/jMLVKw0pYL7mA241IBW6HiYe+3BObWfuMLcGfd/As4UQwTmwg==
X-Received: by 2002:a05:620a:d96:b0:6ce:bca6:9dd0 with SMTP id q22-20020a05620a0d9600b006cebca69dd0mr19477102qkl.152.1663741846903;
        Tue, 20 Sep 2022 23:30:46 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:46 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 0/5] HID: mcp2221: iio support and device resource management
Date:   Tue, 20 Sep 2022 23:30:21 -0700
Message-Id: <20220921063026.89619-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset is primarily to enable iio support for the MCP2221 HID driver,
but requires several Kconfig changes and device resource management.

First attempt of this patchset is referenced here:

Link: https://lore.kernel.org/all/20220729154723.99947-1-matt.ranostay@xxxxxxxxxxxx/

Changes from v1:
* Fixing various Kconfig recursive dependencies that appear with 'imply IIO'
* Switch hid-mcp2221 driver to device managed resources for i2c support
* Reworking patchset per advice on lore.kernel.org link above

Changes from v2:
* add linux-iio list to CC

Changes from v3:
* replace .remove() tasks with devm_add_action_or_reset() in .probe()
* reschedule SRAM configuration read on failures
* add IIO_CHAN_INFO_SCALE values for ADC + DAC based on reference voltage

Matt Ranostay (5):
  i2c: muxes: ltc4306: fix future recursive dependencies
  iio: addac: stx104: fix future recursive dependencies
  iio: dac: fix future recursive dependencies
  HID: mcp2221: switch i2c registration to devm functions
  HID: mcp2221: add ADC/DAC support via iio subsystem

 drivers/hid/Kconfig       |   1 +
 drivers/hid/hid-mcp2221.c | 297 ++++++++++++++++++++++++++++++++++----
 drivers/i2c/muxes/Kconfig |   2 +-
 drivers/iio/addac/Kconfig |   3 +-
 drivers/iio/dac/Kconfig   |   6 +-
 5 files changed, 275 insertions(+), 34 deletions(-)

-- 
2.37.2

