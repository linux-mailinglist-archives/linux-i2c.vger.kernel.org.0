Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77344E44E2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Mar 2022 18:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239492AbiCVRUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Mar 2022 13:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239496AbiCVRUU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Mar 2022 13:20:20 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EF8275FE;
        Tue, 22 Mar 2022 10:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE2InLqALM19y2jK9BrfHYl4oMM+Nm6Jtt3Qd2JnNryFHjvucf4+Bwg5edpIddsQwsmeBfROhxIycbqj6amw5C6laeR/XNnBP79wz0HUMX6TTNSbLVKVKbekKCoMXPzDJsnyrvSNNbM0wiDcktHp9a8rBCNSPINSD/ei66d6kgUBsdejun7MWIUujK0HiijjzBOUBawYEIJ17Pr7cImyvF2BOZdN+fFj1NkGSdihKGkkKzLUa1mm/vEgoU0rixf2py9s0pHenZUZuQGMHU+Mpn+woYlNS7KS4XqeHKrL1ePxWZui3Gb8ue0W8TFrJEeFjjYO5Bngj7knwggOMvSaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVtTgbHsc90fzXfoEVy09CXgpO+HLKSp0zFUH7+CPFE=;
 b=eArubhg2UR4fQiffL+ok9APlwxJVDbs7QBASK+NR+RTVDpQl3XqdF+bZBtgwAZfIWZWsNY+Fs3dHnPxH2ifyREHZCpk+C9R/pZA3oRmKj2L33aXsvYb/yDPjv7vfP1GD7YBlyIpzSU9anhndi+qIaiFU/Oi6XHAqdGczwjEUZgPje7+F59bYM/bGyePR29ormRMAkQze638di6HYUhKCFqPDk94gUkw5xsYZ4ve6HlDbRXz9XlzRAzz83toYm39yZ8jjHxKdW4UWrqRBmSIJb9mBNJDUvOwWpsxF+W87Bzh8JRJSqNSK7CJTMA846D8FGd/H8B5mcjfYcgtm5Nax0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=opensource.cirrus.com
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVtTgbHsc90fzXfoEVy09CXgpO+HLKSp0zFUH7+CPFE=;
 b=Q3MSZq20TekkJc5mKehjka3w8owXz81AZI63LGmR+KTC2y/WRLdKVXmkF+8Z44O1h2dWy7X2Hf2gep3HNTAE2XeoH8oT5/Q1kCn6OH0tzpqiORmgFVhcknpW9O+KOK2ulyaPwrYpxhzUgxo4+ymuuamXW1KfAIJSRxIknFD4oHE=
