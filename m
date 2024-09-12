Return-Path: <linux-i2c+bounces-6625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C451976E41
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06155281899
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 15:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B02192B87;
	Thu, 12 Sep 2024 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzGGV718"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62044C8F;
	Thu, 12 Sep 2024 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726156518; cv=none; b=YxgUtJC2/otBpdAEVSiBzjErMtWUSKf2dPveo6MyHAT/I2WqtFWxjSbflYBQ6h1rigCdpa1iZ1z3ltetKRWapXmB1ZMVI4bVXqYSE58jabT2+xeTzfucsqZLzKgeHo7vwc/sbRyHyEnYQOeWJNHKMKWgAv3FBHQSeSZkXdhKxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726156518; c=relaxed/simple;
	bh=PQTvgANQm6FTPs3J4TXoQ2MpQbQk9ogAXoCk4kd5jNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFSQDQ2QloAHxFuO1xxmmRgD9SlrqpTXMoL2nBV0z72fy4gMJ4tJTjObaHI7HeZqX+fbnEoC2lMUgZGOYE644k3hcc3gm6aJ6PIM+w3ee1lcq1WfYw/4hFxiCGjgN2L9FMGaSgVCV7bfK9fYrrNxPglfSMjer48i2201Wm6BUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzGGV718; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7EDC4CEC3;
	Thu, 12 Sep 2024 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726156518;
	bh=PQTvgANQm6FTPs3J4TXoQ2MpQbQk9ogAXoCk4kd5jNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzGGV718qeuCyCvA0EXsWWAC/yi9i038vfM9B2rFM48dpHV/LguGvj097cReTexZe
	 wuq12QfjXkgnAZbFHQ43muJ0fN2+ANYTrCTWezJpqLJhA1/CeTSPLdHttuWpbwmIy5
	 xbRQ3SA3S+H22OPa1ejWAfYS0OJgdNABIio4JQnVsnWmnRTJTh4Sw3RcfV2t11X19/
	 /Fk83zDeCmqWI+EAFuj0aPr7k8BJ5TbGwlqJ1ajgtASe/IYrQlVWsWisncYJtk7hQH
	 +JJjt1ePlr0iUcrsiTYGOiZvbLa/Njq6P5Hc6vx+HlaSQuUh9Zyloa+U3+Qaj4jIFy
	 fECMgwyauCzoQ==
Date: Thu, 12 Sep 2024 17:55:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
Message-ID: <zuijrzur6htcg4dhccfydl4gb4rj62jq5co4ege6fkggaceesg@3kkujnlrgbye>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
 <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>
 <ZuMKUnY58Blm7UX-@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuMKUnY58Blm7UX-@surfacebook.localdomain>

On Thu, Sep 12, 2024 at 06:35:46PM GMT, Andy Shevchenko wrote:
> Thu, Sep 12, 2024 at 09:29:38AM +0200, Andi Shyti kirjoitti:
> 
> ...
> 
> > > -		sch_io_wr8(priv, SMBHSTSTS, temp);
> > > +		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
> > 
> > there is still a dev_dbg() using temp. To be on the safe side, do
> > we want to do a "temp &= 0x0f" after the read_poll_timeout?
> 
> Isn't it even better that we have more information in the debug output?

I think not, because:

 1. It's information that we don't need, and we intentionally
    discard in every check. If we print a value we ignore, we
    risk providing incorrect information.

 2. It’s more future-proof. In future development, cleanups,
    refactorings, or copy-paste, temp can be used as is
    without needing to continuously & it with 0xf. This
    avoids unnecessary operations being repeated later on.

 3. It maintains the original design.

In any case, these are small details, and the patch is already
good as it is.

Thanks,
Andi

