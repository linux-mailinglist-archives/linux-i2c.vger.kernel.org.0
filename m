Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628452CE126
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 22:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbgLCVsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 16:48:41 -0500
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:60384
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728675AbgLCVsk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 16:48:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AowmjzTHyxGS8Q6vTErpbZotEuwkhVh14HYwxI+Sk5ixK3Z3FJ/k5FJzWfjM7fFMPY3J6IWZNxWd0/1KX+RF6bmtMDKbY5iZLkNLhmS89hBSVxDsM0K9Ohg0MHJn7SNSiPyrJ5PEmHTDVMY9qQ63gFfPhF4iiLKcAhQ9NnSrAK7oWBs9FqU+HMqO+VSAsbBM38ZUSxIPi3aExMjBHiWMSbggBuH3j9LvyndogJuvWg/nHDeroqV/b16yv8qkQEj6S0YY63AiqPjmjzifeHQXHHxjgjIGB4BtVuYlPNT6OnS9DpY4DzuqcedERn8W/qctYQNgpgoZpkBejkLSGrK5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtZ8RGKzFiZmFBmsKkVlsyDGb5pnyg86Sdt2ido5c8g=;
 b=k8yKIF4RoaO8AGJmJLJiKkRVKJeuOps1zYyIgI+V6OknQBINgzbmSqQ2HMVMr4qB29KLpTWZ5hPhyYjs3k/+HCEbaIfbnkybAlS5+cVrTZ4zJMkdBfYAbdHK26w/3zUuYMXT+b+tMRljCv6euRd53NSl0rjBEd+nt4VTGM5tKzCSvNdF9jVnJUjgAWDSuiskZKQvw7CN01z2tVWZHfuWnzFat99IKB5hZ1vjpxjW6tjJllpSFZe1UVyeR0k+/nS7blvU0KpmX4WAQ0gaLkR9MEJ9bNmi7tV0BYPT6+x/ufcHx101qNH7gvBvVP5E/3lLJmUEtOrFokS9NjMM+QDdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtZ8RGKzFiZmFBmsKkVlsyDGb5pnyg86Sdt2ido5c8g=;
 b=qfajYg2xJBI4zBYeMkDWAMrau4Iw/NfB6Yb3jMRjHmUl3SsuyIZh//sxDWtuBfrmpOjWmwQOWcm3uEOCS7u+r3lCgbMkueCuCQS7Vrt//I932FTXEHx+ZmGbQKhRYy5socPuAVXRBUd8f5vS97Gnc6jTRiZ689RYO9wptv9ofMw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6821.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:199::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 21:47:51 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3632.019; Thu, 3 Dec 2020
 21:47:50 +0000
From:   Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To:     bgolaszewski@baylibre.com
Cc:     linux-i2c@vger.kernel.org,
        Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH] misc: eeprom: at24: fix NVMEM name with custom AT24 device name
