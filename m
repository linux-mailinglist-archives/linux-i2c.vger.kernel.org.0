Return-Path: <linux-i2c+bounces-12853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B7B52C92
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE9C1C80611
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C32E2E718F;
	Thu, 11 Sep 2025 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="eC7I0Sd8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A42E6114;
	Thu, 11 Sep 2025 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581430; cv=none; b=hoUuej1x/uMOxq05yLNNcHUupjWE5oQhuk1Ckz7EVzpZu7LrvifbtoEOFPgS6ehvJ2lT8aLCM/i3GhWEMDQwcFW9UCwrLMa/+YmSj2JvcaBTL5Cz1GUT6UNI5scJ0cwiSgowxbjknupox/5FuM6V0oBLjTuOcheTmhH80A44T1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581430; c=relaxed/simple;
	bh=MXAroO2Vgv/Aw4+0pF/V1BNZSWRlBJi9ioA+EBy/UUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q2ZOOUzdNANOgPrpKywcW0V7enI8JNws0Q37gwl+u4wjoCy0zOPqVzjVKzrQ3d75k9syXkic0Up5qxChw+CYkq+oY11m1pojkz1z32TLzQvQ8rawyy/RtFHzmjLPiYqDUMJsDH4+KzIF+TKqUy9d7Y5Ifqi+HKh4Wv4NmfRunMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=eC7I0Sd8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757581425;
	bh=9jGcvOJ/2zIoXs3jwzmzA+R7eyYFP6KicLp4LvaH6+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eC7I0Sd8DAcvARRMk7gSLhQfnmUYQpLWw0SxQbapw03i3+CqDJ3UVERzC74tH33Dy
	 Ev7bCORrnoI/zq+uiGhuXWrvVHwT5E/MtrfoUVD2NxCklYAXuEZTXDodeHN1XazLlu
	 4sQZlAZzfCLkwaW3cXZhRKqE5zLOwUfXqILuCVRQEGGPq+WE5xqzeDjqCvAqQxSsIH
	 BF1JxnA1xoFgifHbGydZIM7AEO2as8uTEF7IMa+pcQrzxjHmIfw7G6TcwSYL1U0F+g
	 M2RNjT0NsWWdJNdhKrwwXrVihmPPk1a5WhHTay4pLIFUxPqgEXYFpSR4Uc2r8vWnXU
	 nLrlVqMRqY35Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMs6l4WjPz4wB0;
	Thu, 11 Sep 2025 19:03:43 +1000 (AEST)
Message-ID: <ecefaed7ed0fe83442021c0bfee0a49111269aad.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
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
Date: Thu, 11 Sep 2025 17:03:39 +0800
In-Reply-To: <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
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
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
	 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
	 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

After a bit of a chat with Ryan, some updates on this:

> The question was more: it sounds like you're switching between
> *fundamentally different* hardware units with the mux switch - not just
> a different register interface for the same peripheral hardware. Is that
> the case?

Turns out: no. The controller core is the same, but what gets muxed
in/out is more of a compatibility interface. This provides an
ast2500-like register set to the ast2600 i2c peripheral.

So, the plan to use the same aspeed,ast2600-i2c-bus binding for the
controllers (ie, as in v18) seems mostly sensible to me.

The newly-introduced driver can make use of the non-compat interface to
the peripheral (using the existing compatible value), but needs the
introduction of support for the global register set to do so. Ideally,
this would have been included on the original spec for the
aspeed,ast2600-i2c-bus binding (since that's how the hardware is laid
out), but that wasn't the case.

We may want to split the aspeed,ast2600-i2c-bus binding out from the
existing spec, as we currently have:

  compatible:
    enum:
      - aspeed,ast2400-i2c-bus
      - aspeed,ast2500-i2c-bus
      - aspeed,ast2600-i2c-bus

- but the former two do not have a global register-set.

We may have better syscon-like options for handling that global register
set, but that's more of a conversation for the v18 thread.

Cheers,


Jeremy

