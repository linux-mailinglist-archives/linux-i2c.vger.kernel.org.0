Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027DB574DC0
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 14:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbiGNMfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 08:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239383AbiGNMfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 08:35:40 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874395C9E5
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 05:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffXOQ52/FLNQ72MT7jLtam+0RfErLIU+Sqto/cR0ifgL6L9yhjJ5PxDhabZ14jLIHISoP7ezWKmYIbZfdr/h2qcR3V7K6nLiy3xmZ3Gv1tZetgAoa5gGEa1rVgfPVSNiz4IqsIGiMTJ35Gple3D6BKRExUb+MgkRSXPFJ01XUR0YMoMRCJie4k9Prs9OVWXBrNOu3Ma//Zs8ARAx7ZQGCUoaPvizQPyZjmHMOcQ+0KL9CEhBdhcf3l+w3KeJviZhLdf3X7Yo9VXFjMxUtc5L4yeJZRvxCkT2xKTr+fjVH8JBJuLEgxsGcKocHioGPXlqBoukyMDAuNeV35VWgXqDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLr9oVknuhzMCS4jwsL9Q+7SKTbbcveuL0+hu/Wz2rg=;
 b=GIy1s8MtodfVU4ViNP1pjfWf8h7Yno0RdbnJKvecK2ETt60Oy2nMNY9OP/jp5+rCBEDqe4b7WkR3v22LUz+4QTR6fRIFB3hrESrg/HGUHR3zt5H5OZXUfi5ikW+vVJZnqo7HWIxxXDWA+7+shZvzNhaDQdqzkg9B0kuUClG/j+DcKjD1okMzWaC7roSKrizUhbQLLL5h651AVnfE8pAJgJ2DQTKim94RA3CuauGZg4XQzqK42Mx3+LSto2Lf173ukxCIDn1PkWTh/h50ioN4YSNo9b10UUdBXAlWL6vVI+bkJHzlCiIgiEQBv5oSBwj4n4xmBsWro6v1CPJzDDwJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=calian.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLr9oVknuhzMCS4jwsL9Q+7SKTbbcveuL0+hu/Wz2rg=;
 b=IydMag+wFGuIpHhhca4FNw9WEgdXkG9wI6ZqhEY5QzdU6OlZq7H6OaOfR9riPZrGchGdaGvGgYJZGj8lpfRpUtATL69VpglT3ccHb1NOeiu1aTlGra10z1IEiVU/48DzlsgPJ1iYt3EUgRK6KqByLVFGIEQ+bP0RHvSxS88QoEI=
