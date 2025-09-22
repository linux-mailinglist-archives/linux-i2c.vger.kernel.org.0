Return-Path: <linux-i2c+bounces-13086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54611B9116D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E0D77A686A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720BA307488;
	Mon, 22 Sep 2025 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uU1zCZy/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA287082F;
	Mon, 22 Sep 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758543485; cv=none; b=CQJNOtfaU0mmfW0tv8DoYNmYKanpB7WKiqAkl3AtMM6sKVs80uIPQ8ym3ROofwe2lQBhJo1IODtMLSojbEa4kRJZ4ldddlcRNJUSnc1deyzKr4/fr4uPaWLbeKYCYFhvltKGjSmJh4GSZciVeYfXZzrEo5AKBACRyoW+fWgGswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758543485; c=relaxed/simple;
	bh=Px64DPLI5DXIGk/sess1M6hrO4Zq9NDNasK4kVW/lro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOm3s4toTkgybkkINz3WnaS2AjF/pZqiedqgI6DB3nTJb2jZ+3inKoWuIOkwO6BF/V6vmZoNwDxcJcTWMsgSpLTU2f4W2oNebgJzdfGDQttvfvv/6juFINeYyHHCLjDLgWHpWmSJ5BL3sTk45tFoKc5uvbh1gaKxhoem4eMXpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uU1zCZy/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EA4C4CEF0;
	Mon, 22 Sep 2025 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758543484;
	bh=Px64DPLI5DXIGk/sess1M6hrO4Zq9NDNasK4kVW/lro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU1zCZy/GsonXmTCzQS/XilHrYbOzSxn133OcMojAPTO4G/FoObhPuWySl0dtlnf0
	 /eW1KyJQ18to8ovFAlG7lWK6vdb4CgRgJOmChPP89jYKBkncbXyltAkUPFsRxqEWce
	 parWgBMJNFOSK1k4Nzll5Jy/YCdjJPHFtdVoCh08=
Date: Mon, 22 Sep 2025 14:18:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail address
Message-ID: <2025092234-magenta-scouting-c3c4@gregkh>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922120632.10460-1-sakari.ailus@linux.intel.com>

On Mon, Sep 22, 2025 at 03:06:28PM +0300, Sakari Ailus wrote:
> Wentong's e-mail address no longer works, remove it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c562630d862c..1846156c0800 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -891,7 +891,7 @@ static struct usb_driver ljca_driver = {
>  };
>  module_usb_driver(ljca_driver);
>  
> -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> +MODULE_AUTHOR("Wentong Wu");

Is there a new address where they can be reached?  SHouldn't that be
used instead of just deleting the intel one?

thanks,

greg k-h

