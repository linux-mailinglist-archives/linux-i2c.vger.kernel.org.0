Return-Path: <linux-i2c+bounces-8314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9C9E2970
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 18:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69E2B165198
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 17:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98771F942C;
	Tue,  3 Dec 2024 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H0UkWLBY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272D1F9F7C
	for <linux-i2c@vger.kernel.org>; Tue,  3 Dec 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247412; cv=none; b=NFg3DsX4KWI22bYp9mVwbXEjbTPwauIcrxPv19HP16itTi/4g7lxd5h05wjIZXVyLebCfnWDUBOTsm905vTUchgvVxaDPepYnAsQEKxQUuRXsuoH7hU3d+mJygOSvJ43cSve8LQ8uVeSmiLl0+5a5U3+eMUSkmSkBs9ibQTUewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247412; c=relaxed/simple;
	bh=m1TjLvKziouHwT1fZv/foXZ63nbNE/2LNbvuqDXF+eY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ys3udveXR6bIuMwqfH4Yb/SeSXpD9mbdSm0zuGM0RwJws68J930mi2ctlcoUqf8mbHSlCCI9n8krSzWYHuXl56MiGGvX3H5ga+wIqsr2lBxpk3SqeBlbL88h34Ho5ok+zR2kFjtdTl6gtUJV5SHTX8XE2w0wqHZGghWuekOZ7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H0UkWLBY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e1721716so2242384f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 03 Dec 2024 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733247408; x=1733852208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okxPp4bLU74FhY0huq8Q+0q43bt44RLypTxjeYg/xi8=;
        b=H0UkWLBYTts3C+AB2hLZu82giJHXgmKOpxQWC8uYqbAoLfYLyr7+XIe+yG3o2mo/RL
         Inn6W4YhnGYUgupsyXFY7ZjqLjFb9c6+xbrl9PHKUUHCxjvt0yG3ejRIlhzkootk/9D6
         C3jiJS8zkMIzQIuXp63+TZ2BnCLvPoQi6sCNMgZi3SD9WI8eLcl3tsvQAyUSp8WB9BTN
         9Uy52ik0t48ipfcnlBAZzSuUmqZImfoUW4tv2iJ98MldbtE0X1Cxx0wn6vsaHUUzPys7
         TKUEaVkdZAULFX0Zl2btAHMTbo7gW8ZJBx2xv7CbVAvnPT5zcGIP6B6wlgkiLUChR8Fm
         aZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247408; x=1733852208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okxPp4bLU74FhY0huq8Q+0q43bt44RLypTxjeYg/xi8=;
        b=o4W0hO0vAPQ99/RES8GmXvnPsNs9Acmq15JRbaQlQvI9OYhiYuVcLJlbRt8QN3X52B
         7fAuztd3FCl4FT9H/XKrbN0wiGFpdIdMj07po+gHSOMetwh483j1T8k2siFV1dx1Its0
         mKX9BFNci7y5RHM6a+f+2Qigj8ViuF86750/tAeTlTjRwJzrcTXN+wdLJRXXHSl147Wi
         VNcU8nMG61VGkRE42TXDet9UcSKMALJZSrbFvlqYq0NyzghU58DfxdGTU9d9Hd8Mwipe
         QRan5NFDvMYVPdkTrwsqonZmJcptjYnawrdiCf7+yxan/BTLamSCvwjz/n2aGGXPDmM+
         Ye9g==
X-Forwarded-Encrypted: i=1; AJvYcCUqixLhsJcCLadb5YQCZLGcvuHk/X91vdkE61UvK+x6pZavr128UmN7Y90ABP40GNPoNSIsERGyDA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5yUAbogSFU2fmos97agMbs9GFCxRCFdvtSy6WQcMvu78S5joy
	yu2cyq60aL7A1E9ISkE2v6quA1MqQAb03+8DFxQ0RDNZL1SPL6bKVD1oiOIuFtqXBy2eutKNswl
	qUG8=
X-Gm-Gg: ASbGncuddFY7EMPFYr79/Ho1VAj4138PN0uIuYk6TDrxz4L/FBtZT1M1417EG6qpnKp
	mLpGrS1sn3yp5rwUq9wnD66v57wWUOxX8KrIjXH1xbEt2QqHuNJ1Z6qUK+2olh0A27Mc+OkYefN
	t/SYmUyDEhk2EapLrJNW65f94KpfMbVfVdV0im705iiztoPRoIUbPdm67Cm1kS4W1uRGFWMZLOB
	FY1gqlV1v4iT42FU79BVaaEqxrXm07tZ15i6AT0G0PSkDw5sXjWIc5Zbof3TQ+UJP9oq/U5rfyE
	r36t
X-Google-Smtp-Source: AGHT+IHC/rVRBYhsCXGQrDElQp09RrXYjCdQy9Lf3pmGq6KXvYUwLuZgsIlv9u5Q1jGfAzYaQYh4Aw==
X-Received: by 2002:a05:6000:184c:b0:385:df73:2f24 with SMTP id ffacd0b85a97d-385fd418d72mr3275287f8f.39.1733247408560;
        Tue, 03 Dec 2024 09:36:48 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7264f27sm15209587f8f.80.2024.12.03.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:36:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON and I2C_DW symbol namespaces
Date: Tue,  3 Dec 2024 18:36:40 +0100
Message-ID: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=m1TjLvKziouHwT1fZv/foXZ63nbNE/2LNbvuqDXF+eY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnT0GpT2iK8XCotN5b9RJ6nfYNSYyyY2DABGXMl Ly4g73Ek1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ09BqQAKCRCPgPtYfRL+ TjDEB/9sLQyE0lFw83zAF66qOTcu490ybUSYrRyfQOlDPWVHbF0hgSP++raX+dv9UT7TknmADoF kZbGA9Vuteurk8Es+o0x9XaSwwZy2s46FWY6dnGpOPr2KiZfSGyrjAvyyHwaIy+xsT4d3Yjhvn2 IMz994NdJ2kBTotbUFWvJ8W+usn5tOS6lZpNeumIquJSYXnBG9rb+wWBNZjeX4mbN2YtckI4owA sx9EFs+Agei0+T41cKI62Nuz+deXQV+NAKWMImdjdd+td1Qrj+FOMSlGV1xUuDrKuwIZCg5yfbl yIsvItMjRwZyPuG6eMLI0lO874bkesl9fekkgSRuAmxwE6BP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
is included. So move the define above the include block.

Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on current Linus Torvalds's master branch and depends on
the topmost commit there.

Best regards
Uwe

 drivers/i2c/busses/i2c-designware-common.c | 5 +++--
 drivers/i2c/busses/i2c-designware-slave.c  | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 183a35038eef..8eb7bd640f8d 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -8,6 +8,9 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
+
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -29,8 +32,6 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
-
 #include "i2c-designware-core.h"
 
 static const char *const abort_sources[] = {
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index dc2b788eac5b..5cd4a5f7a472 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -6,6 +6,9 @@
  *
  * Copyright (C) 2016 Synopsys Inc.
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
+
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -16,8 +19,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
-
 #include "i2c-designware-core.h"
 
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)

base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
-- 
2.45.2


