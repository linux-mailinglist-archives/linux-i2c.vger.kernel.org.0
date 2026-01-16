Return-Path: <linux-i2c+bounces-15232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74913D31754
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76567300FEFE
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469DB238C0B;
	Fri, 16 Jan 2026 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tL+I8D4Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18823D7F7
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568524; cv=none; b=K2kAgvDbSAqCH9SRymYIpANJG/kmKz0ZP/U1uEmXeoGO7IZHkvjakWM7+GQopBkRJOz8TDmGVdjd8ZPVnrQLOmSyJr8ur2LMC8xtYZ6qbTyNrVwwLPZEg3NKyZsaApn+/PSDP0bcsxs4VBmEmnfbLyPDV2f6I6OIQCsjHVUvoO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568524; c=relaxed/simple;
	bh=LGBH4ijVE/oW1hhc8swM1hLobiNjY4wRo2OSK8be/m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSHEDm6adxI4H13akTa0I1WJoJfI9Vzztatn5tvoUzx+7pwsftrV+DxHcNSDhaYkW2ljVMnC7qLApV/sHYM/ezctuq/GQui2tzRD2dS5Td/oQ99QT6/4eHyaeYJTE/GBM0OT496shbPuiFglaoprlHivjet4TMgnWL7soj5BCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tL+I8D4Q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 166634E42118;
	Fri, 16 Jan 2026 13:01:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E077D60732;
	Fri, 16 Jan 2026 13:01:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 013C110B68AA6;
	Fri, 16 Jan 2026 14:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768568518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=crrcUpqd0XHN0VeM8dgfcODR9SDwzlUPnv11lsf44nI=;
	b=tL+I8D4QhgS8RzRKhrgq7ra1mSI8YMuIn7K1Bt98CQGvpVwI53zTAXHiZySaoTyr29qHQV
	xcTRAHByocu8uvgF8sljguNVy/+prIeJd13X0P08JV/LJ4rfYgvLIjdWFZSbsF10uA/0eT
	ZE0hvjBIa+IZC3wsiJqNVO43X3ZYmAsgnYBzyJCR4labe+EtSmEiwGV1qAnneSOZ9Sd7KI
	eJpv/Nu986cLUepX6SU+oxJsC7zhWbl3JIRnSiLp9bYdS0fdfhkypcQ/7S1pvjBlF3LMT/
	3A0ory/ikv1gND5He2nGuGVH3tGk+d3hnZiHiI4vdNbDAzBp9CzElT1gz/eFdA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject:
 Re: [PATCH i2c-tools v2 2/2] i2ctransfer: Add optional message modifier flags
Date: Fri, 16 Jan 2026 14:01:57 +0100
Message-ID: <2768446.lGaqSPkdTl@benoit.monin>
In-Reply-To: <aWaCAV4preoIPcih@ninjato>
References:
 <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
 <20251223-msg-flags-v2-2-8d934a4366e2@bootlin.com> <aWaCAV4preoIPcih@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, 13 January 2026 at 18:33:53 CET, Wolfram Sang wrote:
[...]
> >  		"  DATA are LENGTH bytes for a write message. They can be shortened =
by a suffix:\n"
> >  		"    =3D (keep value constant until LENGTH)\n"
> >  		"    + (increase value by 1 until LENGTH)\n"
> > @@ -202,12 +209,21 @@ int main(int argc, char *argv[])
> >  		case PARSE_GET_DESC:
> >  			flags =3D 0;
> > =20
> > -			switch (*arg_ptr++) {
> > -			case 'r': flags |=3D I2C_M_RD; break;
> > -			case 'w': break;
> > -			default:
> > -				fprintf(stderr, "Error: Invalid direction\n");
> > -				goto err_out_with_arg;
> > +			for (int done =3D 0; !done; ) {
> > +				switch (*arg_ptr++) {
> > +				/* optional flags */
> > +				case 'i': flags |=3D I2C_M_IGNORE_NAK; break;
> > +				case 'n': flags |=3D I2C_M_NO_RD_ACK; break;
> > +				case 'p': flags |=3D I2C_M_STOP; break;
> > +				case 's': flags |=3D I2C_M_NOSTART; break;
> > +				case 't': flags |=3D I2C_M_REV_DIR_ADDR; break;
>=20
> Brainstorming here: maybe a macro could help:
>=20
> 	case 'i': add_flag_if_supported(flags, I2C_M_IGNORE_NAK);
>=20
> ?
>=20
I am having a hard time coming up with something here. There is the
__is_defined() macro in the kernel source[1], it only returns 0 or 1, not
the value of the define.

Maybe defining as zero the flags that are undefined would be acceptable?
E.g.

#ifndef I2C_M_IGNORE_NAK
#define I2C_M_IGNORE_NAK 0
#endif

Or you have another idea?

[1]: https://elixir.bootlin.com/linux/v6.19-rc5/source/tools/include/linux/=
kconfig.h#L35

Thanks for the review!
=2D-=20
Beno=C3=AEt




