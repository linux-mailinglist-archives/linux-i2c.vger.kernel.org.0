Return-Path: <linux-i2c+bounces-13720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8DBFAEDD
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 10:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD9B3B1964
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE470309F1C;
	Wed, 22 Oct 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mOj9Qf5W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E318350A2F
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122206; cv=none; b=FEwLj95a1BUOqx2p1ppIP84/4PSRC6da2bdshzoqKz7cZV8L695zwKrv1XA5R+naIGv8ub8WJvMr61vIMvfqceEUxQ3eM3MoluuQyEHjeFrR+zcnOs0mFJljAxduLbMLxfxCYazdB1SiprFPoiYJqa+xEpsWPcGQ6I9vNFh/aCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122206; c=relaxed/simple;
	bh=0D0gLXUvdDmxAdocUXs6W1tqJuSvdfyUT5UsEyO8jcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MW4PqNGWKy1IJcn4dn9TNAyfgU0qjL+w10uJqqv/cf8Y7SBtebiWBxfzwqtnfu1JY0vunUFlE8DT2KRyDJxUz7eFesj8I/RIoNVGuBMW/Pg/ooFLjx2acl4wTBj6M8qH6/GzlsxMzLhDOklC0z9aI5MOt4ynGzqZk2Hh6OI01bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mOj9Qf5W; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D06D64E41266;
	Wed, 22 Oct 2025 08:36:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CAEA606DC;
	Wed, 22 Oct 2025 08:36:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCD85102F242A;
	Wed, 22 Oct 2025 10:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761122201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0D0gLXUvdDmxAdocUXs6W1tqJuSvdfyUT5UsEyO8jcI=;
	b=mOj9Qf5WcnayPBzSXX649DoYuwGSolubhlFW+OdQTpyyKk/zWN5znus/K71A9CwH0SUdT7
	3GDQn+Zb7vvsn7p9vHfSJsUDUk137AAIxs03skNEzO0yvbO+nirad4bdxEV+XpXCJhxA0m
	V+LChprJ3w5+QEZhJalo0NFca13HEOWEI2DcHJQwwuLriPS9qGqOif92JyA6LpNPPFk5VV
	pdYem0BPbi8c1rajPSVDpIo1+Q4t/XzJTrO2q0qHM+fLnCT3oGYHV5KnB6zwBsz3/lcr0G
	G1E0v9+DuGcwpy4PiTaXdilEK8pol5acwKxPk6bpr4PNc1SEO+kXL4qDQywaaQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject:
 Re: [PATCH 2/3] i2c: designware: Enable transfer with different target
 addresses
Date: Wed, 22 Oct 2025 10:36:28 +0200
Message-ID: <5779084.ZASKD2KPVS@benoit.monin>
In-Reply-To: <aPaS4c-AX0P66T30@shikoro>
References:
 <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <22296119.4csPzL39Zc@benoit.monin> <aPaS4c-AX0P66T30@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Monday, 20 October 2025 at 21:52:01 CEST, Wolfram Sang wrote:
>=20
> > For your particular case, that will not help reaching the other segment=
s as
> > we wait for a STOP before changing the target address. So, it should not
> > fail but do a write to segment 0 in your eeprom.
>=20
> So, this patch replaces a repeated start with a stop + start
> combination? Please don't do this. It will give users a false impression
> that proper repeated start is supported. Honestly reporting that the HW
> does not support is the better option, so the user can decide what to do
> then.
>=20
This patch replaces a -EINVAL in the middle of the transfer by a
STOP-then-START, but you are right, the expectation is to have a single
STOP at the end of a combined transfer. I somehow overlooked that part.
=20
Maybe I could add support for the I2C_M_STOP flag instead? Or does an
adapter has to support all the protocol mangling if flagged with
I2C_FUNC_PROTOCOL_MANGLING?
=20
That would still allow to group multiple accesses to device that support a
STOP in a transaction when done via i2c_dev I2C_RDWR ioctl, in a single-mas=
ter
configuration.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




