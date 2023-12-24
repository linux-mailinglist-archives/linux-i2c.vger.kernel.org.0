Return-Path: <linux-i2c+bounces-992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7E81DCD7
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 23:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235001F21987
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBD9FC19;
	Sun, 24 Dec 2023 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY+i5/IS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B9FC0E;
	Sun, 24 Dec 2023 22:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881FFC433C7;
	Sun, 24 Dec 2023 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703455404;
	bh=J45fwnnPN2REXzQNRNnOGYJGQ+0YKokwfnyMe9qG2jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iY+i5/IS+NUlgE4VTwztmHa4NwF8eNjCMrg67dmqpB/rr+kEvC3m/lXK+OoOEboWs
	 ac/QJPs10hPahPmf3zqcU84f0Vdt+7BGMJ5xM+eV1gxxamrzcazpU9yEGS2aOgypME
	 FCi2MqhxSSA89loUKryjmzjwnzu0rvN/fqCHxxS0mXCgsSP3LSh2f/JNRPafNzlx8d
	 5W3aC0XMSMP5T42HA7Y/SeGj8578RCFUHUnw1vujdOPcMLEehsXlRdvSUBUjK4JzM0
	 YBd/KuDxFrtUJalk5dfq6lVot2iHjcNQ/4jgnLkKhbwmAzv3KECTz9vUEm0maMfFvS
	 8Pq/IbV/E5RLA==
Received: by pali.im (Postfix)
	id B2A1C81B; Sun, 24 Dec 2023 23:03:21 +0100 (CET)
Date: Sun, 24 Dec 2023 23:03:21 +0100
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
Message-ID: <20231224220321.vqzb4q3ut3dz3rl2@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-6-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:
> Instead of instantiating an i2c_client for the old misc joystick emulation
> and freefall driver: drivers/misc/lis3lv02d/lis3lv02d.c use
> i2c_client_id-s from the IIO st_accel driver so that the accelerometer
> gets presented to userspace as an IIO device like all modern accelerometer
> drivers do.
> 
> Add a new use_misc_lis3lv02d module-parameter which can be set to restore
> the old behavior in case someone has a use-case depending on this.
> 
> When the st_accel IIO driver is used, also pass the IRQ to the i2c_client
> and disable the /dev/freefall chardev.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/dell-smo8800.c | 82 ++++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 4 deletions(-)

Sorry for the stupid question there, but what is the replacement for the
/dev/freefall when using new st_accel IIO driver?

