Return-Path: <linux-i2c+bounces-8715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377F9FC754
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 02:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0661882C7F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6176EACD;
	Thu, 26 Dec 2024 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZU0pj6gu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC354409;
	Thu, 26 Dec 2024 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176123; cv=none; b=bM8S92D1k2ua141QDG/eO6r5VB141/st2XQEsfkMlS/FfszOGK4hGVyVmyWikSMuNU7bfl2UZFsU9Xq6AaU3qkduKbjaFBpYeWBQWFAHn1JvN2yuNtVY5GfL9TA5O4/WcJBtIY5hmIM8A3tgCBUbGc3cqfql4PoDvdpKl0zMjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176123; c=relaxed/simple;
	bh=/HV+A+tOtDUwaySH6TqbPWpUMtZ7Yq53yTPEq/IV9Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfzXKz4s94U9ZZ/F5CDllnfiMwaAmrMC08h0ojhRS7icDPz2Jg3Hj0iumVmyld25zxhhKywxQbc1RW9Y0gEHVhgK8qum0nhfay/vux2maEjZsNVx8GK9Ttsso4rnfv3F+JWea7wpDxraBtxG18n8m6Pd9nyjkOhSOtuKDzFyJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZU0pj6gu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A90CC4CECD;
	Thu, 26 Dec 2024 01:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735176123;
	bh=/HV+A+tOtDUwaySH6TqbPWpUMtZ7Yq53yTPEq/IV9Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZU0pj6gub1kaYxDSevlezA21Dl5aFvSttKQvFy/k5GDld7v6IAaV75GX9GZYANonT
	 qkQJbQL5wtlxPx8DZxPMDGBaaariY4jhG+vIub3vLwg/Eev4H8Hw6eaT7zPirVKkO1
	 femQH4yJYAF+S6aFj8Ml4zVb3JcITe0oJc2fzyk4EWmOmOX78nFbGSmGXWZQPxPchO
	 600VHP+ZvxXEDgb+77fLbaWWxc4EMYI8SKlvcDBtkE3fhdD+GPZI1CHHno4/xN+yYk
	 ufD0ofvMx6/8Vy5GDmakxpQhaJIvf/UGWET19yACi3y+/kkDIfur9lqrcl86oHgdQH
	 B9AwdhnE+8e/Q==
Date: Thu, 26 Dec 2024 02:21:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Chris Brandt <chris.brandt@renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <cnwphrjjrakaafm7zp725mickh63xw5qm6mlh6q43745ljgxfe@33y2z234oauu>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
 <CA+V-a8s+tY6dnVHFhjyOZ43L+roLfqPr-_28FS1KyADwyTH2+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s+tY6dnVHFhjyOZ43L+roLfqPr-_28FS1KyADwyTH2+w@mail.gmail.com>

Hi,

On Mon, Dec 23, 2024 at 06:35:28AM +0000, Lad, Prabhakar wrote:
> On Sun, Dec 22, 2024 at 12:44 PM Wolfram Sang
> > > ● Write:
> > > 0: Changes the RIICnSCL/RIICnSDA pin output to a low level.
> > > 1: Changes the RIICnSCL/RIICnSDA pin in a high-impedance state.
> > > (High level output is achieved through an external pull-up resistor.)
> > >
> > > So using the generic algorithm may be platform dependent as it would
> > > only work on platforms which have external pull-up resistor on SDA/SCL
> > > pins. So to overcome this and make recovery possible on the platforms
> > > I choose the RIIC feature to output clock cycles as required.
> >
> > I would be super-surprised if this is really a restriction and not a
> > very precise documentation. In other words, I am quite sure that there
> > is no difference between the bit forcing SCL high (via high-impedance)
> > and the internal RIIC handling when it needs SCL high. Most I2C busses
> > are open-drain anyhow.
> >
> I had asked this previously to the HW engineers about the requirement
> (as this restriction is not mentioned in the RZ/V2H(P) SoC, Ive seen
> it for RZ/A series RZ/G2L family and RZ/G3S only) before the start of
> the I2C recovery work but haven't got a response yet. Ive pinged them
> again and I'll wait for their feedback.

Wolfram has commented on a very valid point, on a standard i2c
specification.

I'd like to merge this once all the hardware questions are
answered.

Please, do follow up on this.

Thanks,
Andi

