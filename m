Return-Path: <linux-i2c+bounces-1106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD32823E7D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C27AB21786
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8B72031E;
	Thu,  4 Jan 2024 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW5cPXd/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AA2030F
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 09:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBB6C433C7;
	Thu,  4 Jan 2024 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704360152;
	bh=4w/HKoE2TavhG9ffpA7qZv02rh2VTwWf0g2gBhNhZuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hW5cPXd/KN1UU3j/6I8QxPEEaie1xGL5o6PY+pslC8Oz16n7kypYXCmNPSxHamUh8
	 V8Gr37ck/LmVLfH4f8xq+zlQHJ7lceZsQ5wC+0Jv4YrXTrf8RojD25unqKd4g8Qubt
	 KwpeTsrQbKMP6rwxg0lUL5uLjKT2vsQ+B7W7618XuU3FQSfGPXbzFpU4ibn2YHuk39
	 MUyVhZGdkw75WXW9k8QMwpTdQnFOAGs5wODBxLdQEYHYy2zNjpRotzQkBibSdwyMrd
	 Nf+P//0s2Kgui1rrpdruldrUKJv/vL4H8jprNzQz3uKcJO4lbf4Uom6vByUdmop3hO
	 Fyp0WUYWa4pPA==
Date: Thu, 4 Jan 2024 10:22:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 4/8] i2c: wmt: split out common files
Message-ID: <didspodgkj3rthhydnwvhrbpomxx375si67pmfl6vuysrcuurp@a4qbekhbc5el>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
 <a3156a84-20da-488d-823b-7cdb149c7fa6@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3156a84-20da-488d-823b-7cdb149c7fa6@zhaoxin.com>

Hi Hans,

> > >   MAINTAINERS                            |   2 +-
> > >   drivers/i2c/busses/Makefile            |   2 +
> > >   drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
> > >   drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
> > >   drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++
> > 'plt' stands for?
> 
> 
> 'plt' is short for 'platform', since it is not suitable,

it's suitable, sure... but not immediately understandable. Your
choice if you want to change it.

> do you think it is better to change it to 'i2c-wmt-platform.c' or
> 'i2c-viai2c-wmt.c' ?

I would rename things to:

i2c-via-wmt.c
i2c-via-common.c
i2c-via-zhaoxin.c

But of course it's not binding.

Andi

