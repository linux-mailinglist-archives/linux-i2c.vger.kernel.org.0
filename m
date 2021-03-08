Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26353306DF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 05:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbhCHEgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 23:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234180AbhCHEgP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 23:36:15 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2336C06174A
        for <linux-i2c@vger.kernel.org>; Sun,  7 Mar 2021 20:36:14 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2385184pjv.1
        for <linux-i2c@vger.kernel.org>; Sun, 07 Mar 2021 20:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frFr0rEwZ1mvFx0ODNHz2Mn0uGUh3IUayStZXkwe3Y4=;
        b=oS/pZFhfYsLgWpBMD4U3ondO/K8Dlcn5ex9y+wNgTIJbS6v2IOE/SRXl2p6TL8OFGv
         HUJ1yNbIbYQxJthZQA0Cm41Dx593QLs7qhSoqDrKX9xkwfgHh4TxVYaqB8iyI/q18WOX
         Kj1yLcZRMuMVX0nYsESD3NORPOnyM9AtN9Gic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frFr0rEwZ1mvFx0ODNHz2Mn0uGUh3IUayStZXkwe3Y4=;
        b=raKQDHKF0SBGjyA7dAWZQKtgWnFzVjEAHwyfh7uOdMAc2ZF+zTaaTHngKNIZB5aN0U
         SLrgULzQ4Y46v8LtuBcrl7OU4K8vZE1ZkfLZq/g5miajC8dui/xSP+71u6rV66d20PSc
         MrtB/odmEA+d5pY7CUIRxh3TIOr8Yx7Uv2VLtWrWBevThIOgaRHxmco9IjqtO/eurHL6
         f5/TMJkUsGAb8D+pOaXkBZfb/TlWHl3xjTQUIGGogh6HGaO7OkGK06mKkT7b8P7d7Co3
         UGJzwJH+rNpbgXSbFErFu24rAIMo+irzUj8ryVOaMv2KxqVG0OuU30sBEcYVf9FEVO9Z
         4vGw==
X-Gm-Message-State: AOAM530jLedVhVqns+LSLx3TtQo+RApoWF0QlL+vwMZ8EWzyyDDPRczf
        pAJzqMekTbVrRt2opoiYykWhFg==
X-Google-Smtp-Source: ABdhPJzjTHgZfblSCwgJ8vilflebyR1Y+UKGgoiG73tGWtfd+EgXsnrLI5gUCZ/UqbMJyjDyZQpraw==
X-Received: by 2002:a17:90a:1049:: with SMTP id y9mr22687217pjd.173.1615178174280;
        Sun, 07 Mar 2021 20:36:14 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
        by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 20:36:13 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 0/2] add power control in i2c
Date:   Mon,  8 Mar 2021 12:36:05 +0800
Message-Id: <20210308043607.957156-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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

Bibby Hsieh (2):
  dt-binding: i2c: add bus-supply property
  i2c: core: support bus regulator controlling in adapter

 Documentation/devicetree/bindings/i2c/i2c.txt |  3 +
 drivers/i2c/i2c-core-base.c                   | 93 +++++++++++++++++++
 include/linux/i2c.h                           |  2 +
 3 files changed, 98 insertions(+)

-- 
2.30.1.766.gb4fecdf3b7-goog

