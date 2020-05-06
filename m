Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4181C7A00
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgEFTPV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgEFTPU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:15:20 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1A4C061A0F;
        Wed,  6 May 2020 12:15:20 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v12so2196797wrp.12;
        Wed, 06 May 2020 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrqM/gDwp6UGuwUPWnv/mh4oPobSp/aWsyukQo1CxvI=;
        b=cxA8D3iiTE/hL+qlaHxVwDUvKGRIcmWw+aTR+ZBpkhdgSuw6GRvUitZYOpyTFzlrZW
         SKsbL7iGdTV9eI82GnWctH6HD5VL9+hqDoTQ1JP6PTVDdu4RvEkAXV7Ad3XVSIQt5hfm
         5MVrfSGo8t9psawNFpNFYjTgTvgFY+8xKzx0rHke+Lx8Zuhh1fXgsrpl1PspU4x9kSjY
         4sXuiaJZn3Z9eafLs0B7lBcxlsgE9bzMAKw/ZNc87Q2TsPlIiP9FqRMspDGc21xgC/8Z
         BtJ49ydOD+J2swb8GpBKvAYDxRLoX50TdqtDe29EMCQV7E60bW7vcpsHuNzNfnXwOLLq
         5+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrqM/gDwp6UGuwUPWnv/mh4oPobSp/aWsyukQo1CxvI=;
        b=Kk3z9vytQItbQVIfcqZht84jWKAf60kTbJCZliPpheuSpL2CBIVnmsp7ZqQd/ThT7L
         Ja3RbvmZnlSJnC3Vd4ajmQyOx9IaV8doCEkWGe5ed2sOoEs86xxtblAg4hj+zZ3DNAjI
         w2VE+ZpD4s/SEYz3yrADpS5aQ9hTo7n15mCO2OT6+ZyOxbSy4jseVNC7IajHTLAlucRs
         lvKqS0g5KmJeqv/v0gntiInXVU+o7PDXXWUSA15uXZxf4lAHoHJtd+v2ghy/42vn9Prw
         wnti5g+iXIds31UAw00IeoW1Vje5xDGfcE1GWmha053qsvU+VmBjTTEe5g5QnfMvfiQJ
         3ArQ==
X-Gm-Message-State: AGi0PuZSp1ZMxWzx2L4GcUP3hq16aQda9SR1zbAbhrfnsEP5aKI0dtCv
        fey+2760AuOGq1OI4hT47To=
X-Google-Smtp-Source: APiQypI2ys+lta8xKxSXhqcpXkj95ZBF5B3Rac5oGwgtkP/qFlg7Il+VvfbwlDEsS3YTfqwuuHLotg==
X-Received: by 2002:adf:f086:: with SMTP id n6mr6636642wro.388.1588792518757;
        Wed, 06 May 2020 12:15:18 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id r23sm4715600wra.74.2020.05.06.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:15:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] i2c: tegra: Add support for the VI I2C on Tegra210
Date:   Wed,  6 May 2020 21:15:07 +0200
Message-Id: <20200506191511.2791107-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Wolfram,

This small set of patches cleans up a few things in the I2C driver and
then adds support for the VI instance of the I2C controller which is a
regular I2C controller wrapped by some multimedia-specific logic. As a
result, the regular I2C controller register interface is offset by a
couple of bytes.

I can pick up patch 4/4 into the Tegra tree. These patches also don't
have any conflicts with Dmitry's patches that we've been discussing.

That said, I could also put this set of patches (except the DTS change)
into the same branch I already have for Dmitry's patches (plus the fixes
that we had discussed) and take it into linux-next and let it brew for a
couple of days to get more testing and then send everything to you with
a PR, say, sometime next week? How does that sound?

Thierry

Thierry Reding (4):
  dt-bindings: i2c: tegra: Document Tegra210 VI I2C
  i2c: tegra: Use FIELD_PREP/FIELD_GET macros
  i2c: tegra: Add support for the VI I2C on Tegra210
  arm64: tegra: Enable VI I2C on Jetson Nano

 .../bindings/i2c/nvidia,tegra20-i2c.txt       |   6 +
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +
 drivers/i2c/busses/i2c-tegra.c                | 178 +++++++++++++-----
 3 files changed, 145 insertions(+), 43 deletions(-)

-- 
2.24.1

