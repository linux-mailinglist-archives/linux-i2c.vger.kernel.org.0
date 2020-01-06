Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE66D130E1D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 08:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgAFHqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 02:46:52 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33558 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725817AbgAFHqv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 02:46:51 -0500
Received: from [81.174.41.21] (port=58944 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioN69-002Nhf-0B; Mon, 06 Jan 2020 08:46:49 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 24/26] docs: i2c: old-module-parameters: clarify this is for obsolete kernels
Date:   Mon,  6 Jan 2020 08:46:39 +0100
Message-Id: <20200106074639.13763-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105224006.10321-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This section applies only to code for very old kernels. Avoid people
reading this unnecessarily.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/old-module-parameters.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index 0503d2f0b127..80fb117883fd 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -2,6 +2,11 @@
 I2C device driver binding control from user-space
 =================================================
 
+.. NOTE::
+   Note: this section is only relevant if you are handling some old code
+   found in kernel 2.6. If you work with more recent kernels, you can
+   safely skip this section.
+
 Up to kernel 2.6.32, many I2C drivers used helper macros provided by
 <linux/i2c.h> which created standard module parameters to let the user
 control how the driver would probe I2C buses and attach to devices. These
-- 
2.24.1

