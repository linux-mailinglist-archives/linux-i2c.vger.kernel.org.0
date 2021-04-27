Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A115F36BEEA
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 07:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhD0FhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Apr 2021 01:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhD0FhI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Apr 2021 01:37:08 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A05C06175F
        for <linux-i2c@vger.kernel.org>; Mon, 26 Apr 2021 22:36:23 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso6604817pjs.2
        for <linux-i2c@vger.kernel.org>; Mon, 26 Apr 2021 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTHnAMIQD5s8JadjAbGJIjLqhqT66XAtuscyCUM1Exg=;
        b=iDVXwOEZxmA8fOzgfknudnogPZoKYmxt3u8dTcHSHwypV0CykQKeRziphRLC3veOyJ
         AnOIFpfBBOdlNpdVwEX7841ZSHmTd/+D00vrCuLcizuefC4WPLuMgL6v9IyHllx2fhBm
         qc1fJPhDE1Z3eibkPtW/NYxlStO0vq/IeLVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTHnAMIQD5s8JadjAbGJIjLqhqT66XAtuscyCUM1Exg=;
        b=tYf6UNM03YhyWuLzvFkBoDovorB4Aq42bh8y4cVNU/7bmzTptKVTkDs01BCItJAGNH
         BKj4DIpHHZsn3YczsDC2hSVeabTkwpOGsaOsSY+mIwiR5RXRebS2B88WL2u8TzwmX1Gl
         dllcPQndZMm+0ze85CweuQj4JV4/JaOYcRAu4uS5MXlEOOIIxJkUikPu16E2lGba7iNK
         YotAgwY+3Yv0PQ1AAMf2H4ceNRYhBnFOujze4ftQMCiJXWjgMXU1JcfA6O208GVaHD7M
         n9XJQxi+l8jHYUZOMa9zhGXcLYG0X76v9vksFpUAshddNhX43NHQH35S03uihf6iHCFc
         3how==
X-Gm-Message-State: AOAM5304pKwG8hMN74CE2CBrV8JvokI2z4F86cisRYOmtnv/v2AH5zvb
        dVKCykqhyaFSYRurmPxMhbi32A==
X-Google-Smtp-Source: ABdhPJwhDlroLXq4uzG2AtyLbgaJBtpApsdyh91sUIMYLFNmkYl6oY9Myfj40DiDCM4x+JYA/8iPoA==
X-Received: by 2002:a17:90a:5907:: with SMTP id k7mr3159032pji.197.1619501782729;
        Mon, 26 Apr 2021 22:36:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
        by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 22:36:22 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v20 0/5] add power control in i2c
Date:   Tue, 27 Apr 2021 13:36:12 +0800
Message-Id: <20210427053617.27972-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Although in the most platforms, the power of eeprom
and i2c are alway on, some platforms disable the
eeprom and i2c power in order to meet low power request.

This patch add the pm_runtime ops to control power to
support all platforms.

Changes since v19:
 - resend v19 with fix tag added.

Changes since v18:
 - Fix a function name conflict with drivers/gpu/drm/i915/selftests/i915_gem.c

Changes since v17:
 - Add a patch to fix unbalanced regulator disabling.
 - Add dts patch.

Changes since v16:
 - request regulator in device instead of in the core.
 - control regulator only if it's provided.

Changes since v15:
 - Squash the fix[1] for v15.
[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/

Changes since v14:
 - change the return value in normal condition
 - access the variable after NULL pointer checking
 - add ack tag

Changes since v13:
 - fixup some logic error

Changes since v12:
 - rebase onto v5.7-rc1
 - change the property description in binding

Changes since v11:
 - use suspend_late/resume_early instead of suspend/resume
 - rebase onto v5.6-rc1

Changes since v10:
 - fixup some worng codes

Changes since v9:
 - fixup build error
 - remove redundant code

Changes since v8:
 - fixup some wrong code
 - remove redundant message

[... snip ...]


Bibby Hsieh (1):
  i2c: core: support bus regulator controlling in adapter

Hsin-Yi Wang (4):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply
  misc: eeprom: at24: check suspend status before disable regulator
  arm64: dts: mt8183: add supply name for eeprom

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 8 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog

