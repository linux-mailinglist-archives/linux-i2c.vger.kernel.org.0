Return-Path: <linux-i2c+bounces-13700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1EBF51F7
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500033AAF7F
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D99227AC28;
	Tue, 21 Oct 2025 07:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UVSOD8EJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D72765DF
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033449; cv=none; b=bpiRtGEUNZ/txC82PTEzCUSXoTW9ttq8E42dpvq7kYUHNXCtxpMkCnmZXTsmDMHvvtsjJrRxf/WGn1EyPlxwg4aBDfPtQSMTwi/iVEQVvsgw1SKnxWuig2dx11QKubOx1BPqE2e/E/y2PWsYR7JLdV1/ca1TxFyeC+gho8ai9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033449; c=relaxed/simple;
	bh=vR8Sg8f9DgI5ghBZTFKtP/Zk/FTSk2p996vJs7NdI4k=;
	h=From:To:Cc:Subject:Date:Message-Id; b=SyTq0mdkc6rvk0vH7OJmZCMoMnn+Cnl5Ylt9SC6UVzmtX4uRC3X7dcBWxX7awSz8NeaY7wGV3PNWBlQskKkB9hEF39wKrXPfW5avyjuWpkZ/7MbmkCIkGn27O48IIcdBAkeL0GQ/i4/bBU9vwg83YMHlvzKZOPSUAUdq9mPFXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UVSOD8EJ; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso3767173a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761033447; x=1761638247; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxKmkMUC7SLSSXycoYWmPuuYk4wsq74U2h9gzpD2Te0=;
        b=UVSOD8EJJH5KzRHaKD6Az4bIebt9VBR7gVTTPLpMQDiWdPZxVaLMo1C2P/BOsxpCrQ
         ogbFCkmDCMT+OKdD672su6bEcRDArfKisumt2Jl935R0MIRFF5JeJQOHp6FGB6znH9z1
         isWGBg8zo5qw+yKHpxWlJtDFZ6iwFq5K84JJ61AKY1Ehk5I8V9igx73aM0Ft+Tp8/fvn
         /58E4C8jLbM494jXw4wbGC3u9KxniISf7jhXYnt1ee/4uO9CSu6C1k48tqcea5lhw1fW
         K1ZNmAdzkxGfZTjWVhBeR8i7nDj/6E0yqAKEdjkgRTknyJ9kbwKfMuTq26OJzkZucu+/
         vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033447; x=1761638247;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxKmkMUC7SLSSXycoYWmPuuYk4wsq74U2h9gzpD2Te0=;
        b=M0OO+f0AC0QL0GoLa0xb5TkNPPnbxAAFcEBo/aZ+lD/+rvXT76kNWBZN0AZqTcCdTR
         FvO42kaHls/CMoptH3rtg4jRovvLrdWx6cAgBvuWpE4wQv+uDj9OhffNp6a9iluO3RZK
         A53nfSIttdyyb2WrBD+7n0pJIuFliFz9t+A2PECE+01G01E4yMuOBbeXeoDvFsorEQD0
         9+iHwua2lk0mex06Xeb1/EOi4iUHEhkYNBCTp3Lc0y7qhYl3WKTOT+6iPdFt/do/lOV3
         x4Us8oxHU2w1GBWd94C+9GQ16WkivxwDtmKIizy14qzQJf6hy0i4gDAP7XwRGgj0tzn8
         yfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoQV0KfKt7/5uyhBggZ/o/YJGn/rSKAogJgacnM+hebze5drbZVidQmrj3B6qDPUrrkoDvQjSYnvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySeGymmGGip2VGj3L9S9bKVqrZVu3Qb4NM8XEmsuTo7FCN7wlE
	aDHd4Dfa4PZf9Me4cmtkGiBIf2NjoUzxuf+idqcCVgQpoTLUcRpI/uuEIT4HpyUpFC0=
X-Gm-Gg: ASbGnctJjFNCLchS3sQ7RiI/10WDSQ9mRjNodlgqX5We2oEyzrRxQnprLrytHJSUJoP
	MhOQqNI78xdaHakB7D+mPgCl+qAtDOMAxZK2eKz85+d4H8guckDfZb7+dMXEG5G6DfMCmWxgOcg
	SXSEnB/1j0k9cKNtbVCqVXUodMhy07E2tlj5OqelHt/aMyYQGc3TcdkkgXSu+QAC0MEJPsxl5kG
	IfRKjI0Mf9K6x6A5eZgM+aSllHg7VZkxO7M1pTwwZOH11op1XgoMi2km65c4p19eqUnKVJwGaxs
	o7w9pr3hXHipFyfI51WOxnOhdPdHC+rsIFojq1LFkLRLy/adCNLRBihsnqYyTk2H9xAyUA5Mek8
	K65Cs9N3oocAKYgczCdzxEQGrvP+Sfqihg4/tU+G8WnFUKnuqRcVEJw/HvAB+HMETg8+hiOnfRd
	78/aIRR+ml2wuej3kB5AKxY8Q0iN6QGq4h
X-Google-Smtp-Source: AGHT+IE1Zrj+jGbHeZnz4HX2VMGus/Y7tQa5nFM5l7VqdiC9z6XL6budsIJb6zyS3HuL2F7Tfksndg==
X-Received: by 2002:a17:902:e544:b0:26b:5346:5857 with SMTP id d9443c01a7336-290c9cd4b82mr189585185ad.24.1761033446959;
        Tue, 21 Oct 2025 00:57:26 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d7e41sm102083085ad.57.2025.10.21.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:57:26 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] i2c: designware: Fix SMBUS Master interrupts storms
Date: Tue, 21 Oct 2025 15:57:13 +0800
Message-Id: <20251021075714.3712-1-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Hi all,

We hit interrupt storms on the SMBus master extend-clock timeout IRQ
and SMBUS Slave Clock Extend Timeout IRQ because broken firmware left
IC_SMBUS=1 while the driver IRQ handler never services SMBus events.

Since we cannot disable IC_SMBUS directly, mask its interrupts to
prevent floods and make the driver more robust.

Thanks,
Jinhui

---
v1: https://lore.kernel.org/all/20251011073057.2959-1-guojinhui.liam@bytedance.com/
v2: https://lore.kernel.org/all/20251021072431.3427-1-guojinhui.liam@bytedance.com/

Changelog in v1 -> v2 (suggested by Mika and Andy Shevchenko)
 - Drop the stand-alone i2c_dw_disable_smbus_intr() wrapper and mask
   the SMBus interrupt directly in i2c_dw_init_master() after the
   adapter is disabled. [Tested]
 - Align the DW_IC_SMBUS_INTR_MASK macro definition to three TABs so
   that it matches the surrounding macro indentation style.
Changelog in v2 -> v3
 - Add Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Jinhui Guo (1):
  i2c: designware: Disable SMBus interrupts to prevent storms from
    mis-configured firmware

 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.20.1


