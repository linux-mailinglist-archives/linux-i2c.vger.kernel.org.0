Return-Path: <linux-i2c+bounces-3476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C98C22CC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2024 13:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC1628178E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2024 11:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0624016D326;
	Fri, 10 May 2024 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdkrKKj5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F1168AFC;
	Fri, 10 May 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715339291; cv=none; b=ElDDcE5OPVipbjLK0V4wWLjF4+7SAUbx7MJJtqpCXemqaitQEEts+QUl58vHTIo9/uwpisUJCEb95q5ENpK8wUEdtdalgKXE3St8ZkVkCzQnIhrORmEGUMDRP0aWHa81BTpvaDv0sbaHYo/HqtcI8mhEo/lnOfMXl7FNU92Y6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715339291; c=relaxed/simple;
	bh=nTYzwj9OJhLpPWNwd1rM8BE28Cl7Xim0OJwuJpc4oL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GV2f/Xtpj5F+58fmWQDSpQ3tiI3B/qyd7fuhd98XjyJQmW0G/Q65SW+rTeWgHmDcKR/vqaet/sKBXb5xKx+MaCifhknAivqoBzRSb+LY+SHZInb7Nf3RQU7iEAqZ6x6yan0pvtnydzpznMZy1IDmrqBvFl9Oi4+fTZdwSj52FMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdkrKKj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586C1C113CC;
	Fri, 10 May 2024 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715339291;
	bh=nTYzwj9OJhLpPWNwd1rM8BE28Cl7Xim0OJwuJpc4oL4=;
	h=Date:From:To:Cc:Subject:From;
	b=rdkrKKj5V1plyHEh5n0v/T/6PQHCh7jpc7PQReZcJDFOnRV/0PG5dhIthtVkIPp4x
	 xCQrbViosHrnZWSkjItw2qHT/30DtGRKhrJGjvCGdcx4UnfxHLJS3QsnaH6jwCozEh
	 GiBrkMq/hL2IZ1HfM53/vo8zOBeFmVxI/eAqzVqwVQ7c53STCz2yLG92VAMNR5DFtA
	 laoka9EWxJ4pLRmsUkf6cYtW76bGiSYF0IEvhwxYPqrAmYlW7WXZSooJglp0zQjUGd
	 7Y+epPS6XrhKJNkN8T6bKeLVIdEUgduurJ5Jw40QyhBcHhWi9xdPK9JEfaw7vh3rz9
	 WSsEDfouYLHeQ==
Date: Fri, 10 May 2024 13:08:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

after a few weeks, we received to patches marked as fixes from
Christophe and Sai Pavan.

Thanks,
Andi

The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.8-rc8

for you to fetch changes up to 55750148e5595bb85605e8fbb40b2759c2c4c2d7:

  i2c: synquacer: Fix an error handling path in synquacer_i2c_probe() (2024-05-06 10:58:04 +0200)

----------------------------------------------------------------
This tag includes two fixes. The first one, in the Cadence driver
seen in Qemu, prevents unintentional FIFO clearing at the
beginning of a transaction. The second fix, in the SynQuacer,
ensures proper error handling during clock get, prepare, and
enable operations by using the devm_clk_get_enabled() helper.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()

Sai Pavan Boddu (1):
      i2c: cadence: Avoid fifo clear after start

 drivers/i2c/busses/i2c-cadence.c   |  1 +
 drivers/i2c/busses/i2c-synquacer.c | 20 +++++++-------------
 2 files changed, 8 insertions(+), 13 deletions(-)

