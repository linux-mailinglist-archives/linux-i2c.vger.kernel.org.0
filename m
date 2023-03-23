Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24CE6C6E9F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 18:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbjCWRVm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 13:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCWRVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 13:21:38 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AA9274BF;
        Thu, 23 Mar 2023 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592089; x=1711128089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JOjP3peX0ZEQlt5bUy6rekVF3QLzY7oGXCu8avzeStM=;
  b=RTuMT+c3vJv0PUd3N4w7xuXwjRQSnfXa6Hm0RZ3TE81DcUF2/pE3G4zV
   sC+47LMmIr5gDUExxbCAcM4KTqlmompBpoWCQvd3Ku1FNkquf/dHAMv9X
   +j7WdPcTm5BNeNg3yjQrHBB1NqQO80dK6SBh1dd/dLY3cU1ZYAl2a3dlO
   dlBSwsbm8Pmi6HtK71bVCutp51dYC7w90JgW9RKI/yGZ/pcrxHmD51QUh
   +Wq5X9i5GfaHGJ9XUFZ3HmL4U8qB5Y4odJzCFg4mox2UOob/XTMWvjX6n
   GUBnk8ZCVUBaQebUZX8kcku5nHYC70QJSp83jSZRmrgnAFjE8br0dGmpN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425840253"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="425840253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712748305"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712748305"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 10:21:23 -0700
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
Subject: [PATCH v6 3/6] Documentation: Add ABI doc for attributes of LJCA device
Date:   Fri, 24 Mar 2023 01:21:10 +0800
Message-Id: <20230323172113.1231050-4-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323172113.1231050-1-xiang.ye@intel.com>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
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

