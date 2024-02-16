Return-Path: <linux-i2c+bounces-1828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36C857A82
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189D41F23A87
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0858C52F65;
	Fri, 16 Feb 2024 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lz2U9uLV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297B1BDE6;
	Fri, 16 Feb 2024 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708080055; cv=none; b=QCcwYZgoDi+rS0Dbw27yn71v4ZlzzvbK7AYVvmbXOvIanDcRwbSz8XG0sdmucFHCjf6gqxGHyRQyP7ceg80uEJGUpKst9wkBCQP+qauatd7/BHxB2j7LVC/kDO4KVD5uZOwlFh3ax8spckPHcwHSoMk8c82NCFp1G7suY6fEXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708080055; c=relaxed/simple;
	bh=4vCY6JZJluyOURcmliUjf8D4UGdWpWhqShAztx1q4U0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=l3fmVSntOxxdol43dk/rqUaCUxNuq8kAG57GVqsJn+mEHbbZ0Qga4jkNqbvQq2ONkYXjdqa7fR6SID31+j2tJCwf+2j5IpdS8POjx0LUe79PlKvaPdzXoKsC4OxM7DgQsVKTLNKaISgSofd3EksW65DHPLSVLTSVzNY6dJenE/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lz2U9uLV; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A5F7C000A;
	Fri, 16 Feb 2024 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708080050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pW+H2/+M3nwxvUrdeb949EaUZPq3QzVW/JZ2LL5ih34=;
	b=lz2U9uLVS3/HdJM1KiMEiUYoPgnBtLLrRboc8aNuca5J5CJu0LxWUJqVuayCZz+nR9Ueem
	GJV80VRxBtCaNXb+RaZQzFs9VnINWRo7LxEGKea1LN+T5iiTAWeYwM1yVHh4eMOcWhzONe
	I2fhfxZYlkk+hNNSIbQoJM5bSsSv/VEurY7+Z2pOjHGACRR2Jgv4naaUQuz9SGgpxBbJ5t
	J27ZBToyYYAC2DSRAZowyPiTmeNOhTg73wSd4xiCwSTtH5AsOiSur6xqzkssVjeJs2Rcb9
	VG5VdMHV6ulPW1rl2IMIj2P7PThpBSQ5Ct9nhZ0wDGw0WjvznvT9upEFnGxmXg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 11:40:50 +0100
Message-Id: <CZ6FUECKEX2B.36QWZZA5EYPI@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
 <20240216022227.GA850600-robh@kernel.org>
 <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
 <6effca50-29a4-43b9-86eb-310bd4e08e5c@linaro.org>
In-Reply-To: <6effca50-29a4-43b9-86eb-310bd4e08e5c@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 11:33 AM CET, Krzysztof Kozlowski wrote:
> On 16/02/2024 11:18, Th=C3=A9o Lebrun wrote:
> >=20
> >>> +        mobileye,id:
> >>> +          $ref: /schemas/types.yaml#/definitions/uint32
> >>> +          description: Platform-wide controller ID (integer starting=
 from zero).
> >>
> >> instance indexes are a NAK. You can use i2cN aliases if you must.
> >>
> >> Why do you need it? To access OLB? If so, add cell args to the OLB=20
> >> phandle instead.
> >=20
> > Why we do what we do: I2C controller must write a 2 bit value depending
> > on the bus speed. All I2C controllers write into the same register.
>
> Which register?  Your devices do not share IO address space.

mobileye,olb is a prop with a phandle to a syscon. That syscon contains
the register we are interested in.

The Linux code side of things is in the following patch. We use
syscon_regmap_lookup_by_phandle().

   [PATCH 10/13] i2c: nomadik: support Mobileye EyeQ5 I2C controller
   https://lore.kernel.org/lkml/20240215-mbly-i2c-v1-10-19a336e91dca@bootli=
n.com/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

