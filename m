Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4994C2B7E9F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Nov 2020 14:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgKRNuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 08:50:08 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:47727 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726293AbgKRNuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Nov 2020 08:50:08 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 18 Nov 2020 15:50:01 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0AIDnxsT024731;
        Wed, 18 Nov 2020 15:50:01 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send: PATCH i2c-next 2/6] platform/x86: mlxcpld: Update module license
Date:   Wed, 18 Nov 2020 15:49:53 +0200
Message-Id: <20201118134957.182779-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118134957.182779-1-vadimp@nvidia.com>
References: <20201118134957.182779-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update license to SPDX-License.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/x86/mlxcpld.h | 34 +++----------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/include/linux/platform_data/x86/mlxcpld.h b/include/linux/platform_data/x86/mlxcpld.h
index b08dcb183fca..e6c18bf017dd 100644
--- a/include/linux/platform_data/x86/mlxcpld.h
+++ b/include/linux/platform_data/x86/mlxcpld.h
@@ -1,36 +1,8 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0 */
 /*
- * mlxcpld.h - Mellanox I2C multiplexer support in CPLD
+ * Mellanox I2C multiplexer support in CPLD
  *
- * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2016 Michael Shych <michaels@mellanox.com>
- *
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
 
 #ifndef _LINUX_I2C_MLXCPLD_H
-- 
2.11.0

