Return-Path: <linux-i2c+bounces-1115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EC8241DF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 13:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD21B21180
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400492230A;
	Thu,  4 Jan 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1+Wg2gz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55522305
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 12:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3160AC433C7;
	Thu,  4 Jan 2024 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704371841;
	bh=4MCMf0APH4rafszsvOJ2HGBbl5CN5EtpZyzJNtvfX0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1+Wg2gztm/BOr10ljznUQLSewFbqIEW7MyBkEAtrjO7EMm6LWm3EgCI9ezcu7NGZ
	 9KuoW9CQ3bQnDj88x1juGFeW2rzcr+udaobS96aVukL40h5nARepLC2Ac1Df0h+JBk
	 KQheordjUri2U4ucT2y/4VTaC8FcxDVsnFxRd/KGCiSgOJaPLDRUA1Freg4HeKEGsD
	 MiJutq71P2IVgIMr7IXriQMooFJv3ELwdGFv2u22eDP7NbYGbduHKMwtIuN8qfil7u
	 6O3R7Poi69RrmhFIl3i9+GW/zS4rfH6VltzmlfZ9uFkDHiTh6U2+se9E4sfVyicanp
	 d4NKi00Y7pEpA==
Date: Thu, 4 Jan 2024 13:37:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
Message-ID: <egudwcava74ctk6rv2vcnysfurgra356yhrdeov333iij3c7ic@pr3faonf6ceb>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
 <249630b9-e1d7-4f3a-b053-02edcc50bf42@zhaoxin.com>
 <hlsrxgsmrnhieswh3rdytrs4a5qzkrw4h7pcsupmwkrtoijhyo@begus62i5p77>
 <9a1dc790-52a6-45b2-97ec-5445d537e5f3@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a1dc790-52a6-45b2-97ec-5445d537e5f3@zhaoxin.com>

Hi Hans,

> > > > > @@ -58,6 +58,8 @@ struct viai2c {
> > > > >    	u16			tcr;
> > > > >    	int			irq;
> > > > >    	u16			cmd_status;
> > > > > +	ktime_t			ti;
> > > > > +	ktime_t			to;
> > > > don't these need some arbitration?
> > > > 
> > > I don't think it needs to be arbitration.
> > > the controllers are independent of each other,
> > > each access is locked using __i2c_lock_bus_helper().
> > > Am I missing something?
> > no, it's fine, it's me who missed that. Do you mind writing a
> > comment?
> 
> 
> ok, will add a comment like below:
> +    /*
> +     * During each byte access, the host performs clock stretching.
> +     * In this case, the thread may be interrupted by preemption,
> +     * resulting in a long stretching time.
> +     *
> +     * However, some touchpad can only tolerate host clock stretching
> +     * of no more than 200 ms. We reduce the impact of this through
> +     * a retransmission mechanism.
> +     *
> +     * Since __i2c_lock_bus_helper() is used to ensure that the
> +     * current access will not be interrupted by the other access,
> +     * We don't need to worry about arbitration anymore.
> +     *
> +     */
> +    local_irq_disable();
> +    i2c->to = ktime_get();

ack!

Andi

