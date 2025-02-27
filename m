Return-Path: <linux-i2c+bounces-9606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2901A47841
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 09:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D41171818
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 08:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04EB22259F;
	Thu, 27 Feb 2025 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfrG/Vr4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C38226551;
	Thu, 27 Feb 2025 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646227; cv=none; b=YnO+WglicHoRED3/BOvSOvgWIOIs3qX0dcIaeO0/NVdf83f84SdDT3EF0jig7rx5i8XfolcU7lTxuvcTkCPWmp1veqmM1+m2XI3PA+SToc+8TrW+X7H4Re7zwqZwisHEpgCofLZs3m1dTQINfQShk5telRtC9J1r6/zhXX+vQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646227; c=relaxed/simple;
	bh=EE3knrHH8YT3ZkzHF6A+tlFuX23SQHUMMiwsbGXbq+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv9+1YWlXVFG8vWnaLO4kmUbZ3A91nNRmb2UjUAGrmmR/F8IYw4W6d1l4PpVntq13/vgtYYNvJgQU45kfeSmmpy5a45K+F89adbQGH3RCCIzlXh/UKqp2kQNQxNAmFuMtGxbq7gYYaX2yUTw/BbcFV6ZkUBAfv4TrBOtQ+06sPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfrG/Vr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F10C4CEDD;
	Thu, 27 Feb 2025 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740646227;
	bh=EE3knrHH8YT3ZkzHF6A+tlFuX23SQHUMMiwsbGXbq+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfrG/Vr40qTIY21lVpJ4sUtXo/+HrBEhlXEK+jtOK2rQ28R7KRABEh4iej9OIYaEe
	 Xw3SQegimknFRuuE8ls1DjHg1agt/IytsqPUVQ6SFEiW2RGHCVBy7GP7e3u+j2S00e
	 evqnHZFaWiEeoFNvtDeB+b6v3EeydfwPQmJkZODct3nB54D+ZIlXrfJ0HGgZS8zx67
	 Kn1YPsXB/YH9sf3mMEXTvLYy55uM7ZG0YGjOPui0Pxz7uxZGAzS/Jpl60eYg2YlOaU
	 H4spQcj+fSJ8ewu1cONdhPSBntYrJp3LesznJQ6GmITs7g7oVtG7uUmpucD8Omtezy
	 VI9qsCnYmJVQw==
Date: Thu, 27 Feb 2025 09:50:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, 
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>

On Wed, Feb 26, 2025 at 11:17:48AM -0800, Guenter Roeck wrote:
> On 2/26/25 06:59, Rob Herring wrote:
> > On Wed, Feb 26, 2025 at 09:20:40AM +0100, Krzysztof Kozlowski wrote:
> > > On Tue, Feb 25, 2025 at 09:01:13PM +0800, Cedric Encarnacion wrote:
> > > > Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> > > > Regulator.
> > > > 
> > > > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > > > ---
> > > >   .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
> > > >   MAINTAINERS                                        |  7 +++
> > > >   2 files changed, 71 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> > > > @@ -0,0 +1,64 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analog Devices LT3074 voltage regulator
> > > > +
> > > > +maintainers:
> > > > +  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > > > +
> > > > +description: |
> > > > +  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
> > > > +  response linear regulator. It allows telemetry for input/output voltage,
> > > > +  output current and temperature through the PMBus serial interface.
> > > > +
> > > > +  Datasheet:
> > > > +    https://www.analog.com/en/products/lt3074.html
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - adi,lt3074
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  regulators:
> > > > +    type: object
> > > > +    description: |
> > > > +      list of regulators provided by this controller.
> > > 
> > > You have only one regulator, so drop the "regulators". vout could be
> > > here, but since you do not have any other resources, I doubt it stands
> > > on its own either. This is even visible in your DTS - you named the
> > > device as regulator, so logically this is the regulator. Regulator does
> > > not have regulators (otherwise they could also have regulators... so
> > > triple regulator).
> > > 
> > > hwmon code might need some changes, but that's not really relevant for
> > > proper hardware description.
> > 
> > Normally, I would agree, but it seems generic pmbus code expects this
> > structure. This just came up with changing another binding maintained by
> > 'Not Me' to follow this structure. We're stuck with the existing way, so
> > I don't know that it is worth supporting 2 ways forever. OTOH, is it
> > guaranteed that these devices will only ever be pmbus devices or that
> > other regulator devices which are not handled as pmbus devices currently
> > will be in the future. If so, more flexibility in the bindings will be
> > needed.
> > 
> 
> I would appreciate if someone would explain to me what the problems with
> the current PMBus code actually are. I have seen several comments claiming

Not exactly a problem but missing feature. pmbus code (at least one of
macros I looked at) expects regulator node and some sort of child of it
(vout), while such simple devices should be:

regulator {
	compatible = "adi,lt3074";
	regulator-name = "vout";
	regulator-min-microvolt = "100000";
	regulator-max-microvolt = "100000";
};

so without any of regulators and regulators/vout subnodes.

> that the code should be changed, but I have no idea what the expected changes
> actually are or, in other words, what the PMBus code should be doing
> differently.

I did not investigate much into pmbus code, but this might be as simple
as accepting arguments for .of_match and .regulators_node and then
accepting NULLs as them as well. Or a new macro which assigns NULLs
there.

Regulator core handles .regulators_node=NULL already.

Best regards,
Krzysztof


