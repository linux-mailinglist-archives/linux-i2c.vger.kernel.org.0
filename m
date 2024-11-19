Return-Path: <linux-i2c+bounces-8061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 709EC9D3041
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EEE2B23C59
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3A01D1F6B;
	Tue, 19 Nov 2024 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tV62R8QJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFCB199FDD;
	Tue, 19 Nov 2024 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054140; cv=none; b=f+FzGir6G6DWlnJfjrKBPN0wtF66ZpQbGlZum8tuZfOrIqY6CvXhnJ1cHS/1ox6CuqO5TMpf/+F8GZVGOc7dD/6n2j0LyKHxYN7GvbhMQU9aQqUZhQhiBKrmdoYSIQ4zx6k/C59c0cjnnKoCE3HuJFhqY1vYE9T8NSoAZQd2jY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054140; c=relaxed/simple;
	bh=j7oi2RpEsC+JLluTl0fzDl1uvevxNhnsim4ubAK8WLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o032dI7r2dR31tn9HRbIRo0oZ7+JIrxMN3aZkXOl2JBrcSRHVua+a3JpxKNb8naVrsSS5yMb16ETMM7Am6DcFU2TYsiGJycF1J2wmxp03LGncLBp+Oh4txZp2mbRwm5Ry4OP9jqXsoCiGXabduqXLT4+hV0FIRxHl2gwAq5+y2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tV62R8QJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA888C4CECF;
	Tue, 19 Nov 2024 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732054140;
	bh=j7oi2RpEsC+JLluTl0fzDl1uvevxNhnsim4ubAK8WLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV62R8QJ6WWU75mdOAwk0fcyrp4DliyUCgFAyi2MZi0mE9S+7+jKgd6TEblvFBgZV
	 NU2wNVp/rqjLRGW6roxNBhvdGsbif1B6lUc7+vsFm/hWFmS/5wiHMHeEzY/NElqVnW
	 CfbEabHz5bJ/e4H7pEnXZ7Y0cG7b8SBhmBf/wYabr09ZQf9xIx5j7Ti2MVMKegCpez
	 U/4srwFMWtsZJtNcH4iJ/1upgrYWqkRAGAAetb6VivmueMod4MNFsYbaSEVoOoWN5c
	 qK6i236EULfpDXwfuPjUzcgntAmhRhpT4Vun1xba0CNqtEtylihAf6G/wbmfa7rkfN
	 VwuZI13vly7eQ==
Date: Tue, 19 Nov 2024 23:08:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin =?utf-8?B?KOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	Qii Wang =?utf-8?B?KOeOi+eQqik=?= <Qii.Wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <yi4ir6znmqjxvrbcbwnioxkdqyhsv74iwlridwh3nn7wmaat56@nqbqaa5zjil3>
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
 <20241106125212.27362-2-zoie.lin@mediatek.com>
 <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
 <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>

Hi Zoie,

...

> > > @@ -1486,19 +1528,22 @@ static int mtk_i2c_probe(struct
> > > platform_device *pdev)
> > >       if (ret < 0) {
> > >               dev_err(&pdev->dev,
> > >                       "Request I2C IRQ %d fail\n", irq);
> > > -             goto err_bulk_unprepare;
> > > +             goto err_clk_bulk_unprepare;
> > >       }
> > > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> > 
> > You had comments from me and from Andi on this delay, and you
> > completely ignored
> > both of us.
> > 
> > We're still waiting for an answer to our question.
> 
> I am sorry for any confusion caused by my previous response.
> The response to your question was included in the cover letter, which
> might not have been very noticeable.
>  
> The delay before runtime_put_autosuspend() actually executes
> mtk_i2c_runtime_suspend() depends on the frequency of I2C usage by the
> devices attached to this bus. A 1000ms delay is a balanced value for
> latency and power metrics based on the MTK platform.

Still you need to make it clear in the code. Please add a good
comment to describe why this delay is needed and where this 1000
has been found.

This is a constant that is not written in the datasheet, please
report how you have achieved this result. I want to avoid
arbitrary numbers inherited from the development phase.

Thanks,
Andi

