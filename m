Return-Path: <linux-i2c+bounces-705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F380B48C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 14:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1341C20B75
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 13:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B46514AA4;
	Sat,  9 Dec 2023 13:15:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BA1AC;
	Sat,  9 Dec 2023 05:15:30 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9DCE024DB83;
	Sat,  9 Dec 2023 21:15:29 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 21:15:29 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 21:15:26 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] i2c: cadence: Add system suspend and resume PM support
Date: Sat, 9 Dec 2023 21:15:16 +0800
Message-ID: <20231209131516.1916550-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Enable device system suspend and resume PM support, and mark the device
state as suspended during system suspend to reject any data transfer.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
Changes since v1:
- Add missing err assignment in cdns_i2c_resume().
---
 drivers/i2c/busses/i2c-cadence.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-ca=
dence.c
index de3f58b60dce..4bb7d6756947 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1176,6 +1176,18 @@ static int __maybe_unused cdns_i2c_runtime_suspend=
(struct device *dev)
 	return 0;
 }
=20
+static int __maybe_unused cdns_i2c_suspend(struct device *dev)
+{
+	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&xi2c->adap);
+
+	if (!pm_runtime_status_suspended(dev))
+		return cdns_i2c_runtime_suspend(dev);
+
+	return 0;
+}
+
 /**
  * cdns_i2c_init -  Controller initialisation
  * @id:		Device private data structure
@@ -1219,7 +1231,28 @@ static int __maybe_unused cdns_i2c_runtime_resume(=
struct device *dev)
 	return 0;
 }
=20
+static int __maybe_unused cdns_i2c_resume(struct device *dev)
+{
+	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
+	int err;
+
+	err =3D cdns_i2c_runtime_resume(dev);
+	if (err)
+		return err;
+
+	if (pm_runtime_status_suspended(dev)) {
+		err =3D cdns_i2c_runtime_suspend(dev);
+		if (err)
+			return err;
+	}
+
+	i2c_mark_adapter_resumed(&xi2c->adap);
+
+	return 0;
+}
+
 static const struct dev_pm_ops cdns_i2c_dev_pm_ops =3D {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_i2c_suspend, cdns_i2c_resume)
 	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
 			   cdns_i2c_runtime_resume, NULL)
 };
--=20
2.25.1


