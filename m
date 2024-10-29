Return-Path: <linux-i2c+bounces-7639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A49B3FE3
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 02:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41D82835CA
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 01:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0861885A5;
	Tue, 29 Oct 2024 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vxOpatxD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93C80038;
	Tue, 29 Oct 2024 01:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165909; cv=none; b=nHCxlyd8RBCBLJ4OF8FNyK3StCKAQqkSxBoZw+jErtzothVJzxUDN5LCfvh+Hy+3zvvXJpzN+DHITU+jmzLyw257N2oavu1QTSqFQ/ThDJqxdfs8MNtze/Z5TVlUgFmoUGIUGGe89bD3v3QzWu0PUPKHDaREZ38+53LDlon2+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165909; c=relaxed/simple;
	bh=eCNB5wF2R6P3WB1eKcCUU1ffxNYqoGQG765Zk+6TdVw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmpvkI1pOfVwFgSnPxlMrSEhrKLNDgWafFmwelcNNw3HbRXA3aLuDma4c1waWJGnDO9mVm7d0ucVJoYDgD/wyC9cnJp7MI5O3dapjrGsIVttMIaX25Smocuov4HlTMyHqLodqQJavjLRfqhN5U667hFQxi76RsqmV8b1ItwS8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vxOpatxD; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T0pcPk008321;
	Mon, 28 Oct 2024 21:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PyCyY
	lK1U9iDYZ6CulqicxRvxiYVM9Frem1vhHB+lLo=; b=vxOpatxDyx+zbDue21Q2V
	49p41ezH+DLc4KKi9RlvCMn2Qoa2EvuHLNzmxXRin9YSFs4gxQx5aqnnLghGR/Wx
	ssL20i6XeTU00SPvBx5wgNDJ2uR1pBEI3goj3NmOpYy4YwFV7HTiUnc6neSvo/wh
	g9QPHSCM7p0ln+xUBQRC0Lp6jnvp7vVas7kx51rt1o5k2d/C9RcBwBddi2gMrgMy
	hBnoDOgNQht+k4VR3J8+tvLEn2SJ8evAGj9EJdie65v8RMI2EO+2VhXI4YvjgBQR
	AAO3NqVEbM5IzBneueQCV6Hazsh0YsRq7BakjJnhYZKGjU8gVl46VESCJ+yY3u+M
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gwb2k4u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:38:08 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49T1c7b4018905
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 21:38:07 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 28 Oct
 2024 21:38:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 28 Oct 2024 21:38:07 -0400
Received: from MTINACO-L03.ad.analog.com (MTINACO-L03.ad.analog.com [10.117.223.14])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49T1bgJQ031384;
	Mon, 28 Oct 2024 21:37:59 -0400
From: Mariel Tinaco <Mariel.Tinaco@analog.com>
To: <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare
	<jdelvare@suse.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jonathan
 Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH 2/3] hwmon: (pmbus/ltc7841) add support for LTC7841 - docs
Date: Tue, 29 Oct 2024 09:37:33 +0800
Message-ID: <20241029013734.293024-3-Mariel.Tinaco@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: k5BWO7Gnl1BeJexMba159Z3USET0sdve
X-Proofpoint-GUID: k5BWO7Gnl1BeJexMba159Z3USET0sdve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290011

Add LTC7841 to compatible devices of LTC2978

Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index edf24e5e1e11..651ca4904c66 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 Kernel driver ltc2978
 =====================
 
@@ -117,6 +119,14 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/ltc3889
 
+  * Linear Technology LTC7841
+
+    Prefix: 'ltc7841'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/ltc7841
+
   * Linear Technology LTC7880
 
     Prefix: 'ltc7880'
@@ -290,6 +300,7 @@ in[N]_label		"vout[1-8]".
 			  LTC7880, LTM4644, LTM4675, LTM4676, LTM4677, LTM4678,
 			  LTM4680, LTM4700: N=2-3
 			- LTC3883: N=2
+			- LTC7841: N=2
 
 in[N]_input		Measured output voltage.
 
@@ -420,6 +431,7 @@ curr[N]_label		"iout[1-4]".
 			  LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
 			  LTM4700: N=2-3
 			- LTC3883: N=2
+			- LTC7841: N=2
 
 curr[N]_input		Measured output current.
 
-- 
2.34.1


