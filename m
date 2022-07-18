Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2E7577E92
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 11:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiGRJ0L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 05:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233663AbiGRJ0L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 05:26:11 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EFE167FE
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 02:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LINuBwY6pGVn6bIv9tr1MuFI+5GRARGgADe5dM0Y30IV0IXB5iLVl3Mk6JyvufuEt8lRqXZexHmXCMj8vMs4WhQx4e7a3itM0geggdiZqR+eFwBJoV+SO4hhbO79+OwuPIQ8QRxqojSs6mRjXyfZZRztOx+y10SigfqLp5uKcv/A/IuiZ/IBvdN7wzYk0c5qieBRv+tOTF51WQlk8LOk7DuWlKu3UuCY2YFSIvDb/8vH+pCFhJuTraGzomV40Gsm0DUL+fHItKvR5ujxlp5+1p4MWK0khKbaCbgROhAAVOPciTilwpO7ccr1cH0iJxcmpQjmYwiXjpUgi7mUitBTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tG8+ZfHDvo+2ISfV42QI/hS91WhQTIoz4ZdnuxI690=;
 b=Q9GZn8AJlbxJXo4kaK04OFffOUnj+KRiqZNdQ/fZfzl6F2CKn64HYa/ZKQbZ7jznYZ24mHzPNTydt7JhqrzR61Prt0m5luVNqPg5qEM8RsDXiVUF6WSvPe0lftUL8kPXEohfD4CGaNB7CKiN5MS1Qk+pZxrLD87I/ECeTDv6xDBtadE1bHqLQv/teBCHEYTlf6hsC/3b+gDfJrWYkufUkO+OCYoIdNByhJg0sIE15wAJjWr/fgNDb+S+rTFfYBu221eO0dGNIRjOcsZsU0ilJYpdrVsydmHytGrUmcAZHqT9sUIW5Potrxb6M0xQrSgo4YVJ2XzH1FaW9D48Dc1t9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tG8+ZfHDvo+2ISfV42QI/hS91WhQTIoz4ZdnuxI690=;
 b=BoOkpEK03Bid/oQGroCnYUkhJizlzPHL1ZaA1Ni+DPnY7PWPlXXVAxh5lrqOA03+sNr3BzyMlarat9rm0iOuX6N87U6lazW4hy9PF6DCLAGjCihTvcgQLpurPwdRqB5G1sjN42fb4lEk6nJeMAWV4l+wBsF1DjrUdX4wJahfRqc=
Received: from MW4PR04CA0276.namprd04.prod.outlook.com (2603:10b6:303:89::11)
 by SN1PR12MB2541.namprd12.prod.outlook.com (2603:10b6:802:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 09:26:08 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::7b) by MW4PR04CA0276.outlook.office365.com
 (2603:10b6:303:89::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20 via Frontend
 Transport; Mon, 18 Jul 2022 09:26:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 09:26:07 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 18 Jul
 2022 04:26:05 -0500
Message-ID: <768b56a8-df1c-e24d-7879-328512598549@amd.com>
Date:   Mon, 18 Jul 2022 11:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
CC:     <linux-i2c@vger.kernel.org>, git <git@xilinx.com>
References: <20220717145244.652278-1-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220717145244.652278-1-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7339caf-cc19-40ad-26bc-08da689f8b9c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nenX32TJOUEgPVOUMf19VP4eS3fb79F5uJuz42prGf1I0xLSvWs7aeMXfTlre6Kb/khqXH1d0L8M29ccDTCxlkQd/pAzMnx8YDvqimgo9fDb5J70WRLTmpYaAcqAG52mN82AxvSaN+oS73aUh5R92xiNoOVBk4HrQnaqGX2Dvek7r2sRxrzopzMHHsUiGCf4W+QHyCNkEJWlLeEWNXholMCVquNo1cgurza7ibgGEgIMz24XG9K3KicZIWkTjASM2FlB1TgKKhRWHg11Grk0NAm+2ntuvXGHSYStg3kAqVEIGyEPC0m6s8bNafDY4ixyiYTqOsngUITG8HqUvZLT0sbtbErFZOMcCLA9JPddwWH883923sfDickTR4Xb7++8QI6a2qABAeDwmLOAa6bRrhYkMrmD9MtWY8jmFt4wkg2yWPqs7knS0xU1Ol+6AJrsm9nTfuLKIVzzbEMYUEYFPD5HqpTDBJjOT9sdU13K2kMp8meqlLaK5uMBtTuCS/7p7IgvoPenMeo8aSDNujsa7sDV2xOSvFyfIiI5Qs6No/+Os1FWr7LjylbiSYv6QQDcKt/hYYLTOnIyGjleLiEwS9i10QWImWMDPm+RIBCdBqjLK4eSRmbVn3fYpTZlRkaCVo0/Qp18DbgaAygBjBkejZ/hsGWHA0eXS/NAYrUF09wbI+v500xB2W8PT+UBIZuPgtnZxriIngIXe9A8Qij1VXRaHsEz36EYiZAHA8aFpAo3PH925lrRT4qNdW5BCoHK1DnM71u4uMw3LKsSqVNLsWTzGBk0Azh2xEYgaeIChumJmEJZYl1OTm7NHAtMDi99owZPrQoARaCwvhGaWnD/uFd7LOP8vmOli6wk//D/69uUgiqIww7aEB8TfdHIkEV
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(40470700004)(36840700001)(316002)(82310400005)(16576012)(82740400003)(6636002)(110136005)(54906003)(36860700001)(8676002)(4326008)(356005)(81166007)(31686004)(70586007)(36756003)(40480700001)(70206006)(44832011)(26005)(2906002)(41300700001)(6666004)(186003)(83380400001)(86362001)(2616005)(5660300002)(31696002)(8936002)(107886003)(40460700003)(53546011)(336012)(47076005)(426003)(16526019)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:26:07.5826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7339caf-cc19-40ad-26bc-08da689f8b9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/17/22 16:52, Lars-Peter Clausen wrote:
> SMBus packet error checking (PEC) is implemented by appending one
> additional byte of checksum data at the end of the message. This provides
> additional protection and allows to detect data corruption on the I2C bus.
> 
> SMBus block reads support variable length reads. The first byte in the read
> message is the number of available data bytes.
> 
> The combination of PEC and block read is currently not supported by the
> Cadence I2C driver.
>   * When PEC is enabled the maximum transfer length for block reads
>     increases from 33 to 34 bytes.
>   * The I2C core smbus emulation layer relies on the driver updating the
>     `i2c_msg` `len` field with the number of received bytes. The updated
>     length is used when checking the PEC.
> 
> Add support to the Cadence I2C driver for handling SMBus block reads with
> PEC. To determine the maximum transfer length uses the initial `len` value
> of the `i2c_msg`. When PEC is enabled this will be 2, when it is disabled
> it will be 1.
> 
> Once a read transfer is done also increment the `len` field by the amount
> of received data bytes.
> 
> This change has been tested with a UCM90320 PMBus power monitor, which
> requires block reads to access certain data fields, but also has PEC
> enabled by default.
> 
> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")

Subject is saying that you adding support for PEC and here you are saying that 
it is fixing initial commit.

If this is adding new support I think Fixes tag shouldn't be here.

If it is fixing issue subject should be updated and this Fixes tag kept here.

The rest looks good to me.

Shubhrajyoti: Can you please test?

Thanks,
Michal
