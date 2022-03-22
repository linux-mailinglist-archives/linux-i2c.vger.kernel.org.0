Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E8A4E4314
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Mar 2022 16:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237498AbiCVPfw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Mar 2022 11:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiCVPfv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Mar 2022 11:35:51 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4067A7657;
        Tue, 22 Mar 2022 08:34:24 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M6Uded028345;
        Tue, 22 Mar 2022 10:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=upK7DUmmkbilSM17+qCH8ByFFRfmgzAlmJJPbV6wPcQ=;
 b=IwNYwKZrUJRoGOVnY9x7XRMb68QQaLxXSY4f+GCZ+ZVaenrIfbDCqJ8EMXou3QXCbNws
 wtkM9rK/QmGFxYPuMTwRV54GSV9L94yh54TH39qkSuXcU9Zs3W7zKPmovRgSbd4gtbzd
 SHNKTyPPvXCZZzijq+TPQ6CS45E0J3OLuDN0VDY77YVFmGWIJTUu1skImlcFz5+i5lQm
 QjgXdY+LJeMwLa08TqqGEMDzOE2Lw5kwl7kUX5UsP/y5NwgL2QjwQUetxt42NjjOkkwo
 WRr5h2JuKKbFFp/Ah77jBpesuSnSTNaKd7oCxLvZeoB3eb/RBZmh1VcVG7e818vEaLSH aw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ewbknc1cw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 22 Mar 2022 10:34:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Mar
 2022 15:34:14 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Mar 2022 15:34:14 +0000
Received: from [198.61.65.125] (unknown [198.61.65.125])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACD04459;
        Tue, 22 Mar 2022 15:34:14 +0000 (UTC)
Message-ID: <4af9c968-b837-e984-1051-2dcd240f2c08@opensource.cirrus.com>
Date:   Tue, 22 Mar 2022 15:34:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From:   <tanureal@opensource.cirrus.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] i2c: cadence: Increase timeout per message if necessary
References: <20220309093147.102385-1-tanureal@opensource.cirrus.com>
 <dd26fa4a-870e-d969-04df-1f42487e2b54@xilinx.com>
In-Reply-To: <dd26fa4a-870e-d969-04df-1f42487e2b54@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yqLQYoH5P1JHIOAXFMFqgTan2b_5Wf5L
X-Proofpoint-GUID: yqLQYoH5P1JHIOAXFMFqgTan2b_5Wf5L
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/21/22 3:57 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> +Shubhrajyoti
> 
> On 3/9/22 10:31, Lucas Tanure wrote:
> > Timeout as 1 second sets a upper limit on the length of
> > the transfer executed, but there is no maximum length of
> > a write or read message set in i2c_adapter_quirks for this
> > controller.
> 
> nit: I would expect that you have run any test and you reached an issue.
> Would be good to describe what exactly you have tried on which 
> configuration to make it super clear.
> 
> >
> > To remove that limitation calculate the minimal time
> > necessary, plus some wiggle room, for every message
> > and use it instead of the default one second, if
> > more than one second.
> >
> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> > ---
> >   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-cadence.c 
> > b/drivers/i2c/busses/i2c-cadence.c
> > index 805c77143a0f..b4c1ad19cdae 100644
> > --- a/drivers/i2c/busses/i2c-cadence.c
> > +++ b/drivers/i2c/busses/i2c-cadence.c
> > @@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct 
> > i2c_adapter *adap)
> >   static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg 
> > *msg,
> >           struct i2c_adapter *adap)
> >   {
> > -    unsigned long time_left;
> > +    unsigned long time_left, msg_timeout;
> >       u32 reg;
> >       id->p_msg = msg;
> > @@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct cdns_i2c 
> > *id, struct i2c_msg *msg,
> >       else
> >           cdns_i2c_msend(id);
> > +    /* Minimal time to execute this message */
> > +    msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) 
> > / id->i2c_clk);
> > +    /* Plus some wiggle room */
> > +    msg_timeout += msecs_to_jiffies(500);
> > +
> > +    if (msg_timeout < adap->timeout)
> > +        msg_timeout = adap->timeout;
> > +
> >       /* Wait for the signal of completion */
> > -    time_left = wait_for_completion_timeout(&id->xfer_done, 
> > adap->timeout);
> > +    time_left = wait_for_completion_timeout(&id->xfer_done, 
> > msg_timeout);
> >       if (time_left == 0) {
> >           cdns_i2c_master_reset(adap);
> >           dev_err(id->adap.dev.parent,
> 
> 
> If my assumption is right and there is any actual issue you had please 
> send v2 and feel free to add there my:
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> 
> Thanks,
> Michal
> 
> 
> 
The issue happens for I2C devices that have firmware, which will send a big I2C message, but the I2C controller will timeout on it.
That happened for CS35L41 DSP firmware tests, so no particular configuration, just a driver sending firmware blob over I2C.

Thanks,
Lucas
