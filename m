Return-Path: <linux-i2c+bounces-240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D63907F01D1
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8169F1F21B2C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1156F1BDC0;
	Sat, 18 Nov 2023 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnP9jCsU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D32AA;
	Sat, 18 Nov 2023 10:05:10 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c87acba73bso1553431fa.1;
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330709; x=1700935509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=UnP9jCsUWC29/s+NC+cz1N6kqRrEKoCIbfW2YrVFq4910JkmHcTTOOBnxSpwHAgKdQ
         UFF6c9yTh81IOFqjWKjbi1YJfVJrITvHyU+KgVmJT7od5Nxv2hbosw/xmuodtju8oT7p
         ktS4hnOaG1UfvcAfjGGv76GY4Ll8SV7Cl82OjoQSgUAB72kmsjwSeJ/R4sa9ncOWMfHs
         4+do9HZwRudipRKWzT+0f1VVQSkzR0NqFlqbornppcB6tKG3g6rLxLvOee2JivucQa0x
         wgUgGip/NvDz6cUB2VCE5cSX2VgfIpYogcS91p9NcgtXSkvwTAblKZoOqmDypMlOJXMa
         bKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330709; x=1700935509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=lldtx2DrQfWRDCE3PRO+QHz3bs8xkItkXOtykQPwnH2RWjFZCCIhcFDnlAlQKMgMAW
         ZpkZjDO/FWS2YAivNewrE3sEsrn3RGKHJFAFC1ohHAxZKevBKp3LxAKRabDYAt/3rrqO
         d4uVDAsJPr4LXgfBGzlEVWlPlq7L5ogew6eswkf6cAmSGpEdAxa+sJVmQs/VHtMm4Tnw
         Sk/xtKa5tlIbZ0UqYLb3FuRFPK3hZXipvNGIaXgF0gEsOwk+HTlfdsENsftp4ceWxirD
         N/HjBrQGIlSP135bAr0HWHMab/Qy22ae8T5bvWsPbMCVwsoOzTPorIGeidkgUKuOwl3E
         taOg==
X-Gm-Message-State: AOJu0Ywl8YGOsZ1YGRQTs0YIRaoVP3TkkYCQRRr/Rdl59zg7vjnaoIVQ
	SSCaIsetJoAg3cy5vcwd+m0ZlvNin2rNng==
X-Google-Smtp-Source: AGHT+IHyeiAuLwBQ6RhMnfmUjm6ZpWN6lhi+Qcl6w/VI4MWj6Kf1RrN8easfjONwVJiPd/NUafO3dQ==
X-Received: by 2002:a2e:9c84:0:b0:2c5:1ea4:4e99 with SMTP id x4-20020a2e9c84000000b002c51ea44e99mr2049253lji.48.1700330708944;
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:54 +0100
Message-ID: <20231118180504.1785-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
 drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
 drivers/i2c/busses/i2c-amd756.c                   |    2 +-
 drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
 drivers/i2c/busses/i2c-elektor.c                  |    2 +-
 drivers/i2c/busses/i2c-gpio.c                     |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
 drivers/i2c/busses/i2c-isch.c                     |    2 +-
 drivers/i2c/busses/i2c-kempld.c                   |    4 ++--
 drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
 drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
 drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
 drivers/i2c/busses/i2c-piix4.c                    |    2 +-
 drivers/i2c/busses/i2c-scmi.c                     |    2 +-
 drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
 drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
 drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
 drivers/i2c/busses/i2c-sis630.c                   |    2 +-
 drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
 drivers/i2c/busses/i2c-via.c                      |    2 +-
 drivers/i2c/busses/i2c-viapro.c                   |    2 +-
 drivers/i2c/busses/scx200_acb.c                   |    2 +-
 drivers/i2c/i2c-stub.c                            |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 drivers/staging/greybus/i2c.c                     |    2 +-
 27 files changed, 29 insertions(+), 29 deletions(-)

