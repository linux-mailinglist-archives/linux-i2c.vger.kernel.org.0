Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47DD6B6A80
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 20:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjCLTFt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 15:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjCLTFo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 15:05:44 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2F6301B0;
        Sun, 12 Mar 2023 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678647919; x=1710183919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RzvP9oLfBGrZorh7RhxLEqxpEVo3Q5M/0WZA1nvvuD4=;
  b=bmhuP0zXS1RO7a+QwS/EcOdBiKdl85gU8IyoQu5EjHwVRyA1rdTDl6Kw
   6RlBzndXlT5UKSqclQlz+7So756v0/f+/GZYQsesLvRL2Mj5fIVg2sH3i
   lwsP2+r4wbwlo+cIpk9m4gBLh7pE72sILpgLb4N3VxigteUWOV3ZGLBFG
   iRIBfkC6ZgDAdgCouUoKbCoNV5T70MSVk7zjZptl/KAdgQVUiiyqTzKZQ
   ckhdlzOTACTVf4aaXEXgggQls69xOcTxtzHcg9q/PdsJKvH0Jwlsrnd+4
   4Sa6LnWJkuKdLPx0Vu2sOHyDmmgD526irsS+P1wpHH3kCcH3hzUw/2dNv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338568387"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="338568387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 12:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655749382"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="655749382"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga006.jf.intel.com with ESMTP; 12 Mar 2023 12:05:14 -0700
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
Subject: [PATCH v5 5/5] Documentation: Add ABI doc for attributes of LJCA device
Date:   Mon, 13 Mar 2023 03:04:35 +0800
Message-Id: <20230312190435.3568212-6-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312190435.3568212-1-xiang.ye@intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add sysfs attributes Documentation entries for LJCA device

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-usb-devices-ljca    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca

diff --git a/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
new file mode 100644
index 000000000000..16eecaf870e2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
@@ -0,0 +1,36 @@
+What:		/sys/bus/usb/.../ljca_version
+Date:		July 2023
+KernelVersion:	6.4
+Contact:	Ye Xiang <xiang.ye@intel.com>
+Description:
+		Provides the current firmware version of LJCA device.
+		The format is Major.Minor.Patch.Build, where
+		Major, Minor, Patch, and Build are decimal numbers.
+		For example: 1.0.0.256
+
+What:		/sys/bus/usb/.../ljca_enable_dfu
+Date:		July 2023
+KernelVersion:	6.4
+Contact:	Ye Xiang <xiang.ye@intel.com>
+Description:
+		Writing 1 to this file to force the LJCA device into DFU
+		mode so the firmware can be updated. After firmware
+		updating has been done, the device will back to normal
+		working mode.
+
+What:		/sys/bus/usb/.../ljca_trace_level
+Date:		July 2023
+KernelVersion:	6.4
+Contact:	Ye Xiang <xiang.ye@intel.com>
+Description:
+		Writing N to this file to set firmware log level of LJCA
+		device. The log can be printed to another computer through
+		UART ports in LJCA device. Valid values:
+
+		  ==	==========
+		   0	LEVEL_ERROR
+		   1	LEVEL_WARNING
+		   2	LEVEL_INFO
+		   3	LEVEL_DEBUG
+		   4	LEVEL_OFF
+		  ==	==========
-- 
2.34.1

