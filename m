Return-Path: <linux-i2c+bounces-2290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B966876564
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 14:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF762B24B18
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123FD381C1;
	Fri,  8 Mar 2024 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n3GgmtTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F63612C;
	Fri,  8 Mar 2024 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709904818; cv=none; b=PJ5QAaETipA/i10a+suLeCbcVkZajodf08fujBqsbU/vDQ3YYyxq6iD5y92bTrIUAdQXjRqYD86bE0x+IgG9AD/5WltRyKkvCitCs2zbozqVNahhfcRZFIWK+ltE6/vqJUxR1BIYnlfCOovygVGnR2kcSxC+ZDyVjs4AeWq0C60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709904818; c=relaxed/simple;
	bh=4ZkVUBLSDeUXcXi2xTKcJ3cUsQWPzbrJXOQ/A/i5e8M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cC8ad9crVhuwBgjHfS+deqyImaCuwVTtq6TiXZUJgKpkhSSLdNf3QM508Ue9DdcuypqG5+eT77KvtILAg29cnnGdlRz1BGt32S+54EkKqPUOFL5NQfr3CDiOTrNbcpjmaJUiobjzlcrCmL1rl6SZbMMISRlf1Kr8CKSEYSaqoCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n3GgmtTR; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F72D2000E;
	Fri,  8 Mar 2024 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709904812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tBfmX+8Hgk/BqOXaahZwNbPUrMVY004ZkuW+uwmjpE=;
	b=n3GgmtTRXmnfqEFds89oU7qvJ81y9dnJTg5OsTvBofsNDrGeSfEkLisSpN84LTsHdIL588
	OK1JPm8/P/E+EgaiZpA0xtFfS2Nfu5VEFlw8Pum/M3sb+PcwADsGcW6/l/i6jLZjHIG73t
	UGDe4W6wzxpL2CUnXsqDzhk0JmmN6UCwfhvWMEkhGbfWc5BUtuWZihy41fiLEZH2WBKkcs
	l+DiD2k4dGfWHt7tF2ZQeRJT6iK3CbFWWi3Ev/EYzjIXgsAFYrSZShBUBI1bg6g/14/psR
	2hcdmZ45nMUIJF4ep813D4z9sqGS24K/OiNTwW/Nb6jGul/gz38hWXnn5tYrmg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Mar 2024 14:33:31 +0100
Message-Id: <CZOEO2E13Q67.1LQ5HNWPYU647@bootlin.com>
Subject: Re: [PATCH v3 03/11] i2c: nomadik: simplify IRQ masking logic
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andi Shyti" <andi.shyti@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>
 <422szb2dtgnq56xznfqsqtqs3dai2jipnntrp6yb2og353whs7@g4ia5ynnmqu6>
 <CZO8SUELNP4R.230VKX59UIHC8@bootlin.com>
 <3f7zpl4yu5gsojmfhdrbieev3gatfcgag5tnmgmrv3u46y4pny@tamjf6cq5g3v>
In-Reply-To: <3f7zpl4yu5gsojmfhdrbieev3gatfcgag5tnmgmrv3u46y4pny@tamjf6cq5g3v>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 8, 2024 at 1:27 PM CET, Andi Shyti wrote:
> Hi Theo,
>
> On Fri, Mar 08, 2024 at 09:57:39AM +0100, Th=C3=A9o Lebrun wrote:
> > Hello,
> >=20
> > On Fri Mar 8, 2024 at 12:01 AM CET, Andi Shyti wrote:
> > > Hi Theo,
> > >
> > > On Wed, Mar 06, 2024 at 06:59:23PM +0100, Th=C3=A9o Lebrun wrote:
> > > > IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ=
_MASK
> > > > removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserv=
ed
> > > > options including top bits. Keep the latter.
> > > >=20
> > > > 31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
> > > >   30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
> > > > --- IRQ_MASK: --------------------------------------------------
> > > >       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
> > > > 0 0 0
> > > > --- I2C_CLEAR_ALL_INTS: ----------------------------------------
> > > >       1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
> > > > 0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0
> > > >=20
> > > > Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.
> > > >=20
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > >
> > > You did answer my question in v2, thanks, Theo!
> >=20
> > Oops my mailer syntax is telling me that the lines starting with '---'
> > might cause issue as it might mark the end of commit messages. I'll fix
> > that in next revision. If it gets applied before that it should be
> > checked that part of the message doesn't get lost.
>
> mmhhh... right! No need to resend, if nothing else is needed from
> the series, please paste the commit message here and I will fix
> it.

The message would become the following (tab-indented). Both '---' turned
into '--' in the bit table. I confirmed `git am` does not truncate this
updated message.

	i2c: nomadik: simplify IRQ masking logic

	IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ_MASK
	removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserved
	options including top bits. Keep the latter.

	31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
	  30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
	-- IRQ_MASK: ---------------------------------------------------
	      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
	0 0 0
	-- I2C_CLEAR_ALL_INTS: -----------------------------------------
	      1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
	0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0

	Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.

	Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
	Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks for the quick follow-up!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


