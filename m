Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DDC6FF920
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 20:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239061AbjEKSB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 14:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238960AbjEKSBw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 14:01:52 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B799F4218;
        Thu, 11 May 2023 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683828104; x=1715364104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dJJmS8cUJvOi/sZ1VchRmzwhvoPImOPRXfO0Qz+Mo6U=;
  b=eIVGyQjZT/QikFAuz9dJbtBk8p8TCjClhOpMQdK5CY0yyUdbnb8WZDaL
   gTebyQuwXrA09jMDSTwqj9TuGhORDmDcE7Fds5gSitexCO0IcZosyxHaI
   R+Ap/aMLzHTvkzkxtd5kzswpsh+QVTteoEgWksnGjfeFtvaK+x39SJDmb
   wg2eaU2OgAgNfdqSUUHjbYHH0SRURmeGeoPplqwks43qvjOSPRLW7mLVy
   F4mCe//do1lMSpLtw5cAFUmW4nqWx7E7O9/MWimZ1RRJBjG/sFa3ZaVto
   UseX1artRZSCeGQUjHPZTm4jiS1ArPb0xf+PAAVdeRjc/cmBGWKFxNyYk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413942695"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="413942695"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 11:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874061484"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="874061484"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.153.70])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 11:00:54 -0700
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
Subject: [PATCH v8 2/6] usb: ljca: Add transport interfaces for sub-module drivers
Date:   Fri, 12 May 2023 01:58:40 +0800
Message-Id: <20230511175844.185070-3-xiang.ye@intel.com>
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

Adds the transport interfaces for various LJCA sub-module drivers
to communicate with LJCA hardware. The sub-modules of LJCA can use
ljca_transfer() to issue a transfer between host and hardware. And
ljca_register_event_cb is exported to LJCA sub-module drivers for
hardware event subscription.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
---
 drivers/usb/misc/usb-ljca.c | 91 +++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h    | 52 +++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 4f76f73fdcac..3b68c9e472fc 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -368,6 +368,97 @@ static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, uns
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
+	struct ljca_event_cb_entry *entry, *iter;
+	struct ljca_stub *stub;
+	unsigned long flags;
+	int ret;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->notify = event_cb;
+	entry->context = context;
+	entry->id = ljca->id;
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+
+	list_for_each_entry(iter, &stub->event_entrys, list) {
+		if (iter->id == ljca->id) {
+			ret = -EBUSY;
+			break;
+		}
+	}
+
+	if (!ret)
+		list_add_tail(&entry->list, &stub->event_entrys);
+
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+
+	if (ret)
+		kfree(entry);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
+
+void ljca_unregister_event_cb(struct ljca *ljca)
+{
+	struct ljca_stub *stub;
+	struct ljca_event_cb_entry *iter;
+	unsigned long flags;
+
+	stub = ljca_stub_find(ljca->dev, ljca->type);
+	if (IS_ERR(stub))
+		return;
+
+	spin_lock_irqsave(&stub->event_cb_lock, flags);
+
+	list_for_each_entry(iter, &stub->event_entrys, list) {
+		if (iter->id == ljca->id) {
+			list_del_init(&iter->list);
+			kfree(iter);
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
+}
+EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
+
 static void ljca_read_complete(struct urb *urb)
 {
 	struct ljca_msg *header = urb->transfer_buffer;
diff --git a/include/linux/usb/ljca.h b/include/linux/usb/ljca.h
index f209fa3ba54a..74e9729d05ec 100644
--- a/include/linux/usb/ljca.h
+++ b/include/linux/usb/ljca.h
@@ -47,4 +47,56 @@ struct ljca_spi_info {
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

