Return-Path: <linux-i2c+bounces-1114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 551848241DC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 13:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBBF3B23D73
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 12:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453AD21A1C;
	Thu,  4 Jan 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQMFOwfV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C4421A17
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 12:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E281C433C7;
	Thu,  4 Jan 2024 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704371795;
	bh=WTnSTLWTpcsxP68BJlplYARARnwD3ck6cI4RPWH7K9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQMFOwfV89FocxbAGLEBx0yOfXa2pZ2zsUBFJq0czWzMyqXkR6EdXMcXuqSZUAiwm
	 l33HMmttuT4nSHcfNkXCNEpTe8ySDvBppYeNOWCj1uvSrNOoP2n5Ae86tiW9uSXQ0P
	 TXYXGxnD7Vkx6dYIEUJ9uS296ncNSPQeqT/XPE8hlaSDd6fpiBll6Nnui2NHafZAfL
	 6s40f3QdM8sTne1ov+5/+39ZJ2Pu8dmGBf6H3Wwm7yktpqJ2kUNJNC7uobpxqEmN0X
	 mAAxpmDEFm0D0BCPlujy35ilVwjHUaIDZtiPoOsf+hkvoItDDwv9NIRvSQsNQGnfAy
	 T7crlw3t+toxQ==
Date: Thu, 4 Jan 2024 13:36:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 4/8] i2c: wmt: split out common files
Message-ID: <qejha3sggk2yrphrh3fkwfhpgrvvih24xglsirgsrrjzwf2x3t@nvqbinp6kam2>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
 <a3156a84-20da-488d-823b-7cdb149c7fa6@zhaoxin.com>
 <didspodgkj3rthhydnwvhrbpomxx375si67pmfl6vuysrcuurp@a4qbekhbc5el>
 <8a437732-b74f-436d-b267-f274f917e638@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a437732-b74f-436d-b267-f274f917e638@zhaoxin.com>

Hi Hans,

> > > > >    MAINTAINERS                            |   2 +-
> > > > >    drivers/i2c/busses/Makefile            |   2 +
> > > > >    drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
> > > > >    drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
> > > > >    drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++
> > > > 'plt' stands for?
> > > 
> > > 'plt' is short for 'platform', since it is not suitable,
> > it's suitable, sure... but not immediately understandable. Your
> > choice if you want to change it.
> > 
> > > do you think it is better to change it to 'i2c-wmt-platform.c' or
> > > 'i2c-viai2c-wmt.c' ?
> > I would rename things to:
> > 
> > i2c-via-wmt.c
> > i2c-via-common.c
> > i2c-via-zhaoxin.c
> > 
> > But of course it's not binding.
> 
> 
> if so, I choose to 'i2c-viai2c-*.c', because there's already a driver called
> 'i2c-via.c'.

ack!

Andi

