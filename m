Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF6D3765D7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 15:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhEGNPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 09:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237126AbhEGNPN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 09:15:13 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803CAC061761
        for <linux-i2c@vger.kernel.org>; Fri,  7 May 2021 06:14:12 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so4595340pjk.0
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCOlyOIFiZk09QTc1wpSf9iIiwmNKJWxQ3gP9jIAbQE=;
        b=mSpLQhA/xa8vnl35yPqcyaIJv5x2iKpQ79RnozczBUFtCog64lxWk+cW6iEUvnFZR5
         lXSMgIKXAE+diRkzI4rU8zgP6i0MQrZOM4NA32+kAechGNEOToZDzav/4bI5gQVttTG+
         v8FkMm6GIZHzU8+QlMXwDkCy0gAB50XFsATUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCOlyOIFiZk09QTc1wpSf9iIiwmNKJWxQ3gP9jIAbQE=;
        b=qo3AHP48ySLuREHdySmViYqkS10tO+cVG6raKtTjUJml5ac5HAHO/0S0GiSmAhS/cD
         i1slhnyWi7GhLqlTBeFpBhVoqoKj3gMQlRz07TdljZV0A9Vow9MgVD5N2CW3k1JUB6Le
         5fMys0RLV2VUbEJ3pWlWnzy2paH5dS8JlG3Y6rVObSc7CJn9o5VpUDxys6iIHV17KIrZ
         OlvGzdF78tMq5XGYfF5FF+XGzRcMsuIsxInxdMH0uSyz1UA6mZR62ZB9I7CsVidhevH6
         dPwVBOCH08xurtG2taVk4Z+YLun6XY6xOaQwvBhMZrHmjMBnaJonWa9e1NEokkLjoJ4f
         uzww==
X-Gm-Message-State: AOAM531LfGvYZOxXio0fNMCV+vJ14yGF189CMiYm1j/AJd2DnpwtZqy2
        87BMhRiqgsfwiF+LezitAVOYIw==
X-Google-Smtp-Source: ABdhPJy9qeTIxg0nqdJ7guKT0auSMto/VTPsSqmgPnb9RJpyRnb5vWAaDpYKTMsGNe7bTpd2JRQCJQ==
X-Received: by 2002:a17:90a:a589:: with SMTP id b9mr10307171pjq.80.1620393251736;
        Fri, 07 May 2021 06:14:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:711f:8553:a124:a19])
        by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 06:14:11 -0700 (PDT)
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
Subject: [PATCH v21 0/5] add power control in i2c
Date:   Fri,  7 May 2021 21:14:01 +0800
Message-Id: <20210507131406.2224177-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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

Changes since v20:
 - fix regulator check logic in suspend/resume.

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
 drivers/i2c/i2c-core-base.c                   | 95 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 8 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.31.1.607.g51e8a6a459-goog

