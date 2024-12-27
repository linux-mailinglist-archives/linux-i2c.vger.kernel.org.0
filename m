Return-Path: <linux-i2c+bounces-8773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0D9FD7E5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 22:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0AB7162E28
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 21:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884CD1F76DB;
	Fri, 27 Dec 2024 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS83S4RI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163413C807;
	Fri, 27 Dec 2024 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735336576; cv=none; b=dWrJSB7ttIlMqGromq1rjjMwqKwliNtoMPK0W6QifUEgPnH9MC7kwiNXIRcEz7QS//hwBi++NHNdEuoazxCVa5tZIJVYoo4lIoVirFGCBt0GCDA76Jf41zjopeI/GOB7VjshB7Zzm4ZIPWaDq63kGnL3cML761rNoQW6g9wEeUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735336576; c=relaxed/simple;
	bh=h3D9PpJie6T1xcYoL8qiAJBZbzmIkN1vEcmDur8OXtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iN4TkftUCOUXNT45UBwCNUh7g5FIQT9Ipuo1tEH/b4e2EWADrHJythUaAUJa359+ZYDN6I7NBm+bqFqW0YHLZozNIKSpvtgiTwA/CG+dttur9gMP8uV5saCmYOFGSMHID0AzLXNzutiSDvJ4PzxKrEqUCESE7dzgYG0XWU8tNpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS83S4RI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B0EC4CED0;
	Fri, 27 Dec 2024 21:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735336574;
	bh=h3D9PpJie6T1xcYoL8qiAJBZbzmIkN1vEcmDur8OXtg=;
	h=Date:From:To:Cc:Subject:From;
	b=CS83S4RIFaGdr85vFr161d5eNlDEu49vUUNqTFWdQITojyf5/szHptPqwKnpPNYJ7
	 NknDzfeQkqf8qrQ3edu5ciqfVs+TtP4GgUBbch/9r0cN2tVEjPGT7lJP+xnTGdalUS
	 pbphChvBHTXnT+WXoZrDFPDTuYcB/kbFv2fDUtMVznusUStbIvCbw5lKLE5itVX9UB
	 KneWvwJOJsyQLCWoe8W9LsaB/lX9yxlE5LahedIxAw2KS57pSD8pWJomDRkTwHnwp8
	 zEh7/sjsqCP/nQ7mZJMPiX40K8WgN7H+B5H/EhORF95UAUMIWyS+5+wOy2+kvBi5jR
	 28q0d2F/tvC3Q==
Date: Fri, 27 Dec 2024 22:56:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.13-r5
Message-ID: <fznmpnkmgyh37tcpmjnvccjl5bc5sjpzspfwvyxv5k4hq57zze@ng233ic3mfye>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Sorry for the being late, I'm on the road and have limited
internet access at the moment.

Quoting from your previous email:

On Fri, Dec 27, 2024 at 12:29:36PM +0100, Wolfram Sang wrote:
> > With that said, I wish you a wonderful holiday season and a
> > Merry Christmas to the entire I2C community.
>
> Thank you. I was already in Christmas mode, so I missed this pull
> request. Could you kindly add it to the next one? I am back now and am
> ready to send the next request for rc5.

No worries at all! I kind of expected it and had already planned
to include the previous pull request in this one.

I hope you had a great Christmas!

Attached is the pull request for rc5. I have also included two
patches from Conor for the Microchip driver. These have been
waiting for way too long, and I decided to include them since I
don't have anything against them.

If you'd still like to discuss those patches, we can either
remove them now or revert them later. Personally, I'd rather
move forward with them.

Lastly, I think this will be the final pull request of 2024 and,
since I have the privilege of being the maintainer of this
community, I want to take this chance to send my best wishes to
everyone here for an amazing end to 2024 and a great start to
2025.

Thanks,
Andi

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.13-rc5

for you to fetch changes up to 49e1f0fd0d4cb03a16b8526c4e683e1958f71490:

  i2c: microchip-core: fix "ghost" detections (2024-12-26 01:54:47 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.13-rc5

- IMX: fixed stop condition in single master mode and added
  compatible string for errata adherence.
- Microchip: Added support for proper repeated sends and fixed
  unnecessary NAKs on empty messages, which caused false bus
  detection.

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx: add imx7d compatible string for applying erratum ERR007805

Conor Dooley (2):
      i2c: microchip-core: actually use repeated sends
      i2c: microchip-core: fix "ghost" detections

Stefan Eichenberger (1):
      i2c: imx: fix missing stop condition in single-master mode

 drivers/i2c/busses/i2c-imx.c               |   9 ++++-----
 drivers/i2c/busses/i2c-microchip-corei2c.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 2 files changed, 98 insertions(+), 33 deletions(-)

