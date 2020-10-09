Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD66288CF5
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388745AbgJIPkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 11:40:33 -0400
Received: from mail-bn7nam10on2047.outbound.protection.outlook.com ([40.107.92.47]:38502
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388736AbgJIPkd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Oct 2020 11:40:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG4cU5ykNGpbnjdTUxRODJ8feRSxfNhr3QSxGTccHmbrtasEoCHqgJZbVzn0LON8IXqm6KQUNth+KApVlFCi4oyBFByWiLiM+k1pi+7+in46XJsXAYqYgI2LZPAyNx9ai/8nhW66AnW8sZpHgtm5Px3tK7OCY/5rYI7hSf68QlvUazGSTBCsCzLLgOL3Sr8ghsINI95G9qFliazefsSfwrREAz3kO3peFTYG1/SkwOchYMeslp36eZ+ko5/0q1dl/Kp7f6LdZI2aNeLerQ1bEakFMgy2sHxasvcVioNjSRoDdYdg/6Q69xwt8o/VPmSe5mrX0ziz229jvmJajp+4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O53e94OJcx2pQnGuZmPtzDtiaRJQ8mBApQ6rYH2Emu4=;
 b=c80jDvhBgs6u4fQny/2qwcz8XFAQ9u/AH2b4zK0//ffwa0csvlN9Ia9dvIK9wjz8EaA66rJRldxYVwiGCy+I+/ky8425RmJUHO51qL5U9q//sm6FoF0+tjJaYiUSKtXZtqNp+CYXb07tXG2y6AlzPf9laMW7XB6NFQOdXiWpcjBTxXqIL2CC3losI9BJxUhJvqxuhBFw1E8TuTKEUsCqOaVpqfQUKVushEehoEXBRnZTgnykBJ3JT8duByrfxQA6KQi9sF4Y5VfU3uE5klsaE+47yh882JlyA8YQaMoasspGzlmV6Mo1k3di1zcubxMvDDd90i0iQvai8fB6JIY7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O53e94OJcx2pQnGuZmPtzDtiaRJQ8mBApQ6rYH2Emu4=;
 b=D9lg26GZr0bAk4tHLf0T/iCocgOLdLvXH4y7hyQHzPr9cJ6+XA8GOKMOSWZOOf/iSi8SoT1W+bi1jFwhXw6iO7mLgtOuZrig8bLh8MBm3egdj6ZOBY6cS64W80SwwJTH9orfhDSXSoqEkL0AQCmmQJhlPh0Yt0aZnpH/ZXxyszk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1658.namprd13.prod.outlook.com (2603:10b6:3:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Fri, 9 Oct
 2020 15:40:30 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.013; Fri, 9 Oct 2020
 15:40:30 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH v2 0/1] fix i2c polling mode workaround for FU540-C000 SoC
Date:   Fri,  9 Oct 2020 08:39:39 -0700
Message-Id: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR08CA0041.namprd08.prod.outlook.com (2603:10b6:a03:117::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3455.21 via Frontend Transport; Fri, 9 Oct 2020 15:40:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c7eb70b-cda7-4e83-bb39-08d86c69a6af
X-MS-TrafficTypeDiagnostic: DM5PR13MB1658:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR13MB1658682E6DD24ECCA146430197080@DM5PR13MB1658.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8OMGfjWkAv04Qmfqchz6xVTE1/YWIaayNZRRnrsMEHlQyz10qVfvD5u1zEldbiSMQaZo5AeDEYh/QEE4E/aTRnTAqiR8tn9HOjSRA2II44QhKQT1Zz5UR/WoQSMNSQsJzwgugj28Qd1Sy4Yf4XsMbuFxJ+/radPMAcEAZJYEpwKnrqxQFgzFck/gdh+WRVfB2fUMrDVfzIk3fg5sgUCsKxzfxSUFa04fVKQLZb1n6HCONoYeNVBbtAMO2H5bQuUIQ0F2j00Ka2ZLQch1SUN0hB+VA2aZhywj4A9M3wAJUgzF5S1oBcocAMOPSjTAO5SEv6O2bbF7q59IfFU2AemSYmKkxXrJu5n5k32t09Y9hPLhBBJY4YnjS0nX7dz4io6FCbAJhKwn75Z+sC/c2BA0tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39850400004)(366004)(6666004)(26005)(186003)(16526019)(8936002)(6486002)(36756003)(2616005)(83380400001)(956004)(8676002)(6916009)(107886003)(83170400001)(83080400001)(2906002)(7696005)(966005)(66556008)(66476007)(66946007)(4326008)(478600001)(316002)(52116002)(42882007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YlXy2+7CGcQh9y5EG/xhZlVAEMrjq/u6th+CtgWGOHv4w26MOvWEU7KFievMLmiYypxGuaJ7PwFJ72z6C5CFAGSFOMoF2ziC7q8d0pmOsBZBrA8TcFkSawr0s+FyT9mdC3zqkWEWpCdO1fFaX0nwsANOH0rgnF0L7uyYMy4yf2iZgnEDW1vGK0r2ZOlXxFttnja8RqELREoqEIbBxj+73EPgFhonPyzOgWIBtF6k/xgI802kboUiwqSMc8FT7mNgdCzybDnb7bqsdGTmVKFONQ+dGGKm0WsP7RC0v0OyaoxL9kw9PYB+j5WxBq5njuKf2HrBqwAx2EDu1Yrfv1BVZWJiHOzBQhtfNqdhaWOp4RxvjbTkOSwQJu2MhkiBwmgvgQ3TRNGm1HvrH1jd54E2IakPEZn/FjtIqtroGJ4JQtyTPTYMTp2dCLFZTzYh6K0N3L9NLHILzBhE9dNq5i4bRYTSa44nvDkNo7aAFejDv9Mi0vTSyrbr7QJuFz00xSZVWlP89VuaZLNfo5MO7B4Xdwjz+m3kXQRskRzivhJrroSAYwjGkmsfkMEGXDR6Hsyd6Llvo2ZiGw7r2qWjVDH49SjG9QZvqx38LFdWZWUWuCMGh8inPclSuMhTSURtPdT9mMaLUdeUCQjSIg5PBkk4yg==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7eb70b-cda7-4e83-bb39-08d86c69a6af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 15:40:29.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgEW4iVrC0+vxZbiQgLJZIDorGUdhQgs4wlj54hr1jt38vHU4fRfYJ0WxVOLb4YFTAP3IIxzM11QH5nt3XFMqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1658
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The polling mode workaround for the FU540-C000 on HiFive Unleashed A00
board was added earlier. The logic for this seems to work only in case
the interrupt property was missing/not added into the i2c0 device node.

Here we address this issue by identifying the SOC based on compatibility
string and set the master xfer's to polling mode if it's the FU540-C000
SoC.

The fix has been tested on Linux 5.9.0-rc8 with a PMOD based RTCC sensor
connected to I2C pins J1 header of the board. Log for reference

# uname -a
Linux buildroot 5.9.0-rc8-00001-g9da7791 #1 SMP Fri Oct 9 07:56:13 PDT 2020 riscv64 GNU/Linux
# i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- 57 -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 6f
70: -- -- -- -- -- -- -- --
# i2cget 0 0x57 0 b -y
0xa5
# i2cset 0 0x57 0 0x9f b -y
# i2cget 0 0x57 0 b -y
0x9f
# i2cget 0 0x57 1 b -y
0xff
# i2cset 0 0x57 1 0xa9 b -y
# i2cget 0 0x57 1 b -y
0xa9
# i2cget 0 0x6f 0x20 b -y
0x98
# i2cset 0 0x6f 0x20 0xa5 b -y
# i2cget 0 0x6f 0x20 b -y
0xa5
# i2cget 0 0x6f 0x5f b -y
0x55
# i2cset 0 0x6f 0x5f 0x5a b -y
# i2cget 0 0x6f 0x5f b -y
0x5a
#

Without the fix here, it's observed that "i2cdetect -y 0"
turns the system unresponsive, with CPU stall messages.

Patch History:
===============================
V2: 
-Incorporated changes as suggested by Peter Kosgaard
 https://lkml.org/lkml/2020/10/8/663

V1: Base version

Sagar Shrikant Kadam (1):
  i2c: ocores: fix polling mode workaround on FU540-C000 SoC

 drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.7.4

