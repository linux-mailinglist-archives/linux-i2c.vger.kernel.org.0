Return-Path: <linux-i2c+bounces-10998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F8AB9832
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 10:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF1D1BA78FF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1D122E3F1;
	Fri, 16 May 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXxmZ7lJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2B282E1;
	Fri, 16 May 2025 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385960; cv=none; b=fr8pXloyI2r9omHhlTKUU33ptGEt0N7yjixkcw/QWz54gYbNBBH67fKG99UVcRmx3jsZOBwQNd7tL5Pe+R7rPn4uW225c89Wml5TWb99YF1ghk/+GGZGEp/C8tVCpC5EUopTjHfiYVwKL8lFXxnfWg88lZ4IVAoLDj2bgjicYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385960; c=relaxed/simple;
	bh=Y34VStSLFYSd7A3fQu+01kwEHYE3em+enlgbonrvEB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7i+iB3MIZMCtGQ1U3LDnphgs65v7xkqndd8BamMcM82ktYQziP6EbJo65xD0/Hx3vx/EwuABrNCmhmqlcJBhAwAlMqZmwnYkLDDShOfECCetwZ3nlXNZg0pSqSFAFGuG1LwhnvCEtNvvN+YkAREC876fk0yI9UK+WVdrrC8oO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXxmZ7lJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8804BC4CEE4;
	Fri, 16 May 2025 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747385959;
	bh=Y34VStSLFYSd7A3fQu+01kwEHYE3em+enlgbonrvEB4=;
	h=Date:From:To:Cc:Subject:From;
	b=eXxmZ7lJ3qTadvjLUIpdnGUBCz+fdldh45l/T/wOlxpsPtHfcqq6e0631aXQ216Hy
	 QPg69h2CdU2RAerH5eDUS11xN9GWZeAcrPpXYk/pDr6g9cZjqxHX+US7zoTUVK1HVa
	 oesF3GKXIGDSoDqfFEbfyXymCxTNvM6wo8pM4c4+qvDqsyFqYsRTLYGHJ6Tu8/C2wO
	 HEJ+LdVlWR62EuxVodilEn2e1iwdKKG2I1Mid54RuPfvkkS4JRtWf0eJWQz+j6igDJ
	 d4+HK4cmXbfmFe2IafFOzmmlT7917fqeEFA/yRi1lgi6zqPWLoPCdMOhfA3qIUj3I2
	 myIWHv8Y4yO6g==
Date: Fri, 16 May 2025 10:59:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.15-rc7
Message-ID: <v2tjgz5opkfbnlwsl4ptiauqq3bcahgxjfwx6edk6c6lhyhzm2@nlcpfl6lse6b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

I could have delivered this pull request personally, printed on a
roll of paper and handed over with a big bow :-)

From sunny Nice, here's this week's pull request. Now, time for a
dip in the water.

Andi

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.15-rc7

for you to fetch changes up to 1cfe51ef07ca3286581d612debfb0430eeccbb65:

  i2c: designware: Fix an error handling path in i2c_dw_pci_probe() (2025-05-14 17:28:24 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.15-rc7

- designware: cleanup properly on probe failure

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: designware: Fix an error handling path in i2c_dw_pci_probe()

 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

