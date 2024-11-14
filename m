Return-Path: <linux-i2c+bounces-7975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D619C8348
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C11E1F23006
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15B01EABAE;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JD0jUx23"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D31E9060
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566452; cv=none; b=OxDL3HXXGWmw5EYcCEDrJdf79GuLkNvni5jlNUgVEwdNZ1c5y/gY2YfyyZbeU+9wxNAwo4EnzhveTgdFgLf8/jnxhXvRAY5s+FeJsRMP5lZWITyOW6r3J5Ofte307gUq9UaadsXpoWNZLLQfApOfVtzQlGNabA+dexh13nkzCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566452; c=relaxed/simple;
	bh=yjwiqCS+mcyDBmeLd00KtGZJyJ/qzKMlwHe28yYIm4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BgaMhtvJRzYHtbTKh3aRafu1KNUXG94ZJ/nIsgqF+ggMlomhFdN50Rl54x/RcoTLEgQU5XP8FOKU86G2NUbTbdsmxQNR7eA+3Pv8eDwlVL7J4+CpHJdY5EwM63SfnCWrUmfFJ8A5VVDk4YbZDrFxSkdpJY0EzU9LJqLUggIfe2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JD0jUx23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CEF7C4CECF;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731566452;
	bh=yjwiqCS+mcyDBmeLd00KtGZJyJ/qzKMlwHe28yYIm4k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JD0jUx23XXhogJwmkfA9K7vG7o3PWzpA41Zozfmihk2ohksr5aHvxm6MStyBDO4to
	 E6D3bsNJ0DA7TFoiqtyyIKfCZbTOYabesr30WceeSF+cZWEe+/UESvLxvDqfNiitCF
	 L0eJbXHkAc1iSYVZd8fg46PZiESYfEZCH0riEC3xnoWdKzrHUdaj2azNKL2TPrhhrN
	 4pySM+LiTgCCZuTMQhGuFD0X2G0m/AQGYlfBlHrjRCmYx9qiEJGPFoLAGMrXLaRKT8
	 U+4cpjL/QIr+FYN0QmBrjCzQca0E09WQytDIvF/U/OM11+6nHazzcPMTKf7Bdt1rIM
	 bDu1yYQAO/twg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04036D65C48;
	Thu, 14 Nov 2024 06:40:51 +0000 (UTC)
From: Stephen Horvath via B4 Relay <devnull+s.horvath.outlook.com.au@kernel.org>
Subject: [PATCH 0/6] decode-dimms: Implement DDR5 decoding
Date: Thu, 14 Nov 2024 16:37:34 +1000
Message-Id: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6aNWcC/x3MQQqAIBBA0avIrBNUNKSrRAtzppqNhkIE4t2Tl
 m/xf4NKhanCIhoUerhyTgN6EhCvkE6SjMNglLFqNk4ixYwkEYuTuw/BOuu8NgSjuAsd/P63dev
 9A1wdAKhdAAAA
X-Change-ID: 20240625-decode-ddr5-b8aa4545812e
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=s.horvath@outlook.com.au; s=2024-05-10; h=from:subject:message-id;
 bh=yjwiqCS+mcyDBmeLd00KtGZJyJ/qzKMlwHe28yYIm4k=;
 b=owEBbQKS/ZANAwAKAYC8XiInGJ2jAcsmYgBnNZtvHWZ/Xc7F8uUfAq90j546x8z99urE1xw8E
 +eko9CbBreJAjMEAAEKAB0WIQTIAeBGYgifSxYwNMiAvF4iJxidowUCZzWbbwAKCRCAvF4iJxid
 o2PnEACJSusba7fsL6vQ0alw9MYjvWfDrKd3Xr3KiXiercQ48T/+9x+CGBAhpDaSQ/nT1YLJpca
 KtC4HX/x/XjwuayBSsBZxMI4vnpSI6y7ve+lmWejiw0s6E9OGe+qvFpSAgjt/Hh464xZn8AnIS6
 INLlXRywsloPNZ9mQrVhykDKUxXTJoxTY95UNTd4wKebcCNxiPony2/VBcemQvb2twv7L18J3Ax
 nLkdVjGr98vw2NsyK4PMC29AscFTBx5hrZTi6OH80F/15qb3npV9uPWlxjYOjdNGShXN6XxTbT8
 nHxTvuAyFK8f+Ya4cYLwiDC7XFy++6SZTi2qfcYfpartdNds0nN5NRJ/29tfOAvSZwHL60bbwYK
 R0DUWjlLp3NokqkrwQHBiINt7AxXYQAbVgIjb6ivfFMWT78uZDtpXeIZ38D32WvmbKT/LtCHtPI
 dB6AvquS6Qfk8KYzE/vp1Z6yJWpY/P9XU1feFvYyoR1T6L70Bza2BlTZGgNWJRpQdaZxikK0cBn
 5uYUvnqnAc+KH+ARGcoBeJaPH4JK46CYQw64Ll18A9L2pSw5lpr+CwmfP+71GP+OstZqna0JSBc
 9wXd5unG853hEochkcGF5HtMPLKvj35VhmcE+tP4R8KXI4ShOaoSr+p6dW0YShOV4lw7pDH34+Y
 zx+keMm1DXlbdUw==
X-Developer-Key: i=s.horvath@outlook.com.au; a=openpgp;
 fpr=C801E04662089F4B163034C880BC5E2227189DA3
X-Endpoint-Received: by B4 Relay for s.horvath@outlook.com.au/2024-05-10
 with auth_id=277
X-Original-From: Stephen Horvath <s.horvath@outlook.com.au>
Reply-To: s.horvath@outlook.com.au

Hi, this series of patches adds DDR5 support to decode-dimms.

I'm not too experienced with perl or the JEDEC specs, so there's probably
going to be some questionable choices here, but I'd love to hear
feedback.

The first 4 patches (1, 2, 3, 4) add the essential information to
decode-dimms.

The next 2 patches (5, 6) haven't really been tested on hardware
implementations so I'm happy for them to be dropped if they're not
useful.

I also wrote these a few months ago, but wasn't sure if I'd be free
enough for any revisions at the time.

Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>
---
Stephen Horvath (6):
      decode-dimms: Implement DDR5 checksum parsing
      decode-dimms: Decode DDR5 Manufacturer Data
      decode-dimms: Decode timings and other data for DDR5
      decode-dimms: Decode DDR5 common module information
      decode-dimms: Add basic decoding of type specific information for DDR5
      decode-dimms: Decode DDR5 error log

 eeprom/decode-dimms | 517 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 513 insertions(+), 4 deletions(-)
---
base-commit: cd435c853bc9df0058620a471d4191c7de27a2f9
change-id: 20240625-decode-ddr5-b8aa4545812e

Best regards,
-- 
Stephen Horvath <s.horvath@outlook.com.au>



