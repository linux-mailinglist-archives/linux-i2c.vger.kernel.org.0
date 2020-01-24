Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3113148C77
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 17:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387793AbgAXQqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 11:46:50 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:40902 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387674AbgAXQqu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jan 2020 11:46:50 -0500
Received: by mail-wm1-f42.google.com with SMTP id t14so94181wmi.5
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jan 2020 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pUtREr+Ws3r/trcxBojq1bGhJO2834MHTf3ASsslT0c=;
        b=Ae10W98/jwFiHAFVhjmh+MjdMcfV+beTkFybuHYrM0wNktcNWIaHhv7S17oC5cPLsQ
         twSn7NdlT2SPO4VfQQIn0yivE9eHYfLc7j0ni38+9JtWx+Y3wHOZ2cydYYJ2Ox6mqqJo
         6erTe9e4ane8whvxu0r8HSpXYq9Q1yjWtCudZjkDX+dlgYXLn8FOeQ9y2iESqqQ4kWC6
         z8PrCsDati0+9pFKCIClgg0TZe7piewutQ0dLvMdjOhlRpK/4qx9HBJ+iXbowclpnlNv
         VPH1RhmHmcuQAVTxb0+XjjoYcaT94xSq9+9p8gXPfWB8zYWNJ3bqPjjf0h0Arw4Mixo8
         vZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pUtREr+Ws3r/trcxBojq1bGhJO2834MHTf3ASsslT0c=;
        b=jh/BmFmRFE+NCk9k0beFOKlmYDrf7h+Q4+c79vuryRrEcKD82k2oCx2cE9dstmxGxW
         mv9ohmhfM0fDsPUbPOIB80WWlQj+NHoWJQ2tA2zgzKD6GQLuI1havP4Ph4BFtmttF6qh
         j0h2u/RRLyiL5Q9KXofzNg5+kR4fh3S0ysyP1V1Kaq/5+ibqir28gUhHOkk7I9Y3dxDU
         VttNFhAJRaV8sI8aAfX0XTK+awbyw8+QpnBvvEBLeJUmTu6VPuuQrz2M81Qxe9oUpL2f
         GT9eSSIC8qQEzYN6TJ8Z7azncW1rLJ/1gapODzvrkLbTJ30fdrZUIQ3aR1lp9LaUREhk
         MSdA==
X-Gm-Message-State: APjAAAUCtpe+iVv7d68l/Fs1emYTtU2rsCJQEqC+BQrE1ess+lPKkDKQ
        p5qbkAqnXMKxaKyRKiWzs3MenQ==
X-Google-Smtp-Source: APXvYqwrvPG7IsEGP1AOjwpF1OjLIHFxp46YnqNxlynJ5/DcmMSkzvOSF7pPiA23tOpW4l03CeWL6w==
X-Received: by 2002:a05:600c:21ce:: with SMTP id x14mr114544wmj.120.1579884408546;
        Fri, 24 Jan 2020 08:46:48 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id f12sm7490018wmf.28.2020.01.24.08.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 08:46:47 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.6
Date:   Fri, 24 Jan 2020 17:46:44 +0100
Message-Id: <20200124164644.20020-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

I'm sorry for the late PR. I was (still am actually) OoO for family
reasons. I hope you can still pull this for the next merge window.

This time the release is pretty big for this driver. We have moved the
support for write-protect pin control into the core nvmem library so that
all nvmem users can use it automatically. All nvmem changes were acked by
Srinivas and have been in next for some time. The DT binding document for
at25 was updated and the patch was acked by Greg KH. The driver also now
supports regulator control and has suspend/resume callbacks.

Best regards,
Bartosz

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-updates-for-v5.6

for you to fetch changes up to cd5676db0574cc1c0b234bc3b17565b07290aa72:

  misc: eeprom: at24: support pm_runtime control (2020-01-23 12:52:57 +0100)

----------------------------------------------------------------
at24 updates for linux v5.6

- minor maintenance: update the license tag, sort headers
- move support for the write-protect pin into nvmem core
- add a reference to the new wp-gpios property in nvmem to at25 bindings
- add support for regulator and pm_runtime control

----------------------------------------------------------------
Bartosz Golaszewski (3):
      eeprom: at24: update the license tag
      eeprom: at24: sort headers alphabetically
      nvmem: fix a 'makes pointer from integer without a cast' build warning

Bibby Hsieh (2):
      dt-binding: eeprom: at24: add vcc-supply property
      misc: eeprom: at24: support pm_runtime control

Khouloud Touil (5):
      dt-bindings: nvmem: new optional property wp-gpios
      nvmem: add support for the write-protect pin
      dt-bindings: at24: make wp-gpios a reference to the property defined by nvmem
      eeprom: at24: remove the write-protect pin support
      dt-bindings: at25: add reference for the wp-gpios property

 Documentation/devicetree/bindings/eeprom/at24.yaml |  9 +--
 Documentation/devicetree/bindings/eeprom/at25.txt  |  2 +
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 ++++
 drivers/misc/eeprom/at24.c                         | 72 +++++++++++++++-------
 drivers/nvmem/core.c                               | 19 +++++-
 drivers/nvmem/nvmem.h                              |  2 +
 include/linux/nvmem-provider.h                     |  3 +
 7 files changed, 91 insertions(+), 27 deletions(-)
