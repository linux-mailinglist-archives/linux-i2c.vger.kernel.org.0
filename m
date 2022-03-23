Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97BD4E500B
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 11:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbiCWKJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 06:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243423AbiCWKJX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 06:09:23 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE15F76E0D;
        Wed, 23 Mar 2022 03:07:52 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22N704oP005444;
        Wed, 23 Mar 2022 05:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=5x6TWK8quLFcJokScQy0C7jNthZDFDtxhZhGtf0oW88=;
 b=gMAm3lVQNHAKO6B3TJn9hWH+lROY3oyVbSZR4lZ22aWEEfeA0bkvgacDfepvmsj9AOns
 fvIxjS9orewIakom87E4kV0FNa1gb8jC+b1OuRUKtGHC8EeYpd0Mv40biYcZi2lTG8r9
 /3X4jI/+bf2M0+K0sAKYUqoDtMtUNbW4dYvbyele+JZIot6tYshKWzb5w2XD5ryqngRt
 Fp2hgu7vevs2/zDBPyDMR/ZzrSTpRpYuNW9siIII75To0SAhCyQ7IUfxao6t1QYtIe9q
 9CvWoHXe/f2V4d1eSkvCSZM85Cym4XBwN39vexcO+GRyP35ocPF9OhPJJMb25hHSPnl1 kw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ewck1dnpt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 23 Mar 2022 05:07:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Mar
 2022 10:07:36 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Mar 2022 10:07:36 +0000
Received: from [198.61.65.125] (unknown [198.61.65.125])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 00A6146A;
        Wed, 23 Mar 2022 10:07:35 +0000 (UTC)
Message-ID: <3657b9ef-2c2e-82b1-1e2c-3d50c64d84b2@opensource.cirrus.com>
Date:   Wed, 23 Mar 2022 10:07:35 +0000
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
 <4af9c968-b837-e984-1051-2dcd240f2c08@opensource.cirrus.com>
 <08dc1f90-586a-a47a-7c13-bce0405c13d6@xilinx.com>
In-Reply-To: <08dc1f90-586a-a47a-7c13-bce0405c13d6@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zAO6pjyxiih057zn7EocQu6cDpvsq9n9
X-Proofpoint-GUID: zAO6pjyxiih057zn7EocQu6cDpvsq9n9
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/22/22 5:18 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> 
> 
> On 3/22/22 16:34, tanureal@opensource.cirrus.com wrote:
> > On 3/21/22 3:57 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> >> +Shubhrajyoti
> >>
> >> On 3/9/22 10:31, Lucas Tanure wrote:
> >> > Timeout as 1 second sets a upper limit on the length of
> >> > the transfer executed, but there is no maximum length of
> >> > a write or read message set in i2c_adapter_quirks for this
> >> > controller.
> >>
> >> nit: I would expect that you have run any test and you reached an issue.
> >> Would be good to describe what exactly you have tried on which 
> >> configuration to make it super clear.
> >>
> >> >
> >> > To remove that limitation calculate the minimal time
> >> > necessary, plus some wiggle room, for every message
> >> > and use it instead of the default one second, if
> >> > more than one second.
> >> >
> >> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> >> > ---
> >> >   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
> >> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/i2c/busses/i2c-cadence.c > 
> >> b/drivers/i2c/busses/i2c-cadence.c
> >> > index 805c77143a0f..b4c1ad19cdae 100644
> >> > --- a/drivers/i2c/busses/i2c-cadence.c
> >> > +++ b/drivers/i2c/busses/i2c-cadence.c
> >> > @@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct > 
> >> i2c_adapter *adap)
> >> >   static int cdns_i2c_process_msg(struct cdns_i2c *id, struct 
> >> i2c_msg > *msg,
> >> >           struct i2c_adapter *adap)
> >> >   {
> >> > -    unsigned long time_left;
> >> > +    unsigned long time_left, msg_timeout;
> >> >       u32 reg;
> >> >       id->p_msg = msg;
> >> > @@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct 
> >> cdns_i2c > *id, struct i2c_msg *msg,
> >> >       else
> >> >           cdns_i2c_msend(id);
> >> > +    /* Minimal time to execute this message */
> >> > +    msg_timeout = msecs_to_jiffies((1000 * msg->len * 
> >> BITS_PER_BYTE) > / id->i2c_clk);
> >> > +    /* Plus some wiggle room */
> >> > +    msg_timeout += msecs_to_jiffies(500);
> >> > +
> >> > +    if (msg_timeout < adap->timeout)
> >> > +        msg_timeout = adap->timeout;
> >> > +
> >> >       /* Wait for the signal of completion */
> >> > -    time_left = wait_for_completion_timeout(&id->xfer_done, > 
> >> adap->timeout);
> >> > +    time_left = wait_for_completion_timeout(&id->xfer_done, > 
> >> msg_timeout);
> >> >       if (time_left == 0) {
> >> >           cdns_i2c_master_reset(adap);
> >> >           dev_err(id->adap.dev.parent,
> >>
> >>
> >> If my assumption is right and there is any actual issue you had 
> >> please send v2 and feel free to add there my:
> >> Acked-by: Michal Simek <michal.simek@xilinx.com>
> >>
> >> Thanks,
> >> Michal
> >>
> >>
> >>
> > The issue happens for I2C devices that have firmware, which will send 
> > a big I2C message, but the I2C controller will timeout on it.
> > That happened for CS35L41 DSP firmware tests, so no particular 
> > configuration, just a driver sending firmware blob over I2C.
> 
> How big is it?
> 
> M
> 
The firmware has 33868 bytes, and it is split in a few writes. The first one to time out has 20240 bytes:

[   53.398444] cs35l41 0-0040: DSP1: Firmware version: 3
[   53.403522] cs35l41 0-0040: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 04 Feb 2022 12:01:42 W. Europe Standard Time
[   55.331688] cdns-i2c e0004000.i2c: timeout waiting on completion
[   55.336721] cs35l41 0-0040: DSP1: cs35l41-dsp1-spk-prot.wmfw.5: Failed to write 20240 bytes at 0 in PM_PACKED: -110

20240 bytes at 100k clock should take 1.6192 seconds, which is more than the current timeout of one second.
