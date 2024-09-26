Return-Path: <linux-i2c+bounces-7021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B96986DF3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 09:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047A11F22CD8
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 07:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC788192B76;
	Thu, 26 Sep 2024 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZ3qH6lF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E79518FDA6;
	Thu, 26 Sep 2024 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336760; cv=none; b=gOAd82Vik6vF4r+yQjl9xDV8L1IvtDjnYgTy6TDziMGbDlLIytdp98Nj7656UuSMde+4axN6RYkGbwBJyXYPi7r1n+E4MqyQBl7uL4XEq0Aq6EMmJoGy7AAMFauT5elBHyV76BS25FAr8bn200vicf2FQGGVobIhSCbrzTuum9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336760; c=relaxed/simple;
	bh=7BD1DRr3dEN2fGhGJbApcotfC5pMbfC3fKHmayjAYZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsykh9SpwZiX3N8emBQQjoHgZx4ranucr5zN4oJrpZi+5RWFx0lrhiScLWrIa+jrMKOCcyelg1hZLg+Ho8anGA+9yUk5tH2xtufcv2fh3bIsSw1Im4Vg32z3CcjOi9oIUpPtAZbPY7E2J5tgPt5gI2CllX6VEq9mpwLlaQkQ+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZ3qH6lF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A36C4CEC5;
	Thu, 26 Sep 2024 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727336760;
	bh=7BD1DRr3dEN2fGhGJbApcotfC5pMbfC3fKHmayjAYZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZ3qH6lFGWX+ox7NsmVd37/9/mBj4ZChRc31dgUtUJpQ9cOMVHHDWAv1EJMJKvCGA
	 PI6LFetip+CDnDhD1g8ElvbTT9m1Oed8StSxqnpwtfqE3npWgLDq3j9KhTMLsZbv7f
	 zRHLSLP8sh7zc8rZPmAGYYqCNkkb30o0fd6XRtJutHYml/x0IjZXmrFV6lxrI+Dbz3
	 sm5fktsJXNJyTik5UXwlyQPHVxANx8ZLZPHaIWW7zuJdj8lOBhoWyMYscRO9X0AnJr
	 EXyfZSFqNdN9If/UCewJsPl1x+xgixAlckwwEQ6UElL+374FLYmLJob+qpsc/ENc6s
	 C5fMZWHZt2vGA==
Date: Thu, 26 Sep 2024 08:45:54 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <20240926074554.GH7545@google.com>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-4-chris.packham@alliedtelesis.co.nz>
 <4pxungrwkjusdalmjbwvqcpjwmbsb7hw4452zqlto6sq54vfa6@psz3gge4uwy7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4pxungrwkjusdalmjbwvqcpjwmbsb7hw4452zqlto6sq54vfa6@psz3gge4uwy7>

Intentional top-post.

These replies all came in without the original mail.

Does anyone have any idea why that would have been?

On Thu, 26 Sep 2024, Krzysztof Kozlowski wrote:

> On Thu, Sep 26, 2024 at 09:58:44AM +1200, Chris Packham wrote:
> > Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> > family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> > have the same SoC differ in the Ethernet switch/SERDES arrangement.
> > 
> > Currently the only supported features are the syscon-reboot and i2c
> > controllers. The syscon-reboot is needed to be able to reboot the board.
> > The I2C controllers are slightly unusual because they each own an SCL
> > pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
> > common SDA pins which can be assigned to either controller (but not
> > both).
> > 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> > 
> > Notes:
> >     Changes in v5:
> >       I've combined the two series I had in flight so this is the
> >       combination of adding the switch syscon, the reboot and i2c. It makes
> >       the changelog a bit meaningless so I've dropped the earlier
> >       commentary.
> >     
> >       As requested I've put a more complete example in the main
> >       rtl9300-switch.yaml.
> >     
> >       I've kept rtl9300-i2c.yaml separate for now but link to it with a $ref
> >       from rtl9300-switch.yaml to reduce clutter. The example in
> >       rtl9300-i2c.yaml is technically duplicating part of the example from
> >       rtl9300-switch.yaml but I feel it's nice to be able to see the example
> >       next to where the properties are defined.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

-- 
Lee Jones [李琼斯]

