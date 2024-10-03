Return-Path: <linux-i2c+bounces-7202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6000B98EDCA
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 13:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2D4D1F23C9E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 11:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98664155324;
	Thu,  3 Oct 2024 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="a9vKUF5r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2105.outbound.protection.outlook.com [40.107.100.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0897155342;
	Thu,  3 Oct 2024 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954159; cv=fail; b=gg0yBU1mO+TdDbgPji7ispwCSb1vNYrs46LM2axxKUlbPX2YFWGPkgZKUn12LKsR4E5es8q33YlMvn1wg8PHq8lyjkp81b6qXco2MDvNWrMcsVWtNrQV4pjZXkGDJyUWa7ZhJfFY+txrteIaYDBtHpsQPnaFMGBgdNr51nWuJz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954159; c=relaxed/simple;
	bh=M8D7WdydNQ9zs4G4SWm29JwnxngGwePt/KASXihFXqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/uYErz6WTLctwI9xDz/oaJxYiuQQL1lE/WFVD1qDsvCtZTNwaLvoILupFtB4UwAhzyL9NiIwowCStIKWVPKOfMxA+9tngZYTW+atK3GKAY19vxlZmKeOOvB0vnObFAmak3VzoNzo7xgTM0z0+5AxqAiXBOWrbhKSRiuWldyUSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=a9vKUF5r; arc=fail smtp.client-ip=40.107.100.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYXyAxdAHvqhIencChZvGl2iF9+1UPBGH1R2xdb6qYtF4PcV0AS3lJpBmuMHviKR1Eg8yyXZUFFEwltbijwnyMRcwZiqkIO8slmLrRuhOYIUK7p/BNZlkcCo/8OVwyH0XSmuQ89ALc3tguTmIyP/hW2uFBRTehK/s+e/nffflFTTB/6xhwP/2JP7vOlUc3vLmMS2ikxvqqd3HW04viXaqWiZtOjBCc1EQqSf/h4mj6AkKcCuUYvsU/WG5P9Zs5nDOZaRPFHH/yYFkKHigfmgzlQkKME6aVOQpjVW1SsbFa78zXFbwsJ9qlwFioGlJGX9606DXKl8WH+OPJslpVz5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQYlP5EfkMLEIrvEwgphSqp80DABvCmc1gXKOD2RkV4=;
 b=QBqKkNRcdn6tzCeBaPFnVA/FYbrnHlwoQf81Vb2iIRrwwBtbA8N6iFokkp82Vf/UMClZCIKqE18vTxZ5wLDdBpZ62rJPBnoRAWdg3ABDv9xjClWAc+A2zg2wgiicXnSjGN/NTmhNb61XO+q9AQF8n6mAsGxE6AmDEd/npRgNcWK4MfYLFRwRveaT7RFwD75/IdgZT5XI8BGvVRUWW3b03RFPPBBnuxndKJSJB/Bn2PR5Xmowq/ut2sTLf1hhTstOjbBgDVjVmLHo1khQ+R9t5mCwLjgWNC4TBXu+kdV6+QuuFNnJPLUb7uY06UA4gpEN2NV9uf6wzRRfBhSypKVJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQYlP5EfkMLEIrvEwgphSqp80DABvCmc1gXKOD2RkV4=;
 b=a9vKUF5rbfSDJtZ5yfUNL6x4tQho+AG6i64Iz5dCWJi+5+mxCRfFrKniekRIjEcwEcfOZWt+GCVa4Ma7MiUu5oF3ypq0YZsY3q/fQNg9lCLZRoNv1I0YLYPv+ZGg0LoD2UbguHcIUrnoSH2Z+ftU1MAQJN9eA6RqdovYAd2FBsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by BL0PR14MB3714.namprd14.prod.outlook.com (2603:10b6:208:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 11:15:56 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:15:56 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Morgan Chang <morgan.chang@kneron.us>,
	mvp.kutali@gmail.com,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH v4 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk freq optimized
Date: Thu,  3 Oct 2024 19:15:23 +0800
Message-ID: <20241003111525.779410-2-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003111525.779410-1-michael.wu@kneron.us>
References: <20241003111525.779410-1-michael.wu@kneron.us>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::11) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|BL0PR14MB3714:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ebb136-85a0-449e-8fb7-08dce39cc084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ixUe2iybS5x1V5w8gPADFKAE+gcOvPJpLDy1XwgM/peO+YI4P5jbe8slaPcP?=
 =?us-ascii?Q?xn9GGsPIBjyjFvdFxLT4GFQq4OUGtk9pkSTfLxmwLvde/+VnZGDrghWb0BbT?=
 =?us-ascii?Q?Hmbh1DXydezPUGXNMqBmLKkTg0Q/sYbPNpIh4BZxL3MTt+wzRT0gfY7nS/oO?=
 =?us-ascii?Q?wNnrPY5oKGyZv9yygCAWkVHz/cSw6+uo2RTs0/ywg6F1ozFf3tUMGuOp0OZI?=
 =?us-ascii?Q?N18EGWzzDWf5Vk3RQbscvgfOHRBNGi4wn6hyrg+FzF2z7fWE6LunRB7OEpDs?=
 =?us-ascii?Q?UMi2YGDu6pomS9wS6NVjOUC+A1+/OtIf2CT3RaAfyxc0duMlChJqi0Edxr4F?=
 =?us-ascii?Q?0sjM3kYRJSHm9NA96O0HLopc/CXfj4CN+AaZwAIp72qIpL2uYq1X3Ufsbk53?=
 =?us-ascii?Q?h3WT6nDANbLKeh1QDGi1BvnU2noyiQwPOAVCqS8DCASoTrDMPD5mSZ4P8EX9?=
 =?us-ascii?Q?3Tbe7y63aumU8PZB18NT/Hhn9aAh03DOq0puLySFyIn4rEWI7Mchm6S1Iz+E?=
 =?us-ascii?Q?UGyyrGMQeF1UCcEVo7Xm72be2VetOPzhAF9g91XeF8mxZpGSQqFOWtslH78q?=
 =?us-ascii?Q?OMQyx5/S44rfST1Z9VA5VK2Yjhl4ACu8CKWYMMsdHz5jV/sCKBMPfnrEIG4v?=
 =?us-ascii?Q?fgCw1QUnM/3Fb7lWoZedqfRbquD78hiA735O9fE0R2kYCtY59a23w1O6/0qx?=
 =?us-ascii?Q?3d3Dl+l289LArtG4YoHPFLe382A51cKG2dQrZrU5HrBntRE/0DZbLZRqPszV?=
 =?us-ascii?Q?nLRYnIZO7x0QltptdaQEjAVuLQZ+yUrTQzIn8IWHRPwLesBJXh0Pah+tRIfm?=
 =?us-ascii?Q?foC+zevCVkJm/UiyzAMD9T2WCrwmTMF1gaYlou1/qbNUbW3rA59eWtgFq73f?=
 =?us-ascii?Q?m7neE/G2Uv3r2AO3l3CP6A6CRuseut5zDTtf9P6T7yKmopzekyzpdhpFQXfl?=
 =?us-ascii?Q?3sRnJ6Qj89ycfNaSUpcnr//CTJxvudM86MJr2ud3LRobn01J/qGI9j4lRSix?=
 =?us-ascii?Q?AK+kF1oRgGqXFy1Vnf94qwieUrTAs2+C8yfncnvhpUpFF3cvxG6tWHyIa9ea?=
 =?us-ascii?Q?++LXL2kZHhANNzpdslf0qwS7AlgQ7H06VpL8erefI2HEGcyQQG4C07coSodc?=
 =?us-ascii?Q?qDPbXWowNHD1xU2p2o30/ui9xd2HaJInfPLPjoAXXA3QckXjlvqNiupWFh31?=
 =?us-ascii?Q?ApJtZHXatQmuX9cPXM5IlgczY0CxcX5r+3qo6GD3S1iUL6JuzWIZgZNNJWoC?=
 =?us-ascii?Q?yC8UB5s1cGyzbYuFBgHoyd8YU8CRd5X9sNKXVLeGrYBbbYtiNBEm7lYC46UQ?=
 =?us-ascii?Q?LN517qJLO7mG9Ie0zDq8jYl9+3XMugIhbaVIouuCnSLqX94ssX7eoIC6nMuc?=
 =?us-ascii?Q?5ekUijJ7T+GqCyjKv82OsnvSHaMW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUDSiNG7mSeSFpn4OnOlt+JYdtU45MYPDK2vw9zvMpHE/ey+7bfgCc1Uugdi?=
 =?us-ascii?Q?f2bcsc5gF/GkR0MX5IDLjeNbSECF+PZ8MJ9pKImNklGp8epQXr0yd1A55Ugy?=
 =?us-ascii?Q?FCh3q8gmWCLx2NWmna2dEK90gWSoIX65U8Fa3OPMvgRSGa3a3aZGsyT0A4r1?=
 =?us-ascii?Q?ns2IgHonkOlDy+H3nGLbMZTVxmAowNFHzr+HFPzFgEwLQsouA5dilJIq+TP/?=
 =?us-ascii?Q?YFciYgcYZhPdrhXT150VCzez9l0v/Djw9yoySZoG/qxhEueXvtaiKQCthMVi?=
 =?us-ascii?Q?PJJUvRi5vOb19FqUQ9WdqficJrurSbLcGZnrPlAfW29cuwP0wNSVxHpe1Mq2?=
 =?us-ascii?Q?viT0aiXbss/qIk8nvQ+YRh3wKiIa61TSWTSxiEk4nTq2BS2K6n3wDDR2pyEA?=
 =?us-ascii?Q?dPiKYr7OlCRYRu5F0jRGwSYu5oPp5uRMqBh9c/WiKDFHufj2puB8fp7S0vvF?=
 =?us-ascii?Q?W2zfIli0ezgSnWjekd9qwwKSbQsuPkfU860LapfyDwUkoh5YhjIKvJZP41S5?=
 =?us-ascii?Q?XgJafLkalEeEgSVmDXA2po3VvVBV6OKrnSTPj9b/K0Yqee4067Sf0WxKch3G?=
 =?us-ascii?Q?SlwQ0UJ3vGrye0H1hmMlPibq+/Yke1ZxylAMVCDGufphhrfFhX/1h+8N9Tf5?=
 =?us-ascii?Q?fdVe+oEypOWR+843DPUYAGBDwb/ubIAhtb/gJ+eKN+5eOpC00soEQrwIoykb?=
 =?us-ascii?Q?f7+Ep7WSHQgSklZFC73QVOdiISLAbFkw/G/ffrQR5Q31QU+Xe6qVr1Nk+hcQ?=
 =?us-ascii?Q?J/UsWOUgk+qVAvQw4xuE3DkaZCXDmEmLPHcLjjfNAo5xb+yruDIS5j1HzOrm?=
 =?us-ascii?Q?25j+DzxvmQBKAuh5IPdUaab0Or5EOjaw9BDeINW4/jnVzxB58mYdUdzdB4+n?=
 =?us-ascii?Q?Ed7RlppJV8yND4eehEAtDFMmFN6zDMOjYkNcvQg8HiRi9IkdV4vA/4FiRtfA?=
 =?us-ascii?Q?Z4FOTvOOoiYCZAxOKK37p9zWNwjbNtDL5hM9AP9rkP419uOGUEcQel2zuu5o?=
 =?us-ascii?Q?Qjb/DaYToV+ZdYFrSx79j9nZHHVh5wr1cz/JQ9HudOdGHDxMxjIIR8PQNYaf?=
 =?us-ascii?Q?nuAIhSEF2Wfj6g6UBCDV2qzHVLIvh5N2kGJ6rVXa0hueKQEcpZV3ypEJpUBP?=
 =?us-ascii?Q?WdCA/osRvKBUbxUxFe0EMdrUlA6n+idKoZnJk+t2EC5tJroTPOhQ8/4tWqsL?=
 =?us-ascii?Q?nls4+rhIx8dJgwMBwkd9oiLNMG9GCwOA7K/7gl5z/WSWAT5QxHSEAf2Du5vo?=
 =?us-ascii?Q?VWzMsObiWlvGv4r6leYNX01WkTlQmXjsxGjYPbmX5Az8KG9+7cNDpKoy2XzF?=
 =?us-ascii?Q?Go0L73b9NoTYY4JNx8n86ySjXv8d4Dbb/GXZ8Dyl/eLDhBKQu6+ukU7NkChy?=
 =?us-ascii?Q?uQqhDNmdVLv1JVJnY3bekWJ2fasuImS6IL7U5JbXQ68BhuaPZbAdjz7y9AmE?=
 =?us-ascii?Q?b2bHxY8f38OTegpiZ+S/rxUvMCDQK1c/jMqHHSB3I7Tn7CK1qYr5Wq9XKzwX?=
 =?us-ascii?Q?T/EQRm6Nkv0z+wPONCdLY22NQfOTiylPXUu3SL+Db0qY2mKANg5/myc7/6wc?=
 =?us-ascii?Q?REQmZBafDMO/5cFDWVhB41pzzFu9cAzqQz9P/33h?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ebb136-85a0-449e-8fb7-08dce39cc084
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:56.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqI0cAdRm1WgDktmL9/xARDVkk51dBmNSsfzxXDD8c3lnMIxzDr5IYjgtRu7Aq9jGzml0/NTLMXgDANCWPjhaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR14MB3714

