Return-Path: <linux-i2c+bounces-1-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D387E7EAB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A741C20B47
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB6238F9D;
	Fri, 10 Nov 2023 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGtrMwsp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208732C6C
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188422FED2;
	Fri, 10 Nov 2023 03:30:45 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC0C433C8;
	Fri, 10 Nov 2023 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699615844;
	bh=njSaKFsGWjCldhNW7Y7iD3HrJm8EnbqsgMz5zjrw6Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGtrMwspaNcfUWQFWD9Mn9esgOUZwlXqIYnHRt/ONA36Vi0xFevDcjIDyNdxHdstb
	 CMUsgVaJeowXqHuk4o3yZ/OJwRjBd6kDUYdkN0cB39smLWfaiRYieBSYr+WYQX6H/7
	 j4/VU9AQsEUXMp6ptXOg2j7V+isEosVSRIJ5sj/1y80v1FoXVd8SYPReSoJsejT+cH
	 lJjCz3bwOvWULf6teJ8fwB55ql6PqDZpM0agIjRpfjktSyxIXSocVMxeUY7WrCQPOR
	 q52ZdkeQUqPrs4ZLOmgRNvAvKzhfM1bCOdZj+brnECWTTKQeKjmSwxrs/nGD65tUJR
	 riBTtu03lvvug==
Date: Fri, 10 Nov 2023 12:30:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	wsa@kernel.org, codrin.ciubotariu@microchip.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: pxa: move to generic GPIO recovery"
Message-ID: <20231110113039.esdkjkpzj7p2aqc3@zenone.zhora.eu>
References: <20231110093039.190076-1-robert.marko@sartura.hr>
 <ZU37aJfDpcixU2OZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZU37aJfDpcixU2OZ@shell.armlinux.org.uk>

Hi Marko,

On Fri, Nov 10, 2023 at 09:44:08AM +0000, Russell King (Oracle) wrote:
> On Fri, Nov 10, 2023 at 10:30:11AM +0100, Robert Marko wrote:
> > This reverts commit 0b01392c18b9993a584f36ace1d61118772ad0ca.
> > 
> > Conversion of PXA to generic I2C recovery, makes the I2C bus completely
> > lock up if recovery pinctrl is present in the DT and I2C recovery is
> > enabled.
> > 
> > So, until the generic I2C recovery can also work with PXA lets revert
> > to have working I2C and I2C recovery again.

Reverts are never nice, but if you are confirming this doesn't
work I can't do anything else than acking and bringing the driver
back to a working status.

Acked-by: Andi Shyti <andi.shyti@kernel.org>

I would have preferred a different fix, directly in the generic
i2c recovery, but this goes beyond the scope of the patch.

> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: stable@vger.kernel.org # 5.11+
> 
> My feels were that this should not have been converted to the generic
> recovery as pointed out at the time, so thanks for confirming that it
> broke as a result of that conversion, it did indeed break.
> 
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russel!

Andi

