Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D51434213
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 01:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhJSXcC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 19:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJSXbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 19:31:53 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839DCC06161C;
        Tue, 19 Oct 2021 16:29:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso6187525wmb.3;
        Tue, 19 Oct 2021 16:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBSiNPduoSl/3dS/PeDAYLiDuGpiUawD5d8DGFmi4A4=;
        b=ofCgOOKjfcK0SwKfzc2jleNX62a8I7prLfQu89LB4zQXuKe3eKGwEbIkKO4OTmFPpa
         JCpMSxvIFq/owtQHQ5pnbneV4+k2S3ckjWWhysfcu2gMO+YXPnnOqmpjgTEo1gRvzDcR
         /E6cXjrvjad7eCvx98SEKaRPa0rIJuMp4WqJl64zLRuJCg2BIxKk3owEv6HdxDWCikBE
         nXnIcgSH+lHYCuknL51qBwf5ADiwpHu3DvylJ00q2VorAiWh+l1l/dj3SjBC0PTDK6g/
         9GnxvqNxRXuyOsj9Jyb1KqCjl6wUYvo7QHmozcHTqJW4Qv/337Xa1nmNcORVipKS+uuc
         QE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBSiNPduoSl/3dS/PeDAYLiDuGpiUawD5d8DGFmi4A4=;
        b=mnZMV40Xj8Mu2rN7oTVm5V3vgsc8dYmIUlwICctDMypEzCcBvDneGcTzSJSUblWDDv
         NV74P+GWrdtW+/MmW+SkNiTDc7qwpPDAc6cDr5QfITv6x3CUWGvUGlNxNls32H9ZMRMO
         ESbFTHYCtPjnQuwgJuB6vXO0qOUucO8DyHfEjkD0lMTvSDdwV0SjKoH7KbTNT+GaqVLd
         FhGpNmGHou++PjZHshqVxfuVLLddokyQ40Vuu+exNScLHz6ndSZBCQeFEHF5tXu7baEn
         Q5WYPmmfNuY7ZA4C3xKvQsk3NLGAVC67RVZkDTdEKlVfPANcqkwxsauAjrIkRMEc9nxU
         I6Lw==
X-Gm-Message-State: AOAM531z1IT5xPtdHXFLznrmvG2I20Q9Hx4iwtJy6Vxw5faf6KW3g1ui
        zUxvb8LqI+D/3W4q60yBqvx+r1T6ThY=
X-Google-Smtp-Source: ABdhPJwR9WqvRq7opWdel7UQ+UDnmPhEWhsJjDJT9iEURmi8tHAcu789lxv2IguriPSCljfVUdBXEw==
X-Received: by 2002:a05:6000:1565:: with SMTP id 5mr47441418wrz.305.1634686177714;
        Tue, 19 Oct 2021 16:29:37 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.gmail.com with ESMTPSA id r3sm324799wrw.55.2021.10.19.16.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 16:29:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Ensure that device is suspended before driver is removed
Date:   Wed, 20 Oct 2021 02:29:19 +0300
Message-Id: <20211019232919.21916-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra I2C device isn't guaranteed to be suspended after removal of
the driver since driver uses pm_runtime_put() that is asynchronous and
pm_runtime_disable() cancels pending power-change requests. This means
that potentially refcount of the clocks may become unbalanced after
removal of the driver. This a very minor problem which unlikely to
happen in practice and won't cause any visible problems, nevertheless
let's replace pm_runtime_disable() with pm_runtime_force_suspend() and
use pm_runtime_put_sync() which disables RPM of the device and puts it
into suspend before driver is removed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044715f3..b3184c422826 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1700,7 +1700,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 	else
 		ret = tegra_i2c_init(i2c_dev);
 
-	pm_runtime_put(i2c_dev->dev);
+	pm_runtime_put_sync(i2c_dev->dev);
 
 	return ret;
 }
@@ -1819,7 +1819,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adapter);
-	pm_runtime_disable(i2c_dev->dev);
+	pm_runtime_force_suspend(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
 	tegra_i2c_release_clocks(i2c_dev);
-- 
2.32.0

