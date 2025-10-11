Return-Path: <linux-i2c+bounces-13448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B282BCF121
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 09:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9FD40392F
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 07:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9360122259B;
	Sat, 11 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EXXBkzLi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1720B21E
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760167880; cv=none; b=A42EtT9jHgAO++uR0UWSRdBEJ0wHsX6SK3UuvH0dQKC9SJ7glpnV4lUkRXYodkmkV850Alhl4lriYzlUEno97t+N4127m1LvXfCzsUjZVLze91rAGv5yPpTrTj9shae50my1KVi/S2KtuTndu0tUc4x0rCLk4nsP9Hbn/Didr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760167880; c=relaxed/simple;
	bh=kwAxQUlN802lmBDor2RBzQNdUjw7pj1/rC6fhdOuhLw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=WVzeRLdt7+Hq+b1GCvjUJqVAqOH/ybYiWz9+53xJvK2Ur4mjZxsuDwJRg1YoJn07EyMDmwjlmFMf+aWRSL0JSocT6mvuZ1NH5gvI/ANk1JUBGNuYsnSvxlnrcshYbSOosrd/6harbd8NGnc+autGUxaUPXeprFk06ubq1tV+QFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EXXBkzLi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so2930965a91.0
        for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760167877; x=1760772677; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdMBJd+0NdYJNozjHx6sefiMrrVAOso8TPvp+4QY8d8=;
        b=EXXBkzLiItCn/8H4/aF5XReRgsH98jIxoNJvDeSrw/gmZIGfkAn92wsKGGjGRbP8dv
         24U56IQ8OensnyDJQV8lFU6znzlrSOV7EFcV64VfiYYUxQhj0nOJIY7hXE+ReJAoNWMA
         v8eMhTsZycisKdJMtOmjQ3B45D4DjSPi/xWbH8VC7zg+loxe6KTzIzNcP08iKW47NNWo
         0PhSPeq/BPlXaOUBlER63jmhE37KpxBzvAvFktoesYwt/rcUVWcXuQYRlJsZKhAquEox
         2mVcHBvXEmiE3dMVKuHM5yq1lkYJELc334/sNdI1V4qD/RAoXxtifasJk9KNEGcHly2C
         sTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760167877; x=1760772677;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdMBJd+0NdYJNozjHx6sefiMrrVAOso8TPvp+4QY8d8=;
        b=FYti8GZzjZA75OiGp+gRvyqrdG5HrC2nzHkC9XbSLrqslO96L0Xe7wePpO9+wogyDz
         6GmeTNT302S3Jd76lgp1wbo2hIOjJDEdKWk2CZlJNi2bBtIU792C7kGINToYilSlbvAh
         4TpOf7QjN9huaoKOkTIUzUCNiII2d9yt2aaaXJnj8PwqSGFMd/lwl01IEdKLNgBPB4DR
         melwA43+dXEGDifcbreLy8a4yarWzv2mLXMbstUB0gd6OhoSXZaecMbGIYUTa1OUGwGm
         cnq3QzheMw3D/HzvN1togCEvDMUJ8gjcV7U433fn/2uvrtF8lhV96AV4bgKWkDNdAvS7
         k/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUoUok7/RzjJOoh2pGQkzzQiuvXvZCvwpFtPX/OfPTey86KQAZ7zePiyLvtwsMoIBHlAYvton7dgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygljWdCQHd4q7haBT1CcJvWBz3GVZFBMFzWIqkYRqpdbneiBvA
	tUiWExiV+uOae2Fys/m4UhfQJU15HH8fh9bZaGTYuHHHdaj4hlLPGjplAAYXkUa0p7Y=
X-Gm-Gg: ASbGnctcvf3nxUJnSvpHqW5z3umM5kgofO0VhfkG+X3m5DQ2cMAacFTZ0k7smMxZOb5
	DisLeRUs3jtmtTEOXCHxguWO+w0KlAaFzCxWAplTC7B/2LCKB3CGaJHyUTGpHBqkqACw0otuuS3
	x5uz2ocmVza6qUPvhJ9k/v1KDLv7k097XRL6KbNDmr8Utal5jrSACw+Qcz5ZJA8s/d7QcUXmiv+
	Bqy0zQXC3/NpW2Sy4FQ/L/1GycANxw+6H6m8L6u33jFMqnySR+mTcVy4ogY8VJMFEfBbAMmvcob
	JiD0FtO6s5Lrpi+m3pH/VoG/Sz/4tGkcYMpwGhW26uTttBYurmSevm2DdoAUOCZMldAhZcdAMpR
	Jk3a4Zjnrs9Xvtk8nX1icANedKWdLWxQwU1es/o55nPmhD6hk4k0htJv735Kfl3kXXJvEJyWFPO
	gao7HSV3c=
X-Google-Smtp-Source: AGHT+IHloA5eyjZBPMsfpezlHSFF1i9QnIBTBalmJfNg5htGoGlyWbYAhy8txTo6KnppNskqzm7pww==
X-Received: by 2002:a17:902:f641:b0:27e:edd9:576e with SMTP id d9443c01a7336-290273ef199mr173973045ad.30.1760167877504;
        Sat, 11 Oct 2025 00:31:17 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm77020515ad.49.2025.10.11.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 00:31:16 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] i2c: designware: Fix SMBUS Master interrupts storms 
Date: Sat, 11 Oct 2025 15:30:56 +0800
Message-Id: <20251011073057.2959-1-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Hi all,

We hit interrupt storms on the SMBus master extend-clock timeout IRQ
because broken firmware left IC_SMBUS=1 while the driver IRQ handler
never services SMBus events.

Since we cannot disable IC_SMBUS directly, mask its interrupts to
prevent floods and make the driver more robust.

Thanks,
Jinhui

---
Jinhui Guo (1):
  i2c: designware: Disable SMBus interrupts to prevent storms from
    mis-configured firmware

 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

-- 
2.20.1


