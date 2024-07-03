Return-Path: <linux-i2c+bounces-4613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC0926865
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 20:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E041F24051
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD199187570;
	Wed,  3 Jul 2024 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCdLWAX3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621491DA313;
	Wed,  3 Jul 2024 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720032085; cv=none; b=ecPzJWoLnN2iD8H/IvcxfuaM+hRRgMfAQDj8VX7Nrz9K47hiKlOPD7q5fXGptt+gQwrpLfnFEgZnPKQZLt4Yl/yDpNrB4uReDYBcd5AuvPUBgBsyFf7Je+rRQbjcHetPSRWSpPympaSqjdcltWLNy6Xk48pjqvBjfQiMmM3PQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720032085; c=relaxed/simple;
	bh=WQHx3jOyEbeCSMUJzC4YLdOFmbxFG1FTyErobtc/LIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+Puw9PEE7TrYNMVvsBCbff9MtdNQ5mc2wm0JlyOrL6RVfQ9DtY58s/13c0mhTWERY1pBHPhTCb9+UHPqnH45lTHRvvdhY9zbrQwvQsW1NbiHa3+CkdGCeEXYh9KxG32WqTTZ8myA3Prjb7Q3YwXzuCdw8/2vKM0qgFDanEj7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCdLWAX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E80C2BD10;
	Wed,  3 Jul 2024 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720032085;
	bh=WQHx3jOyEbeCSMUJzC4YLdOFmbxFG1FTyErobtc/LIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCdLWAX3/SlM2mdURdWSadrF48z/BZxE5gx0VH626Ptq2q2rNffVL+vWJ/46hHMBd
	 ORvSB8bqSKt+Upc0ZCmGf23DoOTGxUiuMYfAFPLP92uRbRxFACCvg5dJLIc4+/YuqC
	 nyGt79Jh9AB3pSG7FQAVGePJTfebU4ac/sUD+odqFC/3NOgEaaGJr63/WyfFGwe0UJ
	 WKQ6peeHgbS1JNqf8TsU90G9hfNO5Ikmn5cujM1/DsDaEJzfdvDfUU+YEIf3BmDPfm
	 3wIq63Do/bYfOHCz+8Sh5E1pLNE8BJtsDYdlPAvvt7nNzHdUFRKFWA3vAmUf138fQX
	 oBIZuSzmGrt9g==
Received: by pali.im (Postfix)
	id 7ABC389A; Wed,  3 Jul 2024 20:41:21 +0200 (CEST)
Date: Wed, 3 Jul 2024 20:41:21 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <20240703184121.t2wh5sb5ki2kwots@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624182812.fa6akymygv3qolug@pali>
 <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
User-Agent: NeoMutt/20180716

On Wednesday 03 July 2024 12:58:01 Hans de Goede wrote:
> Hi,
> 
> On 6/24/24 8:28 PM, Pali Rohár wrote:
> > On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
> >> Hans de Goede (6):
> >>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
> >>   i2c: i801: Use a different adapter-name for IDF adapters
> >>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
> >>     dell-smo8800-ids.h
> >>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
> >>     from i2c-i801 to dell-lis3lv02d
> >>   platform/x86: dell-smo8800: Add a couple more models to
> >>     lis3lv02d_devices[]
> >>   platform/x86: dell-smo8800: Add support for probing for the
> >>     accelerometer i2c address
> > 
> > Patches 1-5 looks good. There are just a few minor things, but you can add
> > Reviewed-by: Pali Rohár <pali@kernel.org>
> 
> Thank you.
> 
> > For patch 6 as I mentioned previously I'm strictly against this change
> > until somebody goes and politely ask Dell about the current situation of
> > the discovering of accelerometer's i2c address.
> 
> Dell is on the Cc and not responding...

And what do you expecting here? That somebody on the group address
specified in CC list would react to all your tons of messages? Not
mentioning the fact that you did not even ask anything.

This is not how things works.

If you do not change your attitude here then I highly doubt that
somebody will respond to you.

I have feeling that you are doing it on purpose just because you do not
want to do anything, and trying to find some kind of proof that nobody
is responding to you, to convince others for merge your last hack change.

> > And if there is no other
> > option than start discussion if Dell can include this information into
> > DMI / ACPI / WMI or other part of firmware data which they can send from
> > BIOS/UEFI to operating system.
> 
> AFAIK newer Dell laptops don't have a freefall sensor anymore since
> everything has moved to nvme. Even the bigger laptops seems to simply
> have multiple nvme slots rather then room for a 2.5" HDD. Note I did not
> research this, this is is my observation from 3 newer Dell laptops which
> I have access to.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> >>  drivers/i2c/busses/i2c-i801.c                | 133 +-------
> >>  drivers/i2c/i2c-core-base.c                  |  18 +-
> >>  drivers/platform/x86/dell/Makefile           |   1 +
> >>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
> >>  drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
> >>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
> >>  6 files changed, 379 insertions(+), 146 deletions(-)
> >>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
> >>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
> >>
> >> -- 
> >> 2.45.1
> >>
> > 
> 

