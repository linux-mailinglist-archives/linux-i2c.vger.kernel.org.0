Return-Path: <linux-i2c+bounces-2074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597686D583
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87DEE1C229F7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7AC43ACD;
	Thu, 29 Feb 2024 20:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwvEh7vt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88367142916;
	Thu, 29 Feb 2024 20:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709239575; cv=none; b=qtpPgV+LH1xAh/Cgqc6uyCom4yRT0dFdolyX1OljBqy2ZooOucMupObhpvAy+OrU7RVCTBXUgtoOyIjk6+3piol0fPx6xl+J9eGwczhuoTqgqV60X1EgoYZ1snmNaIeDrn0CdEfb5kXixsuQ52wFrJIh5eiLrHA88sMfIu64Ups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709239575; c=relaxed/simple;
	bh=WqPFG9zi2M1yUZ7iCShqhJfNI9rzcTCl6AlM9cUTrR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRjXIN5QyMRdlKybtvxYiwhf6/PPEsiD+PGNzr7uJihm+k7kLYqyC5Rqu8PvbdxxSC6nSy1DTLrB7zxwWnXJh5nT/mHLj+9PNQmwc48klyhi5FXmCU4WGBXG9QxByun4UsnGCqLePTl4klXYpLcewuEa/rRYFN/6oo/9Y0dc2Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwvEh7vt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3F3C43390;
	Thu, 29 Feb 2024 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709239575;
	bh=WqPFG9zi2M1yUZ7iCShqhJfNI9rzcTCl6AlM9cUTrR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwvEh7vt+MAUqCmF6zGXsjZZAYgyaMDvzBK0Jbtk81u4CfdW8sFmR0yCec+IBTJz9
	 B5KfDte8IoRDNN3ZDGvAdevaTCEaaPKJ4LJ6rkXtr3C8IqcaZNdFcudwzVIkam7EuL
	 up7Ee3xYvsAmV31Ocz9S/tmwQR7AaAOebHuIQYBReMxw5a6zpA12rDGr5tHXAFC6rm
	 eYbWETo9cBQIVgSjja37Kckv/vvn6EvuwyWR0faAZ0uCAlyOvgtLRLm+nYo3tf1T2v
	 zdY3HbFRqFBE/FdGGoc+CIQzj1dDK0jlnGqSQCT2T89zS3xqqp3CtnWz7yDK0FD/lv
	 YfXhcQhRzWyBQ==
Received: by pali.im (Postfix)
	id 1F80192C; Thu, 29 Feb 2024 21:46:12 +0100 (CET)
Date: Thu, 29 Feb 2024 21:46:12 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240229204612.3cmeqdjixmvif3yw@pali>
References: <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
 <20240227210429.l5o52wuexqqmrpol@pali>
 <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
 <20240227215000.gbmn4n2uzd3hyk3b@pali>
 <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
 <ef071afc-8768-4aab-aaee-4c3c3c317c0e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef071afc-8768-4aab-aaee-4c3c3c317c0e@redhat.com>
User-Agent: NeoMutt/20180716

On Wednesday 28 February 2024 13:50:27 Hans de Goede wrote:
> Hi,
> 
> On 2/27/24 23:37, Andy Shevchenko wrote:
> > On Tue, Feb 27, 2024 at 11:50 PM Pali Rohár <pali@kernel.org> wrote:
> >> On Tuesday 27 February 2024 23:19:19 Andy Shevchenko wrote:
> >>> On Tue, Feb 27, 2024 at 11:04 PM Pali Rohár <pali@kernel.org> wrote:
> > 
> > ...
> > 
> >>> I'm wondering why we need all this. We have notifiers when a device is
> >>> added / removed. We can provide a board_info for the device and attach
> >>> it to the proper adapter, no?
> >>
> >> I do not know how flexible are notifiers. Can notifier call our callback
> >> when new "struct i2c_adapter *adapter" was instanced?
> > 
> > You can follow notifications of *an* I2C adapter being added /
> > removed. With that, you can filter which one is that. Based on that
> > you may attach a saved (at __init as you talked about in the reply to
> > Hans) board_info with all necessary information.
> > 
> > Something like this (combined)
> > https://elixir.bootlin.com/linux/latest/source/drivers/ptp/ptp_ocp.c#L4515
> > https://elixir.bootlin.com/linux/latest/source/drivers/input/mouse/psmouse-smbus.c#L194
> 
> drivers/platform/x86/touchscreen_dmi.c actually already does something
> like this for i2c-clients. The problem is that this brings probe-ordering
> problems with it. If the i801 driver is loaded before the dell-smo8800
> driver then the notifiers will not trigger since the i2c-adapter has
> already been created (1).
> 
> So we would still need a "cold-plug" manual scan in smo8800_probe()
> anyways at which point we might as well just return -EPROBE_DEFER
> when the adapter is not there.

And that it example why the current existing solution is better, it does
not have such problems like the proposed.

> As for Pali's suggestion of having the i2c-i801 code call a symbol
> exported by dell-smo8800

I did not suggest that! Please do not make false statements about me.

> that will cause the dell-smo8800 driver
> to load on all x86 devices with an i2c-i801 controller (pretty
> much all of them). Slowing the boot and eating memory.

