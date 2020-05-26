Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7A61E1F91
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 12:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbgEZKXX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 06:23:23 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:22910 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726944AbgEZKXW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 06:23:22 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04QALs08009674;
        Tue, 26 May 2020 12:23:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=p3D8tRzx5yi3dtudAYjOJKQoizPNsipgyxf+bvB/VrM=;
 b=OyLNlCe1CWQeq2gKXTCrGyYEX9CZYQP6JsUgiRs9gGBKD2v2mCcnxRx4grsbzE1p50KE
 jRozQrfLn0LDTOrO2vLJJnPBgLm8vLQE6RrIZRTUHW8pIAxdIGHqbhuOGWk12V3c3uGW
 gjizCURYNy6w8wc7OEcgVrnt217nPDapCs2+nDf+nld2qBGCwJ7/EFwzAomPOdUNSMDP
 rOTfRAoKZr5qd+TLx4kU/p8J1JYYole3YKqbPPRQ2HWO7oxE96ath2dCZwb5cXG+LOJm
 KjV3X+/ERIB02bwxj9RbdAEy31XO1uf7lODvHcWLpWw6xex1vM/6He4MV0Y3YqDEfTB+ dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 316sa1y741-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 May 2020 12:23:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52FDB10002A;
        Tue, 26 May 2020 12:23:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2213C21BDB7;
        Tue, 26 May 2020 12:23:07 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 26 May
 2020 12:23:06 +0200
Date:   Tue, 26 May 2020 12:23:01 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/4] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200526102301.GA14423@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-2-git-send-email-alain.volmat@st.com>
 <20200523104624.GB3459@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200523104624.GB3459@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-05-26_01:2020-05-26,2020-05-26 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 23, 2020 at 10:46:25AM +0000, Wolfram Sang wrote:
> 
> Adding Benjamin who mainly implemented this.
> 
> On Tue, May 05, 2020 at 07:51:08AM +0200, Alain Volmat wrote:
> > SMBus Host-Notify protocol, from the adapter point of view
> > consist of receiving a message from a client, including the
> > client address and some other data.
> > 
> > It can be simply handled by creating a new slave device
> > and registering a callback performing the parsing of the
> > message received from the client.
> > 
> > This commit introduces two new core functions
> >   * i2c_new_smbus_host_notify_device
> >   * i2c_free_smbus_host_notify_device
> > that take care of registration of the new slave device and
> > callback and will call i2c_handle_smbus_host_notify once a
> > Host-Notify event is received.
> 
> Yay, cool idea to use the slave interface. I like it a lot!
> 
> > +static int i2c_smbus_host_notify_cb(struct i2c_client *client,
> > +				    enum i2c_slave_event event, u8 *val)
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
> > +		 * since there is currently no way to retrieve the data
> > +		 * parameter from the client.
> 
> Maybe s/no way/no support/ ? I still wonder if we couldn't add it
> somehow. Once we find a device which needs this, of course.

Indeed. Such support can be added later on once such device is found. For the
time being I will state "no support"

> 
> > +		 */
> > +		if (!status->notify_start)
> > +			break;
> > +		status->addr = *val;
> > +		status->notify_start = false;
> > +		break;
> > +	case I2C_SLAVE_STOP:
> 
> What about setting 'notify_start' to false here as well? In the case of
> an incomplete write?

Ok. I will check that notify_start is false before calling host_notify
(since otherwise it will call i2c_handle_smbus_host_notify with a bad addr
value) and reset notify_start to false if it is still true.

> 
> > +		ret = i2c_handle_smbus_host_notify(client->adapter,
> > +						   status->addr);
> > +		if (ret < 0) {
> > +			dev_warn(&client->adapter->dev, "failed to handle host_notify (%d)\n",
> > +				ret);
> 
> I think we should rather add such error strings to the core if we think
> they are needed. I am not convinced they are, though.

Agreed, this error can be removed.

> 
> > +			return ret;
> > +		}
> > +		break;
> > +	default:
> > +		/* Only handle necessary events */
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> 
> Rest of the code looks good. Maybe we should compile all this only when
> I2C_SLAVE is enabled?
> 

Yes, I will enclose that around I2C_SLAVE support check.


