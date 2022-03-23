Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AEE4E50ED
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 12:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242448AbiCWLDq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 07:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbiCWLDp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 07:03:45 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4623340E57;
        Wed, 23 Mar 2022 04:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwu/OJuKRXi6e3piY6GT/eFbQ3FgZjsNVtAXSBWuUNyj3+oEAidGK5XvIG8s7DXYHo5k4PXmTFdo9xU7QflzFvYA4JXFDbjtpFhF2Z8rJh6APUqyLwwZTkJdUzsRgkmYKW4qfXBwDUe0UxcxHuG/hEcRNacb3KU4nV+XGSQnr4zK5vHWNfOzKHvOySK84n2krn8WRetkRd0xOk1TFEkyrKwquy6Nda/Pzr/eghVMPo58bgWcU0lmpqWUg2ti+HHaX9gk6C+++c1ZcZrdc312UQQz17zsXta7I3UluRO8f80Ql6/5EP20bzW6Zujzp9MF81yL8Hlyk2n2lafvPQhCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJCXoFEjg4nwvRNqinrWy2/0aVGKAnFjXx5ekNT0BKg=;
 b=ht1aT1jndKnH40HYUpkUtF4FntjE2t5Us5GgEc36ZbWtH20/8g7wIHvEyKhG2ABjcO8V31L9K7qRfhbFpUknyFjjXmz+0hvjnEEntlFV8+MbYjJH5hH+5BjuYwomycnImPPOtDzcDj9xQKhlldJDzsna/C5qqckPbBS2Wfj2F/j8Se7HF4ZF+G7yfEW5aylzS9F5dcPqBxm3l/EABf6XoC4kOP1tSyZUaiP240Q1wlKFqtkVfXYjhq4TZvyI1kq/OFa4T+rcYxNpWAT20GwRGOKdp0eYsVBmSvrq31wL21jqXxEgWjoiTVeQlHV72jm1jF1AK+V19hdF4AXhf/ZIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=opensource.cirrus.com
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJCXoFEjg4nwvRNqinrWy2/0aVGKAnFjXx5ekNT0BKg=;
 b=B+OktkwYUYa7XzZhXKPfQgd7JHzNNei8inrbH/M2W+nuX68TAXWWc/0X4kTQfJyWwg7d+2P+KMOjuspF83i0bJMYCcBwTnjXXtXbiwRHZlQvfQGsQvZs26aro/C0s82CPddeBxMY4l8TMoogTZqho3pnLreJhE/rAsAnI0lI8kk=
