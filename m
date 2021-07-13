Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3253C6AFB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 09:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbhGMHKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 03:10:39 -0400
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com ([40.107.243.50]:32492
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233762AbhGMHKj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 03:10:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqE6sGdZS2hY+y17HkDFnn5Grz4pOdVtWfOE28ZJFsP1qD/hsqQLddB9SzTTac8DVbRttKVf5iFvPDweV2vahnYHtwHbUKpHPDmajn8754pogCb3YTde0PmUIGJ4pIkpUf81rIMOsRqdrYeso599FLY2EW5oo0D8x/u6PA37wJuehDq23ehX1ROk3ufjDD+zge7bFwc8G/6QMwKfWV6r2Xt954P4i3TAyvFMglGPbMgRzc0siyMvrinI+3gFxb77D51LrHhViqMu6K2b300eQ/5jj00TwwT12YiPm8bnB9imTRHxH70M5EidN7UC+4mdDT8hQtTwsLPrAB7dawnGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aClx3b0+dBPAs4UR2k0GkfNltnpI0NN3iYk61heczv8=;
 b=m+Mkiuw80iuaBhu4I8n+NjOQwHMF6+XuIibYPcOMTxA5QimSSrnEbIuDAIRt8XZRcaM8XezNq04q/U2aNy+crXTNy8UPVurasZdQYTQ7mPUF9ijQy3QzK3LS+yjR1RvqTAKa8Jd+05/KZapl7sw9sJeCPOHrpxs4c4ZPIHjYNStxBvSjL9W7Mq8PbdvRjCoxq2lyuf50l18eiXOgX3/ov+kX8EqpeZYrSM2LlKPDceC2bXMwK7Zq1fzBsvFRO38ibJt+N2qePbCKfTB4ieh5cefpzMMopmlHifxJe2gSSFlxLRe091J+d1X4a/50Ek7fM/7NjHUewvzUExSgUm3w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aClx3b0+dBPAs4UR2k0GkfNltnpI0NN3iYk61heczv8=;
 b=emd889iSarHhGa9nsXfoFgmTUCQ7awIJB6VKM52//lMi4xlzCJHkCdfyMkKK9JT40AJF0j9qA+NvR/ZQTMzRNS5isyKNx7SbFUv17xPccA42D++PI4zwalOoMxwMJIJty0wA6SnpWph9jaRgmhVia21R558AiWgbhq3JjfzAJMA=
Received: from BN9PR03CA0979.namprd03.prod.outlook.com (2603:10b6:408:109::24)
 by SA2PR02MB7660.namprd02.prod.outlook.com (2603:10b6:806:14a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 07:07:47 +0000
Received: from BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::a4) by BN9PR03CA0979.outlook.office365.com
 (2603:10b6:408:109::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 07:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT012.mail.protection.outlook.com (10.13.2.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 07:07:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 00:07:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Jul 2021 00:07:37 -0700
Envelope-to: git@xilinx.com,
 shubhrajyoti.datta@gmail.com,
 linux-i2c@vger.kernel.org
Received: from [172.30.17.109] (port=43672)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1m3CVz-0001cP-Vv; Tue, 13 Jul 2021 00:07:36 -0700
Subject: Re: [PATCH] i2c: cadence: Implement save restore
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <git@xilinx.com>, <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <shubhrajyoti.datta@gmail.com>
References: <20210713070011.28254-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c6817d09-5104-1da7-98c5-0c8e9b68b723@xilinx.com>
Date:   Tue, 13 Jul 2021 09:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713070011.28254-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f3f5f37-1ef2-44ad-1279-08d945cceb1b
X-MS-TrafficTypeDiagnostic: SA2PR02MB7660:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7660434EA9C1CE14EAA1E87EC6149@SA2PR02MB7660.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sROGRL0Aewl6EepFUQBjhiYKUg0aFMWXCJwESGEAAD80HmLCY+xGyuPMMX72y6uGhjic4FgNVD1UvQSoiSXRvwhyuFniQPIxJX8pv3MK6uV6LfqE+K5KuRAgenDJQDEwATnD7iUCG1SWUVLeXENMUuFXP9x1Oanvu17BNO9Wf+wiBzf+wf4ow7CMNHp8PRUkVMW6mit11EZV9yclWrsYI8Vd7/tj4BYwpE23zM89RJ8T644EZuL6NM7YAoVaHlgGHxyAg1K6/DehnpT8J/IA6NLU0mqgA7M7ThPZD5Giros4VwnAxLQe8kdKzCf1CNhsAbX3HAhvDGWMSELBTzueUj6VUzldVAliXE3vbwy9CYQq8pK3eRL9r9oFcShsq5dJwyCUmGhpB0U2+DRiOLfzBt59VHo2MI3FOSU6OZbDqrejHQLWU95z2psWnrBaqEULJAGu8ogbh2sj4FjcqGXaMbS7f+Pdb7vY8DHeoxerPy9VZfF4ww2NNMkVgaCTWCYqrccODMd9D0bVUArJ25Xx9Q5q+4gZU0gKR9kZmbeVeAw7XMyoddsCm3wGUiFKub1x7Tyknbgfupd9nRgQ77jy+Zmyl8XTC3/a/PGI/OBybkv472rDPMT6P1m8DqvnzNKKYvn8HL/KNPgDC/z7xjqaz1ovpRBkqqE8dfrkQNQY7tPmWiJk30Z3KJZ86QGbHM6lXQJPYsL+5UfjPBSo3CudN1mQoSXINfJLGlkge2XgsHfl44tLlNH3TDai5S877l/XVjL790NMO1kkgKooqii61vQnEFuUA/8LJS5SE9XOVp7hsKiaUU16dAn2UcAIlbNsY3Hh2RKck8oWRq6HtTwwUQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39840400004)(346002)(46966006)(36840700001)(4326008)(110136005)(966005)(426003)(44832011)(36860700001)(70206006)(5660300002)(8676002)(2616005)(82310400003)(4744005)(83380400001)(70586007)(7636003)(31686004)(9786002)(356005)(47076005)(53546011)(31696002)(186003)(316002)(36906005)(478600001)(36756003)(2906002)(336012)(26005)(54906003)(8936002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:07:46.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3f5f37-1ef2-44ad-1279-08d945cceb1b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7660
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 7/13/21 9:00 AM, Shubhrajyoti Datta wrote:
> The zynqmp platform now supports chip-off so the registers can
> lose context.
> Implement save restore for i2c module.
> Since we have only a couple of registers
> an unconditional restore is done.
> 
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

I would say this should be v2 and there should be link to v1 version.

http://patchwork.ozlabs.org/project/linux-i2c/patch/1575888052-20447-3-git-send-email-shubhrajyoti.datta@gmail.com/

Other then this the patch is fine which is reflected by my ack above.

Thanks,
Michal
