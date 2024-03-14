Return-Path: <linux-i2c+bounces-2353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4D87BC95
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 13:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138881F222D8
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3C56F060;
	Thu, 14 Mar 2024 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1sZFC4j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA463A8D8;
	Thu, 14 Mar 2024 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710418633; cv=none; b=V3jx/B7ZPnqDr+E54I92Jjcm64spsn/ZI8A7SBKJNyunXddjN0kBR1ZovYfFmsSr8rln6SuYBia8jC5H25qVv67zgvnrLbq/R94eHlD91cD/D7n5PMD4DX7mv5ONA9qRmcEnreAnAFUk1OAD8+RKcVmHBl6G9424+AgOGu+JEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710418633; c=relaxed/simple;
	bh=k8Xwhto7bUkWlnleoqSWUnahupt8Mmf+btNjlH95Rr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i29LdTWuk6i5iEMf1jgZhkTGmhNh6cC6pPsHmzQ9KXxU2vcJ9K2jYp+hiPdtYwLNWWT0MZ71yqgdR/IMmuuSMaE9Zq2gLuUidK1PIk6T4zNazR5LJ9d+4KQmJ9nYR0J89C/akqo6ifRUT7+ZGwfPcGMAMq5RxKsKUCJaO/NNNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1sZFC4j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB18C433C7;
	Thu, 14 Mar 2024 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710418632;
	bh=k8Xwhto7bUkWlnleoqSWUnahupt8Mmf+btNjlH95Rr8=;
	h=Date:From:To:Cc:Subject:From;
	b=c1sZFC4jSLufS4gd9J0UMMSAuzracjrU8gU/5szyc77hqLRhqPeWPzyO2fCI0kH1j
	 27bbwBHoidRgw+IxN2kaSLgMzs3ff6c9gEmKVgLTM6JtWrqeqJet6mNKEDfoYIIlby
	 LAMuUbIMJY6WKpF8BVMv2GPTWbj7uQTmHh0TkSw3wdds1MP/dTRK7TGTKHJlzEvu+T
	 nD38LSIx+C8l4d0M6GqpOfIYbKHK8Av1VCz7fKu1FxtFHNlucPOuCMNsnE8Ulw0rIG
	 kc/+42xaFhajnvBm/V6O1dUw1Gd8l+quFaHcV9eliylEO8qsf9/eGXj5VU0WwiNB3j
	 UYcYlFnN8fsmw==
Date: Thu, 14 Mar 2024 13:17:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: [GIT PULL] i2c-host changes for v6.9 - part 2
Message-ID: <xhohtljc7lvguz6inuqgwwzw7b752q3noa3umiqebfraxedco7@3yw2ea2eibjo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Time for a new, last-minute pull request.

Nine patches from Theo target the Nomadik driver to add support
for mobileye,eyeq5-i2c. The DTS files are missing as they need to
follow a different path.

The patches have been in 'next' for almost a week and have
undergone several thorough review rounds, making them quite
mature in my view.

This series is still in i2c/i2c-host, on top of the first pull
request.

Thank you very much for this last-minute window.

Andi

The following changes since commit 06d0cb6c824c7df736e66060b8c63b0100259d3f:

  i2c: sprd: Convert to platform remove callback returning void (2024-03-08 08:02:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.9-part2

for you to fetch changes up to bb271301b80410592cbe0170b9f6d2f677f68171:

  i2c: nomadik: sort includes (2024-03-12 11:50:45 +0100)

----------------------------------------------------------------
Théo adds support for the Mobileye EyeQ5-I2C in the bindings.
This patch is followed by eight commits featuring improvements to
the Nomadik controller, such as simplification of the IRQ logic,
renaming of the private data structure, more efficient use of
FIELD_PREP/GET, GENMASK, etc., better time measurement with
ktime, and more.

Two device trees have been added, but those need to be applied
elsewhere.

----------------------------------------------------------------
Théo Lebrun (9):
      dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
      i2c: nomadik: rename private struct pointers from dev to priv
      i2c: nomadik: simplify IRQ masking logic
      i2c: nomadik: use bitops helpers
      i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
      i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
      i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
      i2c: nomadik: support Mobileye EyeQ5 I2C controller
      i2c: nomadik: sort includes

 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml |  49 ++++++++--
 drivers/i2c/busses/i2c-nomadik.c                          | 740 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------
 2 files changed, 475 insertions(+), 314 deletions(-)

