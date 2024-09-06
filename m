Return-Path: <linux-i2c+bounces-6304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908696EBB9
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 976F81F26EF0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4564437A;
	Fri,  6 Sep 2024 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RroO8UVc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A09145B11
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606797; cv=fail; b=T8MPVEpFS1OBCIq4K1d/5dzhjiKYpeExFo3t2YLjzY96mTT5Y2bMzwq20fI9sgrjPZvxNUrqwcYOM//JQq/azYg/iLxdiWy1LnsSvuPQJeHX9U9ETWSnq+4Yng4uyPLzdB9G5UqEE33WEPey1HEtn7NexK/nAVd2FzPZSWTROlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606797; c=relaxed/simple;
	bh=eN/LbvcfgRB9McfuLIB2m/jUyefYGQV2x8SXf+EhuW0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cr1N/s1eKXr3VmJNU0B/5PwNDctDugxdMVS3pZZHAdUc8Kx/nkBU6FNjbveVIhp/1m5/4fXJ2v43omYo2FiKk4wcnTGpsTWVWMZZrSa76xmcWhf4FD4mS+2XQiwd/Be2ArkTY+Pj47hA+LF1tt7V7xVdOtpisy8yu3kFyA+CrLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RroO8UVc; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWMZ9A5Q5xgqBx0QAQ5NreXilUF5jD9AvQkC30NNeHKplQtGyMleVtrdMz76nZDxDTsrJmOcQNcqqLoRj7O6492lJDnDLNEtDhoV815ir7u7eEc46foqt4brOOEVElA/IyJiq8IdcSENejNgfJ3Q5pMABz8WTU4goLibcu0ebIELSarQGk+JdgOOPNa1UDuDakGpoPuBppGLsd0GQLgOhn6+DgHGfNS3qXJcRaBK2NJ+/HuMVMHWZDIoFVHJZ1JO1gqqOQoSZel53XXY0aX9TSMLa9RLCQWbzwqLA7E+0eHV4xU+2/BIvX3ffc/QNv1zShnXsvDDvnqwx1xNhlfGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN97KRwp24v2i1h8QW3MWGrISj0hzvYm5GXLAwWwdj4=;
 b=GiBU8umL3DGbBt2eCUq9MgqLWNfiH1Eoyu5e8b9qgnLi/87ZFl9WkKk8YRTKw517FJvl9Cn6bQ3BM+YuP5CHiZZHB5tKfTMUD3S4m8OTKjBeZopRdm9vCbhhDvmsZseFvOa/JCsHgBn/7+gvafB9DttD6Ccz5vhB+didpTEbOVPK6nX2uGSMY1kPAtTcOrMgOU3k3kbyUjCRy1hYIVr/uKlRT9OW2HtNCY3GuzbxfDidsEFFulWzReT1h+h7ZHeI1GGIWC2UuybEQB0PauK/6x7m5Q+XKnoqV/rthupVDonfq4LZFtTItOM8jLUSoSCAa5WfSXHMi4I8Z8Fjo/g+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN97KRwp24v2i1h8QW3MWGrISj0hzvYm5GXLAwWwdj4=;
 b=RroO8UVcAvdCeB2iQnQ477ROL/lV9n8vVtIukz6meRlkNcPeWqwk/5aHcz8zk/nUmRifLuJC1b7JbP6izi9QgzAjwP+EEUedZ2EKb/vMGWw7lH0ABwHaZi/Jhf/Eo1HFmJw1CGtnmUn/qYI0238mODb+36RUoMgo8D2ita03pek=
Received: from DM6PR07CA0077.namprd07.prod.outlook.com (2603:10b6:5:337::10)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 07:13:12 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::76) by DM6PR07CA0077.outlook.office365.com
 (2603:10b6:5:337::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 07:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:13:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:13:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/5] i2c: piix4: Clear remote IRR bit to get successive interrupt
