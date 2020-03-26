Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2E7193CB5
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCZKMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:12:49 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7364 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726298AbgCZKMt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 06:12:49 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QACYnG032171;
        Thu, 26 Mar 2020 11:12:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=L85rZOpZxg375px3mWAwS/C7vybF5ftzlf5QE8rNbBw=;
 b=ewiNc0NURcooa2CNZCnpwJ2/qcd5H7zKOVLl+rUFPuFDTR/ypJAFyy+I1XdX1HLCWyCx
 gChVcjirmE+eEojq7dsgc3wEhu6qfIF2pPYZFHXM2qFp6P1bBUQEf68mfx4q5Xdt8n2/
 HnyEuYLZD3WPUI+OM9reFz4sCxi1swXLLmbXuQG+q19pU6sgyu6qwmgwR6nR3ajXZ9Ys
 E8rdXmNrRMZqGwlzOvvxalTnRUATrsxBdfFqhY+q2Ma/c3ni8ln0L+jNxKX8tQmB7lhF
 xDvbggUkFql0Iq/wGT1jMIUxn+05hkPYokR5JDtgxD0L2mdqtrK0ocbcQ65CSNKlbApw Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xeb99h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Mar 2020 11:12:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07635100034;
        Thu, 26 Mar 2020 11:12:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C354B22228D;
        Thu, 26 Mar 2020 11:12:25 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 26 Mar
 2020 11:12:25 +0100
Date:   Thu, 26 Mar 2020 11:12:19 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH 2/2] i2c: i2c-stm32f7: allows for any bus frequency
Message-ID: <20200326101219.GA21190@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
 <1585161361-3408-3-git-send-email-alain.volmat@st.com>
 <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_02:2020-03-24,2020-03-26 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for the review.

On Wed, Mar 25, 2020 at 06:53:45PM +0000, Andy Shevchenko wrote:
> On Wed, Mar 25, 2020 at 8:38 PM Alain Volmat <alain.volmat@st.com> wrote:
> >
> > Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> > instead allows any frequency (if it matches timing requirements).
> > Depending on the requested frequency, use the spec data from either
> > Standard, Fast or Fast Plus mode.
> >
> > Hardcoding of min/max bus frequencies is removed and is instead computed.
> >
> > The driver do not use anymore speed identifier but instead handle
> > directly the frequency and figure out the spec data (necessary
> > for the computation of the timing register) based on the frequency.
> 
> ...
> 
> > +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(i2c_specs); i++)
> > +               if (rate <= i2c_specs[i].rate)
> > +                       return &i2c_specs[i];
> > +
> 
> > +       /* NOT REACHED */
> > +       return ERR_PTR(-EINVAL);
> 
> WARN_ONCE() ?

The comment should actually be removed. get_specs return value is
properly checked in stm32f7_i2c_compute_timing and an error message
is displayed in case of an error.

> 
> > +}
> 
> ...
> 
> > -                       if ((tscl_l < i2c_specs[setup->speed].l_min) ||
> > +                       if ((tscl_l < specs->l_min) ||
> 
> >                             (i2cclk >=
> >                              ((tscl_l - af_delay_min - dnf_delay) / 4))) {
> 
> Perhaps squash above two to one line at the same time?

I agree that this is not very pretty to read now but that would lead to
a line exceeding 80 characters. To fix that it'd be better to rework the code
but in such case that should be done at a separate time to keep this commit
as small / simpler to understand as possible. So I'd prefer leave this code
for the time being.

> 
> ...
> 
> > +       int i;
> > +
> > +       for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)
> 
> 
> Perhaps
> 
>        int i = ARRAY_SIZE(i2c_specs);
> 
>        while(i--)
> 
> ?

I propose the following code to make it a bit easier to read/understand:

static u32 get_lower_rate(u32 rate)
{
        int i = ARRAY_SIZE(i2c_specs);

        while (i--)
                if (i2c_specs[i].rate < rate)
                        break;

        return i2c_specs[i].rate;
}

If you agree with that I'll push a v2.

> 
> > +               if (i2c_specs[i].rate < rate)
> > +                       return i2c_specs[i].rate;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
