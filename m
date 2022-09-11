Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83BE5B4B37
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 03:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiIKBlL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 21:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiIKBlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 21:41:09 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AD73054E
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:06 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id q8so4245189qvr.9
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=c5vcW1lBPXfKib2G8cgHNSZRBAYnHmthJtjHqJonCT0=;
        b=LGhvldT2C8eMWAFuOEUlpXsqCQ9luO2q8VanSyu0OeUP7xaFFFPKA2Z4QAtrJzL7zF
         5m3Q7FwGvlRPm6VTPmSo+4kw/eJs06TUSNKEuyf+LzXOvLzF6NG+rzbjldiGxZ8PCiLB
         Kg+ibVWubXsSum7vqCjUuljT/Lrp1FcoiejLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=c5vcW1lBPXfKib2G8cgHNSZRBAYnHmthJtjHqJonCT0=;
        b=T1hpetWz1t9EkZnrentIQIPleVOMjuelgPvWJGl0UntrLUq2U7nwgsLM+6qo2wWXwy
         IvXCoXL5IXhivUCHZHOEM6ACmR1gaRNkC1NURUlyGXM6z+NTVBcsqNbQGo/6Pv+R28Rr
         TCZ9IfHO1JR3sY9k+c7VsqwD4gMaT+VVuQouSXFE0Tz2skwKJkaU0+UGcaJd8u+a+MLs
         7NYykXzG3UoaE1LJjkCKFLz4Q8ma/KRpelpRpXjLG/4HW7FarJMiddkneqKmnNnFHgg2
         Osl4KjiGlzjUzyx0iDxmBcSPwpLZ5ls3SfyQ3Ps/l7QJSBCPhqRI8dCl3zBDtiUUagxR
         dhkA==
X-Gm-Message-State: ACgBeo1bDtn/xyAysYk+DZJp56EFnoJngp6XHbWniODK9EtgMLnv2DT/
        EO2nck8D4wc4kcIhOJmiuDjbTg==
X-Google-Smtp-Source: AA6agR4141o6DsC4sZdZt2rHuKXxrWqLv/swTx7Gaf+Oai8/E4GxT5jZ+2ddQT95pzXmIM8Ja+dT8g==
X-Received: by 2002:a0c:9a4c:0:b0:4a4:3ad8:3c28 with SMTP id q12-20020a0c9a4c000000b004a43ad83c28mr18314352qvd.124.1662860465543;
        Sat, 10 Sep 2022 18:41:05 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:04 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt@ranostay.org>
Subject: [PATCH v2 0/5] HID: mcp2221: iio support and device resource management
Date:   Sat, 10 Sep 2022 18:40:43 -0700
Message-Id: <20220911014048.64235-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matt Ranostay <matt@ranostay.org>

This patchset is primarily to enable iio support for the MCP2221 HID driver,
but requires several Kconfig changes and device resource management.

First attempt of this patchset is referenced here:

Link: https://lore.kernel.org/all/20220729154723.99947-1-matt.ranostay@konsulko.com/

Changes from v1:
* Fixing various Kconfig recursive dependencies that appear with 'imply IIO'
* Switch hid-mcp2221 driver to device managed resources for i2c support
* Reworking patchset per advice on lore.kernel.org link above

Matt Ranostay (5):
  i2c: muxes: ltc4306: fix future recursive dependencies
  iio: addac: stx104: fix future recursive dependencies
  iio: dac: fix future recursive dependencies
  HID: mcp2221: switch i2c registration to devm functions
  HID: mcp2221: add ADC/DAC support via iio subsystem

 drivers/hid/Kconfig       |   1 +
 drivers/hid/hid-mcp2221.c | 196 ++++++++++++++++++++++++++++++++++++--
 drivers/i2c/muxes/Kconfig |   2 +-
 drivers/iio/addac/Kconfig |   3 +-
 drivers/iio/dac/Kconfig   |   6 +-
 5 files changed, 195 insertions(+), 13 deletions(-)

-- 
2.37.2

