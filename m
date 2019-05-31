Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2083307C6
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 06:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfEaEeg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 00:34:36 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:48372 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfEaEeg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 00:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559277275; x=1590813275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2O9VDMwPVFSv9BNRL/ai8hSKJn7oiPKyqt4IoaybWf4=;
  b=S33jR6EnqQbCVTRQ4znKVPN3xqKgXbDm+KA7+/knGT61YgqTzYDSvn9Y
   Db9FO4Lgc5aEEqjbdOmY70+Z9Q09NKiMDQ9I3xgaWlNLgYeSrMbnjpuFJ
   eiCoajtexv28BU80qQZ/Z+FVOKGtN39SY2pv+7/QUV8wqbOAaqgvClzai
   Y=;
X-IronPort-AV: E=Sophos;i="5.60,533,1549929600"; 
   d="scan'208";a="807752774"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.22.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 31 May 2019 04:34:32 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS id 4B273A1E2C;
        Fri, 31 May 2019 04:34:28 +0000 (UTC)
Received: from EX13D05UWC004.ant.amazon.com (10.43.162.223) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:28 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05UWC004.ant.amazon.com (10.43.162.223) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 04:34:28 +0000
Received: from localhost (10.85.16.145) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Fri, 31 May 2019 04:34:28 +0000
From:   Eduardo Valentin <eduval@amazon.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <andriy.shevchenko@intel.com>,
        <brendanhiggins@google.com>, Eduardo Valentin <eduval@amazon.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: i2c: document bindings for i2c-slave-mqueue
Date:   Thu, 30 May 2019 21:33:45 -0700
Message-ID: <20190531043347.4196-2-eduval@amazon.com>
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

Document the i2c-slave-mqueue binding by adding
descriptor, required properties, and example.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Eduardo Valentin <eduval@amazon.com>
---
 .../bindings/i2c/i2c-slave-mqueue.txt         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
new file mode 100644
index 000000000000..eb1881a4fc0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
@@ -0,0 +1,34 @@
+===============================================
+Device Tree for I2C slave message queue backend
+===============================================
+
+Some protocols over I2C/SMBus are designed for bi-directional transferring
+messages by using I2C Master Write protocol. This requires that both sides
+of the communication have slave addresses.
+
+This I2C slave mqueue (message queue) is used to receive and queue
+messages from the remote i2c intelligent device; and it will add the target
+slave address (with R/W# bit is always 0) into the message at the first byte.
+
+Links
+----
+`Intelligent Platform Management Bus
+Communications Protocol Specification
+<https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf>`_
+
+`Management Component Transport Protocol (MCTP)
+SMBus/I2C Transport Binding Specification
+<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf>`_
+
+Required Properties:
+- compatible		: should be "i2c-slave-mqueue"
+- reg			: slave address
+
+Example:
+
+i2c {
+	slave_mqueue: i2c-slave-mqueue {
+		compatible = "i2c-slave-mqueue";
+		reg = <0x10>;
+	};
+};
-- 
2.21.0