Received: from MW4PR04CA0306.namprd04.prod.outlook.com (2603:10b6:303:82::11)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 12:35:30 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::9d) by MW4PR04CA0306.outlook.office365.com
 (2603:10b6:303:82::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Thu, 14 Jul 2022 12:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 12:35:29 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 14 Jul
 2022 07:35:26 -0500
Message-ID: <74df2bdb-13bf-4db6-36bc-e4eed807df25@amd.com>
Date:   Thu, 14 Jul 2022 14:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Content-Language: en-US
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Robert Hancock <robert.hancock@calian.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Raviteja Narayanam <rna@xlnx.xilinx.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
References: <20220614232919.1372621-1-robert.hancock@calian.com>
 <BY5PR12MB490276306C7DFAD42708540681889@BY5PR12MB4902.namprd12.prod.outlook.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <BY5PR12MB490276306C7DFAD42708540681889@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a71a21e-709e-4778-1a5a-08da65955633
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCNRdsJ1V4csk7RmCXBiG3v0x31zZLtGjgVaHwDkQAirnk4AiBGnhb92Pj82tgQV5waemM1TlNmY3gC5b2USRLoTI0y5UXuzX1DvI8+l+M40FI3NdERV4EwRJ7id13unLKGfJXaJGQUMA7iHX0Ou4rCp7d6K+ue0/OBLEYbcM1HCaFC7PUP7CkoFY0faAPj1Zp3HETtfV7A3MmlshWfDqhC9nbHAfWU61Vu7/qtLCFGwSDYbEaLbf1nqwcud5Vprb3IweztmaGQePtsiPzTzM3+IuUtdklTgAQe7OYpK6ptNk25sNxNz+447FQzKrytblKLOE6wQM/CVehAuofQnOpbBBcKPlkSxOb5Cc1QesBdH/UDn1Ts8JWUAYvKXZJorF8E5QPqH9lT1lYVKlkX/No9yu2o74XO68Pe4A5BAXlWDyNjY8WERmGHXcnbv0QwJ1O+d4+Y+n1P0DwuDhlHQQSmxp0MMOA0i6u7myS+wFOlmCzfhazrvgrTct0iPIIdGfc85QQ/ZCIg5F66+3M6D6MpJlzRQe4gG0BJ1FTYn37VgaPYEgLYoYp0LAGn9g0K0kULsvPiMYwU8j35B0UjEEWZVTj3cAtGqwBIWCO1ZNFhrICPr4Cy+vVHC8HJ7NubjzRXi6NuCwvuAyL6FBnlCGf6YJa6JwEyfOI/yOskOeaWz8lHMbZDVadzZ2SgCkcZJh283fs7i/snqv18uAINllk8kxl5WVm0RNT2yg6HTmXaYQCi2qbJFESIUkuDxzcT1ba//BOSSTBNRqsW25fPwmAB7TOHAwa9GxJGgGYtIxp2VbOr1txu0K/TtELypRHTwEFtPJ4ze/2dZuOI/JMhyVK5kJKCUgG5iUB3JsdhNafhwmjwjmafo1R3lSnPx6GEJ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(40470700004)(53546011)(26005)(8936002)(110136005)(2906002)(6666004)(82310400005)(478600001)(31696002)(5660300002)(41300700001)(40480700001)(2616005)(86362001)(44832011)(36860700001)(54906003)(16526019)(186003)(70206006)(70586007)(83380400001)(36756003)(356005)(82740400003)(4326008)(8676002)(81166007)(31686004)(16576012)(316002)(336012)(47076005)(40460700003)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 12:35:29.5193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a71a21e-709e-4778-1a5a-08da65955633
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/14/22 13:58, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
> 
> Hi ,
> 
>> -----Original Message-----
>> From: Robert Hancock <robert.hancock@calian.com>
>> Sent: Wednesday, June 15, 2022 4:59 AM
>> To: linux-i2c@vger.kernel.org
>> Cc: Raviteja Narayanam <rna@xlnx.xilinx.com>; Michal Simek
>> <michals@xilinx.com>; Anurag Kumar Vulisha <anuragku@xilinx.com>;
>> wsa@kernel.org; Shubhrajyoti Datta <shubhraj@xilinx.com>; Robert
>> Hancock <robert.hancock@calian.com>
>> Subject: [PATCH] i2c: cadence: Change large transfer count reset logic to be
>> unconditional
>>
>> Problems were observed on the Xilinx ZynqMP platform with large I2C reads.
>> When a read of 277 bytes was performed, the controller NAKed the transfer
>> after only 252 bytes were transferred and returned an ENXIO error on the
>> transfer.
>>
>> There is some code in cdns_i2c_master_isr to handle this case by resetting
>> the transfer count in the controller before it reaches 0, to allow larger
>> transfers to work, but it was conditional on the
>> CDNS_I2C_BROKEN_HOLD_BIT quirk being set on the controller, and ZynqMP
>> uses the r1p14 version of the core where this quirk is not being set. The
>> requirement to do this to support larger reads seems like an inherently
>> required workaround due to the core only having an 8-bit transfer size
>> register, so it does not appear that this should be conditional on the broken
>> HOLD bit quirk which is used elsewhere in the driver.
>>
>> Remove the dependency on the CDNS_I2C_BROKEN_HOLD_BIT for this
>> transfer size reset logic to fix this problem.
>>
> Reviewed-by Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>
> 
>> Fixes: 63cab195bf49 ("i2c: removed work arounds in i2c driver for Zynq
>> Ultrascale+ MPSoC")
>> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
>> ---

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
