Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D8A3619C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 18:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfFEQrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 12:47:12 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:7961 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728693AbfFEQrE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 12:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559753223; x=1591289223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aMS3WBEJK3R1HdJkg+t88tBD6hY3IQ1Rjf9Hl2MKfDQ=;
  b=Gy93irmftHPE3yzcjF3fT4QThPw8MHQpcoaExzieqRsJ5R9n7/aEA2xO
   JZ/91qylSTj5kufrBBj1vArPtsC+J1KBFPzHLcfRWb8YJvbMXXdAn5wNI
   ftcOk3ZMisBoryykaeoMZa/fCq7rtCQ+vj05nX4NmDU8RpKM/JTN4Hlwn
   Q=;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; 
   d="scan'208";a="769129606"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 05 Jun 2019 16:47:01 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS id 42058A236A;
        Wed,  5 Jun 2019 16:47:01 +0000 (UTC)
Received: from EX13D05UWB003.ant.amazon.com (10.43.161.26) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 16:46:54 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05UWB003.ant.amazon.com (10.43.161.26) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 16:46:54 +0000
Received: from localhost (10.85.18.74) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Wed, 5 Jun 2019 16:46:54 +0000
From:   Eduardo Valentin <eduval@amazon.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <andriy.shevchenko@intel.com>,
        <brendanhiggins@google.com>, Eduardo Valentin <eduval@amazon.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCHv7 3/3] Documentation: ABI: Add i2c-slave-mqueue sysfs documentation
Date:   Wed, 5 Jun 2019 09:46:51 -0700
Message-ID: <20190605164651.15991-4-eduval@amazon.com>
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

changes from V6 to V7:
- none

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

