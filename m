Return-Path: <linux-i2c+bounces-2376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1A87E055
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Mar 2024 22:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362F3281D9C
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Mar 2024 21:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B400208B4;
	Sun, 17 Mar 2024 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1fNVmtkO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SylwjTSs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7EE20B0E;
	Sun, 17 Mar 2024 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710710850; cv=none; b=oGvhg9gnzni1/RWcCOGfRvnZ65+lL/ZNOJYi+hvM0uDKUpPna6YAk6WgjIn8lWfZ2MBx/3FbOzx5vbwqyEzlR/CcnXrApiAfcI9f+2I5+pEBQ8P03vWmeEofRaiqJII/gg5T7Fpp2LaJwHP3vdErvNBKrEyYM3ijmu6VhA2L7tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710710850; c=relaxed/simple;
	bh=r1A5i7RbsqOv08lAHnRoEkHu4xFVjK0PL6GJ6TPUP4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezoyAcm4esyaqlUMM8uEtkeGlXvspVsECHXWU8dF6CCkYrOgt5sc2LQlHs+y1xAJuwDcFX4n7V6WBG+71TVcynUM6Oi1Qw14MaABYiWd8sqlnQYF5jS9JeyQ4l5M7q6ldAetx/vhVZvHfifQZpmXbDuWYoeKFYD/uBNMwDS8bPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1fNVmtkO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SylwjTSs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sun, 17 Mar 2024 22:27:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710710841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3srrq43UiauzyNmV0S4k/pQ0+n44cbViGcHlmEyhFec=;
	b=1fNVmtkODQCyt/lLuw8N+h0zm9GlRxTrwdCdxVYqb0U61pUF+sSwuEpypKO9P5v6SxPboT
	F/UM87VVCz4tp1gxAH+xHT9mxvwzX/bw1BiLnk1tX+fl6FQ8UGe1hH3YJaR2vZIEBAuj2h
	ej6eAmtwLZr31q/Aq7Nz7rJDI5EdONmSNSdVXhZnQDbvXa4r+5/TIh5A1F0yo+aNX1+7xe
	HWqK59rrfupWFrxBGbVA3mUhrks5kaGIEpEAdTqoAzofwv5NbVQFuS4tejEyTTKkDn3Nqq
	ilemSoMXJBAPOsCMWEj3CN+0sPjuWnkv+5PbUet5upLzYFVXbN+JORTcIyi8QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710710841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3srrq43UiauzyNmV0S4k/pQ0+n44cbViGcHlmEyhFec=;
	b=SylwjTSsGZaa+c23HhGRyB4sQnKHpj5LUrtHGIBxrFtqZWnK0ugZz2u31upBqdXswNlDOi
	Z9nDIgvsqHsLJmCg==
From: Nam Cao <namcao@linutronix.de>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
 linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
 dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240317222718.3e03edb1@namcao>
In-Reply-To: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Cc: HID folks

On 14/Mar/2024 Eva Kurchatova wrote:
> If an I2C-HID controller level-triggered IRQ line is routed directly as
> a PLIC IRQ, and we spam input early enough in kernel boot process
> (Somewhere between initializing NET, ALSA subsystems and before
> i2c-hid driver init), then there is a chance of kernel locking up
> completely and not going any further.
> 
> There are no kernel messages printed with all the IRQ, task hang
> debugging enabled - other than (sometimes) it reports sched RT
> throttling after a few seconds. Basic timer interrupt handling is
> intact - fbdev tty cursor is still blinking.
> 
> It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> notifies the (single) boot system hart, kernel claims the IRQ and
> immediately completes it by writing to CLAIM/COMPLETE register.
> No access to the I2C controller (OpenCores) or I2C-HID registers
> is made, so the HID report is never consumed and IRQ line stays
> raised forever. The kernel endlessly claims & completes IRQs
> without doing any work with the device. It doesn't always end up this
> way; sometimes boot process completes and there are no signs of
> interrupt storm or stuck IRQ processing afterwards.

It seems I2C HID's interrupt handler (i2c_hid_irq) returns immediately if
I2C_HID_READ_PENDING is set. This flag is supposed to be cleared in
i2c_hid_xfer(), but since the (threaded) interrupt handler runs at higher
priority, the flag is never cleared. So we have a lock-up: interrupt
handler won't do anything unless the flag is cleared, but the clearing of
this flag is done in a lower priority task which never gets scheduled while
the interrupt handler is active.

There is RT throttling to prevent RT tasks from locking up the system like
this. I don't know much about scheduling stuffs, so I am not really sure
why RT throttling does not work. I think because RT throttling triggers
when RT tasks take too much CPU time, but in this case hard interrupt
handlers take lots of CPU time too (~50% according to my measurement), so
RT throttling doesn't trigger often enough (in this case, it triggers once
and never again). Again, I don't know much about scheduler so I may be
talking nonsense here.

The flag I2C_HID_READ_PENDING seems to be used to make sure that only 1
I2C operation can happen at a time. But this seems pointless, because I2C
subsystem already takes care of this. So I think we can just remove it.

Can you give the below patch a try?

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2735cd585af0..799ad0ef9c4a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -64,7 +64,6 @@
 /* flags */
 #define I2C_HID_STARTED		0
 #define I2C_HID_RESET_PENDING	1
-#define I2C_HID_READ_PENDING	2
 
 #define I2C_HID_PWR_ON		0x00
 #define I2C_HID_PWR_SLEEP	0x01
@@ -190,15 +189,10 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 		msgs[n].len = recv_len;
 		msgs[n].buf = recv_buf;
 		n++;
-
-		set_bit(I2C_HID_READ_PENDING, &ihid->flags);
 	}
 
 	ret = i2c_transfer(client->adapter, msgs, n);
 
-	if (recv_len)
-		clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
-
 	if (ret != n)
 		return ret < 0 ? ret : -EIO;
 
@@ -566,9 +560,6 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
 {
 	struct i2c_hid *ihid = dev_id;
 
-	if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
-		return IRQ_HANDLED;
-
 	i2c_hid_get_input(ihid);
 
 	return IRQ_HANDLED;

