Return-Path: <linux-i2c+bounces-13999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D591C3C278
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 16:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826F23B7A9D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 15:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F5132AAAF;
	Thu,  6 Nov 2025 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h1DmG993"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE0308F1D;
	Thu,  6 Nov 2025 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443651; cv=none; b=BT0JCJd0HViTNchG/I723FrZ7A2SsL6PePv3qtoFO6AQ9pUO/qHfFifnpYOpH6k3ZIoNY8VHidWLImO9Kkb4QsJukLKWGvXB65fAe7zGKE+IbPBSUc/MvRY0/4skKASC2tl6ygfR1yJFRV7OlCybXbTX+cR73ePQZyqt9rI/vs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443651; c=relaxed/simple;
	bh=nB8ihh8drVNc7jO6z5A16olh0Vuvr2Vz6ehNqJSTkdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=onV6Gm+zTNc4LceUdyg4zZ0t9DN++KqymVW16gnxHBLfGTljATlflmm7weSTBqkjG3ZVieln9GcaQRx0tI23cmKhrs7RwGgKqeN34E2DiIeWFDEV/7ZIgn98cAFexkNr3vGE4uifS0qlCdo+R3TdIBCc9qDUP9oTDbcrwrm+UOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h1DmG993; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 260841A18D4;
	Thu,  6 Nov 2025 15:40:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC1C26068C;
	Thu,  6 Nov 2025 15:40:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 203D9102F2297;
	Thu,  6 Nov 2025 16:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762443646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zTpK1778ZPo0Zk1DH+IDXFuxbwb9kJMouXvCPWR5ZLc=;
	b=h1DmG9933broA7Ryh6sUIlcQfMGsC5AMkucLe4vzFliajP4VR/8eA9dyR/oom0t9NmufoD
	dNINLKVE6EUvqV9xhYonVQu1bVQOEzoJJTlMRkE3wzG+izuoyet4ZLMGwf3Tlp5eLxKCjx
	L6GZ9gD+cw6L8y4wT+2Dgb1JPaRBMmK/ZUtgHF0AExEpWjifZeoJWdapiumboBuAc21sMT
	ULK9ZojkEAlGaHjGC+FcSAibdLw2ldvaVi+6OyAiT4XE04H2LEZRYHrcUfu3nbaibslc68
	eYztXvvDRhQai4ue1InuYjN4V1VtwMBbglRdUO0JpvAmycmtveHPKBuLytCW3Q==
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
Subject:
 Re: [PATCH v2 5/5] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Date: Thu, 06 Nov 2025 16:40:40 +0100
Message-ID: <2047821.56niFO833r@benoit.monin>
In-Reply-To: <20251103104330.GG2912318@black.igk.intel.com>
References:
 <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-5-90416874fcc0@bootlin.com>
 <20251103104330.GG2912318@black.igk.intel.com>
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

On Monday, 3 November 2025 at 11:43:30 CET, Mika Westerberg wrote:
> On Fri, Oct 31, 2025 at 03:35:43PM +0100, Beno=C3=AEt Monin wrote:
[...]
> > +/*
> > + * Return true if the message needs an explicit RESTART before being s=
ent.
> > + * Without an explicit RESTART, two consecutive messages in the same d=
irection
> > + * will be merged into a single transfer.
> > + * The adapter always emits a RESTART when the direction changes.
> > + */
> > +static inline bool i2c_dw_msg_need_restart(struct i2c_msg msgs[], int =
idx)
>=20
> This can take const parameters.
>=20
Agreed.

> > +{
>=20
> Please move the dev->flags & NO_EMPTYFIFO_HOLD_MASTER here too.
>=20
Agreed.

> > +	/* No need for a RESTART on the first message */
> > +	if (idx =3D=3D 0)
> > +		return false;
>=20
> That's
>=20
> 	if (!idx)=20
>=20
Ack.

> But why not pass the actual message instead of the index?
>=20
Because we need the direction of the previous message and if we are checking
the first message. Passing the array of messages and the index of the
message to check give us the info we need to perform the check.

> > +
> > +	return (msgs[idx - 1].flags & I2C_M_RD) =3D=3D (msgs[idx].flags & I2C=
_M_RD);
>=20
> You don't need the outer parens.
>=20
> > +}
> > +
> >  static int
> >  i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> >  {
> > @@ -918,6 +958,17 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_m=
sg msgs[], int num)
> >  				goto done;
> >  			}
> > =20
> > +			/*
> > +			 * Make sure we don't need explicit RESTART for
> > +			 * controllers that cannot emit them.
> > +			 */
> > +			if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> > +			    i2c_dw_msg_need_restart(msg, cnt - 1)) {
> > +				dev_err(dev->dev, "cannot emit RESTART\n");
> > +				ret =3D -EINVAL;
> > +				goto done;
> > +			}
> > +
> >  			if ((msg[cnt - 1].flags & I2C_M_STOP) ||
> >  			    (msg + cnt =3D=3D msgs + num))
> >  				break;
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/=
busses/i2c-designware-platdrv.c
> > index d7d764f7554d..4aad3dc51fbc 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -346,6 +346,7 @@ static void dw_i2c_plat_remove(struct platform_devi=
ce *pdev)
> > =20
> >  static const struct of_device_id dw_i2c_of_match[] =3D {
> >  	{ .compatible =3D "baikal,bt1-sys-i2c", .data =3D (void *)MODEL_BAIKA=
L_BT1 },
> > +	{ .compatible =3D "mobileye,eyeq6lplus-i2c", .data =3D (void *)NO_EMP=
TYFIFO_HOLD_MASTER },
> >  	{ .compatible =3D "mscc,ocelot-i2c", .data =3D (void *)MODEL_MSCC_OCE=
LOT },
> >  	{ .compatible =3D "snps,designware-i2c" },
> >  	{}
> >=20
>=20


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




