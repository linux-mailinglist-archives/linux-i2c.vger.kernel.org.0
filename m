Return-Path: <linux-i2c+bounces-12816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F2B50F30
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 09:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198463AA203
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 07:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5CC3090C7;
	Wed, 10 Sep 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="M/Df+4gF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84A3093A8;
	Wed, 10 Sep 2025 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489114; cv=none; b=gviNrZIFZ1PsSYpR/CgDJUKVB02MSAfAE1MsgTJ4yCFK3yYCaV31FdLJL8g8P2MSrGEl9RljZkHZ5xdcn484frpAGfL7lX4tCBYDBPjd+PHHu0L3fc02kROhJGmorAip3thqz7dfZ5/Kmsc/ZL/B9TEf5ZoatolluJe7tZ9HvdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489114; c=relaxed/simple;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JDI9fDskZbd5j5YZkeL7FIi0VdP4HqWb40MeVoeOH9QmZtz5zWKzX/Q/1U21IP4PLLKssuGN9seMVNQC8c+SQD5PfEt8kzPqxUkxMgoArvrfn8TTAffUVMoiNbwha3hUFsjVFyTuGLiVQtuvchR6V/cQPP4LnIw2kBwu/9PPQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=M/Df+4gF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757489109;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M/Df+4gFpZo2jnpBnoKNNy4pZfOibmyNCP2ItaqHQzdlNhAKBa/0O+dBS5GgBf4bN
	 5mcazSvVUOpTQK0w8gbnr0cSGCsKACMEr0oZohlttaK6NqqlncezqOJdM5TNJe4DUD
	 5IYXoF72KmeTtZlY+Ekg+QHpUdUI4h3Yb0L9VqK68wl74rD89V3tlw+fhwQWdOF1Tw
	 miNU11LDzRqh6+tvMe9MH1q7+fZdyd0tTKh13APQBm81mAHac4u2JMwhn6r46ZozlD
	 S7Hx9MvZeR1mvohCH+1YOPlhe2n+MZeBftdPi4tUmK2RlsyvjIF7AVqJTl1PSCEiSc
	 Db4UnHy8/6b1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMBzR1HQnz4w2S;
	Wed, 10 Sep 2025 17:25:07 +1000 (AEST)
Message-ID: <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>
Date: Wed, 10 Sep 2025 15:25:05 +0800
In-Reply-To: <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
	 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ryan & Krzysztof,

[my response is intended to make progress on the newer v18 submission,
but we still have this item from v16 to resolve, hence picking up this
thread]

> Your compatible already expressed that there are two interfaces, so
> your drivers can just choose whichever they want. If you need to toggle a
> bit in system controller, it is fine. If you need different compatible,
> then that's a NAK.

I think the mention of "two register interfaces" is a bit misleading
here; it implies that it's just two interfaces to the same hardware.

From reading between the lines on the datasheet, it seems that this is
two completely separate IP cores, that:

 * are mapped to the same MMIO space; but
 * both happen to be I2C controllers.

- where the single "global register" (which you mention above) provides
the facility to mux the MMIO mapping between the two. Some versions of
the overall SoC have only the old core, some have only the new, and some
have both, selectable via this register.

Ryan, can you confirm whether this is the case?

Given there are actual behavioural differences between the two
peripherals - beyond just the register set - that would seem to indicate
separate binding types (+ a syscon mux control) to me, but I'm keen to
hear any other options.

Krzysztof, if that is the case, any thoughts on the representation of
separate bindings?

Cheers,


Jeremy

