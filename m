Return-Path: <linux-i2c+bounces-3721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A38D5B63
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B9E01C215C9
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 07:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A71B81AAB;
	Fri, 31 May 2024 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HyAPpLHZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2060.outbound.protection.outlook.com [40.92.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02881734;
	Fri, 31 May 2024 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140401; cv=fail; b=lPpvATQPBYstpU3I9ghQBQ+K2QENSBSl6PvEKJs1A3eEEpB+Kp0l6QLLmyLMhzowF5rsJ0uzdedl9uSWJIn0txHcdEKk+AWGvDqM8QHhubIW/folGgUW6zCeMZgeK8g+xrOLccSONmSOB2Db4hFGG9DLaZp8EvM/PsvSh2R/AXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140401; c=relaxed/simple;
	bh=X1LkmhoJ/L6xgJDDmT6xyUVj8mGbwCxH2MOdKM3fMPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QW6nD2h9Yb5YKBz6iOgsYuE+FrLdnWlVVN1cyWSw7qzxjDjiyiT1mbZ3jfZsNTQHCZUEVBEbPhXCv/6gerH08+NFZ3/l8j+bjoZoR+QJQdinEUyuGuCk7ZRXU8kkZZa+W0+hMS0u5jNwD9czA969WL+wuD04JA/kLkUBPiKDMtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HyAPpLHZ; arc=fail smtp.client-ip=40.92.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYd9B2lhKGJzF6ZrW5kevUTOkDoyw6uGwOnhLl5w1SBfWoZFiObz63iKs0UNo7ncwj2g/AXgST4L/25gwUXZh4aVjN2uINZyQbQptwxKPxlMAAgH4dnoALlhWorjEFef/zc5JVmlZ6T8YvZr5i9tC9Np69QS+R9CgoG1jFPQRS/XqgHnnr/LfEO2DGJywG4cLYO59f8VTLjx9w3afCC0duDkXzo5etXKhBKYNz9LuhdWsul4Sqz2jQ+BXOKC/FK4y6owac3caPmM1vb2XTCK00P5uvyA2QgqCnhxG3ZH80EfiSp6akQbyrKbxmforQJSwa6P7ofYbByCr5BiEavHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QRZxqP0jYxJa22bM+2iZ1cae2M3APWYUr+l0t+1kyo=;
 b=PhyTu4NAG/hQb7MI09FXFpbpCwOgsdFg+fV8HoKtmc62joxsjWl97XxvSyFusGyAo+Wn6OZEQKK00M/uh+SiPBOM9d7/76k3lEbQFcffbbXSRiCRVxJMJ3tldQ6r9Q+DQfWK1n0yyd285tH+zDztG2+T29ZfLmTbKB7dnsKJS4hU8z24dRRvd02MEJfgfNaX51r/RPvbdIJMUkgV3E0tFikxNgKhhduFvyP5yJ/4bX/elTdrVG21DHHM6334GES62Xb5bUGFEDD/SgzBv8HPZrxVxfDKyEGc+qtDavJAPdiUK0PAAjUgDKjdhppxlF26pQFzFqwKDCS/rMFXyO1xfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QRZxqP0jYxJa22bM+2iZ1cae2M3APWYUr+l0t+1kyo=;
 b=HyAPpLHZ0HqkHpRqgsjtJIsqFt8kSofFuUj0CSradH/rYndQCVxlf8xlUHgkur/0GpnFel61ETR9OCp9ws371ysnPjqRBSU12FJjDXTAkWUgSHmt9QvkD2mQKJi0Mbe6u9Bk015M8zZrYHz/kCWSWEDE8qef4cPHNYcJUu3O9XbzR4RR3yVxLst4IkOe7QHN7nZbj1yH8Iexl3iHzvGAnf+/Z4OAxIcY3ZOgVRdWELHl4nSLsZqFkyS+Xo+4HECLrrGpWIjXjCQ+J54Y85PeMYTEJDCiFlvhCY77FKex1JsuxFZVBNPpax4AR2cInqF7zgVi97lM1sbXrSBXBIV7kQ==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TYSPR04MB8003.apcprd04.prod.outlook.com (2603:1096:405:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 07:26:34 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7611.025; Fri, 31 May 2024
 07:26:34 +0000
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
	luca.ceresoli@bootlin.com,
	chou.cosmo@gmail.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [v3,2/2] dt-bindings: hwmon: Add mps mp2891
Date: Fri, 31 May 2024 15:26:02 +0800
Message-ID:
 <SEYPR04MB64822856CA4E461787C3593BFAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531072602.4806-1-noahwang.wang@outlook.com>
References: <20240531072602.4806-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [2bi1LopZLyHsqoP+C5j9UHF5cTkQpmMZ]
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240531072602.4806-2-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TYSPR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b26de9-2ee8-4aa0-34fc-08dc8142fffd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	Kt56y1ID3ZAqtm1ZsKNZ0wogEsWNrw2fmNGQthxHmaQtlgoRZ2YN9FOKXTkTqSgNKEfJBzxzpRgLrJ3TaK1jhFOtx5LOAb4SOKWbS8FrB/tTJI/c+8DYaX8Wx9wVI9aiW2sgFNvuAG/N2kdMBHXPGLBfrDJjbyCqpdrGKd0xY2S2RodDZanK0I/XbcHXPMveIqzjluN1RIhEZWbjw+AIl3v6A5Pm7N0velaCIl1oqKKNpgy87Qmeoqs3AtCwgDsM9UN8F8SMl5mXMHhlx6lQ4/T3D+hswWg0198uGQEhndaB+MkYGcfRWfJAJogMbgsZU20KxQ/52OwUWJBDAmRhLayLNTs2ygMCSYjg6m3RzOXAqUl9Y8REx4wVFlg6Pbg5kgos97F5LQyjZd8Gpsbwm/aTjK+7eC0p+Tn1ifmZhkIwgdAbGjMTdIDQ+K+14rAg0XUHKWL3+q9OCTjMvrAEqNwthFx51tHhPS+lYZpIETRi7C2yjKzD1GlRhlAGbxDDt97xS3IRLvydBKTiv4p1XkRnMkgVFuQH04cX3UhFkU5otxPb94vLgEkxWQmnJbMUUEkCh8u0JGfO88rR7lDFD2KMGqJFwsI8nOgc3VBVx/FwdVIwUwftaMmM2ji1HWzu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JyX29UaiCvFo+Z/pk/im3ImQjlhG/A8Ncz3Z7NeCHu2Bd9uarcf+yEaF+3Op?=
 =?us-ascii?Q?KWXjcYEioysyP1WelO0Ra5mT5eMkN2H3P3Sj0Xfyl3IldD1mHL1PBsUyRvND?=
 =?us-ascii?Q?IVylhdorzS6lGiCitGpJ16pkcGWh82vtpA63JojzuoknnB4D1YSrmFrHL38F?=
 =?us-ascii?Q?q1TerMcK/Z3AhF7lGDzycIsRJoLNPytfBc0vJhcQoeYnQ2sa5gtJPq/wi4sf?=
 =?us-ascii?Q?pBzCPXnJKlg9FwOYIplTtCA+F7GuNuZ5Ju2Yl1NAABR0lY8kPGWyQKK+xIkB?=
 =?us-ascii?Q?BgJ+ggj90TclTHBFNUfenmpwQc/jKTTPNonpDDbh7QqjWUCPYRdYka6EjlMj?=
 =?us-ascii?Q?lnhJCCOiQlVOA6ywKwfCue+CTh7OwitKVLvLrA+oRFcWV5ges2IDLNdQDak3?=
 =?us-ascii?Q?uVTsPERErVdNt63PSHRu7mvoUDP73MAyrJ3gYfvzTKakoJiFJmLP8e9nG+cJ?=
 =?us-ascii?Q?Ox3CGvxzY5b7weoiS8eEZFPWUN6eIxYyCmjzr/i2n7Za0zOaAN982xPMfRFM?=
 =?us-ascii?Q?B2L+1IpJuiAUegZJtigukElSn1nlyRUosyufPeCZQDqTCsAvKl1eRbNXJPag?=
 =?us-ascii?Q?VZTfIhLYlfNjGcEeFWsQnUqBZ8UC9WTQk5/aZuIMS85lSVjL3U+nFnv8Kltx?=
 =?us-ascii?Q?c2P8d/oWp65E3VAEeMmwtwDcplaegTqgCAjZe9FfkmbWOZNlHbDn+Hphp8pH?=
 =?us-ascii?Q?OBf3vBBx04Yaw9GVjoPmwZvBOidBbf1RdbU9a8Dh4ZEv96REaEEeknk+5bMv?=
 =?us-ascii?Q?tvQ8AdRPpOAA5p0X9v+yKdLhnipY1NssJtIi837RIgB3fw3qQjPadE4ERxwB?=
 =?us-ascii?Q?WG3wVxHDYDXerRsU/Gtc7L2aBgbGSkLvIKpKIlogmGxZaNTtxtEOluC0zIrw?=
 =?us-ascii?Q?PZJuicwhsO+IzdAgqyb9pHrD1dWIzs1tQwOuJiv93TDwM3XNH58I2NkNzOWH?=
 =?us-ascii?Q?PEjpj+OIj8YJRRmX2kCnA7yThVbMmQ6c5eTPXrVIlaFfpS0hZs9dMMwabVEV?=
 =?us-ascii?Q?fHmwuHGNs1MI4ULCPNSOdYEUxXDxrcGrZdt+0pKBR7jmuTU2r3jcAvcSvg1y?=
 =?us-ascii?Q?BcGNF0Sq1jbhxk1ojzkCEBlPXRN4gyHTpYXs+GaPqpKYbxl9vf4H6r4OVEYl?=
 =?us-ascii?Q?n/vH8YTZpunzHqPAfVz3JU2sGqI4GEbO1w09XK0eFIGrfqydycEh5ybK726O?=
 =?us-ascii?Q?Nrqe0V/EYNpiPbbayylVAwLB8B10TemixcJe0HAXFYrvir0wTDYiz3ZRjgzO?=
 =?us-ascii?Q?eJD7vHQjWDIi3mHAKojB?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b26de9-2ee8-4aa0-34fc-08dc8142fffd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 07:26:34.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8003

Add support for mps mp2891 controller

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v2 -> v3:
    move mp2891 dt-bindings to trivial devices

v1 -> v2:
    add mp2891 dt-bindings

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 025d50454f88..dabbc4cd089e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -290,6 +290,8 @@ properties:
           - mps,mp2973
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
+            # Monolithic Power Systems Inc. multi-phase controller mp2891
+          - mps,mp2891
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-- 
2.25.1


