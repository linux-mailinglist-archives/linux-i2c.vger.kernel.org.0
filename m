Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D499C3F5890
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Aug 2021 08:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhHXG7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Aug 2021 02:59:34 -0400
Received: from mail-co1nam11on2042.outbound.protection.outlook.com ([40.107.220.42]:64705
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230332AbhHXG7d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Aug 2021 02:59:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkGg4aXEQzdKpKO5HsfkNUBTE46aDAhr11cdraSQl0gfKUvZKgQivd9MMpG3I+ExCRS5aSB1/3u+h0AslfSo/D5HIePjoROEoYn+V7F4u3186WIBydTWvZ8iyCi5oPedLPnPw9vHMe2wMfWWdl/Jd61vDvGmmbqWC9mKKYFwbXVCFyRiD+sFlbs0F2hxEJw2XblibNv/c96koI01afvk+kwC/mm9moMZldB2mvWYsIcawmBwe+dbQCFHD2rK15O1+3Ak0ICBVkNXc+wEBm0cP6MAG3HjNNsC1nawQZ9OC/ZgxmHvUoYlRdE7zkMwsHoVPHEvpc9Y5A6MOnWcFGBZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmto7AvX+9IrlXJ1mRd7OijPlVM7yUY9fOVfN/FRYG0=;
 b=XH+LWaM8M51jwI34GS2tEDQVcd1yUMp/coZayAqEr4tfdfGCK5CoDMMA03126Vu+uVL8HwvuWu5v5HlNqF6EUXkXF95T90jYCFBCatiXjVqfHZ8uMAsBu0r8hGdoDaVuhc3IPG9M5V1rbImZXQaw4juoT7mpdHWH8ggLziv5C/gTqS/RlDiFBueV480vgRNCXVN+F2h5d+fgZyHdOaTEAoDGWEvTbOOA5qD+pZtsZbNvQMaGoWwxoiXNsAl2fdT6luE2ybV6H8u/nTnGB6hAOGcHcN1Bz8m/bPTwqRFk/Udy8l0m9zJx7CO+MYyBNnnI3mCDn3Eg15Tao6kfxsZogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmto7AvX+9IrlXJ1mRd7OijPlVM7yUY9fOVfN/FRYG0=;
 b=JSn8yOTzISzhFKJ5Tm7ZARldgCUQzm+8x4j7eAsYixZ20wy7Bhk8gwa064LTmqI3MjoBQ00smU4DnFvj3YuJeIRrzCgFUguW3KlQXr/s7Y7KtFm83+qwu61CyIFrSuq9rgU2JdXdpmZnebvi9//IfziHLg5eRNRCO9pMwHU9fxw=
Received: from SN4PR0801CA0007.namprd08.prod.outlook.com
 (2603:10b6:803:29::17) by PH0PR02MB8731.namprd02.prod.outlook.com
 (2603:10b6:510:da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 06:58:47 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::a7) by SN4PR0801CA0007.outlook.office365.com
 (2603:10b6:803:29::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 06:58:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 06:58:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 23:58:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 23:58:46 -0700
Envelope-to: wsa@kernel.org,
 linux-i2c@vger.kernel.org,
 marex@denx.de
Received: from [172.30.17.109] (port=44168)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mIQOU-00047f-DL; Mon, 23 Aug 2021 23:58:46 -0700
Subject: Re: [PATCH v2 0/6] i2c: xiic: Fix broken locking
To:     Marek Vasut <marex@denx.de>, <linux-i2c@vger.kernel.org>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20210823214145.295104-1-marex@denx.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ee2f1e22-2069-308d-2a18-c59fd14387ac@xilinx.com>
Date:   Tue, 24 Aug 2021 08:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e16ca1-9c43-4cdf-dc11-08d966cc9eed
X-MS-TrafficTypeDiagnostic: PH0PR02MB8731:
X-Microsoft-Antispam-PRVS: <PH0PR02MB87313F38DC38718C344529E8C6C59@PH0PR02MB8731.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Txewpp9Z3VJaw6NhLJEQq+54DUFl3i0Z9G6RE882yCJCSOYP6V/yKXg0YQ5hpegC8nJNXRoGu9WxxIXRgRFIe8Qogsjwam+135/NjEpDm4nC2j01kMxQDE4lWTBAAnKz4gfMlu89bglT8vGE1abf6hLLH90pALOsOyNJorz7zvYQwLeuVc0JaMFFnBfuLqeXrW2wgo/NYBsPUPEpI3/yvTqQmDfmlhFlmY7GFGDXupB34pUca5s6sEmgDzGtGzuCFMxp0+SJ8cs/ZC/IPVyyDdmuwk2pBboBIiT8ye8B7vdMHZWZ3lMdGAYLc0DIpggtQskcM/Qq7zpyPUlDIcYAHNUL0kHel8JKASxHr524RZZqkjB8j85DucVQWCkFOy1RZGokJW82L95AzZTmxK/j0EuVHZHBByirCvpr8MiREZQpStJNAYMWT1seiE/fcuyQmaqR5vC+0KCUDlsGp9/kTfig5KG+dxL/h6GERqiUVVcXwt8DxmgoPNpgRLy/Z7wY3Rmb7wsVXoXWPw3dpGK77t3WeW+JHSED+tVk6SbbpIQ97T7CYVCFtchNlyEfxDsbIfPfR8ZSeTHmRp0huUECSQKoX7UHUv2FnHDr5CafV+wvUfe5YSq5pgygUrvwPkCM6P9xke+zORw6+CAfYCB5MIPzpyii7hch9YmA0JE+OKOWqI10/p/sIckh7B8j73QXe2EJLz5L/Umy72bZyr3mtomYRmQHzOSPJ2XUodbPafOZNhiD+CzyWG1oCD0tjhMUL+7jBZTa+dTZS5SHhGpoA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(46966006)(2616005)(2906002)(426003)(36906005)(26005)(82740400003)(44832011)(53546011)(36860700001)(47076005)(356005)(83380400001)(36756003)(5660300002)(7636003)(110136005)(82310400003)(316002)(54906003)(31686004)(8936002)(336012)(4326008)(6636002)(186003)(70206006)(31696002)(8676002)(70586007)(478600001)(9786002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 06:58:47.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e16ca1-9c43-4cdf-dc11-08d966cc9eed
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8731
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ravi

On 8/23/21 11:41 PM, Marek Vasut wrote:
> Booting ZynqMP with XIIC I2C driver shows multitude of race conditions
> in the XIIC driver. This is because locking is completely missing from
> the driver, and there are odd corner cases where the hardware behaves
> strangely.
> 
> Most of these races could be triggered easily when booting on SMP
> machines, like the ZynqMP which has up to 4 cores. It is sufficient
> for the interrupt handler to run on another core than xiic_start_xfer
> and the driver fails completely.
> 
> This does not add support for long transfers, this only fixes the
> driver to be usable at all instead of being completely broken.
> 
> The V2 fixes a few remaining details which cropped up in deployment
> over the last year or so, so I believe the result should be reasonably
> well tested.
> 
> Marek Vasut (6):
>   i2c: xiic: Fix broken locking on tx_msg
>   i2c: xiic: Drop broken interrupt handler
>   i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in
>     xiic_process()
>   i2c: xiic: Switch from waitqueue to completion
>   i2c: xiic: Only ever transfer single message
>   i2c: xiic: Fix RX IRQ busy check
> 
>  drivers/i2c/busses/i2c-xiic.c | 161 +++++++++++++++-------------------
>  1 file changed, 69 insertions(+), 92 deletions(-)
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> 
