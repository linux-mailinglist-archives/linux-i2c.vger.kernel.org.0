Return-Path: <linux-i2c+bounces-13061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC9B8CB79
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 17:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91FE21BC2A40
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 15:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F6920FAA4;
	Sat, 20 Sep 2025 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="iWqtrSbk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80812AEF5
	for <linux-i2c@vger.kernel.org>; Sat, 20 Sep 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382285; cv=none; b=jpFH/JdnkuBL8UU3jeLS3Dh1Xg0ba92497I85KZ+W5eK6qDcQXE/G/tCRDoxvn7zTvId8hGDZL/tVvBxPjUgGc4ZEcjRhBxtFUSktwDaBfM+SBF8Dhtmm9Cg26/II4G74qK5z/c9Ww84Ea9HMEkIRvPipA9H/5Rt2udMj9OwwxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382285; c=relaxed/simple;
	bh=hSg3c2ZghTZizAbYqX13nbRSTVnHbltJh3jiavgkq80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OZkaXdnxd+5HADi5UVu22jPQKT7ckEYgDaJSqlytl0EZ+in//kvK9DTESz9w9IT0yzuSsnDYYd0PsmfMB/gsc4iK0zzZxlB0ml1yF3YbJ1UtrZQsN9z9cIm5tBvGQDzSA0R8872P4DmgvAALPDtOrSx6ku/h3AksWyUn0g395z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=iWqtrSbk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=iWqtrSbkxBi/JLRtP+iV4RQ3k1a/tesuTQDMgAOYaJrV4z4Alue0kRIlCXG9+d0c7mYoZjRyokZC22Hggfu2+b6LpUspt8EsOPd0y42DuKze8KnMR2qsqUXog8/vBIDorYRSGpMhhkzrylMEnZFo8XMajFm4DXKrdI8Gvhw40NCJpOAClQuewkde8tKwYx+5CPhtWn7VLhRtgiGa2pcmcfDUwpPA/HPCQNkI0yX4WgetJ6Kekc3bFTlHJePlollL72koMZLnIU3bi1RNKs6xTQm77+g+4MTi19Y8AgflsVqnDRUe5byyQ7OWccIXe0Aa+TVbQyjfEvY3fDB14PL3eQ==; s=purelymail1; d=purelymail.com; v=1; bh=hSg3c2ZghTZizAbYqX13nbRSTVnHbltJh3jiavgkq80=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:09 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] i2c: Add support for MT6878 I2C controllers
Date: Sat, 20 Sep 2025 17:31:02 +0200
Message-Id: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfIzmgC/x3MQQ5AMBBA0avIrE1SDVWuIhZa05qFkhaRiLtrL
 N/i/wcSRaYEffFApIsTbyGjKguwyxQ8Ic/ZIIVsRCcFrofSrUaWFk3k4M8dVS3mWlvjlDKQwz2
 S4/ufDuP7fnRUnrZkAAAA
X-Change-ID: 20250920-mt6878-i2c-bringup-640d48cbf66b
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=759;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=hSg3c2ZghTZizAbYqX13nbRSTVnHbltJh3jiavgkq80=;
 b=ZmmuUVQP60SFRzeKx5oSct4QOEoDeLeYJIF9FKk4TQgtZPtWpkWxvMFN31WjyU6lbr31VyM1G
 uWVbihpePQ5BA6j/daH/+17Zn4BAr2LzmQymhbXdmJlbCFgEvwgwFTG
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Hi all,

This patchest adds support for the i2c units found in the MediaTek 
MT6878 SoC. These units use the new v3 register offset scheme 
(differing only in OFFSET_SLAVE_ADDR).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C
      i2c: mediatek: add support for MT6878 SoC

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                       | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250920-mt6878-i2c-bringup-640d48cbf66b

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


