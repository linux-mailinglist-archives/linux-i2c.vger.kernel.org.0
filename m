Return-Path: <linux-i2c+bounces-13776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64BC0535B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 10:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D42560654
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 08:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DF7307AF2;
	Fri, 24 Oct 2025 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QdSsnlyO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D484306B0D;
	Fri, 24 Oct 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295317; cv=none; b=FgCRH4W1MkCktS34UMCycm9shfEMgDLSRY2zRPJZiAAhPsYj3dTqTFysgs3uZpwxS1431gtjSICguDhE07p3tQEw9Pguzps8N4N6OuwI1afUAXU1RdP2OV2e/rNjhlAYVGtqMZn06iHOLj7jUykN9II3zHREUZxeA+F/v23NiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295317; c=relaxed/simple;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V2x+WRAJZ3vSpzQ1U6puz6vw3h4PC/upmQqKyBD3nGrnBqbOwp+CgT6SoYbmXIL2hvmdjFbFDRaAL59FAcaI2pgAkhMIc4xTFAaVjflIsx7L2sdwGfxpr4mVo9tZeWiyGTK/DzywUPG44DEalwyxGXhFb7gGtNJ9gBHUg8urz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QdSsnlyO; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295313;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QdSsnlyOf0QUVeogjKCGYkZww/gZfXB4OgrMZ1sqUAMhfbzOHiy4r9c1xnXsRXoKi
	 GYIHmk+q49Z4uKdasQ7kKFbCOJyKGJdN4BlMEXYPltF6UXs9xyeFqPFuzCZ7Xb+Tnt
	 Ml2JBDe1pZERGcJ+wbfpP9cXVZA6m7SR7aJSegGeMM4/IEk2l41hsbGzgjxReVjtWD
	 VSZvBLp/pdYMDZ+Iyiiu+fWujwYDVCN+rZWhHXqWoXwk7P+oH/b01nOqnRWcafwrWD
	 bIoiTjByPrVq0IE88W7XeP3cNeh6wFzCYNj9BzGZld15rFKMJVEgFZ0WlJxJxerlK+
	 19XYnV6k5PaKg==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BC02072F33;
	Fri, 24 Oct 2025 16:41:53 +0800 (AWST)
Message-ID: <76a0b578efb62a6e6bd7dafd477fa15b1062a09c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 16:41:53 +0800
In-Reply-To: <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kyzysztof,

> > Not much different than every other soc. All of them are separate
> > IPs.
> > Look at any Samsung, NXP or Qualcomm binding. Separate IPs.
>=20
>=20
> So let the move happen, but please explain in the commit msg that
> devices are completely different - nothing in common - and thus the
> binding will be different. We indeed do not keep completely different
> devices in one binding, but based on commit msg I had impression this
> was just major block upgrade.

OK, makes sense.

Ryan, let me know if you need a hand with the commit message changes.

Cheers,


Jeremy

