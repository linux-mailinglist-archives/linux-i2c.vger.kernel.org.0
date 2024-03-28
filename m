Return-Path: <linux-i2c+bounces-2639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D288F7BE
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 07:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C961C2401A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 06:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C7E4E1D0;
	Thu, 28 Mar 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ac4Lg+vZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC854E1BC;
	Thu, 28 Mar 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711606254; cv=none; b=ojub5DJZJqIaVvaqHDn/2tQmpBePYX28NiP3mgFRYecolV0e1wbjiE1Q8+iNV/p9SRvEpkafG1VBkbUJpBUoQ+qV+Q8dVhXdQABcmOxeebr78EP1SQoRHy0X0+uibjxiq0t0nNgsQydYciSsImiXbf9FESeX4KqFfIqWkKCsI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711606254; c=relaxed/simple;
	bh=umDbQEcpoP0dGXgoOt2PjfPa/DQ5ztgRy2l15prAHk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3/XI72u9EtV38BbWbeZB4mHJOW2BxowLRzEsel9CCValHpqgxfnkC3QmALjVGPME1SJHsVUk1DTCuqvFIL5wJHSQOYbcBJ6pV2n8KYif5pzNh8nVfiy7MuJq73m3UflwXsFRvQAR2eb1K5bX/f5jHr901HYvQNVcCl+u9dVjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ac4Lg+vZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EE9C43394;
	Thu, 28 Mar 2024 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711606254;
	bh=umDbQEcpoP0dGXgoOt2PjfPa/DQ5ztgRy2l15prAHk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ac4Lg+vZk1YEPMybYUSF2dtT94TTS8XcW4i82mmXE+SCTo4wIoHDDxB8QqdobTqKi
	 kl1+XvalKzYG2k3Brh66rabg4n2dQYbUf8SFbzROsR/n1LYttJ0JMk/IdU+RmoYDxh
	 Rq69SM7aYcEjBT6Cpz94jYTFpTpYENo/oZx4l8Zk=
Date: Thu, 28 Mar 2024 07:10:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: stable@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: Please backport commit 13e3a512a290 (i2c: smbus: Support up to 8
 SPD EEPROMs)
Message-ID: <2024032814-colony-observant-4e42@gregkh>
References: <3bea11ec-32fe-4288-bc03-8c3ba63979f6@molgen.mpg.de>
 <2024032713-atom-saxophone-0c15@gregkh>
 <4fa53db0-358d-4e30-bcfa-745cab71fa72@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fa53db0-358d-4e30-bcfa-745cab71fa72@molgen.mpg.de>

On Wed, Mar 27, 2024 at 09:35:38PM +0100, Paul Menzel wrote:
> 
> [Cc: +I2C folks]
> 
> 
> Dear Greg,
> 
> 
> Am 27.03.24 um 17:52 schrieb Greg KH:
> > On Wed, Mar 27, 2024 at 04:13:26PM +0100, Paul Menzel wrote:
> 
> > > Please apply commit 13e3a512a290 (i2c: smbus: Support up to 8 SPD EEPROMs)
> > > [1] to the stable series to get rid of a warning and to support more SPDs.
> > > That commit is present since v6.8-rc1.
> > 
> > How far back?
> 
> I’d say 6.1.
> 
> > But isn't this a new feature, why is it needed in older kernels?
> > It's not a fix for a regression.
> decode-dimm does not work on systems with more than four SPD EEPROMs, so I’d
> say it’s a fix.

But it's never worked on such systems so it's not a regression fix,
right?

Anyway, I'll defer to the i2c maintainers as to what they want to have
happen here, as they did not originally tag this commit for stable
inclusion.

thanks,

greg k-h

