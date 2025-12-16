Return-Path: <linux-i2c+bounces-14599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389BCC4C2A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA463044BB6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EC533C1AA;
	Tue, 16 Dec 2025 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b="xQrFLy0l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aJPD8cNz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1677324703;
	Tue, 16 Dec 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907913; cv=none; b=tlkoMJzDrhmou7atPsRB3v2ejZGk2aT/euAodI3+bN2U1qJ6X5YdqIlGQUAwLRuKjBxiQIEeEvSpSLJFOLjU2WAynp3fvnxjmHKvVc8qpwK0wSNPDndhvpYNTypJR4dWyMavEpnIMCRi7ff7/n/j+qT670dzxkYqosMumpJwRTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907913; c=relaxed/simple;
	bh=FTZm5H2pp7/YddDCMhn75MotIM4tMbejx2v0J55fwTk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=MOViIXr8d3bxZKi56rsbZdP7p/owetrpnFWV/ryZ/rarKaa5ggAB6X1Xenx0Z3Je1j1For3poejQN4cmRexObquIw1Skd+jyLqEB5KrVH3Hj+XXV7xX20elCdiI18+dZsEVXLpp6z+ekSr2y61tRIfzGWdz9ri+EZyFx6Ca9FSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com; spf=pass smtp.mailfrom=sent.com; dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b=xQrFLy0l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aJPD8cNz; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sent.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 0DFED1D000E5;
	Tue, 16 Dec 2025 12:58:31 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-03.internal (MEProxy); Tue, 16 Dec 2025 12:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1765907910; x=1765994310; bh=Uo
	W6XIts9qg19Db5JXv+AP96XMApapnpsKKmhGNVpco=; b=xQrFLy0lcPhT00/sCX
	5MdEYEZMl9nbaPBUm9ta5vDi59rfEDxKzi+eFF+eXg24kJ6MpdYvkoIRoXyIVXie
	EdLYdY3+0GjSId/V25S+QSJXikKjuPrpYIHSageyfvuUOp+ZbCnnJ7xiGmeaNiLK
	6x+FBmzAKP/3llNM9+FdVK/CbIAr8uYlJg6x5T+acyQt9LaBmA/7p8R6R5E7NgET
	INwY9tF41wWwbxNareY/I2wFCHwydLjP1zd0ShgupdgH4ra4VGHNsD33NBhmwo1A
	z0kwgnaHViyGfO9dr+rSiaGTGpLzAaueZ619i38XZu0H6NdgKWgHP71cJUqBzOs9
	4Jsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765907910; x=1765994310; bh=UoW6XIts9qg19Db5JXv+AP96XMAp
	apnpsKKmhGNVpco=; b=aJPD8cNzbdWGHv5cuqaT6KN3m55LtuAfDrrLumIcFt1w
	r+4UThTHkvar82jxBqi0FXc7l6PakIunzJvtY4iiSxg0s86IsInzEA3iC6pduvBX
	+2iRzt7iLTOHz4HomOGrrENbDb7yYfrRuAh1XNC4LhcdKUfRxu1w/beZiyPieKaf
	fuhbH4dMZYM/gXqRQrpFFi5MuZ8KW9g1zX5s1StF0mUHSMqbTei7lT/hMSYfJklP
	GYS09Sd/Hqr1FBESz4SyE6e5RVvnf/DkD0vCPNJTClDj3av5IyyowRoAyFsrQQpN
	NkTEb7+FvfrP3uHYOVhpkntuHZQK/9hiwBkgHTSP2w==
X-ME-Sender: <xms:xp1BaQa9Z1hB8HJTQtixKOkB1u6YgJy0k9nktJvIL2uNyd432V1Bew>
    <xme:xp1BaWOzFSk63d7_xv3h-WGJhdj0aJNIFKoz32Up9nzJCownhOqcLdzFwbC0KFxa-
    HuOknR_Mv_6zaoa3mS7z6zCcbqa_6bN33pOFtaYDRiWXL_QMuTo_iE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegtdefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpegtohhrrhgvtghtmhhoshhtuceotghmlhhishhtshesshgvnhhtrdgt
    ohhmqeenucggtffrrghtthgvrhhnpeeltedttdeljeejhfetffffvdeghfefgedulefhje
    ekveegfeettdelfedtiedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegtmhhlihhsthhssehsvghnthdrtghomhdpnhgspghrtghpthhtoh
    ephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohepughmrggvnhhgihhnvgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:xp1BaYEX9fFn_sXIV3VR-fisLN3tCcZ0DLJyKRyeghll1nRDtsV6OQ>
    <xmx:xp1BaapXUqXvnvdd0ZO_tzn1qQum8V6DDFZmVOoXOmBEFLPB4AjDmg>
    <xmx:xp1BaZbe_wFzlUrtn_uFvrvRBi5hBE-wK6GJbV34n2X0x2WWB-fUVQ>
    <xmx:xp1BabWoZJG8wYkd459FWgXb7Dn4TmEA6YduF6gEyi8kLjIIiYEc_g>
    <xmx:xp1BafO8lKG7UF141lq8-oNqsANmj6qZv0goWqvqxbfE3gUk5gCmZ3FE>
