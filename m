Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F24574CD1A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjGJGe6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjGJGei (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:38 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12224132;
        Sun,  9 Jul 2023 23:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT/uSV6TSHVZ4+M5WpdwjFeJQuO91Ty0eHEBOZtUjF6b0Du0csbj0SiU4lnQVybEQFMRZsBLuPWw/AZdEwpUH2OYCB+nZWnXS+PqV+nfz5gFK0xtuuY+KSLadq7rVp1uBMv1wN8ktgM2R2UWpfYqrdb7zEe8HofxfpY5XxspXA5j7+WqkyBd6S7LX3UTKTUXQrnGihJk9f8vim+JWVVh+LxzSnQDy5aI1Q9rp1JWsLDsgUvR33F9hBVpAOykOEaHLIQgSMIbCCyrTTBzPal1NIL2cvdpBcriAe5eOebBlWFYH0pdiMVETu3j+kXxUgm17ps/PeKz0KtugK+OX5RF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUqjCw8dJAGGMwXpKJMBJI/YD7X/PDd5YfI8Bg34FpE=;
 b=C0NG44gAIhEnHzKmN00EDN5EAzptNAF51QgDwaV89hLMLD7hegpMqn1vHygDmsErg7pNApFeop0z7UPE5YlGUtpCfF9ixfh+DFyt3ld+XDOcW4n6N8+DGb7MBpXlbow0dQxbqOf7Rg4vQ1VamcqUk210viZy5Ofhn6npZlPizQ+2Rzz/jAHzslvywW9DYYnpsdFjEW5u/r0kk+FPzWIDu0Mjnmdr/9ptZymgnSLmITwuUeP8MVNg4D0kyVqfGK0GQJGfElGUFEfohrGaQoBUwmLRq2f3CCgYeb7EjZFkGvGzuFI1nG2YtMGJWtgzPTMWHEepJcYUjftkJTiHCAIfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUqjCw8dJAGGMwXpKJMBJI/YD7X/PDd5YfI8Bg34FpE=;
 b=Y38RaLhqqHVfwRt6lcAK63/nkfOd0LKwnrJJRtJl4zWLbtgwdqzaf5vhqNaLbRlrYuzCjBGPt3Le8yhMCTezeDxLIUfef7RIcsJk7rhh8PExqDUPyMbvsSVB+e9Qaqjh5P+CvSXgeAVdJQf0rCMq/LaBOFt5iinAX8gUGKuRZfvll6WVAgV70g17Ywa8quUdjI0wG6GDEcQOzR9Epw3erXhIpwlDhHyGZyafTGZrHqH4lbj6KzHfCU43uSqKarVggkgZeyutUBMV4wA/bydzUcTHCC/e+jY06oxWBxd0QeitFWLuB5RmRt5SQg73NuFEyy/kTF65jCTnhnT4/wfIwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:17 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] i2c: st: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:46 +0800
