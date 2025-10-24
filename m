Return-Path: <linux-i2c+bounces-13787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF4FC066CF
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE1D24E4BAB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91BA31B122;
	Fri, 24 Oct 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="AqgzCm1d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904E207A22;
	Fri, 24 Oct 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311644; cv=none; b=McNCPohp8dk24gocfz04K2cDmgMdGFQyCIukZbphnEpQuc7zKVlZOt+N2XF3wae56KkR5knKqf1GiOQdTiIi1Kc1D6c8WasKAmv13XW13JlCpeiaRRdrSEofmDFOzY8RQb+BUmFGInvB2g+sG5x0lJEq1WYoyvEr7YiFs+IWmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311644; c=relaxed/simple;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNRGJZvOFSBg4T5LnZkM7kBVR1Y0iMVDJrIBkxN4Q+fbZvtJ5wDsFvbBeoQVARaj3ryqFGp3EQCuYd4prj3/NB08JgTPVe2MBXWznnWdvbL+4uyh6n+uUnWnK7DDNMVtmQ6kJrCx9EZ8nzSFhxs2spbvobhGwGjzls+t6Yaqs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=AqgzCm1d; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761311639;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AqgzCm1dd0k/aUIcEdl0Hm9L6+HrivMtdltLfAdJ2V/UI101YRpopWMxclWZUsxIi
	 fdEz5ofPGQuugnuX06FonSsV3olkpSXMfKhfM7uc7Eu9G1KCURvO2lTOhSotyM/lbK
	 RQHU40m2L2xgkYBRaQ04HyxImQISWA1MEdNEuqEXdI5u3e65SGrQNdHYA4HvJn7cE3
	 rz6caVpUMvGwUJYT9M7C9vj6+LJc1grMs42vuG+HwMqgDt9VenQSzV69+AtinBJ55+
	 s3lhGGE2m3GZmBY2PByLJgrrEwe6bMTwzd4gtr0rqlYG/S6ftJgD9xuIyYDOJqzgSQ
	 Gpdu1qonxkVbg==
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9FB37561D;
	Fri, 24 Oct 2025 21:13:56 +0800 (AWST)
Message-ID: <9c0252401fca51549cef2586e9171fa167cc0c53.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 24 Oct 2025 21:13:56 +0800
In-Reply-To: <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
	 <563d6efb-966e-41e7-aade-ddec2abc7568@kernel.org>
	 <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ryan,

> I will modify with following.
> if:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i=
2c-bus
> then:
> =C2=A0 required:
> =C2=A0=C2=A0=C2=A0 - aspeed,global-regs
> else:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 aspeed,transfer-mode: false
> =C2=A0=C2=A0=C2=A0 aspeed,global-regs: false

I think Krzysztof was fine with your approach of the new binding file,
just with the improved commit message.

Cheers,


Jeremy

