Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5813C33272F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhCINbi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhCINbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 08:31:38 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371A0C06175F
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 05:31:38 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fu20so900754pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Mar 2021 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSrjiES35aCdYNr3Gs/Gbw7KzGhsarU4hlR/BQl68jc=;
        b=Gjr822rUysls+DO/IaKW0guLXvpy74s0lzlVkhQNR18w9KPTpY85bKItJ9I4/bMcq4
         uWcwrf41u6MwUn3deE9zmPecx2EKrNiOnvwkCBJgs1nZG7/MdWiVWmauS0JV3Hx5jk2U
         OdYFzPJnVsBx7msp8h7qBr8j1gpPzrSRM0z0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSrjiES35aCdYNr3Gs/Gbw7KzGhsarU4hlR/BQl68jc=;
        b=DkRQd6gdzDGi7phxBmUT9dTpCVz0CJXbkleX/Q4fhUgEjZD2nfJeTw+GFzIfuvpIG9
         LFZL22f4v9HCD5Xbhd1pqLyFQdab3F78yiRUs8DENUOznOlMGgTznrBOw70jPWxqVrlb
         2us6sby6XqaHG1/pUNNk1OncUpy2v1Q5txa12YSGmQ7oAti0U2zqilMnviI3EXbwWgl+
         778jYKfwIElriZeEFGcpgb2ZE/0vz6GmjAeRdOqOJUxWZQjqjlroGR3x18AZxSiEFINo
         cMXHZuMdzDeW6lVr3IXkVfR1K2ExqZQfeDFcHRMWC73OIvGUZN+nEMZpzchj4ixFZOPn
         aYxQ==
X-Gm-Message-State: AOAM5333jrCLQHTfmmm9ormz3Nx0UVkP113RsTkwb1elCcvhNWcKSL+6
        K52ZHffY0GdcC/6/nVX5VAz+kQ==
X-Google-Smtp-Source: ABdhPJydsoZxe/mN+r6ufQMJip/FV7qBbuON5iAZf1A8uLG6pDr1rGK9h+vu/34KGvTXj/wqlOjYAg==
X-Received: by 2002:a17:90a:fa0b:: with SMTP id cm11mr4905696pjb.140.1615296697615;
        Tue, 09 Mar 2021 05:31:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:f936:57e5:154d:e0d9])
        by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:31:37 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 0/3] add power control in i2c
Date:   Tue,  9 Mar 2021 21:31:28 +0800
Message-Id: <20210309133131.1585838-1-hsinyi@chromium.org>
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

Hsin-Yi Wang (2):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 include/linux/i2c.h                           |  2 +
 4 files changed, 98 insertions(+)

-- 
2.30.1.766.gb4fecdf3b7-goog

