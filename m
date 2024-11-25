Return-Path: <linux-i2c+bounces-8203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC99D87A9
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 15:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B3C169131
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C517B1B4123;
	Mon, 25 Nov 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i2xNaBwi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB291B4126;
	Mon, 25 Nov 2024 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543964; cv=fail; b=SBxSYUkyLrw7oATR0ads8HR0oAznRPXqTUeD8NQEqHroXhCuyygU6Sj0I7nHR6YCx2SEn4OhhJbxo1tg+hbDID4PB0Q0sk7PHH9uu7nwSK/ybbVKXp2/BVU1jYsB7NmPaNj6wX1seAvISwk+LtG6dXCzlgWJcgz5U4PmVm/a7Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543964; c=relaxed/simple;
	bh=H6G22v3wY99dNjcV9fhYTpq04P3140lYrDNk2yRvWOA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hny9bVj/g2qrBGVUfDpKbPKhJHfs39MNYfLNRyJ/ejLXouFzIaE+b3Ja+aiPIl6VJmek4COCSWo1vngPc4JtbiGeGGfbsDaxoQESXv8cuSMEvmg78xf7tKrVB3al0x8X7sWE6wRDVT6JaDJhCbbXiU+G7OQQedqvuL7jGH+qtlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i2xNaBwi; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeEqlvqza6B2x7k/pNIxMJPUKdaQCetomuqzIUV+KCiCODnjO/mrvgbsk8EjC7DPV/jpvOnAsddn7n/qHIwGbkWDDWejcqrsaibn9wTibWZJVcXbYFyXDFUDcwug2YTNG3WxHB0A1kesbFEydgQ1Fnk1XYqCFgxunBe/twVHL9BWRO3HPepYiRnEXU40u7DD4M2rST7YW+Z2hzvZJus4QY2NwTt6IUTPwr8G1vtbfw8TcVt44KaRYMegcoUuQZ66owTPlVGS5fBlNbhKJxzGv1rZsKOq8QBMabXsPPZ+ZMNPEMrqHtUn5SKh+7HWg8PcFE896XYWaQuRIzEsEahgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe5GBovdqjL924qEp5QSrxGfqMHe75Plr89DsawSSu0=;
 b=HFd0Nf+l9Z1DWlw7+VlKRhXkMo+7TuM+s5kCAPDk7v1+fwv9Gyyc89yl/VcgofC3zNGoNrWW8DhqCIcjzliCEpMv2ZeQFonnDmj8bYg+qhnzIRcLKU46GFPufmSmBmF57KkZg9EoytNL2/1XZ43LLV7+MZBcLFEkF/InvhLtqNK1xTd6ZL/+s+R/01UrnW/lFT3oir76Yz04GSjbRfGG0at65zYyk4+pjm9kfGT2Z2ANF3ApD6rcNMzrCokfdMcF8tw0oJVGBAftBPRWNdc6VrtwqamwcExksRxjf7cgPhdGE78RRtNx98pIfMmKGaXbMjUIYVAk4n+RGw+5cZpd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe5GBovdqjL924qEp5QSrxGfqMHe75Plr89DsawSSu0=;
 b=i2xNaBwiKT6flOmjb2ZIoyzazJ2iQ4niZ74I+wurvRjY1Qrvkyz33Qb71WucJWfPm14J9jDP/uAEthLqLOS6HMsvC1h981Ro1OUYR1l/qsfwVJRdNmB9B9b0oEQ12mlsXyhkS5r9F3yYRnqAyODValGjJ7DyOySiLzbNJoGtxt50L0DudLxKwNLfsXXIg0oVIEpZfs8X22Z4ojqhpf0VDd+x8Z2bVTJKzkaOUu/39bLS0GMj9CpnX0Cj9N65Fynk69aFpq0WVdbClmXIcVk8Iik7d5kESMhVkTgTBfvAdaLQ1wgJAsheW8/dWdbZIrQkjeSJqAlwt1NaS6G+LWAeNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 14:12:39 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 14:12:39 +0000
