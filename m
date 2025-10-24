Return-Path: <linux-i2c+bounces-13775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400DC05305
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F4E420F63
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 08:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD17305E32;
	Fri, 24 Oct 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ctHyGqsv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A432D5955;
	Fri, 24 Oct 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295244; cv=none; b=biuAFasX9CiEQkddDYaD1FEtgYG3+P2KbwOckg2CR9sGaPOOZPCx6EXX1r/sfiqM7t6/RdxdM+xlm9hCyiCMzBQkqXmzB23z4inzLbtHks1qLjqldz/Fxadw/tm8SZ5lbaie4geGmrWkfcbrY5kGDZWjzPNxDqT+Q440Rk6qTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295244; c=relaxed/simple;
	bh=lw/s2jBtSNUL0QzCT5hW2EH0zZfCltxOrjLk+GzQjHs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPISE4y1CHrKK0tijzh7oBOUameBRVcwLWY3W0oa4UOxmm6PpwJAwLUQxSV7lK4cguJsqaa+EOP7CaQkIJx12McTg9Z8LxBQE07qv6isHfBtKX68UYIfuSOidiwGxPWmHhPBnp4P9SGT/zcAPKHmdi5wKGppFzisTH56uIn7mds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ctHyGqsv; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295240;
	bh=Wem404aV0t2DuNDE8zK+b4FQd+9biDbjtIJpBHo0aMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ctHyGqsvOYJRXH+CRvOB4EQgB2myWy+sZO7qcXv8RFGMv7dH/Fj1rE1hMKQ3/2asX
	 dznZtEj8rUzVAFUfkDGlJdkrxwpVjqqVIo/MDLcEXQ2TWUDM0643iNBIuphCjKW7oa
	 wuIhoShV671DebHHgJ3XSvHwkvGN8M2/YOG3zDL8H48oIG0A8t3NLjeSZNhj/XuVGy
	 OC4t7qGnJMJmGaxuR0gZUVTlS1ejQSnvd9IMcDLG9YBG8hPT2iWfjx0B8oNMmGweZf
	 ehNN1u8WGnbSlIwqCvAAyrgGJezPC76kXI924y6QdY7bsfYPQjIAzHLEgtxfl3y5Oi
	 bqxRfJYA2S4JA==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DE8772F33;
	Fri, 24 Oct 2025 16:40:39 +0800 (AWST)
Message-ID: <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
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
Date: Fri, 24 Oct 2025 16:40:39 +0800
In-Reply-To: <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

> On 24/10/2025 09:56, Jeremy Kerr wrote:
> > Hi Krzysztof,
> >=20
> > > Although now I saw next patch, so clearly this commit is
> > > incomplete.
> >=20
> > The split that Ryan has done here - by shifting to an identical
> > separate
> > binding, then making the changes explicit - allows us to review the
> > actual changes without losing them in the move. Sounds like a
> > benefit to
> > me?
>=20
> Not related. I commented that rationale is incomplete. We do not move
> parts of bindings because new device is someway different. There are
> hundreds of bindings which cover different devices. We move them
> because the binding is different.

OK, but in that case I think we're after guidance on the threshold for
"difference" here.

> Not much different than every other soc. All of them are separate IPs.
> Look at any Samsung, NXP or Qualcomm binding. Separate IPs.

So, something like this?

    allOf:
      - $ref: /schemas/i2c/i2c-controller.yaml#
      - if:
          properties:
            compatible:
              contains:
                enum:
                  - aspeed,ast2600-i2c-bus
        then:
          required:
            - aspeed,global-regs


I can't see how we could represent aspeed,transfer-mode though, as it's
optional on aspeed,ast2600-i2c-bus, but prohibited on others. Any hints
on that?

Cheers,


Jeremy

