Return-Path: <linux-i2c+bounces-9504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C721A3D045
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 05:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19DD717B16D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 04:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E751DF97F;
	Thu, 20 Feb 2025 04:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdsEwXdQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC151DE2BB;
	Thu, 20 Feb 2025 04:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740024048; cv=none; b=fS53tJ3JY/1B1bemcGSxCOaGz6I/r7sHPcQuI04tbJc4nEEmTpFMYsWxbmkYUe+T8gZWHey5wLiVcnWd97HgUHwpuH8PYJBdt2LYCqMGPXJJoYgQxzFYR9rgmE42F8YazvPAR9Ea+sv++VQ+Jjo76JGivIMV/tyiFA8uKhc9zpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740024048; c=relaxed/simple;
	bh=A/6P2XqeE6tljbT/rPLFtPSv4+Wq5BWY8DSolr7vxII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=je7daWceV088OYvQMyPCWgWOprNKjtRdm/vY2Tj9ngyi24RfBCr67QTP36hcuVShJkukh/mLkgyZXoIAhchU3tBGlzzLHmpjuRYS0mu+mVuf60l/3a5dm21Vykb7EcuhCDJY/AvDyQAw0+fXtfF/AtNTVF27TXYKT6Ue43d7z8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdsEwXdQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220e83d65e5so7703645ad.1;
        Wed, 19 Feb 2025 20:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024046; x=1740628846; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOqJDp/c7tt8tcSaOZCRxBhXVm7kyLOq7AnJmppBzVE=;
        b=bdsEwXdQhP/Ng6xhVTpB6rUyW8JdqxlTO7s9suphMxHsLpiSnJaiWbTTEitHw2qq7L
         ki3Z1dE1p6R3JwPCPmeNilRWZ0Df+AhqgcpOUlWsYI4tpTM0zIVUC2ksbq3K1T4FDkD6
         LnEe3kVAPYmLECCmwqzFkPcv+0ZsBI+2xANPOngxszwfp3aJljYRfAvdU63igCHBi/+E
         oB8lD3kUZNf0N/5NpmmXc5JcvyOp0SoQfLsHbXeccMDXwHjA2kKNm4pzsp7NmS4GV+6p
         Izh3PfK7036SOLkEtzblzJ04p//PwbigTnX1cgVDEHLvm6kEVgH+XQiyuo5fYzIK1LSB
         WK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024046; x=1740628846;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOqJDp/c7tt8tcSaOZCRxBhXVm7kyLOq7AnJmppBzVE=;
        b=pPZeywfBKmbaoxQE2cLR1zwt9w9woZjbawGQLGg+VnSCUQss9kgEhJ7WEis65LM5mM
         r1fLJmbx/j3aXcQTzTKIhwITOf4yURLmjCrxvtOKI4XuLBFIa6uJt8DU2UzLqXkVuHtp
         +A1e2S2LKwhOh19ZLNofwz8/QwJrKspbBjCdBvRgOIr+FIwa1Oo3M2/afAHfe7xna6jj
         avuZYRh83WVupeVcEIErhLGNsNbv5KLSuwzk2NnVN0m6RqBB8u/us1wKaq8Tz/W6L8hX
         4a5jA1OHWYR8eftozoXpgPdwxEtKG82zwm2Pr2z6Okbw2tY9vUygJaIWvIDbL6bg6Zvw
         8uiw==
X-Forwarded-Encrypted: i=1; AJvYcCXUf7V1pezpeQfAOzWLQcJvCCu2nQSRJ2B5d8POa6wlbZZ+bBG+05MUmsAz8vSrI9njQQ4emzZCf0P1O4r+@vger.kernel.org, AJvYcCXa9VitgFE8js2fGKBGaBKkAR46rdMYFl9QGrxMrLLZQgSaeJ7M5VMLEf3qVoK3nCPF1dWUrjmp90o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PxjzKGBYwEeD/Plds9pRbr0xww540ypUHRihICLnTiIEL8j/
	Yj9/5m4QxiMhnUbvXRsBhFkXkWS0JHtYmavrqZVdB+3sdPmiOdY=
X-Gm-Gg: ASbGnctqRyD2HzHo/KkYsFeiRVPa/otnu0vrh+Tc/2arJhyDMp0pkOWJcTqgaeqLWFH
	zh/0EYq3krg035VCVlW/xSmyM6mpGSAVpazTr2Z23XertT0RH10GOT/AjVEd6mBtsycNne7FWY9
	ugl+nbkweRQN4/sRj8lsilieTwZEYz8noUSlKPY58+EbOVuNloY8ONf7SW/9tkTELWlDkVglVGJ
	j593B1w2ZUMiNsipwQYZFtPpeKGM18PWSfzr06CipLELhk42smjssGC7JgyDWwsgFx9KmMrqJqI
	I8AYKpWR7L8Seicp7Ea2SVhq2G8skYhuj8Z23KO8W/6JPKVlMTRXKtQ5azuVE2CJVOyL8JASNbG
	DUHAcIi4=
X-Google-Smtp-Source: AGHT+IFHAfZP0ic9c/8xm17hs9w1i84l+PJiMVHVQzhMCVFIOJRDUpgi7DVDTHZUsnoRu80e/bjeMw==
X-Received: by 2002:a05:6a20:a11f:b0:1ee:ce0a:5333 with SMTP id adf61e73a8af0-1eed4eb475fmr11726760637.23.1740024046107;
        Wed, 19 Feb 2025 20:00:46 -0800 (PST)