From: carlos.song@nxp.com
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: make controller available until system suspend_noirq() and from resume_noirq()
Date: Mon, 25 Nov 2024 22:21:08 +0800
Message-Id: <20241125142108.1613016-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0462.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::19) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 17122bf9-4e57-4d90-ef9c-08dd0d5b37cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vA6Ln+oT6D1Aopb3TGojRIMmksM+vTJKGwxglzvDKU4/alYSMyu/SgyUbdjF?=
 =?us-ascii?Q?lHkiFkFFXrCOLzaDcf8TrmMuFdhbYPX85rRlRHedEjzkSR/lS/W1va/L4TpG?=
 =?us-ascii?Q?12t9p8x5UU/knwuo+MKVPAxyec2tUBFBD1Wl4ABxXZ1c0mIK69nk2OFMQ5t0?=
 =?us-ascii?Q?wHg2NlZWqrZvhmcFfa1FOkXQf5I1Ah52geAb4Ir+clRcRq1hQzXrm9nlpMcJ?=
 =?us-ascii?Q?b3wZ1sQJ0Rw1j6AkwJV5cIKzlWZsQ14attTSTd0tl5fprffVUweZULQEbDlg?=
 =?us-ascii?Q?JdbuwHJDDZ6Db4nVtlmtJ+K1Gm6NoIgMcrZzafroDo5eASQOwpMiMwx0Zz18?=
 =?us-ascii?Q?vVw7obHfWHuFp1Kq7V6P3OlQF2/DOJ6BzsLiTaY+m27MhHsuu8WMXv+HwwHj?=
 =?us-ascii?Q?/a3UDxWb3kbH0EA8AkUthq+/3kf+6e6hYLXJNwdZYJlaN1u3TtoxFggbjSDl?=
 =?us-ascii?Q?HTK1HF0nJLw0pLgWgJYDif1CNhi6ut96VwlJEjN8GfnP58ycjYCYEnrV2AEc?=
 =?us-ascii?Q?xNJlXB7F659DQe9MqOnJhZVno/UqHVzDp3B/glDHm0rRqLGeOeMXOk2vAFXB?=
 =?us-ascii?Q?P6CowyHQCTGG8ypRPk0D0wh5QNo3U9XEsUS33PWqfvJIWmtmLwOI/NmNNyKK?=
 =?us-ascii?Q?uOVJYKm0WyRN5dTfaTR2On2QD4PoeLy8cF7kFKTWF1lXbZo7EBP1t99YgFoE?=
 =?us-ascii?Q?jxufInz5TBtm0qajevb3Gkou6saEFFmiajwIP64bEISm/5tDC/2wqvJXgA7S?=
 =?us-ascii?Q?j8X40JYcfR4uEwKVjjaVTzKzurKdfQz6RVLwQcyLFB3T9Vi48GYuW9nS48gE?=
 =?us-ascii?Q?ccD0qQUlLXedcngQdsW/jFo+QHQ4lNigTEZDKDiupk/k/Mz4xu3kMfo3u2Ai?=
 =?us-ascii?Q?uslHiEHtGDGpcgVrrFV23iYhqoyCboKULK2i86hlYvYtWndvsSo4+z82xF3N?=
 =?us-ascii?Q?yeaFCdmvQAzfkJ/ua0IjjVQYdlE6kqQhNr78QxQhDbhLxBPyNlDEAUs9oHnl?=
 =?us-ascii?Q?pb6cgjTL8aqeWbtdz8jiSulsqb8i7603keg9fDrOBsKZQwiLlRqKzX41Q7Cq?=
 =?us-ascii?Q?y5r1bkAyMXYNUAH+8c0TKlNo2e5BhFAPaedaCf7vs5vAL8weVFxStDHXgvny?=
 =?us-ascii?Q?JHtHCMAVF5XwMPdQycExeIGc2sYx37LjN+0Y4GEMpkXC/PqBPtEm5QCqCUll?=
 =?us-ascii?Q?iVU9oI+5joNd9Y5kipd2VJmA69rmaNPLv9Z6DALifN07fvhMWe8a/6U/fTNF?=
 =?us-ascii?Q?6Eyg7eOBUKamD/L9I6X8ZrgHNxIU9aYiGipCmdNx/kNuho5DfvjWbK1vLvoy?=
 =?us-ascii?Q?YpYYOATxTcNbbADO44dF9x/XZWIlcUM++VIFBux+9LHOIM68kHCm3/FROJz4?=
 =?us-ascii?Q?XxO/sSE9oW3AeB7l3kRAW8MvZ8VfjILhiDrwrowTiMzmehFEdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOKcVtxZ4X6hGvdVkU2ez5R7DrpbZ4F3wcepzhb/uVNj8YCQ+mtqMLSXIWDI?=
 =?us-ascii?Q?GIMdrD9g9wI3qD5D8fz7GHla1D57+sL871XffHvxlQA10o5d58Eg26BOWefv?=
 =?us-ascii?Q?4YdIR0shEcIxgXbkVqxYm4V/qu9QbrziiLL0yZZXN9fnjVdIltiYra1NN0FC?=
 =?us-ascii?Q?25Su+q249yAAXXrDLtE3APoGqlnzvY9GkU1hkmPdh6Uz3aMja73YC9fJBzgK?=
 =?us-ascii?Q?09uy758Rxi7vcu7NqRY4zNCcMrNZTqRr6/h4b+QENUKJd67aDiO1s2KAt216?=
 =?us-ascii?Q?vbz4WYkoTnUA1ZtuBuqTMx6G2AD2uWPVsfbsITqcy/T3pxsVRoEN+cvaBKuy?=
 =?us-ascii?Q?WyEFWcB75Hws53yf/ikkzTFRh6YPdk5YuLRk++BXt+gtXIng3Wry2RQqUKA2?=
 =?us-ascii?Q?xTQiFa4DQRqwIWnnqYhOcI+VHFiC8JL4rOtXSGBtswrp95GxcAX1Up2Mqt/+?=
 =?us-ascii?Q?jVJATHO8YFZZExxil138v+7RgmpYE6fWQvwyz0aVn0zWDE9EcP1aPfrJZfB3?=
 =?us-ascii?Q?S/G9eUlfC/qnSjvkt9T9FDUmyXltPeOK1H9ThWF5rAmMt1chAQUcAbpdN9Tc?=
 =?us-ascii?Q?EE/BRZVbFzlhLkzoWtKE6uCz1hoNu9n/GR7wjjt4IEVMarOKLJiDycp30wvS?=
 =?us-ascii?Q?5q4KBTtCvbFHFBJUqP2tEqpg1jF2QQHzKC5sbOXWZkB96iXcTILQB6Jl/WSz?=
 =?us-ascii?Q?qFx6ZdxIax06S01PE06p4BLjFzEE51lq7fjqh00/yfRhlAOvIHzssLvsZ2Qk?=
 =?us-ascii?Q?KE1t5ouTmlPuh6kuJMwIHUoe2O9hpy9FyxZdfUm2O3J7btkRryjQ2mirCm6V?=
 =?us-ascii?Q?dnJz85z72nVCpvU5aT7wBU3gFhTpR+nFymX+67icASZS663f37AGEBDNVSdx?=
 =?us-ascii?Q?bt/yfCQ6mX7uc2En5nD7RUfW/z4/5tRFabdZYsyYHe9/A/Uemx3p/D3VqLXL?=
 =?us-ascii?Q?Ez8E+HZHJkyeRnFLAbsNTkSZLH2wkudEi8e6fUMXmJQCaVvIKkJ0fQuu/r2Y?=
 =?us-ascii?Q?BynGy7pK9ijKUGNuxWDSQm8ppUN5UAYtPVf4FH9VZWY2nmeKVlTSecf6rjyr?=
 =?us-ascii?Q?Q4wwvq4+KJo1kAv+tbW0bDMR3O4mY7d6/XiVyhQk4crjYcz1GT1GHU3XqFer?=
 =?us-ascii?Q?FvdQeQkv3O9b6eOuJGD4e7su63zTUwHrlNkvk7LACPC0luUwU29d8fwcfhZC?=
 =?us-ascii?Q?sIMyZmokqcSQoFA98qDrR6ftN+Wh0X6+a1XJWhlv7/V+h91qClF11S0JOTMR?=
 =?us-ascii?Q?QZeZD5VfsPHFnkYBOATCqwOL6ZSoFOg8xg4PN84BQvM3dAJmck+cmKX21Fwi?=
 =?us-ascii?Q?V4WEcAMgLiRgSp2+0za7YyYZBqZ170Y6HPdo1u5BHJSw++1cHI+XRd1BRP+Z?=
 =?us-ascii?Q?YBXE26tgD55BPiy2XcD9QnBZNZ38hMZ/Ei3MlJaSTc4to1WFOslVfv5v0WU4?=
 =?us-ascii?Q?a2/wl5eqTze8DgJM6jc1LSyHxvwoGPN+FwxOb4k/yHCDeWHfNlHaeGi2sxoV?=
 =?us-ascii?Q?6YNUWCqdutFw8MvAkH3wJHeSlwc+sE4Kn7gGRGZ3+/nJDO9x8KLE8xkErTyo?=
 =?us-ascii?Q?P5c4LAKYMgifHdz2TzCsc6g/d6Mzigk8FDCU3JD7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17122bf9-4e57-4d90-ef9c-08dd0d5b37cd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:12:39.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPkOsGF0ITbJcklU+3+e0PJczIoWZimriBS8m7bHxYG7AKxu2HhrR36+85mFJxuK2cP2BtOAMwIpVCYbpmv/CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

