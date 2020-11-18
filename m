Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F2C2B7FA7
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Nov 2020 15:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgKROo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 09:44:28 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48211 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727010AbgKROo2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Nov 2020 09:44:28 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 18 Nov 2020 16:44:22 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0AIEiIHu008040;
        Wed, 18 Nov 2020 16:44:22 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send: PATCH i2c-next 3/6] i2c: mux: mlxcpld: Move header file out of x86 realm
Date:   Wed, 18 Nov 2020 16:44:13 +0200
Message-Id: <20201118144416.184120-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118144416.184120-1-vadimp@nvidia.com>
References: <20201118144416.184120-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move out header file from include/linux/platform_data/x86/ to
include/linux/platform_data/, since it does not depend on x86
architecture.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c             | 2 +-
 include/linux/platform_data/{x86 => }/mlxcpld.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename include/linux/platform_data/{x86 => }/mlxcpld.h (100%)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 53bce81cf5c9..3d894cfb19df 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -11,7 +11,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/platform_data/x86/mlxcpld.h>
+#include <linux/platform_data/mlxcpld.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/include/linux/platform_data/x86/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
similarity index 100%
rename from include/linux/platform_data/x86/mlxcpld.h
rename to include/linux/platform_data/mlxcpld.h
-- 
2.11.0

