Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9106466C356
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 16:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjAPPKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 10:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjAPPKV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 10:10:21 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C10F22DE4
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 06:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Etuy+X+EUfwyEef3HiDXMOPwyyj8N0hBhDPFv3cfLQpcnE0+Jz74WRbmT3zV5WgP2y2IuGiLDT+jIsi1Ir3pyd0veQzrdldfWcrX5kCsxW2GoxjDHedASbSuHWZulDvldBtB9sSfLcf4CzXXrjIMrliws7l3bVA4h5SBqilZIK0yf6gdK7obbFytF6Yciq+oERNHO4buJnIfG0wwz/gLuFAigToCQPYyLj0mZ9n+HRiCs4I1iVhjPAv0WssMSbTGTrtpwSZQhHoCmmeFTBXdG2rRAMVe7SI9lomxIWi2znski0OJua86J+hpI86IA7UBgzTC/EYY60teVMSYUM9Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQM/Aqrt58DZbmR8t/kxbxO2bRJQ3O3MDp73kni6kwk=;
 b=akKQh8RPV28PHZEEff+48C17XBR5LQQbe19EOrOx60kDe5XDdCDncbGAwyONPDanGhI8JVLB4W90ZZKL7vHOvuSeMVE+lIdrJ53VCM1x36nyOxWgvn94w3KqSHB4QD923LECc/ZxFWIIRS4Qgyb8P22YJIBt11BHqNp5i8gVJmFeb5iWGpVrfB4IMZ755iVd/PfZmiO+wxHpnQ9uGP47gnqDunLgInpbijn7F+uuijJv14F06jT2ZR07giATAFMjHUaPeDCU5U5gjMhDAzWF+dZc6jyaZEKL/dI/0WycXjDQ4B9YhxdlIdgtJJG6j7G4s9j4QRdClIaEjHl+EgWoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQM/Aqrt58DZbmR8t/kxbxO2bRJQ3O3MDp73kni6kwk=;
 b=hoJSgL+JXzv3pxujHLr7Kwv3yqjrXS0V5pqEZwy6x8j3a9AnqckPw75NwCyJZJTWfnMkq6rUXAYrZqhWSobd3xYjGnVPBurI8A6P+1tXBGrp/9P9UYR4fJaAeeFjAKTuD7fYTTW626eEHCyK+JqbPsSlAybfMEwaPkJ1i7fi0H8=
Received: from BN9PR03CA0280.namprd03.prod.outlook.com (2603:10b6:408:f5::15)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:59:02 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::90) by BN9PR03CA0280.outlook.office365.com
 (2603:10b6:408:f5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:59:01 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:58:59 -0600
Message-ID: <1086bd44-fc57-8a68-a418-1154828729b2@amd.com>
Date:   Mon, 16 Jan 2023 15:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-6-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230107211814.1179438-6-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1375bd-122d-4ac5-2923-08daf7d2343c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuHQtea5WQLG5xZv7dUgjrHA1URtMSHWzjCvsT+eeak2rcMGiBemf1i5Np6ogNzWRZ4msylyJlDeQbJsHE0br4lVBzVkxDayWHXpx3uCSoUjhFk41Sn1QW3dfISTgKyUeB3DWRqkz5M5RWTjQZ/Pki8eRheZa5LI/mvQvbcRvgLhb5Nae9mfVdAS8hi1I0uqomqRfQzBa5U7oJ/vFltVHtNgIXSbkPJjxSA/OirgOI+00/dmVhBy1xJMTgOPE3lR8hjAHa5xhkOM6QeTDHU2WLpHkqsT4er9dX7DJLQWMbmptzEv/wUHTS17aZQHrqeW89u/fGEFY+BuTO5b5wCPsuYfbse5ZVnJ9LH/7CdTvBZ+WOide8w7NZDEjZ0SIOmxPkcsWvg1F5INqAEjQen9dvnJIJMZYSdNDnVYonM7+7sW26k3/RuthEGkZARqx1MUaFoU38hWdPK/oXNh5LD58ZFb8dQF2tK8z4OkY/Jb3+3adQQfLME53j+bfWn4t55yvF4XFdhTULXfbMfYQpWbmveRAj3OEmmUSgMmtOq7l87aB3eRBsJEtYORud+e4D+Q8hSB2n1mF/7clBRYHrZLv3RPLnLv/7o6j5e18fUsc0+3KcPMn0TNHvOX6ho2OsuxMGS1nuwzFzdkayJpp0Ef/PsT8ej+QG79Rq8f+3wxiyVRXQ7UFI4EpLchgOc3JIcW2UbwQI039LAbrb2t47nBNiesqa9go+UcH64c+K7VET7q7Zg6K/ez/WsVeHxYImff7kLlj+6qtQmxv7ILfErVqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(53546011)(82310400005)(31696002)(86362001)(426003)(16526019)(186003)(26005)(4326008)(8676002)(70206006)(41300700001)(70586007)(2616005)(47076005)(316002)(16576012)(478600001)(110136005)(54906003)(40480700001)(44832011)(40460700003)(81166007)(2906002)(356005)(82740400003)(336012)(83380400001)(5660300002)(36860700001)(8936002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:59:01.7428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1375bd-122d-4ac5-2923-08daf7d2343c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/7/23 22:18, Lars-Peter Clausen wrote:
> 
> In the `cdns_i2c_mrecv()` function the CTRL register of the Cadence I2C
> controller is written and read back multiple times. The register value does
> not change on its own. So it is possible to remember the just written value
> instead of reading it back from the hardware.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index bec50bfe7aad..93c6d0822468 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -613,7 +613,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
> 
>          /* Determine hold_clear based on number of bytes to receive and hold flag */
>          if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
> -               if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
> +               if (ctrl_reg & CDNS_I2C_CR_HOLD) {
>                          hold_clear = true;
>                          if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
>                                  irq_save = true;
> @@ -624,7 +624,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>          addr &= CDNS_I2C_ADDR_MASK;
> 
>          if (hold_clear) {
> -               ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & ~CDNS_I2C_CR_HOLD;
> +               ctrl_reg &= ~CDNS_I2C_CR_HOLD;
>                  /*
>                   * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
>                   * register reaches '0'. This is an IP bug which causes transfer size
> --
> 2.30.2
> 

Logically this is fine but that additional read on CR register ensures that IP 
receive previous writes. The code itself is related to bug on Zynq SoC and that 
two additional readbacks can actually do something.

I think this should be properly tested on zynq to ensure that it doesn't break 
anything.

Shubhrajyoti: Can you please make sure that it is tested on Zynq?

Thanks,
Michal
