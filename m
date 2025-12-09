Return-Path: <linux-i2c+bounces-14478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69481CAFD4A
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 12:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D408E30CE562
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 11:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B702F5A36;
	Tue,  9 Dec 2025 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKj0dKki"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC72BE031;
	Tue,  9 Dec 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765281148; cv=none; b=EFqjNL7UBmS2J2xvaVlCd1TmR2HupBXEf+lw1Ll5f5HKx/5HIEJiOpi1hsXyAiEvo0QAm3MuHq0B3ONRQequ5dAIHLutZ7o2B/MXk7vkRD4a7favxyoentsEBQZ5YiXne8NDxsbcJmTSL42h6RXAy/4uNunUsHhkWk5HoCgznoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765281148; c=relaxed/simple;
	bh=EJawLYIUcIahbVkElytK8FDdvjhIHdZVQtck/oE0RtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIIJtM2+NnSJz3f+iwXPaeuoFeokkJYcO/3G7gtjB6dGEFZmWPF6PMxbZDYer9ei3QM2D6Jaw5EW7Ohp7+pF8L30FpLCStxVA+BLX7cWeBg7hy9s1u8wQkT8M9j4VrJcTqbDv3AKD2+pF+DR8qMg73w3YyqhZ83F7eMtVPB+UJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKj0dKki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A934AC4CEF5;
	Tue,  9 Dec 2025 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765281147;
	bh=EJawLYIUcIahbVkElytK8FDdvjhIHdZVQtck/oE0RtI=;
	h=Date:From:To:Cc:Subject:From;
	b=XKj0dKkimnCIhjurwy0ncdF/8K5d1d3c5EelpWeGTgyPeu327bmLBxeNPIn+OkZwk
	 kYCmKXyylLydfOyco1EwA5zegEwyESPp2wE5JrRWW1qsZQo6NJYKaSi6oD0dXI/TX9
	 ZW+3dHMhyHPZtCoFYWyL/k2RkY/XP6GbWDff/GRyIBupnV+ny3/rOGWsivBTrdHBFz
	 ADexQQSMFRjSBO36hFkjn8paY9O2wQ8CM1IjrQqbF5cdfpUFTx9Kjsh8Zn/IVkarL4
	 Z+Q4o47HndGmXjel+h+ftjAf/5r9g4lRE7PZOOLnjA4Mhw9YI2v86Trh2AFllJNVoS
	 CzOv3yPAfmZlQ==
Date: Tue, 9 Dec 2025 12:52:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: i2c-host for v6.19, part 2
Message-ID: <tm7m6za7jhdmq3rqdmutir65yw2mo4qty6qonsfyjgsqxdsl3w@dvom6ilx4vhc>
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

here is the second part of the pull request for this merge
window.

There are not many patches, and they have been in my branches for
almost a week now.

Thank you,
Andi

The following changes since commit d202341d9b0c5b5965787061ba0d10daafb9d6c5:

  i2c: qcom-cci: Add msm8953 compatible (2025-12-08 20:21:31 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.19-pt2

for you to fetch changes up to 172368d013901e5d9352de7a2debddc66d1e1a20:

  dt-bindings: i2c: qcom-cci: Document SM8750 compatible (2025-12-09 12:31:37 +0100)

----------------------------------------------------------------
i2c-host for v6.19, part 2

- general cleanups in designware
- bcm, pxa, rcar: fix void-pointer-to-enum-cast warning
- designware: use dedicated xfer function for AMD NAVI

New device support:
- Intel Nova Lake-S (i801)
- Mobileye
- Qualcomm SM8750

----------------------------------------------------------------
Benoît Monin (4):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Add dedicated algorithm for AMD NAVI

Hangxiang Ma (1):
      dt-bindings: i2c: qcom-cci: Document SM8750 compatible

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Nova Lake-S

Krzysztof Kozlowski (3):
      i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
      i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
      i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning

 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml        |  2 ++
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml |  7 +++++++
 Documentation/i2c/busses/i2c-i801.rst                          |  1 +
 drivers/i2c/busses/Kconfig                                     |  1 +
 drivers/i2c/busses/i2c-bcm-iproc.c                             |  3 +--
 drivers/i2c/busses/i2c-designware-master.c                     | 27 +++++++++++++++------------
 drivers/i2c/busses/i2c-designware-platdrv.c                    |  4 ++--
 drivers/i2c/busses/i2c-i801.c                                  |  3 +++
 drivers/i2c/busses/i2c-pxa.c                                   |  2 +-
 drivers/i2c/busses/i2c-rcar.c                                  |  2 +-
 10 files changed, 34 insertions(+), 18 deletions(-)

