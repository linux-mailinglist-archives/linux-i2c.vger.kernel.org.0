Return-Path: <linux-i2c+bounces-14913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6ADCF7FF1
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 12:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C2823081110
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373F232695D;
	Tue,  6 Jan 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fKCqf/R9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881F325720;
	Tue,  6 Jan 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697867; cv=fail; b=G2dvFRbTy23/tRCHNiPhZr+gyekppFB11XAxe6EvDeDZi6W8WTB0XUcU5EJymXka05cnrfmHcaOFB3JsIvnB2ddw9o77Dikiew2jRNAEVdgolIoeioeEXphX9oX3PxG5a2eWXq82fauBE0pMiCF54Th89IIK8/++9ZwLZknXpbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697867; c=relaxed/simple;
	bh=pN6VLF/CUoarCaRcXvlKMYzLBcZHkPN7SQDkkPrzWHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T7ANAriToyNp4sLFcmX50AoRQbCbWtUftaT88F4kz2/DrcYJwI5NqCRdyHQveeSjPjPXVZhqt+wP7QnbrABIwco8lsOCvKSl8TNZlD59jepsbLhtYOlhBHSpn+rl8llWiVbGxLScOZPEO1SxbPIlmyC754NyOj4tUnET0Bi7eVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fKCqf/R9; arc=fail smtp.client-ip=52.101.46.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKE2GZ3wWnXzgCwvwQG1u/5qvUgg/aYPu8h3fj1eD2REA5Z/e58A5wKqmVvjnSCc1fruP4vavf25Vr1t819WDtLySsaQee3ZeMkjOTRv+D0FnZVqa6/OEYgstsfaDFku4JzJHx7J507VpNJ7gG3mI/hHMy0S2tj+TbePwAjEID/5AJ1TRPtKM9KZ5AeVevJ2h+rsZXSYXC5JNHEL9UaZSWuwtAxpBVTohMSt7hS27pB5fQ2iwBSF2SzQgHkzmoH0DNYGh7+Uq7TmsLyg7BsouhWaA/ckipqiH6Dllks5FZegyQ8R7e8TM1xmBMuIgA03Mdp6KePYM6d5fg6aKYxsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ymDoA9UNzdp3Wu+Q3tsH8ZqSIlE8Ws0Ac3+johsoyE=;
 b=kPbyGZ0Y099GEttsiXv/O1Sa7misMLY2prRSLFaD2bD1UPrSFClYWZfKJShbyOxlHPQatF04R4L7l5OvLVbydOkXNjglLvR7TIDAviLA6IZbFA/Og4a1Gpcn8jufwgSWfrYBZgbPEj24pz8BtZkpqjaP2krZsxlZhufNi4MpUyfG+SQao3qH0Uun8jPkMsX7lvG4Q56pJdeeQazqahYxJoSgnhs7fQisQFsQZJgoX+Yv7vJhjIebhBO8q824tSORpABmK0nmvV0+OWQ+6DmbhwdI8woBqNAegpMVmmdC/URzGVYM3u1lhvEG6h5S6b7/YkFwGm+53APgaeSCmDIuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ymDoA9UNzdp3Wu+Q3tsH8ZqSIlE8Ws0Ac3+johsoyE=;
 b=fKCqf/R9QWYat+yC+0cx1/k7apg13zkgEKA4hm1GaK4EUpxojMfCYGmglYWZMoRsW18Jnhd15QgK67I5PlsdTljPEF8bba7UquebfapzKoHwfqf7OCtzhbUOXGFZ+Mp1V6Mfj3BMaGdvcGUZTNj10mLLr/CTc6AVkq1qKPLQeDeQ2dDflxHM1UsQocorE17HqdcJWWNSCOAo6fxD1DCNM6dL+Es3dVl0HrXZAcf/V/E6bsUBYGrxv5LOKsbcWfNryA0W/PYB3SiCC/kUwm2VKm61v1kYBFvnYoo1PFycmcOu+KI6/UIuSU8ZtVqfLIdcdFD8GzKXDnknxAhMwQ92XA==
Received: from DM6PR07CA0118.namprd07.prod.outlook.com (2603:10b6:5:330::31)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 11:10:52 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::6e) by DM6PR07CA0118.outlook.office365.com
 (2603:10b6:5:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 11:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:10:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:39 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:38 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 03:10:35 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 0/4] Add I2C support for Tegra410