Received: from DM5PR12CA0008.namprd12.prod.outlook.com (2603:10b6:4:1::18) by
 BL0PR02MB5650.namprd02.prod.outlook.com (2603:10b6:208:83::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Tue, 22 Mar 2022 17:18:48 +0000
Received: from DM3NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::3c) by DM5PR12CA0008.outlook.office365.com
 (2603:10b6:4:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Tue, 22 Mar 2022 17:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT013.mail.protection.outlook.com (10.13.5.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 17:18:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 22 Mar 2022 10:18:47 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 22 Mar 2022 10:18:47 -0700
Envelope-to: tanureal@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Received: from [10.254.241.50] (port=58266)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nWi9e-000CFf-Pn; Tue, 22 Mar 2022 10:18:47 -0700
Message-ID: <08dc1f90-586a-a47a-7c13-bce0405c13d6@xilinx.com>
Date:   Tue, 22 Mar 2022 18:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] i2c: cadence: Increase timeout per message if necessary
Content-Language: en-US
To:     <tanureal@opensource.cirrus.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20220309093147.102385-1-tanureal@opensource.cirrus.com>
 <dd26fa4a-870e-d969-04df-1f42487e2b54@xilinx.com>
 <4af9c968-b837-e984-1051-2dcd240f2c08@opensource.cirrus.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <4af9c968-b837-e984-1051-2dcd240f2c08@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa863f0-d39d-47c5-0aa9-08da0c2806d5
X-MS-TrafficTypeDiagnostic: BL0PR02MB5650:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB5650B97C295EACE2476BB4C8C6179@BL0PR02MB5650.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ag7UY1DsrjoHfG7UNaFB9g3IOIu+bdvDYE24k4JjapPAsZKvLVssXjRzU6GJ1qvBG5xkaeal9A8yM13AYL5iU7pFHzjfqt2jFDGqTnJJy1Pv3EIBbzqd/TqPOx1RtYMFOXI/BOFoYLbRCzR1CKUzUqpB251e7alQyRtVUpgmxPw8r5z/f/NrR7FXqcx3VzLQAOSHdzg0LBNs0O/JqI5iKoOASafz3Pbxa2K1T/NwJo6dnZrLNWqnZpMcwZNfaA7qonKdsJrWl8H9kNQw/X7PgN8PHZ/1uRX2W+2YmbXYEY7wLrViZD9AkjImv0h1uEdO3+1eZ4J/68/gf3JAcYPBvpc/am3a//Zvh16CtMPUu3U+Bb/TMiQb6HxOWxC+8gUHznOpgEUpwqE6L0fCKaOhpu2nO2nigBNDwnIbM/L7TVWEDz+HLNu9vHupR3yg9jP+Gz4FyVBKDdvALpU+ksJnpVgZnPy2t7iWx8ecW3pwveOJKB162r5LhkBVOaf0dwNZDDX7ObfpAkyt2eFpu3xn4SAJcvhUSIoKLsOhanwcLECvKISxS25sU6cx+NkH4Nft9gcpW0frUej7iTZuD3ho0Mv5qmDlL2A3zZyQo1AGT/IXHSCfOAFcLh0Ta6IXcuHR5lRuUDARWDvurG0WMuomHLEflWxna4Kyq7J9Py4YIwOrsAymSvULUKdRqLMczkB2i89mkpNRI5TZQvpWII8k3FAg4kcuzOS5Ws6KtPFaKUpJak/BEPSkMxW7LDLa3B8
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(53546011)(9786002)(8936002)(82310400004)(15650500001)(26005)(186003)(83380400001)(44832011)(7636003)(6666004)(5660300002)(356005)(2616005)(336012)(426003)(2906002)(31696002)(40460700003)(8676002)(36860700001)(47076005)(110136005)(70206006)(31686004)(36756003)(316002)(70586007)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 17:18:47.8415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa863f0-d39d-47c5-0aa9-08da0c2806d5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5650
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/22/22 16:34, tanureal@opensource.cirrus.com wrote:
> On 3/21/22 3:57 PM, Michal Simek <michal.simek@xilinx.com> wrote:
>> +Shubhrajyoti
>>
>> On 3/9/22 10:31, Lucas Tanure wrote:
>> > Timeout as 1 second sets a upper limit on the length of
>> > the transfer executed, but there is no maximum length of
>> > a write or read message set in i2c_adapter_quirks for this
>> > controller.
>>
>> nit: I would expect that you have run any test and you reached an issue.
>> Would be good to describe what exactly you have tried on which configuration 
>> to make it super clear.
>>
>> >
>> > To remove that limitation calculate the minimal time
>> > necessary, plus some wiggle room, for every message
>> > and use it instead of the default one second, if
>> > more than one second.
>> >
>> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>> > ---
>> >   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
>> >   1 file changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/i2c/busses/i2c-cadence.c > 
>> b/drivers/i2c/busses/i2c-cadence.c
>> > index 805c77143a0f..b4c1ad19cdae 100644
>> > --- a/drivers/i2c/busses/i2c-cadence.c
>> > +++ b/drivers/i2c/busses/i2c-cadence.c
>> > @@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct > i2c_adapter 
>> *adap)
>> >   static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg > *msg,
>> >           struct i2c_adapter *adap)
>> >   {
>> > -    unsigned long time_left;
>> > +    unsigned long time_left, msg_timeout;
>> >       u32 reg;
>> >       id->p_msg = msg;
>> > @@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct cdns_i2c > *id, 
>> struct i2c_msg *msg,
>> >       else
>> >           cdns_i2c_msend(id);
>> > +    /* Minimal time to execute this message */
>> > +    msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) > / 
>> id->i2c_clk);
>> > +    /* Plus some wiggle room */
>> > +    msg_timeout += msecs_to_jiffies(500);
>> > +
>> > +    if (msg_timeout < adap->timeout)
>> > +        msg_timeout = adap->timeout;
>> > +
>> >       /* Wait for the signal of completion */
>> > -    time_left = wait_for_completion_timeout(&id->xfer_done, > adap->timeout);
>> > +    time_left = wait_for_completion_timeout(&id->xfer_done, > msg_timeout);
>> >       if (time_left == 0) {
>> >           cdns_i2c_master_reset(adap);
>> >           dev_err(id->adap.dev.parent,
>>
>>
>> If my assumption is right and there is any actual issue you had please send v2 
>> and feel free to add there my:
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>>
>> Thanks,
>> Michal
>>
>>
>>
> The issue happens for I2C devices that have firmware, which will send a big I2C 
> message, but the I2C controller will timeout on it.
> That happened for CS35L41 DSP firmware tests, so no particular configuration, 
> just a driver sending firmware blob over I2C.

How big is it?

M
