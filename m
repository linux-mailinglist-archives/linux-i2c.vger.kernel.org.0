Return-Path: <linux-i2c+bounces-11269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0826AD0994
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 23:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5BF03A73AC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 21:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5BC224AE4;
	Fri,  6 Jun 2025 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Odf1V1xo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6961A76BC;
	Fri,  6 Jun 2025 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245739; cv=fail; b=ZJ/gAh2pgaM+VErKEn9if1Y1/S1AXimDVr7F4QcxKy9bVvbD6hOY/6zm+OLKaV6eUlOZEtpy+8MGx78m7yMAZ7Ilt/6T0YJ8AKOsr6jV3j0+/3sKkI6qJL0D8qmadPuU1oIB9gDMXXzkNP3feAzSoWUG1O/0H6MpJZKHtNBo/Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245739; c=relaxed/simple;
	bh=vtg5b9XFBWIkroApGojeWo4ERPUCVy3Doe5O8edCCkA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCzVYsnKgxJ570b1aaA+JcbWgqraDorfmVOpFGvoXkOmScSbZragfLe0sDOb/bBdn13ydKtBpMz0JEoH7kU1wfbJ/8hoV7s9Wtt9K2gBWk55GziyVZksG5SFBD/VJe8J5TZZdOKrhjEVuzLm8ibugAK2b+6K6i/Pf217+cyaUT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Odf1V1xo; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdn9OYDeF4+YCEVo2gjJ7JfPf40DSl2Hx1ooPLz48QoVZFyRn006tyNmH5KkuXEx91QhH57fDNO6cjEtQMZ4DRlYJ1OUUoiuUqhD4Ov+hAl03M509VbbX92s+tTI8g7ZsWL25Kq7LeAFRjKmmFo3/rXdzySI9IT35wtMOGRDWMZu2VPH5V9X0ChAjqOjHMlKrl3Nw+G/gwVUYTPu2iJfEzOe0Lca9WGEKzI5MTIdWvoo5JAiyTO1BWDp16fa+M6MiGrbb+zA3p1tt++aR0XsdoljQXQYSMS3qYnxMZksGYQ4M06GDNTn/9/HIZC3kurAjuCgI1bn7rLxN40azzVDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4b9Pod96PbYHgFzo9jVXGB1YVqlKfuB2TmroS4jbDg=;
 b=bvVRmmhDhUcyn1RWXVwYhOptknUsEutMV966wRoG7tNQ8zZvvvTtTdmmR5AcfYA0ZkNeKaUzlrWeZGcHtKyMP796/L5HF6kc724TlVTe2J1eypJSDC+BUQvooWwF/YRDaYKUQU17VWWYpWbYryMvid4+uOcB9LBO/+227EVQRCvTC1khWdMnL8yJVRS/6q7aAUplKUcP9fZbZvwcfIX/wIdAAgNw6FuxDoTdakpc/09dkZBxEHl1lPEG03fO2MwcADfaL3Qua1qiD6+m/KgxhrTcTFXVDNYW+SiDIdZMb4q/vPdMPJ59iiQnV3eiVFPy/2s1SeG1Rhyrh9ZTFp51aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4b9Pod96PbYHgFzo9jVXGB1YVqlKfuB2TmroS4jbDg=;
 b=Odf1V1xojkjwwOOddN9IPaf9driLG+prI2m7hIf3z3zJzrcqni1mtLyn5ZzjGby8LRzxhiul/KPtYB3EJvG+tbO/wQgc5yPa1faYbHkPr+AvwR9CuuIp2RTKIwEurxp+7DM5de4b4kldaPxCg93BISVCpDjMvIGL7RRvS34mjYo=
Received: from CH2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:610:54::27)
 by LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Fri, 6 Jun
 2025 21:35:34 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::41) by CH2PR11CA0017.outlook.office365.com
 (2603:10b6:610:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 6 Jun 2025 21:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:35:33 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Jun 2025 16:35:32 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v3 0/3] Fix build issue when CONFIG_MODULES is not set
