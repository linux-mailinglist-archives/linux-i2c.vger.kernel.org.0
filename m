Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B333B59AF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhF1HZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 03:25:54 -0400
Received: from mail-dm3nam07on2042.outbound.protection.outlook.com ([40.107.95.42]:18845
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229998AbhF1HZx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 03:25:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3LcSsUMKSmo7ZQADa25Rrico4v6PukvCga5OQZQkGc3oam7RFMEzYDAp4QcSqxSQbCGBPYX9xY2rO/gcBF93+d03I+mIdmNP8WPlYHPCNt610Y7thoih19wZ7A7/YT8QoVB/de21FvLW5wLGuMDod4U+W6QGYmwKFHlDzKSz0DD1ewNHSgTIn05BN9rrI6KMLtkJ/5yeRBKb9HKHt7GBfPtiH0Ld9GnjzzOVNBU86IloAolKFbW0r/79jmlK5gtWMqfRe9Je3c/6+ihy2rf3KPfAsI9oktEXZtZXGv0FElL2yVMVMmjMXLc/J3DHTOeMgTvB+JwFeh40jkZEOMY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NG1ngXoteQChZnh9UuPqM1VnIf+BeV+zOk+X08wNyE=;
 b=QizCpaW+W9MHtAq9jTYRm/qaniWD/vaCzb/uMf2qaMw6w1Z96TrOMorxdHsjpH0s2aakbnapn34MtGZE6fNDuyOLAxeHtFfVq60r+RAhRmnrwfmugIEg6kKtFvYl6sZGUXWpO5NoZbvKsweyGKYKyUJ2xdz8DgPuiLhqqEAmKT4VNxPU2mYepWYND2qIrfkwpbkHYLPmXR8gUl+CCmbTxRsDee0scYJaa++nAKXtIw3eA+q1WETkGqShww9X039UIP0O3DTQCyjeOCUX5Bm2BuJSpcYVpSlRdVaSBkx1LHoLNgHI0Hj6C/rkPluPnCkypIxOp7RBlUPYjvH2pRU5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=perches.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NG1ngXoteQChZnh9UuPqM1VnIf+BeV+zOk+X08wNyE=;
 b=i2NMoezpo8qnP3vKWCI5gENJPS9e6v2MycoyWycY5mbCjHYfB0g8md1pLACKyoPkqaecdta28q3+q2QCzv4zbT/bN7KLvpHvB6jNByj52I5nxtY/SvbaY7s/FWWNYqo5f/8jbFl273A4Y1aCv1OEHy3JMJi36ZAKaNEIsrOJlMs=
Received: from BN0PR04CA0159.namprd04.prod.outlook.com (2603:10b6:408:eb::14)
 by CH0PR02MB8119.namprd02.prod.outlook.com (2603:10b6:610:10c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 07:23:27 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::ab) by BN0PR04CA0159.outlook.office365.com
 (2603:10b6:408:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 07:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 07:23:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 00:23:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 28 Jun 2021 00:23:18 -0700
Envelope-to: git@xilinx.com,
 joe@perches.com,
 marex@denx.de,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Received: from [172.30.17.109] (port=50048)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lxlbx-000312-NE; Mon, 28 Jun 2021 00:23:17 -0700
Subject: Re: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
Date:   Mon, 28 Jun 2021 09:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f9d466d-0a01-4379-b2b0-08d93a059f6b
X-MS-TrafficTypeDiagnostic: CH0PR02MB8119:
X-Microsoft-Antispam-PRVS: <CH0PR02MB811947A3E1BE93E7416C32E8C6039@CH0PR02MB8119.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwFM263Ptm0M1pZT8IiJmgvffW1rUM5k2m8yjDtH94Lb7IOA9A8hwpJFfdnqRQAr4Ixfysv36/bVlFeisYp1LpdJVw/N33W0lJbs+Gjin0G7HFKSln0/nLDrmywsGhrbAmRaKwMmPBNoqnM0pTGMszifzMuTeTN+4qv3id4OLjBE6k+JszeRI+CPFh5i3LGCG1MDr6EgfmnNjUbo43YTqwX8rb0FWivr0ohLZk9hcYysI9j32U8RMtjRbEylc9N0DTPUf/BIUW7mh8geC82zmHVJ0Jm6j9CAO4tRRH4gYR0Y9vf2X1N0Q/f/bihbtw+Ycr5l0Zn5sLyNGb2G/ioaO6XZ8FFAqE8IhOY/0JGOafMobZhgYaBCSbGF28PR32S2hOQkYpJvZNyXMgwxjlu9u7+KwePzroYc420d2Az9MdelW1+kisYrj2UYxjGyciiqwEqnOgrvq7mvfCYTdlKzx18rx5QAxd1VOsaepbaUtM63A308vHF62o+1z4OScJfQQLpCiB7FZ+yfS1y95g910rZWLbP6YiwsHUsK1lKiezdgSQhCjhBnVl7Oj/Wzvr0YVqCR0Tdj7cZci7bAvv+SDEWTHijBwY9MWFUOkfeiflbwOIB9Qw3FLwalno+jMPgmCd/+Wopc+za6rMuiISc2Vr7m0zYBGe/9rSXDOGERqUoZI1Kx++71tUZhHXyZhkV52r3LARfUxmwqHuYMw8O/P/Qo53G8oXJAus7WzeYf3jd4M8QQRC75tHuE1DzkhIV7E4l4PLNJPtN6onS9hcuIYErJtIIe57mUmAypiNIz6NMIsUYC+ysl5VXmM0rJjR/2vVDvGa4jslLJBqvqJdOZgw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(346002)(396003)(46966006)(36840700001)(966005)(54906003)(31696002)(2906002)(110136005)(316002)(7636003)(356005)(5660300002)(31686004)(336012)(426003)(82740400003)(70206006)(478600001)(70586007)(53546011)(4326008)(8936002)(47076005)(186003)(8676002)(44832011)(36860700001)(83380400001)(82310400003)(9786002)(2616005)(26005)(36756003)(36906005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 07:23:27.2109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9d466d-0a01-4379-b2b0-08d93a059f6b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8119
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/26/21 12:27 PM, Raviteja Narayanam wrote:
> -Add 'standard mode' feature for reads > 255 bytes.
> -Add 'smbus block read' functionality.
> -Add 'xlnx,axi-iic-2.1' new IP version support.
> -Switch to 'AXI I2C standard mode' for i2c reads in affected IP versions.
> -Remove 'local_irq_save/restore' calls as discussed here: https://www.spinics.net/lists/linux-i2c/msg46483.html.
> -Some trivial fixes.
> 
> Changes in v2:
> -Grouped the commits as fixes first and then features. 
> -The first 4 commits fix the dynamic mode broken feature.
> -Corrected the indentation in coding style issues.
> 
> Michal Simek (1):
>   i2c: xiic: Fix coding style issues
> 
> Raviteja Narayanam (7):
>   i2c: xiic: Fix Tx Interrupt path for grouped messages
>   i2c: xiic: Add standard mode support for > 255 byte read transfers
>   i2c: xiic: Switch to Xiic standard mode for i2c-read
>   i2c: xiic: Remove interrupt enable/disable in Rx path
>   dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
>   i2c: xiic: Update compatible with new IP version
>   i2c: xiic: Add smbus_block_read functionality
> 
> Shubhrajyoti Datta (2):
>   i2c: xiic: Return value of xiic_reinit
>   i2c: xiic: Fix the type check for xiic_wakeup
> 
>  .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
>  drivers/i2c/busses/i2c-xiic.c                 | 593 ++++++++++++++----
>  2 files changed, 487 insertions(+), 110 deletions(-)
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
