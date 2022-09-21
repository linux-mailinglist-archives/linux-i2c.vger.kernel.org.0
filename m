Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48225C00DC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 17:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiIUPPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 11:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiIUPP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 11:15:29 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A0E844CA;
        Wed, 21 Sep 2022 08:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtcYpEuNwdMoGiB9OVi5ZmqPyZRZswmOM/vbr/U/bRxW1UcAW0TKHk/TDdt+Fqoegy/P5o1o83pIxNx7BX9rL0aFk2ZntA7LIigyeY+7/VXzoN6+pwJTArn9ZwSuZ7mL8L6OhLcl5bsFcBbPHzdKNK4ZF7e+ovIY7tQDzZ+6LZtfRQF/RSKUPni/Oeugd/kka2Pn0M/gJNH6V1X6fbAjhq0s4Y/QTAsYLaPXJEYPTDslZbaWoXDBTO9vjD8beCiSFJxmDAxdIJq5lkgK++6hsMJzkm12q2C90Yg2XNX1cwjkEKKlxRxrwE21N48T2xeDT7OAHrEHsI2qSsyFR/M0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf9cAmzo/bcul0mmrP6iLRrx67ENy1ea4l7jcDkrOJ8=;
 b=ne+qTECYIWLYXu9TzkUT0iy/20Rbc2IAtB68anVoqtKh1fLvy5ttoKzl9UWh3MVMUqpXZvCbQxsqzFD1CEKpma+QSx+SlvWmTcyDufYgibw0CSKtniY91pFoHJ/r5pENqUL/HwnjS2aRpJHcNTLlStufn/tWQyXJDh4EktqsNPJQWyk/ng/WStR7uqekwQ87igszTTge0cCkw4CoD9gKf4kEjVie+nxvYXxS3q8xTOVra1KGkQKp8KC3tKQKKsD7pv9UEM3v47n8YT9LAU4q12WetsHMqKMGTGVKXoDyu4qVGUFhKwkesx/pG4X20Zqm0uz5KdpGT10xHIP5AFPHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf9cAmzo/bcul0mmrP6iLRrx67ENy1ea4l7jcDkrOJ8=;
 b=fWiEuvz/f7brarK64UJeg7nD9wJx63MTdpnpI//+h8vVNfnEIMUvibUfPA4jNrLkXGBhT/SM4UOEcVWlisj0kfC9I9JpNsgL3850GFAmSRG69oyckxGOBc4W4Q8aQ1LV1YqLVcH6+ZLH1Gt350Y0vmtgXGwq2SxFP2+ywvvRERQ=
Received: from MN2PR16CA0050.namprd16.prod.outlook.com (2603:10b6:208:234::19)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 15:15:26 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::25) by MN2PR16CA0050.outlook.office365.com
 (2603:10b6:208:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Wed, 21 Sep 2022 15:15:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.11 via Frontend Transport; Wed, 21 Sep 2022 15:15:25 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 10:15:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 08:15:13 -0700
Received: from [172.19.74.144] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 21 Sep 2022 10:15:12 -0500
Message-ID: <921a1da6-e378-2632-7b68-ac59e3c24f68@amd.com>
Date:   Wed, 21 Sep 2022 08:15:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] Added Xilinx XDMA IP core driver
Content-Language: en-US
To:     =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
CC:     <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <martin.tuma@digiteqautomotive.com>, <mchehab@kernel.org>,
        <michal.simek@xilinx.com>, <vkoul@kernel.org>
References: <19bd8ce4-2dde-e985-00f4-09b48decd3dc@amd.com>
 <e084352e-a784-accd-f267-9e0c30c7a92b@gpxsee.org>
From:   Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <e084352e-a784-accd-f267-9e0c30c7a92b@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|BY5PR12MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a9f76d-0bc3-4ead-1ec0-08da9be41c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0NyuZ10YnPfO65ndzUCnFKaXE2RyXRSNJbUYkS7iloTN5RdVPIRDdJ2aKX7AnFvcHSaIJu3OfcfUoZ0eNFJNvpCsZf2JZWfEA8z8RvKhDvMnxg12vMFLjf/jWgvk6WKRvlE+CKo7E09tUCpKuvUkz0BKfiuW4Nf9s+Lcd6FviulPKa/D8g+ueeh0tO6UZqq6nA8UMRGL1BGRvpUaqzuh1FmD5w5EsaVhooT2rG1wmayMLSMKOy1dUK3djBoWrvmeAWlN4dV11vP2CYGezhUDtzbf0cSO+ipiQcBAA/vxvKhCdZN9Dz7WiS7IvjIGb/RoyYct2T5cBLID1oo7HID5w+AIiRY5BP4j5f4gdtZbhISfdEE5gxqtkZMExhXeMK2QWsci1A1mLrTDzDCzrIIKOehzn6ItK/K8cW0HXn7Y0otDu1dphd3v7xBZlMDOkzyfsRCOwLDLvGKVvkx+f6bJU6IKi9Omod4U9PVK6tRYBWvcXGqJ1hHcBP7L4WtI8tvrM7noqdQR3laNm4QvEY4EbZ0SXXx3ScqMOizq94rVCqRiZi971Up/FkCDtWuWuftXFECzovPuStlnm55oynx3l8MP2TtI5UQPdiX8e1rR9YVCqixJZcKUB4+pMF2v0jEvtHtgksr+yCnEpSLbEx5rVNSOvuKUMt55bLSYVTwdZgLqOQKaFMR7vAzW6nuupkbiJV9GHutUwPhShNY+jvY9PnJ3dIiO4d3RqUftn1WRKiZzr7dcyxU8mjpeN9S1ZhIdb8BoXjHBMiqrqZmg6Mkoik/dUloQ253sTDqvKY3NIY9nmcRMze3HzYnVDzMMjTvtivaQgAgnD7FLYrzSvrvWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(2906002)(8936002)(4744005)(5660300002)(70586007)(82310400005)(4326008)(8676002)(36756003)(70206006)(44832011)(41300700001)(6916009)(54906003)(36860700001)(40460700003)(478600001)(26005)(356005)(6666004)(53546011)(16576012)(86362001)(316002)(81166007)(31686004)(82740400003)(66574015)(2616005)(31696002)(186003)(426003)(336012)(40480700001)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:15:25.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a9f76d-0bc3-4ead-1ec0-08da9be41c3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/21/22 02:25, Martin Tůma wrote:
> > Currently, the V3 patch series does not support register user logic
> > interrupt yet.
>
> This is a showstopper for almost every XDMA based PCIe card. As the 
> driver "consumes" the whole register space (including the user IRQs 
> enable/disable registers), there is AFAIK no way how to enable the 
> user IRQs when this driver is loaded.
>
> > Could you convert your driver to use this?
>
> Not without the user IRQs.

I provided the patch link for user logic IRQ support in previous reply. 
You may pull it and patch it on top of the V3 patch series.


Lizhi

>
> M.
