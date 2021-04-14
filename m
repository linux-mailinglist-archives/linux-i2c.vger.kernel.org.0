Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12A735EFE5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhDNIk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244679AbhDNIih (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:38:37 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67F6C061574
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:14 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so2686784pjb.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziD1BQdNKZSqD9NFOROVnnc3R2EFM0orDAwFpUzsN4A=;
        b=C0vWj0hcBIafvHaGDWKGXb8qFbK28K+6CTcbRx+jBhqGxVEenk0ZpfI0OEJ3GBjUn1
         OI3le/p6rRWJtcT/v150Mb1TBw0aVJ4I4ujf8XZJ6QCEcWxfboN3sWqrCM1RMVPgD/7m
         LGkG0VLXouLy5TRv1hH1BP9Xpzl7X+4Qz8jbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziD1BQdNKZSqD9NFOROVnnc3R2EFM0orDAwFpUzsN4A=;
        b=Vq8NYo9uZ76298NwY6dq4yuHQi0xaY+4sELyHocZj3G8jPpz0PXV0I5y24QKmrxEUr
         yjPpEf8tQ4A8qK0yDrtW+ihiEv40FQSBSMAGGQGM1N2AjnaICazKCaVj+K4rLnViySKx
         j8R2D+cCc5drvSORlsleZwZ0TnL6A0ZsBgBonoeWDtPsv6cQdeR1wg2DahKmtSwKAKWJ
         /TKrrllrDzezHNkClEmCa5tglvEkr/X4t08ILv0B0lW1TX1u7jSdtI50O2cjueJ4J4Uc
         hwIgTIyrSkqMGCbdu4psQX+IqcxzMcJXmgSDw+NY2QnJr3lvdJfOjzBvAujDTrNkAyql
         jTJQ==
X-Gm-Message-State: AOAM532RNc1723yZ5NkFxabY6pENQFQmto9M2XVkYRCBRbclpSBBuJgv
        F9TkKvu1VseeGsbJoheAly5P+g==
X-Google-Smtp-Source: ABdhPJxSlTkPVFR0T8QT7aqFYNKg9cTSJzvySRAavLQ24KU4Uo3AyiacyaFpCBzs8QBA2CP0H23BOA==
X-Received: by 2002:a17:902:f2d1:b029:eb:2e32:8804 with SMTP id h17-20020a170902f2d1b02900eb2e328804mr7489637plc.40.1618389494389;
        Wed, 14 Apr 2021 01:38:14 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:13 -0700 (PDT)
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
Subject: [PATCH v18 0/5] add power control in i2c
Date:   Wed, 14 Apr 2021 16:38:04 +0800
Message-Id: <20210414083809.1932133-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
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
2.31.1.295.g9ea45b61b8-goog

