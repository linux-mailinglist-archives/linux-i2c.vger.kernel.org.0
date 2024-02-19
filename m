Return-Path: <linux-i2c+bounces-1860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056585A502
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E631F21B6E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A268F364A9;
	Mon, 19 Feb 2024 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KKX55vGX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930683612E;
	Mon, 19 Feb 2024 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708350090; cv=none; b=pxz4X8VsQIngGHB7WlAf2p28WRt8vnQ6HVGEarqgGaeoQQ3CnkQRfhK8XhZdCJa9evcRjtEGAJ9tkSDfK+OhTKUbsOjtGaelAEQhHLTQmi+/xNKICnEwuwjd0QNClPEO4C88rCXVYRvWIMIBeiRG9qlArMEZTWJSj66WqLwz60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708350090; c=relaxed/simple;
	bh=fGpvwIGy2LQRXThEEta3A8xVTtWdS4NNyyyJxz4ZWoE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=fZXVuQE6HelgQvZEoQj7x94ucU5+XcVMNR7lHM9D6W4ksirGhRL+UV4JSLTxA2DTIYbkRncOBu3nNJN+gespSYkQOLYjdHapRzVxu8sdv97bWs68OzuvrFARxivpyZkPWkJyb+/ptnBBLHBUKNYLVE2nQ9lCI0FZtEvb2h85MC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KKX55vGX; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6892B40007;
	Mon, 19 Feb 2024 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708350085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npYRmHh0n3z51AZdDa3QZzAz5BYIy4ErQyiNWsy/7k8=;
	b=KKX55vGXkgAsul0jJVBBh0WsHdH8Ty2o0BPwgXrX+pRSA/sZsj+tCny78oV9IMd9+Ypv8W
	yZOLwdTULOXg6jjFRTUj6/M/B46V7Ub/8tc7aJHs2pPxMCGhUPYGUfPiDcVpgvsDkzMpgi
	5xBswwSooElotlLj4fWUbsWevhqaY58Mws6Tur2cwC3A0wDMfqWg/b01Xpxrd1aLDQATo0
	LJPXMx8Qw45HmDL1SUVlB8rPrDo5GRkU6oMayDC5RkmgYarbfNpaZ4logH21A3pmOChH6W
	VyspoZjQqPJoVXA35x/79EEd5M/Ik5ProNlLxlZ21A5P6WVZVJKqaOp3tn1O0g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 14:41:24 +0100
Message-Id: <CZ93KAA53F8G.38AUM6RZGUYY7@bootlin.com>
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
 <CZ6FUECKEX2B.36QWZZA5EYPI@bootlin.com>
 <cf360cbf-7414-4024-8bdd-d2aba7f048b3@linaro.org>
In-Reply-To: <cf360cbf-7414-4024-8bdd-d2aba7f048b3@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Sat Feb 17, 2024 at 9:25 AM CET, Krzysztof Kozlowski wrote:
> On 16/02/2024 11:40, Th=C3=A9o Lebrun wrote:
> > On Fri Feb 16, 2024 at 11:33 AM CET, Krzysztof Kozlowski wrote:
> >> On 16/02/2024 11:18, Th=C3=A9o Lebrun wrote:
> >>>
> >>>>> +        mobileye,id:
> >>>>> +          $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +          description: Platform-wide controller ID (integer starti=
ng from zero).
> >>>>
> >>>> instance indexes are a NAK. You can use i2cN aliases if you must.
> >>>>
> >>>> Why do you need it? To access OLB? If so, add cell args to the OLB=
=20
> >>>> phandle instead.
> >>>
> >>> Why we do what we do: I2C controller must write a 2 bit value dependi=
ng
> >>> on the bus speed. All I2C controllers write into the same register.
> >>
> >> Which register?  Your devices do not share IO address space.
> >=20
> > mobileye,olb is a prop with a phandle to a syscon. That syscon contains
> > the register we are interested in.
>
> So exactly what Rob said... I don't understand why you have chosen to go
> with alias.

I had misunderstood Rob's original message. Now that I've done some
tests to use cells I get what was meant. I'd have a follow-up question.
What should the cells contain? I see two options:

 - phandle + I2C controller global index (from 0 thru 4). Then Linux
   (or other) driver know how to map that index to register + mask
   combo. ie:

      i2c2: i2c@500000 {
         compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
         reg =3D <0 0x500000 0x0 0x1000>;
         /* ... */
         mobileye,olb =3D <&olb 2>;
      };

 - phandle + register offset + mask. ie:

      i2c2: i2c@500000 {
         compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
         reg =3D <0 0x500000 0x0 0x1000>;
         /* ... */
         mobileye,olb =3D <&olb 0xB8 0x300>; /* phandle + offset + mask */
      };

I would have guessed the second approach was frown upon as DT aren't
meant to contain iomem offsets. However I'm seeing quite a few drivers
using this approach, and no driver doing the first approach. Maybe my
instinct isn't leading me the right way.

See those bindings that use the second approach. They were found because
their drivers use the syscon_regmap_lookup_by_phandle_args() function
call. I've added the file creation date to highlight recent bindings
(that hopefully are closer to the right way).
 - phy/starfive,jh7110-pcie-phy.yaml    2023-06-29T15:51:12+08:00
 - usb/starfive,jh7110-usb.yaml         2023-05-18T19:27:48+08:00
 - net/starfive,jh7110-dwmac.yaml       2023-04-17T18:02:49+08:00
 - phy/qcom,sc8280xp-qmp-pcie-phy.yaml  2022-11-05T15:59:34+01:00
 - sound/snps,designware-i2s.yaml       2022-07-01T20:22:49+01:00
 - pinctrl/canaan,k210-fpioa.yaml       2020-12-13T22:50:44+09:00
 - media/ti,cal.yaml                    2019-11-12T15:53:47+01:00

I know looking at existing drivers/bindings isn't the right way, but I
have no other frame of reference. That's why I'm asking for guidance on
this one.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

------------------------------------------------------------------------