Since there are no registers controlling the hardware parameters
IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
declared in the device tree.

snps,bus-capacitance-pf indicates the bus capacitance in picofarads (pF).
It affects the high and low pulse width of SCL line in high speed mode.
The legal values for this property are 100 and 400 only, and default
value is 100. This property corresponds to IC_CAP_LOADING.

snps,clk-freq-optimized indicates whether the hardware reduce its
internal clock frequency by reducing the internal latency required to
generate the high period and low period of SCL line. This property
corresponds to IC_CLK_FREQ_OPTIMIZATION.

The driver can calculate the high period count and low period count of
SCL line for high speed mode based on these two properties.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 .../bindings/i2c/snps,designware-i2c.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 60035a787e5c..e5d05263c45a 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -97,6 +97,22 @@ properties:
       - const: tx
       - const: rx
 
+  snps,bus-capacitance-pf:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This property indicates the bus capacitance in picofarads (pF).
+      This value is used to compute the tHIGH and tLOW periods for high speed
+      mode.
+    enum: [100, 400]
+    default: 100
+
+  snps,clk-freq-optimized:
+    description:
+      This property indicates whether the hardware reduce its clock frequency
+      by reducing the internal latency required to generate the high period and
+      low period of SCL line.
+    type: boolean
+
 unevaluatedProperties: false
 
 required:
@@ -121,6 +137,8 @@ examples:
       i2c-sda-hold-time-ns = <300>;
       i2c-sda-falling-time-ns = <300>;
       i2c-scl-falling-time-ns = <300>;
+      snps,bus-capacitance-pf = <400>;
+      snps,clk-freq-optimized;
     };
   - |
     i2c@2000 {
-- 
2.43.0