Date: Fri, 6 Sep 2024 12:42:01 +0530
Message-ID: <20240906071201.2254354-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5b8dee-d410-471b-57d2-08dcce435e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Oca3hsokX1XUHKLsmJRqtrLf/X1LK8yZLgIjJP34HeJqxK7cg4vIW4wmViA?=
 =?us-ascii?Q?qN0/mVgiBi2/acEH28szo6hEZ0UQ02xx49u6rcT8Ml4VTLk7m2NyPbTFJNJg?=
 =?us-ascii?Q?7PF4l7heawbJLKH9+4O25IXDkzAYj0JhWE7LP4fZ34MV1prseqNV/2tlZRVh?=
 =?us-ascii?Q?JwgrrcxoAYJf/23ugT7ghAB9WPx18f89XQrfwZV2aUyS5aQryvnyE0LZ9m30?=
 =?us-ascii?Q?xnFM0Tr3Ao5s7j3NwgUbxnls2KeEcZ+LBMTqTNamgfMYWddgVkm7LCgNJ+wB?=
 =?us-ascii?Q?ZUeahc3mJy5XqZpev7iZoQehsqKxwZ0EDQ4oE9O3M1eluZLy8B/+Rdmqekjo?=
 =?us-ascii?Q?bAIAoUiZZchhAOckatT69LQWjHLy61+2tEhlP75+rveLrEDYcI+Z/xRe0hqv?=
 =?us-ascii?Q?ZCRB30hhmfIEI+eftr1QQrzKZDLN3H6PLenYq7oxfDYtrcFpgbSdlqPUhAEm?=
 =?us-ascii?Q?9YIi0D2Gr2qEoCbch3VdGWr+EB8nczjJfP3F7jM/RmeEpxxOX5ukPYL8R94d?=
 =?us-ascii?Q?PUaDB5oQT24R2qCUmElVi4NsOMY5LHoR4FY/DAydfsUUC9j6YP9bHYgIfAEQ?=
 =?us-ascii?Q?MhURhFyhh9qOlqJiQ1Zjfra3cCspuGwR4VsA70L5HhFAV04gYqqu1aHlantl?=
 =?us-ascii?Q?DMACUMcBtaAqZiaaQaQbm7qVy2usIiPLWcuDRO+ZNRimJw9fYLrHu2oCeSyw?=
 =?us-ascii?Q?DLTgD3urwyIfPPF9BT2k/J7AxdhdZ0nSjiEbU0KK6khXlM47So+w3WR7AGkh?=
 =?us-ascii?Q?sDN6Wd+qeAgPiSa12+BBlAoN+x6MqnemzTMD8yOrT9D1jofsymkUnxacL399?=
 =?us-ascii?Q?fBX9UkDEY4rXacJfERcj+xlA9bnywkY1Q8HuBeeJBD1quP0OMkURHRaL5ztx?=
 =?us-ascii?Q?Ehlfgng5i+v+Pz3pUdV0+nheOAv/rLs0Wq5CrUD3q5EZZLLtcP+uiiEteZwC?=
 =?us-ascii?Q?CvcyQgpVgtkZOl1Sq4f3MsMQ2ngx6jnT5hTtqRyls11TkKifLrogIWCu4Bg4?=
 =?us-ascii?Q?ZcTylZuh7f+P2pgX3sKfVO9/djg3IZuXp5j9OCgcGEvJfeGf2zPkzEfzp6yE?=
 =?us-ascii?Q?4c0pGZmAbpAWz5fUixOqQZMPJo19bekYB548pfoICJw351NZeZlHjkFsDN4z?=
 =?us-ascii?Q?1vgpxR4AB0s+aKJ9FneRAO0r8swUKzDzIh2pVNjYQiRpmI3zX8yqE1vG03cK?=
 =?us-ascii?Q?NBstA4TBZtPcSQrjIwm1ZCf1uNmUJlYU9f6V68le5Td4y7CVde2DJb7XXFjP?=
 =?us-ascii?Q?9tiVTTcH8Bt0DfIuFhKGpj7LNpe8s+g1d5DKPAIP3XqJu4bFPDTK6XSDYLiN?=
 =?us-ascii?Q?eQT7HJ7VLaBT8w7Hk471n8G5ZPw93YUhfsIpdnBPCwRH7lvwAV/8zXrpcaLM?=
 =?us-ascii?Q?bGhZkZQ60U4FCsstwbOei0huzgjme5UWux2fKPP0vDtioSOpuVO/b9SL/gB8?=
 =?us-ascii?Q?g6Y0uRc4oTiIGqM66jCOdVgYKtxsxZyq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:13:11.5619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5b8dee-d410-471b-57d2-08dcce435e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 6abbaeaf2810..bf79b2280613 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -188,6 +188,8 @@ struct sb800_mmio_cfg {
 };
 
 struct sb800_asf_data {
+	resource_size_t eoi_addr;
+	resource_size_t eoi_sz;
 	unsigned short addr;
 	int irq;
 };
@@ -199,6 +201,7 @@ enum piix4_algo {
 };
 
 struct i2c_piix4_adapdata {
+	void __iomem *eoi_base;
 	unsigned short smba;
 
 	/* SB800 */
@@ -1285,6 +1288,7 @@ static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
 		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, adapdata->eoi_base);
 	return IRQ_HANDLED;
 }
 
@@ -1322,6 +1326,10 @@ static int sb800_asf_add_adap(struct pci_dev *dev)
 		case IORESOURCE_IRQ:
 			data.irq = rentry->res->start;
 			break;
+		case IORESOURCE_MEM:
+			data.eoi_addr = rentry->res->start;
+			data.eoi_sz = resource_size(rentry->res);
+			break;
 		default:
 			dev_warn(&adev->dev, "Invalid ASF resource\n");
 			break;
@@ -1346,6 +1354,9 @@ static int sb800_asf_add_adap(struct pci_dev *dev)
 	}
 
 	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
+	adapdata->eoi_base = devm_ioremap(&dev->dev, data.eoi_addr, data.eoi_sz);
+	if (!adapdata->eoi_base)
+		return -ENOMEM;
 	adapdata->is_asf = true;
 	/* Increment the adapter count by 1 as ASF is added to the list */
 	piix4_adapter_count++;
-- 
2.25.1