Feedback-ID: i87314915:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0B8DEB6006F; Tue, 16 Dec 2025 12:58:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 16 Dec 2025 12:57:10 -0500
From: correctmost <cmlists@sent.com>
To: dmaengine@vger.kernel.org
Cc: regressions@lists.linux.dev, vkoul@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org
Message-Id: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
Subject: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work when idma64 is
 present in initramfs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The following commit causes my Lenovo IdeaPad touchpad not to work when kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:

#regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc

"idma64: Don't try to serve interrupts when device is powered off"

Here are the related logs:

---

irq 27: nobody cared (try booting with the "irqpoll" option)
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.60-1-lts #1 9b11292f14ae477e878a6bb6a5b5efc27ccf021d
Hardware name: LENOVO 83FW/LNVNB161216, BIOS PFCN14WW 09/20/2024
Call Trace:
 <IRQ>
 dump_stack_lvl+0x5d/0x80
 __report_bad_irq+0x35/0xa7
 note_interrupt.cold+0x21/0x68
 handle_irq_event+0x72/0x90
 handle_fasteoi_irq+0x7a/0x220
 __common_interrupt+0x3e/0xa0
 common_interrupt+0x80/0xa0
 </IRQ>
 <TASK>
 asm_common_interrupt+0x26/0x40
RIP: 0010:cpuidle_enter_state+0xbb/0x410
Code: 00 00 e8 88 bf 25 ff e8 83 f1 ff ff 48 89 c5 0f 1f 44 00 00 31 ff e8 24 4e 24 ff 45 84 ff 0f 85 a6 01 00 00 fb 0f 1f 44 00 00 <45> 85 f6 0f 88 7c 01 00 00 49 6>
RSP: 0018:ffffffffa2003e18 EFLAGS: 00000246
RAX: ffff89c01f600000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 00000000a04a55ab RSI: fffffffe2798aa89 RDI: 0000000000000000
RBP: 00000000a04a55ab R08: 0000000000000000 R09: 000000000001f018
R10: 0000000000000008 R11: ffff89c01f63520c R12: ffff89c01f641570
R13: ffffffffa21bd2e0 R14: 0000000000000001 R15: 0000000000000000
 ? cpuidle_enter_state+0xac/0x410
 cpuidle_enter+0x31/0x50
 do_idle+0x1b6/0x210
 cpu_startup_entry+0x29/0x30
 rest_init+0xcc/0xd0
 start_kernel+0x9d3/0x9e0
 x86_64_start_reservations+0x24/0x30
 x86_64_start_kernel+0x98/0xa0
 common_startup_64+0x13e/0x141
 </TASK>
handlers:
[<00000000104a7621>] idma64_irq [idma64]
[<00000000bd8d08e9>] i2c_dw_isr
Disabling IRQ #27

[...snip...]

i2c_designware i2c_designware.0: controller timed out
hid (null): reading report descriptor failed
i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110

---

Hardware info:
- Lenovo 16" IdeaPad Slim 5 - 16IRU9
  - Hardware name: LENOVO 83FW/LNVNB161216, BIOS PFCN14WW 09/20/2024
  - ELAN06FA:00 04F3:327E Touchpad

Steps to reproduce:
- Cold boot the laptop on Arch Linux

The bug is still present with the 6.19.0-rc1-1-git kernel.


The bisected commit is from March 2024, but I only recently noticed the issue because the initramfs images on Arch Linux now include these additional drivers (as of November 2025):
- kernel/drivers/dma/idma64.ko.zst
- kernel/drivers/mfd/intel-lpss-pci.ko.zst
- kernel/drivers/mfd/intel-lpss.ko.zst

Two other users have reported the issue on the Arch Linux and CachyOS forums, so I don't think this is a hardware issue with my individual laptop.

Thanks!