Message-Id: <20230710063351.17490-7-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a489cf7-c059-454b-e470-08db810faf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUncLV8B1Pcj2/iL6e94ayagATvX1QUP9obUsiuFiu47F0jXB0lTbQWeyto4tsQe1xWSys/2StgVeDwCyjXC7W7kN4X1s/qdiNfxwckxlPfhEeczpIXeXTpxhOI4sG4uAhzDxbrk7tGGE675V7XhSlrRdcT8SpoVFQBtub1i3mdpgiRvjhCUuIznIU+k7i9XLq4z8mk+oOsrD5pZ8kB3vUZl+puAQ882dHw2Psk2hvdw61Y/PJqh1GpVipaIkjaH8RN1GzzqMNb261oTMHqnvZmYF5a/sNflla76+vE4jtA7/s8GL/NHM5oQM+rmE+Ksy1B5ezzq2Xtva5wrRqfxhJWpT4k7NXjMYZKjk/0/J1rqyz3xvk/ZDG/0WOvTSPlvJvbHoxN/PTo5bN/y8oOCvQ/OAOyV+9HrUGLwQLmpqdKJu62y37gXX2EDU70rw4e0GHUnso3/PPQ+sxm9tALUVJTxzqDoWjsvL0KYMjrCtUvs+LGGkND67NAfA5xHYWO7YbHICAB0giIqAY0feSy43f/Vy4/oG2lqlaOpz99R24N50S4h5d3QHgNeIoFyUG6ajyHutQWsaOsTc2c8PSFWKlC++H0xcYZ5vvN61/FyG9pY0UZtIrzlvtZjNrjxvkULkHT69zwbV0/VC9oo/HFYuRNIQR5ZekyCaH7GsRAPAD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kMIfJWdlZ9Awby78mMjueRsHJBQYUXpW1G8DcUQhhUdo55tzPnoEx49ouBSQ?=
 =?us-ascii?Q?NN4i3rkA/L8GeiLFPpAtxbEBoyVP6X/p+JNjTwNv0b7Nrs4AgnJuk0Vxm6Mo?=
 =?us-ascii?Q?obNtcrw1D2eCUTUFRepjZhwu7GUMrglBsASFTXOM+CtJeZrkcxlYvY/68C/y?=
 =?us-ascii?Q?2R9h6p227ZCTPkn+PUIvOawMC/baZlXS4qxep6sLV6fswaE/NY1vvgl4VgyO?=
 =?us-ascii?Q?t/dYxPPsA+3xEGJ6Kf7u4RJM08sKMgmF62asmz+vJZSwzlL6cqeNxa76EO06?=
 =?us-ascii?Q?8RjIXRzw46jmhnsEcoa5rO/Fle1GhGpeIYR4fDGejEJJuPQBUE4+KRQXuIpA?=
 =?us-ascii?Q?q0LWzMp68yGTEQlmQY5lvcuL6/wbLBaEWCMwAt9hbQSpPk32EygLQ+ItBF+e?=
 =?us-ascii?Q?+m5n2JXkm3Vs8hrR5RowQLvTZTBkA1bq8rh7MlkJt5Rg7Qm5luIbF2KwJkPz?=
 =?us-ascii?Q?6zNi+daTYfqc7htIVK9kFGZ6KgHi367q6quHUs9TYzMhjSH20SovpVi3mk3y?=
 =?us-ascii?Q?UkHosR/kNf8AFyx+jn3EpbmznYVW/mXG0hG7vXMbQRxIXtr7YL/4oEVYAmWI?=
 =?us-ascii?Q?u2xJ4RNcDFK31yPkZET6an3Yr4D5DX4Qauqbl4xR0nkJgF7Wtyktav+Rv/aj?=
 =?us-ascii?Q?YwhqWhCExRediHCsTFcE/SYMqPfYEP/VT6qkf4SB36qQUYrWoKTP/cjWlhgp?=
 =?us-ascii?Q?YdAWeMQqWGynsChLhjWcEVj+S0j/M9ndEINrYp6U9fMCGUCvK9cmmrvquh8e?=
 =?us-ascii?Q?wJlmcjkXbm1+gQzlTzYG3ql9/XEJ9OH8qN9eMfpoGvje+1iyrsQKZLYZzXXH?=
 =?us-ascii?Q?aWoHm4CCZd7tVt2i3ME4/QhhfO0Kxaq/ceOcc5r5O9/YUSe5FrRuhyCAYdui?=
 =?us-ascii?Q?D9My8JZaDP1G45m6er7GuVfyWPKj9gN1e9lL2FIeL3DbWPXf4hOyckNBrwYg?=
 =?us-ascii?Q?s5UBXXnz9X+VMw/rsqn96IntW52r3V3UIky1Vp24/meYAUSU26ZfjXsndC4s?=
 =?us-ascii?Q?T1Tk0AUIikC0rzWK+HLeydkHeKhvey0CW+kVxpGtgUaKeQX7GpMKRe/BerpS?=
 =?us-ascii?Q?zLai/ZTker3Tg3WWj4KV6ctzTg0DsHV55iVFHqwNLO0zph6wJHdMSp2/tmKU?=
 =?us-ascii?Q?9Pp5TX7K0lsR9Cb6GkApzBtHxaOp8v4YOEIXYJLc9dmjeG5o9VRhbkjZdtYf?=
 =?us-ascii?Q?MLs8I89mLWBS8aC/rgnT2ehxJcy7efv6L2sj5UvAYHne/LHfPCwJ9iVPB6gW?=
 =?us-ascii?Q?Q0TzOc52fAcn3Etfhq8GhTetg1cNBdvn214G0EaKJlBH1zy0S4nHOgJ0Qw4D?=
 =?us-ascii?Q?cpIcWVlQB5ptn8FvCrOOpPoAAooGBXo13Vw87eKKiVs+0/Pg7ceO6PatrwU4?=
 =?us-ascii?Q?X7sNjlrujmBfisEacjwXPyEXy9mJkC4DGZM3zsKIlCzWAZoTXJImLhZGYJdO?=
 =?us-ascii?Q?iJvcue2j17KptjEzp11NBTV4Cl5Z4JS0N/nLXDFf1N9Wkx7vX+jcBxhOcN2s?=
 =?us-ascii?Q?8jdiiiRVgXqwfMUvO8EclLf06hjFshw9XqORxe2knPc3QNkK6GDieL28WrFu?=
 =?us-ascii?Q?QWY7e3EJYQylIVb+sa2Hk6yhf9fmlNDJfusxj6BH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a489cf7-c059-454b-e470-08db810faf44
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:17.0154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrEXwhXuyklXn2vhkPfls/V8mXVBaDJqBI682sy82N8RQijoHCyHgWa/y0Nd72Y0lFP7UtwjxZpKYkgsDj5x8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-st.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 25c3521cae0e..ce2333408904 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -812,8 +812,7 @@ static int st_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.39.0