Received: from DM5PR21CA0059.namprd21.prod.outlook.com (2603:10b6:3:129::21)
 by DM8PR02MB8215.namprd02.prod.outlook.com (2603:10b6:8:e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.19; Wed, 23 Mar 2022 11:02:13 +0000
Received: from DM3NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::fc) by DM5PR21CA0059.outlook.office365.com
 (2603:10b6:3:129::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.7 via Frontend
 Transport; Wed, 23 Mar 2022 11:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT029.mail.protection.outlook.com (10.13.4.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Wed, 23 Mar 2022 11:02:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Mar 2022 04:02:11 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Mar 2022 04:02:11 -0700
Envelope-to: tanureal@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Received: from [10.254.241.50] (port=54338)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nWykl-000DYN-95; Wed, 23 Mar 2022 04:02:11 -0700
Message-ID: <33ed666e-79aa-4779-43d6-4f2e82d91744@xilinx.com>
Date:   Wed, 23 Mar 2022 12:02:08 +0100
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
 <08dc1f90-586a-a47a-7c13-bce0405c13d6@xilinx.com>
 <3657b9ef-2c2e-82b1-1e2c-3d50c64d84b2@opensource.cirrus.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <3657b9ef-2c2e-82b1-1e2c-3d50c64d84b2@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31e4cf64-afa2-4a23-fc59-08da0cbc9601
X-MS-TrafficTypeDiagnostic: DM8PR02MB8215:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB82153C3CD90F14E689307059C6189@DM8PR02MB8215.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBfa2+vh4sscBfHLosdTAx9exx69OgNGS1hq9713JzvRtGJAGq7XiSMe6Ob0b4YyLEdJFBux7DpiA7UbtWDk2QVtfIWHgI/v4F1omxaib0rMbPSHpo2VLGbjTYuI03dzU9MeOx6BKY+UeZ5LW40mtlC0ZZbz9kGLpmDLY4HKCSVCME/S1pgZRRMbDCJFJE6I8EFbpXZRP/D8znFyFHwC1r908G5kJes4cM8ERp1biOE2haDT21KK5wDXhWLMtHqt28jHu1FmpBENGYi5WrwkuXZcGJBCQuzp2Epuck7MXAl0kGCdKHqMz5rLAetbSintgSAmnSyqFEFRvWAh1NfsXeW6soZ6rDeect+OcuFi9xe13ygBSrkr5lSXb2xXQP0pF+WeytbCnpNy+0HDr9/s5Snf8d67pZTmOalkvKLWK7dhPzfInYVlFwT2rS11u4EBHryis1JIs9NJe4d7QpwOnC4D7MfWUWyHMMHhkm5aoy1Uj6RhSyO5Ko8RIahQQbGzmqLkqwkytCYmUiHgVPSOdlVCtMHzNaBa01Ww8KHtSUj2TdiXjiTKmANqiLC4Nmp3aoxD7NbhLJDIFRyOXR4STk2A/SFx//bw3kDE6RfU7Ca4L+v1tUvq+3WqHtdGXUkHlLFtp3jQrXF8znza6NPQDjr7wjI71z9OAT1s5+nMKxgweI+8XSSELj9TpjkFTsBq6L1n/AXxJJS5PtA7QesLdKbWPsaU43Fh/J2UT8jxwOpCtVzWAYhquCufYbEl6Ghi
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(15650500001)(83380400001)(5660300002)(9786002)(36860700001)(82310400004)(44832011)(47076005)(336012)(110136005)(6666004)(316002)(2906002)(53546011)(26005)(426003)(186003)(508600001)(8676002)(2616005)(70586007)(70206006)(31696002)(40460700003)(31686004)(36756003)(356005)(7636003)(50156003)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:02:13.5662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e4cf64-afa2-4a23-fc59-08da0cbc9601
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8215
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/23/22 11:07, tanureal@opensource.cirrus.com wrote:
> On 3/22/22 5:18 PM, Michal Simek <michal.simek@xilinx.com> wrote:
>>
>>
>> On 3/22/22 16:34, tanureal@opensource.cirrus.com wrote:
>> > On 3/21/22 3:57 PM, Michal Simek <michal.simek@xilinx.com> wrote:
>> >> +Shubhrajyoti
>> >>
>> >> On 3/9/22 10:31, Lucas Tanure wrote:
>> >> > Timeout as 1 second sets a upper limit on the length of
>> >> > the transfer executed, but there is no maximum length of
>> >> > a write or read message set in i2c_adapter_quirks for this
>> >> > controller.
>> >>
>> >> nit: I would expect that you have run any test and you reached an issue.
>> >> Would be good to describe what exactly you have tried on which >> 
>> configuration to make it super clear.
>> >>
>> >> >
>> >> > To remove that limitation calculate the minimal time
>> >> > necessary, plus some wiggle room, for every message
>> >> > and use it instead of the default one second, if
>> >> > more than one second.
>> >> >
>> >> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>> >> > ---
>> >> >   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
>> >> >   1 file changed, 10 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/drivers/i2c/busses/i2c-cadence.c > >> 
>> b/drivers/i2c/busses/i2c-cadence.c
>> >> > index 805c77143a0f..b4c1ad19cdae 100644
>> >> > --- a/drivers/i2c/busses/i2c-cadence.c
>> >> > +++ b/drivers/i2c/busses/i2c-cadence.c
>> >> > @@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct > >> 
>> i2c_adapter *adap)
>> >> >   static int cdns_i2c_process_msg(struct cdns_i2c *id, struct >> i2c_msg 
>> > *msg,
>> >> >           struct i2c_adapter *adap)
>> >> >   {
>> >> > -    unsigned long time_left;
>> >> > +    unsigned long time_left, msg_timeout;
>> >> >       u32 reg;
>> >> >       id->p_msg = msg;
>> >> > @@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct >> cdns_i2c > 
>> *id, struct i2c_msg *msg,
>> >> >       else
>> >> >           cdns_i2c_msend(id);
>> >> > +    /* Minimal time to execute this message */
>> >> > +    msg_timeout = msecs_to_jiffies((1000 * msg->len * >> BITS_PER_BYTE) 
>> > / id->i2c_clk);
>> >> > +    /* Plus some wiggle room */
>> >> > +    msg_timeout += msecs_to_jiffies(500);
>> >> > +
>> >> > +    if (msg_timeout < adap->timeout)
>> >> > +        msg_timeout = adap->timeout;
>> >> > +
>> >> >       /* Wait for the signal of completion */
>> >> > -    time_left = wait_for_completion_timeout(&id->xfer_done, > >> 
>> adap->timeout);
>> >> > +    time_left = wait_for_completion_timeout(&id->xfer_done, > >> 
>> msg_timeout);
>> >> >       if (time_left == 0) {
>> >> >           cdns_i2c_master_reset(adap);
>> >> >           dev_err(id->adap.dev.parent,
>> >>
>> >>
>> >> If my assumption is right and there is any actual issue you had >> please 
>> send v2 and feel free to add there my:
>> >> Acked-by: Michal Simek <michal.simek@xilinx.com>
>> >>
>> >> Thanks,
>> >> Michal
>> >>
>> >>
>> >>
>> > The issue happens for I2C devices that have firmware, which will send > a 
>> big I2C message, but the I2C controller will timeout on it.
>> > That happened for CS35L41 DSP firmware tests, so no particular > 
>> configuration, just a driver sending firmware blob over I2C.
>>
>> How big is it?
>>
>> M
>>
> The firmware has 33868 bytes, and it is split in a few writes. The first one to 
> time out has 20240 bytes:
> 
> [   53.398444] cs35l41 0-0040: DSP1: Firmware version: 3
> [   53.403522] cs35l41 0-0040: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 04 Feb 2022 
> 12:01:42 W. Europe Standard Time
> [   55.331688] cdns-i2c e0004000.i2c: timeout waiting on completion
> [   55.336721] cs35l41 0-0040: DSP1: cs35l41-dsp1-spk-prot.wmfw.5: Failed to 
> write 20240 bytes at 0 in PM_PACKED: -110
> 
> 20240 bytes at 100k clock should take 1.6192 seconds, which is more than the 
> current timeout of one second.

ok.

thanks,
Michal
