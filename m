Return-Path: <linux-i2c+bounces-1141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE182537F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 13:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC221F23CF3
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36A52D056;
	Fri,  5 Jan 2024 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TmznaKhP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B82D043;
	Fri,  5 Jan 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbdZG4WBG58PV3jr8n9dXSqmguueh+hCGpH3W3AxXpKrq6Gokv+y3ITadvd6Qnf4YH1fiL+taNlW/3j0IEBlN78eb1LmS5+zjDmQbDinzoxSsPumEinWlesQH9k6Zm0tpiv+6f0IO2e8puy34ifrUY35SYV5dRic0gp53JK4uckquJTOpoGEUOINi/tPfd5eZrcBoKu9C+wmCJ9F0CFjI5FkGnZLicMvPN0jt14QsQQSHiG6144UmyrK801GqRqzXskfwKmM/b5Q1K3lSJr5yVQnaR9waJrsaKF9M+KNRBnSDyEtQIxCre2tzPcw6coGSz39aeWBCV2lRrQCvRUE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tqo7AP6aF+doY50MqGOAlXguT3PuGYMjWQmawCn3CBg=;
 b=fficuk993PbgsaMDFmZYXSL06Hw+DBPDcpRPr6dAu/EuA0oercxL6+mmPpLwOxfD75nr48WJiAyD8PgHhfwqcve9Y5NOOYjt7/i9hkVcfRjLxJlmak5Hpvbb3qS64b9gWLHZskiRwsJHUr6MqDaoyCR9ss3r5alr7UCcybUVVTeUSXbasc3A1ATxuPrZtzMTBDC7xmS66L6MGCzi2t+GfLmptRlhMi1uGk3sNwbhDfg/A41EeZvft+DW3oZreQKY/RmRUGGOs3YP1FsZ8Jxb4JDBGY8kKz+yq1iguyo4UvzBtCHiuyL93nDufP8SokJKltzGvSb7XvBC/bkXgt2zzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tqo7AP6aF+doY50MqGOAlXguT3PuGYMjWQmawCn3CBg=;
 b=TmznaKhPxShqsUTd28rvQts5TL5RsmjDUOKKL1Zfa9P/EWFgrUjS9UG7UPsC6xoF3ecimDKF5vzakgF7Io+2uu7m/1A/04Pxka+AEZ8nT/HsB2bTeTM3R4utZRVKhtQgLWh8Ktl3AHJr4CXLj6RG5eC9d9K1SBL3ekDd+vYDQzU=
Received: from BY5PR13CA0009.namprd13.prod.outlook.com (2603:10b6:a03:180::22)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 12:53:52 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::52) by BY5PR13CA0009.outlook.office365.com
 (2603:10b6:a03:180::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.8 via Frontend
 Transport; Fri, 5 Jan 2024 12:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 12:53:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 06:53:50 -0600
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 5 Jan 2024 06:53:48 -0600
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: cadence: Avoid fifo clear after start
Date: Fri, 5 Jan 2024 18:22:58 +0530
Message-ID: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fae97b-ddbc-46b7-4452-08dc0ded5e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sq1gB8KI0YIG8GSUf+26LDg4dgBVMXvZ781sTfwvMvzjg41FOYTRqfiNiPHz3qI3/Mj/4N6LXZdaPWQJuUUmNh8VaVvJIW+SEl2I6JGj6XidJVCi3ncTl3xSB0ChgO1mMAVE6JcYIa8ZD2MtfzKsRKiAejbqfU9CcOmd4+HOQurMi6LWd4npIa7L2tAfDypql8TRyujXtKSP8kcvfKGPS2jztQjjfUFEghaozd/dZaISx4mGWU/s3ZIDxo9Ch3YlrKA/GDiDmbCtVd9DkEsOTTbNqvqN4WSNceqakPmv0zbRxesuixddAEr8AMbZ2/AtI0i2QjoXhGDtKqMkbD3VJYp7Mq5D3XhGmbtI3Aze8jck9qgPATPRFaIpKjIvbjHZJaukMw8IjD4i3/uklyq3/J9QRmokCZwNjUShRw0h2vYTiaThFNxjdu5PjMHiqW31MkY/228y3V78aJoGb2ZWUJ5ln2xBQXocOG1JZn5Xwtc9mN96PB4q/mIGLQSG5Is0U27Ll/+Sf626XcT7kWYuA7SLESUXlnApzFp1AFtK8pGyPRr+htpE6YsJeDBMbAMgB29km1iawvnW9fL5kQwB+JTqDpP/SkAdhaZJ+lpwDg3PTMvx+jlFM6/5sYtgs4ZcLk6mSm6zDrIGgobvNMHYNgQvbI/Fc5JKAHF1vA6jnGxt9gOXBg+5SAhyf/jJHJ6EDhNdAoUbf5QAf8/VNOroq7yUcDYefM6EDEC48fup29k6r6L02IGWzaD+evJjUn8eSzo/2vOiXTmhAK/oHhAE7xobYmecgqAhBGVgcc4nSqM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(1800799012)(186009)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(2616005)(478600001)(1076003)(336012)(426003)(6666004)(26005)(103116003)(86362001)(36860700001)(36756003)(82740400003)(356005)(81166007)(2906002)(41300700001)(4744005)(47076005)(70586007)(8676002)(5660300002)(110136005)(316002)(70206006)(54906003)(4326008)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 12:53:51.7507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fae97b-ddbc-46b7-4452-08dc0ded5e3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115

Driver unintentionally programs ctrl reg to clear fifo which is
happening after start of transaction, this was not the case previously
as it was read-modified-write. This issue breaks i2c reads on QEMU as
i2c-read is done before guest starts programming ctrl register.

Fixes: ff0cf7bca6309 ("i2c: cadence: Remove unnecessary register reads")
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index de3f58b60dce..6f7d753a8197 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 
 	if (hold_clear) {
 		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
+		ctrl_reg &= ~CDNS_I2C_CR_CLR_FIFO;
 		/*
 		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
 		 * register reaches '0'. This is an IP bug which causes transfer size
-- 
2.25.1


