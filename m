Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C4C5B5F52
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 19:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbiILRcX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 13:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiILRcV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 13:32:21 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCC921E24
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 10:32:19 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h21so6762672qta.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SfRlMEdYqoQDZzogonO2A8PPDLAM0b7+2EbyJQBKZ7c=;
        b=rBlHTgi/wJBt1XhWzXH7HQfvLaLhptda2ngGPVNiPPwPWTXfLhViM94wRgACULW4HI
         qBEJtyfxLQLs8CClO4dxJM+1Joy6/hKIrfCtVPaLjhWfgq1TghKkivYthsUO4L8Kh6Og
         kK/vfKAdQsD4RorqvRvxLktX3UKADzMw+S9oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SfRlMEdYqoQDZzogonO2A8PPDLAM0b7+2EbyJQBKZ7c=;
        b=pX+rwrX7HSr/6ThgwFx+xzijWhuJEsmNSirlso5pznh1XVonfAeXIbxehvIHhNyl4K
         i3yAfXWl4rDB+KyCu9eFevySw4bCTl012Vkm5BZTePMAlYVm+AFSVAOFQdzoYGfLUH/9
         oLfauABQLpDDFX5blXWRehm4M3xN8pzUNLvip5tVYFi2csFDlZbevCQ0RcZr8GIpBxEA
         QFE1bk4majIVLAi4YbaVhuC0Ll5YMwF1ZfpMD5f3F0CyPqJQjX+cFW7yb6LjwCwtlWZ3
         j3kdBc8ZZIL/EFg97un2uFNhiwKffadP6olNMHfJHMa6HqRcjrQxC26fiP81RaUqNi2a
         /4WQ==
X-Gm-Message-State: ACgBeo0ajv2/RcKmpCokIxsU0noB7mfUk4GREt/pZijIKzuqgkq2xl/A
        YHot/g6/3WM31MRaOZkof3j7JQ==
X-Google-Smtp-Source: AA6agR5+OtszVJdRVxIYBUWn0P2VkJNin6g7+Q/OW6I9wD/u1RbUUFteyh4EjK5fIHaDnYGgFpAAsA==
X-Received: by 2002:ac8:5e0d:0:b0:35b:af5b:42df with SMTP id h13-20020ac85e0d000000b0035baf5b42dfmr7596661qtx.100.1663003938801;
        Mon, 12 Sep 2022 10:32:18 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id h63-20020a376c42000000b006b8d1914504sm8289394qkc.22.2022.09.12.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:32:18 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Matt Ranostay <mranostay@konsulko.com>
Subject: [PATCH v3 0/5] HID: mcp2221: iio support and device resource management
Date:   Mon, 12 Sep 2022 10:31:57 -0700
Message-Id: <20220912173202.16723-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matt Ranostay <mranostay@konsulko.com>

This patchset is primarily to enable iio support for the MCP2221 HID driver,
but requires several Kconfig changes and device resource management.

First attempt of this patchset is referenced here:

Link: https://lore.kernel.org/all/20220729154723.99947-1-matt.ranostay@konsulko.com/

Changes from v1:
* Fixing various Kconfig recursive dependencies that appear with 'imply IIO'
* Switch hid-mcp2221 driver to device managed resources for i2c support
* Reworking patchset per advice on lore.kernel.org link above

Changes from v2:
* add linux-iio list to CC

This is a resend since forgot linux-iio@vger.kernel.org in original post

Sorry for the spam to other lists..

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

