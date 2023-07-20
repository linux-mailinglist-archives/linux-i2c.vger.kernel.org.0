Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB9B75B342
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jul 2023 17:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbjGTPnc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jul 2023 11:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbjGTPnF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jul 2023 11:43:05 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D8312F;
        Thu, 20 Jul 2023 08:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mURY/a0msPZ6KB/DlepI7/agicbGH7wainmwhu8jqFHwEMWvfQsLgsV8CY2FGx9Fo27cB92UqAlfE9d6wq5BeHaFDvhbbwYVe+IFMTAbquSimfuxg7DA1vWoJZblO+Tx7gIab5w5hSIqJQbpwlbqltiIBfjF5xrDjg61FjZhvy6tINfTdbNQQGjDr5v7K//UTRer5L7ZUpr8xpBUfus1sgi/ZHBpJtQmrwIzNRqBHMbZWPKGrs50NnRg0bxfzGgkKWt++bhmRnH3jtKRpuKJvv6fJ5XMUfXmDTObF2U0pa00MuqzvidgpKj/2gsBfh9KsR9ZnIMRdilA+ph8p0epaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcP0y42JYpiULTkasN25jXQD7fSLObdGsEr9+Aps0CE=;
 b=Gx9FftEytMOxvwnSbjsZ6SjSKEcnuJaaB7T9TAyYrycKp/ClGXkcK2Rp3JKpSh0ElZWP0jai8s6YSPdxvLtkGpVRKZK8+0GtYOzQM/uoCoqKuTSUXLwQ5eChh0EO8Dy+rTYNMiIJPkpXTZiOJ92gvGVMbWR07mi9oghQc6YnzSVTtFij+kdayVblSikPE9723nlnxCxxCMrWIPumKCCvIcmXk3lrzR1LuvDGMxcaSzvxnDOWFfEUYOQNQW1hgMyjLHr8YmPA2TeY3X4ww9t/eqqM4dCFohARKv2VHr2xPfPqwvYdzDfNMmkZxpou9rbKZ5r6EuvlDgsn3MZJztMbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcP0y42JYpiULTkasN25jXQD7fSLObdGsEr9+Aps0CE=;
 b=lbsOAroRvZhCRvkXVU/u32inkmnOuiJqj4fHNoMJ/J1q/YviXXbnAMVAGeKLntRxzK9fN9Y4CT/12ICB4kPX0KKBOw5LqDHpmEHzrxJZtn5HDnHTQPL0bHqqsKNOPTGmmPSziP0IyZyvSobuGt2CDrXuXTEHxUIERwc/s2rUSPgKQg47UIamaSaz3KGjvP1n4IjI9Dv88PED2KaVWNKVjVvkLmKyLY9I2IoEcJprBf6Af660+Rx6kAZc+fC5aE1+B8C5QIUr6PgkvT54YzPW/RavQF6hKi/cvy5DbxdL+PToqp3rnk3Iq1GBCwSx2Mt5lePDLIidh+zu7tVMa67JHw==
Received: from DM6PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:333::19)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:43:01 +0000
Received: from DM6NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::a5) by DM6PR03CA0086.outlook.office365.com
 (2603:10b6:5:333::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Thu, 20 Jul 2023 15:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT097.mail.protection.outlook.com (10.13.172.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Thu, 20 Jul 2023 15:43:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 20 Jul 2023
 08:42:49 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 20 Jul
 2023 08:42:49 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 20 Jul 2023 08:42:46 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <thierry.reding@gmail.com>
CC:     <andi.shyti@kernel.org>, <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <wsa@kernel.org>, <akhilrajeev@nvidia.com>,
        <sdonthineni@nvidia.com>
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Date:   Thu, 20 Jul 2023 21:12:43 +0530
Message-ID: <20230720154243.12779-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230707132619.2998382-1-thierry.reding@gmail.com>
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT097:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd1b8c1-1e52-443c-9d35-08db8937ffbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgVJflLUO5QF5F1k9uAdWQRcVjgEVHNcjOP79E91D8ZjBjuVRIy7z0mpPK1l6IlcJqpQ7smoKg0U9FH+7fv3XtIfpRjA9ldHTl7jv84rL9aNf0rwF621VjuAgTsD/3g2G2eFB7H17KP3TKybJsXZC+v55ebSj6I19349NewUGI56N4d1qEUr5hHy9B1Q7g5qmDa+ARwB3rNnl12YF9ANbmAd4InlNF/9+0Tvcq++shlVZKOUilh0opZwpKlu9nC4XmrAQCbZQg+TxAkrFjGl+gD9j60uFh3QWMoU470Ih1w7rbV2+QFat0clErZbCO54Ym3HQ7n4SnUd5XxvWd1/6QFgr8M8pUEtd0fAN7AuBPXyY0X60CBRX1Z4A6ZEATVqerLzSkXgFk5r43AuKZ+oruMEl+P3d61I1n4/QD+ZNjwZ/LmiOkFSCgsH0/2eUYJQRbaZDnm6ARqm2eNFf1TYG+t+yt/wzF/fmCB7KJiJl06t4XYajfw93FQe9N0tpW7WMV9YDX9ebZU2vqW+uj1n/w2tM1CPZNU8wtcW/xjnvpFcPk9k/taedC0x9eomCV9VmY8FMTfnjo+7ErgJuUo4LeCIU/iaa0tPB542SOm2N52c09OSQzqr0GkUNl7PqMKTjHrb/6+GOS5EUFsWRIaMojSUaHYYyDZQUguLlprnKuKLx7B1gTI/4Tjm6vxsWsK6YcqYY4KHO5ks++P/DvZxk0W13uVGCrwzKvcMNyZkexermCHrqY2FN+cVccobrupe
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(26005)(186003)(107886003)(1076003)(336012)(478600001)(4326008)(6916009)(70206006)(70586007)(316002)(40480700001)(8936002)(8676002)(5660300002)(6666004)(7696005)(54906003)(356005)(426003)(2616005)(47076005)(36860700001)(2906002)(4744005)(40460700003)(7636003)(82740400003)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:43:00.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd1b8c1-1e52-443c-9d35-08db8937ffbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>If the driver fails to obtain a DMA channel, it will initiate cleanup 
>and try to release the DMA channel that couldn't be retrieved. This 
>will cause a crash because the cleanup will try to dereference an 
>ERR_PTR()- encoded error code.
>
>However, there's nothing to clean up at this point yet, so we can avoid 
>this by simply resetting the DMA channel to NULL instead of storing the 
>error code.
>
>Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and 
>TX")
>Signed-off-by: Thierry Reding mailto:treding@nvidia.com

This fixed the crash issue seen when there is no dmas property in
the device tree.

Resending this with the correct headers to get it recorded by
patchwork.

Tested-by: Akhil R <akhilrajeev@nvidia.com>

