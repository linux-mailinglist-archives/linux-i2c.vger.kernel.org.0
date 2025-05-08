Return-Path: <linux-i2c+bounces-10898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5835AAFA47
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2C41C21566
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF96F229B03;
	Thu,  8 May 2025 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyf/ypem"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E6426AEE;
	Thu,  8 May 2025 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708133; cv=none; b=mVIOrREoGyZV870pb9BH5+AUmmzVaquXgFO4jnaTUOS02LcvRWq5nqvYkVJUOHBJknW3YtzzKl134tixGMV+WPmQJZJyZhNcNA4lpoO8Ay0YeO5HQajQNu1D6s8B+jO0DHOb0yAvMG9678XfBhI5AVQd0a5jHECxDlM4TFYbtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708133; c=relaxed/simple;
	bh=+PxvKs9oji3vMXT1W8j6+sWv/09YysUiS1p4dKCTMXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaBDjQDy9tKAQKwaMv/p39EASXmEzEU5um4/XPbwP1355FetUPYXrp2BoSt1WIqh2XMu6MJvAXJG8KQejlaC50MuRhyyQy/mUEu9HlCZHi2E+mf0UMwMsE92+yN1UKzn9E0tBrSz7lvPHmS8Uh6MpNYgz5RKFYU66J/lMsVUU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyf/ypem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F01CC4CEED;
	Thu,  8 May 2025 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746708133;
	bh=+PxvKs9oji3vMXT1W8j6+sWv/09YysUiS1p4dKCTMXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyf/ypemX4G5LVHVYs2v3oFsgLlCudgXGlS/vMzQRaXNOFIefyXm9WVJfbHYYt2bn
	 4w9VVxvriAJVCzlTJftr3bYsA96srBTIYBm1UFj81u9YcHU70cbuNSExJLsjQxohlF
	 yxNy8vw44aGubKxm/svqpytInJ6rarrvlyqIrpRmhgze64pTFUbrsu3/g34mqvHiNH
	 BlltD0HRGdKy0B/5ixW/rLGMwCmxsaw5IbotS/a6vRQdSTaW1gk6LR47R26AlxvMjj
	 aTm+0e8nZNvDH446IIJs6V1Ri/4Qf+QVPV6eJMXT3pmenT9ffAosxjPslNrk3caTht
	 5lGv9IFJkx1ew==
Date: Thu, 8 May 2025 14:42:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <c36emmsymieo5npmv5omd37yumkmmai3hozkypc5p4u3apensh@yb53oh3mv6qu>
References: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
 <wt7du4fu44sxut5i4ymhmb4akhm46btm7yszz6xbya2sxq7gdp@al24jhhqdz5c>
 <dcd6fe48-9f2e-4bab-a791-a939a32cc184@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcd6fe48-9f2e-4bab-a791-a939a32cc184@kernel.org>

On Thu, May 08, 2025 at 12:33:21PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 12:31, Andi Shyti wrote:
> >> index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
> >>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >>  S:	Odd Fixes
> >>  F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
> >> -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
> >> +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
> > 
> > this has caused some conflict. You are based on -next but i2c
> > hasn't received some of these changes, yet.
> > 
> > Anyway, I fixed the conflict and merged to i2c/i2c-host. Let's
> > see how it goes, but I believe we will receive some complaints in
> > the next days.
> Yes, few trees will have similar conflicts here. Expect them also when
> you send your pull to Linus. Conflicts should be trivial, though.

Thanks for confirming this, Krzysztof!

Andi

