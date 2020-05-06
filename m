Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D133E1C7A08
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEFTPe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgEFTPd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:15:33 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B55C061A0F;
        Wed,  6 May 2020 12:15:32 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j5so3531783wrq.2;
        Wed, 06 May 2020 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0WqouOSffmLHwkpPruNafkvggObbYUcKYQo6rtGzKw=;
        b=MDMRDrb+T1wN6RkAGaO9mTFTvBNaClXXKdiKki+HQoB3oR3MDKtsSH9hIFRmiUtLZB
         arUIh5t0obrq6eFl0MwXsGgs3JAQabsOk/JGKMVqZy6fAH0ABZp8O/hwAQFDwxOocIvK
         ZII9NZ20QPR3M6ClLCNdY4+6krzZ0pS6ajgjRX9iFcSHabVkcQPYZleBW6w7f1iW6ohG
         NJvUm5uGyqTslq9N+1LHBttOI4OAkalRYsDoDTUEaVe+EPPhBhiYOeDZBYBOUuB6LhpX
         Tw/c38CztfMTiojhf/OUsbzQE6D+AubGzuN8HSnztbFkV9Wvp+sXKHIa8HL5hemYgKlE
         McTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0WqouOSffmLHwkpPruNafkvggObbYUcKYQo6rtGzKw=;
        b=VLF5OeML+1RQvZVEkoIDi627l11RU78RRjMEk5Emzq2A4x0U2UwA8WCSW6ZWexbb70
         hTEtAVboY3WZIdtL+RemftQZ6SDpJmuZTwfGJ1yExq6NiwvnHx1tlDrbgU0IX8/mEiKx
         Fk2E4GgxxvmW57loHfwGalVZi3uiKVpPZHZlenBjVTI+/CC3V+z2ccujInKck6QmNA02
         mLZ91nNznnqwiAkCcUy1PXKeJ6AauOCBMb3AND4Qk+xSXD9BzMyj6O4v/LtbffkFpJKM
         GqsD2AJmslFnfY3AFQq2ZXNXDOCFcmySMGMmpQ0TkjXkZTd6WQ3HmkQ/wy6Tav7ncmB1
         NJXw==
X-Gm-Message-State: AGi0PuZ8diCOO9cckHx9883SbyyxwEdPA18p6boHWQyeRVLKCrNrd05u
        kCKlqSaIdCTbmsnYS8byGIJ022l0aD0=
X-Google-Smtp-Source: APiQypKm1u9Ts1biJox6FD6Ixg22bXiH2V4YNt6KOvFM4uvlH3qBuR9x2NcxAMGW4HVS0dPo2ClusA==
X-Received: by 2002:adf:b457:: with SMTP id v23mr242357wrd.288.1588792531450;
        Wed, 06 May 2020 12:15:31 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id i74sm4209071wri.49.2020.05.06.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:15:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Enable VI I2C on Jetson Nano
Date:   Wed,  6 May 2020 21:15:11 +0200
Message-Id: <20200506191511.2791107-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506191511.2791107-1-thierry.reding@gmail.com>
References: <20200506191511.2791107-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the VI I2C so that the peripherals connected to it (such as the
camera connector, an INA3221 power monitor and the USB 3.1 4-port hub)
can be accessed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 21ed1756b889..374ce58b2b38 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -90,6 +90,10 @@ sor@54580000 {
 		dpaux@545c0000 {
 			status = "okay";
 		};
+
+		i2c@546c0000 {
+			status = "okay";
+		};
 	};
 
 	gpu@57000000 {
-- 
2.24.1

