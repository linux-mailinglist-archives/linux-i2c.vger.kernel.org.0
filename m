Return-Path: <linux-i2c+bounces-9576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1708A43EF4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2713A924F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC4D267B9C;
	Tue, 25 Feb 2025 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sSysr4Xe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B3320B7E8
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485477; cv=none; b=M8zir5tu0A46eyLHpX4VenuweNvctN9fYJ2JKkrgK4HNYaZxhfuWVpKKJ+2Picoj3AVTVR89ob1wWWJ5lbGH4QcMwaDc8G9nO8Da2XfMLi9eGN15DuNd0BFCm0HbyHPrzF/Wq8pQAj36djGNC0JhwNzAFl0YKObBKm9OdSxzxlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485477; c=relaxed/simple;
	bh=mupDgIFSB428VsZ0r0Qf+AsjIPxgiJGMc8QIwD0RPb0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=TwbR3EpC8OcpYbZsKba254ttv4jQeMb3TQltZDSZxCNNrPr+hC3iBArS64PthoMs2iizgtNl6Vjd0xxSDGUXOZLxwiku4mlo/U1jXCkk2y1y9FJNItv0QQMGGCbxH0rjf3s9NwGHNLN2cV+4uydcaIEDAw3YG8GSOCVTU9k1Wp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sSysr4Xe; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250225121111epoutp0188f1d16eea1268f816d6b8c362b95bb8~nclCRZpnW0776007760epoutp01E
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:11:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250225121111epoutp0188f1d16eea1268f816d6b8c362b95bb8~nclCRZpnW0776007760epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740485471;
	bh=RcQbcIRPhgbrGNK3mt3Ax8w0cEnsBxoR5jzT9YjIjIY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sSysr4Xe6XXkvuCGVJ4RxOeIlK8e336x9x6MLX5/UmJf/7uL8rRJRBbxFhQOmxe+b
	 5pepSservRPa42+zGa344Cti/LJFwKJDk3rgcx0h96as+W8rWThQ3Fed1EfmlHfhXb
	 QhaSyg9gxcj83ksQr9PK1+JHzg/YOP4bx2xlOpWU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250225121111epcas5p47c4908e94c88acfb74dbcdcef5417044~nclCD_MUp1149311493epcas5p4y;
	Tue, 25 Feb 2025 12:11:11 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z2GfP4m4jz4x9Pw; Tue, 25 Feb
	2025 12:11:09 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	19.8E.19933.C53BDB76; Tue, 25 Feb 2025 21:11:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250225121108epcas5p21761527ebd3ed503904ae7684af06344~nck-YdcUy1274912749epcas5p2w;
	Tue, 25 Feb 2025 12:11:08 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225121108epsmtrp2e5c5da0b405c74d3dbd9aa3ccef555ab~nck-XioJJ0170301703epsmtrp2M;
	Tue, 25 Feb 2025 12:11:08 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-9a-67bdb35c9228
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.0F.23488.C53BDB76; Tue, 25 Feb 2025 21:11:08 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250225121106epsmtip1c2363ee1e5c923b84e0fc2dc8438dc03~nck_IkAmQ0342503425epsmtip1b;
	Tue, 25 Feb 2025 12:11:06 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Subject: [PATCH] i2c-algo-bit: Improve sendbytes() with bus recovery
