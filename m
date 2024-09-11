Return-Path: <linux-i2c+bounces-6564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9019755DD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9141C226CD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EF52AE90;
	Wed, 11 Sep 2024 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuRVAhNq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297D27713;
	Wed, 11 Sep 2024 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065934; cv=none; b=I/AxTagOVE2P5b8pchf7pPRvZ3LJwDRMf5OVpn6J5oZdKPJVdj3c+7Se6Qq/Xeq3TgzjOVPMNsArXWPvCV0TvkLSOo2Qko6UE3O3xAJjjYWQfu3ii8fU5E/lu0zbzwGPhX4rUMvx21CF+ncEsp7OYJMfaRTvkWIae1ZtBFTfIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065934; c=relaxed/simple;
	bh=z7r9sC95kQfnORF/MXv5p7BPRF1PGeUCRk6SxIm93dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSnaJ1ZxCmLQhUmN6t6BdpKv5detD1uGRLajVEUcpDKm73QAtdNM3TFb0ndckUpxTwJAy8BfTZIyJ3K75B7mleW7Tjw13XoewikAkD9cSWeYWzFzZ4SUrPO8+fmcYN3hutHkp41Z3mSId0GMFqhfA5woWzn4uHlVtaMQ+AoMKro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuRVAhNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5072C4CEC0;
	Wed, 11 Sep 2024 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726065933;
	bh=z7r9sC95kQfnORF/MXv5p7BPRF1PGeUCRk6SxIm93dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuRVAhNq/du/429/es1wHIju+QoyfEMgnVRRXB2SB3R1YYZmRvumNInoQhl+EGh3F
	 aAy0rf7udbsPm/01hRaQlVIyr9fyTx2Fa7G9D7tw5I367TaTnjFrVrKCalHVl/pOwj
	 0ebQ95MJH5jDueYktqOynfCCcumX+UZOnHGDmL4y6w9i1dgvRWZm0VshlvmoYexsVw
	 kt7i8n4iMFOmaHe8EEhsR49Q5LaXOS8IwIbq5LV/Wp7JDGm7mXrIUbSNbRHOoWXwB3
	 UUZzbk64u6b9HY/3RUN/gOsfcywF+u9NimnDVceh10mH4AdOInQmv5VsxJGUNhShHl
	 tmkzcuxcze7dA==
Date: Wed, 11 Sep 2024 09:45:32 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: add ti tps25990
 documentation
Message-ID: <20240911144532.GA154835-robh@kernel.org>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-1-39b37e43e795@baylibre.com>
 <3efbzcys4762rhx2h2cbhqvi6dgik7pfrxcziccdko34pb5z54@joodcym6c3s4>
 <1jzfofsvmh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jzfofsvmh.fsf@starbuckisacylon.baylibre.com>

gOn Tue, Sep 10, 2024 at 11:31:18AM +0200, Jerome Brunet wrote:
> On Tue 10 Sep 2024 at 09:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > On Mon, Sep 09, 2024 at 05:39:03PM +0200, Jerome Brunet wrote:
> >> Add DT binding documentation for the Texas Instruments TPS25990 eFuse
> >> 
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 73 ++++++++++++++++++++++
> >>  1 file changed, 73 insertions(+)
> >>
> >
> > A nit, subject: drop second/last, redundant "documentation". The
> > "dt-bindings" prefix is already stating that these are bindings/docs.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> >
> >> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> >> new file mode 100644
> >> index 000000000000..e717942b3598
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> >> @@ -0,0 +1,73 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +
> >
> > Drop blank line.
> >
> >> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments TPS25990 Stackable eFuse
> >> +
> >> +maintainers:
> >> +  - Jerome Brunet <jbrunet@baylibre.com>
> >> +
> >> +description: |
> >
> > Do not need '|' unless you need to preserve formatting.
> >
> >> +  The TI TPS25990 is an integrated, high-current circuit
> >> +  protection and power management device with PMBUS interface

And wrap at 80.

> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: ti,tps25990
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  ti,rimon-milli-ohms:
> >> +    description:
> >> +      milli Ohms value of the resistance installed between the Imon pin
> >> +      and the ground reference.
> >
> > Ohms is not enough? We don't have mOhm in property units.
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
> >
> 
> Same discussion as we've had on the driver change.
> At the moment Ohms is enough for the cases I've seen.
> 
> Will it be, not sure.
> Using mOhms is' way to avoid "S**t, R is 80.2 Ohms, I
> need another digit to not loose precision " kind of situation and
> introduce a second property just for that.
> 
> No idea if Rimon will get that low. Probably not.
> 
> I'll switch to Ohms.

You can can use "-micro-ohms" too. The reason we don't have every 
possible unit is so we have everyone picking their own.

Rob

