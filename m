Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6C36A2A3E
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Feb 2023 15:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjBYOCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Feb 2023 09:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjBYOB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Feb 2023 09:01:58 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB08B19F0E;
        Sat, 25 Feb 2023 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677333705; x=1708869705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B9y8b6VOGAgZmhcCzXb/p9gXQak0qJFRrYNMZF8AG6M=;
  b=mSO5p6C45VW1ROF1VxzjrckZfYe/CLdnSCYOuIPnItVrpKYBKiy8f4Dq
   /Gtlue778c+QP8+ctIpMNxsi8TsKSAadNNfSA+As7uc5q43eosAKwbzaL
   2jNeExq/KMlqUJYuG1sjxkT4pboZDwCa3pyyvJnWxCrHp5dPcQUiCgRnS
   6Ftzn27i28u64Bnwk6zE6dghQOSjkBE/xBMeI3NOxim+0Ex4mbu8Tf0cM
   kf6r8fJVIN7boePkK2KS7QrTPMBR/uz5MMz6bqiNEWRJMWfr1ujZ+yRR8
   SWuU0sZUqWUPbcdVcHcmCKcAuFhzF/pFOdjXIcH5XxesTc00vVqC7vfTV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314053475"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="314053475"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 06:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918740221"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="918740221"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2023 06:01:40 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v2 5/5] Documentation: Add ABI doc for attributes of LJCA device
Date:   Sat, 25 Feb 2023 22:01:18 +0800
Message-Id: <20230225140118.2037220-6-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225140118.2037220-1-xiang.ye@intel.com>
References: <20230225140118.2037220-1-xiang.ye@intel.com>
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
---
 .../ABI/testing/sysfs-bus-usb-devices-ljca    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca

diff --git a/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca b/Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
new file mode 100644
index 000000000000..43b95effdefc
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
+		dfu:	Echo dfu to this file so as to put the device into
+			DFU mode so the firmware can be updated.
+		debug:	Enable debug logging.
-- 
2.34.1

