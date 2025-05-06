Return-Path: <linux-i2c+bounces-10813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1DAAC0A1
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55981502C56
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BEE278760;
	Tue,  6 May 2025 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YYfonu6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC80272E7F;
	Tue,  6 May 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525612; cv=fail; b=OrEllV2MsjSRI+Ue2MxY0+bvw4BfbWomrSH3xcNCGMxkavgiaaNAquxwexgHC4K/mEbDSEjdn/O5W8GEiYjCqlnqa3aEX9YptE0ny5OWiwbO448jxtH31ZBU/MQXbQwUh+MX4NPIUT1I85ZQzEqWCOsmNBY+l/V8mYEIeKPAbk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525612; c=relaxed/simple;
	bh=n0/s8Z8HB0LJ4PesfkNlyPZrkzp3w13LcrcXNIv81ws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u8bO0OC7UDvE9ZZp5ghAujoI2UY5xhbeq5EAreHCEAXRMJNSutg2GA8ummynWrmZ1r4+uSMpVfe1UfuNG8KW3vj9ARuzrBaufKfSUzyY3Bgf3xcgCnArzlTs7WKibyBNJQBLCsZHfdo+mJrRS+fg3krqN/xYfs//Z36iP669j00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YYfonu6z; arc=fail smtp.client-ip=40.107.236.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wz8Fq1udWUz3tvL//eJKn8vEcfrY/FvzjBZiw3l1kDkFj5aVhLwyk2PD1m34STLRHn2c9yrF3HJBrc5vyF3I9MOH1VWLkOMXvpG0iqzhEe0+RqWOqSxGdDjH0W52Y/lAPXK4piyXh7o48epLNI8CogPgdmlmyQVSnilWaMzsSwj9AuvUmK7uzHVRO5uGS7Nn0B1AkG5lhBCFR3OBQrQuCLG8iwGS9E93RCydMbcll9Lrwm1kDKSSNhE9eSO70FyjK/ju/82qQpjAzdQ2nwkZV8a7jhMTOOsIIevVrX2nojmE7jt1yeZj0yfcsyw0Q2hRQzrI8KLo7AtQtijf1JOWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHQGoQhhqKKSxOJkjhTNiEHn/D48TFXDU9WpSaYx2Wk=;
 b=YLiHNTXfXUyIJbSKjB1n9o5T0lMj0HM4KkFNILJ9KWrC8XjlMOca4R11yZaRNNWqOR5Cx1yz0VGFB9jeJFBti94b5nWakeo0Pc+HPwUbt9VVMrG0cAeDkHqYclM38zT7tYvZWff+UzAmpc7MIjWKi686p9/2NuCISfo9QLFUHEcGT3WvQ5B7vRH7GvDe4d82zQHnFwFFTdZbNWB8Q6/s3UaINVje0H+lDZCXN5QOzrChJGp8imilqHe8fXJeBVAQKk1ePkEOKJPvGqhYXz+j7HvjlGVAtRWwqC4Z736SCyPMIIkhN1+j6RHjp1Cc4NMNZh1i6v/t9s35tTZu8A3nZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHQGoQhhqKKSxOJkjhTNiEHn/D48TFXDU9WpSaYx2Wk=;
 b=YYfonu6zN4DtcmBUufyOBw+HhqRXsXB0trDP82Jw0vC0so+GgvadqxVyLHzvb83+9g8mEO1i87P6+PmUR7vWFJtg0Mc//Lj1Ea746mmsxt29prttSLkBX5a9wIjMYVJ8mvoKSaD8OPA5kq6erj1fA7GqNC9iOb+cdQd2Bqc0Yrfu9rtRbLMQOHG4TrtIIEgBGYD/eR7CW/gaZ2RQBJtac84OJeuvuE4gFYnZB3tRWyvjm7DR04aQHDxKbqc0hGe8bqGtPxwqsVajeLi4siypIEAjvdf17Oho1LQv2nl2sWmAXu6MBh0X1SbW1BC7rmUJdJ3/O5EqmQkuDNCaTQzFxA==
