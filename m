Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35D24DE2AE
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 21:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240747AbiCRUnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 16:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240614AbiCRUnQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 16:43:16 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688552878BA;
        Fri, 18 Mar 2022 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647636117; x=1679172117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fq0wZbk8atxPuFaALjnooW2wpUoFFUKI6rkPZWH8VS8=;
  b=DyXIa84j1h0dUr93EcQNRlkgURt7oFzDSF4/vsoKNpSzDMdtDyCK10G5
   AQh4AVL9NR3agBdcnaV5hNMmeHrwkj1m9gOfy2lvfFDPRarErpEkmowJH
   OHFkfM5vwWlCwTK2XZFvFMGzvTVwiXN8fM/ilcckpJHOxo7AWXgDTPyNh
   4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Mar 2022 13:41:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 13:41:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 13:41:56 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 18 Mar
 2022 13:41:55 -0700
From:   Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>
CC:     Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v3] i2c: add tracepoints for I2C slave events
Date:   Fri, 18 Mar 2022 13:41:33 -0700
Message-ID: <20220318204133.657568-1-quic_jaehyoo@quicinc.com>
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

	... i2c_slave: i2c-0 a=010 ret=0 WR_REQ []
	... i2c_slave: i2c-0 a=010 ret=0 WR_RCV [02]
	... i2c_slave: i2c-0 a=010 ret=0 WR_RCV [0c]
	... i2c_slave: i2c-0 a=010 ret=0   STOP []
	... i2c_slave: i2c-0 a=010 ret=0 RD_REQ [04]
	... i2c_slave: i2c-0 a=010 ret=0 RD_PRO [b4]
	... i2c_slave: i2c-0 a=010 ret=0  STOP []

formatted as:

	i2c-<adapter_nr>
	a=<addr>
	ret=<ret>	<- callback return value
	<event>
	[<data>]

trace printings can be selected by adding a filter like:

	echo adapter_nr==1 >/sys/kernel/tracing/events/i2c_slave/filter

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v3:
* Made trace print even when a callback return value is non-zero and print
  out the value too (Wolfram)
* Added TRACE_DEFINE_ENUM export for events to make it useful for perf and
  trace-cmd (Steven)

Changes in v2:
* Fixed trace_2c_slave call condition to optimize conditional compare logic
  (Steven)
* Fixed TP entry order to prevent wasting spaces in the ring buffer (Steven)
* Replaced __get_dynamic_array with __array for storing 1-length data value
  to make it faster and save space (Steven)

 drivers/i2c/i2c-core-slave.c     | 15 +++++++
 include/linux/i2c.h              |  8 +---
 include/trace/events/i2c_slave.h | 67 ++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 6 deletions(-)
 create mode 100644 include/trace/events/i2c_slave.h

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index 1589179d5eb9..e3765e12f93b 100644
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
+	if (trace_i2c_slave_enabled())
+		trace_i2c_slave(client, event, val, ret);
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
index 000000000000..811166abbe3a
--- /dev/null
+++ b/include/trace/events/i2c_slave.h
@@ -0,0 +1,67 @@
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
+TRACE_DEFINE_ENUM(I2C_SLAVE_READ_REQUESTED);
+TRACE_DEFINE_ENUM(I2C_SLAVE_WRITE_REQUESTED);
+TRACE_DEFINE_ENUM(I2C_SLAVE_READ_PROCESSED);
+TRACE_DEFINE_ENUM(I2C_SLAVE_WRITE_RECEIVED);
+TRACE_DEFINE_ENUM(I2C_SLAVE_STOP);
+
+#define show_event_type(type)						\
+	__print_symbolic(type,						\
+		{ I2C_SLAVE_READ_REQUESTED,	"RD_REQ" },		\
+		{ I2C_SLAVE_WRITE_REQUESTED,	"WR_REQ" },		\
+		{ I2C_SLAVE_READ_PROCESSED,	"RD_PRO" },		\
+		{ I2C_SLAVE_WRITE_RECEIVED,	"WR_RCV" },		\
+		{ I2C_SLAVE_STOP,		"  STOP" })
+
+TRACE_EVENT(i2c_slave,
+	TP_PROTO(const struct i2c_client *client, enum i2c_slave_event event,
+		 __u8 *val, int cb_ret),
+	TP_ARGS(client, event, val, cb_ret),
+	TP_STRUCT__entry(
+		__field(int,				adapter_nr	)
+		__field(int,				ret		)
+		__field(__u16,				addr		)
+		__field(__u16,				len		)
+		__field(enum i2c_slave_event,		event		)
+		__array(__u8,				buf,	1)	),
+
+	TP_fast_assign(
+		__entry->adapter_nr = client->adapter->nr;
+		__entry->addr = client->addr;
+		__entry->event = event;
+		__entry->ret = cb_ret;
+		switch (event) {
+		case I2C_SLAVE_READ_REQUESTED:
+		case I2C_SLAVE_READ_PROCESSED:
+		case I2C_SLAVE_WRITE_RECEIVED:
+			__entry->len = 1;
+			memcpy(__entry->buf, val, __entry->len);
+			break;
+		default:
+			__entry->len = 0;
+			break;
+		}
+		),
+	TP_printk("i2c-%d a=%03x ret=%d %s [%*phD]",
+		__entry->adapter_nr, __entry->addr, __entry->ret,
+		show_event_type(__entry->event), __entry->len, __entry->buf
+		));
+
+#endif /* _TRACE_I2C_SLAVE_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.25.1

