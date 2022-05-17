Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94244529B87
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 09:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240314AbiEQHzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 03:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbiEQHzb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 03:55:31 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00131.outbound.protection.outlook.com [40.107.0.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A58343493;
        Tue, 17 May 2022 00:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjcKGPnCzsI8h446ft/weukIlxQj+iHGZMQZqqeaAR1SdzmbiqgyPML7C7jkSW9DyKVn1IPKX4YLAJOsdL/GQLBpX4GY68CFdbSjZw9nORyrg/yeSrjLeniYAmOiuN8AWHwba/34iu0yVs3JOj6ghVAflDA8Fyci7YjgWD6+4zEqfEOmzDMgS5O6j6Z2VtDtbHf5vIFJ3zUPBIkm/m262QTPvrQpmjjrLcwAzDRURvspksm7P8mfk/F3Ud9AvzQs5JSPRh92ppaDHbinFh9m/PVzZAuEnW7KaLV/vz7JeMyQaZxU3Ccxx3fNy554x1pPGb+YI7OPUPvEgevHEpl4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW0rm3/3X65cbejMyndCWKt542Cy0QjC/qJPhQ96lII=;
 b=J3QHdv/yeICmj4g+cJt197Y5lgFHlkvwC8mwYyvZmFFU1+HFOngEBl/BVxrKxIY2khNNHX781YKGjsoRmQZ16FEpoaDm48RuRQTHqIRTBI99QRUfIykyeXaP89zTh46sdFh0HvWbGZ6GiHhOuF8z/75PwJNhon2RrQH2gi8f92sYGyjv/8MqN6O3SiItfASHNl69UcI2Oe+vgGeYh1NUXIpNr9+jKpXkzkWNtXtQ+8XZWeN1lkobAp7wFMpDA74wydAT9kYqo1fiD3SqbzNZgbYvSOB/urKDsUs877o4X5uaCrZP4oHXlICw575CN+msw00iHQ0mD8qzodx16LvaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW0rm3/3X65cbejMyndCWKt542Cy0QjC/qJPhQ96lII=;
 b=EKb1PvW7qb1Qc1gYrXRg3eojtMGcUlewVPfh/jT+Nby3j2vxGXlc4EeIusa48T7t5BcepuduryIfpuY+lU6sOgTmL4FreQs/VhnEgDZZTDDV2g9RO1yWYDywV+L07RVJr98vgyNGYCAM5KMTUEVKJLu4n+1RkfAjLg1HA/SAlOM=
Received: from AM6P194CA0108.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::49)
 by HE1PR0702MB3547.eurprd07.prod.outlook.com (2603:10a6:7:85::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.12; Tue, 17 May
 2022 07:55:27 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::ef) by AM6P194CA0108.outlook.office365.com
 (2603:10a6:209:8f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 07:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 07:55:26 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 24H7tO3I015141;
        Tue, 17 May 2022 07:55:25 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-i2c@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: core: Workaround false-positive LOCKDEP in delete_device
Date:   Tue, 17 May 2022 09:55:18 +0200
Message-Id: <20220517075518.43613-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f8bc34c1-c158-4ce2-4fd1-08da37da9acc
X-MS-TrafficTypeDiagnostic: HE1PR0702MB3547:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0702MB3547ABA2A343EE17B539FCAB88CE9@HE1PR0702MB3547.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tw7taR2Ypre/oxtE53iKXb49uwzBo3YVmNPWGNKk9IV8CQAa7ZwZul6wJu2A3iS0q+A8ApNG+NcSCiWYYWu/accAX3qeyeD7RkUmPzUAAucKH+RVImFlGuo9aMuEgWGb92WUyjbqe7C7hV0E0pe+dgDcPYSlpZqNWa94MsPfQhAIpbt3AH7TJiKGhfjcg36PJ2Nrgmv5Lpm5Cc7nrVrazylsx3EGDucNzXKTDseq0JmolBM+upmfGlkdl8J4TV61qGCEKny59tErWYqHoxz49+evsc4YAXmhhPKnnIegUGMDyw/0yWzRlGxhIAz4GkgMX2vphgHUsPoJGlIN6PfVlSfuAyFfxikK1lCpL3hkAsB7+TnzV9HrK++p9lvjNRXx3Sk+alg9RLzkCrAIGkIdiPNJ1rf1LoWrxhKvuDinf4cJIOsuQaf3csemqAPnG1XJ9cofmWehvqZFYx58c5IGxrw840ih3z0/u5pAYyhcCIt6gq4Af04FXTZnf+JQwldM2V5NYd0VUUaZwOAkBjmmFw5gYbDRadVASiFPhpC7KCKsCPuy/eeuYMoWAOwLE5qT8TxqtD5jRIt0Ick9kdiNjtkrIxsYioAr4JO6HnUModK/npJ65naUXHQsJyKzXHeTR1B+CVNaY1LETGnewiEVJn/dV7MdLH6wQ8mmHHX7bdplwOFH25iGjlA1V8uELKgMkyj6B0uRFUzeOQE92YzgZeWHU6YsPiveuIBN6oRTe9Vy3ckvD9nUW+pcn7uWNfaYRkt++ZcVK9nFCTLJwIGMQw==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(40460700003)(36860700001)(54906003)(356005)(6666004)(186003)(81166007)(316002)(6916009)(8936002)(5660300002)(508600001)(70206006)(70586007)(26005)(82960400001)(2906002)(36756003)(83380400001)(86362001)(336012)(2616005)(4326008)(47076005)(8676002)(1076003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:55:26.5044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc34c1-c158-4ce2-4fd1-08da37da9acc
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0702MB3547
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Drop the mutex earlier in the loop so that LOCKDEP is not being provoked:

WARNING: possible circular locking dependency detected
.../9201 is trying to acquire lock:
ffffff85656d4e78 (kn->count#159){++++}, at: kernfs_remove_by_name_ns+0x5c/0xac

but task is already holding lock:
ffffff857b329e80 (&adap->userspace_clients_lock){+.+.}, at: i2c_sysfs_delete_device+0x8c/0x1f0

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #1 (&adap->userspace_clients_lock){+.+.}:
       __mutex_lock+0xa4/0x924
       mutex_lock_nested+0x48/0x5c
       i2c_sysfs_new_device+0x108/0x220
       dev_attr_store+0x48/0x60
       sysfs_kf_write+0x54/0x80
       kernfs_fop_write+0x120/0x240
       __vfs_write+0x4c/0x90
       vfs_write+0xe8/0x1d0
       ksys_write+0x7c/0x104
       __arm64_sys_write+0x28/0x3c
       el0_svc_handler+0x90/0x200
       el0_svc+0x8/0x16c

-> #0 (kn->count#159){++++}:
       __lock_acquire+0xe8c/0x1a90
       lock_acquire+0xd8/0x270
       __kernfs_remove+0x2fc/0x360
       kernfs_remove_by_name_ns+0x5c/0xac
       remove_files+0x48/0x90
       sysfs_remove_group+0x50/0xa0
       sysfs_remove_groups+0x44/0x60
       device_remove_attrs+0x60/0x80
       device_del+0x134/0x360
       device_unregister+0x28/0x80
       i2c_del_adapter+0x210/0x2a4
       i2c_mux_del_adapters+0xa4/0xfc
       pca9641_remove+0x24/0x34 [i2c_mux_pca9641]
       i2c_device_remove+0x60/0xd4
       __device_release_driver+0x164/0x1f4
       device_release_driver+0x38/0x4c
       bus_remove_device+0xe0/0x15c
       device_del+0x13c/0x360
       device_unregister+0x28/0x80
       i2c_unregister_device+0x5c/0x70
       i2c_sysfs_delete_device+0x1b8/0x1f0
       dev_attr_store+0x48/0x60
       sysfs_kf_write+0x54/0x80
       kernfs_fop_write+0x120/0x240
       __vfs_write+0x4c/0x90
       vfs_write+0xe8/0x1d0
       ksys_write+0x7c/0x104
       __arm64_sys_write+0x28/0x3c
       el0_svc_handler+0x90/0x200
       el0_svc+0x8/0x16c

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&adap->userspace_clients_lock);
                               lock(kn->count#159);
                               lock(&adap->userspace_clients_lock);
  lock(kn->count#159);

 *** DEADLOCK ***

5 locks held by .../9201:
 #0: ffffff83f29c3ce0 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0x74/0xe0
 #1: ffffff857a2f0410 (sb_writers#4){.+.+}, at: vfs_write+0x174/0x1d0
 #2: ffffff856bbbe680 (&of->mutex){+.+.}, at: kernfs_fop_write+0xf0/0x240
 #3: ffffff857b329e80 (&adap->userspace_clients_lock){+.+.}, at: i2c_sysfs_delete_device+0x8c/0x1f0
 #4: ffffff83f134ad80 (&dev->mutex){....}, at: device_release_driver+0x2c/0x4c

stack backtrace:
Call trace:
 dump_backtrace+0x0/0x180
 show_stack+0x28/0x3c
 dump_stack+0xf4/0x150
 print_circular_bug+0x21c/0x22c
 check_noncircular+0x15c/0x1e0
 __lock_acquire+0xe8c/0x1a90
 lock_acquire+0xd8/0x270
 __kernfs_remove+0x2fc/0x360
 kernfs_remove_by_name_ns+0x5c/0xac
 remove_files+0x48/0x90
 sysfs_remove_group+0x50/0xa0
 sysfs_remove_groups+0x44/0x60
 device_remove_attrs+0x60/0x80
 device_del+0x134/0x360
 device_unregister+0x28/0x80
 i2c_del_adapter+0x210/0x2a4
 i2c_mux_del_adapters+0xa4/0xfc
 pca9641_remove+0x24/0x34 [i2c_mux_pca9641]
 i2c_device_remove+0x60/0xd4
 __device_release_driver+0x164/0x1f4
 device_release_driver+0x38/0x4c
 bus_remove_device+0xe0/0x15c
 device_del+0x13c/0x360
 device_unregister+0x28/0x80
 i2c_unregister_device+0x5c/0x70
 i2c_sysfs_delete_device+0x1b8/0x1f0
 dev_attr_store+0x48/0x60
 sysfs_kf_write+0x54/0x80
 kernfs_fop_write+0x120/0x240
 __vfs_write+0x4c/0x90
 vfs_write+0xe8/0x1d0
 ksys_write+0x7c/0x104
 __arm64_sys_write+0x28/0x3c
 el0_svc_handler+0x90/0x200
 el0_svc+0x8/0x16c

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/i2c/i2c-core-base.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c..bd2e3e4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1272,9 +1272,14 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 				 "delete_device", client->name, client->addr);
 
 			list_del(&client->detected);
+			/*
+			 * We drop the mutex here, because device unregister
+			 * will take sysfs lock (kn->count) which, as LOCKDEP
+			 * would think, depends on this mutex
+			 */
+			mutex_unlock(&adap->userspace_clients_lock);
 			i2c_unregister_device(client);
-			res = count;
-			break;
+			return count;
 		}
 	}
 	mutex_unlock(&adap->userspace_clients_lock);
-- 
2.10.2

