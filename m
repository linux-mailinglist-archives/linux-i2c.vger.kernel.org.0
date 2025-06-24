Return-Path: <linux-i2c+bounces-11573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E11AE7048
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 22:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79B35A1B1A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 20:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18362E3397;
	Tue, 24 Jun 2025 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FiIcaa9d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B92550D3;
	Tue, 24 Jun 2025 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795498; cv=fail; b=KAWlerwiouYvsp271aQ3C6YK/png3VaniLJ0wuWujzkGefLHRx/3UqphDhFykUcLYtoN+YuVppfceQ8fSgFbgmOUutA6NU/0G/IpHkxMwDm0QrtPobgL1zCQPiMuYwqjpG8TQZ5u6lVoxvOURZSLhLf53HxeEwmGz3UQmYHWZGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795498; c=relaxed/simple;
	bh=ifr0YDWguOv/ny2XIUa3wijmCCZ0FCnP2txU5WjPijM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R8JH6StExvZe4yftS58z9URbTOeKUj9GpsMDEt7t0znJ9rGo0a6AH5/FLi3r5H1a8IOIvie/7fBUrK6RWLwWq8HJydT9Ep5GOFBX3WrlcvFC0A9SBoLgd5htaJ8ORoFzSJUEw+C5z/Y42IUXjzs15NmMbYecx7kiRZB2/ANqKWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FiIcaa9d; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQG9L0B3hqGmW4rSw9gssAC6a5Hl/SFnmQVpMzfgn1Xhy4xGQZPhiqceLsw/BOJdW9rsJ5BIpE4D9pQ48/Ndcl2hAc+rD86k7d298URvc3ygGI0mAJ7nKuDHjhdagV4l9H886hJ6dCD6qBDU1N1gz97DYX77HpgvmFs5wczqgaFy9zAvgaIwqx+6R/w4DE0KvyGtP+DylFUy8JnsAW/lLnSqTFxu2UiMWyNToYiJw6ZCn7C+afus6oBpGHYO2LmW867oGW0q4OdZ8va97Bqs1U+jEwpq+gWT/cytky0pb5Cr6wpyjlrwlrkg2/5DzcIRCENh1OeuXvsGQSqU7NRUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnA27UNgLMuk8u78Gr+jPZjpwSy4n6ovLKfrdClEOpM=;
 b=ACZ2tuL9wtsoAmA9Byu0mDoOyWMVhAqBvcKvMnqekkfmG1rlz0+vTR5MdMOM2cuBDT4sd9J4uS5EEcK9msBgCi/VScfDivma1q1mv/a7GkLNrJLi1cPiFqtFDwmk8D/9IsQzMAjPy/+ZoJiUh3bAOZKdXAKkzMapztH3Ih9xGdavUbFi94CDYH/tgpdy+FaoqJaSANrNXuwCZ3UPxTI9GfB47k+NIBrqr0lblcpwYLXjCHs/qG00QIMQWxtzQ8/yDUCjr280UM46uJdtaeveSGSkKwLyvdzk/piLnYIC+perpbqOykj6ILX+PNJljm5IaeLkTBWxK/fhu+5hifABJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnA27UNgLMuk8u78Gr+jPZjpwSy4n6ovLKfrdClEOpM=;
 b=FiIcaa9dmwiAb0pcWcJ6fCEU0LA/fxBDpL3G1+5FeLVfHghks7Zm6zClHorjK8PuihlWCv1h0zmfaA9xaUdvGz2NdVQFlFiyxKVoNiefmDGqRmwtmZjMkA8ytVrG2DyYoOSTb9U2caV4VRuk6yR5f80Up/GqZlEHFCv5DPBBFa/zEFS6vefGt832T3DvtlGO40xq7Qpk4uKn/F016WwMWA1zvlZdjqhXSvnNWNn0DFKHW8VXKY5Qc2p7+iZhA8vVFPDZI5bDh9aXCx8YyAHo2haJThLqczWKTnrBkxnJ+dDLLhQ+Q5Cq0PjsY1xBl26nEz7LKNM7rMMa/saAWZlubw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 20:04:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:04:54 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: i2c: nxp,pnx-i2c: allow clocks property
