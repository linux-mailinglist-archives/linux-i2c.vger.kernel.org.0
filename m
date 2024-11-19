Return-Path: <linux-i2c+bounces-8062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D329D306C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59856283E2C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7871D47A3;
	Tue, 19 Nov 2024 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEpwJ3MG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120601D3629;
	Tue, 19 Nov 2024 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054962; cv=none; b=giuomzttTF8LpDWBMLQoqEw/xeS+7GqgbLQc3oZGIYHyQfwjWEgXc/CzWc+w5NLDGIWagn2x3u9H0yCILyFERuUpJwxuUlub1ktcyWbdoLG7YtzUn3pRs8yXpsnh67t8oTH94HVRL+IeOmSEBd26TF+GmWoST3H1SPw0Vv9yJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054962; c=relaxed/simple;
	bh=zqKj2HCLC2L9GHTZn+KhLac8fwhAptxey2L9oF72u1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4ivg82o/xX8XMdbBsAbAVUhht9TCNdFD1E6BpD79+fOtiI9/92Er6E9LzUbDFKWq0rQGe80eqS2DNF2w7Gm/WXfCx8QR7oXtxjm3xY3M5vQXF3mfyshTEcVr8Z9mbOa1ljggOu64ws1C4rSwjQUgJ1x0uXLhiYI10ltrlCLrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEpwJ3MG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ACCC4CECF;
	Tue, 19 Nov 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732054961;
	bh=zqKj2HCLC2L9GHTZn+KhLac8fwhAptxey2L9oF72u1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEpwJ3MGZvf21K+uD84+JsfQMN4Dk31IaVnCzT7faclZ/R84rYlx6ibPGzFBbgCgU
	 Y36yAZnPHA9MXqWnPGuPiZrBHQO7yzlKHiNMvv+o+x/Txi5bQRDpBw5RItTfdMdgjp
	 jOOrfGr/RNxXkPf01C+Mpg0UPZuaQtt6C2WFBW9N7aqHGMcxBuhBX3iFCEd307OQHw
	 EGTTrs4C7wIT/SWxUVoSmd5XlQ+HFeJZGf/T0g6Ahe5HiqFKfQb5Cl3EfIfCepPxoZ
	 kLo12uAi+2hiZWCjyRLSO0QcGhfHjp2H3Fn188SHBEWtUh0O23h0ut6VM3HW/9LVVs
	 kh3z6DRR1ok1Q==
Date: Tue, 19 Nov 2024 23:22:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>

Hi Tyrone,

Sorry for the late reply!

...

> > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > >       }
> > >
> > >       npcm_i2c_init_params(bus);
> > > -     bus->dest_addr = slave_addr;
> >
> > We can now get rid of slave_addr. It's just used in
> > npcm_i2c_master_start_xmit(). Right?
> 
> Yes, slave_addr is just used as the link
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L2182
> suggests with this patch.

What I mean is that slave_addr now is completely unused. We
declare it, we initialize it to msg0->addr and it stays like
this.

What I'm suggesting is to remove it completely.

Andi

