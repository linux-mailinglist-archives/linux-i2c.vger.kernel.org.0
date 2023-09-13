Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C1979DD59
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 03:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237980AbjIMBD4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Sep 2023 21:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjIMBDz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Sep 2023 21:03:55 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D33C3;
        Tue, 12 Sep 2023 18:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIXVNm92r9VNloV7p8vS1Ohr9zv6p4k6K1ihHopOz9S6rlJQORFkCUz2MqnqXGQCxGF6yVFH7nK15nEgsqQA1FVzkplrk9JNFBW3D92GTuKQAiJ6plBswAIOBdp9hTDj/oTDHEZdVLzzrC4s3jsMtJNBuT9qgo/2deXI83dY6WcfT4Nv5YkaU8TevueVyzQE/uaVY4wptkwN5/lVkJu3jx0zff/FmxOseffqJADOAjGeK2EOBdWMkYqPRV4GOgzWab38Dt2EMlibjbe1KSIVN8J5uFpHXyvrNkpkzeZ3q/FxvTGWXQSTCb3wqZf4eEjtt1UnK5pUM8YUyvpElj98Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSxFv3vwBTMBWo1Nt9Ofel02uMjVuVksJS71uiEsdwo=;
 b=U2u8WJm8T6QNkhs2f+GTP7phRJZwcSXT9ckOIVQFDbW9fblRXu/PQazMJQ7UCRGzwYL/0tSP2BWzOnix8sRcBAzqx15OuY9mZeMm0n1AaL39ojhcqpfBtnTJKGpqKtuT+YWbLbgchP75i83c8akJnkY9v5uGJtd+jHBkBay9ddBbHzuhURds7x+55auP1ShozsQz1uSRZaiGy1QRWZGAGDQhwV1IUAt7bMPWy8q2jifcp52JfLA3a9qnyeZU9PsycPTZnWTbRfReasPlyc5nSHTO9HGfkt2PEibZJkKCHEX4QDRRs3kaeTlKceNQFFdFA6nBSndMUEt7B3EUjFdTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSxFv3vwBTMBWo1Nt9Ofel02uMjVuVksJS71uiEsdwo=;
 b=cfOZO9JSKb6ftViGaHDSpT2KBtn3FEDDFwiQgL7Fshq0DT26rxKlyO5KqjgkI2EYlzQgbf2HzBiw1whvWpniPaQCr4QRQtkfn9j/XIGLW58+le8VNidbFcW5GBnrCXNXBDEtwemjybUdpjbj/DgUD5UYfks5WMSBXdO6Gk4VcUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 CH3PR01MB8575.prod.exchangelabs.com (2603:10b6:610:168::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Wed, 13 Sep 2023 01:03:48 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 01:03:47 +0000
From:   Jan Bottorff <janb@os.amperecomputing.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
Date:   Tue, 12 Sep 2023 18:03:13 -0700
Message-ID: <20230913010313.418159-1-janb@os.amperecomputing.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:610:57::13) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|CH3PR01MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dbe1c4-1972-40e0-bc92-08dbb3f54900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3DD8HADbjXZj/4CmvLGVYEWLDDXoqCV4sn6JTocZPgbI+ocDy9OOcTeOx/xEEN4vUKe/ySbUhx1cuvJ0fsoqFwjhrpfZ5tBt4SDdNcvdrqM7v5YGcaAqBFMe+WpBs/IOCz4EVerAvbqrs5UM8D8k6Lnm1RmkYXNLWyJLXrWNk4Z14j7coQJqP+GRFKAuKbIijEcPq/4g250emIvB98KBgnMZa7jw08Eeo98k2t5v4k0MGZAxMpR68BvXZeV9M+uGD05Vglv2qRlFiZN8zs97Ghth37zOpyJMu+BuguMiFhxJqKjH3vX4IbfzBKaInz/tnsqrMKJz78tKhqJ0L753qdXe/N5Trzfn1IfmBPBHPA9LGdBbjulpm+wEhwghWaDymihOtCw6qXzfvWj3MHzN0tbWh8tlAFyd3CVwlqu+TfyifhN/C5cwdCwBZo1CmW/Z8NHHfD3nHgmgrU7nqs5q0Ll6UsQUEU93oJmRHRw2qEjaqLpyrtRaH8BPkWhroWM3wd8Nm/HcPQY+hEhV3hbooE+JryNgtF/I5wI9iUDUOKsRsFZoPLUCxVLdW1QZFnoP7xh90KXtGV2eCRjcDuoc0+xZN4Nnvzshlb4v+6LLfz8rE2+7ON8TOST7tSwvS61
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(346002)(136003)(366004)(186009)(1800799009)(451199024)(6486002)(52116002)(6506007)(6666004)(41300700001)(86362001)(38100700002)(38350700002)(2616005)(1076003)(2906002)(478600001)(6512007)(316002)(8676002)(26005)(4326008)(8936002)(66946007)(110136005)(5660300002)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VHFtI5jgxgxlcx4KKbQs8mFjJNlxFQS1GQBOoyO8v8ziTAdCn+W9ypWnc7GD?=
 =?us-ascii?Q?DkjWRO2fjXkSEH5lnXAJ4iMen5AIJ7GZYKhWJct7Xx7tHkdk3W7lkOuxaOSE?=
 =?us-ascii?Q?BRuwtQRdqiXPM3bbDEowgjfhyhNrsGmLcLtOg3NjCOAtC5ihtuu7BFRFBuhd?=
 =?us-ascii?Q?U6kMx+SnYFFLCBQoX/i5RwXxWf0SZWIXltzQV8hKz3AA3zm96prQtdSjjbQo?=
 =?us-ascii?Q?MOTktz/54Ey08UlPtJHIWkSi8NVU65+wdL8wWJDOsxVvv6/rGGcEVQo+jaWm?=
 =?us-ascii?Q?EnhhPgyRvwvobiXNGHgCPyAhzTTiFQHRWKkccbSvTUDZVGxFfnpHTnzYgrS+?=
 =?us-ascii?Q?aNphpT7dyTHzhGWvuapWV0LtXt1RlzRIqZ7CiAhFGdGOpYxvy2A1FCsmNPpk?=
 =?us-ascii?Q?IEDQ+gZwJloioowmq021KC8yV3c+VxyuhAksBlfSvppwNuWeoJ2LWof/hMz3?=
 =?us-ascii?Q?9HJyZ105A08XNOQ61sh9T29XCK2ag5vQ8UsYguBksWgfGGIyu3cznXgm6deZ?=
 =?us-ascii?Q?t3Z5IUgsV4YeQiZ50A+/NbrdZzFqjPCOgb1pStz0htDsf5wPZUXrU9EoBVs8?=
 =?us-ascii?Q?741hrRcWmNF6dObs+LE9q2glmjDrLqkgpmVEWUIen+j/9f2oPvRBNwzwm7bv?=
 =?us-ascii?Q?LPjtRcJvLB7H4NELglgJrSe6FYu25jWNy27h3THBJufy9iUtROKlxHkmezNT?=
 =?us-ascii?Q?8Wxre4OhRo13QzKBD8YlckoVcgBXcW7mJLpNpjrBDxclmWpJk53MBFQWlwus?=
 =?us-ascii?Q?8Pi7pnaAq3h1dvs9dQj5tb6JmUk+7YhuHegN9PiskKjmKxoP8ezBI6AzLbss?=
 =?us-ascii?Q?HytZZJzwXKtYgu7YT69mPpxI7mHfxxZ8qauEIn/xhEbrz1kqNwyIB5DzNSXR?=
 =?us-ascii?Q?2TGmij0iAin+n1m4sdDVPY2dqPoYJYpWtEYagk8syPtwTQSz9LRlwfYr6C+k?=
 =?us-ascii?Q?1nD7e1pnAgQhQMNUEuvB1ja35wDoW+6mijsd+7fP1ORj2UD0R7bX2EsbmMga?=
 =?us-ascii?Q?iRE9OoHTa1gFUJ2Pjs0NWJURXO+g1QyUhYhZApMQwCPFVLNl90ozJuaNs1hF?=
 =?us-ascii?Q?N9V99U4hhAgwUXGMntKDwWQvkQMyAd7Br00ehxZrXtn2m7C2aux7iwM85iXH?=
 =?us-ascii?Q?082KYOn6lZGCdJifVOeFHKl7UND7YpFvn+eamGGRsvRup5FxAF0hDd+DkSlT?=
 =?us-ascii?Q?HzxVvPvVnl/qXXD413yAm1d+08gYMMPh0ugbv6Z1CGb/7C/F5g95G4sP0q0P?=
 =?us-ascii?Q?08Qfr0L/0BMrd0EbVjvksgNWRnzOExAC8bAsNRl68fEB10FK6ev39nPIA+n1?=
 =?us-ascii?Q?dwVXyQLop4yALuxurJ0cYyGnDylQ39f+CilRdqXm1aVKBm41NDT2PjS5kO3+?=
 =?us-ascii?Q?iw0yTv8VaXR4GS8BSF3xkaqVF2HvwdvDMzweLZHowz+VdHCZJBSaE+5smtAz?=
 =?us-ascii?Q?FX+nKZ2lKuzte7vePedzC48ul9chmPre2YbPqDClguH5UjmGYlwYr5zgsA3e?=
 =?us-ascii?Q?rpR0ssEpfS7lSL6Tnfsnv0x4iG478gFHEvfA026PHOCo5NYbp2AWE+OnB+1o?=
 =?us-ascii?Q?/ubFH+kxTm5XRURH6pZJ6KtVuTiE5tbsn+OB3voQzEYO7ualli8syQbdM7Uf?=
 =?us-ascii?Q?IgNPHoNnYQ54hEaxukeHfzo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dbe1c4-1972-40e0-bc92-08dbb3f54900
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 01:03:47.7663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYVCK5eZUHF9ji0UZX4cgvzA1Nkfk2Eko9kOqO8D7pXAUyGpPy0qAF786LXPb76ttWU8zJCiSRN1QqskvTSNSvXpmE02CNP+3AbGYEgXA9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8575
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Errors were happening in the ISR that looked like corrupted
memory. This was because writes from the core enabling interrupts
where not yet visible to the core running the ISR. A write barrier
assures writes to driver data structures are visible to all cores
before interrupts are enabled.

The ARM Barrier Litmus Tests and Cookbook has an example under
Sending Interrupts and Barriers that matches the usage in this
driver. That document says a DSB barrier is required.

Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index ca1035e010c7..1694ac6bb592 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	/* Dummy read to avoid the register getting stuck on Bay Trail */
 	regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
 
+	/*
+	 * To guarantee data written by the current core is visible to
+	 * all cores, a write barrier is required. This needs to be
+	 * before an interrupt causes execution on another core.
+	 * For ARM processors, this needs to be a DSB barrier.
+	 */
+	wmb();
+
 	/* Clear and enable interrupts */
 	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
 	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
-- 
2.41.0

