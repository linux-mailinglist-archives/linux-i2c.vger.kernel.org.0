Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A67B100002
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 09:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfKRIEw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 03:04:52 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47087 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfKRIEw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 03:04:52 -0500
Received: by mail-pf1-f196.google.com with SMTP id 193so9974114pfc.13;
        Mon, 18 Nov 2019 00:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mBaFuvSmfuzg6OcAjV0kd4lsPu24dwjhOtff7pPt818=;
        b=LmKrgC7BiQ+3tfCg3+wiQtBuG8EFPcGDsoT1d3CrOxbfNFTYzrd5sQkfN3oIxxjFTB
         IHq40MVq6anqRFp2ShA28YwBlirTrOdb4e+jm/Xgu4yLQdbQOhVKbKBZwwFlj8UQorY2
         S5hOOmzN5ivCIuz8HocDN4MAqKEM+5uqktwKVfwfkpo67HFz9VE9Tc/pvRmaQt2zVT8M
         Mf5nnqWlHJuoY3KkEUxYe+Lsirqq2qv10EauXbn0jwe9QAqsu4/b8kg3RePoeC5eriAb
         2oCs7Hhkw/o8rBXFsn/njrMxRIB68pCJ+ffk9awlx2e8k/hydEComnjVf5eAKfZmPWNU
         ou8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mBaFuvSmfuzg6OcAjV0kd4lsPu24dwjhOtff7pPt818=;
        b=A9lym6LOK4NUbs2GG3BpskAuY3ompgmggpggYasgEgHEIgAw63E2QCnwTPrARMjqjO
         ansm1XVzl1J19ZqjZrL8aBSXtutqvhYPm05wnF/uCF+FnwIIZI5D8Zixnkc9mOF84uQS
         UnqSKYpsCLERWp4jJxEJZTT122jSRS6I0c5zyWZL/OsOymY/CWKXY229YU7nBmEl/V0S
         bZN0JD5lIdBBV9JAKkoTpjr80dC9vvhXnU9uKI2hUsiNF4y6WrY0P7RfLZnweVo5uMJ/
         ukH/4Bxn6XG7lQMAuhtoTJ+h/+KUeupQzkroUECD/MPtUKOIDdD/Xe8+phcx38oWEgJr
         zcIA==
X-Gm-Message-State: APjAAAVx3I9pt1Uo42sr3O5ciBMyMlbjuNWYC7Y/5PVOUiCu4dgfDPTu
        VfNX7UFCNhdchafT9rQ9iUw=
X-Google-Smtp-Source: APXvYqwpuYPG15qYLuc6AEgyVFLYHGFLtK6Cj0tWJgWl3wtEuKNO8fZhogt+DpVZVM1yBsmPwdK1aQ==
X-Received: by 2002:a62:5b83:: with SMTP id p125mr32896258pfb.237.1574064289130;
        Mon, 18 Nov 2019 00:04:49 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r24sm21542795pgu.36.2019.11.18.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 00:04:48 -0800 (PST)
Date:   Mon, 18 Nov 2019 00:04:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.orgi,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i2c: use void pointers for supplying data for
 reads and writes
Message-ID: <20191118080446.GB251795@dtor-ws>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-2-dmitry.torokhov@gmail.com>
 <20191118074349.ags3c4tmvapguqcp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118074349.ags3c4tmvapguqcp@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Mon, Nov 18, 2019 at 08:43:49AM +0100, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Tue, Nov 12, 2019 at 12:31:30PM -0800, Dmitry Torokhov wrote:
> > There is no need to force users of i2c_master_send()/i2c_master_recv()
> > and other i2c read/write bulk data API to cast everything into u8 pointers.
> > While everything can be considered byte stream, the drivers are usually
> > work with more structured data.
> > 
> > Let's switch the APIs to accept [const] void pointers to cut amount of
> > casting needed.
> > 
> > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Can you give an example where you save some casts? Given that i2c is a
> byte oriented protocol (as opposed to for example spi) I think it's a
> good idea to expose this in the API.

I see this at least:

