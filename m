Return-Path: <linux-i2c+bounces-12946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB9B56EE7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 05:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E489168465
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 03:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13AD26A1B5;
	Mon, 15 Sep 2025 03:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Xcvd+m79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7561FCE;
	Mon, 15 Sep 2025 03:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757907700; cv=none; b=Hs7SHKwEaTL15w+5ACAz435UsFd1Kt5XKx+saq6vnTD+kfX4gzvkpdF9MEi6CIFoK+gZEF74xJmF2aHJqQFIBbsoyQbRDDlkR9Avmlrmu7/nWZGkRebZZRTPd4VEy5dj2WQCRpsEV8TDJCXm0CwX+lLTiq+RwTwagYeWVFs50bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757907700; c=relaxed/simple;
	bh=McZskAG0UGaWRlZ5lR1vVezxW/M358PczFizXXezyt8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QsGWnVVKK/PJfk7yitSbI1CqctHegYCecMnB0iUgfU+oarg/0bbv/v8WHjMBwGERmdsWV5CktLJf34TGxOw3rb5KcF5UL4NQ+121YxEF0jHBLQmXlCusoGGIa9L7ry7dGCiQot/e3AKh6SoGT+SAtKc5UhgF3q94kRHlxHIilWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Xcvd+m79; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757907696;
	bh=McZskAG0UGaWRlZ5lR1vVezxW/M358PczFizXXezyt8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Xcvd+m79AusxjVSN/vAg8wz4KIWiLRryRepPb4eS0IUkszuJGo2V11TGyAvc1SqMi
	 9S1J8r+3SD7UrRoOwxjMpTx795/XvVFw55TE6h/q653GYizk/UiZY3p8+ZG5py3MP7
	 OxVCYfPKpPlqAQYZlTX7B83F2QFXuBVrf9xcIb7lNam3d38IAqjnvw3ipfAs2M9Pwv
	 fASRz3/FjxRZNLV8ViFFG0k2VlfDS/im8a80Ib4zgQ1xSfa5RD7PNnf7ljaZYcwYk4
	 2HkpFpETo3rZWtUexQHqjsIV1JDMO9qPgU2t+FHY6y09m986X0HhKK9Cz15owqyw7N
	 YG3MGYCBDbp2w==
Received: from [192.168.72.160] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 68AFC64CF0;
	Mon, 15 Sep 2025 11:41:32 +0800 (AWST)
Message-ID: <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
 <naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Mon, 15 Sep 2025 11:41:31 +0800
In-Reply-To: <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
	 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
	 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

> > OK, but the ast2400 and ast2500 I2C peripherals - which this binding al=
so
> > describes - do not have that facility. Given the 2600 is a distinct per=
ipheral (as
> > discussed on the v16 series), this would seem to warrant a distinct bin=
ding.
> >=20
> > Should this be split out into an ast2600-specific binding, to reflect t=
hat it is
> > different hardware? The reference to the global registers and transfer =
modes
> > would then be added only to the ast2600-i2c-bus binding.
>=20
> I agree it would be cleaner to split out a new binding file specifically =
for AST2600,
> for example: `aspeed,ast2600-i2c.yaml`
> But also I think `aspeed,i2cv2.yaml` more better name, that compatible wi=
ll=20
> support next generation such like AST2700 .....

The ship may have already sailed on that one, as you already have the
existing compatible string describing existing hardware.

I would assume that the compatible string should be fixed for an
instance of the specific hardware, but the DT maintainers may be able to
provide some input/precedence on changing an existing binding, if
necessary.

If this does get changed, I would expect that you would need a
corresponding update in the old driver too.

Or, another option may be to keep the current generation ("v2 core with
compat registers") as-is (ie., at ast2600-i2c-bus), and introduce a new
string for the next - where the primary hardware change might be the
removal of compat registers, but it's still new hardware

Cheers,


Jeremy

