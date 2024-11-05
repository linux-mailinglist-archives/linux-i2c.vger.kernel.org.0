Return-Path: <linux-i2c+bounces-7779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B09BCF17
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7926283945
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 14:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249871D9675;
	Tue,  5 Nov 2024 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUQAY2Vt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A01D6DB9;
	Tue,  5 Nov 2024 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816495; cv=none; b=aLD8HOixSR6b0YwYpqh3+edDP2fQwK1zUl0qxk144/GE0riMZIQ9+B/OVMxHTbN6/C24LWMrLSBSMayiH+UnGKg3Gi3RvomVGK6SXErJb62v+/pMX3EhVIclwmjW4f9bFOHanRES6hhvankVUzn4jOALec63UXlTytn+jfRBML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816495; c=relaxed/simple;
	bh=DJ/kUd+DBcqBgpe9qw/202KtCsDESQxoQDuovJy9AQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOsRUDBZoDTCCvLgeNcYI6UfKadAD74U2YUUqC3z/HPOHABnHWnuo5YbyFpoOE0OjmWw9iDEhEYGcLuZVNiw8Bb0a48s5dJhlJLLNkbTCQItiNvnx22Y5ciQ61dwwSCSwRdhfWzKwmxQx14/DaE8JGZjgTGUT/ibHFJLNsJmpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUQAY2Vt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05166C4CECF;
	Tue,  5 Nov 2024 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816495;
	bh=DJ/kUd+DBcqBgpe9qw/202KtCsDESQxoQDuovJy9AQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUQAY2VtS3S95xlLPJHAEpqhXhFN/LXpztOjF/kPPM/auScTwyu7fJlj83qI3qTq2
	 eGMUVeYB1hDxalbVG1VgnVbIyoIXHF+qzzDtYl9ztg2XOxBq5Zg3a2d+Pwn/jdlWuV
	 HoJ2oXv6Du+E9lmDC/TP2SfcdRgMT7dslgdTfMBQKvo9Sbg/+UrIcb4aNnrfPsSQTz
	 /gY+V2FSHPwKPeQvmMTpFnFoSDkr2+uGR6RRONDrLY5rAtj1PHomzXnZWGe2g2e+jG
	 nrrcUELFRfD0cA8IfnTBdnNRCd5QNXDt3gv0AUiVR21rvuWKqheYcs29A9oenP5Y7z
	 hjqVsiuVbAeaQ==
Date: Tue, 5 Nov 2024 15:21:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
Message-ID: <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
 <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>

Hy Troy,

On Mon, Nov 04, 2024 at 08:23:23PM +0800, Troy Mitchell wrote:
> On 2024/10/31 19:43, Andi Shyti wrote:
> > Hi Tony,

Sorry, I misread your name :-/

> > On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
> >> Hi all,
> >>
> >> This patch implements I2C driver for the SpacemiT K1 SoC,
> >> providing basic support for I2C read/write communication which
> >> compatible with standard I2C bus specifications.
> >>
> >> In this version, the driver defaults to use fast-speed-mode and
> >> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
> >>
> >> The docs of I2C can be found here, in chapter 16.1 I2C [1]
> >>
> >> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
> >>
> >> Troy Mitchell (2):
> >>   dt-bindings: i2c: spacemit: add support for K1 SoC
> >>   i2c: spacemit: add support for SpacemiT K1 SoC
> > 
> > As Krzysztof has asked, please do provide the changelog, it's
> > important to track the progress of your series.
> I saw a compilation warning sent to me by the robot, and I've
> fixed the warning. Should I resend V2 with the changelog
> what I miss or send V3?

Please send a v3. When there are compilation issues, normally
patches are less keen to be reviewed.

You can add the changelog in the Patch 0/2 to avoid editing all
the .patch files.

Thanks,
Andi

