Return-Path: <linux-i2c+bounces-7064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C29888A3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 18:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44B21C21176
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 16:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E711487C8;
	Fri, 27 Sep 2024 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR/6kEjj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C3200A3;
	Fri, 27 Sep 2024 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452878; cv=none; b=QnojTfcgbidd+V1RwWfScZmknFftrliOWq4PAB6aQIlddYUjjKTRIKq0odK8bAXMYhCi3aQd14asIUlzZrrxI/eHTwlDCbx4ZVPkIgGYo3fQ6j3zmzJlB4qQmzqHBC3Fr0qvs31N1mtVQjgIfiK143wagBXRqaQMj5rTpED5r9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452878; c=relaxed/simple;
	bh=GpIvd9hipSTskI1lT7iREGb8R5ac9xwK+hYxlfG8v0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5svGAyPDg5zsSG93p5WbQy/6Btbw9sSasNCvPnuC/9+WqGFaKJOLu1ocNTliYuR/xaKJRkMsSk8w77zsTwg9G5/zDdK6xx6z4PC/vStK+TsYyzx+8pqDXSGiXIlNY0u+213gHbtsJ0EbP+4vucBjm4Q6hK+5D30LdFG848IDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR/6kEjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E74C4CEC4;
	Fri, 27 Sep 2024 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727452878;
	bh=GpIvd9hipSTskI1lT7iREGb8R5ac9xwK+hYxlfG8v0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cR/6kEjjE0xM+1i27pUcTVCQaDDefN4LgoqyMFQEBKRKCfeVH1xS8SoQkHXIBmaca
	 dUlEuD3RpahDRdN+r2E6/aDwId8TMJq4lBN+RF3uvUXbeRQ563WZauOEuNo6ciFIGj
	 0LpiUkA32dkPjG4L0HkkZee299bcpXp2da1/s8bb0v1uk/qDCLKReiJHnkejjkvMLf
	 yMdT9PLMHiCTxMXITG0TyjcT+9T2fFO1nb0mZOigE9NeUEPiLd7Ymgb//6EC3a4gpX
	 d2nIkmzUwiLeKRn4XnhwimE3AMAbS+po3V7fxFbnUclrVuZXkPaIXD/h4PpjxHIoLu
	 LweXTMHZ+48xg==
Date: Fri, 27 Sep 2024 18:01:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc1
Message-ID: <fvyjsdwpqo7vnx7acs63hp7dwx6avxouvxkcynov5c6dgmwji6@ob6j7haixn4z>
References: <auogjhzhbs2w45ptdkl5ceyxsm7apyfi5wmfv3iwuzfh47pl6f@4nnrnpqqlum2>
 <ZvbTAl5uYbMcVI6m@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvbTAl5uYbMcVI6m@black.fi.intel.com>

Hi Andy,

On Fri, Sep 27, 2024 at 06:45:06PM GMT, Andy Shevchenko wrote:
> On Fri, Sep 27, 2024 at 12:09:36PM +0200, Andi Shyti wrote:
> 
> ...
> 
> > ----------------------------------------------------------------
> > The DesignWare driver now has the correct ENABLE-ABORT sequence,
> > ensuring ABORT can always be sent when needed.
> > 
> > In the SynQuacer controller we now check for PCLK as an optional
> > clock, allowing ACPI to directly provide the clock rate.
> > 
> > The recent KEBA driver required a dependency fix in Kconfig.
> > 
> > The XIIC driver now has a corrected power suspend sequence.
> 
> While tag message looks nice here, I think it still has to follow the
> same (as in the commit message) pattern, i.e.
> 
> $SUMMARY
> ...blank line...
> $DESCRIPTION
> 
> Why? Because the Web representation of the message looks weird on the
> Web. Compare
> https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/tag/?h=intel-pinctrl-v6.12-1
> and yours
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/tag/?h=i2c-host-fixes-6.12-rc1

I've been looking at many git tag descriptions and I haven't seen
a rule being enforced as it is for the commits.

In any case, thanks a lot for looking into my tag description, I
can defeinitely adopt your way.

I will resend this pull request with a proper formatting.

Thanks,
Andi

