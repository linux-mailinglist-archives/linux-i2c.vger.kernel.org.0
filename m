Return-Path: <linux-i2c+bounces-13845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2AC135CE
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 08:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49574011E2
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DAE20C490;
	Tue, 28 Oct 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSp4dhCX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDE717BB21;
	Tue, 28 Oct 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761637682; cv=none; b=n/1t1UM4MINO/w5Mde2ke5C+Lrch3xsxAZmzncn8KpPozuBgcZYO6Lm/B77A0H8g3pNbkUBlAXnWrtW2bj4RT7uTrpcZ9K4yG5n0tY+xyjEogbzUzf91XIqmTfsz5uueyCtmksR9lyN65+mnq02UTXuvkmjTI8rlz36+2tAH8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761637682; c=relaxed/simple;
	bh=KClJh703ruviggVORWywOzunQO6HBuBT/e1jnVpnPXc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmzzxqOI5cxj72CBrtxto15bB5Stm/UkM5h7wokmcJidc+zJRoPMYOy7mWuRxMmF4RkAwUvcJyrxoFAQEBoYH8NNVDggJ0J7C8jnp9bjOaR5heMz6NDnw6zZgTb4iTPpYRFhAPaihFCdCmNxttYO6FeAnKpUBOLWV6QL4IcFDJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSp4dhCX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD480C113D0;
	Tue, 28 Oct 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637681;
	bh=KClJh703ruviggVORWywOzunQO6HBuBT/e1jnVpnPXc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=JSp4dhCXz/ltiFCTPO0JZcMRQ0fsKve6CAnHmMlvgGjKIsE9cs2S5JvV5W2MW7nAn
	 82HXAZqM6GUp1+SVIebgExEctwbw5eR8rdTw73RBFVFYfA+vDmsp+U4HqdAgSoU5F/
	 /TKhjJf/vrUuHq96xsIZAhivbBsQ/tgYZuM83LA1aYES/wvftOKN+q0du0hlugp8Sz
	 fa01y6qXoBel8u57qib+5TEcobWqo/i4L+Cz73uiN0CdPftCQZDwWT1lXiIESFogAy
	 6OQvGLFdXKq9D1mZ7L2/12L7C9M+hmgdIEAFAJ83G+sJ30s0jnr9tUhLF61qe4Wa7r
	 a9BW8d4ARqz2g==
Date: Tue, 28 Oct 2025 08:47:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, bmc-sw@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, jk@codeconstruct.com.au, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20251028-ingenious-dazzling-jackdaw-af487d@kuoka>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>

On Mon, Oct 27, 2025 at 08:14:45PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2025 07:12, Ryan Chen wrote:
> > The AST2600 I2C controller supports three transfer modes: byte,
> > buffer, and DMA. To allow board designers and firmware to
> > explicitly select the preferred transfer mode for each controller
> > instance. "aspeed,transfer-mode" to allow device tree to specify
> > the desired transfer method used by each I2C controller instance.
> > 
> > And AST2600 i2c controller have two register mode, one is legacy
> > register layout which is mix controller/target register control
> > together, another is new mode which is separate controller/target
> > register control.
> > 
> 
> This implies your "reg" properties have now completely different meaning
> and this would be quite an ABI break. We discussed this probably 15
> revisions ago. Where did you document the resolution of that discussion?
> 
> >  
> >  unevaluatedProperties: false
> >  
> > @@ -57,10 +85,12 @@ examples:
> >        #address-cells = <1>;
> >        #size-cells = <0>;
> >        compatible = "aspeed,ast2600-i2c-bus";
> > -      reg = <0x40 0x40>;
> > +      reg = <0x80 0x80>, <0xc00 0x20>;
> 
> Not relevant to this patch. You just added this line in patch #1, so did
> you add incorrect code just to fix it right away?
> 
> No, fix your example when creating it.

Heh, and this was not even tested... you have warnings here (see
maintainer soc profiles).

Best regards,
Krzysztof


