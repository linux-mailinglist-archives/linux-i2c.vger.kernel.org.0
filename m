Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0E0146C18
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 15:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgAWO6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 09:58:12 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39895 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729148AbgAWO6M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 09:58:12 -0500
Received: from [109.168.11.45] (port=47594 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iudvt-0005F5-Vy; Thu, 23 Jan 2020 15:58:10 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/28] docs: i2c: old-module-parameters: use monospace instead of ""
Date:   Thu, 23 Jan 2020 15:56:23 +0100
Message-Id: <20200123145626.8102-12-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123145626.8102-1-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
 <20200123145626.8102-1-luca@lucaceresoli.net>
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

Use a monospace (literal) formatting for better readability of sysfs
attributes and the "dummy" client name. This looks much more readable in
ReST-generated output.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - reword commit message to not mention filenames (Jean Delvare)
---
 Documentation/i2c/old-module-parameters.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index 92a403d21a62..3b93cb88eebc 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -10,9 +10,9 @@ I2C device driver binding control from user-space
 Up to kernel 2.6.32, many I2C drivers used helper macros provided by
 <linux/i2c.h> which created standard module parameters to let the user
 control how the driver would probe I2C buses and attach to devices. These
-parameters were known as "probe" (to let the driver probe for an extra
-address), "force" (to forcibly attach the driver to a given device) and
-"ignore" (to prevent a driver from probing a given address).
+parameters were known as ``probe`` (to let the driver probe for an extra
+address), ``force`` (to forcibly attach the driver to a given device) and
+``ignore`` (to prevent a driver from probing a given address).
 
 With the conversion of the I2C subsystem to the standard device driver
 binding model, it became clear that these per-module parameters were no
@@ -47,8 +47,8 @@ New method (sysfs interface)::
   # echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
   # modprobe <driver>
 
-Of course, it is important to instantiate the "dummy" device before loading
+Of course, it is important to instantiate the ``dummy`` device before loading
 the driver. The dummy device will be handled by i2c-core itself, preventing
 other drivers from binding to it later on. If there is a real device at the
 problematic address, and you want another driver to bind to it, then simply
-pass the name of the device in question instead of "dummy".
+pass the name of the device in question instead of ``dummy``.
-- 
2.25.0

