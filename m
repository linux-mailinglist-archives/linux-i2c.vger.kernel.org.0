Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45119143141
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 19:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgATSF5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 13:05:57 -0500
Received: from mga05.intel.com ([192.55.52.43]:19642 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgATSF5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 13:05:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 10:05:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="228481026"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2020 10:05:54 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1itbQw-0007b6-9S; Tue, 21 Jan 2020 02:05:54 +0800
Date:   Tue, 21 Jan 2020 02:05:40 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     kbuild-all@lists.01.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, wsa+renesas@sang-engineering.com,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>
Subject: [RFC PATCH] HID: mcp2221: mcp_smbus_xfer() can be static
Message-ID: <20200120180540.5v5mzbr72aygwb6l@f53c9c00458a>
References: <7b81210829dabdc96257084ff5b4cc97f2f2ebec.1579497275.git.gupt21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b81210829dabdc96257084ff5b4cc97f2f2ebec.1579497275.git.gupt21@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Fixes: 38f8a303aca6 ("HID: mcp2221: add usb to i2c-smbus host bridge driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 hid-mcp2221.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 9897599a868bf..b0e7ea0d267d0 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -394,7 +394,7 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
 	return ret;
 }
 
-int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
+static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 				unsigned short flags, char read_write,
 				u8 command, int size,
 				union i2c_smbus_data *data)
