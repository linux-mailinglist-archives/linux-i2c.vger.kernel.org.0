Return-Path: <linux-i2c+bounces-2418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC0880928
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 02:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29CEBB22F6F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C16F9E9;
	Wed, 20 Mar 2024 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="VqtpnkG0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBCCF512
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 01:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898871; cv=none; b=IG0jtXjMxGyn4HWHrk98tge/gMJH8XH+1LgzU7mCIBNAuvyH9k2NC34/PeEP3craWfasszJyscBabFVOLxJUZSU90MK0f+rcNiELh/F1tBlpWtWX2LzqZpx4zUclOaOFZ9Bs08sWSsWR9+rsEc4qdZy8YSER0N5naFoBMctGrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898871; c=relaxed/simple;
	bh=f7/xT0HG08QEqOPnvs8BXxOk8KFC9FV9qyN7MsCYleI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=WY/PnxLE0vKBVVeL0y+ZQ1RTZ7sFC7xNrxthXJ3GVxaOLn0fzugD8UTSF0LBe38JyCMe6L71ouaRw17dY7ixFAqT+7ZINlaFS6aMFQTXq0ROuz49c2e/T5DXO61q14cqRAIvLV3GhsX5m+eKGVZXOeb2hjZHrE0qMqrSRvo4wZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=VqtpnkG0; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7cc05ce3c70so17572339f.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710898869; x=1711503669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7/hpV+Em3BoTxGrwIgXkepVh1gS44KxoPqnDURnUx4=;
        b=VqtpnkG0J07hPgvkv3N7TGPaGROui2Bf36TyzLVYZIWpJrJipdM7/MtBu2HMFq1deF
         1rND9RTmtAcS2KCr1GXl5OvTPRq+05RF23xDg/DzDFTRTY8ESgGla9gByQe6WrDAec88
         OKW6/W7Pfzz+xrQLEF7wJ3D7XlQUL/yIdCe5SgPEJk+FJQWjxgtPfVOSyrS3mmoZ4XZi
         SQbVMDOSZSUi01JClGHWzFTK639G47Iykiie2+Xy2PWghlnq1Gxe6ZhRrflbeKhJsDEj
         np//k9vq/8zZc9AD1eGKN+e3l0PMrQ8Ya9S2WYOiQKASdfJ2ibsTsG4rnYRqMdmYYqqE
         k7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710898869; x=1711503669;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7/hpV+Em3BoTxGrwIgXkepVh1gS44KxoPqnDURnUx4=;
        b=BXCa/X24dR0O/IgTThKqqiYTvpR7Xze97UJoSzdRW6vVI0HynRBn2Nt0Jaw4b78kTN
         X9qhnyqc+tdMSEX09AuAt43R87L9We9HU2t93DHmtWcQ6cGha0HLdLntIcqTvAHzDF4E
         Q7zTYMEEoRwrho01P2G3ase7f+KyDfLRisHTn8GNhIG7Hdr9nKA1vVVFO6mLEX3r7Glf
         6GMxgcJNvHbohzq7I59LWEDPknTgd9GzpKgjLyp6dkMRj2A94XM3DQqJ8tkPRaEKz0Ij
         hURpWaXls6um0pwq2fGJ0S6I/lhAagkoJss/6gvegdIHBNDnVasbOiZkxsmTaM59GvFJ
         VFaw==
X-Gm-Message-State: AOJu0Yz2vaiucVA9Z3LVTCgqk/1CrUOLYnzK5ZYWfQMrIBZI4lJnh1Fy
	YL9Z0zfNmgKFno3+a8/mL2wgoASGp6SNZZD7w6LYzaVCUPMhMrNpvLY8yNKqqPM=
X-Google-Smtp-Source: AGHT+IGwQeKnJcyeErAbxGtlVeA82Y4WSUEEyptuh/wKhEvsl72/dYks8R4YK7tFt9GH2gjTkU7Mow==
X-Received: by 2002:a05:6602:e13:b0:7cb:fdca:e4b9 with SMTP id gp19-20020a0566020e1300b007cbfdcae4b9mr1320643iob.3.1710898869471;
        Tue, 19 Mar 2024 18:41:09 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id y19-20020a6bc813000000b007cc028ce258sm2632845iof.36.2024.03.19.18.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:41:09 -0700 (PDT)
Message-ID: <e1a13da5-a40e-4afd-924c-2ddc9771f5aa@turingpi.com>
Date: Tue, 19 Mar 2024 19:41:09 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <sam@turingpi.com>
Subject: [RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

There are many fields in `struct mv64xxx_i2c_data` with `u32` type
despite this not being the correct type for those fields.

Change the types to accurately reflect what is being kept in each field.

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
  drivers/i2c/busses/i2c-mv64xxx.c | 26 +++++++++++++-------------
  1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c 
b/drivers/i2c/busses/i2c-mv64xxx.c
index cfc16909fba3..bb048e655be7 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -83,7 +83,7 @@
  #define	MV64XXX_I2C_BRIDGE_STATUS_ERROR			BIT(0)
   /* Driver states */
-enum {
+enum mv64xxx_i2c_state {
  	MV64XXX_I2C_STATE_INVALID,
  	MV64XXX_I2C_STATE_IDLE,
  	MV64XXX_I2C_STATE_WAITING_FOR_START_COND,
@@ -95,7 +95,7 @@ enum {
  };
   /* Driver actions */
-enum {
+enum mv64xxx_i2c_action {
  	MV64XXX_I2C_ACTION_INVALID,
  	MV64XXX_I2C_ACTION_CONTINUE,
  	MV64XXX_I2C_ACTION_SEND_RESTART,
@@ -121,21 +121,21 @@ struct mv64xxx_i2c_data {
  	struct i2c_msg		*msgs;
  	int			num_msgs;
  	int			irq;
-	u32			state;
-	u32			action;
-	u32			aborting;
+	enum mv64xxx_i2c_state	state;
+	enum mv64xxx_i2c_action	action;
+	bool			aborting;
  	u32			cntl_bits;
  	void __iomem		*reg_base;
  	struct mv64xxx_i2c_regs	reg_offsets;
-	u32			addr1;
-	u32			addr2;
-	u32			bytes_left;
-	u32			byte_posn;
-	u32			send_stop;
-	u32			block;
+	u8			addr1;
+	u8			addr2;
+	size_t			bytes_left;
+	size_t			byte_posn;
+	bool			send_stop;
+	bool			block;
  	int			rc;
-	u32			freq_m;
-	u32			freq_n;
+	u8			freq_m;
+	u8			freq_n;
  	struct clk              *clk;
  	struct clk              *reg_clk;
  	wait_queue_head_t	waitq;
-- 
2.43.2