Date:   Thu,  3 Dec 2020 22:47:03 +0100
Message-Id: <20201203214703.18258-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: GV0P278CA0070.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::21) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by GV0P278CA0070.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 21:47:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c53901-188c-41ab-5627-08d897d514c5
X-MS-TrafficTypeDiagnostic: DBAPR01MB6821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR01MB6821B981E448A50FBCA284ED88F20@DBAPR01MB6821.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azsuXKzOENj3hyAktQCZ6SxXJXeHH+HsaUsQcN0u9jcksYwahXGFf8sQUwejDa5hBZnHERmYvWhQYh4bXgVH3Y3Hx3H/Vj07dd64cjUMH+m5a4urj4nsJv5s/MEcjfqTi2xuTj8k7Qc90g5OzCi/aLRCD6wGxAY39tMO7aahwGTnG4GjLrA0TA8Ps9D824Zla0FkbOjX+uPuQt1511CR6tGd+aaixgXwBRtf4pEmv7oOCce7j+iGwEb/t3gFBe6vaJ0/X+P0QOhZQrXEubJzHDoYySnrMGoz8t2hzkcnJkDAzcLWvRi2XM69w7eKHm7FbzNG8VaDRZB4q7PLPBrW3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(346002)(366004)(136003)(376002)(396003)(1076003)(86362001)(52116002)(26005)(2906002)(186003)(2616005)(6506007)(956004)(6666004)(16526019)(66946007)(6916009)(83380400001)(4326008)(316002)(4744005)(8676002)(6486002)(5660300002)(6512007)(478600001)(66476007)(36756003)(8936002)(107886003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9zXby5jxMX2WRftzIWXm0mPI3pzgbXZSc1IOavSIqYhxzh5XjMjOv5a29MQn?=
 =?us-ascii?Q?XTURKSacIIL3yuKi9K9KiEIzwSW8UBDZvJHcOmN2NoiyM6dc6psumXzzyy2Z?=
 =?us-ascii?Q?nvMYFxUAWP8vWn3r8Gu4sjdvXEC0yPDRpp0crtd8v3bLdX3jngZnX/LSkIxq?=
 =?us-ascii?Q?4SQBBhARhzIXaJznYvETdDTtNT7Gc4YuP210wuD6TA7bBxc2GXtX5501epZ8?=
 =?us-ascii?Q?hMJQuGfO2KnNkVYZvP0kAIa6zcG+mFgEx8tWCkMfJWNRJCBt+kDR/+JlgL1/?=
 =?us-ascii?Q?2lGt+gA3wQxmy7E2eP7acJIOP1Mi183e3YKKqEifwmnCu7LpL2/dizA/xp0v?=
 =?us-ascii?Q?9bt0uKal4+yS3C7u5ClhRR3ugJQ6sPTUvD23RLitRzwth8hqhSgMstzTpvaI?=
 =?us-ascii?Q?0Op/8C1HZ6rnkHGb1hjSl0baqYy54xaTUKxny62dmFgKjy+2FDMkxN+JeCOQ?=
 =?us-ascii?Q?AabrQVFI6ol3QPSMqSOghosbt5C0zX/W7M/h6+R8lIWmfE5co1TlZfJiruRH?=
 =?us-ascii?Q?6cySlw6po8wZ7Dj/vYti8uw5ZHRw6Qe6hqGuvBHN9uMFsNxtkB/VFyOtN5/u?=
 =?us-ascii?Q?hS6AIK5CBgzZaf/1bg5/Ut08kvy9ywsJm5OtiFekd8f8GC0Pumlu5LjvCwgs?=
 =?us-ascii?Q?jdJDHvoG7okZzt9lBI60EqvUESrLP2GbkBzM5OAsbGN0ApwSBsjrLzQIQIJx?=
 =?us-ascii?Q?e6gkWudE1OMMDho1asLAptZRUKK8Bx6sr4YIKZnHFf2cZt5rOtnp/4HyqTNf?=
 =?us-ascii?Q?Lys2UQt9ypAzfD/Tgthc4m99AAtGgzRTBUwWrAh45Tnv2aCtdWT0zYEfuZsv?=
 =?us-ascii?Q?ZocokSin9nfMncaX/UPBa7nyZOwL0kxayF1b/G6SSBLe+JJyVZfeeymPXcBl?=
 =?us-ascii?Q?38b+m7nXWsLWHhfcGIVK6r5Q2CGnMtogTQDP9Isqg9Ns+CK9UuERxNqmtb6S?=
 =?us-ascii?Q?8nsxtzKDOSs6NT9NUdL8QxSRtC1aBrEUbXL9uael+ezgjBXFTvWcXusSdSek?=
 =?us-ascii?Q?9xZ1?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c53901-188c-41ab-5627-08d897d514c5
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 21:47:50.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7bcbr2X3tAZZjvtv5rSeHe6aNiXx2ZX6Ha3mj7i5MFRTAtc9EXu1LqTW31tCQUHeGS95mbChkQsw9XWftzXUpaR7d0iRROvM/qhmfOy+Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6821
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the "label" property is set on the AT24 EEPROM the NVMEM devid is
set to NVMEM_DEVID_NONE, but it is not effective since there is a
leftover line setting it back to NVMEM_DEVID_AUTO a few lines after.

Fixes: 61f764c307f6 ("eeprom: at24: Support custom device names for AT24 EEPROMs")
Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 drivers/misc/eeprom/at24.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 35fabaf539b7..fbf69148b5ad 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -704,7 +704,6 @@ static int at24_probe(struct i2c_client *client)
 
 	nvmem_config.type = NVMEM_TYPE_EEPROM;
 	nvmem_config.dev = dev;
-	nvmem_config.id = NVMEM_DEVID_AUTO;
 	nvmem_config.read_only = !writable;
 	nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
 	nvmem_config.owner = THIS_MODULE;
-- 
2.18.4

