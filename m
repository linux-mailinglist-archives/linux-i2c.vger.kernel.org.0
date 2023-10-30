Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9794C7DBEAE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Oct 2023 18:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbjJ3RTz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Oct 2023 13:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbjJ3RTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Oct 2023 13:19:54 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2111.outbound.protection.outlook.com [40.107.7.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3790F7
        for <linux-i2c@vger.kernel.org>; Mon, 30 Oct 2023 10:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUjjLlHrNufWRwDclfQtVFitULeBW6AQoXtFyP5++XPaWV+VjbfoENi2QYRHZNx7OvAeOeGbt/hErDgiHdu8A0OuWx0AvnICUZ8TLULEQsFaLiiboXDJ2i1NJc4IUc8qiIQ9mdbG4r3lIXKe0jnGvUWgYj3EyYWHd189MaB7xD0oN/nVmlyPg4mk2u9gRsa8LFccPihqDysveHoWUw9kExp6+YJ8Werru9lJ67Zc7hPZVIz911rypTdXDfXvsjyWfTwqX8Dx6tK6Ack2wRWz0uvfDNHD72a11lqZYq4b+tzVW7FfbBQBgNo4gIXXyExJ6NkJTfeTjbDBEbbJraexNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMcSDijHGOPQazvlJJh2AAecrb7XfC6p3foZiBiAyQ4=;
 b=BulQa/iEM2qb7yuK9XwbJpjJlePmbg1THzpG19XrHvKNmlzBNY9A361HCytXsZXLBSnCYbLsVH76rCJGX5lOxbWqeHQQTn7Vaxm/uCViI6iysvf6drQt1cT2/7rWT8fGZh/5BJdddNpgi4+2xgKL4RkuI2iFMwK9AL+BpfhOaIbURpJdLnK7BkFv/JHFvSmt693mT21pVR0soaTqrf8dCYc81HPI8jcKWHTFzF+m2T4OZIEvp8uCkAnqKQ63NBWXmczvX4klAuzArGt8hj38tWLi09SPVacQ0lXdMWBW9dXo6Br8Kg1FlL1nG8j4aCKvgao/GSMpjjP5uiz26Wj4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 152.66.208.194) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=sch.bme.hu; dmarc=fail (p=quarantine sp=none pct=100)
 action=none header.from=sch.bme.hu; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMcSDijHGOPQazvlJJh2AAecrb7XfC6p3foZiBiAyQ4=;
 b=b3IakbIstyByZRXrXztozfVH0PMfRv9DW366ex1BOCbNBTun6dXXEif4BUm1Z7RlyeuxEOWKgiyL1tOqkyR7+QmrBYf1lKHAf9HYiQ1D3+wusy/APk3p/UdEs5QZiZ9ue6IYEWVcNwMY90kkwQQk0SPUyu1ZBGu63FiOBsRqbV8=
Received: from AM9P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::23)
 by DBBPR04MB7513.eurprd04.prod.outlook.com (2603:10a6:10:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 17:19:43 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::75) by AM9P250CA0018.outlook.office365.com
 (2603:10a6:20b:21c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Mon, 30 Oct 2023 17:19:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 152.66.208.194) smtp.mailfrom=sch.bme.hu; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=sch.bme.hu;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 sch.bme.hu discourages use of 152.66.208.194 as permitted sender)
Received: from mail.sch.bme.hu (152.66.208.194) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 17:19:43 +0000
Received: from Exchange2016-1.sch.bme.hu (152.66.208.194) by
 Exchange2016-1.sch.bme.hu (152.66.208.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 30 Oct 2023 18:19:42 +0100
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.208.194) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 30 Oct 2023 18:19:42 +0100
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
Subject: [PATCH v2] i2c: cp2615: Fix 'assignment to __be16' warning
Date:   Mon, 30 Oct 2023 17:19:10 +0000
Message-ID: <20231030171910.3447256-1-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|DBBPR04MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e14c5ce-dc6b-433f-cda7-08dbd96c6865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVhw4Tuzi33+xtN0WciGvgIULKhZM+Jw6xlvxInZ62kzMfgfYo/5VljcvBhHumC5nEgzKLUc9RN1fi0LRgma7iNC4mjcdXlH4C8KXZcTYv7HQ67Sebyc/oYijBW+74TItlIpkJ5CZXWhe7WhhWmVwbUBfiq6j5I4/HehzxnEGG1THxCp/7fhtcDEGzsiqlvaLV20LxeKV8i7OJ9WijnSJbtVh3lLegQLaoTId1+NV4Re+FyUxH7x3VVxqucZwCpV2drHY5Qb5SwpQeWA2G85h2vp72E1pSgXeg0Er/NZice5oqj2+u57N2UK2FERRsf5Fu55GlK5rJu1haod2nA/jQRnBmBrJxX1/kxvRHGcvo2q9heiorHd9jv9D/zNVOCqp7AdVREapMQXQiIAn+THWaaxoHKM4U8d86REiyoQvs4wmH+bGl6BHHZAknYjV3JdiV4xBrAhY/NzgCFV+FdBNihfzPymWJId3Rvo4yb66mKu+3RBKXU60EwSRcLGOl5XlB2C2pRXyhbtkE4/IGLfQiVLLh1Ct04amb0sUpXQE1w9ZPYvnJYcXi7gQTExR6OOhJTnDoypgn9JtHWxjsfBtYa+YMorse7LS2PPhRTCBMrD6MjH6FM27w8gdozdAqrYJm2WA4PadZjI9TINIONBKrTFf95aPvXkHlGX37qw4UAULqrjOyYJQOX3psXSPLwSIpXrlM2Zymw31DER33sVgRd6hfIxksJ26JTzcL8dv9TPS/H0FbRqXWMuZDy4bwK4
X-Forefront-Antispam-Report: CIP:152.66.208.194;CTRY:HU;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.sch.bme.hu;PTR:mail.sch.bme.hu;CAT:NONE;SFS:(13230031)(396003)(346002)(39850400004)(136003)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(83380400001)(36860700001)(86362001)(41320700001)(40480700001)(4744005)(356005)(336012)(4326008)(8936002)(426003)(8676002)(47076005)(26005)(66574015)(2616005)(7596003)(956004)(82740400003)(2906002)(7696005)(36756003)(6666004)(5660300002)(1076003)(54906003)(316002)(786003)(6916009)(70206006)(70586007)(41300700001)(478600001);DIR:OUT;SFP:1102;
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 17:19:43.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e14c5ce-dc6b-433f-cda7-08dbd96c6865
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=79f0ae63-ef51-49f5-9f51-78a3346e1507;Ip=[152.66.208.194];Helo=[mail.sch.bme.hu]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7513
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While the preamble field _is_ technically big-endian, its value is always 0x2A2A,
which is the same in either endianness. However, to avoid generating a warning,
we should still call `htons()` explicitly.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
---
 drivers/i2c/busses/i2c-cp2615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 20f8f7c9a8cd..cf3747d87034 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -85,7 +85,7 @@ static int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum cp2615_iop_msg_t
 	if (!ret)
 		return -EINVAL;
 
-	ret->preamble = 0x2A2A;
+	ret->preamble = htons(0x2A2AU);
 	ret->length = htons(data_len + 6);
 	ret->msg = htons(msg);
 	if (data && data_len)
-- 
2.42.0

