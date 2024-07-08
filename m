Return-Path: <linux-i2c+bounces-4778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBF92AC3B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 00:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D6D1F22F34
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 22:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCFE14EC5E;
	Mon,  8 Jul 2024 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI0wlKY8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95895381BE;
	Mon,  8 Jul 2024 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720478725; cv=none; b=LN72gRqSBOjH1RiNsPNDpl2MfPpE1QGiTP6pzWy5f7zlGAfdzYJW2G14eBpbqE5mFVyg+LHKWTNv9QnGjqN7dmC9dL0BCXHx1q3wkz68yp3MYh/oB6fV4se627Hv+/Yqs2vdABNO+6rsJPbm28VhLuLru2I7+BcelqSf0nLPEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720478725; c=relaxed/simple;
	bh=7YHz7y+T/d/K9XBn3bDo+/LX40FSv7Jm/vdn58aKRkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUTNLCKhDZy2gcZomBzU1tRbDElfm3Tj5jeKcddMWVatTKTjgvvStzkOEQAWOjzw8Y6Vo8zvb4loRIov24B88hD0pASS6aiXKHNU0GbRLARlWloVR879ESTOeQG7sjOpnp7ePSJNKz/isaoHyNcU4FIplk+7XQl905CAClVbrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI0wlKY8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14FAC3277B;
	Mon,  8 Jul 2024 22:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720478725;
	bh=7YHz7y+T/d/K9XBn3bDo+/LX40FSv7Jm/vdn58aKRkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI0wlKY81Q579BFKw8zWMWC1SIwNd/gVSKkx7IsVlekVsv3X7cxz/TUVpSKqP9dxe
	 5/c1ZyOvWy/q96QswErv4pQOumxSPIIxhTbehYXPi/bV9fY8BuhUHqkaMcEU94IgyI
	 hPHVQwF7oo3gUOSCe5etKokUMLKT5tepIOBSmPCEmnUvCClWm1cPXnQme/B726qrAf
	 KZnckvtI2EiIHhy9sB1QKfM5AychhQBbEmhEdXjZejk9ZnCoW0Ep40AiLTAaEJaAFX
	 nnCkCaNxQa/zeY//19pq24YRvXay3/oM6zBeFsvWQC2HRA51Tt2JgI71FYd0iXy6G3
	 F9eS93ChH2lJg==
Date: Mon, 8 Jul 2024 16:45:22 -0600
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/8] dt-bindings: i2c: add support for tsd,mule
Message-ID: <20240708224522.GA4092671-robh@kernel.org>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
 <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>
 <172045906545.3469012.7420722768425918930.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172045906545.3469012.7420722768425918930.robh@kernel.org>

On Mon, Jul 08, 2024 at 11:17:45AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 08 Jul 2024 18:12:14 +0200, Farouk Bouabid wrote:
> > Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> > among which is an amc6821 and other devices that are reachable through
> > an I2C-mux. The devices on the mux can be selected by writing the
> > appropriate device number to an I2C config register (amc6821: reg 0xff)
> > 
> > Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> > ---
> >  .../devicetree/bindings/i2c/tsd,mule.yaml          | 63 ++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/i2c/tsd,mule.example.dtb: /example-0/i2c/fan@18/i2c-mux: failed to match any schema with compatible: ['tsd,mule-i2c-mux']

This can be ignored. Looks like things went sideways here because patch 
1 subject is a substring of patch 3 and then it got marked as 
Superseded.

Rob

