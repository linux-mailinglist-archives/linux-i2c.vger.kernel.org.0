Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3696D395BDE
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhEaNZ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:29 -0400
Received: from mail-dm6nam11on2047.outbound.protection.outlook.com ([40.107.223.47]:50945
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231863AbhEaNXW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/geMpUFZiXO1whXdsjF+N/OwKHs4MwRAFpJh+wKOAX54rz7eQd7sfB/aTEaSyFGTXYhP47RVEotT5gcLbgs54q+nPbftAdPn/lA4j3A+1/juWsaZ1+x54rq7+fFJrpWEUwA56I2Qjok/CXx1mShzT9vgHOG2Kje6j0h6ukaOvSxQKA/UfE/BLHhq70vNa8oEj9gso++vdR5RQsCbzi9+z5/Q1PzoKrN3Kcye/+pG4qhOftRU3YF5WaeKh2tzp3yqu37GwNcsdWTyQI2BUxpQUmVr3sh++lzCE20/8lVP+t19N6QqsMG8VvvLCP1sxCk4qpK9tPta6kzJBS/TWyk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fceQhCbbjjHjSbwTjg3JBB4MQnsiiMuBzljwTv3hnx0=;
 b=ca46etrM12Z91G5U/OBzX1d68oLouZvVl/cSqB+1/rN8NSrfI10Q+tcurOAc0h9Tc23DFMHKTKbCAyHzHqRZpYG9npfWgGRYhk39Kf0K3r6cROAr+SY+AWskEFWKOlaJP4hPDsOuJ8AUqYG8ID5xBAULTs0XuN0vNO+GQmi/D5LKGKRbNy1u9c7p1QqvS0yNmam+mnd4jkqc8iR91FUyoFH0h0HJ1gg8PdS+a/k770t5XPrGpDp2ipRol6N93pPJEGyPfwYIVk7WlgJ76HuSXKldx4y2B9ETRxYBVqQNaTk/yVoM6Bq4vIcmppJARC5h38AhCRTzSUuRGD1tTt6gew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fceQhCbbjjHjSbwTjg3JBB4MQnsiiMuBzljwTv3hnx0=;
 b=qSDECWIoHr9kU1ipLipT9j4dT7+EF62Lfo9m2swsIDEfn0uhdQ19O8RynVCn54fj+LdTEO1hIEW9KF2Bp4TR39TF4VwlMA8ZG+As6RrpksKlxrQpgc3zt8eSmEbZy7W9BzAUKrU0Tuk0bgF/LMsJERx+xpKQp8z0h9DoN0WD7A0=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by BN7PR02MB5123.namprd02.prod.outlook.com (2603:10b6:408:22::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 13:21:39 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::b6) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend
 Transport; Mon, 31 May 2021 13:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:21:18 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:21:18 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhr2-0004GE-OO; Mon, 31 May 2021 06:21:17 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 10/10] i2c: xiic: Update compatible with new IP version
Date:   Mon, 31 May 2021 07:19:48 -0600
Message-ID: <20210531131948.19477-11-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 603eb692-12d7-4846-4488-08d924370638
X-MS-TrafficTypeDiagnostic: BN7PR02MB5123:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5123CADCBF5EBCAAFBA15065CA3F9@BN7PR02MB5123.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfIqXX1XVFhDp+vCjLBhFkcwAUYXwYMR6qMAnxaX/vaBYUU3mjjndYqUshw7wb9Rz8fHnCu9CnZ3ZlPPZaAVq/HtU6fuc/CE9YU8SF6yD6Ay7Nx97G9xnBfeilRrnyb5mwTVkXiRy8Lgk/+AcPebuVt99mX8XvYEFUDmtnqSV4YEh5J4JqAKV/AAahs+0j86oJTloHudtO9AQi5upHaxdqUF5WLCHeDRFgVOqJaFfFbuvq+BJQismpyYsup3etxRj7kimv2bNaU1HMhSCr4LJCj8bXEBBBoL3kAV60woD0Yz6MKenSQDXAYlBCTLyCzsq2YJfIUrd5quw4lgGkIMjl8p5+0ZljCGZNiutThxlGZCOLlisTRo45HP8yBFLlPVYgb4R6gBnF7/8CGBzQ0/0jqgeLG54IILC6vZtwLdEFV+eFJpX3EW1uLfif2IqifqWudvVnqRlakOpCRdaN2aGysYHqQ5KTWgFGx0AOBAexKUMUtEvRKjHRCqbAPg78T3iNEDoUHZSC0V9bwcgjaovuLQdprL/F7Qodog+kiSnhdqqplDme8lLevbFLrIVagxK4f9JGGQJrIwL8IgeG5LzRChEFLc/54xQneb6dyw5Rx2ql25l8WI1iiek+pGL2szDzZ+LkdqyD9Kl8iyOg3gB2G4VSZTwBG/3x1ptEZbUS0Q2LRejCoDy2WMzm0G+5SQ
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(356005)(82740400003)(47076005)(7636003)(2616005)(82310400003)(478600001)(5660300002)(83380400001)(26005)(1076003)(2906002)(186003)(6636002)(70206006)(6666004)(336012)(8676002)(44832011)(70586007)(9786002)(426003)(7696005)(110136005)(54906003)(4744005)(107886003)(36756003)(316002)(8936002)(36860700001)(15650500001)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:39.4228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603eb692-12d7-4846-4488-08d924370638
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5123
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Added the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f022a1885b6a..45bd3b1a4c22 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1130,6 +1130,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.17.1

