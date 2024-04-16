Return-Path: <linux-i2c+bounces-2976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E72638A6D63
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 16:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE2228617A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 14:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BEC12CD90;
	Tue, 16 Apr 2024 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJ+6c1nm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E612C534;
	Tue, 16 Apr 2024 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713276545; cv=none; b=L8UdPSOVqi7WZTMMEpyHUuFdgblEvkm2bV96lvnmh3neXqGkf/huwVYEvdGkTXPfAZ4DSCtB6qlKglc3Qn+eQ90Id/b0omaZ8rYwy4wv2qyVNrQ4eaccWjE+ePApcDnbNwQPXnWEFTl8gdOXVRuWN0VXYwluSBdpCjBU946wNrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713276545; c=relaxed/simple;
	bh=ztYAfRqyCAO4TihC8giRcF/Rn09DqX63ao2fuDHUQw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVKV4dMMYDl57NHNWDExkfkIVc8CTvuth4eELvIh1it3rNNKvXI1S1Lp9fHEs4G14GtQpwHjhvdgcabHH5BttdxTlFB8m1BUMSIsCA1ScrPwce9K2jofggE0fWnE8BKPmFo1Yyi+MVRECHSDAj21TsWW/NXpHFg/7Yu99QQatZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJ+6c1nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB11C113CE;
	Tue, 16 Apr 2024 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276545;
	bh=ztYAfRqyCAO4TihC8giRcF/Rn09DqX63ao2fuDHUQw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJ+6c1nmWW33jynK9xJcmJix7xN9eJXDw9YZXIlotYkpCMvOe4Hz06JcAopp+ESCC
	 TRcx5jYGQ5+GTwyxMZjuYQyLCcfn6Q6g90hYYEMaIwgZJ1EKJI18PSsT+CcdgCKBPP
	 ckNB0R3kvGQVz1kWzQN5c6OFcd6ozWBU5KmMBQ4sSwm26ClhcOo+PtxMzFXFB2KLby
	 EaOShXvLC4lv2fNdsGCtXQjuc/HIqF7g/iXvKneJgvstUzwtKIdwUfewhmBn/+dB5C
	 xFedLa5tmj4cZwHMvZP0TC2XNSHxymDJts1tHD/RVaN3mku46MZp/ptcPw2lDvzuoP
	 3/bEFoWIdQY4A==
Date: Tue, 16 Apr 2024 16:09:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Abhinav Jain <jain.abhinav177@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-ID: <y5yjitgjf3v4tui6wrg5x4ltuaieugzgkk7aiggefqxfbezdev@t36fwhrzrxsz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
 <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>

On Tue, Apr 16, 2024 at 04:07:48PM +0200, Andi Shyti wrote:
> On Tue, Apr 16, 2024 at 03:59:13AM +0000, Chris Packham wrote:
> > On 16/04/24 08:54, Andi Shyti wrote:
> > >>   	/* Enable I2C interrupts for mpc5121 */
> > >> -	node_ctrl = of_find_compatible_node(NULL, NULL,
> > >> -					    "fsl,mpc5121-i2c-ctrl");
> > >> +	struct device_node *node_ctrl __free(device_node) =
> > > How have you tested this?
> > 
> > I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> > linuxppc-dev?
> 
> that's why I was asking, this would be the first driver in i2c
> using Rob's __free(device_node).

Jonathan's, of course :-)

Andi

