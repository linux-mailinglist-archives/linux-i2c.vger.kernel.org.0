Return-Path: <linux-i2c+bounces-2040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04B86A1ED
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 22:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE6821C243DE
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A779C14F964;
	Tue, 27 Feb 2024 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peBmNG3g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC802D60B;
	Tue, 27 Feb 2024 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709070604; cv=none; b=PXmsoG2Pc7+Ucolg+OwYURPfnjgAlqiHBBRXnYwTQsAARe1IsfMPFkF+fzXCvheTLw4XNC6/WBuAe0v5XMlcStnvkdS0oM0wyVssmNGw5AsM0rl9oQtuNRfe+PBSpMHcAF3CqyMTlsV9oiUUdRZdmoW/rbJey1fH/js2UDFBVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709070604; c=relaxed/simple;
	bh=6JrfwdTRMujEeC8h7raZbyKB7d1/03pR38VQ5GxJvuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CekGMUqiW+JF59TGcjmG+K0NbbnORdqkuau3VAHlISh2lVXAujAccY5p9QGd9kQrzXifl584TJC4Gpq4B3ypzXLrO/9YE8TaVQ8VnGR9OJ72BnBh3SpOZ3R30vXqUNBieRaGtpSB+d53hi7cBmzqDsGeGgM9LeclTJ8kmPeWzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peBmNG3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A01C433F1;
	Tue, 27 Feb 2024 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709070603;
	bh=6JrfwdTRMujEeC8h7raZbyKB7d1/03pR38VQ5GxJvuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peBmNG3gAT8ypIp/T0HfEp8t55dDkvKiaj0LJncMO9wW/fupu9J1xn7Vp+3MXQ8FK
	 m4iPFFSbtFWkdqb5AYHrWm32YtVCNkTX01W3WycwVX7VWa0o8qfSc9VUXLYSHfWnM1
	 ScX7wGIJ48kUYBs1lGJiVJlp8A3QssTKGviQpGcZ8LCaT/6+AfceOj113N15xuvHmg
	 vYMRbxm8lK43UN/iyGwkVg47evGpHAAQtaCRmAYwJX7MHgIPLXiPRBw7ZAyYtJiWyb
	 hkM1qxla3QCbO2aBXucS3gpZ26zC4NBGsifNLK5GDcc33eRbDdxdKabMiSgD56k/zy
	 rkXSzoS/HP1Pg==
Received: by pali.im (Postfix)
	id AA333828; Tue, 27 Feb 2024 22:50:00 +0100 (CET)
Date: Tue, 27 Feb 2024 22:50:00 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Jean Delvare <jdelvare@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240227215000.gbmn4n2uzd3hyk3b@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
 <20240227210429.l5o52wuexqqmrpol@pali>
 <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Tuesday 27 February 2024 23:19:19 Andy Shevchenko wrote:
> On Tue, Feb 27, 2024 at 11:04 PM Pali Rohár <pali@kernel.org> wrote:
> > On Monday 19 February 2024 13:52:57 Andy Shevchenko wrote:
> > > On Sat, Feb 17, 2024 at 11:33:21AM +0100, Hans de Goede wrote:
> > > > On 2/13/24 17:30, Jean Delvare wrote:
> > > > > On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
> > > > >> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> > >
> > > FWIW, I agree with Hans on the location of the HW quirks.
> > > If there is a possible way to make the actual driver cleaner
> > > and collect quirks somewhere else, I'm full support for that.
> >
> > Location of the quirks can be moved outside of the i2c-i801.c source
> > code relatively easily without need to change the way how parent--child
> > relationship currently works.
> >
> > Relevant functions is_dell_system_with_lis3lv02d() and
> > register_dell_lis3lv02d_i2c_device() does not use internals of
> > i2c-i801 and could be moved into new file, lets say
> > drivers/platform/x86/dell/dell-smo8800-plat.c
> > Put this file under a new hidden "bool" config option which is auto
> > enabled when CONFIG_DELL_SMO8800 is used.
> >
> > i2c-i801.c currently has code:
> >
> >         if (is_dell_system_with_lis3lv02d())
> >                 register_dell_lis3lv02d_i2c_device(priv);
> >
> > This can be put into a new exported function, e.g.
> > void dell_smo8800_scan_i2c(struct i2c_adapter *adapter);
> > And i2c-i801.c would call it instead.
> >
> > register_dell_lis3lv02d_i2c_device just needs "adapter", it does not
> > need whole i801 priv struct.
> 
> I'm wondering why we need all this. We have notifiers when a device is
> added / removed. We can provide a board_info for the device and attach
> it to the proper adapter, no?

I do not know how flexible are notifiers. Can notifier call our callback
when new "struct i2c_adapter *adapter" was instanced?

> > With this simple change all dell smo8800 code would be in its subdir
> > drivers/platform/x86/dell/ and i2c-i801.c would get rid of smo code.
> >
> > This approach does not change any functionality, so should be absolutely
> > safe.
> >
> > Future changes will be done only in drivers/platform/x86/dell/ subdir,
> > touching i801 would not be needed at all.
> 
> Still these exported functions are not the best solution we can do,
> right? We should be able to decouple them without need for the custom
> APIs.

Well, what I described here is a simple change which get rid of the one
problem: i2c-i801.c contains SMO88xx related code and changing SMO88xx
logic (like adding a new device id) requires touching unrelated
i2c-i801.c source file.

I like small changes which can be easily reviewed and address one
problem. Step by step. That is why I proposed it here.


For decoupling it is needed to get newly instanced adapter (if the
mentioned notifier is able to tell this information) and also it is
needed to check if the adapter is the i801.

