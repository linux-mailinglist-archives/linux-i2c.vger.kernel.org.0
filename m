Return-Path: <linux-i2c+bounces-15125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC4D1A382
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F33730341AD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03012D8797;
	Tue, 13 Jan 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CJBQIrSy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF872EC084
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321551; cv=none; b=rmAq5XqOtX3SHBleZUu/1tlMSpJQdWdhsB8fnp6JRfrWYRkoVQ3F1Vl0Day68N6vulBDns12iVNpthZ9yZ894GQiLfzwKZXYpBrWNFwEzk7S8xxHDei3gWM5BcJ1eFcnWdM2XbcYMQhMfnk7SGgLIQX11Q9s+6ROSTJKCzKD4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321551; c=relaxed/simple;
	bh=qStXrFMHnuQiSNRYfkwBG12j7kCZWW2k6orfmjBys7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHbQLUfA94TU06AiXRBObaAj/q6pH6OxTaSdQ3qZ0BBO/dDy/PSWNZjVgRrxtC0pLDQ1DFRlkbqBuFwXyTlGHSMmvwc7lTp8GTw8kvIVcw12lsIiP9OtT0M8wJKgIoYYB+f4nvtjGODeCul/ADGSImbuS7b5Qoqc+5WPVpuO6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CJBQIrSy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4wzI
	00K4+fuFWzIAAe/FaIjUDyBCAXoHSvzS+Yh5d+U=; b=CJBQIrSyICYVE4lEp9kU
	lT/LsqlZcQGe0JRHGNa7cDH1BVh9f7kSMMDtjkVV9xnm6Ruij+c4yVfkdOt/UX0R
	i+lWGzD14GTErLnir5pDd/rd6UeD7sQWB68cO15QDA8WeUWco1VENJLC+Xnm8quY
	vP5BIHfxg1rWx6Vl4C8PdMqu/L21BsF39hQJtgDrctD7lwzCYSBPndmi6pi7NeuM
	VisMQl8q8dDugQpCAbnXFDoUtHnrwkRjywFbOqNICII+xHAuqXfGNmvwxYM50Guy
	0xXiC5TzZbkIN8roezfLjh6C9NrPS12APS2vtv7tWoRCuCdAibkmcX6SbXPplELP
	iw==
Received: (qmail 1777464 invoked from network); 13 Jan 2026 17:25:39 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 17:25:39 +0100
X-UD-Smtp-Session: l3s3148p1@cucycUdI0ocujnvx
Date: Tue, 13 Jan 2026 17:25:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] i2c: core: Use dev_fwnode()
Message-ID: <aWZyAyzoqlYnugWZ@ninjato>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
 <20260112132346.4087258-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112132346.4087258-4-andriy.shevchenko@linux.intel.com>

On Mon, Jan 12, 2026 at 02:22:42PM +0100, Andy Shevchenko wrote:
> irq_domain_create_linear() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of using
> direct dereference().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


