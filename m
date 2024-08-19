Return-Path: <linux-i2c+bounces-5547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28B957530
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045961F25BE2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ACB1DD38C;
	Mon, 19 Aug 2024 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiF7NgUV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBD18E0E;
	Mon, 19 Aug 2024 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097713; cv=none; b=QaXp3kchnh71qgZ1yKSjx9FjWgoCgTZKzsMB2aWufi0Mz3bWMvdYiDiMS8jeODQa2X/iHkX9xu6vw4mIGg6pzHZepWRt+lIrR55xicmTDngltJYU13yFL7j8p4DK8oIPl3inKNnglMy9kU/dWyaTBE79IqpNo0346KZxNK8TqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097713; c=relaxed/simple;
	bh=cQ6g4a/1LpaHo3vPps6+GLDoNWMa1bo5/161BzfrKHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSWZmwooYV+kxNgZXBTTAvZM/M10JnhGKLgYARYbICanPSmmjNlw51I/+qF+YMF59Qxipi9UFX/WDwiMVQzcfw4enREnzEZhRyIZW7dKs6RnDIgcy6boNJDfacSSwhm1mCfF02iTpuSacRFx3VJZKsbSgqxVD9ChBBgTnzaTBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiF7NgUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF0AC32782;
	Mon, 19 Aug 2024 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724097712;
	bh=cQ6g4a/1LpaHo3vPps6+GLDoNWMa1bo5/161BzfrKHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiF7NgUVWwLGLycQcERo9lzJhXfqxkaZKoOjK1Q1nNvne3gQ+r2EnYeDHGrv/8qaZ
	 9bie6bhk20wB50TBj2yQibfvBvSCNtby7xuDJu85p86JFipdNcHYzXPI2bqDClAGqj
	 ILNKuqIM36ZzZKiMFkd3Gvh2c1Dp2KpcaqS+w4uDzD/57fVX2kFdXaZnKM6uBhxnkW
	 gk7TVQqbEXxgoELcQ0NM9AaLI9pA5dD/ICnwlXfUWXri+WtY/+0Tcp02wZ1K2bgjgo
	 9qS8ljvu/3+Yj5WggfW6j8c0TEfTO5XvWEiR7VjEh+K9i04f0ZJQEjpYSY0lrFXB9k
	 3kS7Ah5/asfEw==
Date: Mon, 19 Aug 2024 22:01:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	claudiu beznea <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <k77hjljb26vc42jq3vqhjettq46atokyduwmb4qacwg63hpuca@6haxozdz2riv>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
 <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
 <e6377448-9af3-4807-a8fd-197f5b2b4aa4@tuxon.dev>
 <56204f92-d1d4-4681-8a9d-f28925919ef4@kernel.org>
 <20240819-sizing-devouring-17b74473d1a1@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-sizing-devouring-17b74473d1a1@spud>

Hi,

On Mon, Aug 19, 2024 at 05:39:35PM GMT, Conor Dooley wrote:
> On Mon, Aug 19, 2024 at 01:22:39PM +0200, Krzysztof Kozlowski wrote:
> > On 19/08/2024 13:10, claudiu beznea wrote:
> > > On 19.08.2024 14:05, Krzysztof Kozlowski wrote:
> > >> On Mon, Aug 19, 2024 at 01:23:44PM +0300, Claudiu wrote:
> > >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>>
> > >>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
> > >>> the version available on Renesas RZ/V2H (R9A09G075).
> > >>>
> > >>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>> ---
> > >>>
> > >>> Changes in v4:
> > >>> - added comment near the fallback for RZ/G3S; because of this
> > >>>   dropped Conor's tag
> > >>
> > >> That's not a reason to request a re-review.
> 
> FWIW, I don't care about how many binding patches I do or do not get
> credit for reviewing. Feel free to give a tag yourself Krzysztof in the
> future if you come across these situations and I'll happily hit ctrl+d
> and remove the thread from my mailbox rather than reply :)

I'm OK with third parties tags as long as the person is Cc'ed and
it happens in the mailing list.

It's not unusual and I check they really happened, anyway.

Thanks,
Andi

