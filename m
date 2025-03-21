Return-Path: <linux-i2c+bounces-9967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FCA6B5FF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 09:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71363AB278
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 08:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB5F1EE008;
	Fri, 21 Mar 2025 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImfLWmO/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E461E98ED;
	Fri, 21 Mar 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742545253; cv=none; b=J0DJeGYEgKmaOYGFUZM2Vag3SQAyJemOCw0RjvrDIHwY4BOja3lwXbX5GYiJCrTRoJrX24iQ/17Yarczq4wwe2+eGLQjPzkCGIjix8AyXc/Dyx77u2yBgvh6b4SmopuNZupM0ELIsFaVZ1rgBfm5iW3dqkc8OSIqS1y5eeN7Vfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742545253; c=relaxed/simple;
	bh=EV9CBzjf600nW+rcD5Nj7CVDfSsbZ9nJjWhRPymGwSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ja50ZHyvycO+8L32GLW1HQXIIntRxHpX2/0VHPGP4OBRFp3JJElC3MWVXBfaJ4s6ZG6sHOvt1zwWNbExsyqBUQ69h24rczRJFn7HkXecGsh8Vfp17eq1ojcnerQI+byWILXIuwTGJx8koCaqrT9cvzMEh9cra3JonVUV3BL/548=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImfLWmO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EA2C4CEE3;
	Fri, 21 Mar 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742545252;
	bh=EV9CBzjf600nW+rcD5Nj7CVDfSsbZ9nJjWhRPymGwSo=;
	h=Date:From:To:Cc:Subject:From;
	b=ImfLWmO/9Xxg543MM7ZzDe4lXCPXj+0YBv29x/4tYwW7b7G7tKUki/TnZaeeGDk8u
	 UhVyttA8keQtM8LljgaMeOwl6dKXfRaqkjBXfNVdYwsID9oAmeyrtuUmAN9Hl3Ynj8
	 /o+ZrVjGBPwsWnkXUl2CqrMAZq2HdpUuwiLu7RbeVzilnD9oaLYkyv4GmV4UPzasI6
	 e5wmRHLnoy3OGwti45sWOfLexZUsxS7UBcOtHxPsP36Z1R5eay4NQq3D6uaJxnDTsJ
	 5BqxU8ak0NLbxM7a3fS1E3omhZyvG0rlXtiKieRxCm2VI7q/sAnhExdjmhMCVpXB8M
	 GHjuw0u5I6kBw==
Date: Fri, 21 Mar 2025 09:20:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: i2c-host-fixes for v6.14-rc8
Message-ID: <pe5su4wqtac6oo7deqkuzihrm6oorqsonhksb2lshujaocyimk@ed3kwddo7ci6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

No new fixes arrived last week, but I fished out this one from
a couple of years ago. Thanks to Shyam for acking it!

See you later with the pull request for the merge window.

Thanks,
Andi

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.14-rc8

for you to fetch changes up to 6ea39cc388899a121b5b19b6968692e9460ee4a3:

  i2c: amd-mp2: drop free_irq() of devm_request_irq() allocated irq (2025-03-20 14:37:47 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.14-rc8

amd-mp2: fix double free of irq.

----------------------------------------------------------------
Yang Yingliang (1):
      i2c: amd-mp2: drop free_irq() of devm_request_irq() allocated irq

 drivers/i2c/busses/i2c-amd-mp2-pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

