Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4364D0652
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 19:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240831AbiCGSWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 13:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbiCGSWa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 13:22:30 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32A882D08;
        Mon,  7 Mar 2022 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646677295; x=1678213295;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3LQ0B6lHtp/iHliRWS/KHEmauspBEfzknxmYTnH13Bk=;
  b=Jrl1mEom2jIti5Rcl/euFLNE5KXVTXlBzo3NR7g2uq1Z0jQdigRwsSUe
   mhMOOJSyq44S4mPQENCBiLXLZw9Mhz9odvDRNSnyKkRi7pWGNe/BXu5/+
   brjNp1Kg3fRqsRc4oHuP1XCb21Ysp+4Xnxny9jN8EgaDaCabEKUl7gd/f
   E=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Mar 2022 10:21:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 10:21:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 10:21:35 -0800
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 10:21:34 -0800
From:   Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>
CC:     Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH] i2c: add tracepoints for I2C slave events
Date:   Mon, 7 Mar 2022 10:20:49 -0800
Message-ID: <20220307182049.3790905-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C slave events tracepoints can be enabled by:

	echo 1 > /sys/kernel/tracing/events/i2c_slave/enable

and logs in /sys/kernel/tracing/trace will look like:

	... i2c_slave: i2c-0 a=010 WR_REQ []
	... i2c_slave: i2c-0 a=010 WR_RCV [02]
	... i2c_slave: i2c-0 a=010 WR_RCV [0c]
	... i2c_slave: i2c-0 a=010   STOP []
	... i2c_slave: i2c-0 a=010 RD_REQ [04]
	... i2c_slave: i2c-0 a=010 RD_PRO [b4]
	... i2c_slave: i2c-0 a=010   STOP []

formatted as:

	i2c-<adapter-nr>
	a=<addr>
	<event>
	[<data>]

trace printings can be selected by adding a filter like:

	echo adapter_nr==1 >/sys/kernel/tracing/events/i2c_slave/filter

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 drivers/i2c/i2c-core-slave.c     | 15 +++++++++
 include/linux/i2c.h              |  8 ++---
 include/trace/events/i2c_slave.h | 57 ++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 6 deletions(-)
 create mode 100644 include/trace/events/i2c_slave.h

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index 1589179d5eb9..4968a17328b3 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -14,6 +14,9 @@
 
 #include "i2c-core.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/i2c_slave.h>
+
 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
 {
 	int ret;
@@ -79,6 +82,18 @@ int i2c_slave_unregister(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_slave_unregister);
 
+int i2c_slave_event(struct i2c_client *client,
+		    enum i2c_slave_event event, u8 *val)
+{
+	int ret = client->slave_cb(client, event, val);
+
+	if (!ret)
+		trace_i2c_slave(client, event, val);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i2c_slave_event);
+
 /**
  * i2c_detect_slave_mode - detect operation mode
  * @dev: The device owning the bus
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 7d4f52ceb7b5..fbda5ada2afc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -392,12 +392,8 @@ enum i2c_slave_event {
 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
 int i2c_slave_unregister(struct i2c_client *client);
 bool i2c_detect_slave_mode(struct device *dev);
-
-static inline int i2c_slave_event(struct i2c_client *client,
-				  enum i2c_slave_event event, u8 *val)
-{
-	return client->slave_cb(client, event, val);
-}
+int i2c_slave_event(struct i2c_client *client,
+		    enum i2c_slave_event event, u8 *val);
 #else
 static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
 #endif
diff --git a/include/trace/events/i2c_slave.h b/include/trace/events/i2c_slave.h
new file mode 100644
index 000000000000..1f0c1cfbf2ef
--- /dev/null
+++ b/include/trace/events/i2c_slave.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * I2C slave tracepoints
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM i2c_slave
+
+#if !defined(_TRACE_I2C_SLAVE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_I2C_SLAVE_H
+
+#include <linux/i2c.h>
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(i2c_slave,
+	TP_PROTO(const struct i2c_client *client, enum i2c_slave_event event,
+		 __u8 *val),
+	TP_ARGS(client, event, val),
+	TP_STRUCT__entry(
+		__field(int,				adapter_nr	)
+		__field(__u16,				addr		)
+		__field(enum i2c_slave_event,		event		)
+		__field(__u16,				len		)
+		__dynamic_array(__u8, buf, 1)				),
+
+	TP_fast_assign(
+		__entry->adapter_nr = client->adapter->nr;
+		__entry->addr = client->addr;
+		__entry->event = event;
+		switch (event) {
+		case I2C_SLAVE_READ_REQUESTED:
+		case I2C_SLAVE_READ_PROCESSED:
+		case I2C_SLAVE_WRITE_RECEIVED:
+			__entry->len = 1;
+			memcpy(__get_dynamic_array(buf), val, __entry->len);
+			break;
+		default:
+			__entry->len = 0;
+			break;
+		}
+		),
+	TP_printk("i2c-%d a=%03x %s [%*phD]",
+		__entry->adapter_nr, __entry->addr,
+		__print_symbolic(__entry->event,
+				 { I2C_SLAVE_READ_REQUESTED,	"RD_REQ" },
+				 { I2C_SLAVE_WRITE_REQUESTED,	"WR_REQ" },
+				 { I2C_SLAVE_READ_PROCESSED,	"RD_PRO" },
+				 { I2C_SLAVE_WRITE_RECEIVED,	"WR_RCV" },
+				 { I2C_SLAVE_STOP,		"  STOP" }),
+		__entry->len, __get_dynamic_array(buf)
+		));
+
+#endif /* _TRACE_I2C_SLAVE_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.25.1

