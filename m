Return-Path: <linux-i2c+bounces-6011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0E968E6A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 21:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47FD1C22A2F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 19:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293D31A265F;
	Mon,  2 Sep 2024 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PpkFIZll"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB11A2644;
	Mon,  2 Sep 2024 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725304817; cv=none; b=PIg/VHcu38ocr9N/gQVcQcoMRlGc/+sxg7KY1DvisDrE94fBGOfFLptJXgjd+K0FukK/+PRoVRGdr0fnQQa4Hddog0eoMdwsRhgxH+GVicJbjAgw0msTCSXAhFX+iOP5rzXfOfPY9S7GNZpIPZ4c/y+grvcxAL3xUyA1Sm/lfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725304817; c=relaxed/simple;
	bh=kGhu4h/5N9egiKuH0mqWnM76PfJfjgL/V15ntotrcAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAp03QAUO5QjXV4pDDe+GMbKkNHloIRi+WZOuX3O9bVjhxqKVGcnmxIg86oNasp9BG9r/SCBlaiqdlM8nlOMA5DgcBWDC+0tI1279zicHDKIImJhD9YhjZ698EkxUFoSvyaJx87hbLRrC5fdLZm8utaq8ZF4RAwFcdoWMStULkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PpkFIZll; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFA5C4CEC2;
	Mon,  2 Sep 2024 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725304817;
	bh=kGhu4h/5N9egiKuH0mqWnM76PfJfjgL/V15ntotrcAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpkFIZllf+QvaBHxnPNDT0BBi3vXDMI6E4lb6vr7cyCk4Czb1sjHu6Js2ctG4e/tE
	 vS/4Mz516FRmY6HmkIpLYg3MGw7SvQ61D9Ejy90cdoGVW1p5zlzcPN2odC61MUisEz
	 AvGragGcHt+GVgrrTZsAq3CtmegAKvOPYLHFrMXA=
Date: Mon, 2 Sep 2024 21:20:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
Message-ID: <2024090242-smother-preview-a1d2@gregkh>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>

On Mon, Sep 02, 2024 at 09:02:17PM +0200, Heiner Kallweit wrote:
> Kernel doc for this function states:
> "Compatibility class are meant as a temporary user-space compatibility
> workaround when converting a family of class devices to a bus devices."
> 
> Therefore remind any potential user of the old ABI that support for it
> will be dropped soon.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/base/class.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/base/class.c b/drivers/base/class.c
> index 7b38fdf8e..f12a43736 100644
> --- a/drivers/base/class.c
> +++ b/drivers/base/class.c
> @@ -556,6 +556,9 @@ struct class_compat *class_compat_register(const char *name)
>  {
>  	struct class_compat *cls;
>  
> +	pr_warn("Compatibility class %s will go away soon, please migrate userspace tools to use bus devices\n",
> +		name);

That's not going to do anything except annoy users who have no control
over this, sorry.  Please just fix up all of the kernel and then delete
this function.

thanks,

greg k-h

