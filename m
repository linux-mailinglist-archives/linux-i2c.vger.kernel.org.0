Return-Path: <linux-i2c+bounces-2206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176F872F78
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 08:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E61B282979
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 07:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E965C615;
	Wed,  6 Mar 2024 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ire0JjbT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5695C5F9;
	Wed,  6 Mar 2024 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709709632; cv=none; b=Tf6CXJuW/dusJ1Np6FrscgXOOjOu+R/AY67gJdQxTXdci+BaarRyqRI3LDdiUVqsSmY0W3/aiRLP3VOCgn9Fs8ubwEyvxA3nZfXhnfuNFfZQiFkjrZ4a3bh2x4o5/h5rJXUeon+1LPz/q31si2RaSFYYiuj375ICG4MIwDxqnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709709632; c=relaxed/simple;
	bh=Qugb/thylVBs/11++xQrE7py/hfjgS+7cmnTqZ6Npk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyzH6YF1I9cFnX4ggfv272jcqIChrQ/aHZ6z7ETrrLjNAqX+boPa7kqGeklRZB4sLFeej3yVADMqnUdJ8A1XDW4zVBKDWcBd0WHrHWpvdixzPLMOPNveWR8XLo8XXS1ZJzVZ+8t+AUfigpPaeThpJhkyyjtLC9BEHdGlXJTRdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ire0JjbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAA5C433C7;
	Wed,  6 Mar 2024 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709709630;
	bh=Qugb/thylVBs/11++xQrE7py/hfjgS+7cmnTqZ6Npk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ire0JjbTk37nJ8nW8ILDF6ozjTHy+9PDRACslzZH2SKcNTUuUi7a7ClpUtyz6ADno
	 rtyc7cVI9D3yxR/B8zMEJhFsYPCZKimE7U/KgrQyMPXq6hJKHUGUuh5IBYsyW6GnhB
	 WBV0qIVBxQlY+hkqyQ5WzrU+tPCZ+noTIbjfrtDPPozUfil+4/10xE3xY6IRXX3eW6
	 roaePgsJUluqivsZn+2gPvHaMwqJPWAHdjvkpUd8t6udNueYP1UG0gBEd2VHp4lWDK
	 rCYy18ssfJtM4HgvMfuFk/CKCk9Cz2TFPp5pt97Sj6BAFudLNevCpDufEgav9qBoFJ
	 fvRlzsARGWpSg==
Date: Wed, 6 Mar 2024 08:20:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Drop
 i2c-mux.yaml reference
Message-ID: <e6cuggewnewxp2tf4g45jkazu46pgiffooo6gdwi2ge44itsps@njsz64u5vjyr>
References: <20240124190552.1551929-1-robh@kernel.org>
 <Zb6nBYTkZmXZ0G2X@shikoro>
 <Zdxq4GnRyjC07EH8@shikoro>
 <CAL_JsqLnCzXMsyeAHZUx2_oF5dqvLOWBvoj2Bb_Go6VimCxCoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLnCzXMsyeAHZUx2_oF5dqvLOWBvoj2Bb_Go6VimCxCoA@mail.gmail.com>

Hi Rob,

On Tue, Mar 05, 2024 at 12:06:05PM -0600, Rob Herring wrote:
> On Mon, Feb 26, 2024 at 4:48 AM Wolfram Sang
> > On Sat, Feb 03, 2024 at 09:50:13PM +0100, Wolfram Sang wrote:
> > > On Wed, Jan 24, 2024 at 01:05:50PM -0600, Rob Herring wrote:
> > > > The I2C de-mux is different than an I2C mux, so i2c-mux.yaml is not
> > > > relevant and shouldn't be referenced.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Andi, can you pick these up?
> 
> I already did since you gave your reviewed-by and they hadn't
> otherwise been picked up.

Oh... I had them in my test branch and was waiting for some more
tests before sending the notification.

Shall I remove them from my list?

Andi