Date: Tue, 24 Jun 2025 16:04:43 -0400
Message-Id: <20250624200444.2514331-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: f620c42a-7d89-4f2a-8b8b-08ddb35a62ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7/nWQbGoqY1anR6SasCfByWyhDonMMhivbT6ZuaeUAPcKeNpJqK154WrFKzT?=
 =?us-ascii?Q?PXpo4sSrWyE6qENqtXjSmbS8ntGcQ0rX2y8s1e/W3tLIq05+YTjEdBqw/Xv2?=
 =?us-ascii?Q?/9CfZ7RASuXTmwvXtY5J2OIoSjULg18FcMneS6CmMmpNkMs8zrr/QBayClkG?=
 =?us-ascii?Q?s+6A+0X47mE6pS90fRUbC9yrM9QmUswh3ZjdNj1R2MeEcQdy+H7ogdBKrM+i?=
 =?us-ascii?Q?b9s8EVZILAg7jh6LyePJju6BaRM4n+koBJ8tQWtZJkCFqoHACe9JiYX67zo3?=
 =?us-ascii?Q?QBa2UTpP3dwYUpWtkqvl+/G8OAv3MChACETGvCMNifxCI/CcTbdy4yfXmngU?=
 =?us-ascii?Q?a1Mscc4i+b7GWqVR9eDYJw6Mee0zbo1x8LVs46xIOTmHG/l9rPzD9X4NxEX8?=
 =?us-ascii?Q?YP6NTmHrjp/rmlB4B3+tCiw954jJFnTJmZmAhhokzmGijzHwBpkGsfKTu65q?=
 =?us-ascii?Q?W/MJib+d1gBuvOZPgz4muGXY4w7I2MRI/pqqx3ftGFyQubfgBd4/HrDm9Hcs?=
 =?us-ascii?Q?y9YzU3IYITgg664HuAAcRJ02VJN3QmoZZwEun0ViwMzKz2PS3CqmzVQNWQIQ?=
 =?us-ascii?Q?aBvj+V9vMqjWpMhuwB52qSmWPpQM2WfgtXwh7YOpSEuhT1ydalrK6DwxDRwm?=
 =?us-ascii?Q?qv6C+/BvF8y+cYouqEsY5D0S6tJ4Zud6Qt8c2ohhteXZQLYmhPi3Jcj9E6gQ?=
 =?us-ascii?Q?wV2WEzXKYORvCNGv2DZgWlWZZNnopKvx0o30RN+Mui5QXT8fMAR+kvM56eXi?=
 =?us-ascii?Q?Bt09rPFyeupJ1eoa17HEN892rmRalMLVM2qKYL9bUmXihlvTsDQafIT9VuJb?=
 =?us-ascii?Q?42at5VXl0v24KDzhHzENhtebQpfdGa9i1pZAFO8KGQ2ASTXnV0rZIpKG2uqi?=
 =?us-ascii?Q?iAj6/cB5+lfBVFnMQCIDHlWIcOEHXg6YVsi9vPyBmp6KKe+Y3Zmj0f/ef246?=
 =?us-ascii?Q?pyK7nUctxP+9gIc+fnz28NmoRr5vOf3SznJJR3PwDUbm12reG/oMTHiqhmaI?=
 =?us-ascii?Q?6qPQqDlESYybkZrk+AWK+cQ6hKie4YWvHpJMM+2pSOXt8qSR7dLKpd+GFUkM?=
 =?us-ascii?Q?Efs6e4Z91U51KHj+MiCHNMprfJvMQirzBiIRPTWPN0nUdIV7oV3ZikpL02Tl?=
 =?us-ascii?Q?0DIg/pUO8R24XcAAadKDPi1US657hoxm3GZ4rsaoixncSBX5ev7pRiCW2A2R?=
 =?us-ascii?Q?RRAFdlE1QCvEvbHcqFlwnbpmmqJFcf+u+t4B1Lt+hvzhU+cbwrsbnGjS29w3?=
 =?us-ascii?Q?1ftUa2ccI4idlzjz60D12q/zz2SwrfGtOR6wMcc8yAkAkBOTpOSeNPH84KeH?=
 =?us-ascii?Q?M0rdKEuvcoW3J4egJ5RbwTFRHp271MUbuR4ithNZQfTZUyfuhKJRtAmWmvTz?=
 =?us-ascii?Q?TV5VZ1Iuo1TdUJh8J0ZO1NSwrTrmIFU2eODlVFHToReaXME5GWZN9W+qriRQ?=
 =?us-ascii?Q?b6D3OkkBKBRWBmmixbtk2dNkh0GEFhP4BPFyZRpLk+nKM9dsU1M7w9T8e1Bo?=
 =?us-ascii?Q?CqLnF6+rQb2BKYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uC0o+JewlfGCn9wEAqW6i9y729gEZyAl7n66UJzvQ6vlbq+0sfQzuBXL5857?=
 =?us-ascii?Q?yTQ1jhAUkNK2zbTKbgWXDKrLaQzsbsIzU5gMZVPzjlcaR8yFhm1X72pr7h3e?=
 =?us-ascii?Q?HZYyf1X4LHhvGUG+D4Agn7naNKDf4scOnxKxSXdCy8b1IJFJqfcUPeCfR9R/?=
 =?us-ascii?Q?QlnEEtdJtnHMiMZvZyigYZnTYvdL6VapFHh/AhIspg78y+iu+oat3eDwr9bY?=
 =?us-ascii?Q?tBl31BinlbJuNi9UAjhn7PVBR9fz3u/hYMOwIME+0g4MC4fRgrHB2hYW0JRv?=
 =?us-ascii?Q?QjVYy9Y06Wn7RlgH7638pzcjrfxo9Hi+f+ImSrvaXeapGwjU0hIj48gFVQpw?=
 =?us-ascii?Q?G2kmnjFpzVru7cOgO4Eq2Z2wI4xKxJBCwJgmgfsdehFI49XJ/u/t2nh0C3LI?=
 =?us-ascii?Q?t5dsf4T+p50LwQhJqJBhzQbtSErQHFuoKhdNjWbNXNi3+4m8d5BkO/fckGP3?=
 =?us-ascii?Q?a0XLPKuALDT4ubmTYtMaYIoL2JIbbxPXwVyXZpfirTx58uPaOh6LIAZpYbHC?=
 =?us-ascii?Q?G9wUBKAqugkBGdKFqo9zzoDu1d7aHXwTvfkIynjoPVY36mEEUd1YkykhwdcX?=
 =?us-ascii?Q?DY8RQzvfOD6W5lkSTYXfkMTOKS5ZfH8EzHr9sOucfbxEkLr2IOJlGHcTWPbV?=
 =?us-ascii?Q?H07M/mbddl5TDDLx9gD2viywpFfhyYoQsCmOrXEC1OSdYSP9NSx9oBjbZlE1?=
 =?us-ascii?Q?EEcwsCqCjDESU3Hhq7qqFGHu7MVM0jI/x9IgXxxT5QmPyeSKBPCWbh8Y4Udm?=
 =?us-ascii?Q?tFv2yL+ltHx3DxbSzKUSyQPgNBEd/GmBlJG+NVRNEpWW5gJAdUM7BINkNBNP?=
 =?us-ascii?Q?+KJp8K8zzVmiwSS8SdLmzerTIjqt25+gszj7/ObTBicYkaZqO3zx0xLv2suu?=
 =?us-ascii?Q?FExLog2f2mdSkh7VX6mETNHjbfiSs9i4QouqDghklGRnyG/fOSHksByCyOJa?=
 =?us-ascii?Q?FEIchy3h2Od3Gni7GinX0KhDp7mvWNcm1sLLfGyzsPwJrhBtyx5gBtEJbJFy?=
 =?us-ascii?Q?o9kQWaYxUGXOiucMPRU857O6Gi6tIRRQExMKThmX8J54B/2IMnOszPj39aAD?=
 =?us-ascii?Q?krkg7IP4S2FXF0bQ97KM6WRlieu8OCIDsm4BkJPuxk1eLqX8AL/IVI8gTH6c?=
 =?us-ascii?Q?G3AtB6RoNXyT3NKIdQAEqUUM4Jf7umtj47ad7cNY44iX+kCBHSw4JeZiv6I3?=
 =?us-ascii?Q?pV23fozxqX90EQA7l9W8AOBnkFGnXCBgfkpFb8pWfmnsq7Q1EuTP6lY3/5wm?=
 =?us-ascii?Q?xdahszCuo3ylsod3oUFfds3U6hKrM14Ukbx+XCRIMGcuiwCCJUSzqgZBxSLC?=
 =?us-ascii?Q?eCuiPjQIO7yUhVGulz08AkvTV/BWnWrNn1JtTs9nqBL5lyfxndODzm5lGWtV?=
 =?us-ascii?Q?8hzvEuyajHDueZejpIRNrBLcTsEonzk9UlZZECqNW5BobJWNpc1rEwPmYlYQ?=
 =?us-ascii?Q?2nytqlzh0JHQPtAF2sz3ZjNzWmQM+3yh9KriUWnUxjCJr/1CBKfdNptat8lT?=
 =?us-ascii?Q?e3KJQM5ioPEreUVJJt8imMVrW7+R1tUj5y1E79O+j52G1M5SBnoPtgN9iigM?=
 =?us-ascii?Q?TBQvbDrKQjrLp5WObncsqqbyRQ+M04GXeWQWoLex?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f620c42a-7d89-4f2a-8b8b-08ddb35a62ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:04:54.5564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGGkJ3x7ihhy7gAvKx5O5Ew4U2fBVEbP5BLpBNEgd171xNeZx3ZDdo8Uq9tVRosTAV7SYGiTpGy77zX7rAeWEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899

Allow clocks property to fix below CHECK_DTB warnings:
  arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
index 798a6939b8948..e645784b77d3a 100644
--- a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
@@ -22,6 +22,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   clock-frequency:
     default: 100000
 
-- 
2.34.1


