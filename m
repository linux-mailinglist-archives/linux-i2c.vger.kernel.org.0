Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5B55EA7E6
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbiIZOGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbiIZOGG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:06:06 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668C0895F0;
        Mon, 26 Sep 2022 05:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mugG10UEQ+VlukrbNPokrV1ojvF5hNFddFbnndwRVNfa/4130arT5dlKEVFLcrIxASAUeSDFEa7OfprRua/HIuiM28YesGkh7N+9kz+DSK1HF6EoCkh4V+dtEviqb24H6AQ9H4u9DwYFvy+XTGY9v4iAPcoTAAu6dd1z7Gv4JrFycpn3+3H+UI9tKdixTz2afH/uDlgyHvZHDkX7m4Z5QGqn7GybPArbTDnNU+Dw+afnwX/bQxB9iv2ULxmF0am0Q46KyqmMFMlbqugpi2EQUEDWOOceOohDFAILzR4p5t1x+Euqw37BlGaLrTiEnWG/f1PqqtrovffpbFubWBnCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wtolnk/byvkGqCKlxCGImxHfbeUxjzWepxfjVAPv3EM=;
 b=hCfFcpAOeAIMtN5cvD9OGphdAwS6rAdfS+8e4OXl3IdoZ+/ffcpVpWm3uYprT8E1zpO1od0qBmlUDHB1D9Y+aFGS+8nf61LntGPQk+d2YDd+UyZ0C5FE0yOrKHKq0xLhhGRbnHX5CQ2fht4DyKncj3a5vvP368EvN99ltAxjXjyu2iACSn/iUFHSoeLdzQsvkRDnrAKVCtzjrDrAO6U1pNbV7AzMEPOZVRELZD8ox7tB0eMsaNszyOs3DLONp8qTYnHGNusvOVCymbDqWsh3XnNLl2NCp2zzxSVvBI6zMzLdKP7f6zE0BDMktp9KCCwOqYuXpsZSOWHqTyjiR26wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtolnk/byvkGqCKlxCGImxHfbeUxjzWepxfjVAPv3EM=;
 b=GrxHEFQMDpkb/VjjNr8vgd7L8YIfYF4UZgGK2J+4eCPsX79Xp7CC9bwfiSnspwodHNhifeCGc8j850Q9lUKVyxyXMSVGaLhiQw1GPkzx6B4LRg+WTxtDt13IWPFScZk3HRCMjGrWYRKODznBetOwEUlYDqzoecQMPDVZ3Q9Hauc=
Received: from MW4PR03CA0302.namprd03.prod.outlook.com (2603:10b6:303:dd::7)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:17:02 +0000
Received: from CO1NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::f) by MW4PR03CA0302.outlook.office365.com
 (2603:10b6:303:dd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT115.mail.protection.outlook.com (10.13.174.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:17:01 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 07:16:30 -0500
Message-ID: <7e7ca7b9-9b19-654b-cfa4-de836a90c57d@amd.com>
Date:   Mon, 26 Sep 2022 14:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V2 0/9] Added Standard mode and SMBus support.
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        <michal.simek@xilinx.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT115:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 525b48dd-5f2d-4f7e-0803-08da9fb9048c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLu0OvQ7Zf45OINHwPJGJzl88YuSk08DpGr2UMDG04uUe5YycrQRucQdATMswICjmfXpk46is8APTBeMoa6/dIRxEetxo/6dkNIuuXOezVAAEdWUYLR0h3nNNxm/wY9se80A90ZSprI9eoMKg9NM6CbBbEpdinnzjkkXwE/2becjVH1VOVxdtn0tCCd4Fx/BR7mh29XbeBybbUCmRE4kKNH6dMYZ6D6ESIKy7nxhh6q8MlDe3wvZO8dGZ0UtFdGkbC3HHu9VX3Zsaz25iwUdgWpxgy6PJcwYf9DRQPi98Ktxdec9/TQ9K27zmwIoVUD7iauP6P34UJBeB2fm8C6oXOjq490Y/391qc2VfmjP28unFpWKNOcqydYDFlUVQZTXmbN7Dmo6ya5WzECPVYDinj3sXkfHT4b7Q8frhsfxjNy1nvkf3xoAhNKhE7d0xhqXscBEj0+wD8vxI2DKpnK0+rE3KAeOIfNb+XTJuqF6/sYNna1X+0RLxK9l0MiREoYi0eVq1L3xUD7tepbC2rYlH+mO17aa5oSUMsQbCoJBFwvasfTWbqJ6CizNfTRoNe+fwoF8S50o46F+fXk6m9GK9sAlkat2qtYgRJmgoB/Ykn16DrLuPZJZlt52UIDb0Q4I2+M/BG6onU67Efs1GqgnP3d9tcznxbFXnmblxUuPlcwi0D+PpWzahBfYldZGvg5xxMucsUryiNjs2CHzQmtZNZnlNByfwPVQiTpwldFjcW1aPyHksFjDs5cPyHTDENZRWoXKpmTv7mR9QgL7Ogu6NK5jqVWpr7UvdfHSeQtlAncdk6lgCminXTzsiVwvO0uI/VaKnRWw9XiDxv9PMkbWMD1zOPN6d3Q7UeK7qDlojZFxFbVFC1ZrMDZEyq2MIF1J
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(336012)(2616005)(16526019)(36756003)(186003)(41300700001)(6666004)(26005)(5660300002)(44832011)(53546011)(82740400003)(8936002)(40460700003)(40480700001)(86362001)(356005)(82310400005)(81166007)(31696002)(83380400001)(47076005)(426003)(36860700001)(54906003)(966005)(110136005)(16576012)(316002)(478600001)(31686004)(4326008)(70586007)(8676002)(70206006)(2101003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:17:01.8523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525b48dd-5f2d-4f7e-0803-08da9fb9048c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/22/22 10:44, Manikanta Guntupalli wrote:
> -Added standard mode for AXI I2C controller.
> -Added Smbus block read support to xiic driver.
> -Added 'xlnx,axi-iic-2.1' new IP version support.
> -Added dynamic SCL frequency configuration support.
> -Removed 'local_irq_save/restore' calls as discussed
>   here: https://www.spinics.net/lists/linux-i2c/msg46483.html.
> 
> Raviteja Narayanam (9):
>    i2c: xiic: Add standard mode support for > 255 byte read transfers
>    i2c: xiic: Fix Rx and Tx paths in standard mode repeated start
>    i2c: xiic: Switch to Xiic standard mode for i2c-read
>    i2c: xiic: Add wait for FIFO empty in send_tx
>    i2c: xiic: Add smbus_block_read functionality
>    i2c: xiic: Remove interrupt enable/disable in Rx path
>    dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
>    i2c: xiic: Update compatible with new IP version
>    i2c: xiic: Add SCL frequency configuration support
> 
>   .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   7 +-
>   drivers/i2c/busses/i2c-xiic.c                 | 582 ++++++++++++++++--
>   2 files changed, 537 insertions(+), 52 deletions(-)
> 

I was reviewing this code internally that's why

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
