Return-Path: <linux-i2c+bounces-3858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC58FD8A0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E5161C224B5
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE82116B75B;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="I5DLkfUE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1416192D;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622622; cv=none; b=gOki69COySTJxFIFxQBCEkjDir3lqUXITgxip2fgii3TF6J3dQjokLbAzHEt+LLIdYhqjnEU2zYK8qapP95XczOc5AFvASeBJnPl4atngRhQCpeOUPH9hBHhIzHnzKEp+HmQfQYCzd866kR6lgDu8u+KTn+Omwp/lFjToWR1Rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622622; c=relaxed/simple;
	bh=p7IE1f7B3E4HXLYKDsiggW4zvHAZ9T9oqWSSmLtsBtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BfczUL/0S8G57huVg6N1ToyRaOOuu2rdCX5fNiONZ1zIq+VgE1OcXHtDVnFCZ4mXAPJaDDPoNIqA2VbsjpfbDpBIw42oit3HoHrav1Ttyz/BQb7GyAkCAzJpSxtVWz1C91zZdVBOT798EEAV/xglckp0Y0otjvg+NIKa70fAZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=I5DLkfUE; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KvCZp013933;
	Wed, 5 Jun 2024 21:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=6pwGrpGa/9FUM1RJLI4c4OWS/mHbmuo48TsghubX0+s=;
 b=I5DLkfUE4u5IcJHzxz9ruTvrBKV8DpAPJ0I4VvwEOQFmUjNiFhOVNeLu6EvHSM4PGQse
 TZaMneqVG+dGNpOQHRur+yw5taBugkeIDRlE98Dlrei/uB6Wp+WOP1ToRtNGVcvTDhXZ
 wCeHNxcmHQfrEHk28tuh8hkXLntj2isM+mZIAPbyDfVA0dUHqzl6+a0hWwjMyMzfG5QD
 CR35GxWPK97aaqPjn+UfhXq1K32Ggxf1NXLvO6n8H1xvbo///L6CwXNKg9CoQefWYZho
 JXnzzg9H4h32hZITahnmFuVyxSIGCewxAuTTpB5ffdZ5cyHya87FlrzsRp4qts9kkMt0 BA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygp81uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JVcNJ031129;
	Wed, 5 Jun 2024 21:23:25 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNMMr63373712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25F5158069;
	Wed,  5 Jun 2024 21:23:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCCDA58063;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 29/40] i2c: fsi: Remove list structure of ports
Date: Wed,  5 Jun 2024 16:23:01 -0500
Message-Id: <20240605212312.349188-30-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bZdKl0u6-FzW7c0GBFM5rWEosqz9SKV-
X-Proofpoint-ORIG-GUID: bZdKl0u6-FzW7c0GBFM5rWEosqz9SKV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


