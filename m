Return-Path: <linux-i2c+bounces-13695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18DBF4EFF
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B83518C0B6C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE1527B357;
	Tue, 21 Oct 2025 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="L8LwHCG6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7349E1369B4
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031502; cv=none; b=kjvye8Bv1yHwldFURQU2wvYflZo0fu99SN+mRYVzmsGjOYUnwlfbUO254uBIrlAOBjoyg6Maj71pBLoFMYE+HSEN8q680OvMsEwvCLoYEZYavlKaMJwqP7SC+Cqkjd5Z/K6ERzPs/Aq81ODcEt+TzApTbswVUmchUtCgkOaFuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031502; c=relaxed/simple;
	bh=T6QU9qfWd8XxEqHaPu2yKIrWr4Eupu0qKSG3FOUJNvE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=e7LGv1WSzzId+bHPzgN9ESdORzIirj9WlnnZVXogJYdlyJrRnDOWw1kI41yTyuJwrPcGNO8M/yYdyOpMwR3g9eV8BHesyQBG/H44oZ88/OEkZAt2G+eXYDzc27iJeqHTs6aFKmg4mpzD6Qb48zLsdNsH5uq4TaVI/NXhzjtNN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=L8LwHCG6; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-27ee41e074dso62056875ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761031499; x=1761636299; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcjwoMNg8xapeElJXeStXRuTW96curqBa1UPKQuiCy4=;
        b=L8LwHCG6fe1oPmzjD0ed5340+QGbl6rlw8Ac19uSjE2MDNBlDUjncfIcmt62UwSKWA
         XStq1Cq4WyQzAxi08T8KvJfvNh7BVyMfy+ZiNP6Y/s4jRWPb/RZ8pQcVqKfsY8T8zu/r
         Ae3Qhr5suz7N7XXmQMH4etEalpOqoBuAQ15atNDbX0JJ/F65SzQq2z/f8gB5tnpeYXxM
         ZolzS9WtpX6FzHhnt13TmardSP72LA4oPvqH80mQtu6p67++tq58hbJkT/iHMOxg/XZI
         fAD/VgByvSfyYUle0m8s8VJRSz+k5uNsans5jA0+1UyWWyw0N0YOgWUyElci2u8p+Idn
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761031499; x=1761636299;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcjwoMNg8xapeElJXeStXRuTW96curqBa1UPKQuiCy4=;
        b=JGVKi4U6zIQupqd8EHNgCjz9QH1Q4ojswqDSSvOeGPfTDG3oLheb4/WeeF8ApejEmE
         kk7FgyAcN2Lf+ZoQdBuuXCorzH0jOduf8PLjwHp0If8GCM8voW0MEajIviHW5+oMP3Qu
         /4PR3mkLtPhyyH5OYHcjSXctujLwruBX4DHjyzgw2asm7CVdXPndjUplHvDxL4ti9bME
         Dzlj9PZffMo6lR51MEI3mpFKXyDZ0zdTopn8ytKzDZxJbi0JF2w7BZyOXEoPUO4M4GD/
         uGlVeaX72ttegNJ/m9yxt17LQ/AQ56syxmo9vTX/qoMK2fciunNVj3sjs5D4dR6KrUNN
         ZKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYsH2sOZEO5oKMzEuv8q/gQVyrZiM/9hoZ5vq/1Sai9Lk+ZwxOAIYon/Ivjr+Unrwy/nUsELfflk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDe8SdYdcZQkzR3ExdPJ5WA+EvEWTV/jr1R8ytdGQIYQ7mJqaP
	xHc7suNQ+QOzQzDaEP8KbAHozB+VxxzKpU8tVIoosB76pRuhkaIBAm90zKfMl2JSZLA=
X-Gm-Gg: ASbGncuJNvz6lW2SfGXKlnDfEmMuBbbXGyZaZoXDhkSUdI3HnFtbCVPSr8fKA89THBR
	dC5zM+KAAIlrfJQ3tzo4SxJ+nfK2+IPQZe9tNzia7xoqumqmv/JK5T+VlLfcOmtf2kvNfgdk+ex
	+tBYEE6GQIGgglB9xcLqszxRBIv5CtBsYpnMu5smO6YSnl13xEckF+mbzfELP2imP9pycygzRKC
	FA5PDcHiysiiWoNnq1JQhBKmGOoFFUMFpE6bAsgS2lNJVqPuRk1ldyAQkMgd57x+ysxgm29gX4V
	R0bWMAAnZmdXqMdLz+Vdy/55HM4fnqZUbIyKagA7LyjDueS+s1Fgr0U78NuwaVA/MlCjheHjLd8
	M+saSebrjWvJOFYWaSkD8GoE+ruJDNHfh6eBgUExc9ioDDZvTiDzQd9pduDuTe74kBlIiQ2QcWB
	PkdALWmK19EBtoQ2A2cegktTuDRWCbaYjBNA==
X-Google-Smtp-Source: AGHT+IFzWgrQVZzVX7nEOgExqLtglKwMQ47s3V8pusPPGP8s1DH1p6CnhaKMiVW+v7YKyJQGnw64Hg==
X-Received: by 2002:a17:902:f548:b0:276:76e1:2e84 with SMTP id d9443c01a7336-290c9c8941dmr195197375ad.3.1761031498734;
        Tue, 21 Oct 2025 00:24:58 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([203.208.189.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fdbe35sm100207415ad.46.2025.10.21.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:24:58 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] i2c: designware: Fix SMBUS Master interrupts storms
Date: Tue, 21 Oct 2025 15:24:30 +0800
Message-Id: <20251021072431.3427-1-guojinhui.liam@bytedance.com>
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

Changelog in v1 -> v2 (suggested by Mika and Andy Shevchenko)
 - Drop the stand-alone i2c_dw_disable_smbus_intr() wrapper and mask
   the SMBus interrupt directly in i2c_dw_init_master() after the
   adapter is disabled. [Tested]
 - Align the DW_IC_SMBUS_INTR_MASK macro definition to three TABs so
   that it matches the surrounding macro indentation style.

Jinhui Guo (1):
  i2c: designware: Disable SMBus interrupts to prevent storms from
    mis-configured firmware

 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.20.1