Date: Tue, 6 Jan 2026 16:40:29 +0530
Message-ID: <20260106111033.5556-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc34c90-85e8-4fb1-2026-08de4d14411a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+7TI8DTDLR3fgu8HyyUeimLPs5sRmnh2+Vx8Uu96fF0edGl/K+niq4CHi/uo?=
 =?us-ascii?Q?nKrN9ORdlQL2+1Id1SV6m/p4xohp2UTMWXD413GvYIbecWvvMGmIqhMdyHRP?=
 =?us-ascii?Q?Dl5uUIfBj/+dAKYpQ3v37tpQpIjBMQfyq0wEDR+pVdI8+hcCDU855MVvPTYQ?=
 =?us-ascii?Q?iaNOIushVCHd5y9vfo7J55KeyTmxXlKAAsy3wnRwLom/s+1KXcM8+K8K3fMz?=
 =?us-ascii?Q?8yoN+bGBAQMUz8lDHrQ2UFQLn6pmg/zHOVC3bfsVg5lL46Bi4+baZWZkKvjX?=
 =?us-ascii?Q?K2gULOSoh26nVNUkjC3KhNMuddCVI78aR+MCnmCG27u/c0k9Oa8JnLN1LWbK?=
 =?us-ascii?Q?aWP5kiffTpjnVmD6DydMshOejTk/9H/bMcdCo+VDokjj9KAT6HpDflJD9SeI?=
 =?us-ascii?Q?jdkQ5EXTMhUh9kpmSr2oCf8Zb1iAgH2c5ZEVIWuMF/sDwyd83tkNtssh+9Jg?=
 =?us-ascii?Q?reni/zgD+Dc7OsTuH3MKP4PMd79GWp9/mK/chq8PuHs1cw9n1ztftCzWIeP1?=
 =?us-ascii?Q?01KDj6vsfli4SeTnfmhsV7qXiSSJPGM7kyIECsiseIFAHAFKWtAxpo0X37Kp?=
 =?us-ascii?Q?8uREQMEEEs71n0mD9Jl4i3f7brJLfX30f5w+EGnr20kAf3T7XImhOYD4lwVO?=
 =?us-ascii?Q?2DgZ4U6UvDacY7brYsxV49ZM90hMpfKSfyGb+sUBz3cvUPGkMW4So+moKrvy?=
 =?us-ascii?Q?laDJZgkhzeLQh1Dx6YAQ9tQWckNERghbW3DJutrg70DlTkss/ayE5wbPrXaP?=
 =?us-ascii?Q?GkK1GZ406UlWMMeQkkPB+qSKeVi/KLfCRtxWc3BUrQ8At1vT/GSBnrrxA4iC?=
 =?us-ascii?Q?KkUSdLQSQ0Nv1pwu6Op1g/7E4M8yUX6nhCK95mr2k4FLxcBQMtbQ8OJidTCp?=
 =?us-ascii?Q?eNxxC54kRXo4fkpqmBMhWa01Ifd+KMRsK53vWsTQOiXvcFN+wBk0k3uvyiJC?=
 =?us-ascii?Q?Zcy67PpQ1Jxjzv4nlh7Gp1ZjolUcKfs0VLC9d+pH+LUS9xikgFRLBLZDuhzS?=
 =?us-ascii?Q?vR5T/MR1bABfRoHLdsUnbtag6xweuqKUJ5gq/JmzKYuT1ICKmzn21/DmMeLj?=
 =?us-ascii?Q?UtmT9pU8U7JEd89/vyNbOnZl/6RG6MJQ6wsIbZceJdendhhymnelzX6o8tuN?=
 =?us-ascii?Q?VttBfdM1Bco3dCMjHhbIqE0Ixxnbw+Gi+U1sx0ZTkkioZFeMs/lOeQ7uU0E0?=
 =?us-ascii?Q?sg6cMEhyImVdZHpyyErZeJqduevZ+csKIZTOIN6E9h7Hi32QPm686GMNsAl7?=
 =?us-ascii?Q?WJEEQUSDHlAtiHY38NjcrdPcwhB+SRJz5Ww8mt1pUPEq3H9ek+0N8FIu7dct?=
 =?us-ascii?Q?FprMhLoKNjCb9z7K/10HD5cSfqNiWIBJiUZdGWN9N0FOG1Q2At+hknAwieR4?=
 =?us-ascii?Q?wL8Azu5evbfLeGqQitTp6ATyQzELzgBBEEt0walXqYBDs7aY3QTlCU9r5t8V?=
 =?us-ascii?Q?8TWovtcMQ0PCi11It26ltHDzOl84l+37hc9k3DLI++cfUiQ3Tupw0YjrOeDE?=
 =?us-ascii?Q?3O1KAZr3sL9mgzuWRvio70QBowfnz7vBTh/mlJN5VpncLIv0aTzzf0gz/Ir9?=
 =?us-ascii?Q?QZbhi2z3OVfsHx8zN6z5OU4AT0HjXAQCncHG0jTI?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:10:51.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc34c90-85e8-4fb1-2026-08de4d14411a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Please note that this series is rebased on:
https://lore.kernel.org/linux-tegra/20260106062811.894-1-akhilrajeev@nvidia.com

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 567 ++++++++++++++++++++++++---------
 1 file changed, 408 insertions(+), 159 deletions(-)

-- 
2.43.0


