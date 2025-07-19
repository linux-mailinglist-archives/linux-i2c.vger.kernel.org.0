Return-Path: <linux-i2c+bounces-11969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE8B0B00C
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0439E3A3316
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5810D28724D;
	Sat, 19 Jul 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDekjXeO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F643597E;
	Sat, 19 Jul 2025 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929792; cv=none; b=kJOEqUS52vLvqnnP+gBmlgXR6kMvq92ZPLVOaYCMLPH0LdegzEolVokikQsWYJJ6YkI/s7suSVSN0pOUUIpW9H2qr5MjNEYdmZYQmAOkNfPSXsUfyzKO1SOff9uECkmnuZgCRGhSiFitNKqXKTXU4HIxDklnYP+SuEJdqzkZfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929792; c=relaxed/simple;
	bh=6TNdtZeyWkzTrloo29wdZ8ieF+tJQpA8yUdfiNFIbAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4avbjeQUAOTmQ2kYEGVTPmAqwv/MN3McGOyzJJUx2xqYGamXdu/20HuzmkYLyXFtyfOLwjVoNDKb6jDaNKuarqrUdF/DZA8r5m2mok91Bq+qEHVw+ma42l5bwm2IeO+zmVu0zOHBau7gJQ+ROyDavooudOOHZsIQm6LAq/Hn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDekjXeO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-456108bf94bso20211755e9.0;
        Sat, 19 Jul 2025 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929789; x=1753534589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tRD2NjwF/ZY6OMgZJ+7iJIY+EsBKkYIsMF0P2zsbU4=;
        b=NDekjXeO+i5b7cpjfYwxgIRQUnvybdO6nGCNwjb4FjqXCzY+ZfGnMmYwhFtrMAzhXi
         lsdkazum8o3KIfFqL9/66MsauJ9L2Vc++s9Hi4ELTH23NEBWCIMlM4kWGQCGVBiGv7pe
         L50T+6pG4NSANDBp/vAVAAMogAvA4CnG1iPkLOYT+hM0W4+BKsA+wShbBHmEly5xlTKj
         f7algzDr0TPapWlLXnttVRPDpCUMAo5NREU6QvC2v7ijykkgS/IwpAS0msPOK+EAHj2C
         qyzjztO4l4jPLHTc5/WEIsVZDkv8FVMfnJpJmrkOEHi3xqbZfbcpr8C3Ony+iacg5VYR
         FAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929789; x=1753534589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tRD2NjwF/ZY6OMgZJ+7iJIY+EsBKkYIsMF0P2zsbU4=;
        b=D7wGrpmWwmqmKB+5lGBX+Qn9iLH1UgO7wkmM0G1AfjJPFdd+bSeiGxgIhyY+xQc5m4
         d8u4Pi+iYSJS78TADNv8rsJf0mWkrl100P0f3M/a4V46DlLPFO7fQ01n4rx5hHXmP/l7
         jtaagRmmbv2+LCfy+SwwR20QHJK0l4mEQaaJAz1Md0UbcTXh1UXhYQF8CUlqeSrqtenR
         vj72aKZaT6Bg7DRMbsCCvXyi5PhGQiHwkTRkR/zTzvxsfV/4d/f7nxoKqclVQYmYkLvw
         3zia3FHHFRRtvbdIw9lqBoalfg7D3ELk5bApfVk0ANGM02Yz17YtyZxce0XTLGEVb+pZ
         atRg==
X-Forwarded-Encrypted: i=1; AJvYcCUU7yJLwjNBnv0TYboJ008hSeZ+82AA1aZ2NMkHpGBmES57IkSqObRXSbAjlLebS/vltsR/RGqOMBJ/IUGg@vger.kernel.org, AJvYcCUy9mXcBMl+cZuN1QQ3Et517HTVNVFJZG9dpNLksItxNkSqnsdWiL4um91t8RNONen700O5Hbp9gra2@vger.kernel.org, AJvYcCVONiH8BN/m/Jl90qUcLa0U/OWMquc22fJ5mv0+y6WMVG+g/FRJrNJoextg707DgKdd8I93fTBljDCb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lDNPWA0/fHRe3qdkePUDRPA8lRvTGdX3J6Yy9NZdcTMjO/qx
	3pGXgNAPsjcHf67fyVYTO4Cs9cUsIS6GvS8aXTgggCrpxLXuIIYKn26P
X-Gm-Gg: ASbGnctTDTshRH1++VP/ik/6HJphJXn85yvhaergZrtrp+bNwCKrPNqKO9300uJcFqD
	ZVwh0dFU+nSMP0pD+BCcVGUxQmG+RtVLgFRTHeE0CtUJrH/EoQ4pOAieEWRF/R3JBpo6SZD0rFZ
	pr+EVlsnOCR49Mc9OetCUwquQ8GBjL1B1H1vi6P3TchfBB6nkkJlglngphqbsV/EfFZV3TTjwD7
	h7JQIGWHC4UVGDr58izybmGdutmPcsnZonT6siS6nI/QvgU/Qr9YK/zdkhh7N8gsjBghHMafHWP
	XG+PbP1m7uOlkw0RItCpy+RuMW46Bp6LaXPN3Hlz6xmdN1DYZiAkgg35QMCWI9f+lTIsb27AoBj
	cKjiffj/hmjQS98sl/SxXIClA+AkcyikOJCdoB3bxPd0A4TIKYBpCWh8NYmwZjfdHSvxbXcnJ27
	Ap
X-Google-Smtp-Source: AGHT+IHVyPkrAti3KBxeHDF8a+lPaonZM2AISJ3Gso95EOaofsGKgLel2/059sZfO6yPadPZS8bCNQ==
X-Received: by 2002:a05:600c:3b88:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-4562e355c9bmr144021685e9.14.1752929788390;
        Sat, 19 Jul 2025 05:56:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/5] i2c: mt7621: improve support for Airoha
Date: Sat, 19 Jul 2025 14:56:10 +0200
Message-ID: <20250719125617.8886-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 73 +++++++++++++------
 2 files changed, 64 insertions(+), 23 deletions(-)

-- 
2.50.0


