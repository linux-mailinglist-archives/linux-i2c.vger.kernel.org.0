Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768216B1C1B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjCIHLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjCIHLv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:11:51 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A92C083C;
        Wed,  8 Mar 2023 23:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678345910; x=1709881910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BP2bXE/lj12e2qlD1IN4mt1PlpUOPgNqQR5Qy9flS0M=;
  b=gE9QNbSywiaf8HwwOi1MR8S66fnHA+x6SZobYN+z4FesBATRNNUneGJx
   OU495hd2p3XCUHWwL+HZy9Exiw3dGvWJnNU9tkiIH/SvwB+zztW1B63tU
   ybJI1w7qtE2QfT3eu1wyKO8OJnqnkyeKqtIKgY509ppOdwzKNY+MZHY8A
   y4tXMOnFSm6FYlwHAaZbZNZ4Ad87ByVcHTD/UmACEIjsbTt1UVCzzB5HN
   l8RphImPgHvy1p2qz1vSeuqsWUQvFhCLYIKme/U++LruA2B74kl/fAzQb
   BmgrEU10ONySXZ0LvhmHoN3Z0pqjX+k3wQtJEK8Ggy3ftu5iPNZTNBJo5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316767835"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316767835"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923126491"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="923126491"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 23:11:43 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v4 5/5] Documentation: Add ABI doc for attributes of LJCA device
Date:   Thu,  9 Mar 2023 15:11:00 +0800
Message-Id: <20230309071100.2856899-6-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309071100.2856899-1-xiang.ye@intel.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add sysfs attributes Documentation entries for LJCA device

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-usb-devices-ljca    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca

diff --git a/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
new file mode 100644
index 000000000000..e12fe78ae58b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
@@ -0,0 +1,22 @@
+What:		/sys/bus/usb/.../version
+Date:		July 2023
+KernelVersion:	6.4
+Contact:	Ye Xiang <xiang.ye@intel.com>
+Description:
+		Provides the current firmware version of LJCA device.
+		The format is Major.Minor.Patch.Build, where
+		Major, Minor, Patch, and Build are decimal numbers.
+		For example: 1.0.0.256
+
+What:		/sys/bus/usb/.../cmd
+Date:		July 2023
+KernelVersion:	6.4
+Contact:	Ye Xiang <xiang.ye@intel.com>
+Description:
+		Commands supported by LJCA device.
+		When read, it will return valid commands.
+		When write with a command, it will execute the command.
+		Valid commands are [dfu, debug]
+		- Writing "dfu" to this file so as to put the device into
+		DFU mode so the firmware can be updated.
+		- Writing "debug" to this file to enable debug logging.
-- 
2.34.1

