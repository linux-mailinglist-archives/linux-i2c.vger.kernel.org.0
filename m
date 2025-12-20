Return-Path: <linux-i2c+bounces-14660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B07CD2A9C
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Dec 2025 09:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 961F73016181
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Dec 2025 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445E2F7445;
	Sat, 20 Dec 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ0aUo0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F64347DD;
	Sat, 20 Dec 2025 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766219902; cv=none; b=p16YkmVsrAV0jPLiuVHn4WqxPoPmeSELvUDve6TAnM41O3DjJ8j8LjWnyXw7DKw+zFr65fGpBcwcXrZ9SMA7hbaSO3uql4h3T5p0dGoi6Ol9Y8lwqa06ErfirjmGMNw3sNP0dA3E7ycH0yCLCNwAvGzgWkeyXdWvoK+7ScFvdac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766219902; c=relaxed/simple;
	bh=OKZiRIdGSbTfIhPz/KMiVtd7BOs4Xa4Ol4+jEoF4l5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQogxygxi8Nm3sZGDFuN28GXRJWCC/yJXPWZCe9wMGa7A2YQpH99jG+44Qo+1ERqYpFBJmVCT7dssv49I8PZZQUOFCLemZNtvAjCrYpp2XKlc224aU/KUG3l5YrmIZ90rxdtTjNwOeWxpVa/bTUonFIoS7scmqoNYh6OjVge4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ0aUo0Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89D0C4CEF5;
	Sat, 20 Dec 2025 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766219901;
	bh=OKZiRIdGSbTfIhPz/KMiVtd7BOs4Xa4Ol4+jEoF4l5c=;
	h=Date:From:To:Cc:Subject:From;
	b=UJ0aUo0YMLbflp456rsDx+vdGpH6eufD7DJHvfnZELQEECiK/VXvfkI5UxfRkFXu3
	 hvfeh9ImUbHQ2ikOIk1FmbjU6pJzGAMA7CDk6a6cVb7gZXf9h3dqODxeNPojdXkQgJ
	 EPrLnaXTVm/zsRKj5R1qpQUJzsM0pEFbmhP4Wkrcjobku/RLsfklojjUJEdoZt1riV
	 NoNbebXT6bHRflTPEm3DBGCOhL8Jbt3UPLk9kElzJKoM386/kJbVYxW2KGCZMUVMnE
	 O2v8LFUPsq8z/LaUTGe2xPLm1j8f6mc9WCDKc7McVVOzDns+mMlYBXf2OBuaSLxJ+w
	 I4JT+daXrSiDg==
Date: Sat, 20 Dec 2025 09:38:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for 6.19-rc2
Message-ID: <gt6mkoewiqqsxe47nmkmdgpcbifrrqwn3wn6nozpv53e6es2rc@uob4fbb3vyox>
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

as agreed here's the pull request from the commits remaining from
the last merge window.

Thank you and I wish you a great weekend.

Andi

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.19-rc2

for you to fetch changes up to 880977fdc7f67923d1904ee23ca75fa1e375ea46:

  dt-bindings: i2c: qcom-cci: Document SM8750 compatible (2025-12-17 00:28:52 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.19-rc2

- bcm, pxa, rcar: fix void-pointer-to-enum-cast warning
- new support for Intel Nova Lake-S
- new support for Mobileye
- new support for Qualcomm SM8750

----------------------------------------------------------------
Benoît Monin (1):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers

Hangxiang Ma (1):
      dt-bindings: i2c: qcom-cci: Document SM8750 compatible

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Nova Lake-S

Krzysztof Kozlowski (3):
      i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
      i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
      i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning

 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml        | 2 ++
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 7 +++++++
 Documentation/i2c/busses/i2c-i801.rst                          | 1 +
 drivers/i2c/busses/Kconfig                                     | 1 +
 drivers/i2c/busses/i2c-bcm-iproc.c                             | 3 +--
 drivers/i2c/busses/i2c-i801.c                                  | 3 +++
 drivers/i2c/busses/i2c-pxa.c                                   | 2 +-
 drivers/i2c/busses/i2c-rcar.c                                  | 2 +-
 8 files changed, 17 insertions(+), 4 deletions(-)

