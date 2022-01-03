Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8F148301F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 11:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiACK5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 05:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiACK5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jan 2022 05:57:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39531C061761
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jan 2022 02:57:53 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k66-20020a1ca145000000b00345fa984108so12388819wme.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jan 2022 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hd+nbnFAXZSu5JJl8HmG/IocCwKWdLkG9Z3EYBezq3Q=;
        b=k6FT+pgiTMUAqRxSNEQfh70lI7aXNSgU4h6OAkBmBI97x4cVIyDMq+wLPfh4t51PYH
         564DTJQzKLx6nxvy1hj2JBw6JYujhNrBrpfqcVx+hPcmEsXeB1vQU6cPTKP8EpKIvCW9
         3a2tcKiW3iFBpjFSyD983WQcvjdG6FDqNv6Glq3zsFtvQRiubBL+cQk6FjfdXXRfB/dv
         +I5ugsyfzaJVSlrhOm7Z9qg6x9ukjpzJrIh5Ktnt8UtTtaME51HJIQZk/RtB/cEhcr0H
         dR92Cv02c9Xm8ANJYeKzJt0xqdiDypiMRno2O41QYYDxOIu+/lbnto8N0PnhKK1bBo1V
         x4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hd+nbnFAXZSu5JJl8HmG/IocCwKWdLkG9Z3EYBezq3Q=;
        b=4M76DaNl8maeGwhZfiYtAXhpc9RHHO82nWXFe+JDBwD+SZ0yO7grrJWJkWtYH797PN
         ECXfUfalXXj68H5nWXuMbnDsXsoPnGxzPEwrPEUvIb/X7hD+w0fa3JEsW8vtLZdoYNap
         tiFnTXjFurJQhcB6PxKpCZ208PZOSH4NaJy47RwYj9amikrFQFVGe6dlFbqjeYLEulfS
         NoHCFgCdRl39ZGuN10N14UtwydXR8MFUAc/CfCTyl+0GG4xb6ttYVnicWAPS6PBKQ1tE
         vIeTV5qvUTWXMRozLkwuQZQBGAMGS1U6lvJAL/A9qSAMvCAjvaz7WXWTw+Bkvw6I/BtB
         xfHw==
X-Gm-Message-State: AOAM533+Au+x/18hkuGgm8J/8ms5Cwl5xXVytuFSY8bxwBSmZfXk86pO
        J+O3SsNmRr5xT0pn1CpYUykui/dsKnzKdA==
X-Google-Smtp-Source: ABdhPJz1wnIQYQb3fmOJnt5OmpZb8BMNrwwbEg0c6iSGO6gQgbgdyN9D/OT+1AVEGqHI83O5uzZJjw==
X-Received: by 2002:a1c:287:: with SMTP id 129mr38555174wmc.49.1641207471729;
        Mon, 03 Jan 2022 02:57:51 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id u9sm36237475wmm.7.2022.01.03.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 02:57:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] at24: updates for v5.17
Date:   Mon,  3 Jan 2022 11:57:49 +0100
Message-Id: <20220103105749.85404-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Here are the updates for the next merge window for the at24 EEPROM driver.

Details are in the signed tag, please pull.

Best Regards,
Bartosz Golaszewski

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v5.17

for you to fetch changes up to d08aea21c89dc2d302cadb5c2cc5410b6c3395c8:

  eeprom: at24: Add support for 24c1025 EEPROM (2021-12-13 14:42:39 +0100)

----------------------------------------------------------------
at24 updates for v5.17

- add support for a new model: Microchip 24c1025
- reorganize the compatible definitions in the DT binding document
- drop the at24_client structure by retrieving the struct device associated
  with the chip's regmap

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: at24: Rework special case compatible handling

Heiner Kallweit (1):
      eeprom: at24: remove struct at24_client

Maxim Kochetkov (2):
      dt-bindings: at24: add at24c1025
      eeprom: at24: Add support for 24c1025 EEPROM

 Documentation/devicetree/bindings/eeprom/at24.yaml | 29 ++++-----
 drivers/misc/eeprom/at24.c                         | 68 ++++++++++------------
 2 files changed, 47 insertions(+), 50 deletions(-)
