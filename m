Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 818233282F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 07:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfFCF52 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 01:57:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33351 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfFCF51 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 01:57:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id x15so138992pfq.0
        for <linux-i2c@vger.kernel.org>; Sun, 02 Jun 2019 22:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqWxIIMl2imKkIUaU9tYJuWTnBc7/KebMofBHf5Rw3k=;
        b=QrWERqpJMnPE+sMO7GO2F1rmwUzkTzfzK2/YhRc90RQlw50qZ5q7N5xzBJrzqn4F5w
         xT8cAJuTkGJ4hjGvEbY/NhFZHhPrY0KPcIJw5VqxVmXT3s6+BoB2pu1/uSs5R/nweN6W
         LyiHDcihtXTlC0Yxs8kTveZ4cvC6foT/FCpIeaWeagdBBT0XPZ9MBFt0dStUUMFoDzzM
         rVnhdlNDBPajyOYqEXroaPvCdziXKG7nJcmZoeyfYYAylboqhtePvk4wLY62gr1+M5N/
         OzJBNV3dZl3noKDbFXCiifjgt9YACIwoh1xzuGwPSj9CcmsixGFEmtXnXZrtXllJg5nC
         OG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqWxIIMl2imKkIUaU9tYJuWTnBc7/KebMofBHf5Rw3k=;
        b=OXtiRHN6/G7TVj3wPD9vMBRMIPB6Ax/LASPtj9UUa6c1eo465x7+tGf9trl+QuhiUy
         YT5fkoHpR6Ea8RjiZ0NIOLkBRXSbQU0ENRWJ6Rw4OymIPuliml7EZpPtZOz/vOAPv5K5
         EN0fK71LDlZHrSzm36NSPKqOQedT71X+LySGm/u6xqpun9bDoVJP1r8Yz2BLTyg94Eho
         Svqe73i+U5ljxNNhtmN4zTL2HdkB3ogNCUvgE/4H9EwxRs1dBnEAXs2bRBfXNrBLUYEQ
         riDPaXCKEhOg5CdrhGTh8yYY/ZAdnkz2gST1UOTnApmIR/1l15LdxzyJTOAsmYjyxJ+X
         Fw0w==
X-Gm-Message-State: APjAAAWL3Sp5epGsRWlyIZ+hsQK9KuQoQs7BeER1nExt0nWPy6mPiKLZ
        6XBKbpcFhVdDTBv2j/qaaGLAtQxY
X-Google-Smtp-Source: APXvYqzTw1ecjQ7ICNu+PMgPyRYmmPKDBy/eOh3AH8ZvW7mg8I58HTUd2/84AatDqozaS8cP+QtHcw==
X-Received: by 2002:a63:7e43:: with SMTP id o3mr1173687pgn.450.1559541446803;
        Sun, 02 Jun 2019 22:57:26 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id n7sm4320211pgi.54.2019.06.02.22.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jun 2019 22:57:26 -0700 (PDT)
From:   Oliver O'Halloran <oohall@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     openbmc@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH] i2c: fsi: Create busses for all ports
Date:   Mon,  3 Jun 2019 15:57:14 +1000
Message-Id: <20190603055714.7203-1-oohall@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently we only create an I2C bus for the ports listed in the
device-tree for that master. There's no real reason for this since
we can discover the number of ports the master supports by looking
at the port_max field of the status register.

This patch re-works the bus add logic so that we always create buses
for each port, unless the bus is marked as unavailable in the DT. This
is useful since it ensures that all the buses provided by the CFAM I2C
master are accessible to debug tools.

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..59a76c6e31ad 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
 	.functionality = fsi_i2c_functionality,
 };
 
+static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
+					      int port)
+{
+	struct device_node *np;
+
+	for_each_child_of_node(fsi, np) {
+		rc = of_property_read_u32(np, "reg", &port_no);
+		if (!rc && port_no == port)
+			return np;
+	}
+
+	return NULL;
+}
+
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
+	u32 port_no, ports, stat;
 	int rc;
-	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	/* Add adapter for each i2c port of the master. */
-	for_each_available_child_of_node(dev->of_node, np) {
-		rc = of_property_read_u32(np, "reg", &port_no);
-		if (rc || port_no > USHRT_MAX)
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
+	if (rc)
+		return rc;
+
+	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
+	dev_dbg(dev, "I2C master has %d ports\n", ports);
+
+	for (port_no = 0; port_no < ports; port_no++) {
+		np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
+		if (np && !of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.20.1

