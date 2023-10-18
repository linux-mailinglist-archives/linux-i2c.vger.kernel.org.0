Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126F97CD6DF
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 10:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbjJRIqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 04:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjJRIqR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 04:46:17 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EB6EA
        for <linux-i2c@vger.kernel.org>; Wed, 18 Oct 2023 01:46:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4065f29e933so67300195e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 18 Oct 2023 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697618774; x=1698223574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd8BKXxvjr0uloNTgW9R+i6AMAjhon6QsafuxwGz6B4=;
        b=Q69pvEHDQHBmBrSw33z/RMm5dF5rcn1ETVAf2Lhd7iPqf2FrNgswmeshx3q4B3Zhoh
         SOVzf+e02IGp28me/JKTRNatdcgr0bc8vppxWSarfVnuewTEGeUPXEPxS0RR5LqJ5uBj
         yQmw4Vufj9Vo4fTp4NNrAyYPj/KXw/rofGcwyrSEtyOQuH36Z8LjfUIRSnXebT0jS1SS
         bTTdLFyqgo1ZMWrRsMs78ybhV3xQ+gmXTaCNpvMWLsmLt8KrrFLQFrtEoX/qTCpL7RV7
         cB6QmyZpyt2FcHeYjkf4DptqN2OyNQInhymwgmCIe0C+H4AWmB0yQriTlA5d2BoAkEEL
         1s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697618774; x=1698223574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd8BKXxvjr0uloNTgW9R+i6AMAjhon6QsafuxwGz6B4=;
        b=EiH3OHkAFlVoGOVu7oDHjkkISAo/0pKqfRHrCvfc2NIGGtBBTX371Be63UmXgjalp1
         CJ7fnwtmuPMlVyTPLIJZMvItijR2UGj5neAcS47CnbVuCr2/MFWPn9GkNR8xydbYHZOg
         cFrJ6p8DS5dopa3LjGgouFzllCOyirvKF8kunxzcYkHUrtPNIqSvFVIDvUWWYPO867t4
         Q4O2a8sAe2xumGofOzNPGHZRZmlKBrC6lAndF8IMBV4uK+AYYn+uSC9dPFdmyEfALffP
         c9cOPFHXdXcCnMnFfRGl+sfzrUB/6fYfXl+jD5MWmksS7OS7AzsfcxfsmzOmkOo8SsiN
         8+rw==
X-Gm-Message-State: AOJu0YzoRjQBt7og0i/fueZ+p3txahb6DlrsMkzBJ1qHgzGo5dqmYy5v
        IJ2rpjrCC7zPj38LmqLGGXhBFJgMhTjnRFNRVXA=
X-Google-Smtp-Source: AGHT+IFxqt423F2wIf8GdcUNFcLMplCpG0XB444S9WFiCR9jTG+h8ENW9zXgvvhK4T+3Ded/UVUf4w==
X-Received: by 2002:a05:600c:46c3:b0:407:5adc:4497 with SMTP id q3-20020a05600c46c300b004075adc4497mr3494010wmo.9.1697618773766;
        Wed, 18 Oct 2023 01:46:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c80a:6ec1:992d:ac38])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c1c1600b00405718cbeadsm1114315wms.1.2023.10.18.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:46:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: updates for v6.7
Date:   Wed, 18 Oct 2023 10:46:10 +0200
Message-Id: <20231018084610.13693-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following updates for the at24 driver for the upcoming merge
window. Details are in the signed tag.

Thanks,
Bartosz

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.7

for you to fetch changes up to 3774740fb22162d2c50e79629c4b3e11022ed7d9:

  eeprom: at24: add ST M24C64-D Additional Write lockable page support (2023-10-16 08:49:15 +0200)

----------------------------------------------------------------
at24 updates for v6.7

- support the write-lockable pages on two more models
- drop at24_get_chip_data()
- use the new __counted_by() attribute in struct at24_data

----------------------------------------------------------------
Alexander Stein (2):
      dt-bindings: at24: add ST M24C64-D Additional Write lockable page
      eeprom: at24: add ST M24C64-D Additional Write lockable page support

Biju Das (1):
      eeprom: at24: Drop at24_get_chip_data()

Kees Cook (1):
      eeprom: at24: Annotate struct at24_data with __counted_by

Marek Vasut (2):
      dt-bindings: at24: add ST M24C32-D Additional Write lockable page
      eeprom: at24: add ST M24C32-D Additional Write lockable page support

 Documentation/devicetree/bindings/eeprom/at24.yaml |  4 +++
 drivers/misc/eeprom/at24.c                         | 42 +++++++---------------
 2 files changed, 16 insertions(+), 30 deletions(-)
