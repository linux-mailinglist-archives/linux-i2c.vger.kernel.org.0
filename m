Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89970100088
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 09:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfKRIiQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 03:38:16 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58309 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfKRIiQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 03:38:16 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWcY0-0003Ko-Ui; Mon, 18 Nov 2019 09:38:12 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWcXz-0000uQ-3O; Mon, 18 Nov 2019 09:38:11 +0100
Date:   Mon, 18 Nov 2019 09:38:10 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: Re: [PATCH v3 1/3] i2c: use void pointers for supplying data for
 reads and writes
Message-ID: <20191118083810.467iry6w4kt3s7kd@pengutronix.de>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-2-dmitry.torokhov@gmail.com>
 <20191118074349.ags3c4tmvapguqcp@pengutronix.de>
 <20191118080446.GB251795@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118080446.GB251795@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Fixing the address of the linux-iio list]

Hello Dmitry,

On Mon, Nov 18, 2019 at 12:04:46AM -0800, Dmitry Torokhov wrote:
> On Mon, Nov 18, 2019 at 08:43:49AM +0100, Uwe Kleine-König wrote:
> > On Tue, Nov 12, 2019 at 12:31:30PM -0800, Dmitry Torokhov wrote:
> > > There is no need to force users of i2c_master_send()/i2c_master_recv()
> > > and other i2c read/write bulk data API to cast everything into u8 pointers.
> > > While everything can be considered byte stream, the drivers are usually
> > > work with more structured data.
> > > 
> > > Let's switch the APIs to accept [const] void pointers to cut amount of
> > > casting needed.
> > > 
> > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Can you give an example where you save some casts? Given that i2c is a
> > byte oriented protocol (as opposed to for example spi) I think it's a
> > good idea to expose this in the API.
> 
> I see this at least:
> 
> dtor@dtor-ws:~/kernel/work $ git grep "i2c_master.*(u8 \*)"
> drivers/crypto/atmel-i2c.c:     ret = i2c_master_send(client, (u8 *)cmd, cmd->count + WORD_ADDR_SIZE);
> drivers/iio/common/ms_sensors/ms_sensors_i2c.c:         ret = i2c_master_recv(client, (u8 *)&buf, 3);
> drivers/iio/humidity/hdc100x.c: ret = i2c_master_recv(client, (u8 *)buf, 4);

I think this one has an endianness bug.

> drivers/iio/pressure/abp060mg.c:        ret = i2c_master_send(client, (u8 *)&buf, state->mreq_len);

From a quick look: mreq_len might be 1 in some cases and buf is declared
as __be16[2]. Hmm.

> drivers/iio/pressure/abp060mg.c:        ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
> drivers/input/misc/ad714x-i2c.c:        error = i2c_master_send(client, (u8 *)chip->xfer_buf,
> drivers/input/misc/ad714x-i2c.c:        error = i2c_master_send(client, (u8 *)chip->xfer_buf,
> drivers/input/misc/ad714x-i2c.c:                error = i2c_master_recv(client, (u8 *)chip->xfer_buf,
> drivers/input/touchscreen/sx8654.c:     len = i2c_master_recv(ts->client, (u8 *)data, readlen);
> drivers/nfc/nfcmrvl/i2c.c:      ret = i2c_master_recv(drv_data->i2c, (u8 *)&nci_hdr, NCI_CTRL_HDR_SIZE);
> drivers/nfc/nxp-nci/i2c.c:      r = i2c_master_recv(client, (u8 *) &header, NXP_NCI_FW_HDR_LEN);
> drivers/nfc/nxp-nci/i2c.c:      r = i2c_master_recv(client, (u8 *) &header, NCI_CTRL_HDR_SIZE);
> drivers/video/fbdev/ssd1307fb.c:        ret = i2c_master_send(client, (u8 *)array, len);
> 
> I am pretty sure there are more that my quick grep did not catch.
> 
> And I agree that I2C itself is a byte-oriented protocol, but the data from the
> point of the driver (once transfer is done) is often more structured.

I think it is fine to require from a caller that they are aware that a
byte (or byte array) must be passed to i2c functions. Given the (maybe)
two problems I pointed out above making it a bit harder to pass non-byte
data to these functions doesn't sound like a bad idea to me.

Obviously your mileage varies, but I personally like having an explicit
type in the API. I guess we have to agree to not agree and let Wolfram
decide if he likes your change or not.

> > > diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> > > index 5c2cc61b666e7..48ed76a0e83d4 100644
> > > --- a/drivers/iio/adc/max1363.c
> > > +++ b/drivers/iio/adc/max1363.c
> > 
> > This change isn't motivated in the commit log. Is this here by mistake?
> 
> No, it is needed as signature of i2c_master_send/recv has changed.

Ah, I see, there is

	st->send = i2c_master_send;

in the code. I think this is worth mentioning in the commit log that it
changes to this file don't look like a mistake as I wondered.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
