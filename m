Return-Path: <linux-i2c+bounces-9594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F59A463E8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 15:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A6E3ADE70
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 14:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B33222562;
	Wed, 26 Feb 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLXaNz+9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9D2222A5;
	Wed, 26 Feb 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581975; cv=none; b=FerRNsvwv6bb8fpA5keIoyIJl/4N9W3N4JcT2f8FP/zazUr8OgHS8H4VgKLmn8gaEIi3avBUIEau//HGSlvmEw7ibdDT3gRddGpkaTDVDvAspuvcyP95/FDlfP1mYqxOWxww94Wwpp43DFeFmnnMrAwpN52syhPLeyESd3QITRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581975; c=relaxed/simple;
	bh=fSYcTa92gedbLZbsaWA/digY3oZKW/7+btr68YyooGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tev0DJpoB6LcgndKSKjHvEQh5KFcMaAdr60XG10v6uks2Z33kwVBgdMvjj94p7M6rNOtrS7+LlX9Q7FdooDFbQNvJ8eViKy2NygW5UnJefkno6O4A50T+VT236T0zOGNiFzihVWdJOfrqK5D8VIRLH7c5Q3rHyx44HFZcpLWcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLXaNz+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72363C4CED6;
	Wed, 26 Feb 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581973;
	bh=fSYcTa92gedbLZbsaWA/digY3oZKW/7+btr68YyooGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLXaNz+9fiGhVU/Os3/4wVX9iVEd0qlx8laIAWKvboTDdkQ+FlZxUOorv7344CVQz
	 hBxBMN5GCKfdDFTRQxFE/b3VTQblG0fHnQX9dPHAOvq3ucnSdOFkh9ITuh+1Zo4FSP
	 eAYOhUyqTNWGTzNJ3I5bKtDpUpW/p7aHCDRiNgyoOXkLLPUA/bB9KKtNgEULWNq65S
	 hVCkbg8ArGA4TEqIX/qOLr7fKAo00W9IErursQtj75YezqnlR2uOkKRdUxndxhSLJC
	 3enBX1Bb0h509rgLd8IgPkvSY3TOx9q8Cjo2ou2hNSiqDFVMdlLITOl8NRd5SZrHos
	 kCdL56lE2P0rA==
Date: Wed, 26 Feb 2025 08:59:31 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <20250226145931.GA2314060-robh@kernel.org>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>

On Wed, Feb 26, 2025 at 09:20:40AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 09:01:13PM +0800, Cedric Encarnacion wrote:
> > Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> > Regulator.
> > 
> > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > ---
> >  .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  2 files changed, 71 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LT3074 voltage regulator
> > +
> > +maintainers:
> > +  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > +
> > +description: |
> > +  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
> > +  response linear regulator. It allows telemetry for input/output voltage,
> > +  output current and temperature through the PMBus serial interface.
> > +
> > +  Datasheet:
> > +    https://www.analog.com/en/products/lt3074.html
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,lt3074
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  regulators:
> > +    type: object
> > +    description: |
> > +      list of regulators provided by this controller.
> 
> You have only one regulator, so drop the "regulators". vout could be
> here, but since you do not have any other resources, I doubt it stands
> on its own either. This is even visible in your DTS - you named the
> device as regulator, so logically this is the regulator. Regulator does
> not have regulators (otherwise they could also have regulators... so
> triple regulator).
> 
> hwmon code might need some changes, but that's not really relevant for
> proper hardware description.

Normally, I would agree, but it seems generic pmbus code expects this 
structure. This just came up with changing another binding maintained by 
'Not Me' to follow this structure. We're stuck with the existing way, so 
I don't know that it is worth supporting 2 ways forever. OTOH, is it 
guaranteed that these devices will only ever be pmbus devices or that 
other regulator devices which are not handled as pmbus devices currently 
will be in the future. If so, more flexibility in the bindings will be 
needed.

Rob

