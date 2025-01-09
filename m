Return-Path: <linux-i2c+bounces-9007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B5A0798C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D7A53A1784
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 14:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F31F21B199;
	Thu,  9 Jan 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYW+XGrt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB2219E8F;
	Thu,  9 Jan 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433893; cv=none; b=VdtUe8IBWGaKSfE4I/jPOfmtJJmYYU4ssgiCSEnjpd0p55L7kCZ+TVQrOCemSD768Icn7C5+pFbWfdnPQCgFc9E9YQj3zrfEhlDgs7jCqfIvaYdnpKiRAW1UKhwxoqebNXE6Oy9SZI/nssuwjh+1youCGs46X8eODtedXgGYwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433893; c=relaxed/simple;
	bh=VpqBoB4h45QwFyE95aGaHFci3HwPnjrCE1b2JhZ/1mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvmEOGzZWQZbEGgsmBujnLuQNGu+FVu1UUJzp6v2Cku4seqBu9aQNW84Dz5TfqXGMONplFP3BTsftci2tBBy+6GhWAFQEZd2dk5+rhkQLkeXF6cqYD//qIVLHCzrc9Wx+mGO01FQvG8t+JcbikwbhMxl3KgJTmYswAuwqAgTFkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYW+XGrt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B4C4CED2;
	Thu,  9 Jan 2025 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736433892;
	bh=VpqBoB4h45QwFyE95aGaHFci3HwPnjrCE1b2JhZ/1mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYW+XGrtXKf0tEsipvyu2rw1Vchuv1pC/FD73KGTUOAX9/BY2nHBS/rHuTC+06K7s
	 NB1B1U/dwE/9HMtb7DNqhxicGAHnfP1l7/LLzPiFeikAAq27njZB/to8JZeZe3DVKi
	 PT77AlVGq3kRMBBEajwOxMqpz9/2/Lc3z8AfdPZ181xXVNSP1CWUTRMvE6VKoDY8kc
	 hUKA3rtapIaffHWywipxglDNor8K8AOAiygU1tJw9IW4fksM3c1r7hBNGDWQq8KsFe
	 d6Be6EeptETJzS+UNQ3JY7HwZP32nOfkae3p5nFTUZiqgVN4KZHzWwhjFI5TRV3O5B
	 Kixl8Juv33kLA==
Date: Thu, 9 Jan 2025 15:44:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
Message-ID: <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
 <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com>

Hi,

On Sat, Jan 04, 2025 at 08:15:56AM +0000, Lad, Prabhakar wrote:
> On Fri, Jan 3, 2025 at 11:54 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> > I will need for Andy's ack here because he had some comments.
> >
> I'll have to respin the series fixing patch 1/9.

if you want you can only send patch 1. It's OK as far as I'm
aware of it ;-)

I pinged Andy privately to give an ack here, we still have a few
days to the merge window.

Andi