Received: from localhost (2001-b400-e386-8f50-c5f8-9184-9e47-206d.emome-ip6.hinet.net. [2001:b400:e386:8f50:c5f8:9184:9e47:206d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568961sm12707052b3a.38.2025.02.19.20.00.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 20:00:45 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before devm_request_irq
Date: Thu, 20 Feb 2025 12:00:29 +0800
Message-Id: <20250220040029.27596-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250220040029.27596-1-kfting@nuvoton.com>
References: <20250220040029.27596-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

The customer reports that there is a soft lockup issue related to
the i2c driver. After checking, the i2c module was doing a tx transfer
and the bmc machine reboots in the middle of the i2c transaction, the i2c
module keeps the status without being reset.

Due to such an i2c module status, the i2c irq handler keeps getting
triggered since the i2c irq handler is registered in the kernel booting
process after the bmc machine is doing a warm rebooting.
The continuous triggering is stopped by the soft lockup watchdog timer.

Disable the interrupt enable bit in the i2c module before calling
devm_request_irq to fix this issue since the i2c relative status bit
is read-only.

Here is the soft lockup log.
[   28.176395] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [swapper/0:1]
[   28.183351] Modules linked in:
[   28.186407] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.120-yocto-s-dirty-bbebc78 #1
[   28.201174] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.208128] pc : __do_softirq+0xb0/0x368
[   28.212055] lr : __do_softirq+0x70/0x368
[   28.215972] sp : ffffff8035ebca00
[   28.219278] x29: ffffff8035ebca00 x28: 0000000000000002 x27: ffffff80071a3780
[   28.226412] x26: ffffffc008bdc000 x25: ffffffc008bcc640 x24: ffffffc008be50c0
[   28.233546] x23: ffffffc00800200c x22: 0000000000000000 x21: 000000000000001b
[   28.240679] x20: 0000000000000000 x19: ffffff80001c3200 x18: ffffffffffffffff
[   28.247812] x17: ffffffc02d2e0000 x16: ffffff8035eb8b40 x15: 00001e8480000000
[   28.254945] x14: 02c3647e37dbfcb6 x13: 02c364f2ab14200c x12: 0000000002c364f2
[   28.262078] x11: 00000000fa83b2da x10: 000000000000b67e x9 : ffffffc008010250
[   28.269211] x8 : 000000009d983d00 x7 : 7fffffffffffffff x6 : 0000036d74732434
[   28.276344] x5 : 00ffffffffffffff x4 : 0000000000000015 x3 : 0000000000000198
[   28.283476] x2 : ffffffc02d2e0000 x1 : 00000000000000e0 x0 : ffffffc008bdcb40
[   28.290611] Call trace:
[   28.293052]  __do_softirq+0xb0/0x368
[   28.296625]  __irq_exit_rcu+0xe0/0x100
[   28.300374]  irq_exit+0x14/0x20
[   28.303513]  handle_domain_irq+0x68/0x90
[   28.307440]  gic_handle_irq+0x78/0xb0
[   28.311098]  call_on_irq_stack+0x20/0x38
[   28.315019]  do_interrupt_handler+0x54/0x5c
[   28.319199]  el1_interrupt+0x2c/0x4c
[   28.322777]  el1h_64_irq_handler+0x14/0x20
[   28.326872]  el1h_64_irq+0x74/0x78
[   28.330269]  __setup_irq+0x454/0x780
[   28.333841]  request_threaded_irq+0xd0/0x1b4
[   28.338107]  devm_request_threaded_irq+0x84/0x100
[   28.342809]  npcm_i2c_probe_bus+0x188/0x3d0
[   28.346990]  platform_probe+0x6c/0xc4
[   28.350653]  really_probe+0xcc/0x45c
[   28.354227]  __driver_probe_device+0x8c/0x160
[   28.358578]  driver_probe_device+0x44/0xe0
[   28.362670]  __driver_attach+0x124/0x1d0
[   28.366589]  bus_for_each_dev+0x7c/0xe0
[   28.370426]  driver_attach+0x28/0x30
[   28.373997]  bus_add_driver+0x124/0x240
[   28.377830]  driver_register+0x7c/0x124
[   28.381662]  __platform_driver_register+0x2c/0x34
[   28.386362]  npcm_i2c_init+0x3c/0x5c
[   28.389937]  do_one_initcall+0x74/0x230
[   28.393768]  kernel_init_freeable+0x24c/0x2b4
[   28.398126]  kernel_init+0x28/0x130
[   28.401614]  ret_from_fork+0x10/0x20
[   28.405189] Kernel panic - not syncing: softlockup: hung tasks
[   28.411011] SMP: stopping secondary CPUs
[   28.414933] Kernel Offset: disabled
[   28.418412] CPU features: 0x00000000,00000802
[   28.427644] Rebooting in 20 seconds..

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3ca08b8ef8af..de713b5747fe 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2554,6 +2554,13 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	/*
+	 * Disable the interrupt to avoid the interrupt handler being triggered
+	 * incorrectly by the asynchronous interrupt status since the machine
+	 * might do a warm reset during the last smbus/i2c transfer session.
+	 */
+	npcm_i2c_int_enable(bus, false);
+
 	ret = devm_request_irq(bus->dev, irq, npcm_i2c_bus_irq, 0,
 			       dev_name(bus->dev), bus);
 	if (ret)
-- 
2.34.1


