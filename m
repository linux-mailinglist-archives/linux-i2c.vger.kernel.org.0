Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA6344E66B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 13:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbhKLMhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 07:37:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:19873 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231147AbhKLMhx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 07:37:53 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220016356"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="220016356"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 04:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="492985802"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2021 04:35:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 56979C5; Fri, 12 Nov 2021 14:35:03 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description for struct dw_i2c_dev
Date:   Fri, 12 Nov 2021 14:34:59 +0200
Message-Id: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

$ scripts/kernel-doc -none drivers/i2c/busses/i2c-designware-core.h
warning: Function parameter or member 'rst' not described in 'dw_i2c_dev'
warning: Function parameter or member 'get_clk_rate_khz' not described in 'dw_i2c_dev'
warning: Function parameter or member 'flags' not described in 'dw_i2c_dev'
warning: Function parameter or member 'functionality' not described in 'dw_i2c_dev'
warning: Function parameter or member 'master_cfg' not described in 'dw_i2c_dev'
warning: Function parameter or member 'set_sda_hold_time' not described in 'dw_i2c_dev'
warning: Function parameter or member 'rinfo' not described in 'dw_i2c_dev'

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 60a2e750cee9..4b26cba40139 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -191,23 +191,26 @@ struct reset_control;
  * @cmd_complete: tx completion indicator
  * @clk: input reference clock
  * @pclk: clock required to access the registers
+ * @rst: optional reset for the controller
  * @slave: represent an I2C slave device
+ * @get_clk_rate_khz: callback to retrieve IP specific bus speed
  * @cmd_err: run time hadware error code
  * @msgs: points to an array of messages currently being transferred
  * @msgs_num: the number of elements in msgs
- * @msg_write_idx: the element index of the current tx message in the msgs
- *	array
+ * @msg_write_idx: the element index of the current tx message in the msgs array
  * @tx_buf_len: the length of the current tx buffer
  * @tx_buf: the current tx buffer
- * @msg_read_idx: the element index of the current rx message in the msgs
- *	array
+ * @msg_read_idx: the element index of the current rx message in the msgs array
  * @rx_buf_len: the length of the current rx buffer
  * @rx_buf: the current rx buffer
  * @msg_err: error status of the current transfer
  * @status: i2c master status, one of STATUS_*
  * @abort_source: copy of the TX_ABRT_SOURCE register
  * @irq: interrupt number for the i2c master
+ * @flags: platform specific flags like type of IO accessors or model
  * @adapter: i2c subsystem adapter node
+ * @functionality: I2C_FUNC_* ORed bits to reflect what controller does support
+ * @master_cfg: configuration for the master device
  * @slave_cfg: configuration for the slave device
  * @tx_fifo_depth: depth of the hardware tx fifo
  * @rx_fifo_depth: depth of the hardware rx fifo
@@ -228,7 +231,9 @@ struct reset_control;
  * @disable: function to disable the controller
  * @disable_int: function to disable all interrupts
  * @init: function to initialize the I2C hardware
+ * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
+ * @rinfo: I²C GPIO recovery information
  * @suspended: set to true if the controller is suspended
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
-- 
2.33.0

