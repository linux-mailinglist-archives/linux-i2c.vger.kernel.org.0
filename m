Return-Path: <linux-i2c+bounces-13997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11AC3BD31
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 15:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182371B22DC2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 14:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2A1345CBD;
	Thu,  6 Nov 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rsr7hQgo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7267F34575F;
	Thu,  6 Nov 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439920; cv=none; b=F+9JsWylMLkrXBhdkqVe6oprsRgQhLqxsxoKDn7sGVUAoXny9eBBrUEz1wztmbwwVnDjySDy/Q+DHqfs31ocZTPs8mablNOhV+Y8eFJMaclZkivQ+UtZssRJdYq3mSsjTFDgHUESpbTIlzdm3skTOTI9Q6uEnUPZfddoc2RSaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439920; c=relaxed/simple;
	bh=q7204u9xGerR5T6o7MflCkRGjkrE/ExGBpFq/w0M0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cchlWINOjC+5E3NoZa3XIbA8tfY9KGBK9Y8RijlE4WF+ZeAL1WHjrKCUXODW+uYeyuF7Z7Dk+DstD8uWkrhM5VCbOY47Y2hC+6Fo3UgynEe/Dmw5TxvYxDYGKyqHkQeXEABGv11tcWSfytFeeLWC3slnmeIAz3lKWK5iEOPdGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rsr7hQgo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC2291A18DD;
	Thu,  6 Nov 2025 14:38:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A49B16068C;
	Thu,  6 Nov 2025 14:38:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00936118511BB;
	Thu,  6 Nov 2025 15:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762439914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fWgLP/+jNAEzz83WSqxCu50kV6UsAyj/lIJuwbQgNhI=;
	b=rsr7hQgoy+QCd+/XjhxlrShMdRs9dl8f0dY/tePOA5BSF2b36azRV+t2mIFutGpkLSjROX
	L1ImsXK4AADEEszy37m1joXPl5HbK3/8hj0XyK0WhV7tZ5vmis6YSXYFcOAb5/TKluPKzc
	wnsMUFOE20y/Gu27C1h87Q6DiaWelNeaNSPvLMqNJaKv3hQ16UZmryKiM7k6CBUk65JSA3
	UauTEnGWJCXM2TdXVIs9WLcs1w5C2ML+3VmHtiyydqFbFZP0Ro+DGtybbtFTzOyDE5Fg38
	YmAKMEva+73/yZhOcqrAjw/CyKU3x5ITFmxdY/IxvKi49krNnJvEto/DuivEdQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 4/5] i2c: designware: Implement I2C_M_STOP support
Date: Thu, 06 Nov 2025 15:38:29 +0100
Message-ID: <5791158.IbC2pHGDlb@benoit.monin>
In-Reply-To: <20251103103908.GF2912318@black.igk.intel.com>
References:
 <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-4-90416874fcc0@bootlin.com>
 <20251103103908.GF2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Mika,

