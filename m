Return-Path: <linux-i2c+bounces-2102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92C86E4BD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 155CA2886CE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDDF70AC0;
	Fri,  1 Mar 2024 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F13fjxPB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AA338DC3;
	Fri,  1 Mar 2024 15:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709308342; cv=none; b=B4+gEA4LSj3aNZ3/VJoueBF72d1h4cz5TnEoVc98bfvgSW3rDn/tH1672bB8xeCO9jMRvNwc4YZjfvq/luPzRqctSEhJlPqfoIgMjJKAZriVV+WUVYj9xCTe9yoQCzrKf5RNGLrt6OXtsd3oKzdEgJSCnFHYYhbKgcgSnOODuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709308342; c=relaxed/simple;
	bh=qEc3vNB2eDPfKsZPhlZr12jl/0AGDXOfDLnzJ+F4vaY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hr9oJ9llM5vB6OyGjzGYxu3Iv+/Z6J1BslQqgXyq77hEz+ooCivm5nKpXj75vEwuMhRN+PhR83TfRNtllyqu/JPHvENYY37CBZ87U+41LA2qMY4pE1u/hYHYU3f3UpngrNcUCF6F5e8xjrLYRWlSrG7ZFu0NQXhNhg8LJaBHtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F13fjxPB; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6786240005;
	Fri,  1 Mar 2024 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709308331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEc3vNB2eDPfKsZPhlZr12jl/0AGDXOfDLnzJ+F4vaY=;
	b=F13fjxPBFlTyjhUBPwi3qtwojQ4GFhwzwLexIq5JI8MevLOu2PZxIQzse+zygsHRLEuTA5
	RBV3Db+CFCyzIXWCB55Fzb/W0vFj1hhNSN7gC1VeeEgoLDObF+m3ptZ1u6Wu5DwX1t5sC3
	e4aRBOJTmAeg7i0piHrTf8STU9z/DZpMikTTCr1y8QqQLwVeHXlcTlCZMJHfWJcAejc/gz
	aY4uCCqcsa2Js+xVsf2NqgRnggFvRmMNQOCJ/LCCrwys1jx1t8k0A8OiKCTcNAA6ZDml70
	6MulpikfN6JO30Ls5GLyNu2mYdkzbqnnH1m9tyNCi2gqQeoCvP7ZZAvEY22HWw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Mar 2024 16:52:07 +0100
Message-Id: <CZIJ8D23O5E1.79MDD3DCHPI8@bootlin.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Guenter Roeck"
 <linux@roeck-us.net>, "Linus Walleij" <linus.walleij@linaro.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>,
 <linux-hwmon@vger.kernel.org>
To: "Rob Herring" <robh@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
 <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
 <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
 <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
 <20240301153534.GA2144041-robh@kernel.org>
In-Reply-To: <20240301153534.GA2144041-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 1, 2024 at 4:35 PM CET, Rob Herring wrote:
> On Fri, Mar 01, 2024 at 11:44:37AM +0100, Th=C3=A9o Lebrun wrote:
> > Hello,
> >=20
> > On Fri Mar 1, 2024 at 11:13 AM CET, Krzysztof Kozlowski wrote:
> > > On 01/03/2024 10:41, Th=C3=A9o Lebrun wrote:
> > > > Hello,
> > > >=20
> > > > On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
> > > >> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> > > >>> On 29/02/2024 19:10, Th=C3=A9o Lebrun wrote:
> > > >>>> Reference common hwmon schema which has the generic "label" prop=
erty,
> > > >>>> parsed by Linux hwmon subsystem.
> > > >>>>
> > > >>>
> > > >>> Please do not mix independent patchsets. You create unneeded
> > > >>> dependencies blocking this patch. This patch depends on hwmon wor=
k, so
> > > >>> it cannot go through different tree.
> > > >=20
> > > > I had to pick between this or dtbs_check failing on my DTS that use=
s a
> > > > label on temperature-sensor@48.
> > >
> > > I don't see how is that relevant. You can organize your branches as y=
ou
> > > wish, e.g. base one b4 branch on another and you will not have any wa=
rnings.
> >=20
> > That is what I do, I however do not want mips-next to have errors when
> > running dtbs_check. Having dtbs_check return errors is not an issue?
>
> That's a good goal, but difficult to achieve as you can see. Given=20
> dtbs_check in general has tons of warnings already, we currently don't=20
> worry about more warnings in specific branches. We just look at mainline=
=20
> and linux-next. And for that it's still so many, I'm just looking at=20
> general trends. It runs daily here[1].

Here's my opportunity to ask a question I've had for a while: do you
have a way to filter out dtbs that are known to be bad actors (ie have
many many warnings)? Maybe a list of platforms you talk about below
that aim at zero warnings?

Another way to ask this: what would be a good default DT_SCHEMA_FILES
value? Not filtering leads to way too many errors.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


