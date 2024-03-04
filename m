Return-Path: <linux-i2c+bounces-2138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A586FDE5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19EE283AB4
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEBA20DF4;
	Mon,  4 Mar 2024 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U2hJjhPf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE01B7F3;
	Mon,  4 Mar 2024 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545595; cv=none; b=GuyjDDxjquQvooJOrmAlFUhk2BwnoYuzVfJSUzALPSrKF8PB3+zyct0H1rUtPPFLZUCqXCQqawQYupdTScOyYBPjdgrLvJ+imaXyQjsIXFYhCaw1ZgUGoLHBKx4xLodHw89+d5p2pF9qcWTP2emsiCP8Nd2LHUdfm4Z8lrhM8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545595; c=relaxed/simple;
	bh=anUB/OBSNGm/JeFQNlRuNFLtUQHaQ9D8+eh1w3c3q18=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Sg3CWZcwnKmAIYuR55o4+eeuT37KeDEFitV+7j5ku6HnY5kyTLOLIkNvTjEaLhWmeqdpThJQaIbWBcmrgvaDkjTEwrNmi2quKgC+emPTAtoBHz6p8clLiGnF2M9CWTZ+QgftfSxb3yU0IZxglGOgCC0XGF85Bi8FQrX2Zqy/1/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U2hJjhPf; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E9C1C000B;
	Mon,  4 Mar 2024 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709545590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+obVxPBVye59ep/rc+NawmN0v65caHupg9rcnFDhO04=;
	b=U2hJjhPfJOybFyQT4y93sxpTKV9BVq+ROnsiqrseqLuHyo3Algc9QmEqF78XZW4vw+nps0
	hqWxOQFFeHpDSPWMuAWRgoV0kPPh34RzLGGX7Y3V8H98/CYTX5UI3Ihs5mkHSpV6SuRKRl
	aL0SZKJz+mA6n1G1HOhWuWgtl5rKiVNGqKWVUbTPUmSE/ZOIdnaMdy+t3UhOMwI1UCnsu/
	L+vQTaNYK2HGkHlEftlk/loHRTWUQyI1EY3XAaP7nfI5vN2mPQvSiWp0feResi5kFwVzwh
	CDcUL78cCvMYjMlMm0LY1DY9wrLf/okIjsoRCL+BrkliozmRxEpBTh/m3ZSAnA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 10:46:26 +0100
Message-Id: <CZKVC09R7VQB.3DEDAIWIICORV@bootlin.com>
Subject: Re: [SPAM] [PATCH v2 04/11] i2c: nomadik: simplify IRQ masking
 logic
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
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-4-b32ed18c098c@bootlin.com>
 <hbnkcqjgykfzivqvjnr5ixmp57am43mxslfnpxhro27kzd2pyt@q35uhgkxn5cv>
In-Reply-To: <hbnkcqjgykfzivqvjnr5ixmp57am43mxslfnpxhro27kzd2pyt@q35uhgkxn5cv>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Sat Mar 2, 2024 at 1:39 AM CET, Andi Shyti wrote:
> On Thu, Feb 29, 2024 at 07:10:52PM +0100, Th=C3=A9o Lebrun wrote:
> > IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three
>
> if I2C_CLEAR_ALL_INTS is redundant why don't you remove it?

I understand this is unclear. What I meant by redundant is that they are
redundant from one another; one overlaps the other. I'll give a better
commit description for v3. Something like:

   IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts.
   IRQ_MASK removes top options (bits 29-31). I2C_CLEAR_ALL_INTS
   removes reserved options including top bits. Keep the latter.

   31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
     30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
   --- IRQ_MASK: --------------------------------------------------
          1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    0 0 0
   --- I2C_CLEAR_ALL_INTS: ----------------------------------------
          1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
    0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0

    Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.

Is that better?

> > bits off as reserved, the other one masks the reserved IRQs inside the
> > u32. Get rid of IRQ_MASK and only use the most restrictive mask.
>
> Why is IRQ_MASK redundant? What happens if you write in the
> reserved bits?

The wording wasn't correct. Have I answered your
question from the above?

Thanks Andi,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


