Return-Path: <linux-i2c+bounces-2007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F9867DBC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25BC2B2C709
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B4137C47;
	Mon, 26 Feb 2024 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Qe30t4RZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C03136981;
	Mon, 26 Feb 2024 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966445; cv=none; b=fLBeijiZz83mERMf29JIib54NXtb6ElE7cFQK726sPkUyucw+GFQPSQ9xxvP3Jvm7AkGtrfL68CFt1diJTGS3N9OrZNNW4anni4PMKnRAg0t/7Du1QvhANhX9PrH4R61z6Ml86qSej8IPXy2s5eHiLusU/Dk8sGIxzwwDxGGwxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966445; c=relaxed/simple;
	bh=BmpHIcdLad4je9edWwtINpVsWPUVd4TCH6j5XSMsz9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6GW6X5bkb0WEJ4hoBroUrtLByj2ZpekijsTWzRr9TtCaKYqa0vsiOCoWt0pBavDII1Zp7IudluyqppE+YeBhvrXBjbPucgrrWJwuFaVyL7gmjPa6auYyO/UkIrbi2bVLZPN7UTwSYwVMH/zWDNDqgCOoV2HAkikEc8Fm9Mz/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Qe30t4RZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QF2jEb021800;
	Mon, 26 Feb 2024 16:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=njZMmA5i9z9+KJhOIDW6auHi8a7ZavWPmGAbuJxdb8I=;
 b=Qe30t4RZTgn7Gbc1D1HLUj0HxljJjxsTLcdURZcEdvtYkkK3z6UBV6b5dqx+ucDbMn0b
 skdcgocXW5A9JEbAf+Ydelc/GLEqqOoncJSrz3JTntiIWf+XVvidXO1Db6pVIG0sw0dy
 ThG6v76ZKgAnq9Pssyud34UpGHoTIUEWH7aMH1uTUr4oWzW0UVioHjFqm3X3fqLbtovk
 /iBwT95QY0KNlryF3Ldk09kIofyed4fN+a6UGWzgehdfGyjjazD1I6ldB95L80dpNV1g
 o8bj2yfA5iLQnwbqhExk0BTNA9sFbEL8g1tD4DF9wcyVq7OF6C+FgweraKXZWcVBuoJb LQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bkkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:49 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFvbie012371;
	Mon, 26 Feb 2024 16:53:48 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg21xxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:48 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrjkG29622572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:47 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4861C5805F;
	Mon, 26 Feb 2024 16:53:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90ABA58043;
	Mon, 26 Feb 2024 16:53:44 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 28/31] i2c: fsi: Remove list structure of ports
Date: Mon, 26 Feb 2024 10:53:18 -0600
Message-Id: <20240226165321.91976-29-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xZ5uEUdjI1YWTXrYDZb7tgB-4KZxS1SD
X-Proofpoint-GUID: xZ5uEUdjI1YWTXrYDZb7tgB-4KZxS1SD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

Maintaining a list of ports is unnecessary since they can be managed
with the device resource framework.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 44 +++++++++---------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index f237e76d29e6..096dc7e2369f 100644
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
@@ -706,38 +702,30 @@ static int fsi_i2c_probe(struct device *dev)
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
@@ -746,16 +734,6 @@ static int fsi_i2c_probe(struct device *dev)
 
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


