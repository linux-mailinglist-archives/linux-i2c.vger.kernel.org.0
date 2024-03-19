Return-Path: <linux-i2c+bounces-2414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C589B8806A4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 22:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0305B1C21FD5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 21:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618883FBAB;
	Tue, 19 Mar 2024 21:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzyODQU1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2F3BBF1;
	Tue, 19 Mar 2024 21:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710883177; cv=none; b=bw8FR/0Zr7SDxnNzQ3Z9/SaEvo2QeYMYolBMkrWh0DN9i7KO6lUiW8q9jrP7B7XeAzxq91USwQ1ENYE5yunXvaWTTBkqMrEhbB9YiGUxGLk10xZY0IXtxUvKBIfHYdq2DOeDAiqxm/wzYth7IA9ZR4AmX8Gwn2ngA7MrSM/mpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710883177; c=relaxed/simple;
	bh=79CWEMlA4zaqq7JEqpKb90rcREJ71jz1otGzcHVGLgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oi3z2fK5fAhK06UJtFvuKMgzchmNrBShXqK0VEmPNWd8CBP58OcnndqsJ4ccia1h6/rzvwS8BIvv7H2J65s++Fu4t0Wt97WngGHhc/TczIbdSfQrJK0VLdvQltSBUTukqAv5pZ0lk/mWEKYOrowZ/Rjp+SmLUEPz08LNK3lS5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzyODQU1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B7EC433C7;
	Tue, 19 Mar 2024 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710883176;
	bh=79CWEMlA4zaqq7JEqpKb90rcREJ71jz1otGzcHVGLgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzyODQU18EmHBrOISgdTe4W569PTH/WOvvvG7bQDTGVw78lxq1dpecCm/vNBYgsGP
	 buB7zrXB8qwFY9jzW8l9jwr0JeOgBY7JTA1SVAaCmwCZOC9zvO77PVn6B/faWpdoUB
	 fwAF1tvpuXKhF04US+PR4ePwMtQtdcltx47ntvx7q78Ih8zSlpzTdMTAUP/j7GgI11
	 llkDUHvBUEKLPLDejSYIIdD0FaiJudn5I47LkX45+eglQ6hrABPzCqGfjjfKpswlhC
	 e3Uz+5lstZVdH2QFVTP+e5tHLaoFh7Hvqt0xKcQPCicPDm/oavxDzpjE7thiMwEFOV
	 qmvoOkYW8/I8g==
Date: Tue, 19 Mar 2024 22:19:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,riic: Update comment for
 fallback string
Message-ID: <eqtj4hpmdqhtftdtpvt7r7iwrkzga365p4ao5kuteovb2behxz@frmyzxemkfwm>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aee88f81-0b8a-4f57-9dab-b4d13db47abe@linaro.org>
 <CA+V-a8s9OaZ7_RXGjkZYpNS7879ku-aXJ+AvsfgvuTZshyWd5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s9OaZ7_RXGjkZYpNS7879ku-aXJ+AvsfgvuTZshyWd5A@mail.gmail.com>

Hi Prabhakar,

On Sat, Mar 09, 2024 at 11:05:40PM +0000, Lad, Prabhakar wrote:
> On Sat, Mar 9, 2024 at 11:58 AM Krzysztof Kozlowski
> > On 08/03/2024 18:27, Prabhakar wrote:
> > > With the fallback string being utilized by multiple other SoCs, this
> > > patch updates the comment for the generic compatible string.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >
> > Really, you review a comment change? Internally?
> >
> > Is this some sort of company policy? Are these even true reviews?
> >
> Yes this patch was reviewed internally and it's "real". Unfortunately
> I cannot share the repo externally where this review was done but I
> can assure it was reviewed. As this is not a single patch all the
> patches in this series were internally reviewed. Is it bad to review a
> comment change?
> BTW what makes you think I have added fake review tags?

I don't believe Krzysztof is questioning the validity of your
offline reviews, but the community is unaware of what happens
in your closed environment.

If you submit a patch with the r-b tag, it holds little
significance for me since I haven't witnessed the review process
myself. However, you are, of course, free to include it; I have
no objections to that.

My suggestion is for Fabrizio to publicly express his review on
this mailing list, which would add more value to the time he
spent reviewing your patch.

By the way, there are other companies that do this.

Andi

