Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A62136C6E9A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 18:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjCWRVd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 13:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbjCWRV3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 13:21:29 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A088B2914B;
        Thu, 23 Mar 2023 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592082; x=1711128082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pj85TQJLVLJmuPO/tAllo3uaWpcFLIm3bykN9olfZNU=;
  b=JnpxhSbkGW2QpZHDOahwO37dnDMtnRxvfdm5mwkzF6msMbYYDm6R6GYe
   dYQ7GkyOPXT91XpQFm8lW9gBtQlzTYktzYzNE8F86qDhl4IHglJGB8RcQ
   RbSLpedW9vEQ46UmAknR2XWYA0/F45VDkLQIe6e7KpJcT1qsrlNocIdca
   1GGZgbxSH4TKNp0gybILpGV+U7s11mfNbIqkWr0ffFK+u3fdYZTtWHIOC
   W1U8LXdF3h7zCd4I8IaMuaWcQYPfWgSlWHbQ8PRP0WaK3TPtrPAb3So8Q
   CHH23hAlnMzZZoJ1raWRe/6ITJYjDWrg/oWzNwSltPJoCBMszpR0j1Z12
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425840228"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="425840228"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712748291"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712748291"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 10:21:16 -0700
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
Subject: [PATCH v6 2/6] usb: ljca: Add transport interfaces for sub-module drivers
Date:   Fri, 24 Mar 2023 01:21:09 +0800
Message-Id: <20230323172113.1231050-3-xiang.ye@intel.com>
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

This patch adds the transport interfaces for various LJCA
sub-module drivers to communicate with LJCA hardware. The
sub-module of LJCA can use ljca_transfer() to issue a transfer
between host and hardware. And ljca_register_event_cb is exported
to LJCA sub-module drivers for hardware event subscription.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
---
 drivers/usb/misc/ljca.c  | 47 ++++++++++++++++++++++++++++
 include/linux/usb/ljca.h | 66 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/drivers/usb/misc/ljca.c b/drivers/usb/misc/ljca.c
index 3e4f85f453dd..7b874b82f1da 100644
--- a/drivers/usb/misc/ljca.c
+++ b/drivers/usb/misc/ljca.c
@@ -380,6 +380,53 @@ static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
 			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
 }
 
+int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len, void *ibuf,
+		  unsigned int *ibuf_len)
+{
+	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, ibuf, ibuf_len, true);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
+
+int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len)
+{
+	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, NULL, NULL, false);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
+
+int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context)
+{
+	struct ljca_stub *stub;
+	unsigned long flags;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+	stub->event_entry.notify = event_cb;
+	stub->event_entry.context = context;
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
+
+void ljca_unregister_event_cb(struct ljca *ljca)
+{
+	struct ljca_stub *stub;
+	unsigned long flags;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return;
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+	stub->event_entry.notify = NULL;
+	stub->event_entry.context = NULL;
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
+
 static void ljca_read_complete(struct urb *urb)
 {
 	struct ljca_msg *header = urb->transfer_buffer;
diff --git a/include/linux/usb/ljca.h b/include/linux/usb/ljca.h
index 057f18c5b17a..9ae3ea242294 100644
--- a/include/linux/usb/ljca.h
+++ b/include/linux/usb/ljca.h
@@ -26,4 +26,70 @@ struct ljca_spi_info {
 	u8 capacity;
 };
 
+/**
+ * typedef ljca_event_cb_t - event callback function signature
+ *
+ * @context: the execution context of who registered this callback
+ * @cmd: the command from device for this event
+ * @evt_data: the event data payload
+ * @len: the event data payload length
+ *
+ * The callback function is called in interrupt context and the data payload is
+ * only valid during the call. If the user needs later access of the data, it
+ * must copy it.
+ */
+typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void *evt_data, int len);
+
+/**
+ * ljca_register_event_cb - register a callback function to receive events
+ *
+ * @ljca: ljca device handle
+ * @event_cb: callback function
+ * @context: execution context of event callback
+ *
+ * Return: 0 in case of success, negative value in case of error
+ */
+int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context);
+
+/**
+ * ljca_unregister_event_cb - unregister the callback function for an event
+ *
+ * @ljca: ljca device handle
+ */
+void ljca_unregister_event_cb(struct ljca *ljca);
+
+/**
+ * ljca_transfer - issue a LJCA command and wait for a response and the
+ * associated data
+ *
+ * @ljca: ljca device handle
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device; it should
+ *	be 0 when obuf is NULL
+ * @ibuf: any data associated with the response will be copied here; it can be
+ *	NULL if the user doesn't need the response data
+ * @ibuf_len: must be initialized to the input buffer size; it will be modified
+ *	to indicate the actual data transferred; it shouldn't be NULL as well
+ *	when ibuf isn't NULL
+ *
+ * Return: 0 for success, negative value for errors
+ */
+int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len,
+		  void *ibuf, unsigned int *ibuf_len);
+
+/**
+ * ljca_transfer_noack - issue a LJCA command without a response
+ *
+ * @ljca: ljca device handle
+ * @cmd: the command to be sent to the device
+ * @obuf: the buffer to be sent to the device; it can be NULL if the user
+ *	doesn't need to transmit data with this command
+ * @obuf_len: the size of the buffer to be sent to the device
+ *
+ * Return: 0 for success, negative value for errors
+ */
+int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len);
+
 #endif
-- 
2.34.1

