Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5D328F468
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 16:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730820AbgJOOIo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 10:08:44 -0400
Received: from mail-co1nam11on2076.outbound.protection.outlook.com ([40.107.220.76]:36868
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727988AbgJOOIl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Oct 2020 10:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8n/eeV6cqKZe3BnAmlRgKFMzF6axi666brggYG+xtCL6vz4wzPuo2vI1L0IeygLQJgR6rnPz+v+mguU5Mb+6nueAX0A1g2yBdilLWR5E/O4cQ6MlOYisCmGYWwujCcG66TlI1G2tP9juaeNUAhMW7L9pboE69U2dQfEOwZrABDnvwZINiurY3jDbS3LeouqVdQx1lD7FjPhsojtiLK94P6tCrz2gWNeH5eeoIeURQbiUxNrq0+kiHiTLlz8L5W/qOzABhCOJMN7SjM9N3tytP47qMJRrw5opAo7hmQJka7DJMyXN+YqqXU41HoDLBzlDzIjxQyrfB/sbQBIrrx2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZkZ9pVM5omCs7E57OYSvcdKYXxYCWf8YlFN3nyLCF8=;
 b=ZkD/NBkte6QuFo7EOVFWIgFA8PDwU4qDNuMUjTREYvAg0FuFDNoT1tzI3lK3mT5LVY9BDDI/mFT/nmgd9KiVovvVR4NVb7sfRa1TOYK+s9N7SFaOw1YZ82EdUEL2F8F+cgVb+wBkyarTWmPSccqcoiGwOH793RJmKqh380rYxdS0Pmb5hNtZr/Q6RHogaKx32brKtrF2YoQF3RclIzpFgo+JEGfdvgA+2Z5L0JSB7ikhZQHvGvDG8E1o2/rY0hSdtaAMHgwvPNBI5MoJsSRxhrAwNK89+wFRM5hwf2VEKhqA0bfSGFy5JpNvI2Snv2goq6HhxiByMt5BvratQQC82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZkZ9pVM5omCs7E57OYSvcdKYXxYCWf8YlFN3nyLCF8=;
 b=Y2qUD1xuVnHRlE5IdqapQ24jFsyZ9VwMoV7uWzEHwHllr1cyL9hA8rvI82eyDR17KhRPgk0UsIInuHSgOP8LukrHvCU5Ot+EkkPuyo7s+qVo+EDNXtA4uoPPGFNdHnnVEGSAfaSHGF99Io/5pvece9qpCYay4LAUHgpwmw25QjA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4067.namprd13.prod.outlook.com (2603:10b6:5:2a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Thu, 15 Oct
 2020 14:08:38 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.019; Thu, 15 Oct 2020
 14:08:37 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH v3 0/1] fix i2c polling mode workaround for FU540-C000 SoC
Date:   Thu, 15 Oct 2020 07:08:26 -0700
Message-Id: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:74::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.13 via Frontend Transport; Thu, 15 Oct 2020 14:08:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7779916d-b86b-497b-bb51-08d87113cfb2
X-MS-TrafficTypeDiagnostic: DM6PR13MB4067:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB40673B20E6293FEE3C63759B97020@DM6PR13MB4067.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9mciStoqO45mT1wFa6jbPhVr6wt2uPVlGarxm6VhH6Su0GoD763plcLT9xJe6DvBs3YlD8PZTVeXY3BVDu8NevKwI66RkZjyeIDPSmhLGvz+b3eTU+VD86/ecfrgIJrC2Th6en+7M4t23g1KvJl9PLliYgQPnN6GdSKYVnKwOIReJ6+w1m3Oz8jLx+qrtnDw7WrOagNjFZ0zqzX4/WxzxV+FYuczk8PThFn0tsml1y9OHc6GrdaIQtSpKo/0pxeEqdzs0PWw8/CIvSLDSlhq1nyCWwQ79nyGMpFuCTgJUcw7HeQdcFc2GMmBseAdkPKlSpyrwopH0Da4tgRRHgT/42S/z7u5jc+QTVFS5HgLNv6OYvUB/fh6XrxnsPa2m/ouWlkM8UCXK4s/x71UA4BFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(396003)(346002)(376002)(136003)(36756003)(16526019)(5660300002)(83380400001)(83170400001)(2906002)(316002)(6486002)(107886003)(26005)(186003)(966005)(52116002)(8676002)(7696005)(956004)(66946007)(2616005)(66476007)(66556008)(6666004)(8936002)(83080400001)(6916009)(4326008)(478600001)(42882007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: j0Ak/bQw5IqihowzkN2E2l2yvuQvh+CDX1zUkAGENG9VCo5Bm6Jn5huO3FzFPLDJhq1UcCFImf+ndTX25+zFlyVrod+t8LjfBvlqO5GlkYP8BYQZsSAfFd+Kd1+nqdu+FbJs2gLpnY119EXyYMlzYpUhfCZsxpss6Ef/419UHWRFycCXsD3tcCSNxJRHbOQ08odI0bT6AeuiyTGbrLD3OOYpzPiqyLKxSftzMNb04yRUxoh3DqPIfGv1It+vPf4vZIpA0+OU9Y+GyK+26InzSP878LMHgDCbUFoDMiO3HJM1jg9wrK9dSMpaP9uGcCfX9sNK3/m5QDxbn9QNAxaFV/4OZ473XtDKr3fnvb9KoOdECyYnQErUTXvOkgMI1fVcMZvINKVb8OmlecKKEjY4loytbepwaAhlOkHetRpih5kAJ8jBq9PtDYSoQvyp80NqqllKbSfFEhn6TbIP0sV3cT1VyTyFuZLZZqdreXFPBxWEt8+fo3xkRM93fefLNFf2RuO/73f9Tt6Mzueg6te5pGD2kbpZhcIetdMY+eIekdT3GcXiLR85KblLUKLWDTdXWvASC6L1DKTPnyinep6lxWqJRvKiiCOFrCZYOcgfEXuB90ph1UYEOYy/jgD95uTI5C27Ct/4y/6+aJeq/qv0EA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7779916d-b86b-497b-bb51-08d87113cfb2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:08:37.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e21w3I1ktgWXonpq7lRYgc3jOj5SY9mTZnTL4BYPgtxaqJ422PWPBuUIcpRriGl3zVnOAk5+GCMR93qS/8zOgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4067
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
V3:
-Rectified typo as suggested here:
 https://lkml.org/lkml/2020/10/9/902

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