Received: from DS7PR03CA0080.namprd03.prod.outlook.com (2603:10b6:5:3bb::25)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 6 May
 2025 10:00:04 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::92) by DS7PR03CA0080.outlook.office365.com
 (2603:10b6:5:3bb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 10:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:00:04 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 02:59:59 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 02:59:51 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 02:59:47 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Date: Tue, 6 May 2025 15:29:33 +0530
Message-ID: <20250506095936.10687-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: af0dbcaa-c5d6-42be-1d99-08dd8c84c606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9mbh2itL4g9ZbihAdXoE+0lXr9PaGIPZnbi2Ptg8LY8x+I3LrEcyf0WHMWhq?=
 =?us-ascii?Q?Hz5BSPiAQnxWS1vHbwbJ96WXi9Lamtv3ysPuTESJErnT+1PW+DmYbN1DbSF/?=
 =?us-ascii?Q?XbJhiyrYWwAKyaJLCoM+Uxw0OfH/iBmIdWoh8TrsLps3+lDEC5Ozzm8xxpqB?=
 =?us-ascii?Q?M2nP4FE+o0WjT0Qg/Q1DLki+HJD+Qethk/rRW5ayHLnFF1AmwuTQcW0jSiVI?=
 =?us-ascii?Q?wMGvocoWNDskcUF7cGFF6NiVy+vQxkwo9oawkHTbIi2AbOe/ktnvXdKD/nUP?=
 =?us-ascii?Q?gFO6DFw/lsJf79s0oJpTiayD0qLd2EYn3CcpIabBzaD0j//IwckPsEODWl4P?=
 =?us-ascii?Q?zNPVOu2ON5BGzZU7FJSCc+xyJtvj28Ze94rlXUy5ThQdKKQfYfDykYSDhpcQ?=
 =?us-ascii?Q?+Wx8xLmW6kzZaxow6Hmt7xByaxDdhF83k86a9lD/Fw9kF4RfT5Zgxjg15hr6?=
 =?us-ascii?Q?GoXVHbH+hBZdxtx80cP8r/XvaJ/UwSl5wVQkcpfNxbzVSlzrukSt+gj3Nl10?=
 =?us-ascii?Q?gLv0ENHew8cccJbnIewaw6t3u0m7dgwssBo2odKcR5FGSq4EXPBDgLyJSLoU?=
 =?us-ascii?Q?kKb0VQd6EI27kBdU9Ipqw/TwJ5tzQsGHsRdn0I0h66nSmIrmf5DY1nXp66A5?=
 =?us-ascii?Q?jmNCsctGgFViLKaru58GyaH0wCr+r60dGCLsfvunjexHP9GQVfSaKstXwqEM?=
 =?us-ascii?Q?TCvWkhAAzv2yBjmchxjYGPqSqpfkOCFkJhTOFVe3EScdHbDte0hp544/uRZx?=
 =?us-ascii?Q?DAU/o5etDLWyGbKb8LlswVpqfswVAKAMqc/5v5j6YAwhTEkWdDz4ZvffOP/V?=
 =?us-ascii?Q?2fSFd9QT2AtMQrdMCSpBfRykron+LmAM4ixx3jDpmSXDudIVtVnWb9BzffOy?=
 =?us-ascii?Q?Lyq7XEIqm6iUDVwRZ2oq3Ld1eoXT9XsJLHhwC4qq71wMZal45pIdyhoag9f7?=
 =?us-ascii?Q?+w84fFhtpkh9xM4CX0Y/4vhPa+VDfjfl2vypkGwHPYcrc//qi++1x2dSwUIy?=
 =?us-ascii?Q?+gxmPDVjrlkC9NcLK+d0WsZ1EWRlg60VJtWU04GgRwQPK+FM8TjqGqygeUsj?=
 =?us-ascii?Q?svXI0/KtTO1z3GP9ldZPN1oyG6TaapCD5onDoBvcqihSSxGawwALl7hQMIKk?=
 =?us-ascii?Q?b/B9aZFzl6QfcFxP2UxaeeoGZS09r4SgS5Lud0wMXqRIs9mkhPZQWl4vWc7V?=
 =?us-ascii?Q?8wTR+zFdRU9X+ZP5G0BhTM4CsR/tE+MWWcySG7JoSyPbPzhQa/+wnnXfsoP8?=
 =?us-ascii?Q?fTbYJHRF7HA3+0HNmRplPJN73ErKtR2wMcLaXWgpg4JiEXOhXaQzaOuCthLh?=
 =?us-ascii?Q?7cj4o79dr3PAHxoAwYvzjkfUzh8iKHHcGLzgG7cnQWBTGEpHO7ep5W+BYpZZ?=
 =?us-ascii?Q?ZnQTS1CL6G8lDCuROUwFTj0lT+mlfyTSj2b22MzDtSMkBbjPF9tJo4iRkSBU?=
 =?us-ascii?Q?LR0tpWDO3qj8EwcSjGKmmQrEA2mzhok+nNN+u7uPsjmXzj4adZ/rOnSt+bmu?=
 =?us-ascii?Q?ldz3dY6q16vMUTVt2SV8U39K5lWx0+28aqrbnidvBXHzAfwviK7iGwTAjw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:00:04.0812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0dbcaa-c5d6-42be-1d99-08dd8c84c606
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428

Specify reset as optional in the description for controllers that has an
internal software reset available

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index b57ae6963e62..19aefc022c8b 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -97,7 +97,9 @@ properties:
 
   resets:
     items:
-      - description: module reset
+      - description: |
+          Module reset. This property is optional for controllers in Tegra194 and later
+          chips where an internal software reset is available as an alternative.
 
   reset-names:
     items:
-- 
2.43.2


