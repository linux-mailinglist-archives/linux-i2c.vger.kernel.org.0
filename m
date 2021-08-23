Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEAE3F4C95
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhHWOqU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:20 -0400
Received: from mail-bn7nam10on2044.outbound.protection.outlook.com ([40.107.92.44]:52800
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhHWOqT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 10:46:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay3/dXs1qhZ9gNIlPxTkChmA1rVO3GITngxee+qL3zJi1BCKmn5byFklNi2FhSQUnyAIXi1cUzWSdBkyuGIETCwC09Q2eyIjQjcBv3J3WYN2KsrIDriHJs6p9WGvwKlOqtBDTTo1j0jqBV33qGtuMq1SQDLFr2dxYLW5CxJMBinZaWZzWBb/AMemN47w6yM2ZPnNg5VM4ctU2uZALYKcPim3qfUE8Qi4XLFsYfIgKySs+LTZkg0iJ46ZqeW6c+rUXNCwFpXrv8D6YNZxaQ/2rjPyRjsDO6MpsUjEFnp4suSk1juZNjYRrNVy1HKf0n3Me22ai0RUprHm45aiY3ZgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/fofUa81Qq+ZSwd4Jv2n5dNPZC1KIm88eNRKKMsnhw=;
 b=PkMBPJaftA80S00Dsw0+IjxCjiF5OXD3l/Wj/jg0uhK6QWcBAhzDoqEmLefE3vJmFSkk6mlwr0osz30PoQTYYhzLQrfVQEeJ9j9oNy77883uEMFuRPqgh3auzCcG4pdDmIP/3NkphKFPhl4V7frgbcPcubiWHUh/Am2mOv+sv4klat9jUEyp51qNMUQqUhwRboa2RsEVgu+FWrD5YH2lBCfh5lzEEfcqs0AJk3IaU7NKCnYKjE+xpASzmP6v7I1LtldC0StjHSSSAfjk38cFGPta/DxYIn9y1G+iU94JVwupU7uoPBimP2YpHQEMl7XaaWss0V/wb5qohCqEFdL8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/fofUa81Qq+ZSwd4Jv2n5dNPZC1KIm88eNRKKMsnhw=;
 b=noomqSseELA6IuR31vP4Ac80H1Hc0dQwzyCZbB0ZxCuyBVj1jrmOk0gVLr6jGUWhzhXjYg33/m9JpUGe5KyMAdZ9n7/sq/VSe6cst4vAmNIm+eHHJfl0oHZy5w6vG6hr9/Q22BXOI+wdZa9JQLe3QfRurrUSBQ4XTZHxAIyHwwRwvu0MzIYvRWFcEz2zCAne2IgPrIg4maK06NIU78HqeYFh5fjSzRSxCqjeE3RngIBe0FSUwVQLfxMlaCIf8BPsjWykRNJR5kIYMYVQn2uJEJtXrfQoOYOrAZhyXWw5+tn6yrv3nHCyaVkZ+tIw9isJ6LdHIuzVCkgF4igesFOMQQ==
Received: from DM6PR11CA0021.namprd11.prod.outlook.com (2603:10b6:5:190::34)
 by BYAPR12MB3029.namprd12.prod.outlook.com (2603:10b6:a03:ab::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 14:45:35 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::c1) by DM6PR11CA0021.outlook.office365.com
 (2603:10b6:5:190::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 14:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 14:45:35 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 07:45:34 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 14:45:33 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 3/4] i2c: mlxcpld: Reduce polling time for performance improvement
Date:   Mon, 23 Aug 2021 17:45:03 +0300
Message-ID: <20210823144504.1249203-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823144504.1249203-1-vadimp@nvidia.com>
References: <20210823144504.1249203-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b58353e5-6d31-4e7c-06d4-08d96644aa87
X-MS-TrafficTypeDiagnostic: BYAPR12MB3029:
X-Microsoft-Antispam-PRVS: <BYAPR12MB30293E48F81183CDCC5B8696AFC49@BYAPR12MB3029.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8d7Lcdbxbbojq+gREsSNxSoPlPkzTw+ozFNiWFLVbTi0FWbIyWOIBx42ODxxGfpS44F2PUMV52fyVCSZGJBIz/zbidg2V/O/3CQGwygw8VUqCNspjIVurjBrBL3514jqCfClKb9PRz3xnM9nQf/BeP7e5Xv/f8Qxyn+NtQ18YiU8YryEdKCqa8CZEY6ZOsS7gtbnAD/8bncxOB+lXvSLiIkwotsQIkZWdLR+kzUZNigFj5yIQJ8dNDf8j8q85e/dti90iAJtgk5wRjW+trs0Lr8W7bs+6MMfgDp4C1j+TABgzjImgFaJCZphsnwMkn070t6etvu07Ni6XsuysVaCNejU7eQhKf4C8M+ooklcxVncEnhZLU+rXmb5eoWjA4wCxXauJE5reKTrAbAtb7I7YuGk7S5lkXJ0zl7k2csMC5dflDUysA4cWmN6G8sVUHE54BaI5T9L8JuV26zSf/D3LoaoLiFssOax0GNXFyjaMQyB04AfnhnzOaxnSWE+VAA6bXr65qqo8ldpe46rffJ6uGYTrnBw1klIhdm6zumMkNMRbYpEwImsyPCScElEBAxMBcOWWqJHFdR/szBPESiNB2862AGJS5VCSVq5DI1e3rSkRH/1capWD4wIA3Uepxap2J4Pk4j4XIGBGxviYdID+TUVLj1yCz42CFB8AsobxsrLcGe8AppVZ+EAzQcQdulEkFOeAFn6Mxmsq5r4Mu905E6BkXb9XD3ZA41aLcxCwwk=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(83380400001)(54906003)(82740400003)(82310400003)(70206006)(426003)(356005)(36860700001)(5660300002)(86362001)(26005)(6666004)(6916009)(8936002)(8676002)(70586007)(478600001)(107886003)(36756003)(2906002)(4326008)(2616005)(186003)(7636003)(336012)(16526019)(4744005)(47076005)(1076003)(316002)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 14:45:35.3191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58353e5-6d31-4e7c-06d4-08d96644aa87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3029
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Decrease polling time 'MLXCPLD_I2C_POLL_TIME' from 400 usec to 200
usec. It improves performance of I2C transactions.

Reliability of setting polling time to 200 usec has been validated
across all the supported systems.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 015e11c4663f..615f0a98640e 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -27,7 +27,7 @@
 #define MLXCPLD_I2C_MAX_ADDR_LEN	4
 #define MLXCPLD_I2C_RETR_NUM		2
 #define MLXCPLD_I2C_XFER_TO		500000 /* usec */
-#define MLXCPLD_I2C_POLL_TIME		400   /* usec */
+#define MLXCPLD_I2C_POLL_TIME		200   /* usec */
 
 /* LPC I2C registers */
 #define MLXCPLD_LPCI2C_CPBLTY_REG	0x0
-- 
2.20.1

