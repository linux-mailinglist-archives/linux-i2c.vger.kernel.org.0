Return-Path: <linux-i2c+bounces-6532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04F974C8F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C073B26408
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 08:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DC41547CC;
	Wed, 11 Sep 2024 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYCqtepz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217815445B;
	Wed, 11 Sep 2024 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043073; cv=none; b=u3oyahWhWlASRDM860OsWr/Ll9UzI+8WMWaSalwU2RjdX1/ImLYECkbA+mYnAAdj2WFmej3ii8N3ePlWFsEK4OcznV2DyeSyPEa+3B1LW3W3bXFMTVdXOo6ZqHZAhFoCnW4CdpO/wAiF5DO3UIkvm5IjUs0+er5OXimJo1/BlB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043073; c=relaxed/simple;
	bh=3QL8lvn6X8Kvy8h9uFOJovBR7ARpx43Z9qXG051KXRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1knpUMrVn7rfAglZbMsLhsM2z8xJHNmZhyBC5EOIOWUcJUxu8ZzfG9N6kLVU838ik8GcbhG/T+GOeLzex/piWpZ98C+tvreUSNx3GUCbpKUBwLaGAqspQ40FYXfkaW3o75Eq+KMADWXJDieUYaL8wUAwwGqj6DU/CVvgfbRhAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYCqtepz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CE6C4CEC5;
	Wed, 11 Sep 2024 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726043073;
	bh=3QL8lvn6X8Kvy8h9uFOJovBR7ARpx43Z9qXG051KXRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYCqtepzbCPmkfJKH0DDHFCMYzgXH6PL2CJ8e611GtqFm0xjxcxAeGicYfrot1IL2
	 AQ7nAZTJ1NzwzAMe3xSrZq4fyP35fbOSNSfv9I3FzWYc8h5VGaow7n854xdA0EiC5r
	 mHV/mDSM70nkmpxw1AcOYYkvv//VKp0NQSQ8qyjfYobl1Ku7qfg7QsElJVYAdbNrIH
	 YHL1adnGXkAnNhV659NQ4OGVgE68Iu3by4WofYPrD8UScy36eolDsOu4RlQbVMn3VF
	 tViau7wxS/mavBnE+6Ni7vG4tKQGU8VPhKz4WyeTtUrnYkrOyTAYocS8F6GdnaUrQ0
	 lDKuFjROZ7jmA==
Date: Wed, 11 Sep 2024 10:24:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
Cc: "git (AMD-Xilinx)" <git@amd.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas" <srinivas.goud@amd.com>, 
	"Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, "manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: Re: [PATCH 3/3] i2c: cadence: Add atomic transfer support for
 controller version 1.4
Message-ID: <zblc42zoivn3ofoe2ymqm2bar3ffiujzknqzm54ww5mi26oq32@25cjisrx274e>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
 <20240801094408.2004460-4-manikanta.guntupalli@amd.com>
 <5hjezq5ag4etru6suzbntvg2fwn45acckiyxsujmsjxsrgqxrd@asub7zr2t3gd>
 <DM4PR12MB61098BA9557140DB0BEA36848C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR12MB61098BA9557140DB0BEA36848C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>

Hi Manikanta,

> > >  	if (msg_timeout < adap->timeout)
> > >  		msg_timeout = adap->timeout;
> > >
> > > -	/* Wait for the signal of completion */
> > > -	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
> > > +	if (!id->atomic) {
> > > +		/* Wait for the signal of completion */
> > > +		time_left = wait_for_completion_timeout(&id->xfer_done,
> > msg_timeout);
> > > +	} else {
> > > +		/* 0 is success, -ETIMEDOUT is error */
> > > +		time_left = !readl_poll_timeout_atomic(id->membase +
> > CDNS_I2C_ISR_OFFSET,
> > > +						       reg, (reg & CDNS_I2C_IXR_COMP),
> > > +						       CDNS_I2C_POLL_US_ATOMIC,
> > msg_timeout);
> > > +	}
> > 
> > You can merge this if/else with the one above, to save some code.
> Thank you for your suggestion to merge the if/else blocks to streamline the code. We have considered this approach; however, merging them would necessitate duplicating the following lines in both the if and else blocks:
>      if (msg_timeout < adap->timeout)
>                 msg_timeout = adap->timeout;

OK, makes sense, I didn't see it.

Thanks,
Andi

