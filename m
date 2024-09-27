Return-Path: <linux-i2c+bounces-7041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD71987DDA
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 07:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31FB1F23BE3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 05:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE96D176227;
	Fri, 27 Sep 2024 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="Iw+QCB8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2125.outbound.protection.outlook.com [40.107.237.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41334175D2A;
	Fri, 27 Sep 2024 05:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414730; cv=fail; b=a7IyqxyyOXxnddx7J9VlCQDWmpIVXEZgxDq8LNVyXo1P3ABKRohf9knjUVmkK/na7elW0grBMIGUrcxMGHybCB4D+jvhAW9wuGUyQARIPW4TvMd5XlUOKkxZy2xNmJdV7Yve3edXpDiCK5k9qqmtjin48h0coicH/SaXw+oLzrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414730; c=relaxed/simple;
	bh=FjFBHd8GlrUZJGdbQwzFs15AuMCt8/AFfFjrB8fFYpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hR+VVLPPaeyhaX0r8Sy0d/xdXsGbUsMJm6HM9HhYM9q6kzlktkOGWtM/VIip6VKfsgA32JKnv1gUEfv+zFgNfQ9tmkhSIzv1MAn5Dx3NZpEI4AuYgmGrTGgE1cEHK/vtNtrrWeWwjw6fJ7wzLFNnqB4LKic6XZJ2sWwhbCJGi0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=Iw+QCB8m; arc=fail smtp.client-ip=40.107.237.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgBFuSI8zIyils+0tsL8uLBKrJlMGO+2oxqc+yUfOKoRQuSCS89tt0ojKK3PtCyS+1MZet+veydQRwAor9vxCNJwODKoVyU0A918nny6GEHTmzW5zYqfqUvp+tvMeLqO8QqPnBxsH+QErAUiRMDaDNBocc0uT6rBUEvoNe2DBQoNZg5G7NPIoUfRUxahRRkAsvIgP6D3jfDZJs3NSkF7vyrEAXdJx0qhMFFgF59U3Ij0UUAyoXmlq0UWz+wA/MoqjGx9LHbxFL0+rz3Mz8Q5fjIRFFR5dpkr/lV4hX3lWO2Bv88t9UIjIfjdHPeckWk65CqAELi90C1o33jHOmrJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAmHFh1Z2we5MDHU+2+oQ/Ra37Q49NuUbopL+1TwJdo=;
 b=Jzy2wFWwm5zO5IlSnwQadQy+1aJEDXUXWJWwGtVxUpHh6Ypq1n/VpesNFKwGxbJz+5hOyngM2QC/o/REL1NfjJzXRzVf9XtgQzWTin5F6VZ213PKkux/6/kMxg7o6g/GFSnw4/PxxxoU3zBYHuWxyakqLmKKkKNBJOWnQflXReFAkCX92icYNtQJEaJ6KXW6mcXGcDODrn8OavsvlPUcjoOhvItAGTbnwYSPm+gVLB/Y+eFsiAXKK9iJ8qq5dwVyeHoLL3bOBN2WYnV9j/zeyn5grpQhlN3ocUZ7z3rQ2guCAIYa/ccGnetHIQVtAxPcTo9O6ltT9HAlLQpcuTvQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAmHFh1Z2we5MDHU+2+oQ/Ra37Q49NuUbopL+1TwJdo=;
 b=Iw+QCB8mmCnUqrV9Bxh3kIOUU9KYIE3GCpeV5OxPu4pFXq+FEpE1ONQljUXJO60qsP01dDdumV7TK6olWPja6baegurXLCwPJ0Jlab6DkvhVQHuk0a8+A8VOyIW8JwP6chkWlQFHooJUA+/7oM+tRp2//jih3HuesOAK9te7HiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by DM4PR14MB5526.namprd14.prod.outlook.com (2603:10b6:8:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 05:25:26 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 05:25:26 +0000
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
Subject: [PATCH v2 1/2] dt-bindings: i2c: snps,designware-i2c: add bus-capacitance-pf and clk-freq-optimized
Date: Fri, 27 Sep 2024 12:22:16 +0800
Message-ID: <20240927042230.277144-2-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927042230.277144-1-michael.wu@kneron.us>
References: <20240927042230.277144-1-michael.wu@kneron.us>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|DM4PR14MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa99bfd-9613-4c7e-362c-08dcdeb4cb57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|80162021|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6rtkLE1SUsYPjpl7G5KWiLMVO+mz92PBIxWMnY1CO1RQVFhCbrMYA+v2UMXh?=
 =?us-ascii?Q?p/fhh5jTsXrJRG41xSMJrrSJ1CT/qfSXvhZvClFc/ACZ6osiJejlCQTST+0h?=
 =?us-ascii?Q?3DCanZ1bHfyBdxS4lhBNzGMb3HeG8NKiIWtXvpBrueEKWby7+/h7HPERjBF1?=
 =?us-ascii?Q?zEbXRGLkV3IvVpDNSJgFpX6ysL75zUpQkxv5HHZibxyTXXV4c8QfC79EPGPR?=
 =?us-ascii?Q?vkHy+6EWxeWWOF9NvqdZF45ljywBUT1kmuUPnylaQNHnAYJ6lP1sb7G301oq?=
 =?us-ascii?Q?4Vps1OdgF/Gst07SQXcXMMkwjBkXOHYBSnS0V4VFoIincVki05gYDlDtntf7?=
 =?us-ascii?Q?Qr0oQ8a/2tO0WiQFQtBficRI6pB+O1kg/qJxbE0yyoyfbfgS08qOp3VyW97g?=
 =?us-ascii?Q?8hiaP/Y4H58kdwoGYgSrgH3ns1a6pbh2NcDxvS93AUTQAGTeMI8C6dtmRJRW?=
 =?us-ascii?Q?gGe9WOi2EysO9u1tRfpL+l6Iuv0SQMVKWTE7lr6y3osuZ/91Uu4pGBXIBeif?=
 =?us-ascii?Q?Nbw7NFl2JzIQaLvtFhs5ix6QQRZir2wJ4GoExghiSC+j8u7vbKS70pBIMyhB?=
 =?us-ascii?Q?Pl7RCGBsYvsplWiqDrl4TLY20f5TkieE2vDdlktHv/8ta9nIasq95lZFcG2q?=
 =?us-ascii?Q?eMEhOhRY0Y8rx24XXMRT07qIDTtDF7UHk/xWfMZ0Q7MID8LChq5qU5SDWakb?=
 =?us-ascii?Q?R5kjNc0QWc2sNWCvo3//1RcvxKGxogcUGYDpmLdfhfDbz5R9HNnN2P19Wygl?=
 =?us-ascii?Q?VA+3HntrPcf1dJI0X+ThPJJN9UQgWHbyrUn58lM/uuplJKFqIktFmRO1HvDL?=
 =?us-ascii?Q?kGXxpWzZIIE2+YT25TntkuL0oDK9lsS88cF5yGdYJqCM6rHJhW1Blqhrbhrn?=
 =?us-ascii?Q?Piyn4TWwSUvcpkyDifmRxvU5GSbEGLiEfm7OqueNkraiSYeM8jBvWq6fbJy5?=
 =?us-ascii?Q?2BG2bIE8Mg6JD4TlFHQ+gsM7sT+V3CzCnVoH66rWtyg08ChILGNryARC/GYo?=
 =?us-ascii?Q?vX8d5sgBbJ+zXdSwzhwUU7GuUyLhV/X2oHXwWMoLTly/nwLqebEq8DBmjJ4u?=
 =?us-ascii?Q?SOUMqQDl9oe/0pwLDSgxfjdBLEEe2ldiz8wSuoP3RBAcK6LJU1DwkVq74nyZ?=
 =?us-ascii?Q?7SvtuOBOnBxlktd/LVANd3eL1lgk9nTqYGEPul2UFnVM0v16IJWMNRAbRgqL?=
 =?us-ascii?Q?rdARZMDmbRCVP4CJFEhA99GWVxvn4cddrqcVzFCNnXGQ/Vp8+aT+pAnXI+T0?=
 =?us-ascii?Q?un7NRr+MZvsNiVglPA2rqTKfcFMlUCy8aOvFhkDWWTvnMnwadjAN1KRYb3U+?=
 =?us-ascii?Q?MgFQZz+Doi0sIM1n5+G8Ajp49W++QDScXCPJbbELKyHcMDQtXJd7FaXzBLgX?=
 =?us-ascii?Q?Zap7VqmFyy/uA6ov8DViVYb+Z6a1YSkzp+2eUcLxOxkcgpIYtJkcOOHdntng?=
 =?us-ascii?Q?mfnzTE+ipWE36MqxoI6yahp3teXwd2Tx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(80162021)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZ8txIOmJdpC8Ova//92kILAN4XVyiMvwvhip9brnspSrxT+Kiqd+LRYMXW6?=
 =?us-ascii?Q?hf58gwUqTzHLiM6iBCm9zPf7U82v5ZEmpM8+YEOCDldIVZPprte6QRwe5sPm?=
 =?us-ascii?Q?qpXYKw8hpntXe8JVN4hMHunbLTjAEaGys86k15zXPuXmqRURSN5uygNRbfmj?=
 =?us-ascii?Q?sN5SVeCwgR7/XAlQmsIDrRkLRk9Kbi8mAo8iUnfH2eXwua43xp9SsOLq/Eg9?=
 =?us-ascii?Q?Fh4+oDEjfYeWBmz+YcT0C2fDYzhbGgUBIH138TOuL0ifpZ0bGO0F0XemunPc?=
 =?us-ascii?Q?X1b1QJWCDW/YcN73lq3wv+XsWiAWBiawUjqeuVF881+JpsUfE7CcLfMcaRaB?=
 =?us-ascii?Q?yZTnmZk//veQRKQBhlM9WFTAvmIsOv907NhBsPkYUl2sAYKvLWEBwaDt6Q47?=
 =?us-ascii?Q?yLUtC+WCshtrNPeokhw2bVFVYx+4VDgZ0gXm9XeEmhJKpAvG9xjnrRkAmyaZ?=
 =?us-ascii?Q?eSQiOljJSlt1YlP1+qEJUwlpcTKXPcc6ylTQ0MUMbbouw9MSSrO85+2/S8NV?=
 =?us-ascii?Q?qwpmZUBQ7Ws+gyQfIaiTFf9AZMNnq1GHFP3RU75MHEeXvvnJC28LaAsel7ni?=
 =?us-ascii?Q?En1EQ7NQ4f4+DzZ+oSaZ56eMOEvzGEsdNnTUitm6L7EEYZzRIKxHRsAfKoxk?=
 =?us-ascii?Q?lhebxkouUgpBQPBEHKhuR38mS+zSCq5thajdcIAXCGhkT6LFZ5hOPh2aRS4K?=
 =?us-ascii?Q?rt3m0GkOdLDVtW8GK1SMotHnNHwbgk9u/tWAmmXcjNCIIfgU1Y2cPAo/6XPe?=
 =?us-ascii?Q?jgTV7uWfTB+Yx5tIC4IRZ2mgod3AXCZyEpecuTmSKp2Nu2UwUVtU2zbsw0l/?=
 =?us-ascii?Q?rRBjDb4vc3bUcgPfFkPzo7VMz4rAXGcThCzwGRdIpXqaNqO0TuPhlSkZK32d?=
 =?us-ascii?Q?nXJGh/W3rQKAhFNPpVx8ShCZ0elj3hSH3NXT0qzaEp8AsF3XSUyAoIs9L6zX?=
 =?us-ascii?Q?es+D9cpb55fGiq+8wP8XYUOgyiU3mLjydZGr96FvK2ZwKbCLO/Xb973m27BH?=
 =?us-ascii?Q?+xVvJrfIYxQ696T9+jCUqa4wgCmwSVf68kCMoIJDVVn233S6Bfs25kWcYkS2?=
 =?us-ascii?Q?xiW3OUpzAFEFVj9hkiPqlS8CVi52IVc5Y0YTTUXBpJSc9QUl6nYiTbdd3lN2?=
 =?us-ascii?Q?/pof40ry6Oqm+b5nWlROhaPiW8IY99tSJGgari+RsYq3SSzPnLvq9Ecix+0I?=
 =?us-ascii?Q?WnOaMv9bGlnO7VtRyo8e7fHzlVuHip+oAtqWvuHjg1KA20g8f2PY6FhDZVCi?=
 =?us-ascii?Q?SjbCzGONpDUCfdV3Fy2OPTyd1Ghu6TOUZx1l7FgGA2XLzbVYfxJ9ub0tAsjR?=
 =?us-ascii?Q?bcioxDjcPUpN2U0Bi+BxO22Z6eb/HjakfJnXCX+on0OTKTNoGTi+CeQAb3Fy?=
 =?us-ascii?Q?R7XfwgRzD4vN7E6sc5Va22kGbzZaA4BN0jL1jRQYeyGQK7cHJQU33IgnHCh8?=
 =?us-ascii?Q?GS3fkbGBq1rfwy6kzKSiwjSFrl4iLvmH0G8PNI6OOPgc/3DpGUvZlGnORrwT?=
 =?us-ascii?Q?6vMu+xzUuWJsx50Qv9gEQir2PR66ooXTurWLWGeYkS3L6OqZtkeVXqqHYinu?=
 =?us-ascii?Q?SGXcsUyjx0kLqu2jfW7eWYMXymnY9JAZHFHnFUG8?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa99bfd-9613-4c7e-362c-08dcdeb4cb57
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 05:25:26.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9Hd8wKD/zLDr1uohUwcTnjgjun29yvd5TmGswJGsnZFV8f8rJCZN2x0vgdpaOMz63J8AlplxP3EaL0fKGiHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR14MB5526

