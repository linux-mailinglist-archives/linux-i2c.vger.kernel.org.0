Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43021573230
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235461AbiGMJOc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 05:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235118AbiGMJO2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 05:14:28 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2410E0F47
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 02:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brSYippr/PjPuh2a9t/eUSrnqA6kWyqnqPmCyR8krYpNnugV+4h+fptUTBYVvkZsPsEVxM2iHPaTeURMUF8tfCFdGoeuDfFNVFkU+8N+V5gwZvSj4Hr/bvlZxchc7w6BQK363KljeTlelq2pTcIwpBLXCBQdgaBqt6HkcOr7ZrW0+49IJz3Xc1vfOSdKLKsXAa5XuSto/GMhBEVfl++sEwG5UPgoABQhlt7v0tby7O5sw1D8O+/eMg4PW42OFYmcB2Juvwry+FPLeidlw016oK0Zs5X2RJ75GguybavvK07lQtVlfKIwrnAu5RgPROycy5YtuR8xM/ucP4/x3oPMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+6PU9M8N4JFK/phIxWjCI5OyCe8hgb8YQoEE+cCbFQ=;
 b=MxDmSOthIyCFOTkfr6xLqbk7FY+0PfeLz4T0dmgDJgeQJnUvWRyI7mrnnN+oZZuQnBYHrUvcrybVzxg+6jPMY5GQywNGjwHfjvK2f0UAhB6FnVySjtQlf6jYaMydvBOWgO2vkCjOfjys3LfEUVE79mEllVd1za3wnJXzHPeJcT2+1dvZj3vTCdJMq12QOKQGCOWSysfMhWyhcaAc4D9ypQ/1eFgsm0lPaCW3eUk/I4cfW7GVL4YOBP7UcAXuj/BTLyL9gdDXGid7Vb6E4FPcDlDjnNZNLJmAuDWPbIVI/4spFVtdAL+yNz9CTZuIRsag7yc5cntTB8k/fQt1cBKcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+6PU9M8N4JFK/phIxWjCI5OyCe8hgb8YQoEE+cCbFQ=;
 b=g6MA9y+OvbSVA9ihU0WY/kB7AF++xRkpaI126kNlmPxiKQM/jIUakypjjQsz+Pys2irt22smqhjl+iw0RRuQtFKBF9YcZ9lUB8knC48LcP/AmxF2+xXuiWqGarA4s6u2unmv0AnrXJcQppY5jT5LO9jBAxO46Nel1UubZvJco1SFd6GXsmTEWYId94a+JmDvpHWn8cmF2dk5Ds/zK47FK1zDhE0w2aoSuWyaaxaGECdF8HT6VHduD8sHMjpR+0QUSPtXim2OkgtO5zVc2Dv3N/1r0JNyvUWs+qzvrvJeSe/eCTW+LpZrY1G8F5jQDKX5uNfl91xoKESoXXf88HEEEA==
Received: from DM6PR02CA0126.namprd02.prod.outlook.com (2603:10b6:5:1b4::28)
 by DM4PR12MB5278.namprd12.prod.outlook.com (2603:10b6:5:39e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 09:14:27 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::10) by DM6PR02CA0126.outlook.office365.com
 (2603:10b6:5:1b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Wed, 13 Jul 2022 09:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5438.12 via Frontend Transport; Wed, 13 Jul 2022 09:14:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 13 Jul
 2022 09:14:26 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 13 Jul 2022 02:14:24 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c 1/1] i2c: mlxcpld: Fix register setting for 400KHz frequency
Date:   Wed, 13 Jul 2022 12:14:05 +0300
Message-ID: <20220713091405.909-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef5b785-3fa6-477d-174d-08da64b015d4
X-MS-TrafficTypeDiagnostic: DM4PR12MB5278:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hB4NGgVSoH7kjSKc7kt0zTc05q+W+Gxg9wBSum3LI/jQiJ1YQb3DrvIT2WJV8i1VAc9Z7vMqeqA+gke6wo5tHCqgA+Gcjyl9JiXBmdsZmcq0NM7W57679F4dmLLRWLn3cFwxgUSEp3UiYi/ezGKeL8KjVlFwVHQsqMrl0sbzfFc/ckSplFyk8mRrbB4Sy3/+u8YXtb7f7evh/pdJQr+Vdq7tdpflc3j6cNPSarOYU666JVMeXZf8x/CJzYL/HsnXOIqSePPVCbSCm7bSbqhQ/cHuWHfG27g7zCjOogY1FU8NEz1vY4ki4cTszgnSrcj1lFMsB2J+4dEH9VEEfa0vUG+k/GTDBGB4NuxxAR6c39ZPEwKs/3kCaFe+5PAf1bs+O2DVCOwjqSF2UOo4dyCi8Z9OGOXj97IQLxERuh4jj34yb9qAVS0yq4Vrqniji0Alo2FEsjwRLJcsWrec23sfqzEeJ+BtF/k27RSl2kJDMUdsmW7hy+Pzq4QAiZ5e2ioh+fFrtgD/0eGAxGfENy71amOggjv2L2z9dgfmq+1I5RG8Y1ST2jgsH/92FursRhpds4PRTWfNWlQex2cxw1hvQ/Hnx96snA3hp22YNNxYJp5ymMMqL3vzBmjp9jT2ssDo+5wKloP8r5xxB1S32hWJOJGbBC6AOL96zOe/zKX7y+21kOfpMnWGZubXXzS0dJOAIap3hpAxmc1TaKlumnzRuD4LAOAwf+meWGQNyxFGtaxr7TiUhhTVFaypfSBVNQlFojPJm7oAMM1QaJZJf6SZp4ZwMflh204hFcbP7iYyD7wq5ChjwBVgTjZfQVxNSE5rvEjVrkv/5cFltWyed88fSxwmycDWK5+Gx94Gfq/OBiBFKwYMO3MTltKa/k9KJDiB
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(336012)(6916009)(82740400003)(81166007)(16526019)(47076005)(316002)(40480700001)(186003)(36860700001)(70206006)(426003)(5660300002)(4326008)(36756003)(83380400001)(8676002)(356005)(82310400005)(26005)(8936002)(478600001)(4744005)(6666004)(40460700003)(2906002)(54906003)(86362001)(70586007)(1076003)(2616005)(107886003)(41300700001)(133343001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:14:26.8339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef5b785-3fa6-477d-174d-08da64b015d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5278
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix setting of 'Half Cycle' register for 400KHz frequency.

Fixes: fa1049135c15 ("i2c: mlxcpld: Modify register setting for 400KHz frequency")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 363ea9fd66c4..72fcfb17dd67 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -49,7 +49,7 @@
 #define MLXCPLD_LPCI2C_NACK_IND		2
 
 #define MLXCPLD_I2C_FREQ_1000KHZ_SET	0x04
-#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0c
+#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0e
 #define MLXCPLD_I2C_FREQ_100KHZ_SET	0x42
 
 enum mlxcpld_i2c_frequency {
-- 
2.20.1

