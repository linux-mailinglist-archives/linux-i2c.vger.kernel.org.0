Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644316C8F22
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 16:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjCYPsw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 11:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjCYPsj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 11:48:39 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC03125B8;
        Sat, 25 Mar 2023 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679759306; x=1711295306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8PoY0wOxr2hCkAJObt/wrxk3lmynqpPMnWf9AK9p9Xw=;
  b=Jjl6FQN2d14f/A0a5BxICzsTM5PdrkWcIJcPsRNNkYqyYslsieQD+us7
   +sfCowRKCMbQnRmOXtpMCWJCPLKHylG9b/shhVTNe1kCvPJO0oJuHX5Fw
   U7Hn57D0NYaZG16iBhEIXRx/X2W0bO0B9Bvk6atnbRu+m6az7/9MBm/q5
   zyKm6ScVEu48dSfuNkNi0BS9lFEjG9rFTSDvQyXLnfhHE89TRj+uXrkU6
   Icq+P6uE3e+h0xsjtZcZWAFtkz1a9KQcNt8eN+cXQ9oVOx58BpcX9JRYj
   JuMLzJBBKC0qMaWQjt9Ze5zyt+k3cClH3ICJLKPhq7goq19yrDkguPY5y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="341558884"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="341558884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 08:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="793793995"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="793793995"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2023 08:48:09 -0700
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
Subject: [PATCH v7 2/6] usb: ljca: Add transport interfaces for sub-module drivers
Date:   Sat, 25 Mar 2023 23:47:07 +0800
Message-Id: <20230325154711.2419569-3-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325154711.2419569-1-xiang.ye@intel.com>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/usb/misc/usb-ljca.c | 61 +++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h    | 52 +++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 96e2b8c43c58..a5312869693a 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -365,6 +365,67 @@ static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, uns
 	return ret;
 }
 
+static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
+				  unsigned int obuf_len, void *ibuf, unsigned int *ibuf_len,
+				  bool wait_ack)
+{
+	struct ljca_stub *stub;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	return ljca_stub_write(stub, cmd, obuf, obuf_len, ibuf, ibuf_len, wait_ack,
+			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
+}
+
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
index 843d9f79865a..9ae3ea242294 100644
--- a/include/linux/usb/ljca.h
+++ b/include/linux/usb/ljca.h
@@ -40,4 +40,56 @@ struct ljca_spi_info {
  */
 typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void *evt_data, int len);
 
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