On Monday, 3 November 2025 at 11:39:08 CET, Mika Westerberg wrote:
> On Fri, Oct 31, 2025 at 03:35:42PM +0100, Beno=C3=AEt Monin wrote:
> > Add the support of the I2C_M_STOP flag in i2c_msg by splitting
> > i2c_dw_xfer() in two: __i2c_dw_xfer_unlocked() for the core transfer lo=
gic
> > and i2c_dw_xfer() for handling the high-level transaction management.
> >=20
> > In detail __i2c_dw_xfer_unlocked() starts a transaction and wait for its
> > completion, either with a STOP on the bus or an error. i2c_dw_xfer()
> > loops over the messages to search for the I2C_M_STOP flag and calls
> > __i2c_dw_xfer_unlocked() for each part of the messages up to a STOP or
> > the end of the messages array.
> >=20
> > i2c_dw_xfer() holds the device lock while calling __i2c_dw_xfer_unlocke=
d(),
> > this allows to group multiple accesses to device that support a STOP in
> > a transaction when done via i2c_dev I2C_RDWR ioctl, in a single-master
> > configuration.
> >=20
> > Also, now that we have a lookup of the messages in i2c_dw_xfer() prior
> > to each transaction, we use it to make sure the messages are valid for
> > the transaction. We check that the target address does not change before
> > starting the transaction instead of aborting the transfer while it is
> > happening, as it was done in i2c_dw_xfer_msg(). The target address can
> > only be changed after an I2C_M_STOP flag, thus a STOP on the i2c bus.
> >=20
> > The I2C_FUNC_PROTOCOL_MANGLING flag is added to the list of
> > functionalities supported by the adapter, except for the AMD NAVI i2c
>=20
> I2C controller
>=20
> > controller which uses its own xfer() function and is left untouched.
> >=20
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
> >  drivers/i2c/busses/i2c-designware-master.c | 103 ++++++++++++++++++++-=
=2D-------
> >  1 file changed, 70 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/b=
usses/i2c-designware-master.c
> > index ec4fc2708d03..da1963d25def 100644
> > --- a/drivers/i2c/busses/i2c-designware-master.c
> > +++ b/drivers/i2c/busses/i2c-designware-master.c
> > @@ -431,7 +431,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
> >  	struct i2c_msg *msgs =3D dev->msgs;
> >  	u32 intr_mask;
> >  	int tx_limit, rx_limit;
> > -	u32 addr =3D msgs[dev->msg_write_idx].addr;
> >  	u32 buf_len =3D dev->tx_buf_len;
> >  	u8 *buf =3D dev->tx_buf;
> >  	bool need_restart =3D false;
> > @@ -442,18 +441,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
> >  	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
> >  		u32 flags =3D msgs[dev->msg_write_idx].flags;
> > =20
> > -		/*
> > -		 * If target address has changed, we need to
> > -		 * reprogram the target address in the I2C
> > -		 * adapter when we are done with this transfer.
> > -		 */
> > -		if (msgs[dev->msg_write_idx].addr !=3D addr) {
> > -			dev_err(dev->dev,
> > -				"%s: invalid target address\n", __func__);
> > -			dev->msg_err =3D -EINVAL;
> > -			break;
> > -		}
> > -
> >  		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
> >  			/* new i2c_msg */
> >  			buf =3D msgs[dev->msg_write_idx].buf;
> > @@ -801,26 +788,15 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev=
 *dev)
> >  }
> > =20
> >  /*
> > - * Prepare controller for a transaction and call i2c_dw_xfer_msg.
> > + * Prepare controller for a transaction, start the transfer of the msgs
> > + * and wait for completion.
> > + * Caller must hold the device lock.
> >   */
> >  static int
> > -i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> > +__i2c_dw_xfer_unlocked(struct dw_i2c_dev *dev, struct i2c_msg msgs[], =
int num)
> >  {
> > -	struct dw_i2c_dev *dev =3D i2c_get_adapdata(adap);
> >  	int ret;
> > =20
> > -	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
> > -
> > -	pm_runtime_get_sync(dev->dev);
> > -
> > -	switch (dev->flags & MODEL_MASK) {
> > -	case MODEL_AMD_NAVI_GPU:
> > -		ret =3D amd_i2c_dw_xfer_quirk(adap, msgs, num);
> > -		goto done_nolock;
> > -	default:
> > -		break;
> > -	}
> > -
> >  	reinit_completion(&dev->cmd_complete);
> >  	dev->msgs =3D msgs;
> >  	dev->msgs_num =3D num;
> > @@ -832,10 +808,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_m=
sg msgs[], int num)
> >  	dev->abort_source =3D 0;
> >  	dev->rx_outstanding =3D 0;
> > =20
> > -	ret =3D i2c_dw_acquire_lock(dev);
> > -	if (ret)
> > -		goto done_nolock;
> > -
> >  	ret =3D i2c_dw_wait_bus_not_busy(dev);
> >  	if (ret < 0)
> >  		goto done;
> > @@ -896,13 +868,75 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_=
msg msgs[], int num)
> > =20
> >  	ret =3D -EIO;
> > =20
> > +done:
> > +	return ret;
> > +}
> > +
> > +static int
> > +i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>=20
> Typically if you have
>=20
> i2c_dw_xfer()
> i2c_dw_xfer_unlocked()
>=20
> The only difference is that the former call the latter with lock held.
> However, this is not the case here which is confusing.
>=20
> I suggest move the lookup to be part of the _unlocked() variant.
>=20
> While there, can we use size_t with the num parameter.
>=20
Maybe __i2c_dw_xfer_unlocked() is the wrong name, as it is meant to be
called potentially multiple times from i2c_dw_xfer(), depending on the
number of messages flagged with I2C_M_STOP. So it is not an unlocked
version of i2c_dw_xfer(). I'll try to find a better name.