From: Carlos Song <carlos.song@nxp.com>

Put runtime pm to resume state between suspend() and suspend_noirq(),
resume_noirq() and resume(), because some I2C devices need controller
on to do communication during this period.

The controller can't be wakeup once runtime pm is disabled and in
runtime autosuspended state.

The problem can be easily reproduced on the I.MX8MQ platform:
PMIC needs to be used to enable regular when the system resumes.
When PMIC uses I2C controller, I2C runtime pm has not been enabled,
so in i2c xfer(), pm_runtime_resume_and_get() will return error,
which causes data transfer failed. Therefore, regulars can not
be enabled and hang system resumes.
Here is resume error log:
[   53.888902] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 529, parent: platform
[   53.897203] i2c_imx_xfer, pm_runtime_resume_and_get is -13
[   53.902713] imx-pgc imx-pgc-domain.5: failed to enable regulator: -EACCES
[   53.909518] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 12331 usecs
[   53.917545] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 529, parent: soc@0
[   53.925659] i2c_imx_xfer, pm_runtime_resume_and_get is -13
[   53.931157] imx-pgc imx-pgc-domain.6: failed to enable regulator: -EACCES

I.MX8MQ system resume normally after applying the fix. Here is resume log:
[   71.068807] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 530, parent: platform
[   71.077103] i2c_imx_xfer, pm_runtime_resume_and_get is 0
[   71.083578] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 6490 usecs
[   71.091526] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 530, parent: soc@0
[   71.099638] i2c_imx_xfer, pm_runtime_resume_and_get is 0
[   71.106091] mxc_hantro 38300000.vpu: PM: genpd_resume_noirq returned 0 after 6458 usecs

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ee7070ee9e6e..c35092726465 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1770,7 +1770,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);
+	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED | IRQF_NO_SUSPEND,
+			  pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
 		goto rpm_disable;
@@ -1894,7 +1895,36 @@ static int i2c_imx_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int i2c_imx_suspend(struct device *dev)
+{
+	/*
+	 * Some I2C devices may need I2C controller up during resume_noirq()
+	 * or suspend_noirq(), if the controller is autosuspended, there is
+	 * no way to wakeup it once runtime pm is disabled (in suspend_late()).
+	 * When system resume, I2C controller will be available until runtime pm
+	 * is enabled(in_resume_early()). But it is too late for some devices.
+	 * Wakeup the controller in suspend() callback while runtime pm is enabled,
+	 * I2C controller will be available until suspend_noirq() callback
+	 * (pm_runtime_force_suspend()) is called. During the resume, I2C controller
+	 * can be restored by resume_noirq() callback (pm_runtime_force_resume()).
+	 * Then resume() callback enables autosuspend. It will make I2C controller
+	 * available until system suspend_noirq() and from resume_noirq().
+	 */
+	return pm_runtime_resume_and_get(dev);
+}
+
+static int i2c_imx_resume(struct device *dev)
+{
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops i2c_imx_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend, i2c_imx_resume)
 	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)
 };
 
-- 
2.34.1


