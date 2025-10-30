Return-Path: <linux-i2c+bounces-13894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A0C1E813
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 07:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38413B2C81
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 06:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8482E9EA4;
	Thu, 30 Oct 2025 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="VNcTJt4c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB88246333;
	Thu, 30 Oct 2025 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761804265; cv=none; b=VgIEAppPZ9OC1//t4DuIhJEQcBkhgwBXD7XjMJZoCAE0lu9VJAdBrcZmQ0IyOItCMShnf5Mnw/1Sj08TR665uJCU9epWJZSfj/WOLrC7vA9GLag+4vlx1jqUObf1Jtx7NF6ye5csfZUcXhWrs5RXGgAc4k8FxVpG/H6d2KJfWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761804265; c=relaxed/simple;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twuTuVtB+LQNfDgYWNurZ72nrYcnUry+JdCX+NLvuZoVeWgF+3fNAX84D7n1k3DMYoiZtaHmGhLEjD0Ds1YPaPZ+geU77Y3U+h3Ai6Zq7hDmehAHsBJl0igvl4CsYnCDYBlb94FF876e0Y/Si8OVN2WX5IhNhqWRAJl4/yYsy04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=VNcTJt4c; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761804259;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VNcTJt4cIN2/f4WEgxABC6Id7AAblH/HICBg+PaRPVG+ji+iJv43te7VZKyYtZMc0
	 pAo0haH4Uqg1V7ki/IASKd0f6fTmhAjTQPBaRdNvvhiPp4SKWK2/Wtef+/9tCi/bpu
	 SAuz5YgVaLZUs8McGlWx9QY8lGAcCZbEKXtiJgFs9kLQx8d91MOSSTe20kKbNvG8Gz
	 ORlORw1Rl+GSloNCrshWXebTlQd4lb6hWFM8dpxutMHVJivq0uBOvyemIq2DTUI/wy
	 c14EsHCY/aQmvBRPlJ1UqMfYHPCxTPgn3AR9FUKjEKg8TdbuHO+GEtWmqQTIUeidhm
	 IMbhNU3/dSQYQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 59CA379118;
	Thu, 30 Oct 2025 14:04:18 +0800 (AWST)
Message-ID: <0b9abd87b877595c13011a3d8b4e80e05488effc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  bmc-sw@aspeedtech.com,
 benh@kernel.crashing.org, joel@jms.id.au,  andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 14:04:18 +0800
In-Reply-To: <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
	 <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
	 <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
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

> > +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED I2C on the AST26XX SoCs
> > +
> > +maintainers:
> > +=C2=A0 - Ryan Chen <ryan_chen@aspeedtech.com>
> > +
> > +allOf:
> > +=C2=A0 - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i2c-bus
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion
> and
> either implement all requested changes or keep discussing them.
>=20
> Thank you.
> </form letter>
>=20
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus buffer
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
>=20
> Nothing improved

That was mostly the point - this first patch just splits out the 2600
definitions to the new file, with zero change.

That means the *actual* changes to the binding are visible via the diff
in 2/4, and not hidden by the copy.

This was mentioned on v20, and you replied saying it was irrelevant to
the separate discussion around the rationale for the change, but didn't
object to the split-patches approach.

If your preference is to *not* do this via a verbatim copy as an initial
step (and essentially squash with 2/4), that's also fine, but I'm sure
that knowing your preference would help Ryan out here.

Cheers,


Jeremy

