Return-Path: <linux-i2c+bounces-978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B481D415
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 13:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56649B21088
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 12:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D26AD2E3;
	Sat, 23 Dec 2023 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzP7j82f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408ECD28B;
	Sat, 23 Dec 2023 12:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA991C433C7;
	Sat, 23 Dec 2023 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703336033;
	bh=AVUxd05ykx/O/0lzq0rz6ESQ9un8BWEmfNzbEAr9GOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzP7j82f4ljDVLL1/WOoYX6CjZ6zcRBpzifJvh8KQ5k5RXHXzsh8ZEaXYtIAVpJoG
	 pXfofOvbIQeqxgmvX+laQdiP1v1SFt4XcP0GD5BuT84zz+1GCHJ6FOg6Ms19tw/LZb
	 xAKPjbK+x2BGYk7vSVt1aSLcWhqRVM09FzaCA1txSf1M2jfvkBC5hIJE7+5NTeld1d
	 /joFfSksjQ/Vj/astFyBQNPGsUIob+DytKPlgmokdeTuqRmger6gCosRf9hXufMwSD
	 CfFicBgMulcbZ4wfpogbSYs6OKs2yHV2OFSSEXn10kVNjPotI5WGmxuPm/XHIqbAZY
	 vnQ7gP5+kBV2w==
Received: by pali.im (Postfix)
	id 327B5A3B; Sat, 23 Dec 2023 13:53:50 +0100 (CET)
Date: Sat, 23 Dec 2023 13:53:50 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <20231223125350.xqggx3nyzyjjmnut@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
 <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 23 December 2023 13:45:32 Hans de Goede wrote:
> 2. Add a "probe_i2c_address" bool module option and when this
>    is set try to read the WHO_AM_I register, see
>    drivers/misc/lis3lv02d/lis3lv02d.c
>    and if this succeeds and gives a known model id then
>    continue with the found i2c_address. This should first
>    try address 0x29 which seems to be the most common and
>    then try 0x18 and then give up.

This is the main problem of the whole email thread. How to figure out
the correct smbus device address.

And we really must not poke random address during kernel boot time.
I think in the past was there enough problems linux kernel broke some HW
or made system unbootable just because it tried to read something from
some random undocumented address.

Please do not try random unverified address on all machines.

smbus is not really bus which provides discovering and identifying
devices on the bus.

