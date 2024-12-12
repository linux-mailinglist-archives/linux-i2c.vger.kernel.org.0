Return-Path: <linux-i2c+bounces-8464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80AD9EE619
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 13:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8610428783E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6689A212B1C;
	Thu, 12 Dec 2024 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EshvOJIU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B58212B0A;
	Thu, 12 Dec 2024 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004681; cv=none; b=B65OgbqdQvb8+xU9P+QRfzr0M5poSUY/efYppMsQlA7QIv9eJuf07Ja1EotuP6iG9evYen2Xt59JssEz+BosR+0BVUVywOKY0YVnFk083wYDbi/ukb07jHv2fkFi6ythEElHRXIp/aMJlpxXhwd02/YvW/wwjEV6z0jJWm8C44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004681; c=relaxed/simple;
	bh=9LjBuGLrxCe+g6plv0erkWv+VARnNem0wGIO13PZceo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4TYDfqCTCo+GR3TeDrHTnjkCX/d8aKE21J6UGc+QzJ5dlhrpaKznDwdN+/IKS4JL74539t7JpZEsLpr5uRDmURSWOtpIZAX0Pj95V3utDtJFJBbwLPf/0P+rTj9ziECDyl6U4MdQ0rpg4FcnjRTr5zhukmkeMyCHZftVGi8l+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EshvOJIU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13768C4CECE;
	Thu, 12 Dec 2024 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734004680;
	bh=9LjBuGLrxCe+g6plv0erkWv+VARnNem0wGIO13PZceo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EshvOJIUnaTCLuz5A4NhWzlqdicKcbeYUGXsGRTwq8cXP994B5Ay6VCMpvKyYfQ7f
	 brouHpowxOEy+uqED7Gcs8cgnSMAKZvxtwGW+eV5HK3FBe/9lTZeZHAYaBBeJMIfsv
	 cGaWbQzwoYBT1MqYepz764ksIolBl5b1gDmorden8GnW/guqBkg5yWO81OR5+06tLX
	 h9/Z2wmWF3h+ecYhXooXXyyxo3Zo5iz/JOhoXJdzBlybFhEQ+Zsc/a+U3ZnAs0MzwN
	 WAFu093f4pHtoSD/RfDHepci1jdyI83XM5hVsTwA68VeWUnef1MPE7D15AjYZByXbG
	 Vsk2pzjLjJH9g==
Date: Thu, 12 Dec 2024 12:57:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Always round-up when calculating bus period
Message-ID: <peodxpeu4nh3a4lmrmu66237tvucgx5v46rgq6uwqwcbvy44ev@zfwiqfpjod4z>
References: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
 <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
 <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com>
 <nlk3esdnddvnfxj3peuldcblxnbninnmhpfu7n26tbyq2swqzp@z456toyekd6z>
 <CAMuHMdWYt3AsDq9wiXiZS__nnd2QXSPBvu0vT5dQLeJsyV9b6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWYt3AsDq9wiXiZS__nnd2QXSPBvu0vT5dQLeJsyV9b6w@mail.gmail.com>

On Wed, Dec 11, 2024 at 04:46:45PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 11, 2024 at 4:43 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > It's a pity that all this description is lost. I love long
> > > > explanations especially when they come from test results.
> > > >
> > > > Can I add it in the commit log?
> > >
> > > What about starting to add Link: tags pointing to lore to I2C commits,
> > > like most other subsystems do?
> > > That way people can easily reach any background information (if
> > > available), and find the corresponding email thread where to report
> > > issues or follow-up information?
> >
> > To be honest, I'm not a big fan of putting links in commit logs
> > (not even 'Closes:') and was happy not to see any here. If the
> > domain changes for some reason (which always happens sooner or
> > later), we'd just end up with a bunch of broken links in our
> > commits.
> >
> > If others want to have the Link added I can definitely add them.
> 
> In general, we assume kernel.org will survive...
> 
> > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/maintainer/configure-git.rst#L33
> >
> > b4 can add the link, as well.
> >
> > If you prefer, then, I will take this patch as it is.
> 
> Please do so; thanks!

merged to i2c/i2c-host-fixes with the Link: tag.

Thanks,
Andi

