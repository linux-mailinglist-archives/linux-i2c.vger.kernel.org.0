Return-Path: <linux-i2c+bounces-15092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE69D17FC6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 11:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDED300EA12
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8179838734F;
	Tue, 13 Jan 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DY24xiE6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AA3806B8
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299855; cv=none; b=TZntMSQHhdRhOjMOc6vOJ0WTFBypJnNGCFvaiXZ1v1cl+MJqzhnWx+HbdkvL7x4aS722F3nZENSny26oH8CTkDaX7lM2v6p8FP/MrRwG8E4TOVd062EF+0wtnj13ORKVQRgHMT62U3fH9W1cgwxHfdYLSPkxsHuj8vVO3aMIZTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299855; c=relaxed/simple;
	bh=Kruof+S4JCff91nyrasFuXGMkzCokhknCIr4QwOfW4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO81nhco4TU+VUYkatXUVxn3Qg+ocrXdneST5EsEUoEscZn4s8xyD3pynjFz2rIqvljNqEKHpbZVfJ+nkuIrJt18xXYjNedf5e5lG684zpL/tmjecBNatNMzhhAWUoH77+Gs5R2PiK7TPfj7SvhVyb1fo6LfnSspdiUWf9d6aUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DY24xiE6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0ytB
	w61AJ68MuBw9sZblZUxVsf4PfvrL6oMmPTCLbow=; b=DY24xiE6svSjjifhY393
	HcINkd/IFsBi/PtdCE1LZKcLFydzYhJ7HGxMtP9TxmSt4vrCJpAgoOlJ0MNZub/U
	9v60hD9PZ2lKD/o45Ovju62MOHO0I9BAViSFeWOMZcNZyL8wvo0E+4rG9xtWNXo3
	FCK83UuPD7Niga53TlJ8/nJw+HyiCn+6YT2me14FIe3aHfwmc2xsIbVd++huY6AG
	M4MDKMfmfwgB6vsxUu0UBc+MT5wqujvmMpANCV8QKlEAHWtoiDgIXmkWNu2lOYVN
	M7PY7DF2HgVnKKKCfpri3r7h0OecSLY7PfGmzI3ZxuGvZwF7WN2X/rUunEKNTZQi
	mw==
Received: (qmail 1638990 invoked from network); 13 Jan 2026 11:24:09 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:24:09 +0100
X-UD-Smtp-Session: l3s3148p1@gGNeZEJILKEujnvx
Date: Tue, 13 Jan 2026 11:24:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hans Hu <hanshu@zhaoxin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] i2c: piix4: use i2c_adapter_dev()
Message-ID: <aWYdST90bR1jpeyx@ninjato>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-2-bcf960a48fa9@oss.qualcomm.com>
 <20260112104449.26a4bf76@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104449.26a4bf76@endymion>

Hi Jean,

> > Use i2c_adapter_dev() where applicable in order to avoid direct
> > dereferencing of struct device embedded within struct i2c_adapter.
> 
> I will confess that I don't know what is wrong with the current way of
> embedding struct device in a more specific device structure. I seem to
> recall it was fairly standard to do things this way back when we
> implemented this in the i2c subsystem. But I will trust you that this
> change is needed now.

I guess more people will wonder about the upcoming I2C core changes, so
I wrote a bit of explanation:

https://lore.kernel.org/all/aWYYZEPX-_1GfQtL@ninjato/

Happy hacking,

   Wolfram


