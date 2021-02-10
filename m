Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF23166FD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 13:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhBJMoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 07:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhBJMmD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Feb 2021 07:42:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F7FC06178B
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 04:39:22 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id g6so2299808wrs.11
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 04:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1kyBZaooKRsp8dgexZ6zNvaY5AzBnW9II7l4W6gOhuw=;
        b=O4lNCmLMV9J0Ms/nyo9bru40D9IVTCxzo8GIO0KKuXiuMjWx2Bf4Yj+8xrqfdwgLKq
         E0iTf4A8gQ8Iord7nPRw2d/z0He3EtJXQRO65BIkDB+S+lKe26C8fqq+l20a+1RbthYa
         OvixAYupu4BoF+sIpiF7hCHCCd+JrXf09UMB+vf6ryDMHJgha8nbYU83INe2+Q/hJO9N
         qaIafM17kRScTPZF1idFxvcFieyuWMPj1JbuByHhNmz7ZN6ZZlJIE2sx3ZE80hvi+Ayg
         Vx6m+/qFAsSR8BfXbBSgOYnBaO9McXZz7ZFYXc/JO7K4aJTia/9Dzuzs0GOKVdjA7zXp
         oJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1kyBZaooKRsp8dgexZ6zNvaY5AzBnW9II7l4W6gOhuw=;
        b=uDcN3fu/NCBPIzkDfmxB+ZTDpinuKwLz+L4uSvj6sNCnGrGF4eYx7uyr10ArAK3ma0
         O3LoTCk+dqfqqQL+5zSjqsdV8t+IezlliCw7DKyRlAGExWLsd8VfI/C8bOmPlnRJlijI
         bgLZoINARmO03UQPw2cEOUzCHWtlSQd9Z6FE89k3YeyWj7WeLIqxiM9Kxw1brCdjkje7
         Hcj9ETgp3bbVp7FuYp24PFy1f7XQCs8tuB9gA04Q4rjde/bVroFlbOHCl9xxk0reISno
         y9PuWboTIm8g3vjA5ZDnZtAVb96XwOYvO3WxAAHLqhwj7jq0Mvme4AxI1pdebaCJYmro
         1iuw==
X-Gm-Message-State: AOAM531u0+cWexu5xqfd0gL4bSqfNtJDW4PWVoPLTLGpMZHQmzkzbznL
        u2piEsnPB/3X5INs6q6HOMKYwA==
X-Google-Smtp-Source: ABdhPJwaMajU0ekWhcAOPZ7M34YWM1+aYu0KvI9knZBZdrhQ7qx+ml71EPfE4k5kUEqP3aSx5RXxKQ==
X-Received: by 2002:adf:e689:: with SMTP id r9mr1369150wrm.273.1612960761021;
        Wed, 10 Feb 2021 04:39:21 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l1sm2001248wmq.17.2021.02.10.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:39:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.12
Date:   Wed, 10 Feb 2021 13:39:19 +0100
Message-Id: <20210210123919.20033-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

This is a single trivial commit for at24 for the v5.12 merge window.
Please pull.

Bartosz

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v5.12

for you to fetch changes up to 5366c48f327ec9e0261333a876384a26da91c854:

  dt-bindings: eeprom: at24: Document ROHM BR24G01 (2021-02-09 19:19:09 +0100)

----------------------------------------------------------------
at24: updates for v5.12

- add a new compatible string to the AT24 DT bindings

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: eeprom: at24: Document ROHM BR24G01

 Documentation/devicetree/bindings/eeprom/at24.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
