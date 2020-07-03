Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C0B213B64
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 15:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgGCNzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 09:55:17 -0400
Received: from mail-bn8nam11on2049.outbound.protection.outlook.com ([40.107.236.49]:46688
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726035AbgGCNzR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jul 2020 09:55:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsO/WpghEbDbc7lEaGqQPzPJFF2aNwTX3n8DIXCSUf216yQDJtu1qcIccmQMq9VLtnqiCLBpI2l13qjAfMd8v6LKonx3XC09MiiUwTWZK3tXHU2aF2YKI3qvVx0fiurdU1+rJtV4h2oCm3J2KO/wlUmVq2HplUGeRpun6Vrn/goOxrJgDxqPN9jFbv2iI1VKF/a7y1UJYMXIdMmosmTgnjckMk96UIeJDkW/URBW6Mc33rC3Hod6ST3/YRvpNivYMyt7mKxysVrjunX7MG05X+hUphKzrHeV89L5cNl4ZW6mEIUwVqTuGqjok8NQT6t2j1VFEiURnXkvtmr0cYKwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+tUbHbCy0AmlnkCcuvzR2s8JNglrhWhbG9hT5BK0RI=;
 b=VnYr3skvul3xWX8wgkc3K201/XHg4w0uQtLlJfdNwC2RcBc8PfMBhuuBVrMJ7LDGZsJRsNHTNJzuOauKFYXOZkOjg6BUdfprIM0ufrrE8TL6gJR6uZUtqa0WbzJXfoQRxFfBH0MTStaApoWWuzJIla+qU7JMsagYbpWON922+nnx1GUdFDxWwOUQoktkp4SorbZrTqSkcgEKHaIFL+wM0XlICWM1jSJoJGhWTTIQNcvODzSopnkvgtTqQuE8NfAEjTqg+FKX9MtVGJmBezP+6LfNJc4qobj27NVGL7wdJNUR1e/1YTaXxemJtJL8bhgYflXbvJDRsX38jLRbI4iCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+tUbHbCy0AmlnkCcuvzR2s8JNglrhWhbG9hT5BK0RI=;
 b=dYEZmeWXnFCizMjHOggC4PCkuEGv2fVaiUiRO7vcc2y26wIyiyQJlDHhX0LzbHrLyk3EtUjXJsqozWXEpjdbN11BFZqnqDuEPYHyic/4X3HVnMGTpxnQTx3CgdolxY9sjfVEJKKJUh6J/k9wEqPH80OPrWPibwBxppkv1Sf2KPk=
Received: from MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37) by
 CY4PR02MB2664.namprd02.prod.outlook.com (2603:10b6:903:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Fri, 3 Jul
 2020 13:55:14 +0000
Received: from BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::54) by MN2PR01CA0024.outlook.office365.com
 (2603:10b6:208:10c::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Fri, 3 Jul 2020 13:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT023.mail.protection.outlook.com (10.152.77.72) with Microsoft SMTP
 Server id 15.20.3153.24 via Frontend Transport; Fri, 3 Jul 2020 13:55:14
 +0000
Received: from [149.199.38.66] (port=56881 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrM8R-0002vv-D2; Fri, 03 Jul 2020 06:53:47 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrM9p-0004BW-NI; Fri, 03 Jul 2020 06:55:13 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 063DtC5w015658;
        Fri, 3 Jul 2020 06:55:12 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrM9n-0004Av-V8; Fri, 03 Jul 2020 06:55:12 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 0/2] i2c: cadence: HOLD bit manipulation
Date:   Fri,  3 Jul 2020 19:24:40 +0530
Message-Id: <1593784480-20308-1-git-send-email-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(346002)(39860400002)(396003)(136003)(46966005)(336012)(82740400003)(2616005)(8936002)(4744005)(9786002)(47076004)(316002)(5660300002)(4326008)(426003)(6916009)(107886003)(26005)(186003)(36756003)(356005)(6666004)(2906002)(70206006)(478600001)(83380400001)(70586007)(44832011)(81166007)(82310400002)(8676002)(7696005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 094530ed-4339-43e9-71a1-08d81f58b5d7
X-MS-TrafficTypeDiagnostic: CY4PR02MB2664:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2664E504E6B3BF1F78798DC1CA6A0@CY4PR02MB2664.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2QhOJ2wbf63iEE2wQdmI73v/QlUsFjcEb2EHFGCPsIq3grjyelH8B0cznY1D4faI74BbgdUWmjzqi+XYg0OVQp6VmNvf7yhmtkCszjIIoq5TQLF0qNxZMp3pUlRAs4xL86okyDFe9zYLdGetdcjC7lkUJzy9zWL6gKI5DRfQ+ucpUjSBpomkeErOu5BmLwjnk84fzI17/XMOUxti9YBhdL0VMJLATwxdxio7YVdoaNhYiDKX9sUFfVJXYeyMVOfvkIVlPflbmFPyaPBEahNMopfSsNst8NxmclBTxKTpdT4rruUhj5PI9wn4i7pdMSJKYtzWNfCL37dCsPVvcVWYTkTSyaCWWrd8U0Cwukc8kotmwvNOrshfqqjbdAalPmxUJ4f41BtG9dbi7JUYFUVUA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 13:55:14.1173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 094530ed-4339-43e9-71a1-08d81f58b5d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2664
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series clears the HOLD bit at right time.

Raviteja Narayanam (2):
  Revert "i2c: cadence: Fix the hold bit setting"
  i2c: cadence: Clear HOLD bit at correct time in Rx path

 drivers/i2c/busses/i2c-cadence.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

-- 
2.7.4

