Return-Path: <linux-i2c+bounces-9501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9EA3C8C7
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 20:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D6C17724D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 19:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E0F22B5B7;
	Wed, 19 Feb 2025 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6QGdFvj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337122B586;
	Wed, 19 Feb 2025 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993442; cv=none; b=bL/oeYHJYTUtWLOQQ26CZbDPLTd+PJ6VXdADDl1GkokpUbRlmu7CA4cJW1Q3U+g0FSO9Yjcaq/xkQhEdsX9lr2h+BkiflISBMevX6BWqUkKPrkFVfw3L1W2LBXGLFUJJEMr/LpxA+q/JRpRpX2t+p9F+NTrCVD1kQJ2hHN77b6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993442; c=relaxed/simple;
	bh=nlfURqsENwca9Br0Avr6yzA5aZroODLokKesP8xS9Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+1D7A0v1JA+lZB1aedlDTaysMTPr07krCei7Cuv0JVoRJNs5jzQByai2YIAUDkq0LHmCZtdE68sPkmemE5pw4k15MH0n0jbBMcJilXWz/DwK1J0RIYOl78vdOIYQkbzMkO+TjgyLjzPv37vz5B4Fg2mGEwlvmQATwOsSVJJIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6QGdFvj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4135EC4CED1;
	Wed, 19 Feb 2025 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739993441;
	bh=nlfURqsENwca9Br0Avr6yzA5aZroODLokKesP8xS9Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6QGdFvj9rIWW2yeada2QUWeBL8IbBoH1OVXT8E5Jicua1Kd3HW6c7n2Z8q9lxeV9
	 u3M6KoqMGlj7QxkKS8KB/nbCezg2gjhbQj1IkSGnOhrdo8NrmKGCWPFsw7R24XZzBi
	 50F7j9pdZKrAed0pgh7tovkTklTVQv5F1XiBx7G0o66M9ihwrLgIQ4Xl6TNIN1ff7O
	 WfubniMHc1eGVkMGmilN0WklHU2q2QBarg6i2h8/InIVRuKnONEpBb9qJO+X6CNv87
	 DCy3BzJnasEEKpjnwPBaVQOQfkl2JFkJVsyKvatIwJEbSsPkogRd2p80wybdIrtVcD
	 KXLCuCNtx2Txw==
Date: Wed, 19 Feb 2025 20:30:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <sc54ro4pwg5j2lqelsryx7cdw6ipcdp4gfk3ce5sxsvk3s7wzp@wup2pgdzmxtl>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
 <Z7W1EJ7uGsaTZMRh@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7W1EJ7uGsaTZMRh@linaro.org>

Hi Stephan,

On Wed, Feb 19, 2025 at 11:40:16AM +0100, Stephan Gerhold wrote:
> Hi Andi,
> 
> On Wed, Feb 19, 2025 at 12:02:06AM +0100, Andi Shyti wrote:
> > 
> > sorry for the very late reply here. Just one question.
> > 
> 
> Thanks for bringing the patch back up after such a long time. I've been
> meaning to resend it, but never found the time to do so... :-)

We have a long list of forgotten patches that belong to the far
past. I'm trying to revive them.

> > > downstream/vendor driver [1]. Due to lack of documentation about the
> > > interconnect setup/behavior I cannot say exactly if this is right.
> > > Unfortunately, this is not implemented very consistently downstream...
> > 
> > Can we have someone from Qualcomm or Linaro taking a peak here?
> > 
> 
> I suppose I count as someone from Linaro nowadays. However, since this
> driver is only used on really old platforms nowadays, I'm not sure where
> to look or who to ask...
> 
> At the end, the whole bus scaling/interconnect is always somewhat
> "imprecise". There is no clear "correct" or "wrong", since the ideal
> bandwidth depends heavily on the actual use case that we are not aware
> of in the driver. There is also overhead when voting for bandwidth,
> since that can take a couple of milliseconds.
> 
> The most important part is that we vote for any bandwidth at all, since
> otherwise the bus path could potentially be completely off and it would
> get stuck. My patch implements one of the approaches that was used in
> the downstream/vendor drivers and matches what we already have upstream
> in the corresponding spi-qup driver. I think it's "good enough". If
> someone ever wants to fine tune this based on actual measurements they
> can just submit an incremental patch. Right now this series is blocking
> adding the necessary properties in the device tree and that's not good.
> 
> Surprisingly this series still applies cleanly on top of linux-next. The
> dt-bindings have review tags and there was plenty of time for someone
> else to chime in for the driver. So maybe you can just pick them up? :D

Yes, I already tested them.

> > > [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/67174e2624ea64814231e7e1e4af83fd882302c6
> > 
> > ...
> > 
> > > @@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
> > >  			goto fail_dma;
> > >  		}
> > >  		qup->is_dma = true;
> > > +
> > > +		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
> > > +		if (IS_ERR(qup->icc_path))
> > > +			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
> > > +					     "failed to get interconnect path\n");
> > 
> > Can we live without it if it fails?
> > 
> 
> of_icc_get() returns NULL if the interconnect API is disabled, or if
> "interconnects" is not defined in the device tree, so this is already
> handled. If "interconnects" is enabled and defined, I think we shouldn't
> ignore errors. Therefore, this should work as intended.

yes, because qup_i2c_vote_bw() checks inside for NULL values.

My idea was that:

	if (IS_ERR(...)) {
		dev_warn(...)
		qup->icc_path = NULL;
	}

and let things work. Anyway, if you want to keep it this way,
fine with me, I don't have a strong opinion, rather than a
preference to keep going.

Thanks,
Andi

> Let me know if I should resend the patch or if you can apply it
> directly.
> 
> Thanks,
> Stephan

