Return-Path: <linux-i2c+bounces-2054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7786C542
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 10:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8075528A164
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB8C5916C;
	Thu, 29 Feb 2024 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dYHy0nIT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9D5B690;
	Thu, 29 Feb 2024 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199105; cv=none; b=rUtmpdYVDGRa76jbaY2dVR8ssM3Ovqc/WX6iMlnwYGwt8/gOUKIBRVryxJxcZ7od2GwceMfhIFgv6lkeSHT1ICrRiJtf9+yvuEcoNYCLZW+4fGSWRrj0p/Qn4rCF+2ocZpC560+RtmzHnO4sybD7ax8NI21cwyegvdAdlK13z3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199105; c=relaxed/simple;
	bh=PWzrG6VIjZLBT76F+KgpRQIxbWi9zLp+1US14SEgOzU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=CHsobcp+kAxAwUCErDBSJ+7hJqIuMjYUSQrlD25PBzboafHWL+E3NRxiQufgj81Iq8bx/Ck+QIuUIlSem6rF1++SF6oCjrE4G7bjbtaFoBKU1KAO/dtOrdqJElPFg3svSlqORS681+MaGONkVtyJqlY/kkrDCgoIVnc4wAlTy7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dYHy0nIT; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D3D7E0011;
	Thu, 29 Feb 2024 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709199101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWzrG6VIjZLBT76F+KgpRQIxbWi9zLp+1US14SEgOzU=;
	b=dYHy0nITyeQv9SDvJSf0KHiSFGyyJMx6bJY1VW+IopaZlmZOfJZBEwXe1kjXJZphSb7HFy
	22+t/AXW5/rCaE0+feMCcC8OksOOb+K70PrnlcJX+ooZHUIl0Fju33omWcSX5njKkrSgIC
	Id2wFpqxrJnaF/TDMXZ8nZfhanGK4j6XoEmag3stdmX8KamAQCJka+XurtxwGh0IVPGw3c
	vz+j98XUXdQNXd0I295OsoBEuoC8vOE7vPu4jKpF/U3u02d+/UX80cuGwAiwBrglfSS1CT
	aO+n9sgU9ywBxuHhCWq6eAhT3sz2b7DYCbgu+CMyHFKhNkZXBE0U+pmSys/64w==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 10:31:39 +0100
Message-Id: <CZHGIIQPJ6KU.ZY00CXS7MHA7@bootlin.com>
To: "Wolfram Sang" <wsa@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 09/13] i2c: nomadik: fetch timeout-usecs property from
 devicetree
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
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>
 <Zd3SJMBp23ybgdsJ@shikoro> <CZFWIJE9978P.G3TZC2YIUST9@bootlin.com>
 <Zd8PtLsUc0G8KR97@shikoro> <CZGR61YHK1DJ.SVRE78BJ9WB4@bootlin.com>
 <ZeBNbx6PDGk8xqGX@shikoro>
In-Reply-To: <ZeBNbx6PDGk8xqGX@shikoro>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Thu Feb 29, 2024 at 10:25 AM CET, Wolfram Sang wrote:
> > The alternative is that I keep going with a new revision of i2c-nomadik
> > that manually parses the prop. It'll be refactored if/when the I2C core
> > provides a better way to access the value. Is that OK?
>
> That wouldn't have helped because there is still no user in-kernel of
> that property, i.e. no DTS file with that property. But I just realized
> that I need to convert i2c-mpc to avoid a deprecated binding, so we have
> a user there. Lucky you ;)
>
> I'll try to get the series done today.

Lucky me indeed!

I just thought about it but I don't mind using the property in the eval
board DTS. The default 200ms timeout makes no sense for us. Using a
default of a few ms would be more sensible and make us the second user
of the prop.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


