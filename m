Return-Path: <linux-i2c+bounces-2209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B98735E6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 12:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5601C22407
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E69779F5;
	Wed,  6 Mar 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2tNNlvQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEE7F7E9;
	Wed,  6 Mar 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725905; cv=none; b=PTe3B9HA7OISowGB69C6FWfsifgxYZWspTMn1JMDrffIeac3YBNKTJJr8bUyTad4nF69ebADushSniJnz4qBJ8Wr/I4dKBgDwTMbx69zymvTuHq4xKIYSE83Nf8r9VVzbiCtbnAgfca9GjFe62cXrjDPrOhfqppHLfiaNBhc2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725905; c=relaxed/simple;
	bh=lpueoge2MGAnsC13LIqztC2dO40ObKOXlwl1I4HGqsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSOzAYz47W/9MXp+OuULkqLQomll2xDTx+QUbOdy/iS+sSj6uS9tergs/DSAuIMY6dIIMIigCg81puVEvNmUTAGoip5pxu06lTdY4wicIHyEfJ2+NwKaRRyImuSroKx0WWyKuNH/ahdR3EVvx27Z8x6h5m1PNNz2OXYUGGiwrsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2tNNlvQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544B5C433F1;
	Wed,  6 Mar 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709725904;
	bh=lpueoge2MGAnsC13LIqztC2dO40ObKOXlwl1I4HGqsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2tNNlvQKert2nDDeuON7DuVrb7EpLgFfG6VxSF94TSNWGQAB9V2ppj56bxzjofpC
	 8KN/cuRWe0DjExokTZC8A7jp6oqSElr9Vy9bZ46yf9y+F8Hks9Holae5T5CFIVhId4
	 GR4J7fxn2fc+pbGZ6TjFFwrtol2L+lo1LaJU4jJbYwcRXUZAqaXdkXdIt4P27UbpBl
	 BL5FznIylZGkzefRINHSuEnKTflF15Bf3FQ9x8LWYSxrOuUyRL6uX4RVhnxMuT79tA
	 XRvUZYqc3FtPk66TbCQWWb0medN/a21j2YUiC26FN+euXBtyqpmZQbuQbbkxzGTv5k
	 4+mBZfLxjRuQg==
Date: Wed, 6 Mar 2024 12:51:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Drop
 i2c-mux.yaml reference
Message-ID: <u54h4yntxdolfhyqfhxs3h7htlih3zzndt343ktznlcbrevya2@aeumthqcyuki>
References: <20240124190552.1551929-1-robh@kernel.org>
 <Zb6nBYTkZmXZ0G2X@shikoro>
 <Zdxq4GnRyjC07EH8@shikoro>
 <CAL_JsqLnCzXMsyeAHZUx2_oF5dqvLOWBvoj2Bb_Go6VimCxCoA@mail.gmail.com>
 <e6cuggewnewxp2tf4g45jkazu46pgiffooo6gdwi2ge44itsps@njsz64u5vjyr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6cuggewnewxp2tf4g45jkazu46pgiffooo6gdwi2ge44itsps@njsz64u5vjyr>

Hi Rob,

On Wed, Mar 06, 2024 at 08:20:27AM +0100, Andi Shyti wrote:
> On Tue, Mar 05, 2024 at 12:06:05PM -0600, Rob Herring wrote:
> > On Mon, Feb 26, 2024 at 4:48 AM Wolfram Sang
> > > On Sat, Feb 03, 2024 at 09:50:13PM +0100, Wolfram Sang wrote:
> > > > On Wed, Jan 24, 2024 at 01:05:50PM -0600, Rob Herring wrote:
> > > > > The I2C de-mux is different than an I2C mux, so i2c-mux.yaml is not
> > > > > relevant and shouldn't be referenced.
> > > > >
> > > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > >
> > > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >
> > > Andi, can you pick these up?
> > 
> > I already did since you gave your reviewed-by and they hadn't
> > otherwise been picked up.
> 
> Oh... I had them in my test branch and was waiting for some more
> tests before sending the notification.
> 
> Shall I remove them from my list?

Because I need to update my branches, I am going to take these
two patches out. Please, let me know if you want me to take them
back in.

Thanks,
Andi