Date: Fri, 6 Jun 2025 17:31:38 -0400
Message-ID: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: c3574afd-aa24-4502-008f-08dda542118e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pj5mMUWYbyFbbrWs8dWdb/WE/AOy7KA9xUW32rVIkFTOHJKWSgVPgnEq8WD8?=
 =?us-ascii?Q?rMpsZTa22DXVoNC6nt3Qgm9XN5WKmYDJ18xaKXG8+nBjBllqURfQI66RvsIh?=
 =?us-ascii?Q?Mqnad3YA/lNBBIhrAOxrz5lmSmZ2PBuY+rPTF8KjXgWI4ycV8iNGmMHnFsrN?=
 =?us-ascii?Q?auCowqdp2+WL+/DOYC9JJ+m68B3iWW7PdlqubFK5C0O9xL34yoMvf6hEatJM?=
 =?us-ascii?Q?oj8TDhYVjUSL+vdBT9Bwa/nh3Pqx8eyuheNohew+cQrLaM8yC9YDWm0anW6M?=
 =?us-ascii?Q?gAVlj4dz5HB/Z1kgpUOMnLvbx6+zye+2pKFDpCLl8t7MJP2EYUlqldfbawrN?=
 =?us-ascii?Q?Wz/vJ3H4AxtvBqSfe5h9e1J8dW34szCrBJ87KkdXkJijfM0HbV4KvdTupdP3?=
 =?us-ascii?Q?Pkz0AQ4Ll4MX4SecxxkAcEFkqIxItXUvnJeTgQHbUG4MY4f6xVR/sSjhlagM?=
 =?us-ascii?Q?Ux+x2+WEAfcENw946ZzTZl7dUPD9qDU8C/0r8Pi+rcw5M4PbVIbGroGhaAPm?=
 =?us-ascii?Q?Pdwfxqpe1GKIncGJiSFrBPpLRjXxoGKgGSzFNZUz3VvNHFPJsSwzE0zNEa1+?=
 =?us-ascii?Q?27FbMM+4/auJ+/9l4xPncTLhdwK7rRuuG5H6rEK2N+iw/klbB+4nkN0uz8Bo?=
 =?us-ascii?Q?KRa4EztbtWaWIbV7wZjMuZMBfHtJytIMGMoChxBG7bpzWKoAA6nRFmTEIt/m?=
 =?us-ascii?Q?bBDWA3hsCh0b0TKsvUP0iGcN7AeImIJxkRANWJyGp00FmEEYYueOBuBAUHiS?=
 =?us-ascii?Q?CXB/kwYljNWFY4QKIfY00AJWGnQvNYswhSvBcYtD+Z9fUrjHj+TIjXWfSY1i?=
 =?us-ascii?Q?hotdHyoHTVYv+NxWCL1YtJPzciIBn/HFbN+qASFWTp+cuTfnZEGvQPNrc1Qt?=
 =?us-ascii?Q?pW7vm5W3sBi8TVNW2k/EG7STQq2KkPAv6YZW/FgOI6NepdKWgGQRjzdVVCgj?=
 =?us-ascii?Q?LALcq+zzJN1UCyWD8LH62AFH080p3lP5VIHuaXcV+56pPAxxsnjJNbdOQsAA?=
 =?us-ascii?Q?SPrQPhvursbBYyCy1Qi/Nyf3/xBm8LfXHcLM8YOLxwwlW9KMyt1kpR1nxyEH?=
 =?us-ascii?Q?LlMmvriXTcVNvPfsmxhJ/B3B3J+b/jMVAZCI83o6lxSGLWgRwEee78WXzDdT?=
 =?us-ascii?Q?42Dt5VcvPBvFWfQAzNlG0smjuI/ncjsRn7a/FpPCJQKjJQYQhYaq7R2bMFx5?=
 =?us-ascii?Q?CeZ3hOAqV+aSFrz6X/Y9cRgiyzoHNuO/bHycbXclOi8nFtGafQ2Wmc2z/BzP?=
 =?us-ascii?Q?0LXfqC6IQO29OPBkLErBOcDPczfVwzfIkXhNFK4y+0Jvqh3/9l4R6cAmFFa8?=
 =?us-ascii?Q?s3BfE3fw8dThczTK+HlGpKx31oKLz3rvwmGFQSSr8DjqEMNxcP2GHkxHDK4R?=
 =?us-ascii?Q?BrMOlZlQVYS9MkMwRMRJ8CXhuhuqB/87Ni2e3q4yllBTopWmxUcENOjjgisQ?=
 =?us-ascii?Q?SEiaQQ/PaiTzkR/meL3B+WcB797vOPHdqDTusmkq3WDA6Ho4Y0v/ybISsl+D?=
 =?us-ascii?Q?YL1zGLnrCzOlYwf0dLBFnbGsxkkrwaoHHpxo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:35:33.6868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3574afd-aa24-4502-008f-08dda542118e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749

When CONFIG_MODULES is not defined, 'adap->owner->name' used in amd_isp4 platform
driver will not be valid and is resulting in build failures.

../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
  154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
      |                                   ^~

To fix this issue, need to make changes both in platform and i2c driver modules.

* In the amd_isp4 x86/platform driver, replace 'adap->owner->name' with 'adap->name', this removes
the hard dependency on 'struct module'.
* In i2c amdisp driver, initialize unique name to i2c adapter and also make a change in
i2c-designware-common to avoid overwriting with generic name when adap->name[] is already set.

---

Changes v2 -> v3:

* Update commit text for patch 1/3


Changes v1 -> v2:

* Replace snprintf with scnprintf
* Add new isp4 specific misc header file to include the adapter name
* Remove 'Fixes' and 'Link' tags from i2c patches

---


Pratap Nirujogi (3):
  i2c: designware: Initialize adapter name only when not set
  i2c: amd-isp: Initialize unique adpater name
  platform/x86: Use i2c adapter name to fix build errors

 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  5 +++--
 drivers/platform/x86/amd/amd_isp4.c        |  3 ++-
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 4 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

-- 
2.43.0


