Return-Path: <linux-i2c+bounces-7834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D255C9BE301
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85F8A1F25175
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A700F1DC19D;
	Wed,  6 Nov 2024 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFVBn55P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C791D54EE;
	Wed,  6 Nov 2024 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886388; cv=none; b=XRr45CpZocpgxRDxXWDQ73VmFghJmxQvZPQ4p5+7OYDgnba1Mnn+eSS1wNYpuSWK+PFPS6DdMb8H9QrK6J8HDZ1NHWqJEsQbCqxpHu20NAXmvpBrON7x2y0bqgl18Ae47nMN5CEWExr96604rygZxGcHjTV/WUjkARVTyKfrrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886388; c=relaxed/simple;
	bh=YJbgmhCR1V4d2ghT3gDkyVoynkwejRu4bVzz3P6hpGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omuANWGgUvjHeHVP11eRwjXWkCiSL56PhXOsTIOzbwoIs1i8nGgnllYoUI6MzvBiou11Ftl22xAvm380mc7hLwvI2Tc/sZf/9lnay5SH7h2Ts5+K+kHf8x1glC0LaYxDr+9sqAlZEbx2QKlhQMsHhDLWTxdoMW63sWorYQSgRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFVBn55P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724EEC4CED0;
	Wed,  6 Nov 2024 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730886385;
	bh=YJbgmhCR1V4d2ghT3gDkyVoynkwejRu4bVzz3P6hpGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFVBn55PbfH3tjFxeLtezBfNLp59aV7gxETVJDmk52/fh1Rjjse3UZt9yME34nL8S
	 OIxuVSokPbVhx0AXFP3N4DlX6Adnqq55JqGF62KakAIkyqpglWd/XEAas4flaKbg0j
	 Ucl3Vouvd69O7xzCf4oIXpsIIKM5rEQ1JULrXGaAVjg2nu5fVB5pKJ/Bwa/mxlKIas
	 vKuseC6jzQeBvVF6e8bQWjkEtaaM3IbWsUI7zyiDhlzRX2y0WVkt3uP0oHZ7DRcQ16
	 qrpekVOnofESuQRUXGjU5U24ONJ6Rz/1M/Ui2dS2/mXJbuMA5jcp5zy20+eHgSHwf9
	 Oz5HL7JbyJShQ==
Date: Wed, 6 Nov 2024 10:46:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Liu Peibao <loven.liu@jaguarmicro.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, "xiaowu . ding" <xiaowu.ding@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master
 holding SCL low when I2C_DYNAMIC_TAR_UPDATE not set
Message-ID: <lv7hm72ngmjohh3hd3tsiawh47pjcyq76iw3weboytfcywttmt@jjrcuwan74rw>
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
 <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
 <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>

Hi Liu,

On Wed, Nov 06, 2024 at 03:27:42PM +0800, Liu Peibao wrote:
> On 2024/11/6 4:30, Andi Shyti wrote:
> > On Fri, Nov 01, 2024 at 06:18:36PM +0800, Liu Peibao wrote:
> >> On 2024/11/1 16:44, Andy Shevchenko wrote:
> >>> External Mail: This email originated from OUTSIDE of the organization!
> >>> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
> >>>
> >>> On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
> >>>> When Tx FIFO empty and last command with no STOP bit set, the master
> >>>> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
> >>>> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
> >>>> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
> >>>> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
> >>>> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
> >>>> when IC_STAT_FOR_CLK_STRETCH is set.
> >>>
> >>> Who are those people? Why Angus Chen is not a committer of the change?
> >>> Please, consult with the Submitting Patches documentation to clarify on these
> >>> tags.
> >>>
> >>
> >> We have discussed and analyzed this issue together. I developed this patch.
> >> This patch was also reviewed by Angus Chen and Xiaowu Ding.
> > 
> > The tag list follows a specific order: tags are sorted
> > sequentially, with the last Signed-off-by (SoB) being the person
> > sending the patch, which is your email.
> > 
> > The other SoBs are fine, but if someone contributed to
> > development, consider using "Co-developed-by" instead.
> > 
> > If someone tested the patch, use "Tested-by"; if they reviewed
> > it, use "Reviewed-by"; and if they simply agreed with the
> > change, use "Acked-by."
> > 
> > Please ensure that "Reviewed-by," "Tested-by," or "Acked-by"
> > tags are visible in the mailing list. I do not typically accept
> > offline R-b, T-b, or A-b.
> > 
> > This is why Andy asked about those contributors. Three SoBs can
> > seem unusual, but it's acceptable if justified. Reviewers may
> > ask for clarification, and it's fine to specify contributors'
> > roles. You can also provide extra details after the "---"
> > delimiter.
> >
> 
> I think this tag list should be much better than the original. ^-^
> 
> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> Co-developed-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
> Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
> Co-developed-by: Angus Chen <angus.chen@jaguarmicro.com>
> Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
> Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>

Thanks, this make much more sense now.

Just one question, do we want to keep xiaowu.ding or Xiaowu Ding?
Can I change it to the second way? It looks better and that's how
it's normally signed.

Andi

> >> And in this case, should I replace the "SoBs" with "Reviewed-by"?
> >>
> >>> Also, sounds to me that Fixes tag is needed.
> >>>
> >>
> >> How about this tag:
> >> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> > 
> > Sounds reasonable.
> > 
> > For accepting this patch I need an ack from either Andy, Jarkko
> > or Mika.
> > 
> > As long as the fixes are limited to the commit message there is
> > no need to resend the patch.
> > 
> > Thanks,
> > Andi
> 
> Got it!
> 
> BR,
> Peibao

