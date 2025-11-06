Return-Path: <linux-i2c+bounces-13986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D828FC39E16
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 10:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4DAE420BF6
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272BB30CDB0;
	Thu,  6 Nov 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QGElTyZ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13005218845;
	Thu,  6 Nov 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422172; cv=none; b=qT6czNdgB0Q1KA2UgepPECGTO5NuA0+uw8q2g4QsoCjYgPBDCGyyxqW3Ni74vg4m4Vm/9avVmWynkxdxPx65DUGHduA88rUdN2Bma4958CnAxMfYgA5LsG/I9DnOUdSdBJ18b/8pAkTTkU0gylQXWm+EsjQQ7aEGwu8QZhapkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422172; c=relaxed/simple;
	bh=N416tpXvw0KYsqy3uUZXQ0WPvEPn4bYRp4orgR7uxcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPSPddnTzk032hDDnvyNhAEGGQacUXWASiJbOGdN2iddeHMQLcXh4fjMjRbKX726MZQZ/kf+CWy5N8wb35ZPc7pzyOk2PfmOhKklsYjNHdJz1c4cPWM1EPdWrn/J83fglGMmIh642V1+Y/1a70SboADo4ftMkJd0tIQAe3XyAbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QGElTyZ7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3EF52C0FA83;
	Thu,  6 Nov 2025 09:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3542C6068C;
	Thu,  6 Nov 2025 09:42:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8394C118507F7;
	Thu,  6 Nov 2025 10:42:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UoA5yeXDlSLb4wP5rb80Vsu85I6/UlttUcKFiCCB8PA=;
	b=QGElTyZ7ZYPk5gqinZxVAJirdPRqKBaIS56/7xRz3u37FzRjQVpKSAEh1GbfDeRpsGqMOC
	60NBhArlN8GuOTmoQ9Qn137j13Bm8FllVK5YUEZGcYgsV+3VjktGcfiWryQSWIm9vaMPNP
	rx+JFWIrW3WJvtquJi+L7zRoUZteFAxWWUpgc52duFCWjsNzKeCzdf1NB2HgeFVGGP/74t
	0dg6yiSOrIaMNQlK8Az2oeYTmPlT4fNo6gKYvicG5Xvija8nFxxzxXc8clOFkdpsPIG/zQ
	C3uncyAE31sZh75pgTyoJGZXxouHQDEA81zjsdNi9iJRiJS7TzGoKYVkdhBGXw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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
Subject: Re: [PATCH v2 1/5] dt-bindings: i2c: dw: Add Mobileye I2C controllers
Date: Thu, 06 Nov 2025 10:42:40 +0100
Message-ID: <5005364.OV4Wx5bFTl@benoit.monin>
In-Reply-To: <20251031-segment-chance-40ba410eb55a@spud>
References:
 <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-1-90416874fcc0@bootlin.com>
 <20251031-segment-chance-40ba410eb55a@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Conor,

On Friday, 31 October 2025 at 15:58:49 CET, Conor Dooley wrote:
> On Fri, Oct 31, 2025 at 03:35:39PM +0100, Beno=C3=AEt Monin wrote:
> > Add compatible string for the I2C controllers present in Mobileye
> > Eyeq6Lplus SoC. The same controllers are also present in the EyeQ7H.
>=20
> Then where is the compatible for the q7h?
>=20
I had both entries in version 1 of the patch but Krzysztof told me to
avoid creating duplicated entries. Should I just drop the EyeQ7H
mention in the commit message?

> pw-bot: changes-requested
>=20
> >=20
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index d904191bb0c6..bc84631f28d1 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -36,6 +36,7 @@ properties:
> >          const: baikal,bt1-sys-i2c
> >        - items:
> >            - enum:
> > +              - mobileye,eyeq6lplus-i2c
> >                - mscc,ocelot-i2c
> >                - sophgo,sg2044-i2c
> >                - thead,th1520-i2c
> >=20
>=20

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




