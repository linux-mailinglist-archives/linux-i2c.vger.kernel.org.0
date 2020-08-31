Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE76258265
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgHaUX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHaUX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:27 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5F8C061573;
        Mon, 31 Aug 2020 13:23:27 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w14so8242404ljj.4;
        Mon, 31 Aug 2020 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFKd8H+fYcsnXikLZwEK7Kis8FaXYZ+WoHtlNYHj6YY=;
        b=TRawU+1/VIDgjh+KJAHd77ib+z8P8nWexHRXuAKwH/8XfVUFQRwEFLSoU7czyf+YHV
         jCgENpnLMWLn3xdFjKGDibTIkymg/qK9pes1IKnCFVn1ZtUwtdMyHGPXi9WwmhfbdoJR
         Crdo2o09jcnaCMQc3CCPFBY6HcjSFjhD6Rv1Uz4P5ZVmK9CMRxqWvp1fsU+kQJ9Cg3uN
         4Ilp6i18m7N8J4wZB/rgb+gms1kvS7zUKXSkWmdfbsvv99OoRgI9r08QZxVWmd8doXi1
         dcHY61aw2LuCsMP5/625FW/CGsf8lweVXtnCE9rV0/Vs6wA/kTvSzBIC4Ij1rDS3PULQ
         Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFKd8H+fYcsnXikLZwEK7Kis8FaXYZ+WoHtlNYHj6YY=;
        b=lM5r3W7jGpePZE1kQh4JKgfM32ND6Y9xHAZCirsclUYALIULJaPuucBiME3ulZ7P9b
         URLACKrK+BsgH/9ql38f0rr9isv2Gef7rqVF11JKyQ7k2rDqZYDDmuVluatmE/BwzfhC
         AuspzuT3IF32Bm//0BnOOSjIJFrQCXF4DaWHKvxnBuGdclXqfaVAn8zKfOxjsxwrBt5b
         zGhx6W1oAQbk1aCQBIKsLGIhCaPUX3NNH/HPDhtavgW3GKxQjUGl34gh+DC1688nGdkX
         SIsq+75IRNDLel/KoZbggobm7yw93tZ0TjY1FeQL90JJZkNzKW4hlBEruuHNTaEIYAhy
         phOA==
X-Gm-Message-State: AOAM530qRjS60sOpDYzuhExvOpmJ5cIvvTlBfKn+SCBKBsC8we+DWFSZ
        TXnlPYiCycilHePLbfHgeYsPELQ9bNk=
X-Google-Smtp-Source: ABdhPJyAokqCkfKjFH8sd/+mlBBXpBJ2ZweoTY0E8lZ+rS8yA/OxO0uXDU/rh4UKP+Vp1JFSJwP6pA==
X-Received: by 2002:a2e:b8cb:: with SMTP id s11mr1486897ljp.110.1598905405704;
        Mon, 31 Aug 2020 13:23:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/12] Improvements for Tegra I2C driver
Date:   Mon, 31 Aug 2020 23:22:51 +0300
Message-Id: <20200831202303.15391-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

This series performs a small refactoring of the Tegra I2C driver code and
hardens the atomic-transfer mode.

Dmitry Osipenko (12):
  i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
  i2c: tegra: Add missing newline before returns
  i2c: tegra: Clean up messages in the code
  i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
  i2c: tegra: Use reset_control_reset()
  i2c: tegra: Improve formatting of function variables
  i2c: tegra: Use dev_err_probe()
  i2c: tegra: Runtime PM always available on Tegra
  i2c: tegra: Clean up probe function
  i2c: tegra: Drop '_timeout' from wait/poll function names
  i2c: tegra: Remove likely/unlikely from the code
  i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()

 drivers/i2c/busses/i2c-tegra.c | 601 ++++++++++++++++++---------------
 1 file changed, 338 insertions(+), 263 deletions(-)

-- 
2.27.0

