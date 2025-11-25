Return-Path: <linux-i2c+bounces-14260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B14C848BE
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 11:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9E7D4E919F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EE8313527;
	Tue, 25 Nov 2025 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fztj7ZXc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618763128BD;
	Tue, 25 Nov 2025 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067548; cv=none; b=k0lHtJEsIL2A2SX6zezmv6uqKuGsiGEs3QmnIFIfBkshG4WvNIpqz9sBITTqu/lJmmugENsXQB2x3xLVjMC4RSMBT/o3AcWKGzi/v65I+go+mMgEnB1vLh+JUch67QQ7Sh8QoL+THNhzpyDvrscTaDwOYgolRJ7aOaCAPy1L9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067548; c=relaxed/simple;
	bh=QR44RW1qxqI3DDLLwJK9jBej+inSyT/M3PUxvFe+9yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AqOrYBfY/PwW5cYXLvK+Dl98p4lD1p9zObOPnmxRuvERex0YwD4Gi4q/iuwPVO9W1Oaqlkbype9N28mR2EEYiPAZ8xPVF/ptNQE3A4efmrorOeRh/CHuL3QJ3t5jPYsvbPehhpWCH+oX89gXK3/cMhu3H4L8SmIDkaRQaDjNZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fztj7ZXc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 424FA4E418BE;
	Tue, 25 Nov 2025 10:45:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14259606A1;
	Tue, 25 Nov 2025 10:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B804C102F0809;
	Tue, 25 Nov 2025 11:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764067541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3tb0J18ESDC4ppn4MREj3fd53hd+rDvcI8fF39MlDNM=;
	b=fztj7ZXczXI0d3tqp627mPVxkOxsQzFPTiEDdQSiRLQPsJocFuI173Q0M3ILmPc0YB7SPV
	BXkBLY49dfcKd6TW3DYVViMf1kQKdEA6X2Flwg/yaEySlKfqzHnx/lObtS8EBYzaZROO2u
	YTLlNKPY1EtY4rOBA435c6iaFjMnXDuXe6cA91MgqYuJuRE2OEo+1Y5LxyKFo/HFdNtk6H
	QFThs9Bk+L8xqkV8gj7bUnQ/bEF8bUiM52+cvS5v6D6wIy0110fPFLh0DUwB79f2Smipci
	djJLg2sNdUr/jLLlRD+nFe/tnM0qS0hVJjG1It4xf1xZF7KH+hVP8yK/1R3TfQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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
 Re: [PATCH v3 7/7] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Date: Tue, 25 Nov 2025 11:45:35 +0100
Message-ID: <3583116.sQuhbGJ8Bu@benoit.monin>
In-Reply-To: <aR4lVB8FRzHLcXJT@smile.fi.intel.com>
References:
 <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-7-bc4bc2a2cbac@bootlin.com>
 <aR4lVB8FRzHLcXJT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Andy,

Thanks for the reviews.
(ack on other comments)

On Wednesday, 19 November 2025 at 21:15:16 CET, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 04:05:36PM +0100, Beno=C3=AEt Monin wrote:
[...]

> > i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs,=
 size_t i
>=20
> > +	/*
> > +	 * Make sure we don't need explicit RESTART between two messages
> > +	 * in the same direction for controllers that cannot emit them.
> > +	 */
> > +	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> > +	    (msgs[idx - 1].flags & I2C_M_RD) =3D=3D (msgs[idx].flags & I2C_M_=
RD)) {
> > +		dev_err(dev->dev, "cannot emit RESTART\n");
> > +		return false;
> > +	}
>=20
> Ah, Now I see the point of checking the idx first, but can we rather call=
 it
> with idx >=3D 1 to begin with?
>=20
We would still have to check it when calling i2c_dw_msg_is_valid(), as the
first message after a STOP don't have any limitation. It is not just for
protecting against an out-of-bound access to msgs. The validity of a
message is in relation to the previous message in the same transaction.

I will change the comment to make this clearer.

> >  	return true;
> >  }
[...]

> >  	{ .compatible =3D "baikal,bt1-sys-i2c", .data =3D (void *)MODEL_BAIKA=
L_BT1 },
> > +	{ .compatible =3D "mobileye,eyeq6lplus-i2c", .data =3D (void *)NO_EMP=
TYFIFO_HOLD_MASTER },
>=20
> Are you expecting more with this? I would rather use a compatible matching
> instead of the flag,
>=20
The IC_EMPTYFIFO_HOLD_MASTER_EN parameter is part of the DesignWare IP, it
is not specific to Mobileye. Given that typical i2c accesses (single read,
single write, write-then-read) work on non-PREMPT_RT without this patch, I
suspect there are other controllers that lack the ability to hold the clock
when the FIFO is empty that could benefit from this flag.

> >  	{ .compatible =3D "mscc,ocelot-i2c", .data =3D (void *)MODEL_MSCC_OCE=
LOT },
> >  	{ .compatible =3D "snps,designware-i2c" },
>=20
>=20

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




