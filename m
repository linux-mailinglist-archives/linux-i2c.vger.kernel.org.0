Return-Path: <linux-i2c+bounces-4313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F891565E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06EB28B8E1
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8501A00F7;
	Mon, 24 Jun 2024 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AER8LC95"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85C1A00E7;
	Mon, 24 Jun 2024 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719252898; cv=none; b=nFnLNcJ2Qn+Hlzjp24L8TxTv2qG/V3Wc00cZ18M9ffr1pzKCO4oIJl3RPp7+M6l4EOUQkK1HeyUbLLQDVFJmJ4LChs1jhm6vac9qT7NH3FYB238kIheJq5npvA10SQp2NGBVliPaGVCPcxKUSFyxQ/7e79ZfjeLULk+D9uvButA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719252898; c=relaxed/simple;
	bh=B+qXJfrWIqDe9N0TwGkVvw808BjIFomTR5fE5NzDNLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxpZvbGLjZ2yikoV27fOpUVwCd/Fd1XfUdUWBtg3mJxbMmt51BTd3/P/nbUd+Othg+JCj8se4+Hp9IURVhJrEazcp+ZTkMWZobNQn/mtpgpmeN+/sQVdZc+YEBufaWwPEthQhnh+WkG8YtoEdLPyVZEDX2Mdqv627wsaj4+0Zt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AER8LC95; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF8AC2BBFC;
	Mon, 24 Jun 2024 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719252898;
	bh=B+qXJfrWIqDe9N0TwGkVvw808BjIFomTR5fE5NzDNLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AER8LC95f2L+rGAwZc5QIyGHuR599DZXrd5oACqQK8JpmGD2MYWZZI2emPtpjV949
	 Ub7UeJs5UCz28Gzvjqp4cdRcb4eJ3dcSTyOl2xg7vvfavrzbqUela92sasUxLw4jYP
	 QMzKgcEXEAQJhNRJV0vS1gceKv7wofAgvZq7CDDesc9vQ6iXvrc55rvUuQWKScR1ij
	 UG3Ii1QIr3N3dYDp3CWTCiFymOlAxs5nNwc+rCkmFBOgHgKqdZcXCNph8a8ym2BXQb
	 Mp0zyvYiFm0KzPkMq+RmGWbsc+nAWED8gLcR8Bcs8lbnlGW3EQM72FIYgNxrNuIv6D
	 rdiJDELamc6+w==
Received: by pali.im (Postfix)
	id 0CC57BF4; Mon, 24 Jun 2024 20:14:56 +0200 (CEST)
Date: Mon, 24 Jun 2024 20:14:56 +0200
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
Subject: Re: [PATCH v4 5/6] platform/x86: dell-smo8800: Add a couple more
 models to lis3lv02d_devices[]
Message-ID: <20240624181456.k7ikngwy2dohoqnw@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624111519.15652-6-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Monday 24 June 2024 13:15:17 Hans de Goede wrote:
> Add the accelerometer address for the following laptop models
> to lis3lv02d_devices[]:
> 
> Dell Latitude E6330
> Dell Latitude E6430
> Dell XPS 15 9550
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> q# Please enter the commit message for your changes. Lines starting

Garbage at the end of commit message.

> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index e581b8e2a603..a7409db0505b 100644
> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> @@ -43,10 +43,13 @@ static const struct dmi_system_id lis3lv02d_devices[] = {
>  	 * Additional individual entries were added after verification.
>  	 */
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
>  	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 7590",        0x29),
> +	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 9550",        0x29),
>  	{ }
>  };
>  
> -- 
> 2.45.1
> 

