Return-Path: <linux-i2c+bounces-593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B2802836
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 22:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9FCB2089E
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 21:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E401A278;
	Sun,  3 Dec 2023 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsZ33xix"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5040199A7;
	Sun,  3 Dec 2023 21:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611FFC433C8;
	Sun,  3 Dec 2023 21:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701640535;
	bh=WchhBTvlEN2N1e/fVEDF7SdSvjX3scpDE/VS91fwTgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsZ33xixb4mkyWa9csySkAA/NN1VxUrOpF9w8bJ63th5o0H6fmdEOHlxQ+xVw0sV8
	 LKkQjTrtzjbRtoRsafW8p9xyR09+q7+sqShX5rEaR2ukz1NKWol3uVWM3JWtRxGnea
	 nwvCbKzGNEH70eL1Bz4gyRYnyUEZOjhAyrWApha5dfKcKAgl9TCFaa5oZ2wd68fDDk
	 Y9wrG6Q4h1GeRdleyMulasERR7jn7tF5u8TmTJ+dOp1LfzrqN+Vm285GMlSP3Uoo7D
	 YSBwEx9rpJF8Y/pvzVo6O5NVE2B3RRiAORvE+CENiwVpadNYIQdUUcqAoftST/WwE8
	 TLWIPbNxJV3hg==
Date: Sun, 3 Dec 2023 22:55:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Tim Lunn <tim@feathertop.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on
 rv1126
Message-ID: <20231203215530.mewjd7n7ltaeed3w@zenone.zhora.eu>
References: <20231203124004.2676174-1-tim@feathertop.org>
 <20231203124004.2676174-4-tim@feathertop.org>
 <20231203190620.26of3xrcoosnpicb@zenone.zhora.eu>
 <4413905.22IY78Rhhi@diego>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4413905.22IY78Rhhi@diego>

Hi,

On Sun, Dec 03, 2023 at 08:48:43PM +0100, Heiko Stübner wrote:
> Hi Andi,
> 
> Am Sonntag, 3. Dezember 2023, 20:06:20 CET schrieb Andi Shyti:
> > Hi Tim,
> > 
> > On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> > > Rockchip RV1126 is using old style i2c controller, the i2c2
> > > bus uses a non-sequential offset in the grf register for the
> > > mask/value bits for this bus.
> > > 
> > > This patch fixes i2c2 bus on rv1126 SoCs.
> > > 
> > > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> you're listed as the maintainer for the i2c busses,
> are you going to pick this one patch yourself?
> Or do you expect a different handling?
> 
> I.e. it doesn't really tie into the dts patches and everything will come
> together nicely in linux-next and during the next merge-window.

Wolfram are you going to take this?

Andi

