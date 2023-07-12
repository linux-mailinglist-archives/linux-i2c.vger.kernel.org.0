Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9DA2750525
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 12:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjGLKwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 06:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjGLKwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 06:52:40 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2132.outbound.protection.outlook.com [40.107.215.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5644BE77;
        Wed, 12 Jul 2023 03:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JubuFrdkI8GH5WR1/ZJ5/YMiumg2n0uqXA2P1/vmuSUTHG7pi0WWSJnJaNLuxfpI5difIPrBQcAgMEzJqukc0fy2HZ2OmGd7sA50ygXsiFrtqTCnanY5fhCPIDZUxweDjij54G8mdKOuJ1QhAYqMkEtK5IB0xefoWRBinHbXO1fSTJLVNKidMoDbNXPArBLZw9LFER7bLmaw6rInVIDdp6K7b7SL9V5yt5qcp5vGfyRqHSc9zLCQZ1NXb6p3H0UKEzzzZk8U7/m94AgvmdhAT7bwyCAGmYbCro+mmPveygyijbbjsNrIxm+pT34QEvOeohzKXXVdnqqS/jiOYQKKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7I8KX/y3eG679NMKsc6dWCOKLapVLoTrMgx8Iug3CU=;
 b=gj+xfBvcLmKaeAZD2K9flB9/Kpeg0N5tGYHrueBfW4g1A50AYsYLbm/XDA90V+Vs2241YuKgpVmy+twryr7CYvhIz7VBC21cQFphN8i7NYmxkAO21/LmY9i8XnwCgrRjv42aHW6+B0K8HSqklX1dXRwao55y6YIjFUHBRUYlRtaw6Jr+wb/b8zek+tXT1JkekZYdbd2KW2MoyUigrKJt62tRFdQBZENVwAZM/CtHizvnSwFxcpOFBgkGC5z7sYgtCkcSOkd80x2q1suuCpE7ezCaOXWszXNAA1CfqZ+j4DTD58q/+orMXsHWr8vRYHE5nWK/AINnxc77fzb5I9wJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7I8KX/y3eG679NMKsc6dWCOKLapVLoTrMgx8Iug3CU=;
 b=hEago5gkKTmdCZkkoqly6NWxZg0gWgl21TlCG29ObWzLM7aDgJFWvmRnxWYkDOu2XrlYhmbZ0muBaEsRbPhBglHADB8+XQjUxbBy+w8ArECKxqLja0Qhu6O/c4/p1SJR+rVP1LnFx4cNRrt0MvmJ8fd/LJBOKMg242tLy6W4tpEzm6Y8OyT4fwGE8iDEMxhxW40lGllP0wubZJ/+WXpGS9H3FLEU+E0iv+osO1X5VJpEdfNDUFl4aj7HVcfoebYudvPKo+CsRY5CHx0duUjbHJJ0TdPZqzjJIOhx2OwORBUWkZDo5YPKlLsUi4kxGWuUnymyvUFhEo18nFhtHz+mVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYSPR06MB6766.apcprd06.prod.outlook.com (2603:1096:400:473::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Wed, 12 Jul 2023 10:52:34 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 10:52:34 +0000
From:   Minjie Du <duminjie@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Cc:     opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>
Subject: [PATCH v1] i2c: busses: fix parameter check in i2c_gpio_fault_injector_init()
Date:   Wed, 12 Jul 2023 18:52:17 +0800
Message-Id: <20230712105218.11056-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|TYSPR06MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: df65577c-ed15-47ce-b2a3-08db82c61913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrGIHCP36vtnKtLbpikk7GfrZjgx4p9N+O49BaMQ+lK+29Tp5jOAT1eA5dh0+apWm1LIV+pdXoWll9RRIeGvefvi9zqnz90W6NcpKZfktnu8f3V+i6PDyqwnlndGH4mQ6rjpgjQ8dcYcMheXazVubXbzf9BGV2DgT8ALcPpvbAgWR69mm+gOOEayF8jptvHMLa6kUyUwixz2Au+BfVdv+knEYhygUkS1TyK6+DfwTDwxEpnYD551Fw2HIi8pkaxTa0JVypPWA8jqXWCieFC0nl4n9AqDyQUI4qAVAEejC184UcJnK66SZPBBVZCYmUxOFuzCrnkFk5V2jtpNknL0yGLnvtQsx+fDE2/RdO1ZU95NoYq8jmSw4SqvD+ZkudT7W3IZNLZFVPbWOZ0rygmgQeXhb6/52gOQS1J1Mhxh5w5M17pgsdcq4xisGJIdwSRnBcSdwmRU5kNvjeO0dCQJPz0YV2ij/bb5H96pGfOaEIwd0JmpvIGIe+caXXI6a00YojFKvxOYq76i6WzrDnk18VodxbrnlyRWClquVEo0Qasi9i4h4yjCpnPMTOs8BFo7XP2UkZ7IUaAnFYMZIi24eBeEDQfzdD+Km106tWmDREUkrhMCxwu0NqnN7uixXPle
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(36756003)(186003)(4744005)(26005)(5660300002)(2616005)(2906002)(1076003)(6506007)(83380400001)(107886003)(6666004)(478600001)(110136005)(41300700001)(316002)(6512007)(8676002)(8936002)(66476007)(66556008)(66946007)(4326008)(6486002)(52116002)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyKkM9G+PrLrg2RD9UAHBI/QD+s0j3lSAv2HLvTZUm0tmtwhLbVmq1CXkpsP?=
 =?us-ascii?Q?5xObQSybfV/kIuafw+R8p654VjJZe2WauLk2ejBMHbDarNXRt/EsTF5nwrcd?=
 =?us-ascii?Q?oCel6SB/fP0zugd6wh/tNeMJBzGaTBFkhzYKtAht16OVDpEEOuADDfPjoLkk?=
 =?us-ascii?Q?8+f4LZy9CJUTxoDvya1M88ACHxuabN49N/bx5K7NIgQLo20huoxG1Dz6H5iT?=
 =?us-ascii?Q?x6pJY50A/36rZmN2kAGFLdmDqcdq+0Cn3PAQgozSdoyZaeSkBl9F8iwJ/kzo?=
 =?us-ascii?Q?kVb1ICPrtCNFPntP/D20L0sNe0cxjMpabkjS8d+WsaiIaHYFFvArttDOtMRI?=
 =?us-ascii?Q?1dw8FIds9uQ/4eHwBYoun4rFmD9qiPymf7nH1pLTysAWQhoCmtxll9eax7hL?=
 =?us-ascii?Q?zxY54C0IZL01cXUhCbY40FjrXUPjV4P4zsCUhnCSL2ZYL3n35wJaY3gnE14a?=
 =?us-ascii?Q?s7q5qwr6djtbIPFduIr3N/8es1NxywMmsGJ/8ZMUp2LTCGVZ0Lf1CWj4ulnX?=
 =?us-ascii?Q?epfaxjFWXj1AvB3i21jxP0eN68MuNFAnXBTyBtpX/zk1p1qXgGTxUlHzhQ4V?=
 =?us-ascii?Q?BaLOYj4S46FiUn2On60171sa+7nrk0MOKlCcsFPSjfhI0mQWnUF/c1jI9lqI?=
 =?us-ascii?Q?V7TdkSiaDtEeV9vte12nPTK4KYqWi35hec64h9BlxiJxpuvqKG05XOaXEHZc?=
 =?us-ascii?Q?uIuEiSiSXoVOVgecBMzwbyi7J8IrYeELfUSyB8atxDB/NqTupbHa0RVcTTcD?=
 =?us-ascii?Q?F4c4Rc7u8JPjXKcHacirceMac2oUK549eauDtCbRifDBa0wDirhU6So3eJlY?=
 =?us-ascii?Q?Z9NdYeCn4tKStEg1YnnLz0kksB473Is9Wf+YZxCtjl1whstLj/ykHoBECqhR?=
 =?us-ascii?Q?h8T9Xp20vqD492i2SXJAjWd5dWoxT3ylSEwekQYw9LxTABSlhbiwwXWDzdlX?=
 =?us-ascii?Q?TYhV07NFh6SN4EWa3X3fZEqbbRPsqdF4uYoytJmxeJ+kE8zJT2rjffFpCbU3?=
 =?us-ascii?Q?kLLUC2PttAxNIEVl9yeqey+OABK5lvQg7shDaVALwypVQPnZsJl/eAd8lWVf?=
 =?us-ascii?Q?+/NcSfcaX6zBjof8r6n7TnXfljSroAlrIKWea+4ebDSeZaoxgJvIJylD/28C?=
 =?us-ascii?Q?lGEk0BSvh9jM+ByOJGykxFSeZuLivqAUT6vRHz14W1xKHG4W4bb1ewx7/va2?=
 =?us-ascii?Q?XUNIc+GeZnWnut7qIgyvyNRbNxzhjHoWEAucT9n6/xiHCtlnDHbzSPE1YEoE?=
 =?us-ascii?Q?IZyM3sMm+IMbmLVAnGK2VjclDrpN7jQrk4mv0AzFw2OOmAKM1WZUQlgb1XBs?=
 =?us-ascii?Q?+E4d3F1ljrdFi3lCe1GuTrCzwOtVLpVufTm1lqBEtNs6DcbO5HW5oPRE4IXE?=
 =?us-ascii?Q?/Yjbt9pcaAs5czgTcKnmf8eb8VLywmwfbibWLleiWOujtcqgS2zdnPT62Xlf?=
 =?us-ascii?Q?Sk5etQoIbDEHPhOq7N7kNwWDuDmKiIlzHfEmEpiQd2lwLLP8Kk+LJNYc6Nzp?=
 =?us-ascii?Q?uXnSVG8Ne4OIRuobueGK+tWwZkJI29OXnPG23k9lD6PZh/JiccVszwRfAR0x?=
 =?us-ascii?Q?KSExYkAezzw+lN77XDD5of+iyB4X1vii2LrOunjH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df65577c-ed15-47ce-b2a3-08db82c61913
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:52:34.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2GhXP+8dag4Kx0cSG0t6Evu0PP0hDuALTTghx0VWI7ndG8189cTw6mh3AlomoW9UTNVnw+k5DgKFQ5Vdc0jpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6766
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make IS_ERR() judge the debugfs_create_dir() function return.

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e5a5b9e8b..07719ad74 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -265,7 +265,7 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	 */
 	if (!i2c_gpio_debug_dir) {
 		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
-		if (!i2c_gpio_debug_dir)
+		if (!IS_ERR(i2c_gpio_debug_dir))
 			return;
 	}
 
-- 
2.39.0