> > +{
> > +	struct dw_i2c_dev *dev =3D i2c_get_adapdata(adap);
> > +	struct i2c_msg *msg;
> > +	int ret, cnt;
> > +
> > +	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
> > +
> > +	pm_runtime_get_sync(dev->dev);
> > +
> > +	switch (dev->flags & MODEL_MASK) {
> > +	case MODEL_AMD_NAVI_GPU:
> > +		ret =3D amd_i2c_dw_xfer_quirk(adap, msgs, num);
> > +		goto done_nolock;
>=20
> Not really problem of this patch but I'm sure there is cleaner way to deal
> with this. I mean first of all we don't wan't to differentiate here what
> model this is. Instead we can look for a "quirks" based on dev->flags.
>=20
> Secondly goto inside switch is confusing too.
>=20
> This can be better written like:
>=20
> if ((dev->flags & MODEL_MASK) =3D=3D MODEL_AMD_NAVI_GPU) {
> 	...
> }
>=20
If we also add the ACQUIRE() for pm_runtime suggested by Andy to
amd_i2c_dw_xfer_quirk(), we could then create a struct i2c_algorithm
dedicated to this hardware and set it in i2c_dw_probe_master(). This way
we can skip all this code, no need to check the model for every transfer.

> > +	default:
> > +		break;
> > +	}
> > +
> > +	ret =3D i2c_dw_acquire_lock(dev);
> > +	if (ret)
> > +		goto done_nolock;
> > +
> > +	/*
> > +	 * If the I2C_M_STOP is present in some the messages,
> > +	 * we do one transaction for each part up to the STOP.
> > +	 */
> > +	for (msg =3D msgs; msg < msgs + num; msg +=3D cnt) {
> > +		u16 addr =3D msg->addr;
> > +
> > +		/*
> > +		 * Count the messages in a transaction, up to a STOP
> > +		 * or the end of the msgs.
> > +		 */
> > +		for (cnt =3D 1; ; cnt++) {
> > +			/*
> > +			 * We cannot change the target address during
> > +			 * a transaction, so make sure the address stays
> > +			 * the same.
> > +			 */
> > +			if (msg[cnt - 1].addr !=3D addr) {
> > +				dev_err(dev->dev, "invalid target address\n");
> > +				ret =3D -EINVAL;
> > +				goto done;
> > +			}
> > +
> > +			if ((msg[cnt - 1].flags & I2C_M_STOP) ||
> > +			    (msg + cnt =3D=3D msgs + num))
> > +				break;
> > +		}
> > +
> > +		ret =3D __i2c_dw_xfer_unlocked(dev, msg, cnt);
> > +		if (ret < 0)
> > +			goto done;
>=20
> This can be
>=20
> 	break;
>=20
> > +	}
> > +
> >  done:
> >  	i2c_dw_release_lock(dev);
> > =20
> >  done_nolock:
> >  	pm_runtime_put_autosuspend(dev->dev);
> > =20
> > -	return ret;
> > +	if (ret < 0)
> > +		return ret;
> > +	return num;
> >  }
> > =20
> >  static const struct i2c_algorithm i2c_dw_algo =3D {
> > @@ -920,6 +954,9 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
> > =20
> >  	dev->functionality =3D I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONAL=
ITY;
> > =20
> > +	if ((dev->flags & MODEL_MASK) !=3D MODEL_AMD_NAVI_GPU)
> > +		dev->functionality |=3D I2C_FUNC_PROTOCOL_MANGLING;
> > +
> >  	dev->master_cfg =3D DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
> >  			  DW_IC_CON_RESTART_EN;
> > =20
> >=20
>=20


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




