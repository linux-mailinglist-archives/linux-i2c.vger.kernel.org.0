Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7A9B126009
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 11:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfLSK4D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 05:56:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36100 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLSK4D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 05:56:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so5142994wma.1
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khUoQvzhcKRNBppIvF5HLGS6J/yFHkax/MpXV0B6tgM=;
        b=HWV+TH36YH53saX6jWhfpuxct5SxDKhFQPLYqqF9i3Q/8JlAqJkVsqsrr3HDUXpXoS
         aJBANtM9rvOU5w+If1ZK7SN2pazuF6G+w/GlTgXbLo4a3fiHaxWI9dO8k6IPL43exqW2
         EXnEu10WH839ioR/UN8BNBcxPkBfb1LL8usxGn+nJPzFPBOzIdGj4kWw9QtANSTvsZTE
         YkONcpIKqDRvR1z0/xexnEHHhGYu7p3J+oNd097rxbIbUgmwNWoPHK4h0UOTv/oBPNrg
         LbwTh+oWok8EByp2Aq+eOXOHlMydkktmZ1tbwNmBc186gImqUroP5TWkhSRuAv58UFqM
         Q23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khUoQvzhcKRNBppIvF5HLGS6J/yFHkax/MpXV0B6tgM=;
        b=kflOECMxhF9qcGV5nmjYg6PFPGC2mN/HYq24/cM2V+GyovzF7eB0o37/koCqgUp2iI
         C6gfu6xyb4ad0wGmr2PBh5icR7+/N0DZrQ9vCgk/OXBaEsLAOTId6EObFq1W5yaMHr4G
         GyWBpfK+3SScHdssr+/PYMEb6aeOjVpUNp7vUoo9rV+hEN+XL8SUCOhjS/4BkRHoKBIW
         rMVsuZtwZAEVqBj5ig1OQm2ozc5l+jj7x07akPsssMxRaxTrzc788ey/3NVlpLwGZofx
         S6J40TGq4WTCBfZH9t2RQIGJqmiiWX+jVz+ymDXT8yAbf/cZfN/zsSduPyLGL92Lrk3Q
         wvNA==
X-Gm-Message-State: APjAAAWOnoxziil21TMfFvraFOUM54u5lsD2hvkSVHBKBe7+QaZqbDZJ
        YV9rGxHGFntHj2WuEQYMVE8nnuNOuYM=
X-Google-Smtp-Source: APXvYqxu1OZyLB+VEeJu7ciCfWl/MCRZh11MMABvaRNh7afS6NhtLURYnMdkxnYFLSvAYkW35VqH1Q==
X-Received: by 2002:a1c:c90e:: with SMTP id f14mr9275417wmb.35.1576752960694;
        Thu, 19 Dec 2019 02:56:00 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id z8sm6024227wrq.22.2019.12.19.02.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:56:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] eeprom: at24: update the license tag
Date:   Thu, 19 Dec 2019 11:55:58 +0100
Message-Id: <20191219105558.26479-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The current GPL v2.0 or later SPDX tag is 'GPL-2.0-or-later' as defined
at https://spdx.org/licenses/.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 0681d5fdd538..1d7270bbf29f 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * at24.c - handle most I2C EEPROMs
  *
-- 
2.23.0

