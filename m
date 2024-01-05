Return-Path: <linux-i2c+bounces-1162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489D825A31
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38131F26B18
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 18:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9EE347B0;
	Fri,  5 Jan 2024 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efbng9pE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C0358B0;
	Fri,  5 Jan 2024 18:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A26CC433C7;
	Fri,  5 Jan 2024 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704479597;
	bh=8VnF+z1PNpFUDllSkSepjMi7GtPqsIyiYDiRXe0jX9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Efbng9pEgOq+uAI6QkqX7DPidGnz69vsxTxQsxZK7acYGwBTqAJtPzELJGg7d+glm
	 Nbd7gDItP+NQ3uyfJhZw5Bj7okIb6LJoTBebob2rVHSfuGSrPXR84+VyZBMMNmqfDz
	 sx+9kTtb/SXBffimo3awsb4mCnTJm6H6b3OurkjQyMSklPbCmlDJgFwre/5we+hXG5
	 2+EQmyR/WzKBpynBSR2HhxL3kqX+5CP0j8Tuz/BCZpA/hXd8m15tvRRnRUTPC4iQ69
	 8ZPihUYF4Au6ci1qADD0esge1XIn1L0/VirMcBogkq8W7GoXBStTS2O1cIztsvUgbW
	 8odVuu/Y9xlTg==
Received: by pali.im (Postfix)
	id 1A81FA52; Fri,  5 Jan 2024 19:33:14 +0100 (CET)
Date: Fri, 5 Jan 2024 19:33:13 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
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
Message-ID: <20240105183313.l6t535o2mu5xxmca@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali>
 <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 05 January 2024 17:34:07 Hans de Goede wrote:
> Hi,
> 
> On 12/24/23 23:03, Pali Rohár wrote:
> > On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:
> >> Instead of instantiating an i2c_client for the old misc joystick emulation
> >> and freefall driver: drivers/misc/lis3lv02d/lis3lv02d.c use
> >> i2c_client_id-s from the IIO st_accel driver so that the accelerometer
> >> gets presented to userspace as an IIO device like all modern accelerometer
> >> drivers do.
> >>
> >> Add a new use_misc_lis3lv02d module-parameter which can be set to restore
> >> the old behavior in case someone has a use-case depending on this.
> >>
> >> When the st_accel IIO driver is used, also pass the IRQ to the i2c_client
> >> and disable the /dev/freefall chardev.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/platform/x86/dell/dell-smo8800.c | 82 ++++++++++++++++++++++--
> >>  1 file changed, 78 insertions(+), 4 deletions(-)
> > 
> > Sorry for the stupid question there, but what is the replacement for the
> > /dev/freefall when using new st_accel IIO driver?
> 
> There is no replacement for /dev/freefall.

That is a big problem if there is no replacement. The primary usage of
that hardware and all these drivers is that freefall ability. It was
originally written for HP laptops and later extended for Dell. Access to
accelerometer axes was just a secondary functions for linux fans.

> I realize this is not ideal
> and if this turns out to be a problem the default of the module option
> can be reverted.
> 
> But AFAIK / AFAICT there are no actual userspace consumers of
> /dev/freefall so removing it should not be an issue.

Userspace tool is directly in the kernel tree. Somewhere in tools dir
now as it was moved (if it was not removed).

> Specifically I checked smartmontools which ships smartd which
> is the only daemon which I know of for hdd monitoring and
> that does not have /dev/freefall support. So /dev/freefall
> appears to be unused to me ?
> 
> For completeness I also checked libatasmart which also does
> not access /dev/freefall.

I guess nobody ported it to these tools. IIRC the freefall design comes
from the Suse the tool was also used on preloaded HP laptops. So maybe
Suse have custom tool? I do not know.

> Regards,
> 
> Hans
> 
> 

