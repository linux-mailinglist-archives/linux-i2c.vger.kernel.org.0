Return-Path: <linux-i2c+bounces-13989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F7C3A587
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 11:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB63B350A84
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 10:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312C630DECD;
	Thu,  6 Nov 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uMEvH6bU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9C30DD3A;
	Thu,  6 Nov 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426023; cv=none; b=mKfGFxzex2yR31Hv2xg+KmUwjpL0SDNnDAlkzieVizIb2QVwt7QcRH8Y2LR9lbd0nBw+GL9OnjjA2PYSret6zahj06upwicXPL8+6vKmVNiUd74N6laBVoUJpXT3SuoZj60sag3l7EiLuiAmoK6ltKewOM/jlwrGUlCYHqjtC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426023; c=relaxed/simple;
	bh=f0Us3NBYeiYMjlvudgaP1o/5UTEjGcdI4GuGY4b64MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbdM2/kWQ0nWNT1OLn0+ulgpE8eoCIsk7o+DwtMIYwrPvfwbPxYjHx6e7IUuKgmTo1dmsIryeKZMXk0AOC/3Mg8ODWQBAg3168VpOvUPo+7ZPPkzQ2oAvmWif8KdujjKSAnCQZkNomJ7/TyixAZq9F6xsoKKlflBhGovcoPprYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uMEvH6bU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FAF04E41567;
	Thu,  6 Nov 2025 10:46:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 009016068C;
	Thu,  6 Nov 2025 10:46:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BFC6118507EA;
	Thu,  6 Nov 2025 11:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762426018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f0Us3NBYeiYMjlvudgaP1o/5UTEjGcdI4GuGY4b64MA=;
	b=uMEvH6bU3/zg0C1PdSoKCLJi2cqLmz0kAEZn0MiJkh6/hl+7lr7JFB+chFh/FylsNryF8r
	Q3zrPwub+dydKL4ki0jHpLd7Awv3HensHcEvIJuLB/pNiFyFNWKjeSakGHKOfG79n1eRiP
	RsmuK0VE/241lPgN9T3edjzRIxEK8H5wdWn2wPTImQhzIV51PzelL3+L4nF/SiPBZ9bRB6
	QmFkG03A557y/F8M588kNMlLNq2LhMR/wAXMlgaxN1hLjtxqQetgKyrYRdKk6A+YQoJTgZ
	0hPcn9KYElSu+dZpQuXUq53hQzdeu5L8PBAFvR8MBrlOyJt0kftbfMDQsjbGqg==
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
 Re: [PATCH v2 2/5] i2c: designware: Optimize flag reading in i2c_dw_read()
Date: Thu, 06 Nov 2025 11:46:53 +0100
Message-ID: <2578061.XAFRqVoOGU@benoit.monin>
In-Reply-To: <aQTMUrMbfgs59oBQ@smile.fi.intel.com>
References:
 <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-2-90416874fcc0@bootlin.com>
 <aQTMUrMbfgs59oBQ@smile.fi.intel.com>
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

On Friday, 31 October 2025 at 15:48:50 CET, Andy Shevchenko wrote:
> On Fri, Oct 31, 2025 at 03:35:40PM +0100, Beno=C3=AEt Monin wrote:
> > Optimize the i2c_dw_read() function by reading the message flags only
> > once per message, rather than for every byte.
> >=20
> > The message index is only modified by the outer loop, so reading the
> > flags in the inner loop was always getting the same value.
>=20
> Does it affect the binary (compiled) file?
>=20
Yes it does. On the mips64 system I am testing this on, built with gcc11,
i2c_dw_process_transfer() which inline i2c_dw_read() get 16 bytes shorter.
=20
Looking at the disassembled code, the flags was read in the inner loop prior
to the patch.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




