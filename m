Return-Path: <linux-i2c+bounces-3045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A298AD71F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 00:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E346EB222E1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 22:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DB01D54F;
	Mon, 22 Apr 2024 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G2CjSUhN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619FA1CFBE;
	Mon, 22 Apr 2024 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713823787; cv=none; b=q50tQL7G2QGewTies594yoeA7MU/OPfp9j6cLmv2NfOUcbtAuXNEAhqL9ni3xSBYqmVJRjfht2/xtWLQx1Nv3T6zPSDzKSUI+46vr8Lfb3l9xR/qr1hlmuy/+2No3+Tv2eHqSVkFrlXWQA5Qw9RBIckbcPHmQYmHexwFjPNZSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713823787; c=relaxed/simple;
	bh=bhzFxthcWnNZCQ2IVGZBg0BJmyrKdr+FtF8qDWZLzd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI3rRxvHuZp30U8ZOUrBPDiNcV6mdJ9w1PJuhKjdqALyyGAlf10RmOcBsvruX7CICyyRMGgwjDj61FL3I5hgLG+DFQcfNI5dRTBMjH0iSwzjUbl2FaAhIun5FkUu5e4jGxK06Rkh3kWTGx7WP+0qwOCCvK5wVVJVndjfNG5v51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G2CjSUhN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57A1C113CC;
	Mon, 22 Apr 2024 22:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713823786;
	bh=bhzFxthcWnNZCQ2IVGZBg0BJmyrKdr+FtF8qDWZLzd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2CjSUhNQbhoAi9rih+K50jMMb7mGAzlxZMRLdUqBm1io58+YyH1L8KcvwPkGIOE0
	 2gKCClDUPWvqw07j4Nefain7bejcZPYvppK0MfGoTS+87mA0z6Yvb60KKtlGoD0vSj
	 5VOp/BDyDMDOtfYYwkpSNvPKEDW3yyCuUcVTCLIE=
Date: Tue, 23 Apr 2024 00:09:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	kernel-team@android.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
Message-ID: <2024042324-public-disgrace-2674@gregkh>
References: <20240422174337.2487142-1-dtokazaki@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422174337.2487142-1-dtokazaki@google.com>

On Mon, Apr 22, 2024 at 05:43:36PM +0000, Daniel Okazaki wrote:
> If the eeprom is not accessible, an nvmem device will be registered, the
> read will fail, and the device will be torn down. If another driver
> accesses the nvmem device after the teardown, it will reference
> invalid memory.
> 
> Move the failure point before registering the nvmem device.
> 
> Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> Fixes: b20eb4c1f026 ("eeprom: at24: drop unnecessary label")
> ---
> Changed sha length to 12 in description
> ---

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

