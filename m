Return-Path: <linux-i2c+bounces-924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726381ABD3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 01:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE59286629
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 00:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F661115;
	Thu, 21 Dec 2023 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONd0Zi3O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1A10E9;
	Thu, 21 Dec 2023 00:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BBAC433C8;
	Thu, 21 Dec 2023 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703119209;
	bh=G01TAP0dr8h7wjdhz20c+o8Puj6EgTyxz3k2ihtW/Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONd0Zi3OgDaWOYYYXI33mAuSMTXevVTFvmWBrg857xDH07NCVgV5tPiNw4NuuZRfz
	 SgnhvNsihliS9SVB1/AX+t9/TP/roVQhSFOAbb5GyF23PWKb20iF1wZG9GGBKMxMrG
	 DyOScnl1Q3nVDj8b4TkkeH2p5zDPUF+EPUVomdW1NnK2Co2dLw97Y5rDSui01GGHkW
	 2M/filhaRD+VGtV3ZVDVIcncgikbEfh1YCdmYZgsP0cOAV5BtlOqcLx7wEY2T7WwtI
	 H2axeZLZNByV4of+RCCCIDeHtSwHLw4DswEBr5AYLtyTgw9uCwe8slMLq5ANLXSAv7
	 zQJpHOEziGaLQ==
Date: Thu, 21 Dec 2023 01:40:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "wsa@kernel.org" <wsa@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Message-ID: <20231221004004.dwmzzwzvh53po6ai@zenone.zhora.eu>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
 <ZYICEczlao+pg8kd@shikoro>
 <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
 <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>

Hi Krzysztof,

On Wed, Dec 20, 2023 at 08:22:38AM +0100, Krzysztof Kozlowski wrote:
> On 20/12/2023 00:25, Andi Shyti wrote:
> > Hi,
> > 
> >>> I personally would like to see it accepted but it seems there are 
> >>> objections to this approach. I've yet to come up with anything better to 
> >>> offer as an alternative.
> >>
> >> I see. Thanks for the heads up!
> > 
> > I'm also inclined to have this merged. A real fix might take
> > time.
> 
> NAK
> 
> If you intend to merge it, then please carry:
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

ehehe... too much drama here :-)

I know you nacked this patch and of course won't be taken
anywhere.

I was actually referring to Chris previous patch rather than this
one.

Andi

> The patchset is wrong and made of wrong reasons. It claimed GPIO cannot
> be shared, which is simply not true.
> 
> > 
> > Myself I have developed a prototype for what has been discussed
> > with Krzysztof, but I don't know how much time it will take to
> > get things done.
> 
> 
> Best regards,
> Krzysztof
> 

