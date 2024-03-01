Return-Path: <linux-i2c+bounces-2091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7986DF8E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 11:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124701C22097
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 10:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A556BFC8;
	Fri,  1 Mar 2024 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="isAJPYxi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7526A352;
	Fri,  1 Mar 2024 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709289882; cv=none; b=uO0NLROmmpC3SctYWMR4MgtjAAuaTf2AR2yqvzkV6Ts+9XBqBh63txW+fdqlQeBbbNEdWDxlhxfrFC3zIByXyhMxrQQFuSvmg2mmq7asFWTP33AWds6d3bnAA4MAefa7Qga+iOPSJO3wHTwIQArl36nktKj1pB6aJfuFNZ13R8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709289882; c=relaxed/simple;
	bh=M60DamTk+REH8J6SvrzI6jskDDkauIzqreNeeM+j2TI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I3OLVW5M8oxJ5U4pL2ftcSHManAfT2OF8z6D8Q/qrcdP4DaGdgmy76db/3gYNDjpvOF4rTf4I+wrZiYLqK0TiO+EP9zgjqZepVMAGVxjRYH6aUdfHAaSMWSfnHCw3GwNYpiIJnKPnQbyKT3gMR2AmTTZOH9/OMIFA9A3PY4H7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=isAJPYxi; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5981360006;
	Fri,  1 Mar 2024 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709289878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M60DamTk+REH8J6SvrzI6jskDDkauIzqreNeeM+j2TI=;
	b=isAJPYxi2GQpNJRl0t1C8hv/6w84b2gIIcunVelFVD1+C7mfM17zyo9k9/BZNodzOV0qGg
	00wgxj8fvPMtzHVihsXGXGiUI22E7DmSH7oXpoH6edAcbK1eYIwPWg283AZd6NAVeB2l2A
	+PoXuw1veDy9+wSiggnJg46DZ9clJF5nxj3Ky+7PWRqexrVWevozcY2NK+Q5mH8U/AnvEN
	lhRJdESM0HwBsvjCyJvp/DU/Uff7N44QBSPhK6RJBwgp8vsa2IFfWUr5ZYc+kfvHRBqO/e
	MKb5LzbWbdX3QJ64m02rl57Rw3jVbBXchV4Ks13cKCoBgTicwUkFb2E5pcVsEg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Mar 2024 11:44:37 +0100
Message-Id: <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>,
 <linux-hwmon@vger.kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Guenter Roeck"
 <linux@roeck-us.net>, "Linus Walleij" <linus.walleij@linaro.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
 <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
 <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
In-Reply-To: <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 1, 2024 at 11:13 AM CET, Krzysztof Kozlowski wrote:
> On 01/03/2024 10:41, Th=C3=A9o Lebrun wrote:
> > Hello,
> >=20
> > On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
> >> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> >>> On 29/02/2024 19:10, Th=C3=A9o Lebrun wrote:
> >>>> Reference common hwmon schema which has the generic "label" property=
,
> >>>> parsed by Linux hwmon subsystem.
> >>>>
> >>>
> >>> Please do not mix independent patchsets. You create unneeded
> >>> dependencies blocking this patch. This patch depends on hwmon work, s=
o
> >>> it cannot go through different tree.
> >=20
> > I had to pick between this or dtbs_check failing on my DTS that uses a
> > label on temperature-sensor@48.
>
> I don't see how is that relevant. You can organize your branches as you
> wish, e.g. base one b4 branch on another and you will not have any warnin=
gs.

That is what I do, I however do not want mips-next to have errors when
running dtbs_check. Having dtbs_check return errors is not an issue?

> >>> If you insist to combine independent patches, then at least clearly
> >>> express merging strategy or dependency in patch changelog --- .
> >=20
> > I do not know how such indirect conflicts are usually resolved. Hwmon
> > can take it but MIPS might want to also take it to have valid DTS.
> >=20
> > Any advice?
>
> I don't see any conflict.

I shouldn't have called that a conflict, more like a dependency.

> >> For my part I have to say that I don't know what to do with it.
> >> Rob's robot reported errors, so I won't apply it, and I don't
> >> feel comfortable giving it an ack either because of those errors.
> >=20
> > Can reproduce the error when patch "dt-bindings: hwmon: add common
> > properties" is not applied. Cannot reproduce when patch is applied.
> > Commit d590900b62f0 on hwmon-next. Cannot reproduce with hwmon-next as
> > parent.
>
> Yeah, but we see the error reported and it means something is missing.

Yes, this series depends on "dt-bindings: hwmon: add common properties"
which the bot doesn't know it needs to apply.

Should I submit this patch independently and have my DTS be broken wrt
dtbs_check?

Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


