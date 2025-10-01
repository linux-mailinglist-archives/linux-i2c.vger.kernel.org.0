Return-Path: <linux-i2c+bounces-13290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E79BB1E42
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 23:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3630F19C2624
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 21:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4342FAC0E;
	Wed,  1 Oct 2025 21:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJKiaNYY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD522820A5
	for <linux-i2c@vger.kernel.org>; Wed,  1 Oct 2025 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759355892; cv=none; b=S72UklvR9oxNMQmWK3CPkBHI/n+pc0Z1ShV013Ogm7mKhSW43XFS5y3UP0LU4FLIvH7SWhyQoLiwVWMnodhraFt8L7Ir1FtWaoqGKX4b/jL9lh5JtTNbPIqNGyIcDZ8qly69KLQVQlr0ax0vgJKlXbeKKHSvU9UWTe/KfHxceNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759355892; c=relaxed/simple;
	bh=IgI008yJgcgmysgEhuQB3odrxiy971UWHZnTjS682kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUHC0p4fF6JigG2bCc7ArUd/GfknxG9cEiHpJhMSPh5c3cgPCMk6LXLqI7iKMptmy/aKYA4ftb3/tlgiUE9JHw1irm+Tf8KvxjahAMEwTQU2iQGVuYdlbNeJcinJNYK/Xpg8ReFzFmZyrTCqxmr/oyXP5Xi+78fnacQiaM8ClvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJKiaNYY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759355891; x=1790891891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IgI008yJgcgmysgEhuQB3odrxiy971UWHZnTjS682kM=;
  b=jJKiaNYY2GciHfgfTd+s59O5/QYfgu0xuaNFtF8hjGEhtoIay8k6gf3b
   l/AzD4Am8Z0CHmBz7lwwm5d/Ls2BOu5ECGB4uBL88bBqrT+fkW0uQSEtw
   42dqJ+19XodPFXcp/BssaTjSJJOlQK2g6S/OIth3zJpMVQy7xdtoquhjK
   R9VcbqBupdtESA2LfQ2rw1K/zb1zUbpN0jQplr1pnY5wO9u4Ya3CTk5N4
   eCc5xPDH6LnREnJJFULtIE+IL5dA4VeMLuvbZzhXOOoJbG8A3KrGp6XoE
   gCVOcWc72N8TLourXZK0hlFJCYpQEOIvyiL+6qrWqPy9/gvl9KCt0hnY0
   w==;
X-CSE-ConnectionGUID: IipASh85Q6mWOyKCL+aXZw==
X-CSE-MsgGUID: tMCHzuxIQIuQsKll+8A8aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61601966"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61601966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 14:58:10 -0700
X-CSE-ConnectionGUID: 0QxXM1cmR/6lpakEeni94A==
X-CSE-MsgGUID: yX2lKLqfQuWcPxiBuE6DKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="179341899"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 14:58:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0F7BB11F91A;
	Thu, 02 Oct 2025 00:58:05 +0300 (EEST)
Date: Thu, 2 Oct 2025 00:58:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
References: <20251001212310.4813-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001212310.4813-1-hansg@kernel.org>

Hi Hans,

On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
> Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> 7450.
> 
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Note this applies on top of the addition of the new i2c-usbio driver which
> is being merged through gregkh/usb.git usb-next
> ---
>  drivers/i2c/busses/i2c-usbio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
> index d42f9ab6e9a5..e7799abf6787 100644
> --- a/drivers/i2c/busses/i2c-usbio.c
> +++ b/drivers/i2c/busses/i2c-usbio.c
> @@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
>  	{ "INTC1008" }, /* MTL */
>  	{ "INTC10B3" }, /* ARL */
>  	{ "INTC10B6" }, /* LNL */
> +	{ "INTC10D2" }, /* MTL-CVF */

INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
an actual system that uses USBIO and this HID?

>  	{ "INTC10E3" }, /* PTL */
>  	{ }
>  };

-- 
Kind regards,

Sakari Ailus

