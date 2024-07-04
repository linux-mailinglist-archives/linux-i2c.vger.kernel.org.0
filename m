Return-Path: <linux-i2c+bounces-4646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07457927EFA
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 00:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EA64B21E64
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 22:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0531428F2;
	Thu,  4 Jul 2024 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmbTpfzz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBE405F8
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720131437; cv=none; b=t9udSoSkAFcH/keGLDRsk3/Z7KsL/RSW/Hf/FWOWLAAe97IgksiYvm/Ce0mWXMovicTHySbmX/tIVLnPQMfsXaFjissOpvM7z/vqU0UFUsia66bAn51DyJ8US6W69AOXWZwMG/YOp/FRO5IoTG4+pUJ+4pLZqDmyf2fUkC3kbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720131437; c=relaxed/simple;
	bh=zI+4NZtH+9RkdSC42kl7ihqfT0SZlGVGeTV3TktbRz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXnKb7zJLBDR4QWJjXdLTH1wx7PpehbHBJ7QjkwxJnwk/5CPgdADVIcj9CFBZhcab4klsmS0sF/EoQ73CZaYsZ/QUK8jclR59baBFk6xfDsnYpgZiYznrRgh6iirn6Kybp/9A7JP+qkCT/v5R6V4wTpuOu6JO2bcIC9sVIlyqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmbTpfzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227B5C3277B;
	Thu,  4 Jul 2024 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720131436;
	bh=zI+4NZtH+9RkdSC42kl7ihqfT0SZlGVGeTV3TktbRz8=;
	h=From:To:Cc:Subject:Date:From;
	b=OmbTpfzzDgGJM0VkLaNmGt8M60/BmqkDGHwuOPm4mt/hFPnHCm2Od6M4scdLSgVlc
	 jW5u+6ItYCywu36omkfAFnXim0fuJTfYWR2qKABKyxQM53GxLPY+6alHy+RrmTvV9o
	 RciaUY5kU0MenhLc597U2jTNtC54TbShfwCWdJBRoNG3a7FmGdnd9x/N0/110t1/N+
	 cCBrGzbaXbzeIMGTmHlWJ+aL5Ip7oyzmBuzBpe+OGjWkL0vOuNC/C4Vcs02eCXKvei
	 L5jlHPQyOHK1kHUyagX95QJDbSy+OmQX8aFSXm5rmcpTlR5HMjAoWJMh87ikG25FSL
	 f/StTKSFcr06g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	upstream@airoha.com,
	benjamin.larsson@genexis.eu
Subject: [PATCH 0/2] Introduce Airoha EN7581 i2c support
Date: Fri,  5 Jul 2024 00:16:13 +0200
Message-ID: <cover.1720130844.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce i2c support to Airoha EN7581 SoC

Lorenzo Bianconi (2):
  i2c: mt7621: Add Airoha EN7581 i2c support
  i2c: mt7621: make device_reset optional

 drivers/i2c/busses/Kconfig      | 2 +-
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.45.2


