Return-Path: <linux-i2c+bounces-7801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2C9BD70F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 21:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61295283D8A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 20:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF4A1EABCD;
	Tue,  5 Nov 2024 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCLkYqd8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55229CE8;
	Tue,  5 Nov 2024 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730838627; cv=none; b=lqU3UXCOSOAxG9HQ/bXPALcZqpmDdySugHL4Uad2TdX/fi3ZvQY5OvTy3VVf1cv/DJm+UqgiT5h8GUSifhEuEV9ytLAwr5dIhxqCyhp0PrO7iboWDkQweDexah8IhWc3S+/qa4APa54fUlfIP+IZ2rTeIcqB1PCk5xMU8PpwDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730838627; c=relaxed/simple;
	bh=zdcxgpd9SDhEk04Xdmrndw42xAt0b5xsZMC7ZdIjz7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNstqbsE74mIp5ykGhLEM2nUl1bK6HgDiE/W7iy2N73lMwmi6vGK8ZuLWFRSjGMZBF30dyR8WqxLDIeOqDD5DoeEEJ3xP0f4oAKFDOWmawFhcuDyR8M1gVeb2Dkcxgq4AI3dutOFVjLzuhX/puCATGotlO8Mz//8ZgFRCbf8b50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCLkYqd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01008C4CECF;
	Tue,  5 Nov 2024 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730838626;
	bh=zdcxgpd9SDhEk04Xdmrndw42xAt0b5xsZMC7ZdIjz7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCLkYqd8aICIGSsJAI9vXc0UueZHUW0KdROonxeCUrP8p3SP9i4c+tApLCSVQ7h1S
	 tBQ9tppdwj5EYR+CLn56eaC4wZ1hKEWVAHaxy7TiJCqmbniGS5Sv+jIRFgZ1Ir/30x
	 RkEJPBKCgVuGWiQ8vBUDOXuliFo83fy4TRdm+ot/E3F6Ou88KPcV9f9VTFayd1ciBH
	 hEubpei4kGpMy59BojvXrsfrAXxL9CVFwC2Vfjx9huSFLjf5DlFNeZ66nH21jXv4Zu
	 TTiVF7bTgVRfGIyKiqzPp+hwmolcFDhj0MP40OpSQ7XlIuAbuKqSy5DJySxXohY/3H
	 mXbO2eEagLWEw==
Date: Tue, 5 Nov 2024 21:30:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Liu Peibao <loven.liu@jaguarmicro.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, "xiaowu . ding" <xiaowu.ding@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master
 holding SCL low when I2C_DYNAMIC_TAR_UPDATE not set
Message-ID: <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>

Hi Liu,

On Fri, Nov 01, 2024 at 06:18:36PM +0800, Liu Peibao wrote:
> On 2024/11/1 16:44, Andy Shevchenko wrote:
> > External Mail: This email originated from OUTSIDE of the organization!
> > Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
> > 
> > On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
> >> When Tx FIFO empty and last command with no STOP bit set, the master
> >> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
> >> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
> >> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
> >> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
> >> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
> >> when IC_STAT_FOR_CLK_STRETCH is set.
> > 
> > Who are those people? Why Angus Chen is not a committer of the change?
> > Please, consult with the Submitting Patches documentation to clarify on these
> > tags.
> > 
> 
> We have discussed and analyzed this issue together. I developed this patch.
> This patch was also reviewed by Angus Chen and Xiaowu Ding.

The tag list follows a specific order: tags are sorted
sequentially, with the last Signed-off-by (SoB) being the person
sending the patch, which is your email.

The other SoBs are fine, but if someone contributed to
development, consider using "Co-developed-by" instead.

If someone tested the patch, use "Tested-by"; if they reviewed
it, use "Reviewed-by"; and if they simply agreed with the
change, use "Acked-by."

Please ensure that "Reviewed-by," "Tested-by," or "Acked-by"
tags are visible in the mailing list. I do not typically accept
offline R-b, T-b, or A-b.

This is why Andy asked about those contributors. Three SoBs can
seem unusual, but it's acceptable if justified. Reviewers may
ask for clarification, and it's fine to specify contributors'
roles. You can also provide extra details after the "---"
delimiter.

> And in this case, should I replace the "SoBs" with "Reviewed-by"?
> 
> > Also, sounds to me that Fixes tag is needed.
> > 
> 
> How about this tag:
> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")

Sounds reasonable.

For accepting this patch I need an ack from either Andy, Jarkko
or Mika.

As long as the fixes are limited to the commit message there is
no need to resend the patch.

Thanks,
Andi

