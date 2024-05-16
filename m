Return-Path: <linux-i2c+bounces-3515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA68C7BEE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFC81C21092
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1919C157E9D;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Zxb1b574"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D4157467;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883573; cv=none; b=reswc737f1iWFjE8T/km9j9lS6JtHR/916OEKjunQpOIaVv+HX3vawUbb1ll5vu1JLsC7JSDMmelalXDPi2a6JGELTtKyI1ARnHbeQNCbrUuzoWsSWWNpAelpQpJBWaptQIjOni/d9Yiyi3pI5mFPLZHUyvUZm4LxNl4nl/g2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883573; c=relaxed/simple;
	bh=p7IE1f7B3E4HXLYKDsiggW4zvHAZ9T9oqWSSmLtsBtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bRkzJDRKquJQ3hOZv/6X5bVJdoFImN8iGtswHu2+gxPXa6k/+FOvbB+Pdym7gPy3+08k8zSqUIo0sr6edBb5hgL3O8emKtKye1HDj/vM2yP1dJjR/vSJ/UfyvlQ3Bb7eZ2v5CTAfaW8iI6e8cWj0oOdCofYtoBmKBDz2RXkiGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Zxb1b574; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAVoW020127;
	Thu, 16 May 2024 18:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6pwGrpGa/9FUM1RJLI4c4OWS/mHbmuo48TsghubX0+s=;
 b=Zxb1b574n8I2x9p6vQUA29tjzUbxcrlwBCCMwKzbv5vn5s4j6PLo3o0Gqr18N3X9zx6m
 PfI7B3K6c4/Zhh4yy3A4W3TjrlK9FGQPa68ixa6E3jgEb2vFoTa9JjyywX5xWtnS0pEW
 8SFYuhHUOIw4r1bGnQn5rVdUkQ0kT+aeS21+HzzN6T8S+8XVYGyv0UdO7sGFALzrwkE3
 y7+J+LOtpGdA3kw8VMwWm+FOZluion4W+WLaxT+bcQnYNO81inS/Yjyk2/j+foYv8Zv3
 ETfSP3lQUDOrhkFjgovGsBNjUU4ChBcwjkL1RrGfpdY5ESxkZ0XRlPwIkBeINysP9Enq 9Q== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5p6gg5n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHFiN2018766;
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJG7M49218076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CF255806D;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F34FC58070;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 29/40] i2c: fsi: Remove list structure of ports
Date: Thu, 16 May 2024 13:18:56 -0500
Message-Id: <20240516181907.3468796-30-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZZjglmFtzoOlff8a-TI-jak3p52l_MXE
X-Proofpoint-ORIG-GUID: ZZjglmFtzoOlff8a-TI-jak3p52l_MXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Maintaining a list of ports is unnecessary since they can be managed
with the device resource framework.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 44 +++++++++---------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 44aa750278100..f3b97bf88d0f9 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -19,7 +19,6 @@
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
-#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -148,14 +147,12 @@
 
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
-	struct list_head	ports;
 	struct mutex		lock;
 	u32			clock_div;
 	u8			fifo_size;
 };
 
 struct fsi_i2c_port {
-	struct list_head	list;
 	struct i2c_adapter	adapter;
 	struct fsi_i2c_master	*master;
 	u16			port;
@@ -327,7 +324,7 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 
 static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	u32 stat;
 
 	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
@@ -337,7 +334,7 @@ static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 
 static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 
 	if (val)
 		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SCL, 0);
@@ -347,7 +344,7 @@ static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
 
 static int fsi_i2c_get_sda(struct i2c_adapter *adap)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	u32 stat;
 
 	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
@@ -357,7 +354,7 @@ static int fsi_i2c_get_sda(struct i2c_adapter *adap)
 
 static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 
 	if (val)
 		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SDA, 0);
@@ -367,7 +364,7 @@ static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
 
 static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	u32 mode;
 	int rc;
 
@@ -381,7 +378,7 @@ static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
 
 static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	u32 mode;
 	int rc;
 
@@ -594,7 +591,7 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			int num)
 {
-	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	unsigned long start_time;
 	struct i2c_msg *msg;
 	int rc;
@@ -679,7 +676,6 @@ static int fsi_i2c_probe(struct device *dev)
 
 	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
-	INIT_LIST_HEAD(&i2c->ports);
 	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
 
 	lbus = fsi_device_local_bus_frequency(i2c->fsi);
@@ -705,38 +701,30 @@ static int fsi_i2c_probe(struct device *dev)
 	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
 	dev_dbg(dev, "I2C master has %d ports\n", ports);
 
-	for (port_no = 0; port_no < ports; port_no++) {
+	port = devm_kzalloc(dev, sizeof(*port) * ports, GFP_KERNEL);
+	for (port_no = 0; port_no < ports; port_no++, port++) {
 		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
 		if (!of_device_is_available(np))
 			continue;
 
-		port = kzalloc(sizeof(*port), GFP_KERNEL);
-		if (!port) {
-			of_node_put(np);
-			break;
-		}
-
 		port->master = i2c;
 		port->port = port_no;
 
+		i2c_set_adapdata(&port->adapter, port);
 		port->adapter.owner = THIS_MODULE;
 		port->adapter.dev.of_node = np;
 		port->adapter.dev.parent = dev;
 		port->adapter.algo = &fsi_i2c_algorithm;
 		port->adapter.bus_recovery_info = &fsi_i2c_bus_recovery_info;
-		port->adapter.algo_data = port;
 
 		snprintf(port->adapter.name, sizeof(port->adapter.name),
 			 "i2c_bus-%u", port_no);
 
-		rc = i2c_add_adapter(&port->adapter);
+		rc = devm_i2c_add_adapter(dev, &port->adapter);
 		if (rc < 0) {
 			dev_err(dev, "Failed to register adapter: %d\n", rc);
-			kfree(port);
 			continue;
 		}
-
-		list_add(&port->list, &i2c->ports);
 	}
 
 	dev_set_drvdata(dev, i2c);
@@ -745,16 +733,6 @@ static int fsi_i2c_probe(struct device *dev)
 
 static int fsi_i2c_remove(struct device *dev)
 {
-	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
-	struct fsi_i2c_port *port;
-	struct fsi_i2c_port *tmp;
-
-	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
-		list_del(&port->list);
-		i2c_del_adapter(&port->adapter);
-		kfree(port);
-	}
-
 	return 0;
 }
 
-- 
2.39.3


