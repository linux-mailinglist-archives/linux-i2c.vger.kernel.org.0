Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319C32D628D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 17:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389670AbgLJQw5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 11:52:57 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42342 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392244AbgLJQwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 11:52:08 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 10 Dec 2020 18:51:16 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0BAGpFT1032299;
        Thu, 10 Dec 2020 18:51:16 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/3] i2c: mlxcpld: Update module license
Date:   Thu, 10 Dec 2020 18:51:11 +0200
Message-Id: <20201210165113.6130-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201210165113.6130-1-vadimp@nvidia.com>
References: <20201210165113.6130-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update license to SPDX-License.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 71d7bae2cbca..dbd185368c38 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -1,34 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
 /*
- * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2016 Michael Shych <michaels@mellanox.com>
+ * Mellanox i2c driver
  *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the names of the copyright holders nor the names of its
- *    contributors may be used to endorse or promote products derived from
- *    this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") version 2 as published by the Free
- * Software Foundation.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
- * POSSIBILITY OF SUCH DAMAGE.
+ * Copyright (C) 2016-2020 Mellanox Technologies
  */
 
 #include <linux/delay.h>
-- 
2.11.0

