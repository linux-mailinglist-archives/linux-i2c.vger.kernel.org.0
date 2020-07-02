Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9095F212220
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 13:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgGBLX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 07:23:27 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:30974 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728009AbgGBLX0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 07:23:26 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 062BG4IJ003106;
        Thu, 2 Jul 2020 13:23:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=5WRolsP7RiTQVKYQWxXnd4r13bZrvjWmpEgS8eL44Vo=;
 b=tK4jwZSoCzqQvFoTTJc/3BLffPTvaB6X2vqCxqU71etrfo3J3A2ZSnsgdX+Fi8F15yzP
 7x8RQDer+5OQrNS30yHcOjEEuqExVvYsoDcdYjuk0iS4gFDomdakmL/bT8eokV95ze2f
 NW8tMbSonOUUqCG6ybcXoRCgaJO1NdtcUhjY+2WrHG1l0mrhqRf8onRqTLzXNo+8ICwJ
 THtV4lEfmN0Tujg28nNYIkoJgS9FfBcZqYP0BVQMjM0epfycULeqRIAGiAsq4YgUY/Ti
 srMoj3Bn92Wt04cY1yBX2370pLrB8GxsjGjJOrhxNj6wVl14hF5pA5Bl9VCYrVeDmrQg dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1qqj0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jul 2020 13:23:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D295C10002A;
        Thu,  2 Jul 2020 13:23:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B88812AFEEF;
        Thu,  2 Jul 2020 13:23:14 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 13:23:13 +0200
Date:   Thu, 2 Jul 2020 13:23:13 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 1/4] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200702112313.GE6855@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
 <1593070769-9106-2-git-send-email-alain.volmat@st.com>
 <20200701104946.GH2261@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200701104946.GH2261@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-02_05:2020-07-02,2020-07-02 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Okay, now I got it to work, I also noted a few more issues.
> 
> First, I'd suggest s/i2c_smbus_host_notify/i2c_slave_host_notify/g for
> all occurences in this patch. This makes a stronger distinction between
> the generic HostNotify support and the slave specific one.

Ok with that.

> Also, I wonder if this shouldn't go to i2c-smbus.c instead but I haven't
> checked if we end up in dependency hell then. Second best thought: at
> least move to i2c-core-slave.c, then we could save the #ifdeffery in the
> c-file?

I have actually difficulties to understand clearly what should go within
i2c-smbus.c vs i2c-core-smbus or i2c-core-slave. My feeling is that
i2c-core-slave is more about the registering of a slave rather than one usage
of the slave mechanism. Hence I am not sure those functions/cb belong there.
But at the same time, I don't know about i2c-smbus vs i2c-core-smbus. I putted
it within i2c-core-smbus considering that the creation of the alert device
is also done there.

....

> > +{
> > +	struct i2c_smbus_host_notify_status *status = client->dev.platform_data;
> > +	int ret;
> > +
> > +	switch (event) {
> > +	case I2C_SLAVE_WRITE_REQUESTED:
> > +		status->notify_start = true;
> > +		break;
> > +	case I2C_SLAVE_WRITE_RECEIVED:
> > +		/* We only retrieve the first byte received (addr)
> > +		 * since there is currently no support to retrieve the data
> > +		 * parameter from the client.
> > +		 */
> > +		if (!status->notify_start)
> > +			break;
> > +		status->addr = *val;
> > +		status->notify_start = false;
> 
> So, we are safe if the message is too short. Otherwise, we capture the
> first byte (== address) only, right. Further bytes until STOP are
> discarded. So, we don't check if the message is too long and contains
> more than the status word. Maybe we should add that?

Yes I modified that.

> > +		break;
> > +	case I2C_SLAVE_STOP:
> > +		/* In case of incomplete write, don't handle host-notify */
> > +		if (status->notify_start) {
> > +			status->notify_start = false;
> > +			break;
> > +		}
> > +
> > +		ret = i2c_handle_smbus_host_notify(client->adapter,
> > +						   status->addr);
> > +		if (ret < 0)
> > +			return ret;
> > +		break;
> > +	default:
> 
> The missing cases are mandatory. From my testunit driver:
> 
>         case I2C_SLAVE_READ_REQUESTED:
>         case I2C_SLAVE_READ_PROCESSED:
>                 *val = 0xff;
>                 break;

Ok, done as well.

> > --- a/include/linux/i2c-smbus.h
> > +++ b/include/linux/i2c-smbus.h
> > @@ -38,6 +38,8 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
> >  	return 0;
> >  }
> >  #endif
> > +struct i2c_client *i2c_new_smbus_host_notify_device(struct i2c_adapter *adapter);
> > +void i2c_free_smbus_host_notify_device(struct i2c_client *client);
> 
> Those need to be guarded with I2C_SLAVE as well. And an #else branch
> with empty/successful placeholders.

Ok understood.
