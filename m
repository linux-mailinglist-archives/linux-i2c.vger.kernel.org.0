Return-Path: <linux-i2c+bounces-2048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E4486B09B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 14:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA4E1F28C10
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D7E15958B;
	Wed, 28 Feb 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z7Rh/B6k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158F14F988;
	Wed, 28 Feb 2024 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127601; cv=none; b=rJcn/0er7vSc2Cp1pA1o7lD08TjwJaW9vnPV81mn1Fjxt8GuGfSyKER8fayM0mxXiDUtRnbfJvduAdHhWPqEudr00dRotsWP4v6DAjk7fmaacdN1fVToKmPGj9YK+h8nkVdPoJcj8nBx58BTeOhODkeVj0xuciySHry8THE3f4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127601; c=relaxed/simple;
	bh=wxuZ499Vy0EkhZWYdYc3hCPlt7+ctQ7VWJ6Eq8qoX9U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=inN3jjBB/5Hd7C1U27v8XgYIzU51zSHKHecyyQBJpEo561d7La3UNHTJ+OkSWYbSEBmxi3NS/L9jmUrz5XaS2hDwibHIyfuDhkJCv7fkID0WR6AhMEDN07MgqjtrozYQ94YOWWwFHS60OspPx1OiwJ2VMDwtdG8n6QJElfGTBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z7Rh/B6k; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A84E7240007;
	Wed, 28 Feb 2024 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709127596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxuZ499Vy0EkhZWYdYc3hCPlt7+ctQ7VWJ6Eq8qoX9U=;
	b=Z7Rh/B6kuM6WldhJ4QS9k5R2IQ6aNTzvNHxjNZW22Odvr3/2Hz4hjy5SYRAwnBaFGqKZ4X
	MCQJnzDwiEvjhtOSnxzZiXYSYscs3yDr6/pPAvQTlUDIaSlaVHyDDJNHNqvq4+aERWPTsv
	/vnjp8WSCrCdRbztk5W7qbfLeE5yWOk+kVrTKUCjnWCBwJ+0HhjpnmecX0xZTkj1549cVO
	2TrZYYa9Jc999Gqr5dRP2tFaGmfIc5Xzt/kzg0+yz1eOqIi6uVpZR1zByKHbGXgqSkQohu
	zDutucZVLmsX5aThLnG5n0kBBQ9N81QOvotmiElbRfrE+/D6vzG452FzyiJ3qw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Feb 2024 14:39:55 +0100
Message-Id: <CZGR61YHK1DJ.SVRE78BJ9WB4@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Wolfram Sang" <wsa@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 09/13] i2c: nomadik: fetch timeout-usecs property from
 devicetree
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>
 <Zd3SJMBp23ybgdsJ@shikoro> <CZFWIJE9978P.G3TZC2YIUST9@bootlin.com>
 <Zd8PtLsUc0G8KR97@shikoro>
In-Reply-To: <Zd8PtLsUc0G8KR97@shikoro>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Wolfram,

On Wed Feb 28, 2024 at 11:49 AM CET, Wolfram Sang wrote:
> > That sounds good. I have not used this prop in the DTS as it does not
> > make much sense for an eval board. The target is production boards.
>
> ...
>
> > My upcoming question is how to move forward on this series. I can do th=
e
> > patch to i2c_parse_fw_timings() in the next revision. That way it gets
> > added alongside the first user of this feature. Would it work for you?
>
> Hmmm, to be honest I have a bit of an issue with the 'no user' problem.
> There is a driver which uses this feature, okay. But there is no
> upstream hardware which uses this driver with this new feature. This
> makes maintaining harder ("Who uses this feature?" - "Someone" - "How do
> they use it? Can we modify it?" - "Dunno").

The alternative is that I keep going with a new revision of i2c-nomadik
that manually parses the prop. It'll be refactored if/when the I2C core
provides a better way to access the value. Is that OK?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