Since there are no registers controlling the hardware parameters
IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
declared in the device tree.

bus-capacitance-pf indicates the bus capacitance in picofarad (pF). It
affects the high and low pulse width of SCL line in high speed mode. The
only legal values for this property are 100 and 400, which are used to
calculate the tHIGH and tLOW periods for high speed mode. This property
corresponds to IC_CAP_LOADING.

clk-freq-optimized indicates that the hardware input clock frequency is
reduced by reducing the internal latency. The property affects the high
period and low period of the SCL line. The property conrresponds to
IC_CLK_FREQ_OPTIMIZATION.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 .../bindings/i2c/snps,designware-i2c.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 60035a787e5c..fc19e6a8b306 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -87,6 +87,20 @@ properties:
       This value is used to compute the tHIGH period.
     default: 300
 
+  bus-capacitance-pf:
+    description: |
+      This property represents the bus capacitance in picofarad (pF). It
+      affects the high and low pulse width of SCL line in high speed mode.
+      The only legal values for this property are 100 and 400, which are used
+      to calculate the tHIGH and tLOW periods for high speed mode.
+    default: 100
+
+  clk-freq-optimized:
+    description: |
+      If the hardware input clock frequency is reduced by reducing the
+      internal latency, this property must be declared in the device tree. It
+      affects the high period and low period of SCL line.
+
   dmas:
     items:
       - description: TX DMA Channel
-- 
2.43.0


