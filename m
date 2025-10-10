Return-Path: <linux-i2c+bounces-13441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2504BCD4C3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 15:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3804C3545CE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 13:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1912F39C1;
	Fri, 10 Oct 2025 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="jTiLBbkI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02912EE268;
	Fri, 10 Oct 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103359; cv=fail; b=MU2bM3EtjFh+jQlY0ktzWLEf4tfoNpgKGoifDQ67Iao8ftrUsOIeyRMioWZpBA1h6RuAeUlGiFZrQ+/cpHHvW2t0OjeL+clmKA2PvnsLdib5kNRgwWVb7WhJz9y+CgDGH4i89BmFPTBSFms1eu2JWtZQrwViuNlcrCxj/od86MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103359; c=relaxed/simple;
	bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HoE18MjV50CnEAJ7X1M+cbe02y67JcFJf/WYZfqHaOF15q0Rs2lefPkw+nMbrZe0R6oJqXqPclyW3+GV2uXbcCMThVWUfm26YtL37DLcmQEXhUfxibn1x9yCJOr1zV1bDPG1ax3xppzo3Ngak+vmbwYYiMVMGDRFDPoC+g/fy30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=jTiLBbkI; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDJ9Rjy7GoA6dL+Q8Kg0taqx+iZBMZdZNTgfHnx4/3RIOMO5CFu6ASbPLqHWQjZYsatN8RcQElAa8xmuW9S3l1JqVQfgiytS+9UQzrfINMy8pOhBAWJJB19D5vNg1R+p7Dw4QHWd7JQ2TZDAlQZ2QBYndgxISHM8XsK8jWq0oKRkYshDKpuTAQjHja8o3nhA1nrbdEu/CWsIIZ04OU03PnbHf75NrUz78FLS7OjZYKIqpNRNNrnKJJcKFsTP7ECVn/82mJFab6hJJCxjV0JtlDs6Wyf4eWy3ED88nZZJAh399fSS5sUD61/idAu3MXxi/VioOr2E5ldH6IgR+Q5Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=oAP6siXNxXF0AogHDlbTsUyZRDPdHoElewX2ewMSp1ES0PpMRZrmCWlvxwSsEBaDpAnXeiBe6+SlF0/dS7ydoHLF5pHkvtglGZHACIjgSdFcu6WYl7p8HIWv7HUh9oX8dRlaru+3UtMUIUgy+k/0vrlda/pglvBtvTrj5x1rA/9ebRnpLHOsiIZvDt13xO2QzjqIlYdTf8PL2Yo0CG3tnMqg33lv4zJxintX60fuBRLRFLJeGz9InFPBkYmU+96rk0Wdak3b0H8U7bkRHnJidVWUCzbonn2JUXKcnFrYDKeQhr/qq5pDImD4QFxfn7us5LVIw4P9NiYMrsUmxLMg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=jTiLBbkInZgWPCFmAjUsHIP6RpLRvyVv+UeIXAqy66lGnkP+oAvXNR8lS2mJucz1Qyim3Z/lT+BynhpZ9jXPq+ymATImOwZxSpaVo8k5J+v64Yvc3bm2Cz1TZV12EbJplSxNJ3N6upEMFGPksXdqjgdTK3fcWlEYygg5UHr6dfQ=
