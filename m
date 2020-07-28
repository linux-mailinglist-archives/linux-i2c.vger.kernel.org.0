Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53BF323099F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgG1MLF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:11:05 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22622 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728560AbgG1MLE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:11:04 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SC7AiF024873;
        Tue, 28 Jul 2020 14:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=+5nB9GADXKPK20a1oCkaU1lxTo4GEfj7N0qwNz9LeR0=;
 b=uLfkoqS3YKeq+2Nk0wszWJ6lT2g8KkOQuJIoShT4SUoOZIYCt1iSTshVvw1WuZa0F2p6
 DgdkhsMwmLlXak1Hx0Lx5yAWheDaDBqv96a+ydlSeL+WHG4uAgGxiC8d7SLoco6DLvbu
 MS4sdN0BLFgxaVYk7Da4fepVj3nZw8OpGTLUj1GrW3SM2SPrGgNIQOhOA/e4df6Q30Nk
 jYSgR7FaaWof8y4KR3oW4vC1Avs4W4TenIftvCyetw5DZOoF6RsqbceFHHY17QU/QALI
 2YsXvAIz9PGE4xYjj9KFYQGPANUwovHNqWhW6+L+24luoP35yKYVpwP/sSwJXAxP/NHd Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32g9v9ebys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 14:10:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3840110002A;
        Tue, 28 Jul 2020 14:10:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 256E12C38AF;
        Tue, 28 Jul 2020 14:10:52 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 14:10:51 +0200
Date:   Tue, 28 Jul 2020 14:10:50 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200728121050.GC8715@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
 <20200725202733.GA946@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200725202733.GA946@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_07:2020-07-28,2020-07-28 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

I've taken your comments and prepared a new serie including them.
I'll wait for the conclusion regarding the bindings before pushing it.
I also have an additional patch ready in order to add again the SMBus Alert
support within the stm32f7 driver since it has been removed from the
current serie. Hopefully I can push it once binding is acked so that it
can get merged also in this cycle.

> > SMBus Host-Notify protocol, from the adapter point of view
> > consist of receiving a message from a client, including the
> > client address and some other data.
> > 
> > It can be simply handled by creating a new slave device
> > and registering a callback performing the parsing of the
> > message received from the client.
> > 
> > This commit introduces two new core functions
> >   * i2c_new_slave_host_notify_device
> >   * i2c_free_slave_host_notify_device
> > that take care of registration of the new slave device and
> > callback and will call i2c_handle_smbus_host_notify once a
> > Host-Notify event is received.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > ---
> >  v2: identical to v1
> > 
> >  drivers/i2c/i2c-core-smbus.c | 114 +++++++++++++++++++++++++++++++++++++++++++
> 
> I came to the conclusion that this code should be in i2c-smbus.c.
> Because it is SMBus only. I agree that the current code layout is
> confusing. I will try to move the whole host-notify support to i2c-smbus
> in the next cycle.
> 
> Yes, that means that one needs to select I2C_SMBUS in the config, too
> (unless you want to 'select' it with your driver). But most people won't
> need it so they can compile it away. This is what I2C_SMBUS is for.

Ok, code is now moved into i2c-smbus.c
In case of the stm32f7 anyway I2C_SMBUS was already selected hence there is no
impact.

> > +static int i2c_slave_host_notify_cb(struct i2c_client *client,
> > +				    enum i2c_slave_event event, u8 *val)
> > +{
> > +	struct i2c_slave_host_notify_status *status = client->dev.platform_data;
> > +	int ret;
> > +
> 
> Can't we simplify 'index' handling similar to the testunit driver...
> 
> > +	switch (event) {
> > +	case I2C_SLAVE_WRITE_REQUESTED:
> > +		status->index = 0;
> 
> ... by removing this line...
> 
> > +		break;
> > +	case I2C_SLAVE_WRITE_RECEIVED:
> > +		/* We only retrieve the first byte received (addr)
> > +		 * since there is currently no support to retrieve the data
> > +		 * parameter from the client.
> > +		 */
> > +		if (status->index == 0)
> > +			status->addr = *val;
> > +		if (status->index < U8_MAX)
> > +			status->index++;
> > +		break;
> > +	case I2C_SLAVE_STOP:
> > +		/* Handle host-notify if whole message received only */
> > +		if (status->index != SMBUS_HOST_NOTIFY_LEN) {
> > +			status->index = U8_MAX;
> > +			break;
> > +		}
> > +
> > +		ret = i2c_handle_smbus_host_notify(client->adapter,
> > +						   status->addr);
> > +		if (ret < 0)
> > +			return ret;
> > +		status->index = U8_MAX;
> 
> ... and handling the logic here like:
> 
> +		if (status->index == SMBUS_HOST_NOTIFY_LEN)
> +			i2c_handle_smbus_host_notify(client->adapter, status->addr);
> +		status->index = 0;
> 
> Note that I2C_SLAVE_STOP doesn't return a retval, so we don't need to check
> i2c_handle_smbus_host_notify().
> 
> > +		break;
> > +	case I2C_SLAVE_READ_REQUESTED:
> > +	case I2C_SLAVE_READ_PROCESSED:
> > +		*val = 0xff;
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * i2c_new_slave_host_notify_device - get a client for SMBus host-notify support
> > + * @adapter: the target adapter
> > + * Context: can sleep
> > + *
> > + * Setup handling of the SMBus host-notify protocol on a given I2C bus segment.
> > + *
> > + * Handling is done by creating a device and its callback and handling data
> > + * received via the SMBus host-notify address (0x8)
> > + *
> > + * This returns the client, which should be ultimately freed using
> > + * i2c_free_slave_host_notify_device(); or an ERRPTR to indicate an error.
> > + */
> > +struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
> > +{
> > +	struct i2c_board_info host_notify_board_info = {
> > +		I2C_BOARD_INFO("smbus_host_notify", 0x08),
> > +		.flags  = I2C_CLIENT_SLAVE,
> > +	};
> > +	struct i2c_slave_host_notify_status *status;
> > +	struct i2c_client *client;
> > +	int ret;
> > +
> > +	status = kzalloc(sizeof(struct i2c_slave_host_notify_status),
> > +			 GFP_KERNEL);
> > +	if (!status)
> > +		return ERR_PTR(-ENOMEM);
> > +	status->index = U8_MAX;
> 
> This line could go, too, if my simplification above works.

I've simplified the index handling as you suggested. The only impact is that
finally we do not consider anymore the I2C_SLAVE_WRITE_REQUESTED event as the
beginning of the transaction since we don't perform the "reset" of the
handling upon this event.

> > +void i2c_free_slave_host_notify_device(struct i2c_client *client)
> > +{
> > +	i2c_slave_unregister(client);
> > +	kfree(client->dev.platform_data);
> > +	i2c_unregister_device(client);
> > +}
> > +EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
> 
> Sidenote: With my recent series "i2c: slave: improve sanity checks when
> un-/registering" this code became NULL-safe (and IS_ERR safe, too).

Sanity test on client added at the beginning of i2c_free_slave_host_notify_device
in order to ensure that we do not dereference a null pointer.

> > +static inline struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
> > +{
> > +	return NULL;
> 
> return ERR_PTR(-ENOSYS);
> 
> As the docs say, this function either returns a valid client or an
> ERR_PTR.

Done.

> 
> > +}
> > +static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
> > +{
> > +}
> > +#endif
> >  
> >  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
> >  void i2c_register_spd(struct i2c_adapter *adap);
> > -- 
> > 2.7.4
> > 


