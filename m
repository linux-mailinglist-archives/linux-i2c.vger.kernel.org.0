Return-Path: <linux-i2c+bounces-13682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A2BF1F78
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 17:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00273A8A6D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B69C227BB5;
	Mon, 20 Oct 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I3IExKW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC77230274
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972449; cv=none; b=RoFSaEQgYrVbQq72qYrP0I9pPKcapICTxPyclXDyES53vXD5hwgRz6fL9084fsFYwmCzRZfDwPSNIE9048M520FUtIE/6Psv6KpFxtLeCzKUufNHy/5+ifVRHA+ueZdByuxS9NPvXwOuWxghqmdHToiRvjKeIoNxBmiBhC4Z844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972449; c=relaxed/simple;
	bh=n4Tfnv/g7tAgw+TUNNP2SjpBI9kaU8j/Un3STFoNKcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pcw7/zEV58m3txLKlYU7aANpKYiq5lc+bkVicIA1fU10rQYy+/r923CISVHC2EzVYPQLySpX1JgFKhp+hjXvxWLWYok7Ia1oJp67gWuZLM87UvowtL4h4LEu85CM4Mbkqzwza38KsiSD8zLrZay/iE01q6dY4gVRoOfapSFrpfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I3IExKW5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2CB74E411F8;
	Mon, 20 Oct 2025 15:00:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68FC6606D5;
	Mon, 20 Oct 2025 15:00:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABE47102F23C5;
	Mon, 20 Oct 2025 17:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760972443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZrW1sfJQpQwPdHs8qZ2VHLQbfGXdmToaCvZeT5M1MiI=;
	b=I3IExKW5fxSKfSLxUjGJvVfgi9rNd5IO8P6DEagQYrunTkuWtwe36oWjOt9w5iR5gHARz/
	rFTtQzaaO6WFbhSnd7NvbeIORFI68BHNgvcx7iRakoEh7Zh+njRyKv7zDqb/E4xTMbVq57
	ws8wE6XVLSxc3aYwg3kvDNSMtBFUO7QtB85v5YL1O0tl1viY3fBsoxPNjn5NcatWEouswZ
	nksVnscfnnl/U4xTMqqs2dnUy1Vwq69HAD5fCZUTpzo0AO4YlfasSttdb/uNYr8q27ATgT
	HR6HI1k9y1iQD3cevXlOhQTVsfrnzrFDiPScPrC5Ujqu64sHiXOwceN5pbKWrw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
Date: Mon, 20 Oct 2025 17:00:29 +0200
Message-ID: <22296119.4csPzL39Zc@benoit.monin>
In-Reply-To: <f5e7bb0d-205b-4c10-8c31-bf60e1e42b73@kernel.org>
References:
 <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com>
 <f5e7bb0d-205b-4c10-8c31-bf60e1e42b73@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hello Hans,

On Monday, 20 October 2025 at 11:38:38 CEST, Hans Verkuil wrote:
> Hi Beno=C3=AEt,
>=20
> On 17/10/2025 16:59, Beno=C3=AEt Monin wrote:
> > When i2c_dw_xfer() is called with more than one message, it sets the
> > target address according to the first message. If any of the following
> > messages have a different target address, the transfer finishes with
> > an error.
> >=20
> > Instead, if the next message has a different target address, wait until
> > all previous messages are sent and the STOP condition is detected. This
> > will complete the current part of the transfer. The next part is then
> > handled by looping in i2c_dw_xfer(), calling i2c_dw_xfer_init() and
> > i2c_dw_wait_transfer() until all messages of the transfer have been
> > processed, or an error is detected.
> >=20
> > The RESTART bit is now set after the first message of each part of the
> > transfer, instead of just after the very first message of the whole
> > transfer.
> >=20
> > For each address change, i2c_dw_xfer_init() is called, which takes care
> > of disabling the adapter before changing the target address register,
> > then re-enabling it. Given that we cannot know the value of the
> > I2C_DYNAMIC_TAR_UPDATE parameter, this is the only sure way to change
> > the target address.
>=20
> I have the problem described here:
>=20
> https://lore.kernel.org/linux-i2c/ee6afdd7-3117-43cd-831f-e0ec5ee46f46@ke=
rnel.org/
>=20
> And it looks like this patch is intended to solve that problem (one trans=
action
> with two writes to different target addresses).
>=20
> I tried this patch, but it doesn't work. Instead I get a time out:
>=20
> [  111.695238] i2c_designware 1f00074000.i2c: controller timed out
>=20
> Is it indeed meant to solve the problem I have or is it addressing another
> issue?
>=20
=46or your particular case, that will not help reaching the other segments =
as
we wait for a STOP before changing the target address. So, it should not
fail but do a write to segment 0 in your eeprom.

> I'm happy to help test patches.
>=20
Can you enable debug in i2c-designware-master to see which transaction
is failing?

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




