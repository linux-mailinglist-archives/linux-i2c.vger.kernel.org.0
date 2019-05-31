Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A8D307CD
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 06:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfEaEez (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 00:34:55 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:12072 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfEaEey (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 00:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559277294; x=1590813294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4KissP6CMHlJHUEfDn3Ulh/jhmUATHtnEKo07Th9Pjo=;
  b=Y9MvmrlRQyLDz4ISkyFk/TbXAq1vFY19M4KWuBT7gyIHhwAaKhaS4X6Y
   NENcge8QmjOmkvg8zxdAyPrd/TjaW625fnwja9rLnUrZn82fteivSrLcM
   H1GQ+m7957nr1O9202n1kWeH43KIciDQh8czwf7lIVvlpbcFGoyBTuGgu
   s=;
X-IronPort-AV: E=Sophos;i="5.60,533,1549929600"; 
   d="scan'208";a="404446461"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 31 May 2019 04:34:53 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS id 01A85A247F;
        Fri, 31 May 2019 04:34:49 +0000 (UTC)
Received: from EX13D05UWB001.ant.amazon.com (10.43.161.181) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05UWB001.ant.amazon.com (10.43.161.181) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:29 +0000
Received: from localhost (10.85.16.145) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Fri, 31 May 2019 04:34:29 +0000
From:   Eduardo Valentin <eduval@amazon.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <andriy.shevchenko@intel.com>,
        <brendanhiggins@google.com>, Eduardo Valentin <eduval@amazon.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] Documentation: ABI: Add i2c-slave-mqueue sysfs documentation
Date:   Thu, 30 May 2019 21:33:47 -0700
Message-ID: <20190531043347.4196-4-eduval@amazon.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531043347.4196-1-eduval@amazon.com>
References: <20190531043347.4196-1-eduval@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the slave-mqueue sysfs attribute used by
the i2c-slave-mqueue driver.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Eduardo Valentin <eduval@amazon.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-slave-mqueue     | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-slave-mqueue

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-slave-mqueue b/Documentation/ABI/testing/sysfs-bus-i2c-devices-slave-mqueue
new file mode 100644
index 000000000000..28318108ce85
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-slave-mqueue
@@ -0,0 +1,10 @@
+What:		/sys/bus/i2c/devices/*/slave-mqueue
+Date:		May 2019
+KernelVersion:	5.2
+Contact:	Eduardo Valentin <eduval@amazon.com>
+Description:
+		Reading to this file will return exactly one message,
+		when available, of the i2c-slave-mqueue device attached
+		to that bus. Userspace can also poll on this file to
+		get notified when new messages are available.
+Users:		i2c-slave-mqueue driver
-- 
2.21.0

