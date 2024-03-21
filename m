Return-Path: <linux-i2c+bounces-2475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448388621C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 21:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F20511F21882
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 20:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F3D13540D;
	Thu, 21 Mar 2024 20:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdBGofkv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A11350EF;
	Thu, 21 Mar 2024 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711054488; cv=none; b=u7PU/BkomAszaV+STDOlfiLQrbTamhvsJ6N7TfxONphedkdweZhRYOKxuoegBQUXeR/cHetfPDFoxreQVvsiPs0ger9dixo8pRDXFEnB/KgJry6MxNDjV+obDRitbqKq3tcuZCJ65Jfp9cpLsKveKoFqpIOB8Annfxatp6GwEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711054488; c=relaxed/simple;
	bh=AlXcd6BU1PdgV9t1OUjfyQ8MP4DXyg5Bru1eSL7IS1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7ASiY81exvvFDqr6MYK5Ww2O7T1V9Ne1ZXCeX5RJs1gWFZpwswdUO8f03jR+vy1FHyc5leGaadEn+JufKTpldKbkbUTh0q/aIrjrM+dRWbcNQ8K2zc5cQ8y8KFkmbx9tv8UQZHmF2PcbAqXbOIBJvRaBjSvHuePdvCfGW5dIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdBGofkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E539C433F1;
	Thu, 21 Mar 2024 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711054488;
	bh=AlXcd6BU1PdgV9t1OUjfyQ8MP4DXyg5Bru1eSL7IS1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdBGofkv8EeV/a9BMklXeGE/imMgVO7CfjHf4g6tgRcHGEy0R/kdidNwDKXjzOOWn
	 BjFLBfQNYQeTWPJdxi057nTzyYaCQTm0rkA89EEdTISdAbA4j3yHdig+Sx6HQjadZj
	 ZtHSAZCBb/n5L78pYh7bfQop5DO0I5TAyZrz7VmbHfrM9Qxmx9XFyXC37je21ETVV9
	 yASzG7gFd1ViikML1rfRnbPX/pkEfCN8zr+2p0mkLt9FdqG7CEHtVzVSgNi6iPrVJV
	 Kf6LM3ZFwW1uj/hNguArJ9YrIWQ0qiWYcDQsVnK2s3n2uw9fFCCCIoAUSAOzymlHDn
	 PlygkW4iV+tZg==
Date: Thu, 21 Mar 2024 21:54:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sam Edwards <sam@turingpi.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
Message-ID: <wdpnjnuahedvbakhfavoobukdkocjfpfrgsu374sgjhkyy7exz@er4lyeadftyz>
References: <CAF8uH3tYaUwhkkeFuY+PdsnSPqeTtWtOsB_hy9oOjF=f-2Hdaw@mail.gmail.com>
 <p37qqpplxgmfzlq6wz7fvmvnrsumy6ra5nivzi4hd2gbvlbezx@dlh6ygyjbk24>
 <4a043be8-8e88-4b92-913c-abd8f138b90d@turingpi.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a043be8-8e88-4b92-913c-abd8f138b90d@turingpi.com>

Hi Sam,

On Thu, Mar 21, 2024 at 12:24:43AM -0600, Sam Edwards wrote:
> On 3/20/24 20:28, Andi Shyti wrote:
> > > Sorry about the resend; it seems my mail client "helpfully" swallowed the
> > > newlines on any line consisting only of whitespace, garbling the patches.
> > 
> > I received three series from you:
> > 
> >   1. [RESEND v2 RFC 1/5] i2c: mv64xxx: Clear bus errors before transfer
> >   2. [RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
> >   3. [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
> > 
> > By the versioning, 1. is good, the rest is not good. Standing to
> > the time sent and comments in patch '0', 3. is good, the rest
> > not.
> > 
> > Which one should be discarded? Can you please state it clearly?

...

> I sent the series in the order 2-3-1, so 1 is the version to look at (though
> I made no content changes between resends as I was only fighting my mail
> client's formatting).

so that it's the [RFC v2 ...] the right series... are you sure?

The order of arrival is:

 1. Date: Tue, 19 Mar 2024 16:51:51 -0600
 2. Date: Tue, 19 Mar 2024 19:40:51 -0600
 3. Date: Tue, 19 Mar 2024 22:19:53 -0600

Anyway, I will take "1" as the good one, being a v2. I will
discard "2" and "3".

Then, please, do not forget next time the patch 0 and the
changelog.

...

> > Can you please make sure, next time (unless someone asks to
> > resend them again), that the patches are threaded? You can send
> > them to yourself first and see if they are really threaded.
> 
> Yes, definitely. I take it from your phrasing that you're willing to collect
> the scattered mails yourself this one time only? If so, thank you for
> cleaning up after my mess. :)
> 
> If not (and/or if someone else doesn't like the mess), I can always resend.
> I have already made one cleanup (removing the useless `default:` at the end
> of the FSM) so I guess it would technically be an "RFC v2" at this point.

For now no need to resend (unless someone complains). Let's give
it some time for review.

Andi

