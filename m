Return-Path: <linux-i2c+bounces-6861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5597C0F9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 22:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE8DCB21FDB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 20:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC9C165F0F;
	Wed, 18 Sep 2024 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZA9h7IXB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6DD6FC5
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692637; cv=none; b=XsaupZFKnOresz25aiDlRLBnLL7EuBj5AxWWdzSyEM3j6n54EE/DJsDfvlrYqxubzBS83Eg5nPbJgRLmqVcb6ojaGyiZaTYMDGT2C/U3jc293ne345KdfFmMMhktcgpcGWPTDWe27gHgJQimBkuy6eZX0773qFBd3i6sh+jx0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692637; c=relaxed/simple;
	bh=KcUksLyMqf7rjXvKRlZIFv//iw+UuTmd7yEO+f60avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSk/bl/Be6Hwywjim20KIFvU+XU4A2Fu7v1cEWwq1iWOn+WkCvnxM9Q2infuVYcbrnH5X6NZMK3xypGGLZkFdw4+Tqo6Qw00MuOEjeRDpSRY1uDENYzkSe8YDN9WRKZckAYPU+/ufYAd4Gx6qmx68XEDvBFv0oNLHS9cvJOiTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZA9h7IXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58739C4CEC2;
	Wed, 18 Sep 2024 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726692637;
	bh=KcUksLyMqf7rjXvKRlZIFv//iw+UuTmd7yEO+f60avc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA9h7IXBknZOsCGKKBVR37NYs5Fot1E9QdSkGLTpOwaCiCt1+gm46SaSUU6S2brEJ
	 hxJWcC4QNHUERxj/Zv9XlYo1jGbhG9vDJJcr4CmQ2KVVfGcwvWJ8NQw2HalBP4M8sm
	 4M5kLtYJsaUx73j2elzG/gLgAeRUW3/E44lXBBRLRBgGnFMiKFNG33qf5YqxHZhep8
	 iqOKkC2q8GFcpy2Cvh782Q0lND85YSzP6CoXNuIQQaznZLetA1yNHBVMlw88fsqF7c
	 gNmBL56v7nSjj+H8R3uzg71QzC5857NoCRAIEhLX1RgWaVmxW+98+Hbm4QGtuz0/h2
	 6g3ImnpOUTg0w==
Date: Wed, 18 Sep 2024 22:50:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, 
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <oc2l6xnkdgeyv3i5iecd4j3nsny4p2deyjj22sx4vyq2vohnnc@ky5cqp5jmftn>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
 <ZuSKUCC1XqBURdib@smile.fi.intel.com>
 <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>

Hi Shyam,

...

> >> Note that the git diff view is presented in two separate lines in order to
> >> suppress the checkpatch.pl "CHECKS".
> > 
> > This paragraph should be in comment block rather than commit message body...
> > 
> 
> I can move it to comment block but in the last version Andi mentioned
> that I have to leave a note about the function within one line.
> 
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> > 
> > ...somewhere here.
> > 
> > ...
> > 
> >> +int piix4_sb800_region_request(struct device *dev,
> >> +			       struct sb800_mmio_cfg *mmio_cfg)
> > 
> > One line?
> > 
> 
> I am OK to do it, but Andi has a preference to stay within 80
> character wide length.
> 
> Andi, what are you thoughts?

I apologize for my earlier review of v4. I failed to notice that
you had removed the "static" (which you had properly described).
I mistakenly thought you had made an unrelated line adjustment.

I'm sorry for requesting a new version. Please feel free to use
the format you prefer.

Andi

PS: I still prefer 80 characters per line, but this is just a
personal, non-binding preference.