dtor@dtor-ws:~/kernel/work $ git grep "i2c_master.*(u8 \*)"
drivers/crypto/atmel-i2c.c:     ret = i2c_master_send(client, (u8 *)cmd, cmd->count + WORD_ADDR_SIZE);
drivers/iio/common/ms_sensors/ms_sensors_i2c.c:         ret = i2c_master_recv(client, (u8 *)&buf, 3);
drivers/iio/humidity/hdc100x.c: ret = i2c_master_recv(client, (u8 *)buf, 4);
drivers/iio/pressure/abp060mg.c:        ret = i2c_master_send(client, (u8 *)&buf, state->mreq_len);
drivers/iio/pressure/abp060mg.c:        ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
drivers/input/misc/ad714x-i2c.c:        error = i2c_master_send(client, (u8 *)chip->xfer_buf,
drivers/input/misc/ad714x-i2c.c:        error = i2c_master_send(client, (u8 *)chip->xfer_buf,
drivers/input/misc/ad714x-i2c.c:                error = i2c_master_recv(client, (u8 *)chip->xfer_buf,
drivers/input/touchscreen/sx8654.c:     len = i2c_master_recv(ts->client, (u8 *)data, readlen);
drivers/nfc/nfcmrvl/i2c.c:      ret = i2c_master_recv(drv_data->i2c, (u8 *)&nci_hdr, NCI_CTRL_HDR_SIZE);
drivers/nfc/nxp-nci/i2c.c:      r = i2c_master_recv(client, (u8 *) &header, NXP_NCI_FW_HDR_LEN);
drivers/nfc/nxp-nci/i2c.c:      r = i2c_master_recv(client, (u8 *) &header, NCI_CTRL_HDR_SIZE);
drivers/video/fbdev/ssd1307fb.c:        ret = i2c_master_send(client, (u8 *)array, len);

I am pretty sure there are more that my quick grep did not catch.

And I agree that I2C itself is a byte-oriented protocol, but the data from the
point of the driver (once transfer is done) is often more structured.

> 
> > diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> > index 5c2cc61b666e7..48ed76a0e83d4 100644
> > --- a/drivers/iio/adc/max1363.c
> > +++ b/drivers/iio/adc/max1363.c
> 
> This change isn't motivated in the commit log. Is this here by mistake?

No, it is needed as signature of i2c_master_send/recv has changed.

> 
> > @@ -182,9 +182,9 @@ struct max1363_state {
> >  	struct regulator		*vref;
> >  	u32				vref_uv;
> >  	int				(*send)(const struct i2c_client *client,
> > -						const char *buf, int count);
> > +						const void *buf, int count);
> >  	int				(*recv)(const struct i2c_client *client,
> > -						char *buf, int count);
> > +						void *buf, int count);
> >  };
> >  
> >  #define MAX1363_MODE_SINGLE(_num, _mask) {				\
> > @@ -310,27 +310,29 @@ static const struct max1363_mode
> >  	return NULL;
> >  }
> >  
> > -static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
> > +static int max1363_smbus_send(const struct i2c_client *client, const void *buf,
> >  		int count)
> >  {
> > +	const u8 *data = buf;
> >  	int i, err;
> >  
> >  	for (i = err = 0; err == 0 && i < count; ++i)
> > -		err = i2c_smbus_write_byte(client, buf[i]);
> > +		err = i2c_smbus_write_byte(client, data[i]);
> 
> Isn't this hunk an indicator that keeping char (or u8) as type of the
> members of buf is a good idea?

Not necessarily, if you check the driver sometimes it deals with stream of
bytes, and sometimes it sends structured data, like little-endian words. I
did not make additional changes because I wanted to minimize amount of changes
to this driver in this patch.


>  
> >  	return err ? err : count;
> >  }
> >  
> > -static int max1363_smbus_recv(const struct i2c_client *client, char *buf,
> > +static int max1363_smbus_recv(const struct i2c_client *client, void *buf,
> >  		int count)
> >  {
> > +	u8 *data = buf;
> >  	int i, ret;
> >  
> >  	for (i = 0; i < count; ++i) {
> >  		ret = i2c_smbus_read_byte(client);
> >  		if (ret < 0)
> >  			return ret;
> > -		buf[i] = ret;
> > +		data[i] = ret;
> >  	}
> >  
> >  	return count;
> 

Thanks.

-- 
Dmitry