Date: Tue, 25 Feb 2025 16:58:50 +0530
Message-Id: <20250225112850.10057-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7bCmhm7M5r3pBtdu6Fjc/9rBaHFo81Z2
	i46/XxgtLu+aw2axaOsXdgdWj02rOtk8+rasYvT4vEkugDkq2yYjNTEltUghNS85PyUzL91W
	yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
	I7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITtjzQWRgo+CFWv7zzM2MK7m62Jk
	55AQMJHos+5i5OIQEtjNKPHxzHE2COcTo8Ts/b2MEM43Rom79zazdzFygjUc2/WeBSKxl1Hi
	2q/fUC3NTBJtK2exdjFycLAJGEu0PagEaRARCJH41rOfEcRmFjCTmHn3NAuILSzgInG74QQb
	SDmLgKrEhTnJIGFeAWuJbXdvMUPskpdYveEAM8h4CYF+don5y2YxQiRcJG7tnQplC0u8Or4F
	6jgpic/v9oLNlBDIl1hyNhsinCNxYPkDJgjbXuLAlTksICXMApoS63fpQ1zGJ9H7+wkTRCev
	REebEISpIjGxgwVm9uwfO6AO85Bovd8PtlNIIFZi/c5lzBMYZWYhzFzAyLiKUTK1oDg3PbXY
	tMAoL7UcHivJ+bmbGMHJRstrB+PDBx/0DjEycTAeYpTgYFYS4eXM3JMuxJuSWFmVWpQfX1Sa
	k1p8iNEUGEYTmaVEk/OB6S6vJN7QxNLAxMzMzMTS2MxQSZy3eWdLupBAemJJanZqakFqEUwf
	EwenVANTTdC9nyr3fnIqu6mW9i/8oXlSO8drBnN6/rqpETWzV046Kqt0zoGRT3dtRHhh3M9H
	sns/nPN6tiyo/NOiH0HpV1nnax+fVcL/a0Gibfu6xQq86WaFHSpqK474Lp/6fo5/+fb6S89e
	iTYcj/vidv3sZP4n5z5ZqbjzrnW7XNEqpbnccmXijmyXZqHoiIenF/xay//7ZyFXz8ys13Jl
	8TOTg1+s3+3Ht0cu0un3b9Pn7xoMjW7bRZRoTKmKLaqW/5PyQVJ7s9+MSI3gTjOJT6x8lzpf
	l1fecN2rpb4igLXuWlp77uZ5bUtUpXq175+I6WPaZJ1nLx1U1zs5R3HGorlKp9keCmRnONo8
	T+LnuaDEUpyRaKjFXFScCABNpo3mvwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOJMWRmVeSWpSXmKPExsWy7bCSnG7M5r3pBi3LuS3uf+1gtDi0eSu7
	RcffL4wWl3fNYbNYtPULuwOrx6ZVnWwefVtWMXp83iQXwBzFZZOSmpNZllqkb5fAlbHmgkjB
	R8GKtf3nGRsYV/N1MXJySAiYSBzb9Z6li5GLQ0hgN6PEulfbWCESUhK3/3cyQtjCEiv/PWeH
	KGpkkri7eAGQw8HBJmAs0fagEsQUEQiT+LxJB6ScWcBCYuWWg8wgtrCAi8TthhNsICUsAqoS
	F+Ykg4R5Bawltt29xQwxXV5i9YYDzBMYeRYwMqxilEwtKM5Nz002LDDMSy3XK07MLS7NS9dL
	zs/dxAgOCy2NHYzvvjXpH2Jk4mA8xCjBwawkwsuZuSddiDclsbIqtSg/vqg0J7X4EKM0B4uS
	OO9Kw4h0IYH0xJLU7NTUgtQimCwTB6dUA5NZLy9/S8K/459fX/mhnpuscs31+57L0mu08kz2
	vpx8q+2Fm0e9+qRDC+Rs21jWf7t5/tDUmUqvLp72Zos6GNodfedy5eTL1bfmFYQ0hGZ8Tj3/
	p64lsE5jaaJi0c+/H0L2dxyzLkn4u2Ovxf3pFY4HNvtfO31LP7aQ9+6L3zML3ZfypCXxLzud
	OUcsufuhD29DAquLhO0iricu3y8skF7NXJ1ooCWzK5eZo/HutGL16Qm/Z+aY3f73O4xlitHr
	I87ywiGS0rnLm8qSLScs17k8+dSEBWcfbGew6Xoqf2DBq6xlwUtKRZ07oj4sWMmy88n7eEOt
	ibP0gi61bbty+PX1nKKyF3y8TVn3fZz6ZuQpsRRnJBpqMRcVJwIAPS9uJnoCAAA=
X-CMS-MailID: 20250225121108epcas5p21761527ebd3ed503904ae7684af06344
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225121108epcas5p21761527ebd3ed503904ae7684af06344
References: <CGME20250225121108epcas5p21761527ebd3ed503904ae7684af06344@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Earlier in i2c-algo-bit driver there was no bus recovery logic
which will help to unlock the i2c bus hangs due to non-responsive
slave.

In this patch we are adding recover_bus() logic to handle bus
lockups by toggling SCL 9 times and send stop bit. This helps
release a stuck slave device by forcing it to reset and ensures
proper bus recovery after an arbitration loss.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 34 ++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index eddf25b90ca8..4f74737e070b 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -29,7 +29,7 @@
 #define bit_dbg(level, dev, format, args...) \
 	do {} while (0)
 #endif /* DEBUG */
-
+#define RETRY_PULSE_CNT 9
 /* ----- global variables ---------------------------------------------	*/
 
 static int bit_test;	/* see if the line-setting functions work	*/
@@ -223,6 +223,27 @@ static int i2c_inb(struct i2c_adapter *i2c_adap)
 	return indata;
 }
 
+static void recover_bus(struct i2c_algo_bit_data *adap)
+{
+	int i;
+
+	pr_warn("Attempting I2C bus recovery...\n");
+
+	/* Toggle SCL 9 times to attempt recovery */
+	for (i = 0; i < RETRY_PULSE_CNT; i++) {
+		sclhi(adap);
+		udelay(adap->udelay);
+		scllo(adap);
+		udelay(adap->udelay);
+	}
+
+	/* Generate a STOP condition */
+	i2c_stop(adap);
+	udelay(adap->udelay);
+
+	pr_warn("I2C bus recovery completed.\n");
+}
+
 /*
  * Sanity check for the adapter hardware - check the reaction of
  * the bus lines only if it seems to be idle.
@@ -248,7 +269,16 @@ static int test_bus(struct i2c_adapter *i2c_adap)
 	scl = adap->getscl ? getscl(adap) : 1;
 	if (!scl || !sda) {
 		pr_warn("%s: bus seems to be busy (scl=%d, sda=%d)\n", name, scl, sda);
-		goto bailout;
+		recover_bus(adap);
+
+		/* Recheck bus status after recovery attempt */
+		sda =  adap->getsda ? getsda(adap) : 1;
+		scl =  adap->getscl ? getscl(adap) : 1;
+
+		if (!scl || !sda) {
+			pr_err("%s: bus recovery failed (scl=%d, sda=%d)\n", name, scl, sda);
+			goto bailout;
+		}
 	}
 
 	sdalo(adap);
-- 
2.17.1


