Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F84294F0C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 16:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443471AbgJUOu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 10:50:26 -0400
Received: from mail-mw2nam12on2057.outbound.protection.outlook.com ([40.107.244.57]:61429
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437433AbgJUOu0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Oct 2020 10:50:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNiDDmsR7GRngiobHAJZqiUqMUtOpeJMFPiZTPyUxKuzftZZ2vYqv75f4UTc9F4AtVe6J937oZG3gZ8HvpH9baTtqmKxaQ8PLeydbVu2PWCfOt3jO5R4Z4yqV74SlI5fzQ4utC69FuGFyP5UJgDG7ghf3LnenCuOKOp1hvDhkbOPUy97fc5MVR92D7MsbNFeMpC0QevUplS+jyqp3jT+q+5f5ppgfsgKVwxJbP/vMIYWQPbMzWxphaQstRrgrU9wqCYr9gAyYk3G8R41N0NthW/Dpnr6oJBAE1D3+gCQ8bMkhyqTi1tEbmbrUl6llDUA87sV9LsX7zkY38+SxDEVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQqLobpJOK/5ns45dlctVmoMFqvzYQKkW0sko/oTScM=;
 b=jHaM8GQhJh2m65LnfBU0LhVn/h6kE9mPVIFCuheRAiSVr3DLea7ZVJxmoX9yLBQdHSIQLKNiZSmcPNPhYy++CF35aUT+k+EwECkkGiqP7ygsiXYFjVt/EUubadg7PDhtGaSPMpgNyFpG7sU5moxMHyXV8kY+M9tndyCt7zaaktyk+9nr7TV2NEufm7an12k6ZaIqUIUQzr186fjbP8XGVRDe8NBNoDpiMVZCkeYFh6M/9a086ipj+TOzWMIcCVdPEnMG0LtGDwSV4KcmOcM0SrNVRxgYde/vqOzYWvfKjPqvxjcHZ4K7v4YyWRrAc78Li4B5EvEjN2cZF6olfnKW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQqLobpJOK/5ns45dlctVmoMFqvzYQKkW0sko/oTScM=;
 b=szuO0gzBW4oKHn1fxn3MwfvEOb8zBkPXbYhjeFS804nAWJBs555kCt0ko/qPJ8Vc1v9QdUjFi8w8Idsm2JGHiAZ9RM/+c7oNpGZkjLxZT/oKLpHAe+ei0/Zg8rkUhbrSuR48XUxjLvRJ7hbL8aPpkTmTyZSOvv89nhwvuHfS900=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1244.namprd13.prod.outlook.com (2603:10b6:3:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.8; Wed, 21 Oct
 2020 14:50:23 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3499.017; Wed, 21 Oct 2020
 14:50:23 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH v4 0/1] fix i2c polling mode workaround for FU540-C000 SoC
Date:   Wed, 21 Oct 2020 07:50:13 -0700
Message-Id: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR21CA0008.namprd21.prod.outlook.com (2603:10b6:a03:114::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.17 via Frontend Transport; Wed, 21 Oct 2020 14:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 760c16af-47b5-4293-7ae9-08d875d0a360
X-MS-TrafficTypeDiagnostic: DM5PR13MB1244:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR13MB1244EF603BBBFB6E6B1A0CCA971C0@DM5PR13MB1244.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlVd70NhX/vYxWHc4Tbv88cnpZv1B6xdhU9d2taKanqMnaUyL1ZP5A5f1745+XwmebOOs0vU2D6JgUXRTuuTz1Vk1DVWCLATumzEoQcGUeZ0ERQE1Uuqu1Jy12wMZNnIAu+T5W/UaQTMzbG5mpG1dO7ImJkgrv43Uxs14968j+kGg7ni3kmS5SfSkdVBwi6LlboZyAxwDqcPbdr3rr4l4PDsVaIMS+lXLFZDZ8IMc3tPKjfk2ozAbt+6SDI9Li28jqJZd6jPgGalbNI3XDDTQakMXGp/Cr3xe/+9artuF0S72mPhCaZgEWQytugR0bKJ7SoCLlWTi1z3K+XcYsraBedR661wc/P8unZRlUBfkDVdsbnQ4jg+GkhVdJQoQ6/VwURScoxK2++qcBeTCKIgZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39840400004)(136003)(396003)(346002)(83170400001)(66556008)(66476007)(5660300002)(66946007)(83380400001)(6916009)(4326008)(186003)(16526019)(107886003)(6666004)(26005)(8676002)(966005)(36756003)(478600001)(52116002)(6486002)(2616005)(7696005)(316002)(8936002)(956004)(42882007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: e0z8BAP0XJqFZ7yYrQVqjAgqpcGKQpF90Cu91KSHEpbp6GPunBr0GefuohYMh8sdy/USwLnK5LkcbQOmtCR86Z3t8XK2JJFkVScLGrvSC6hDvBRVY8vp2+eNTMhruulAj4CpW+hjwKuOADv17DxZ+hOFDetrfGc7OrxdiS4OJkybODV+41Nb/kvufxjTtL03O0T6MzK6C0BEHGoWwLH3YnhixmeN5BF2z33n7MgiuNc6Zi5UKvkScBIUCjb+NXKGWxV8LcH3wJiURuWrEiYbXcIwhciwE4KurPESu3MjpTr+9Ua9qGuSo2fvZgOhqL7W16cH+2v0YKgfvB7IxgbFyFXX/Pgfdvt+XojaYvLabqpZmdmMkfqpgdPGNbGxC49GDgZE4zOF9UZlX/wRwq/bNIk2TqY0TuDG04RHIXTJBqG568Aa/N2BAfA6Nnn142rGDwMT6yZijkg13BYcO/CdjmUDwxt5yEx2+mUt7pFw+cKn3POf2iHZNMoe8HT6iGI0QPfjChPH6Y/tZOOUEC8USsfk5FwIoriasCgSO1g+Zg5W+aq3liVBp4XN2gBVMKZlNWdfffJyO0H+gYQhRlM9I/3N7PBJDWQmaRU+sOUIsh+qAZUPWLLjrin+a/Guk2Jr/QTDlLerx4KI7o2txjfaVg==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760c16af-47b5-4293-7ae9-08d875d0a360
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 14:50:23.0160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPYxbLYAaltdsq29MNqxIwfa6ClVQ9QJBubhtjLSIFQrTvO4WSNPRh/4uj0cUZ3T3KM40PcDb6cm3uFbWS/sJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1244
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The polling mode workaround for the FU540-C000 on HiFive Unleashed A00
board was added earlier. The logic for this seems to work only in case
the interrupt property was missing/not added into the i2c0 device node.

Here we address this issue by identifying the SOC based on compatibility
string and set the master xfer's to polling mode if it's the FU540-C000
SoC.

The fix has been tested on mainline Linux 5.9 with a PMOD based RTCC sensor
connected to I2C pins J1 header of the board. Log for reference

# uname -a
Linux buildroot 5.9.0-00001-ge092bd7 #1 SMP Wed Oct 21 06:19:31 PDT 2020 riscv64 GNU/Linux

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
0xf9
# i2cset 0 0x57 0 0xa5 b -y
# i2cget 0 0x57 0 b -y
0xa5
# i2cget 0 0x57 1 b -y
0xa9
# i2cset 0 0x57 1 0x9a b -y
# i2cget 0 0x57 1 b -y
0x9a
# i2cget 0 0x6f 0x20 b -y
0x98
# i2cset 0 0x6f 0x20 0x5a b -y
# i2cget 0 0x6f 0x20 b -y
0x5a
# i2cget 0 0x6f 0x5f b -y
0x55
# i2cset 0 0x6f 0x5f 0xa5 b -y
# i2cget 0 0x6f 0x5f b -y
0xa5
#

Without the fix here, it's observed that "i2cdetect -y 0"
turns the system unresponsive, with CPU stall messages.

Patch History:
===============================
V4:
-Used alternate implementation as suggested here:
 https://lkml.org/lkml/2020/10/15/513
-Removed TYPE_SIFIVE_REV0 field as it is no longer needed to set the polling mode
 and OCORES_FLAG_BROKEN_IRQ flag.

V3:
-Rectified typo as suggested here:
 https://lkml.org/lkml/2020/10/9/902

V2: 
-Incorporated changes as suggested by Peter Kosgaard
 https://lkml.org/lkml/2020/10/8/663

V1: Base version

Sagar Shrikant Kadam (1):
  i2c: ocores: fix polling mode workaround on FU540-C000 SoC

 drivers/i2c/busses/i2c-ocores.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.7.4

