Return-Path: <linux-i2c+bounces-6623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE980976DD9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B6F283D1F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4011A1A3037;
	Thu, 12 Sep 2024 15:35:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209C44C8F
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155351; cv=none; b=X0zvo3lGwW6oF24BZvwWE5kjPYtpqH6Gq/yaMdaPdRl5IERBlyOtP8dHUQ+leDkdkcm5aDFoV/U0EBvbmZ6LDQiFTFtM0BdUKOsW01EHvLLl2N5GTYx3FmmluO/cBPPINDtWK41NUoTWeT9jSJWHQa93vElUQhRHqeHzUJ4Bdgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155351; c=relaxed/simple;
	bh=naw2KYgxkUq5thI5FyeaglCUfU8OC8N5uOCGnoxdOEM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9v2z4fovdhjHyOaDSFIeDwwqq+A1ovIYedK/nHnlPO1YjR+WyU98AFBpHnYMmjc8rb2tm2HgVKx7JUO3do/A5M8FYuNaKiznUOVg2C7xdC4Zy/8IvjsMNxBgzpK9f5qz8zZ7oo22ap4NM3ogo5dtIbtYyKatpcgQDIk5LirqFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id adcf4374-711c-11ef-812b-005056bdd08f;
	Thu, 12 Sep 2024 18:35:46 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 18:35:46 +0300
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
Message-ID: <ZuMKUnY58Blm7UX-@surfacebook.localdomain>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
 <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>

Thu, Sep 12, 2024 at 09:29:38AM +0200, Andi Shyti kirjoitti:

...

> > -		sch_io_wr8(priv, SMBHSTSTS, temp);
> > +		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
> 
> there is still a dev_dbg() using temp. To be on the safe side, do
> we want to do a "temp &= 0x0f" after the read_poll_timeout?

Isn't it even better that we have more information in the debug output?

-- 
With Best Regards,
Andy Shevchenko



