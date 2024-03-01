Return-Path: <linux-i2c+bounces-2099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0FF86E47C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1A11C20ECE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA8B6F529;
	Fri,  1 Mar 2024 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="engGmUkK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820C1C33;
	Fri,  1 Mar 2024 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307337; cv=none; b=HYkW9tvIcbqFZFLiKrSZ0z3C1kA26cJPstC3FQKeLhVTLmJziB+JWugXjnNsUoebQ8Pn+D0vdYjCJZV0ffZixSTc6sKsPnbYAIVMGwQzgt7k+H6TM6zSkMhbrIuNwrFgbIjZfVCNK1ltvj4gzIpJ6YQ0e8vvswPkWUwa5PYk4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307337; c=relaxed/simple;
	bh=M529ZWz6bYFuuGmZpJLVgAUP6VgulNwbi5i3qlbkET4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX0V9E+/WFlwn3EBFGHWXMkqp5ESxYSW3FJhOGq/4bVNrMADBKSvPVO0hZ+w/oFKf30ZOFVyU1hkaof923DHe/S8VHKs9OrTVdrv87AP3/l2w6lN3RCaIm+310C7LzJpew2ba+QHR241EsYAWXyMP0mkxzBTJxKBry2iwQCUDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=engGmUkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BCEC433F1;
	Fri,  1 Mar 2024 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709307336;
	bh=M529ZWz6bYFuuGmZpJLVgAUP6VgulNwbi5i3qlbkET4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=engGmUkK3+QyCySd6cnHaoesNC4acJ3alTWL9hkST6hCVPUk6jx/wdlKLPnA4dMRT
	 OqgQzVn2cxNbgjzrGxAzAM/G0Q2U5mSCnX3cGzzAVKPSaiMbwnp1at/ewtulAVi49k
	 IOUSLAAoFtHhpXnpOFM32Zwv0bf6pVapLzd+1FoCRLxcWj/btjhW4rkXK++PVGaxDr
	 QuhaFLQjLZyhXcaeREGlxgBfChASmuIy0TcoVAva9mfGQpPYYVWwaWR+QNYavWPNKJ
	 7dm7RcciMFp14LYGpnir5lb59cHkkeJV2ctLTiy+VzUVkJoykR1TWNtyzE/IvoGg9H
	 OTZ4wZV2OigtQ==
Date: Fri, 1 Mar 2024 09:35:34 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Message-ID: <20240301153534.GA2144041-robh@kernel.org>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
 <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
 <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
 <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>

On Fri, Mar 01, 2024 at 11:44:37AM +0100, Théo Lebrun wrote:
> Hello,
> 
> On Fri Mar 1, 2024 at 11:13 AM CET, Krzysztof Kozlowski wrote:
> > On 01/03/2024 10:41, Théo Lebrun wrote:
> > > Hello,
> > > 
> > > On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
> > >> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> > >>> On 29/02/2024 19:10, Théo Lebrun wrote:
> > >>>> Reference common hwmon schema which has the generic "label" property,
> > >>>> parsed by Linux hwmon subsystem.
> > >>>>
> > >>>
> > >>> Please do not mix independent patchsets. You create unneeded
> > >>> dependencies blocking this patch. This patch depends on hwmon work, so
> > >>> it cannot go through different tree.
> > > 
> > > I had to pick between this or dtbs_check failing on my DTS that uses a
> > > label on temperature-sensor@48.
> >
> > I don't see how is that relevant. You can organize your branches as you
> > wish, e.g. base one b4 branch on another and you will not have any warnings.
> 
> That is what I do, I however do not want mips-next to have errors when
> running dtbs_check. Having dtbs_check return errors is not an issue?

That's a good goal, but difficult to achieve as you can see. Given 
dtbs_check in general has tons of warnings already, we currently don't 
worry about more warnings in specific branches. We just look at mainline 
and linux-next. And for that it's still so many, I'm just looking at 
general trends. It runs daily here[1].

As we get more platforms trying to stay at zero warnings, then we'll 
need to revisit this. I imagine that will mean all schemas have to go in 
1 branch with acks from subsystem maintainers. That's the opposite of 
what we do now. And then .dts branches will have to merge in the schema 
branch as needed. There are some checks (make dt_compatible_check) to 
for drivers vs. the schemas, so we'd have the same issue with 
intermittent warnings. But the drivers should be more decoupled from the 
schemas than the dts files.

Rob

[1] https://gitlab.com/robherring/linux-dt/-/jobs

