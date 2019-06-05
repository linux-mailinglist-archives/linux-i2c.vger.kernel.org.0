Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0748836196
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 18:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbfFEQrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 12:47:03 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:7961 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbfFEQrC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 12:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559753221; x=1591289221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gAunuADjUlfvR6+lZVJDavO/Jg439Hd4VR1/jUhyiuU=;
  b=EtIXGMemhK8XfXLJO9UL3EhyVVewcFRo96pbCqEfFd5duGfjyhKJxVYY
   EKgs+eS+uod8a93nBR7cLSEhkChp7yszd1g4d9ooXC77WOwQKWf3U6rGx
   enJuVkKi1EcytUUPHUCA6VCz7iQlXE3TbHc9F3DyJ1lXLJy0wd3Pr86tR
   U=;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; 
   d="scan'208";a="769129587"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 05 Jun 2019 16:46:54 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS id C53A5A23E9;
        Wed,  5 Jun 2019 16:46:53 +0000 (UTC)
Received: from EX13D05UWB001.ant.amazon.com (10.43.161.181) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 16:46:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05UWB001.ant.amazon.com (10.43.161.181) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 16:46:53 +0000
Received: from localhost (10.85.18.74) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Wed, 5 Jun 2019 16:46:53 +0000
From:   Eduardo Valentin <eduval@amazon.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <andriy.shevchenko@intel.com>,
        <brendanhiggins@google.com>, Eduardo Valentin <eduval@amazon.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCHv7 1/3] dt-bindings: i2c: document bindings for i2c-slave-mqueue
Date:   Wed, 5 Jun 2019 09:46:49 -0700
Message-ID: <20190605164651.15991-2-eduval@amazon.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605164651.15991-1-eduval@amazon.com>
References: <20190605164651.15991-1-eduval@amazon.com>
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

Changes from V6 to V7:
- none

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

