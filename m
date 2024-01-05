Return-Path: <linux-i2c+bounces-1166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F941825B0B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 20:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A14BFB22F42
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8282035F09;
	Fri,  5 Jan 2024 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phYhUVJq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4885535EFA;
	Fri,  5 Jan 2024 19:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD4FC433C8;
	Fri,  5 Jan 2024 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704482437;
	bh=tMkCuPLhjvtW1KI3dBC+aiHw8UbihjiGkW/WeW2FzgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phYhUVJq5VBxL8Cpap4RtnWIlElfSOSKhgWqEesd7ylEb/uhxL7gz12x50pgeWZOW
	 dBtA3golTt1HJ9J0UIbMqYMEmWNa7msVjVJs4XPzAGg2WgHKiRs2zNCukYEXtyL+su
	 1aT/erUOjx0b7vixhZ0v1rA/5CEJjSgy2M7SbML0mKXBkoI6uRpBHWf58xRn5Tu5hP
	 KZ5Ry2KgyQCfqb1EtbEp1Xi54clm0iTp25z96gAONgYyH35F8jk1NDfTefi6T8+Iy6
	 fVekM/44tjDO6bFbPC0f+mjH87ZyzQ7KF+k/9ngCzc1wipfajzsWZL7rLe0ZMqqby9
	 pThpu1pLSxJ5g==
Received: by pali.im (Postfix)
	id 7CDCFA52; Fri,  5 Jan 2024 20:20:34 +0100 (CET)
Date: Fri, 5 Jan 2024 20:20:34 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an
 i2c_client for the IIO st_accel driver
Message-ID: <20240105192034.f2zoholvmbogw7ko@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali>
 <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
 <CAHp75VdoSaVMkyzFdKJYu17=YZNVFubUdWAC6tm5TqN3Ccvj3A@mail.gmail.com>
 <CAHp75VfAS=xkoLz63qozsMXyT2ByJSkwYfsYRfU69NxEyysLKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfAS=xkoLz63qozsMXyT2ByJSkwYfsYRfU69NxEyysLKA@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Friday 05 January 2024 21:04:59 Andy Shevchenko wrote:
> On Fri, Jan 5, 2024 at 8:37 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 5, 2024 at 6:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 12/24/23 23:03, Pali Rohár wrote:
> > > > On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:
> 
> ...
> 
> > > But AFAIK / AFAICT there are no actual userspace consumers of
> > > /dev/freefall so removing it should not be an issue.
> >
> > IIRC/AFAIK there is at least one (simple) computer game using it as a joystick.
> 
> Okay, I can't google for it and now I realised that it was my x60s,
> which has no freefall, but another interface to it. In any case the
> side effect of that googling is this (maybe more, I just took this one
> as example):
> https://github.com/linux-thinkpad/hdapsd/blob/master/README.md
> 
> So, dropping it will break at least this tool.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Yes, this is that correct one. I forget the name of this daemon.

Just to note /dev/freefall does not provide axes state, it just send
signal to process when interrupt is triggered. Process than park disk
heads.

Axes state are/were exported throw /dev/js* interface and those games
uses just js interface. I remember Tux Racer.

Interrupt on HP and Dell is triggered only when laptop fall is detected,
so games did not used it (hopefully!)

