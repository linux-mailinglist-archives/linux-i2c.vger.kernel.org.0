Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C671644257A
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 03:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhKBCQC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 22:16:02 -0400
Received: from mail-eopbgr1300135.outbound.protection.outlook.com ([40.107.130.135]:46176
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhKBCQB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Nov 2021 22:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAqg7rEQSqr88HH8/LcXhMv8amYA+IY+xVh/meQ/x9+N0Km9ftnkn9ifpa0riIolepSeb7lMd+o2Rgo+h+SDJZM/jmAHDffB3vGj1J31+5usF7pF/Ua9j4nytfv1pKpOdKOd5nMIS9L6ToPNIvaWdwjmlkiThFsdqkdzE/l8OdWYdYs3hRP3rhETuXc8HTyD7g0jdCY7rOl1nxxBSmRoRfh7RuHAjmqaGt9JzhJ2XCEZ+R9eC8o+VilBgDZLQqhHX8nQIygZkHfEGWZA4miKR0idLfzNoQDGIp5c6Yity45qfiVDGGQs5PwByToWw+LmsBBb0aI96+EfGHCZKnYLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvjTGMQKSzQATqfp8yANf+cVUtzQtfm/YGBqM6RJsOc=;
 b=L9SdJeavKInJD/WGj/wyVpJvNk9QgZ1KhLrDsAsaYIrWIPRXe/PGQDiUCUO77uX54BuAkSJEGoFsLMCjHy2UPrFfrxpYrcnE5uoP3qIaN/boG8uKKqfELL8uBBY6w0fWdYkgEm3QHUQbFFUW0DbzodXnIo0sw92Hx/DiHxm8Jc9K4RttLjLoIPXKS/DchXdOyzcSanWcPoC9+m+7biAJj7bIDvKY1iZJWNLX/CDQIsBAVm/odUAasWFKDSMja9WprheIn0KDULXMVYRttK1I4r7K8ztwlft3qxbDmWL+Jh25h461EeEOXuWQHty1XIVko/DDdYaFL8fsOsVbSspWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvjTGMQKSzQATqfp8yANf+cVUtzQtfm/YGBqM6RJsOc=;
 b=SF+A0U7RsLcXlacyknaGGkZ59HRYQFtnVeCfmyg2Q0otop8Tn9aQ2WOMtpUeHqxIxqbZCC3BDR1wWZ6G1IngEp3AdG7nozXWj6Jqi82XP62IZ+oXhirLCQvwb45szpvtNq+XBwtks0i5BxIknpO5dIMJRozIBiLxmnaFvIVDBPE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2107.apcprd06.prod.outlook.com (2603:1096:4:c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.18; Tue, 2 Nov 2021 02:13:23 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 02:13:17 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Wolfram Sang <wsa@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     jiabing.wan@qq.com
Subject: [PATCH] i2c: xgene-slimpro: Fix inconsistent IS_ERR and PTR_ERR
Date:   Mon,  1 Nov 2021 22:12:27 -0400
Message-Id: <20211102021229.18501-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::22) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by HK2P15301CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.2 via Frontend Transport; Tue, 2 Nov 2021 02:13:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f98d84f1-b3bf-4179-4892-08d99da65540
X-MS-TrafficTypeDiagnostic: SG2PR06MB2107:
X-Microsoft-Antispam-PRVS: <SG2PR06MB2107DF14AC91BA8794B9A78BAB8B9@SG2PR06MB2107.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zdE7DKY84nybxdulPlc7niUWiJpwo+9RXqH5e6esF/6xx3H4g0qHRDPdtvkiYfyLUqKeZUt6VAPndKq6EwXQo5Cjay1dyHAjGtFDxmpOHtPjgpurVPeAaJhKVGRRhFjRs0Mi8vUwiJ86GMeCrIqbZsOWzODG8LNeN5Dh3dUzTShOpxzWIJSoJb3X5GRUjxJkihBB4kTPMEpMG/6Yd5o0WP5Pt3sr7rB2MkVYS7StAhE4ZQE8SAJELmVy1dbIVvWdew8A7OkA4sbIUg+taOrjhjKc18wcQJac6SyxOh9FB2s2CvvSTtuEY7z3/CLFoS4AqqQKuRXCjJqWibtRVNtuyzF3CHXPltPFcuqM8DG3TbWzZLcaV0/xpKNlEiS4Cz9ybV/fu1suRNZCpiQcJl08BfXiW0Qm9Lx+JF25oo3ECwhsvBwboXSFopWdTJo6CeAVQp9AD/TV9uxZaD3ykv5+iRW8Bbpvy8pka9uTAM39NYh3q19UAOYrExAdQbzzAUUe5+W8MJxa6qEuoL1BON+hMj0KyW0HNY9s1klOTrjIHQ8khX6KOIPrSTEcbd894FdKzCYdelZraxAQFieFYY7QYlxRSpsTlM3quZ+PF0QRplCAON0Mg4yeHvJREUmrE24Arij9oIBJKQJpuiF0iGqEnXXIACkE37aEshLEAdcpQY1U89hhwMUTZZ+rTioJP4UutnujzK1PIH1u36O2lUPrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(5660300002)(66946007)(66476007)(66556008)(1076003)(2616005)(956004)(2906002)(52116002)(36756003)(186003)(38100700002)(8676002)(6486002)(86362001)(26005)(6666004)(6512007)(316002)(38350700002)(4326008)(6506007)(8936002)(110136005)(508600001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eXGk9oHig4l6TYONZ3twAFYJBu85UhUojjvpZwsaR46x6qBhGjdaVMXFKpcG?=
 =?us-ascii?Q?0oHb/BUWnHh0OwJ37VpKJ1FS9KGn+oyLR02v9aK5G1TIeYhRgG11hlakybvS?=
 =?us-ascii?Q?r2uI0Ei9j5uWBC40QymW4mXRChlRRkNzC13qVdcM9ZtLV7Hb0Dn67axrYh/3?=
 =?us-ascii?Q?YK7MtLJcSc+OGH/BwGF6aChAlPlWjdRLohqRSbPGQVHvTVzXRT5WRcaNix4o?=
 =?us-ascii?Q?PCz139nuXKTaGj9yw7qB0qfhfB60f+gTEtUIPgiLKFIYW6gAkzB8mdGcsDT/?=
 =?us-ascii?Q?QaHHurNThYQFldw2ifAe79/+ddOzL8NKzHvyPT9tkPqwZyJC/hnV+Uq07gYG?=
 =?us-ascii?Q?rPyEecAjFR3sA/JRcoIrf4gwermsP7yc1tx6PrTcQSoekt/n363LQ2tdD8Yk?=
 =?us-ascii?Q?XFsmmr/RBwLEbwSJmPhPjy0dc+2m9S7eARYNihIks7O+iuLJw9cx/4lV0PRw?=
 =?us-ascii?Q?M+ydxIxpJkQ5XWxOCne2t0dbzJ0U5TIxA6wfTTsmMah6dHamL3ireeTYkz86?=
 =?us-ascii?Q?tSt3+FpBr+RWqm4OtYtAgJLSgJgX5fzozPoWyn7icZY1oL0PtiOZT8VFWKyx?=
 =?us-ascii?Q?wP8isS1Bs/CVlBwFLOtZUj8Hj/Klcu2NOmJ4kmkmn3J9kfOJCpDRKV/69l/E?=
 =?us-ascii?Q?ttjJj2LpLeQiTfHWjUFJBOVKV1nzLC2P9Fjth2CPA+Qh7wAYZVevCJ4Zc4NS?=
 =?us-ascii?Q?+uZWXnFn1t5DTVeOTAXhf8pCgXouY16Wvuo9ZIgxAaDljsQKt+7l/dFIteph?=
 =?us-ascii?Q?Qwmyrq1H6nbY7PZ/VMFBbg2s2pAh2LkmZDgLjTlVkoK937urTYUZ8EOm5I2L?=
 =?us-ascii?Q?l2ekXnCTjgzc0G++tl8tLFOkFPKWnE6TWMjbCR3fLyxzMlTfql/zRMfwXgKv?=
 =?us-ascii?Q?VQrnJDAPD+fvDwyxyRZPPCnBqYoxNSKDlVAWHu/DxGw8drKclstMJypqsmAS?=
 =?us-ascii?Q?7XpSqLHMrvsDwYcpWpnTVwu2qRuQYz2VKx5iAk7ZHejxxx162NtqT90y7e71?=
 =?us-ascii?Q?iR61ht6DaepNGtzWiW4hAf6O1FEwXOI/I6qn7SZzO8YKgG6TuE6trepT3z5K?=
 =?us-ascii?Q?CUijJ6GVD44dX0C8Ojfiuol4lxL9n02JOC0ThuegtTQfjD691+7/djf+9OUk?=
 =?us-ascii?Q?bjx4TLWrdsmxYf2iQZxebeOlDW+wxYQkZLX9tbl74W8mJlvtMfEVJMLXuP9y?=
 =?us-ascii?Q?3IcGgeNpHIaDkZuC8QqNWYlzTI0OyzFKRedF7Zp+4atGiP/U7CjMlLxWx9T0?=
 =?us-ascii?Q?kt6oUSZrm2bqJDeIS/+Ncpxan9tix0HWtqv+eKjCNrn9wNMFxpUNnBUnHnr9?=
 =?us-ascii?Q?8+csBIElu8/IueGZItbd+im4O53cTTTUP6dLUiVie2Af5Ver0PGyFVFQnCAW?=
 =?us-ascii?Q?4pPv+YIsksgI+C55dwUY2Z8rLpKue37UHtZ1/SB7Ae4Fx/E+0/dYGyLqRvz1?=
 =?us-ascii?Q?A4QHZ3eMWxq1++9l+g31pRs0k71EqFg5hFxQXOpsHt4YaUwPx7HxgPb6r2HQ?=
 =?us-ascii?Q?PtB98n6N4DBwu88pS98Q4X/QjcfswHY4jpLUgKqRP5gDjsKmV+AHlb605TgQ?=
 =?us-ascii?Q?3JdwvXBB3omDFHn5fVB0myegL7DMvjTcXK7XTkrEfI/Mbz4KCtSEu59CM7M7?=
 =?us-ascii?Q?OVCPvrbz2d9dPow2i3eDpIY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98d84f1-b3bf-4179-4892-08d99da65540
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 02:13:17.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 358fLQjj9DHL2WzIQICbi1adbBHZhJ1HJsDzhUH8ohhOzACGO3nXg6Lc6pMAT9VmcmNXMc6Z9jUdM4J/PDeQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2107
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix following coccicheck warning:
./drivers/i2c/busses/i2c-xgene-slimpro.c:488:6-12: inconsistent IS_ERR
and PTR_ERR on line 490.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 1a19ebad60ad..63259b3ea5ab 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -487,7 +487,7 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
 		if (IS_ERR(pcc_chan)) {
 			dev_err(&pdev->dev, "PCC mailbox channel request failed\n");
-			return PTR_ERR(ctx->pcc_chan);
+			return PTR_ERR(pcc_chan);
 		}
 
 		ctx->pcc_chan = pcc_chan;
-- 
2.20.1

