Return-Path: <linux-i2c+bounces-3444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F678BD7D2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ABAEB24A6B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9080C15E203;
	Mon,  6 May 2024 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UoZt+Gic"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F115E207;
	Mon,  6 May 2024 22:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035981; cv=fail; b=jCj1fMBHPX5FXBaDV4FijMr/9W4jvpkYQZNNI2L38tiBLsuejdU1Onk35rvLSDN4EdJsKHySZwtQpZ5GhcUiIB/w/j7x/Ce07mrrwvzyxlgmpz2Gzdkpg13Vq7VJVQa9TlSh68TTkvgJ8ZhiBYC02HwenDcFtNdfNJ/nL4gYzWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035981; c=relaxed/simple;
	bh=5sF5H72vJEZ6OOrBy78Ol32EOzCGpO0XtEnEeSmuAVA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afOZ3lgfORB2XjrsqnTVPgBYKA6tClTrOoQEoLIwMnWw2l+GnGEumnLHD+Up9BzRYWp+/U14mkC16YISBO2NXTtgzu/KpygC9G55uR1nLfGOvSe4ST1PINonq5WHiizaaoaS9JwQWj/U7Dob+5Ykeer8w+fSb26fWyruUN9S8Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UoZt+Gic; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/rNKpzM3NMUSIfiLtDVOz4wYQVjnqmHVpovpbHgLK/dlaqNa6hJRBujAc5efLbaaFIaa8EFap63jVGZuLh6vG1hhEOuyKO8v1sFfLqPXJXI9qrs30DxL8n0F9xN1qOtOMINLrRJ63N5RunVP3S//L1+4XTumJ4xPLArPGITeOLPTJXpZ/AdcLK+2g6TxnLautCNPICCjNqCxzZJCmcVtCXs6nBYPrN5UagLZ/uWOkZAP81Y/hl7dUxDprPLk41a8Otp+jiQKsTFD4aLguyWhLXjr93ldheOXI1XZJOA/gttYMgoD1w7e33yQO5IwhnBdCWpZP3YWtXuk4P8hYCcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiQuF3eFUeh98VKG/OOdx5BnftWfQCDIwqUhGxsFYhA=;
 b=goyOKxQWlnABkPIHVVq77c/3puQFJzn+fviP2NdrqTU1c5mMZOHcUhUtUUznm4Cs6TaKHwItvAmBs08j7+nNqqJbHcZFXE4fMUz+M+0/HtKbvWutIrQC7wyt7cD/gpYuHLg7TyMC/yocxgBc0mqj0spwmUcPQgvQR7FZF84rvmyOcVqcj8/UfdfLAnfU/CBMuhWGXriuXsuEVHSnNL7rWbOQ2DFIZfTK5L/Yy1HcUqaEO3Xs3GkkOnf3b3f1XiDGprAgWGtvN8BhOyBGBCZkE58famTnS0jJbrEpea4uZjDnWkSPfSezAdR8tGzO5N4pCVlr81pjdD8BPhpwnT5SbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiQuF3eFUeh98VKG/OOdx5BnftWfQCDIwqUhGxsFYhA=;
 b=UoZt+Gic257k+TdbbygKPAZlD4otmCpEuu59efSWeD8D4Mz0hNqXaJyr5EyKphZpn66SN5hybkOUKzyTe+xibjdVuWnplt/ADW1dD7fbnR8sS+NQ3oOulOxZtTm2VohhSynf1IE4W5nzSGHYi/Y3VlIusu1oCGEAwakx63u1Xh8rNNDmrynZBSW2d8gA0C0fRDTdzbVNXFJ5n+BO56Y3/SpLzWrcu8Pu+PQmcu3HMamVd1oakn3nZtIw98xZWQ8dgCRbxKFbx1nBHA9tCmbyYu/IlY/s9xAFlRPv66Hs+CffUZN/48YSiOoyz26ijAPPrfyTseTh2H7BHnQxUkxIQg==
Received: from SA0PR11CA0039.namprd11.prod.outlook.com (2603:10b6:806:d0::14)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:52:55 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:d0:cafe::9e) by SA0PR11CA0039.outlook.office365.com
 (2603:10b6:806:d0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 22:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:55 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:37 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:31 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 05/11] i2c: core: Avoid config node enumeration
