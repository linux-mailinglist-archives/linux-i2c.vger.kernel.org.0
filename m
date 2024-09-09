Return-Path: <linux-i2c+bounces-6403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB939971A26
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FEA2283955
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719001B86FA;
	Mon,  9 Sep 2024 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4NVS6Sl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF901B86EE;
	Mon,  9 Sep 2024 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886628; cv=none; b=GbcBUSnqsxR4/daWnMu7NsU8bGnlacAsvaFSd3OUjVQHMC4krrVWJuIsrbLiGuo2H9EmlWsXcXjzzJppsvFeLjXJ8cv/0N9ABLf/fQYBSkUMUQE0kpnjkNoOm/2w03E9c2d9ooUBN8yum8A64EiYYH0l6IYC75HnFS5QZBU/Cro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886628; c=relaxed/simple;
	bh=n1LtFgen2lM9wDK2rBgOQxPzxNJOXud50nqNizGKKoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkNlh4FGckyHdeZC133HuYNihjb/tVYnhRlHHQB3PAWFtmW7tNoAOHtXnHq210Cx12cBZIyTwCDWBjGnsFyB1Ud+CpKTWbSVDwo02dkF1oiPiT0G/rwxTn29sgnTInADjxxWjIds4LJAT2jhqjm3LN1vTBrMLf9jP8Yj613xgNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4NVS6Sl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0746EC4CEC5;
	Mon,  9 Sep 2024 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886627;
	bh=n1LtFgen2lM9wDK2rBgOQxPzxNJOXud50nqNizGKKoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4NVS6Sl/mpDVc76o61sNyZZWAnteT9uMb/RNeRdfJMDPr/i7R6sQ/le8t+iGghoC
	 dmzDrVBEBII2dyxxWUS7ygw5EDxMAYDz8S+NLvHDL36wt8P8omaajqyFvtT5dKJySP
	 mQlLpZWZ+e7xXfjHdX95O/WBpOQSS+5TxP/Gporh3hVZIUaF1mR5cR43a5TJrKdTUj
	 B+B4kp6dmJ1tlUfRjFyycyB5thY5R+24dftbTIu6BTE11D4UCrCggI9VIlNU0oSsgd
	 xbRlQDkcpWUp1bo9LuVOUEBKPphoGNAQQaOXB/zWv6olrAv1sCAtKukMUYyJMRAQwz
	 Dnm+0POZAVqqQ==
Date: Mon, 9 Sep 2024 14:57:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
 <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>

On Mon, Sep 09, 2024 at 09:56:25AM GMT, Tyrone Ting wrote:
> Hi Andi:
> 
> Thank you for your review.
> 
> Andi Shyti <andi.shyti@kernel.org> 於 2024年9月6日 週五 上午5:43寫道：
> >
> > Hi,
> >
> > On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > > Modify i2c frequency from table parameters
> > > for NPCM i2c modules.
> > >
> > > Supported frequencies are:
> > >
> > > 1. 100KHz
> > > 2. 400KHz
> > > 3. 1MHz
> >
> > I agree with Andy, please add a good explanation for this change.
> >
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > ---
> > >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
> > >  1 file changed, 144 insertions(+), 86 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > > index 67d156ed29b9..cac4ea0b69b8 100644
> > > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> > >  #define I2C_FREQ_MIN_HZ                      10000
> > >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLUS_FREQ
> > >
> > > +struct SMB_TIMING_T {
> >
> > Please run checkpatch.pl before sending the patches.
> I did run the checkpatch.pl against this patch.
> Here is the log from the checkpatch.pl:
> -------------------------------------------------------------
> ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
> -------------------------------------------------------------
> total: 0 errors, 0 warnings, 265 lines checked
> 
> ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
> obvious style problems and is ready for submission.

mmhhh... I thought checkpatch hated capital letter declarations.

Please, then, use only lower character names for declarations.

Thanks,
Andi