Received: from DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) by OSKPR02MB11458.eurprd02.prod.outlook.com
 (2603:10a6:e10:98::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 13:35:54 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::bc) by DUZPR01CA0048.outlook.office365.com
 (2603:10a6:10:469::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 13:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9228.7 via Frontend Transport; Fri, 10 Oct 2025 13:35:54 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 10 Oct
 2025 15:35:54 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Rosin <peda@axentia.se>
CC: <kernel@axis.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: mux-mule: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <pndh5ymm7te.a.out@axis.com> (Waqar Hameed's message of "Tue, 5
	Aug 2025 11:33:33 +0200")
References: <pndh5ymm7te.a.out@axis.com>
User-Agent: a.out
Date: Fri, 10 Oct 2025 15:35:53 +0200
Message-ID: <pndldlij2va.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|OSKPR02MB11458:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2e1c39-0b76-4127-c4fe-08de0801f00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EFTr9LQnsfLC9RIAYC76QUs3zJFs6XjFTubsb49Nc3ZkePmfCvEJB78Ybxfl?=
 =?us-ascii?Q?qh+Aus8fSWSBPgeffKAoVdYRtxov5LX3QcRAIc2uR+CVN2ws9vilFt3opS6p?=
 =?us-ascii?Q?3sR0aml3ZawZ2jEWHQ2iacfjJu93oRcST92xK2ApsidzYAL4OP0Wqms5gWIS?=
 =?us-ascii?Q?FNHUrKovKImtkEvZq9kHFn6icDYc5BKU+cla3HtudS3zCWzHy9U4+lr6vFmL?=
 =?us-ascii?Q?pDOxW/HOhbn5kacDmF1Z21N5CWbax/MKtdUjRWR1MNblMqDOZSmqfwifRdqL?=
 =?us-ascii?Q?OQ/XPAugq2F8Mgl75xF7wP+aKJadtnv4mJjpXwsAik9p/YOWkjwc9j5GsKNX?=
 =?us-ascii?Q?VqFgpyawrujFJlyJvRzsBxBaM9r41iGI2DyhTJ/oPfLwnAn5XHqnXFx+d7K2?=
 =?us-ascii?Q?ZVbh9sRXNWzCzWMc3iadMkzsS8rYItWcnzXo4sfozgYJOYtb1Xj53LRz16ua?=
 =?us-ascii?Q?5XHka1jdiWbgJDr2GSu5TXM/13nd29s5N+DyGUQVRdqpEFqQi9GwHe/wF8sK?=
 =?us-ascii?Q?Rs1ugdXYOQJ0epNjnySiY4Ymbl2Rwc9ya0/tiTw2doaWbVRiqijEfkp7JRP5?=
 =?us-ascii?Q?LgTstiBQvA5Q0CA5JiCEYruBU0pcIH4Bj6MZG3BRcp2Z/uh2HqNHydKDXWks?=
 =?us-ascii?Q?x1Lx49GN2TK8u0SQSEGc45kC4wVHYqH+28DMZd2ViREWP1jsExFqIBL1YoER?=
 =?us-ascii?Q?fJMTtimBSfExTjFfYlHUL/IUvmcD9BJ0lgADABTdEET02VCpitlv3FlKxWD4?=
 =?us-ascii?Q?pn7dzd5ojr++bFO1doPINL5S2otafHj4f5DkUDpMYrf0hjcRwDj61DAgZAMn?=
 =?us-ascii?Q?3SMdwRVi+ZkVMt98JCWC9eVWZMESKrDSF4eKSHTT6w7rBFpdrm1DR9ECZR28?=
 =?us-ascii?Q?RfqAFmHyzawW0fUtwulGPdGXlR9mHofht0IT5Vy2+gRzXjML2RH/q+6iTVOH?=
 =?us-ascii?Q?F3ctvA/FmBzoTdXhDIqOdzg0FErgLy2/2DA1bbhod1wmq2x1yzzJG6+qL2dd?=
 =?us-ascii?Q?SuyX4eVzk+xAmmwW0hf31iIRBlkhrfFx1iXAAk1XBr0NLYHC/FVMRxUr6JF2?=
 =?us-ascii?Q?FLuV018LvYs7kXZ4F9wOShOscbpJi/rCNMH1qNtl/F8k/K9JL6vsligHeU51?=
 =?us-ascii?Q?6xjZN1Sg6GWwt/bVVzSckWJiJYvU2ruzrugcmGD12EV4Eh6Q7iYjUQjflkCi?=
 =?us-ascii?Q?Yx9CjNwhByDpoZaMsL/hLCFazOr8LiA40oE96vRvNyxuDTnf81TAbqZsOdAw?=
 =?us-ascii?Q?f+cSSTwAnNt/c17fX61guV6bK2PDnEDiznr9mYP32x8GghxDyAP01DQtyrvN?=
 =?us-ascii?Q?LZCE5GQV+2ZJxvUfKcmSKGpRGst4d+BL8kqOeuBP5SN+3MmrgeLswiWcJVEP?=
 =?us-ascii?Q?Fh8QaTVG8DVWkrEeggJB/50xdpK4WXHSWjGZi6BwxFSIPVXlO5mk8n8rMfUW?=
 =?us-ascii?Q?yafe+Pjg0yvsD1fDobsb1AGs+koEroOJNO9qwsz+onFioU4GZI61PyVFCHk4?=
 =?us-ascii?Q?N+jLd1g4A1/t8i+UTfs8kKDRqN04Prj/BddTT+kiSjJfgGB9PmWMBeFxtybq?=
 =?us-ascii?Q?Ai0IZOAio+z2nNhNDaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 13:35:54.7567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2e1c39-0b76-4127-c4fe-08de0801f00f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11458

On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Friendly ping incoming!

