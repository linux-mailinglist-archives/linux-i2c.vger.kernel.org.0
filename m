Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 910A0105BA3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 22:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKUVLG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 16:11:06 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:37846 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUVLG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 16:11:06 -0500
Received: by mail-io1-f65.google.com with SMTP id 1so5217565iou.4
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kgavvxB/Hc/+H2w7jNsoVQ+s9+9QFbvWPpzL0FkQJxU=;
        b=jj3ZoDWGylf7UQuOrCkLtgehxUWrurNOfmINioGWqw63zWwZXuMSC2bxgmmO4TrD4/
         9Am+0gf0QO51cHmL+KT49hDvfBIzAnEfYO4oixNGFQSVzLQdYHx8rUSIUSKZamKPQqmn
         Una7L61JHDV0xan+uOmAMs3utj7t2iyCDn2FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kgavvxB/Hc/+H2w7jNsoVQ+s9+9QFbvWPpzL0FkQJxU=;
        b=Tz5a/lLuz/ZXkMoYvMu6uHsEQuQr0/BK/KNPaqaLZqeL2rzvX9UmbzCkfASB3OXLR9
         NE3CTmixUVqPQCLRtUqCjps401za62WG/tLO+kIvgVh+5Latdh9AE7xTAHpV+rEXiGij
         a4N+Utrbgvwn51zAVLOpqyqTx3qfhPXGE6CK277FxlDzgqOdClGWQHEsvWvIP/yeQ+bn
         L/b9bJe2j5q0EoIkwOOPn0vv+b5alU/EfkgW94Std6RcIdPWrqWNK+cypHRgGlgHH05e
         MMjTSu7YKCU81F/rxlcbYJTliI9R6FZpa+qA1XX55xs4Gw8jtJOscV4yRsevvL8Awys1
         7sAA==
X-Gm-Message-State: APjAAAWT7mhnrlVjexNETrCVpwwC1Z1vlxgG1LDDTLusHC1yVQhZHlM4
        TQER4QT5IbNSKeAlIhwc/p/OfA==
X-Google-Smtp-Source: APXvYqywvvLAlZvLYMaohpzFDxBaOdABSDQzVADBr0tUo8Kaq3yObLAmQcK+1QglmTB69HMqDB6Yew==
X-Received: by 2002:a02:77d5:: with SMTP id g204mr10770186jac.125.1574370665501;
        Thu, 21 Nov 2019 13:11:05 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id h6sm1649609ilr.7.2019.11.21.13.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 13:11:05 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Raul E Rangel <rrangel@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        dlaurie@chromium.org
Subject: [PATCH 0/4] Convert cros-ec-i2c-tunnel to MFD Cell
Date:   Thu, 21 Nov 2019 14:10:49 -0700
Message-Id: <20191121211053.48861-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Having the cros-ec-i2c-tunnel behave as a MFD Cell fixes a race condition
that could happen if the cros-ec-i2c-tunnel gets probed before the
cros_ec_lpc init has finished.

There were also some bugs in the original cros-ec-i2c-tunnel ACPI patch.

Raul E Rangel (4):
  i2c: i2c-cros-ec-tunnel: Pass ACPI node to i2c adapter
  i2c: i2c-cros-ec-tunnel: Fix ACPI identifier
  platform/chrome: cros_ec: Pass firmware node to MFD device
  platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c tunnel to MFD
    Cell

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 37 ++++++++++---------------
 drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++
 drivers/platform/chrome/cros_ec.c       | 13 +++++++--
 3 files changed, 43 insertions(+), 26 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

