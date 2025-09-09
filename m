Return-Path: <linux-i2c+bounces-12805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D840EB4AADB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93EE9346BC7
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14CC2D1913;
	Tue,  9 Sep 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McfoQ4gD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C14028DB3;
	Tue,  9 Sep 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757414523; cv=none; b=Bb0rZf6MbUEkldHUkcAVm4QTRU2R0mprNfv8/7T8z/WcBEja5iTBBAD7Jzqm9DVrsx+QzD1x/hjqggzxXfapgOZIa3Anz8iaN/AKuhG9sqqgISxVd/et0897K2VFV3uLelZSE+K/bk/32uB+fBFmx3pk2b6eTFRLabsdCrp9720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757414523; c=relaxed/simple;
	bh=ZjvOrSWVcVf5YAynr8zKeTMjoU2jc4ng9s5RPK12NbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/+97Cvnn6ajc6UbrNQn38B93ZtLKybHtFOIUfygi7J/hAoLskua12J4IOYW7BkVcfekMuhaj4WCIic9zuQ4cnGwbwrimR+dBGj071x9+fpdUtRLy+Gkyz7D7XJI1BESytazeO/TK1ka7XD/hNUpJGEGFjpC1bew2PsKqUyyZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McfoQ4gD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129D3C4CEF4;
	Tue,  9 Sep 2025 10:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757414522;
	bh=ZjvOrSWVcVf5YAynr8zKeTMjoU2jc4ng9s5RPK12NbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McfoQ4gDFpUfqvvhW8JCPU0Bouf+Ecc5S6c8dckZKyY4c93J2zLEBGGPZ9yGoDqKE
	 vs98zwJ4COzBUGJeEPzWquI0PKQ5nDm8VJGCFjDma0+3b/RVPGPhGijdgYZVnFfD1z
	 uT8q70OB34x6Hvrpw7bsZzPBYjnsqIuXaN1lUvSdESIusdwOLULICBk5c8riNhB4n6
	 9ygtRErF5j0YtL6ssCAulrrqcHEHc8tK3aJFfb6ciJHQFWutMTV70Gw/4PgUAc+XEk
	 c1uDjgXyLOtMeKhALfDs5C1ZgVJ4B++KLdoBpO5loJe5J2zaZJxz6Re5atOi+WIXLK
	 o9KfNg2k1SBcg==
Date: Tue, 9 Sep 2025 12:41:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <c3d57np3hns3yoklgkbpc2ivx7jrd5qwz76wcwxhnef3ermdve@3ejfxfwg3acq>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
 <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
 <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>

On Tue, Sep 09, 2025 at 11:50:15AM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 9, 2025 at 6:17 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > > index ab456c3717db..dee40704825c 100644
> > > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > > @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >  {
> > >       int ret;
> > >       int left_num = num;
> > > +     bool write_then_read_en = false;
> > >       struct mtk_i2c *i2c = i2c_get_adapdata(adap);
> > >
> > >       ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> > > @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >               if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
> > >                   msgs[0].addr == msgs[1].addr) {
> > >                       i2c->auto_restart = 0;
> > > +                     write_then_read_en = true;
> > >               }
> > >       }
> > >
> > > @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
> > >               else
> > >                       i2c->op = I2C_MASTER_WR;
> > >
> > > -             if (!i2c->auto_restart) {
> > > -                     if (num > 1) {
> > > -                             /* combined two messages into one transaction */
> > > -                             i2c->op = I2C_MASTER_WRRD;
> > > -                             left_num--;
> > > -                     }
> > > +             if (write_then_read_en) {
> > > +                     /* combined two messages into one transaction */
> > > +                     i2c->op = I2C_MASTER_WRRD;
> >
> > i2c doesn't change for the whole loop so that it can be set only
> > once outside the loop instead of setting it everytime.
> >
> > Something like this:
> >
> >         if (i2c->op == I2C_MASTER_WRRD)
> >                 left_num--;
> >         else if (msgs->flags & I2C_M_RD)
> >                 ...
> >         else
> >
> > looks cleaner to me and we save the extra flag. Am I missing
> > anything?
> 
> It looks correct to me, though I think it requires a comment explaining
> that "in the WRRD case there are only two messages that get processed
> together, and the while loop doesn't actually iterate", and reference
> the block where the WRRD op is set.
> 
> Otherwise someone is going to look at this snippet and think there's
> some corner case where all messages (# of messages > 2) get handled
> using the WRRD op.

Agree, indeed I wanted to write it somewhere that a comment would
have been nice.

I'd appreciate a comment even with the boolean flag. I think
boolean flags are often a forced solution and we always need to
describe their need.

> So maybe it looks cleaner, but it requires more context to understand.
> Whereas in the original patch, the extra variable sort of gives that
> context. In this case I prefer the context being more visible, since
> the original corner case this issue fixes is also from missing context
> and assumptions.

I think both solutions are clear in a different way. Anyway, I'm
not very strong on this comment, I just see that from a code
perspective looks nicer. If you guys insist, then I will let this
go as it is.

Andi

