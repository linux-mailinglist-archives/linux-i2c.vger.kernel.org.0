Return-Path: <linux-i2c+bounces-9797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B9A5D30B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A085189AA98
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435B7233731;
	Tue, 11 Mar 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHwfdiPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23701D6DBB;
	Tue, 11 Mar 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741735001; cv=none; b=FvwMfU08meeY6zPRZ19Qi0I55ibCjUN9ia0AGlMcupf/nHC0I/xsNPkY7eH2YHeaBjpqF+qwZdJjGB0OZJiEf01BgwEXjOMARDQaoJ2ZFO7jjXWLOyr0G3gtR6DoxvVOl/ZNudApzXo8pY9lxOJ7GpWip8gEkG7uTiNXFX1zgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741735001; c=relaxed/simple;
	bh=PfimZx7PgZ/5Gi9CD2rOAcgt5dAWqfxSVWTYj2Jq5nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5HxK2FfUFhpIy/6rzorzWWYN8Hzx5XVAgZ5pKsMJY/puITgSNEjpENBJiNbl4KCz6+cctbpsyMeOavLqthBml/Ns6FhwUFjrhAlbwHQ9oit5f/Jf7byTmwH8hlEK1CxNTsDOHrn3MiHZDxJ963pHD4kHdDdK0dWnrM4S2A8zMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHwfdiPk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA6EC4CEEE;
	Tue, 11 Mar 2025 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741735000;
	bh=PfimZx7PgZ/5Gi9CD2rOAcgt5dAWqfxSVWTYj2Jq5nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHwfdiPkB4R7wXEfdDOvowQshJv8zRAnt6aBix9+yfuWB7qg34ggPKMQQe+8L1O0Q
	 uHRRPWfNw/VcezTLuYbGh2MIYNmLV+3rjTjf5vj/zNopgqy0TPvBR6xGHcHz/e9oFU
	 nlci6yxjSOIi0Z5UF5J8CRSh0NPMiWLIs/7sA6oL27ey1dpANMCybYfPSSj5Ucv5di
	 kkRvC9cXy0mgGsvCFhgsc85TLM8TQpS8trr0xJEdPx7XxmGr8joo6f4dwUoOcxbj6F
	 tTIURLvA0H7KKcS81zfVKv8E3ANKWuj0KsDDCk676xjgcbLFO1jyiDSjZqaZdItCIk
	 cIq/q4P18b2lQ==
Date: Wed, 12 Mar 2025 00:16:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin =?utf-8?B?KOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
Cc: Qii Wang =?utf-8?B?KOeOi+eQqik=?= <Qii.Wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Shunchang Wang =?utf-8?B?KOeOi+iInOaYjCk=?= <ot_shunchang.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Joseph-CC Chang =?utf-8?B?KOW8teasvea0sik=?= <Joseph-CC.Chang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Leilk Liu =?utf-8?B?KOWImOejiik=?= <Leilk.Liu@mediatek.com>
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <idbp6ckhu2pdt5p6vapcblqlinezpq5miqzl4hrzmlbgrniw7o@ucd42tvbtfmr>
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
 <46621db1-6096-46af-b021-c919c1cae7ef@collabora.com>
 <ec77bb9478cd86a6737b92135170064970925b3c.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec77bb9478cd86a6737b92135170064970925b3c.camel@mediatek.com>

Hi Zoie,

On Tue, Mar 04, 2025 at 08:37:27AM +0000, Zoie Lin (林禹妡) wrote:
> 
> ...
> 
> On Thu, 2025-02-13 at 12:57 +0100, AngeloGioacchino Del Regno wrote:
> > 
> > 
> > Turning on and off regulators at start of transfer and end of
> > transfer respectively
> > is very expensive and, while it makes sense for power efficiency of
> > the controller,
> > it doesn't make sense for:
> > 
> >   1. Responsiveness (latency); and
> >   2. Platform power efficiency at a whole.
> > 
> > As a start, just set the autosuspend delay to 250ms; this gives you
> > at least time
> > to bring up clocks and regulators and usually finish a transfer at
> > 400KHz, giving
> > you the chance to also get some more requests before autosuspend
> > decides to, well,
> > auto..suspend the device.
> > 
> > The right way of choosing an autosuspend delay a bit more precisely,
> > though, for
> > this device, would be to check the bus speed and calculate the
> > autosuspend time
> > accordingly.
> 
> We understand the importance of balancing power efficiency and
> responsiveness. Given the diversity of I2C devices connected
> under each platform, it is indeed challenging to estimate an
> appropriate delay time for testing.
> 
> Therefore, we would like to proceed with your initial suggestion
> and set the autosuspend delay to 250ms. Based on our preliminary
> tests, this adjustment appears to be a practical solution across 
> our existing platforms.

Am I understanding correctly that you are planning a v2?

Andi

