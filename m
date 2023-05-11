Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AB06FF929
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 20:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbjEKSCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 14:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239021AbjEKSBx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 14:01:53 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECEF5246;
        Thu, 11 May 2023 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683828110; x=1715364110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JOjP3peX0ZEQlt5bUy6rekVF3QLzY7oGXCu8avzeStM=;
  b=fjx2ymldCaHVfv75LCbNFOM4bluau6ItGkz7n3iJlUOUfi27b8uiJzRi
   nd1yRV1Kfo6mp+YTEYwc2HcPNEuDJjJ0P27XW5jZlPz4H0ldltAUargNb
   7qpMovAWia4GdvZYY5EwUgzRSFWIO1gqIfs0Rvsn6K1I70HGhI6BCGAn5
   72NJ4Rkn+JlYJ1jcTLLeHkcgxUvIDNqcfMf5BBsOB37uVW+F3kxnHl2sK
   HICdhauYl+bSE2p0GQQIqnIVgmdTVogAkF0LXeWxtHstMKJkV2bRgM0qa
   hIr37OiXPEv0g28MSFJG80C7Lp9FQl2Momcsl/ksaYzgVxySC2c6eIEDy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413942758"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="413942758"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 11:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874061630"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="874061630"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.153.70])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 11:01:01 -0700
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v8 3/6] Documentation: Add ABI doc for attributes of LJCA device
Date:   Fri, 12 May 2023 01:58:41 +0800
Message-Id: <20230511175844.185070-4-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511175844.185070-1-xiang.ye@intel.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add sysfs attributes Documentation entries for LJCA device

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
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

