Return-Path: <linux-i2c+bounces-2795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE089A820
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 03:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3DF2845A1
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 01:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EAE9445;
	Sat,  6 Apr 2024 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFqle2S/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF09A38;
	Sat,  6 Apr 2024 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712366061; cv=none; b=ochXJDGLMfgiQezFslYp63j/Wb+7Ndx8uL9cru+T64bm+HEJ5EIqdUOzs4vowVw46QL3+0YzMA34A+WChqhltCmZ2t7PYSC1auynos71C5zTvGvAncQDBnWusJSJPWcs5bbSKOL4vHJnvbLu+1bFRv9sANF23O7vxYEJAKUkYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712366061; c=relaxed/simple;
	bh=PTay46EhJKpcsSvQ1rerjFFNkwigsdRIRiIknEoM8N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWjW9JsYLm7tG6h0plt3sxGUD7TX22U/OODXvrg6/qPFL7i22LhSTDcaXqef1raY98tGuJDnfC/1ZjScfRO1MNnRCZhtL0we12IjzU97qAwWH+1+hP/epcFOnbo4vI8Jpa8vDeATDeFwtKGg6P2eG9wrEOhEXDRWpx45WXFltqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFqle2S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7404C433F1;
	Sat,  6 Apr 2024 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712366060;
	bh=PTay46EhJKpcsSvQ1rerjFFNkwigsdRIRiIknEoM8N0=;
	h=Date:From:To:Cc:Subject:From;
	b=vFqle2S/tEQM+5mshB97x/NYmXQ8+KXwcFwzHDskk44wKN439M6I4m242qWW8dq+9
	 JtAPUAlSBXNtGOWzROgv1t05rZnrZeWp4u/xRIfdCkDjqB5AXsfwsZ4bgRBZgbO8Ki
	 PPfc6XyDDDPrMkJBj24+L8Q0uMtSYx1jKskERgOBT9l1QmjX9ophfwZS3/oYioyfRR
	 oJl4dZ2I782iTeiFaayrxtCg2M730jIlfkL48cbO/fAHg3kkwL3A80j8Q5mDPVIB1E
	 FeE+zF9hT2/q2eATDE9DoEWq9lR89dW5jqyu1xc+RN9l1jhZ6A11Mbr9kN40Lp4FTE
	 ezJTtGBsClsAA==
Date: Sat, 6 Apr 2024 03:14:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.9-rc3
Message-ID: <lv7pvqvuacslbw5uvitzftxrwp73pl5nnl4hxjvr3htrgjtsmd@gvuvd47dgysz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Just one build fix from Arnd in this series, sent from the
beaches of the Canary Islands.

I was also tempted to include Heiner's build fix regarding the
I2C_MUX dependency. However, because it arrived late in the week
and I wanted to reproduce it myself, I decided to postpone it
until next week.

Thanks,
Andi

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.9-rc3

for you to fetch changes up to 95197779091166b9ed4b1c630c13600abf94ada7:

  i2c: pxa: hide unused icr_bits[] variable (2024-04-04 01:07:57 +0200)

----------------------------------------------------------------
An unused const variable kind of error has been fixed by placing
the definition of icr_bits[] inside the ifdef block where it is
used.

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: pxa: hide unused icr_bits[] variable

 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

