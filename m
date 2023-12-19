Return-Path: <linux-i2c+bounces-895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE2819496
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 00:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A101A1C2464C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 23:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4EE3FB08;
	Tue, 19 Dec 2023 23:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn2CoAUz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D753EA8B;
	Tue, 19 Dec 2023 23:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C8EC433C7;
	Tue, 19 Dec 2023 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703028350;
	bh=DWj53wlFUzo65I9QXk2QrzfgzePwG8ImdFFtSDI5Mj0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Fn2CoAUzSkfbWqTqm9my++lm2RsnyM3Kc/uGtgh8d4MqMcNHQ+7pP9qGcAn8R2VMC
	 YFdMHxQ44CILCTtnbbKAfrK+OR8KIzfXJoyj4+GDC7UNNI3iDVr4gZ/rGauPI2x5Ao
	 P2wt7AICaIqiUPRIXvtyWOs5wKTNPPk4I+2MlSSuBY7MKlSux3OlVm2fBHEyW+b0vr
	 frUrwWEE2tHWCrfCLIHRK1T5S7eAh9IcMsS7DROSE5IB2pte4+j3oK+XAnWTecuD/I
	 xbBeoYZbgiLHNpm5hbR3rDAFvNMr5V/cq2oq5EZmlyaHfNVVGh5mWf6rKHWhzB1p45
	 M/Beka8dq5NZw==
Date: Wed, 20 Dec 2023 00:25:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "wsa@kernel.org" <wsa@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Message-ID: <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
 <ZYICEczlao+pg8kd@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYICEczlao+pg8kd@shikoro>

Hi,

> > I personally would like to see it accepted but it seems there are 
> > objections to this approach. I've yet to come up with anything better to 
> > offer as an alternative.
> 
> I see. Thanks for the heads up!

I'm also inclined to have this merged. A real fix might take
time.

Myself I have developed a prototype for what has been discussed
with Krzysztof, but I don't know how much time it will take to
get things done.

Andi

