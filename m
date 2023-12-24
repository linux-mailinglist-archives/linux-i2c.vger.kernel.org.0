Return-Path: <linux-i2c+bounces-990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32581DCC9
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2DA1C214C7
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A015FC0E;
	Sun, 24 Dec 2023 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k86Ufbca"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B2310A11;
	Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33637C433C7;
	Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703454536;
	bh=hJ59p1pGYHtA5utgT9tRD4xW7PlsO9IsKpk/mfhKCLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k86Ufbcau2LDNGZ7DFFvdFXeEkNnLn30AWmjyyN10UxKAmjYMKky2zw/SQLvud5eR
	 dGAokTD3PGdp6jqVb9pQrNZ6N62kS9lggPvZYhh+0OkCJcZ3QjHEOSNftoCWhcggHT
	 wjxnpDvtdgeEl+GuJ2Xw7hA1beb8db6VVo+YzK+Stktufbo/hKbgB+ijKUsHczY/dj
	 XrpojbexQIyqN/mYPmN7tiqwiTT6wIyk4y0kE3VH1YsqePGKAWlTYig8Memj0Usqhi
	 9G3CBMmcEaebF7hkRIQz4v0TF3YNCOjpb9kI40pgNNmS1SHX8+Du4Qoumr45Ms3bOa
	 E5lDM88DrXxfQ==
Received: by pali.im (Postfix)
	id 41FAA81B; Sun, 24 Dec 2023 22:48:53 +0100 (CET)
Date: Sun, 24 Dec 2023 22:48:53 +0100
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
Subject: Re: [PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops
Message-ID: <20231224214853.sntvdrsz2mvzgrdf@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-2-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Sunday 24 December 2023 22:36:17 Hans de Goede wrote:
> The SMO8xxx ACPI HIDs are generic accelerometer ids which are also used
> by other vendors. Add a sys_vendor check to ensure that the dell-smo8800
> driver only loads on Dell laptops.

I saw that this driver was used also on some Acer laptops. As you wrote
above, and now after years I have also feeling that these ACPI HIDs are
generic, not Dell specific.

So I would propose to not restrict smo8800 driver just for Dell laptops
like this patch is introducing.

Maybe better option would be to move this driver out of the dell
namespace.

Are we able to collect dmesg outputs and verify this information on how
many non-dell laptops is this driver loaded?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/dell-smo8800.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index f7ec17c56833..4d5f778fb599 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -10,6 +10,7 @@
>  
>  #define DRIVER_NAME "smo8800"
>  
> +#include <linux/dmi.h>
>  #include <linux/fs.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -108,6 +109,9 @@ static int smo8800_probe(struct platform_device *device)
>  	int err;
>  	struct smo8800_device *smo8800;
>  
> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> +		return false;
> +
>  	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
>  	if (!smo8800) {
>  		dev_err(&device->dev, "failed to allocate device data\n");
> -- 
> 2.43.0
> 