Date: Tue, 7 May 2024 04:21:33 +0530
Message-ID: <20240506225139.57647-6-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: e64133d3-083b-4203-8d9e-08dc6e1f44ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|7416005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RGuqQPprSyssS10SII/Ii9ETwLXMBkUgJ/vxiZ3aHPy4PghRyIaNhozF7MgJ?=
 =?us-ascii?Q?4herMAyMACEeSdfqo89nG8loit+zNeIvcUqX+uMWXo6IVoX1KnIGNBVhccDk?=
 =?us-ascii?Q?grb6YNSVdxZ9r7jHJJNmZxR9LntS6s2QmkBediY4XKY9fHN3FJI2H7LgH7tV?=
 =?us-ascii?Q?UBfKgvr34/SkAGPmJ93mJJFXbIQ7+qkb8SLskQbsWgzphr/0Nz7f1GIN6bl1?=
 =?us-ascii?Q?QrYvdytEgTnEifFeIozbH0COidXKigitMcfIl8z0oDtU1Tdwr+rz6/0JxfeI?=
 =?us-ascii?Q?bPD5HX4inzlcpdxOVPtLkI7CHdGMWWwLIWgEWFVzd5TfYjmFu4b/w6Mf+WoZ?=
 =?us-ascii?Q?0NNISrvElhko+gF95zhMTDhmDmYzb4IfApe6QoIdyM9sYfHcBD7hQT8Kgedh?=
 =?us-ascii?Q?o4aF27qfksa1SJH/C/FHVyEEURSaqj48BAPKsayHNRniiHDzf5JCZ6q7mvkZ?=
 =?us-ascii?Q?hLpPo8yMWWlwTn4ZxsE4U7aTBrkc3KsM9/dTdBd11jybdwzcH0xU9W/nIOd3?=
 =?us-ascii?Q?WrVGNwT2q5VIqpPw+TYFwXtetHMO3fURGVsnVtl6n3Siydsq16cLgaT9VOSA?=
 =?us-ascii?Q?CuFZFnrM0LXPd9JLO94WBGK4oYdR9ZWQLEcceldhAKE8K8F+bhYPAHPAtiHl?=
 =?us-ascii?Q?xsbeNwGHFoprhcVptZf7sHu66zrys0zodPEZgi9yOoF9ygU51f4hbptte8Xi?=
 =?us-ascii?Q?WfXbCwbC6CVN/dWv6Ii5BR6POlmF4064NlSggNf+W2MOTvbgLVSLDjzs7DnF?=
 =?us-ascii?Q?ZVovk4xdSIpqyjyTCDbrcNPqwdnR/a+di+Mt9aaLxlpQd/H44vZ4Uce8kmJR?=
 =?us-ascii?Q?GFbCKYpV93PkaqdtpaJqSrRmj/+wi3LLU0CexQE8UvhBsAl8ayC6KX2VVMJw?=
 =?us-ascii?Q?aYdC/4l4dzpeSYioPad6RVcT0GhC5arwyMhuD3wv5o4HiF/exdyhSCAvwoJ2?=
 =?us-ascii?Q?zRim+ZRH0BcqpxOXhS+hCRBDayf6/oPiya6W2AGfqSKecwNtHDMthl5B8Nf9?=
 =?us-ascii?Q?sfol06x//SgkUJRzhD7YbJobUluVw1nhVihEh4PFidoSBce2/Sjqr0sooKEn?=
 =?us-ascii?Q?rCrGtWFTxQT3bW46WPborfpuHTdIdyfV0qaHHs5gaxKLaXvxTR0PXr5kVvUI?=
 =?us-ascii?Q?Q0OVNSbby6BE1eYUmBUR9iynaD1SKp2h0AeOpBp4uyxfumEWhx7Z9yoykS0+?=
 =?us-ascii?Q?zVdDDUkYYqhmkPiwq96inCto4szGosuOy71TzU33MH4qGqhm/kYn8slLU2kT?=
 =?us-ascii?Q?sZWGQOJ+xcgHKSy3GdL2nWUvQIZ2kMDvSDe7uRzCU+rD57Ml4fKCbk2pPLyE?=
 =?us-ascii?Q?/LKkNB/gMultvx3vFa7YvRUBFBviaylXxlAe2fC2hI7m5qQxsx5QhVsKNoLt?=
 =?us-ascii?Q?wOk7C73Dm9L1fg3IwpWRTinef2rq?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(7416005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:55.3718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64133d3-083b-4203-8d9e-08dc6e1f44ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895

Add "config" as a common node to add device configuration settings and
other data. This child node should not be treated as a device.
Skip "config" child node during i2c device registration.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/i2c-core-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..f50206c6c4d6 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -98,6 +98,9 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 		bus = of_node_get(adap->dev.of_node);
 
 	for_each_available_child_of_node(bus, node) {
+		if (!strcmp(node->name, "config"))
+			continue;
+
 		if (of_node_test_and_set_flag(node, OF_POPULATED))
 			continue;
 
-- 
2.43.2


