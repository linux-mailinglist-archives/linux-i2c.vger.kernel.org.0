Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCE537372
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 13:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfFFLwj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 07:52:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45889 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbfFFLwj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 07:52:39 -0400
Received: by mail-pl1-f196.google.com with SMTP id x7so820013plr.12
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jun 2019 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=blH/ADtjzK9YsJSTsS01CxxSyUBPkBx6oUfeUl/QPQc=;
        b=jfHAGPy/xgbVnb2fL5ba+FB6dY6KjRLp5L69Ylblsc8MtRtd0GXcVGm3oOqPN2vZJT
         uUdugxOa0MSi/rBAQAaXbIkntRdj0ZoR9e3dyGZxfnnKh3JDaDtgDQGMwZslHX2sYkoD
         wiBEx0b316YXKK6gXHwk5YD/jCH4MtVmx4G2WeMcdk3zyOLCzkCirpzQz5KpuKwd/zeC
         Og7V/fc9hY73h7EQ22rYvn01hEOFSLD4HjbORQrUK9W6XsfP1WxWkOSieKE4Id6v0z7R
         xPm1sIimTiHGqfc1agRU+2cHa4rvm0zI5qO5fqHdhdO30eLZtJ/OZMP86AtR2XhskfOl
         uQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=blH/ADtjzK9YsJSTsS01CxxSyUBPkBx6oUfeUl/QPQc=;
        b=ry9h01zikZPh6VMY2/vgM2/3jF9rsee294o4Ztv4yjbg4+AhWpbuUans1xNOFu/9mz
         IkUudRGo5NOeXMaZo9Uv6jOAaK/Vk1GFsD/zke1lIy68IrzF8oMsFCoIry6KtHlVoMm7
         LR5ALG1EqQPwWva1zP9wRUYHxVHAYlENs7We1pYSdChtztjQLz/c/yo/l2sdU9csqRzJ
         QV5uK3cphuEBNFq9jWJkOVZ0P3N9TZd4JzQM/iycga2badz7T7mil//dHgI2/sfoU+m6
         8JBFTbn5FNjSd3E4tsmxibq4zDpMzak6j8tg/yVx6XCE0QfBHtyPOVgMy42b2p8hPR+t
         ZSoQ==
X-Gm-Message-State: APjAAAX0I4yTEiDM/GOXIFqlkkBsRnJuk/IKIKPOqc6p9vf/J2f681In
        bxa9W0PUZ63PWamfkclNpXBPpsKU
X-Google-Smtp-Source: APXvYqykYMhmOhk7r5PxJ427J0KH7jiTrLQ0MHpt52OthS8P+XWhVXxwCzGgKFZHWcfW74eUUAmOAw==
X-Received: by 2002:a17:902:2aa8:: with SMTP id j37mr9979051plb.316.1559821958629;
        Thu, 06 Jun 2019 04:52:38 -0700 (PDT)
Received: from 192-168-1-2.tpgi.com.au (14-200-200-125.tpgi.com.au. [14.200.200.125])
        by smtp.gmail.com with ESMTPSA id c142sm3878241pfb.171.2019.06.06.04.52.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 04:52:37 -0700 (PDT)
From:   Oliver O'Halloran <oohall@gmail.com>
To:     openbmc@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v2] i2c: fsi: Create busses for all ports
Date:   Thu,  6 Jun 2019 21:52:20 +1000
Message-Id: <20190606115220.9888-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
v2: Fixed off-by-one when calulating the number of ports.
    Compile fixes.
---
 drivers/i2c/busses/i2c-fsi.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..da5eb3960def 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -658,13 +658,29 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
 	.functionality = fsi_i2c_functionality,
 };
 
+static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
+						     int port)
+{
+	struct device_node *np;
+	u32 port_no;
+	int rc;
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
@@ -678,10 +694,16 @@ static int fsi_i2c_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	/* Add adapter for each i2c port of the master. */
-	for_each_available_child_of_node(dev->of_node, np) {
-		rc = of_property_read_u32(np, "reg", &port_no);
-		if (rc || port_no > USHRT_MAX)
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	if (rc)
+		return rc;
+
+	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
+	dev_dbg(dev, "I2C master has %d ports\n", ports);
+
+	for (port_no = 0; port_no < ports; port_no++) {
+		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
+		if (np && !of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.21.0

