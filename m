Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FB51B0F1E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgDTPAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 11:00:48 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:2504 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726615AbgDTPAs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 11:00:48 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03KEwrKp027524;
        Mon, 20 Apr 2020 17:00:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=LFbHXDYgAgs4Hcvg9/e01AWVNn3apQsBjy+Cy3nDA1c=;
 b=lQQHFOMVMl7wYS2G9F1hLw0BI8eTx7z/+q3B3DFceEmfVXoYNKCRiGz/g/s7PYkAhuNq
 /Dv+nZY5so2PnL6/7aTWG6oxfcEEE8kPCtRe2SrwAKWkN66hWunDWk/yyI76EkTuQFcw
 Y8sACQw6lSJFXf8BCMP6/ERG57Bo59GOGXrHJZMe7oALD7p7K4CgSRUUa5l6W+G6cdZg
 3nCe5DZGqLokDoxzaMBIV6QNHgszki0ZtXt65SluBOoaYVzXveUgRfyMTvGm9vM7XaUt
 BJjvn/VjhAoiTPWDK5acwgfEH0HT6B0khFYHu29sxxdWoi3MTmLuVoi41iXH5ThwjcAt gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fqaw2vn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Apr 2020 17:00:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2EB610002A;
        Mon, 20 Apr 2020 17:00:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B52292AA282;
        Mon, 20 Apr 2020 17:00:34 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr
 2020 17:00:34 +0200
Date:   Mon, 20 Apr 2020 17:00:29 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 2/2] i2c: i2c-stm32f7: allows for any bus frequency
Message-ID: <20200420150029.GA6945@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-3-git-send-email-alain.volmat@st.com>
 <20200415110916.GO1141@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200415110916.GO1141@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-20_05:2020-04-20,2020-04-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Apr 15, 2020 at 01:09:16PM +0200, Wolfram Sang wrote:
> Hi Alain,
> 
> On Thu, Mar 26, 2020 at 01:44:21PM +0100, Alain Volmat wrote:
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
> Useful improvement!
> 
> > +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> 
> This is quite a generic namespace. Can we prefix stm32f7_<sth> here?

Done in v3

> 
> > +		if (rate <= i2c_specs[i].rate)
> > +			return &i2c_specs[i];
> 
> Same for i2c_specs here?

Done in v3

> 
> > +static u32 get_lower_rate(u32 rate)
> 
> Here, too.

Done in v3
> 
> Rest looks good to me.
> 
> Regards,
> 
>    Wolfram
> 

Regards,
Alain


