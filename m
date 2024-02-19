Return-Path: <linux-i2c+bounces-1869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0885A5D3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5521C21DBD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED8374F5;
	Mon, 19 Feb 2024 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wq4VfRRh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FA381C2;
	Mon, 19 Feb 2024 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352578; cv=none; b=Fr45ECYtWfM5wfTwt1LJhkwRpcpdeOx9nwhhJJg4hVdQkhfWx9suT9tFVhf02ICaOCGeLeSbSB8RTsZm+sNAvNcUFHdQoaJVAuC5ZqBhhpbMqnewYBt75Wk/pQeRISLJQn9dyM4WsbBynukoCEFptohh06MmbAPTndLhUMSgvoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352578; c=relaxed/simple;
	bh=TgZIetNidKZZum2lofaITucvNOdC3VO2k45kly53r9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GlS51P0M8WGqxrpW5nkTczX0LOskMkWeNuYtnQkc035rdcY4u62AKzTXBiocKBy/MOKp3LLxxayI8qBNRzLZfd7YqS0bbGbd1ztU1Zr60bcvlL3tjm9EWmGfH1AvUF8FSZgSBmi3ozZhRWZYuad6gw7+r5rjEdDyhEwCJQqacDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wq4VfRRh; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAFB41BF207;
	Mon, 19 Feb 2024 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708352572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMECSj8MFsTFMbFx4UOjwlLmrEMaulzJW9DpcgMGVBY=;
	b=Wq4VfRRh8X//3SGa71PdK5V4k51owTqe+daTj255nCc4KvEBONJNncCV7jaHHMsjWnn64W
	wxQOgEtKPU9r6UFXfCWHit4EPPh4JrjWuGnD2wmIV9VcDbVZfP49G+usNSCdZNonlIfwck
	jBSA00UKLkGx4LBMtReNPLL1SO7CP/c5yhN7KXDasyifdP1WlvgWqdZFKSfa2VEwfxdZ85
	txh2NivPs1EExNpE7t8uBtqmhez8g3QwWyr4HSNmUWza8f/5cLbLJLyEiLlHKnx+EZCUDY
	I+fP0KRn+xWEOq/ySEM1gFIg++JxPuwyGvA8ChdcTmdYn5irkJX48pvgL8j+Mg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 15:22:51 +0100
Message-Id: <CZ94G0Z1KZEJ.1S56H5MK9T1RU@bootlin.com>
Subject: Re: [PATCH 00/13] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>, "Guenter
 Roeck" <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <CACRpkdbmQLAL-W_2y_T4sBJtZN-DRXMsYhODP=sXSJ4ysUKpxQ@mail.gmail.com>
In-Reply-To: <CACRpkdbmQLAL-W_2y_T4sBJtZN-DRXMsYhODP=sXSJ4ysUKpxQ@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:11 PM CET, Linus Walleij wrote:
> On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
> >  - Add a new compatible to support Mobileye EyeQ5 which uses the same I=
P
> >    block as Nomadik.
>
> Sweet! I'm amazed ST Micro licensed this "ARM PrimeCell" to Mobileye, but
> it's a well tested IP and used in eg ST automotive SoC:s so it's a solid
> product.
>
> It feels worth it for all the time I have put into maintaining it, finall=
y some
> real users again! :)

Using the existing Nomadik drivers with the AMBA bus infrastructure on a
non-ARM platform and having it work as-is made our day here at Bootlin.
We are indeed grateful for your work maintaining this platform!

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

------------------------------------------------------------------------


