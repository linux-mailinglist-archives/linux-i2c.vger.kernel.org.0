Return-Path: <linux-i2c+bounces-8752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CD9FD3EC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5481612D8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22355156228;
	Fri, 27 Dec 2024 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpVRjtfd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64542070;
	Fri, 27 Dec 2024 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300323; cv=none; b=LqUI354k1zO8yBJJbp6elYhF6RKpkdMLl8RlzACMvGmnG9+l+9TBEfYKHnNv/wGAy6fRmY0H4ii2iD6biXDGMpCApdhkEjea6nHeq7hhNm54bb4yOzVmWTFkm07NADtyFpE1W0+d7OipAJC8onh/Mzu+HWK58b3Wf54RQrDNANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300323; c=relaxed/simple;
	bh=fqbrXUwfmmLIbfM1e4J1yERNbOeLl3nbuUpDg1Xtnao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ML8PeU/Op8p65PDBxT7TEQqv6kO7u80YSRwnm5vmkCLsOGGyePUOB2ac0L6nsvQps4cS3yYcFSpR3YUU5FQ17MIFBsvatpFu1vd51caeJBwJySbNr+YnE5Zt6k2xBORiqiSiMrxvUk7rv3SEYe+fa+f5HSwYySreN5UwvPa1ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpVRjtfd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2162c0f6a39so95374865ad.0;
        Fri, 27 Dec 2024 03:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300322; x=1735905122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlg03DZTsB5AnF6RewrTsiQB+PKI3aBa6geYg8eN72A=;
        b=fpVRjtfd/hyoO0B2Kpli6LLRbNnj9sVlzLCNWREAoUPy8PWOP6Syvcv1I8AWYYrTQC
         8PxyaXMLDXW+Sk1zOqwblNwwC7Bp13VOPabm54IFk9OrW0Kq9gIwo7LRxbvuO2sjnvtZ
         HcD7CUqdy1qp6Q5rcPoVGf5dS/lh/JE7LkEyv9U3SHzZR+fmFpq+b573cmedKod6LNWM
         S+Iamsn/nPXWId3iY0zNfTCZboykQ0cBEDOFhTEdH6Ql6J+i4muRci2KGvwLv2ji2AmV
         Zj93YFyEk5AE5GcEBnCNE8hmXPavcheDoKOWCCfLCEWqRZoJJ1PwpzBQl2/dnBeF69aM
         pULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300322; x=1735905122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wlg03DZTsB5AnF6RewrTsiQB+PKI3aBa6geYg8eN72A=;
        b=Yz03qidK73iLd4gwqBlSFQ776Af3PXa90tMp7JBGWamtXrE3Fx1vR4EXwtIo/1PqTi
         q94pgU6BVlqQFxQhVMlPYU7J2IGVlU/jYzhk2C3P3rgCbRlgKPj87wM63+dvtINbZucb
         Huji9xFG7HEKj5vguEavmVIpGlKkZOUGAXN0VefD5o5Dl7QrjrhQKx3zpnLq4+yR8LR4
         vO3KlPMZT7jV2ldtpYW77z2bRlhIwJWpuXSJIgV3Xkx1waczZxUa7tGLI7zKAu2qRkxE
         rujZvt87ITvsiZST4Q8nL8a8Sz9uh2ML4W6FenpeeBwHmrrAEWS7O8+SVSQuH0QRX/bz
         BDRg==
X-Forwarded-Encrypted: i=1; AJvYcCVQU8Js2s5vkCuImCXyX4cRrurcPy9OZQ/qSd2USiQKxzwvBGbb/jrdoS+kQPK7quYg+F8jcwAK281ik+q5@vger.kernel.org, AJvYcCWRbKutsJiK9P7R+RX68zJPhgmU1wYZCQ2ZNK7aV2dxI7gixfTGi7KvK8atNC9Xjn/0ySAETLeB0W0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywczchr9UPRr9PmI4pPsTTSz3xyRxTuSWJnzYD74FCJWbaoAC6x
	k1WGsLReFQaR4nN3T52EFw8lbnKXvLM9JSBK1hxqJBO2ZSzhBUXP
X-Gm-Gg: ASbGncs41VHB0R/KSmDvRFwzXmc9Z7vZAkvI0Xq+n46of7u2JT0cFHLjE20G3e1jVUS
	SSgKKt5f+FcBSXH5X07KSVLrtO2heV/6efeDrV9gvH22h4W01ZHtpSxgN2cvHdiP7fL5pIsl0zo
	z7YavS1fkRQKYDYFUknnaR74LaqFLF8C5akUINzJGpdh/Cb32/zmRLo1CBafJtKqzwCct1mjVWE
	LB2roJtDu6fJDmN4BXpmFQ5fSX8lnBLq2fhAmzyVnSB3mZFgI+w4RWjYWpJw+FPsKWBuHGZ+v/P
	q7vFQIk=
X-Google-Smtp-Source: AGHT+IELteOjzrXLpS7S1u4X/4/qU9OiPIICLfl2uwxtma+mC9Rys/bT+wDbjalJujz3B8RQCFq+lw==
X-Received: by 2002:a05:6a20:2583:b0:1e1:aef4:9cd9 with SMTP id adf61e73a8af0-1e5e1fa2be3mr45733193637.23.1735300321626;
        Fri, 27 Dec 2024 03:52:01 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:01 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/8] i2c: riic: driver cleanup and improvements
Date: Fri, 27 Dec 2024 11:51:46 +0000
Message-ID: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify and modernize the RIIC I2C driver with the following changes:

1. Refactor error handling in `riic_i2c_probe()` and `riic_init_hw()` by
   replacing `dev_err()` with `dev_err_probe()` and using a local `dev`
   pointer.
2. Use `BIT()` and `GENMASK()` macros for consistent and clear bit
   handling.
3. Manage reset lines with `devm_reset_control_get_exclusive()` to
   simplify resource handling.
4. Mark `riic_irqs` as `const` and simplify clock tick calculations with
   predefined macros.
5. Add `riic_bus_barrier()` to check bus availability and improve
   reliability.

Lad Prabhakar (8):
  i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
  i2c: riic: Use local `dev` pointer in `dev_err_probe()`
  i2c: riic: Use BIT macro consistently
  i2c: riic: Use GENMASK() macro for bitmask definitions
  i2c: riic: Make use of devres helper to request deasserted reset line
  i2c: riic: Mark riic_irqs array as const
  i2c: riic: Use predefined macro and simplify clock tick calculation
  i2c: riic: Add `riic_bus_barrier()` to check bus availability

 drivers/i2c/busses/i2c-riic.c | 123 ++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 58 deletions(-)

-- 
2.43.0


