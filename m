Return-Path: <linux-i2c+bounces-3898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FF8FFEC3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 468E41C21DFB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 09:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3390215D5CA;
	Fri,  7 Jun 2024 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZrrAACED"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2100.outbound.protection.outlook.com [40.92.52.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB815CD7D;
	Fri,  7 Jun 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751177; cv=fail; b=YRZveD/CZ8n5jVP9leZcLas8qjPR/vmJPJKIicuPbTQuU4mGKWSabBn7xmtwY0AY9MtR3d97LmXZjwhCsi3r7RVvIE19tbOMEH4Sg+MfKzo+yR99LhM/vGS8RzOzG7OibWY2dntuoRTglIXwecJYeHYEBFPHYqkMwX/MxLhuM3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751177; c=relaxed/simple;
	bh=dS3V2Sx77YmFci0TBSVxLftdD6U3tKQwffAvRi4nb+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pt+y8oQCq8ZiPbEDcXeVsEIpJrgtnAyr5AFj8VELW1fxe/FtVD2YAWlE5LCSIWTbyx7NRbbWONW2slP8C99v4L4VCiCDSvSkjDFI5+JbRc2ZifHkf7v818S+c/dW7VpohcvZBOUrvspjrkHJJNagVH8vP9B2o19b6N/gC7los2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZrrAACED; arc=fail smtp.client-ip=40.92.52.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA4/XAHUtjwt5ZvDVhTOV0l3QNuAdjbPbkBw8Z129AV0L20SdOi9XKxGeJBj0fQDUNymWOFlLeQ3zj3XfMnGi3CaFOzfmq9KzOHC1FV8K67+AeGtUUbgYUxHRZnK2hJxi8UckNiLoPU4YvJRorDmSsvJXxDMiqqQAaGpBS5dfQrcbILZbZ+MwY4HhDJgsvk6af31OuGEnbvEYWh/62HOtmFnt0iz3gyWO7hpoFM4gYrFi1Jp2Yg9HLWqaX55ohOzKzesE9Jqt/iKEsrguOik2gdtlLwpjP7VqquN2TJ/2dEN9cU3bFmWE/vfNfGi3Qg784CxOHK1icFVtV7cztP4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9ShG5Np4+f1P0rom6VgvbeAxpOVsDULLZXpLWjAcDk=;
 b=Wr0U38xyFo7rK7KYFFtLTpLBIdYXxfOCQbHpS/KQQ3HPS6Eb0NwzdGXAMQJ3HPumNgqXyzWlEjVvepW3Pu69TPevH8bx8dCJVo1vJwfroao0UUEoQ7PXPVhbxE4gbscPSp6UcU8YKaX/EJ8wlXKp+LjEJ4H5HTjiW5ywnjIgbP7lQ9JZYqgmBt5KuUc6Cy0TLFARcNhA8JnbAXQ2omhA6kQep4C9Eg3zy8Dxn111lN/Ew5LcfYKGI+LgJ9NshhQ71iSkrKJ9Hfjqyte7+0MXejmEIAxUsxLaVvp1Yp7zqcjzN2+TqLcmmQYrWmNomEp0IeKTQc3+7mWEYacuW/6YAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9ShG5Np4+f1P0rom6VgvbeAxpOVsDULLZXpLWjAcDk=;
 b=ZrrAACEDvFkRHIiO4FDLREfdhO4gdLfP1wuCkflqt7wbpAL5a5ft3yX8Y/zmvEkyubCyXsLy6PDo/8hxgg0mkblDHz7oc/rQWx5kOENR+bDOXV1RpnXwfSWyqdnZVLtA1FcNtVRa+D3Ie8UUd1+SW6U5GEJg7rBFnZom93yoFxEyBUbtD80uIitMl0/WTxrFsuykXdfXjh/mUx5adm+bcqEZDdxeE/csH327C2X9bne5lGlcBKAq0Vuxsjt7jJ0xrN2WZewJO5eTi9lUywf6v6PNJVAraO3uT6We8knaKtud2Z2Iykkj6xI64L+SrqWlxcvfiRQPmECWOsYvk0bk8w==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by SEZPR04MB8048.apcprd04.prod.outlook.com (2603:1096:101:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 09:06:08 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:06:08 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	jdelvare@suse.com
Cc: corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH 1/4] dt-bindings: hwmon: Add MPS mp2993
Date: Fri,  7 Jun 2024 17:05:41 +0800
Message-ID:
 <SEYPR04MB648268219E1785488578965DFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607090544.466833-1-noahwang.wang@outlook.com>
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [aAFYkq7+DSO906wtiUELYzErskYVXTix]
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240607090544.466833-2-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|SEZPR04MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a94883-a191-47ce-f099-08dc86d1118a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	q0zsbNmU6+PRKSP8+HwX6FbQByzjOjzUQqj1Q1jXXeSksr1s/jBvpR82iIhrWDGynaikdmGFJQ6/d8YRHpfFoNtsP8VAsC+Bql3dWmNt88dlTlWN/9FUqJ/c/qWQYyTTw6c936MV5YwVflv1YS6ghxcLX2DmUVaXk+qaBZBKJP382LRDLzom+xco/P3vPI//E4BbLLZYhie/Y6WFV3fiAwQn89l5S9oLg18rKRgZyALXs+ktgUv2mXPsbk27E+cBMx+w1P7/sNSYIZ+a+/k8EqanocVZeDQTk8phJya8FXk+ly/IS2yrozr08s1DTubzrtN+nQm68M/U5/fdte3bt8iai9e4lqNkSr4lGCMWD0ia06/vVDsDTzex/gqXjbxb/XPN4zD7n69VJ6Ra/5gaAMPuG4kVmgk1bVDgpRRvwDcTe3R1BTzHG5JXH4Fte+c2cT4KoFVMviGZoVEr+jeTnlSVPa26ATcgOaocDIIsI4d2xptJz1Dy3mqQ9mGvjpUHhPEytfylxaUQroEMQ0rV40rpH4OrTBTiaFbECchmOB6PzKA2sCvNptYrCFv7n8qq3fADbBpzbBQ4zq5nykEpzPbmZkZTFtvKa5ihCq8gF8gZoSTHVt683NihKuJKtHOI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4J0dWaCmeRphf5LLAqLPqS4CLxRzvqWDk4iAwQRF7yt7UtAIr0pWAKEE05R?=
 =?us-ascii?Q?gF2AAlX2dGv/XMHvT7kwgsZSEoCzZUJNvBxpLo88DWioDKhHVsewzfm3QIVe?=
 =?us-ascii?Q?RO3RCdEOHJSmA9OpgYuz7W+zNRlYYX3D8sIgnTFjsHplwvD/3AMnYrD3JLFD?=
 =?us-ascii?Q?dHVF2m3FsaFHnl3o2/UIvgDShrWVoDkfj6RWOiuGvIhi+CjsPUEDaww66vDv?=
 =?us-ascii?Q?9l+YEDe+1i7WMF/YuxFoV1GQNpLgfyDlZqaQ8Kl3n+s7YYBG4fbbV5xUCYKv?=
 =?us-ascii?Q?WAQsWlUPeMyUQCYP1wXHVWoCr0ZVhkBRp3SPTZKu7ERHhbmAtoFeTU9iChXm?=
 =?us-ascii?Q?J48urz/+qIbz4PAy9kPHbyAV6qJsoyA2dCmFbgIKJRqIt9ONPBhBTqs6ner8?=
 =?us-ascii?Q?flxQwfkzvA2RsYxWvywM+bi7Nxhr9y9BPbkQemlLdb5LyMKUk+1gVe1Yxgaa?=
 =?us-ascii?Q?L80XL9/AMV5QIRSY2ctjTqOqpOUj/aFOTdeNIx2ur8w+c9IArP9G+0rit6Vg?=
 =?us-ascii?Q?NsiOgaNGa/X3w967BkMblwrT21S6ehox7MJKbUZSZyHQ8CvQpJRXrX4vzUe4?=
 =?us-ascii?Q?5JRyLtlzVpSCbyYB1oFL1heTCMUT2DpDnCUr15/ovict47ozHN/I62hgSJJ+?=
 =?us-ascii?Q?VAimPJlxJXBaeryqc3vb2lsQ1IH/BXDv3DZNarwbLKcr1Nr5kQZbBBbBMWgt?=
 =?us-ascii?Q?aAME4db3+vuSVY/zPoCFFD1DHDVTi2zGM3sXFhOveaBSUGxFOL2prMCvhvMz?=
 =?us-ascii?Q?z2Iu7nQ2g+ok/yHLsMhVuTu6b5sge8hmiTOQe3zU1FCe3HABdcoL62GyK05H?=
 =?us-ascii?Q?NZY6pPYzHaSD2OE0bqmm0U/FZNrsO9VpS5JZ4B0D5DGp56Nk4oPQtAWus7ha?=
 =?us-ascii?Q?zsMdOZAtJ94OGxC3upAWWkxbYmS2PryOfNbzU9XueaGQYegPH3BoaBJdmHZP?=
 =?us-ascii?Q?GfLqppCdXZ6TqeQWbtlJz0IKIvwjXY23kpTdLhOrhhMpagvIh8N67Jy4H/5G?=
 =?us-ascii?Q?ZO45TQUowDp7Njl9Ycs3zAwy+upegw/zio72KGPYM2nObVrmEnjmZAYt3rNl?=
 =?us-ascii?Q?UdHPz0exBORcugLISYPCJfCbRqRKQ5iZ7HYM0Sgcyx0JzES0vgO3K4/VHnl7?=
 =?us-ascii?Q?jONqSXoY2+2nFFo2b1n/ufagpR+mGN/WVZ5+R9isbJXkYA9LpP6Jd5LTNSu2?=
 =?us-ascii?Q?6/+wIdQxqxziGusOcbtSO/51+CQaJUdsYAEl+TGduVPYQoC82ogfcSwa4dGY?=
 =?us-ascii?Q?F4d42Pa/U9J2IINrxTfv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a94883-a191-47ce-f099-08dc86d1118a
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:06:08.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8048

Add support for MPS mp2993 controller

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..01cc431eb59e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -292,6 +292,8 @@ properties:
           - mps,mp2973
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
+            # Monolithic Power Systems Inc. multi-phase controller mp2993
+          - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-- 
2.25.1


