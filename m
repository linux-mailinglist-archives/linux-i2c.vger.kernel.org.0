Return-Path: <linux-i2c+bounces-9148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF22A18C4A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 07:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46EA41636A2
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 06:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335AF17B50F;
	Wed, 22 Jan 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKPQeb+Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5018C936;
	Wed, 22 Jan 2025 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528551; cv=none; b=MMnHd393dz6H7ALoiwiAEj+UCwuL2npC8cnt+aDcMBKNhYk7V2WGMyG0rZB1nDP+O+5VM5wa4q75X2eGR8NjsdlTRkOMVKzF9hjJzHneXF8RlxPqgdQyPDptHh16N36RcKRFongDC3ZhE41JvTUwJ3NmOHP6W0mOC2ohbKWQ22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528551; c=relaxed/simple;
	bh=tFaPrSJvTnfZKghFvZtZrl1f+d8gEjbc9QUgl1aKDBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KAGazNKvG4mw6DUPRB7h6Rw4hGAV1tIPXz7225hz3zdwVjDnyBFXLatSFPEeSlFgNxVrjDaYR8+jDNxp+8Qj1EX7db80u7Aze6Uj92D/GxOVegC4CpjRlfYAhDg7kryV3zeCOFOQkwOY6X++onykFC+HdqOOCYdLw0qHdAQlMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKPQeb+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09925C4CED6;
	Wed, 22 Jan 2025 06:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737528550;
	bh=tFaPrSJvTnfZKghFvZtZrl1f+d8gEjbc9QUgl1aKDBM=;
	h=From:To:Cc:Subject:Date:From;
	b=kKPQeb+QkE1em1p3S3cpQm6dpdU6hw539F53zSb8mVXquI2+rURjLrqwglERvwOp0
	 SUwIXYiKcQYTVHg3QC/LPdoLraC6TZ7fWIl5UL+POlGG/3K3JIV7m0ryihYswexTmB
	 Cykd0JdkG2eT0sT7RzWhCQB1wSBuzNmnQzMel4a0TnQx4Kj6TOI6w3oV33IKLpiX8f
	 qhv3JZOFAvhRxEwu+YQzlyK4rtqHkDijLs9O2fz3C9/k53pBHc/Pv/bBow1SW/2TdB
	 pqzpmMZbhiAo1mnXeLn/aoiMPA8/gRSM0HL5dlTyO5kb3CXV0zOs6IW2sbSd3YEJV9
	 4olzBKs8LCnmw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Carlos Song <carlos.song@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: select CONFIG_I2C_SLAVE
Date: Wed, 22 Jan 2025 07:48:36 +0100
Message-Id: <20250122064906.1220557-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The addition of target mode causes a build failure when CONFIG_I2C_SLAVE
is turned off:

drivers/i2c/busses/i2c-imx-lpi2c.c:1273:10: error: 'const struct i2c_algorithm' has no member named 'reg_target'
 1273 |         .reg_target     = lpi2c_imx_register_target,
      |          ^~~~~~~~~~
drivers/i2c/busses/i2c-imx-lpi2c.c:1274:10: error: 'const struct i2c_algorithm' has no member named 'unreg_target'
 1274 |         .unreg_target   = lpi2c_imx_unregister_target,
      |          ^~~~~~~~~~~~

Select the Kconfig symbol like we do for other similar drivers.

Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 3fb1fa8244fb..60736a2831ba 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -756,6 +756,7 @@ config I2C_IMX
 config I2C_IMX_LPI2C
 	tristate "IMX Low Power I2C interface"
 	depends on ARCH_MXC || COMPILE_TEST
+	select I2C_SLAVE
 	help
 	  Say Y here if you want to use the Low Power IIC bus controller
 	  on the Freescale i.MX processors.
-- 
2.39.5


