Return-Path: <linux-i2c+bounces-2055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92486C616
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 10:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5229C1C23E26
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A688629FF;
	Thu, 29 Feb 2024 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXByytiG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D07629E6;
	Thu, 29 Feb 2024 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709200457; cv=none; b=J6Vjf8dNZHxmAch5Bw0dZPWtnlgANkAPTEcJGbDHvo1JYJxiSH936BpupltRhxmH7ug7rFCAM2XEsPBKOjnVzuckWOOjmWsXBhLwqmqrWHpdS+yQmplXg9EqniDQEu14zKIxYGPvPRPLAe3lS1zaK1svH7zOFc/7+QVsM0n8TKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709200457; c=relaxed/simple;
	bh=Bm6iDSjlJfmKp4OfVhM02I6Zh9dDTOW62eV0crvepLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csp9YXcURt24MBbkrymQRoNMFGKz4iXicNwQvlLto0dTctPfgvBzJ06TsZ6jEIoehb+gj6j3qMoDfZp3w/IqSNH+UNhv9EHuIZoNg1/lgsIzI+ZN8h/a7b2dsQ5/+I7Y0RMjJv7i0h82LcX5ca0JsUbHoosNB6gZ1AdrrinhNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXByytiG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709200455; x=1740736455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bm6iDSjlJfmKp4OfVhM02I6Zh9dDTOW62eV0crvepLg=;
  b=eXByytiGdDjhzdJdi3WkZHjgw84AuCUIEW3iZqMAQXtRjiMwtbgM62id
   0560kqkXghMSJ5+hSGD4o8K5sHhK1LUIelzzyrl+G0HucVJiu0m0A2k4s
   rYFsd7ppitXiB+XvJjiofl+YjYdmwiDB8gloKpYmpqrkBwZuVC5EX6x/+
   RxQIEaLhLEmdp/1hfSt3wsvYA4M9jfBAJZqFNzjBscXurvmJRYWDbgJfX
   UBk1eMnCWP66cGFksJaLC9GpT0+nteF+dFngvhqVyToNyCOkMgsPTunmu
   l84XlGFsb8H6YvzpMMz1x4NNHLitRbbWVQqzQ5T94dizDKkCWdTF8FX0P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21201731"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21201731"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 01:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035548"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035548"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 01:54:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CF62323A; Thu, 29 Feb 2024 11:54:11 +0200 (EET)
Date: Thu, 29 Feb 2024 11:54:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: acpi: Unbind mux adapters before delete
Message-ID: <20240229095411.GF8454@black.fi.intel.com>
References: <20240228023925.2814638-1-hamish.martin@alliedtelesis.co.nz>
 <20240228023925.2814638-2-hamish.martin@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228023925.2814638-2-hamish.martin@alliedtelesis.co.nz>

On Wed, Feb 28, 2024 at 03:39:25PM +1300, Hamish Martin wrote:
> Unbind any i2c_adapters matching an ACPI device being removed. This
> ensures that the linkage between the ACPI device and the i2c_adapter is
> correctly broken before the ACPI device is destroyed.

I suggest to move some of the information from the cover letter here to
make sure it is not lost. It includes good analysis of the problem so
should be part of the changelog.

> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---
>  drivers/i2c/i2c-core-acpi.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index d6037a328669..67fa8deccef6 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -445,6 +445,11 @@ static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
>  	return i2c_find_device_by_fwnode(acpi_fwnode_handle(adev));
>  }
>  
> +static struct i2c_adapter *i2c_acpi_find_adapter_by_adev(struct acpi_device *adev)
> +{
> +	return i2c_find_adapter_by_fwnode(acpi_fwnode_handle(adev));
> +}
> +
>  static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
>  			   void *arg)
>  {
> @@ -471,11 +476,17 @@ static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
>  			break;
>  
>  		client = i2c_acpi_find_client_by_adev(adev);
> -		if (!client)
> -			break;
> +		if (client) {
> +			i2c_unregister_device(client);
> +			put_device(&client->dev);
> +		}
> +
> +		adapter = i2c_acpi_find_adapter_by_adev(adev);
> +		if (adapter) {
> +			acpi_device_notify_remove(&adapter->dev);
> +			put_device(&adapter->dev);
> +		}

This looks good to me. I'm just wondering whether we have the same issue
on DT side too?

>  
> -		i2c_unregister_device(client);
> -		put_device(&client->dev);
>  		break;
>  	}
>  
> -- 
> 2.43.0

