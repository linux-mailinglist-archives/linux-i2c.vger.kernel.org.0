Return-Path: <linux-i2c+bounces-8148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E39D5ED6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F145B26F1E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD111DE8B8;
	Fri, 22 Nov 2024 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZVKczI7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF851DE882;
	Fri, 22 Nov 2024 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278650; cv=none; b=SMA2okovBoB0ZcFtp/QO27836S9CoNWPOwGmLf0TduOgc2/xketVQL6rrM64z8dkTZcJq/XUGo6fTapLEm8WEZnPGJZVrOLAbI0iw7ees4HZCxOQW7gSEkpd+M5FBjo2+guxOZ8TtD9OmesA+N5JYZt0xmBAvGVB6Fj8ZxvMTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278650; c=relaxed/simple;
	bh=fpveC+/T+g9xHAw1IGw6wyr+JR41KJBXitvj1pzaAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pp9YaCnZOQm51XwSx+0d8GV2kysxVLkvfpWNa5p0xGRqOo91PjR7Cr/RHDRkPQnk7dMvea/gQKbYizmGu80HE8oXMU3HZotm0Kbg+To9cI0wwlPqCccCKJifat86JR459GZjDnHV9mxNqD1fZkTMBPkKZRF0MGKsg3tTN4W21Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZVKczI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49580C4CECE;
	Fri, 22 Nov 2024 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732278650;
	bh=fpveC+/T+g9xHAw1IGw6wyr+JR41KJBXitvj1pzaAUE=;
	h=Date:From:To:Cc:Subject:From;
	b=KZVKczI7ZT/INrusJVFjMSdRWFydWbV9AnfYWj2M7Tt32rj7xBHtGR+7NPwl5luyX
	 fBWXBTpjD6FSEHOM7o8dBX+f0cRo35ZXovS10/Ql2EwI7C4Pv/79JCRvxfWLbXdL+P
	 1vdFpXm9ZHpjQ0WhA5T3y/G9EeXWh/nQ/zWn0OqQA0NunfTmtcoi/vfYa+WwqIZxsv
	 fDSSNvpiwLxfWKmH7n7z8zjwg2Flb1+XJNnqUPdAWJ30+z7vtXK4jKOLFYm0Un/m/b
	 NOUj//ieaeFsOTTs36C5s8efGkL+6ojLe2oTaA0ia028p/Qe9FAGD5dtqiCbOUKoWZ
	 G4wC9uaRLXhjQ==
Date: Fri, 22 Nov 2024 13:30:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.12
Message-ID: <detebsw5fdnjirwzai5ldvy2arsm2jgyzojulpw77m6gujn65o@mgfxsijpsjdg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

just a MAINTAINER's update for the fixes pull request.

My branch is based on your for-current, which is 6.12-rc7.

Tomorrow morning I will send the second part of the merge window
pull request, I want to give it one more night test.

Thanks,
Andi

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12

for you to fetch changes up to 523930e4528f8e2267e8223245f0339eaec591c4:

  MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan (2024-11-20 07:52:09 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.12

i2c aspeed driver's maintenance moves from Brendan to Ryan.

----------------------------------------------------------------
Brendan Higgins (1):
      MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

