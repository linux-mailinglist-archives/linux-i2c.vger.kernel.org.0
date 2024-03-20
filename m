Return-Path: <linux-i2c+bounces-2424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E53880A4C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF2AC1F233ED
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 04:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6073117BD9;
	Wed, 20 Mar 2024 04:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="YJewdRFN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79917996
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710908433; cv=none; b=tZBA21kdjnqGi425YwqcrYyow8Rxq3fsac6olK50bNUDmg6xXplbHScYJoYRc4mfTMkBT1iyxY8a5Wnla1N6BsGKR6SYJ5IOpHSmqF07N4W18vNt6hj+NsvTMUwu0PKEgEJiLjpV6b60tWI9FVWOO9YICTTCc95r+fKp3AUg7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710908433; c=relaxed/simple;
	bh=BxX5FQpfU7ryyCmToAmFws1m7NS1nntuj2W5QNchcRU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jOUE3k41UXgkOjdE3RMs5xcRQjxNuPV6TwspFGsZ0cGN9Ys0UWV8Mjy4iSl5Ezhna3oHOBCG+g+wZbrYH9l2SjC9bmVQBG2XjR0ZCV01LWsHah0mGje34QFKEwQtm+q2gGrCGyDmu8OfNqpKMIr015cpnI3b9QMpiCTSPKWx6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=YJewdRFN; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5a46ec4050eso3400041eaf.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 21:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710908430; x=1711513230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fWtKmJ3MfVCnV+E74sqM2ekSX6lKZRkdLbepWZrZ6o=;
        b=YJewdRFN25r7nvfh0g5ZDPxVjTfWAY5ZgO/HlBsKOXYUpZmDZUqwMwGFTgdHTvyeTS
         ozUM/vGMhx1btZLeAoiDefT2N0aNMeLmTfhOMohTsbMKV2WCZCZK5+tgrP4uXWF+p9NL
         JNrE+Z1xkVNaJ1+FjnUTe5uZGL/x0bns1Fxu8Mos4kHkO2bYiJnrFAU6BYuqhe1XCJWJ
         GC0mFQdD4ljmiVa8bY72SpRlxt+X/wbp20A9q812r3b8WADpfArqHBLqJe7/k/bieyFi
         WFuwnhuRZMHtMM2ANir0xpUOyGAha8i5Dm7GFIm4HqHBt5C+soeCr2iNaxVWL6E6vXbQ
         3R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710908431; x=1711513231;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fWtKmJ3MfVCnV+E74sqM2ekSX6lKZRkdLbepWZrZ6o=;
        b=Ccrgf2iTLiMQv1AR88SGFEcHNXyqVTtVwooF6Yh9/tl088JRjTlKLz6PETZDuxeiEv
         aOt+4HMyKSOE1ngRPQOzZGbiRdbVEaODF5C7FTxDToux84zVZC5BZ9pY8fqxCNcD0XHZ
         lh52wxGR7rvMcjoER9AjBdviyQU0b6b0OyLe6LPI/Jx0DieM1BWOYBhlzrxjPheF9sqq
         0sVaj/6kry2tEinmTCZnm2j/v6n/qxesnB9L9cxZ17qd2pIdeTzXxGkHDN62VwjXI/ly
         bqFoHleFCkasFn7aXkrZCjDZ+YudxVK8e2X/agyrdw1x9mAvhaXSs1gVjF+aipyMmAGj
         2qPA==
X-Gm-Message-State: AOJu0YxQxX0BfEKRQLxr+Lx2YO4FkLe9gia4d70YdhlQGDG2zWfyFlSb
	dDUuHvQ7vSzvY9ktR/y7YApKJsZqeQBR2/pGSiFDaNEEnrs4zJEbttHyGdkhoCWF8wpW4E+Gw7x
	t3UWcOq3Aba6PMmX2Oo2wJj9p6fD/g2Ub11PbxQ==
X-Google-Smtp-Source: AGHT+IFN6M8w1apocywAYQoQVW8GClTgKjY7u+bmQrz7JBQVn0gQDUfr8+LYrMWU5Bh08mcydgynecAP9NjVEwOKlto=
X-Received: by 2002:a05:6358:938f:b0:17e:69cf:2105 with SMTP id
 h15-20020a056358938f00b0017e69cf2105mr16163747rwb.29.1710908430736; Tue, 19
 Mar 2024 21:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sam Edwards <sam@turingpi.com>
Date: Tue, 19 Mar 2024 22:20:20 -0600
Message-ID: <CAF8uH3uAFh5wFSb+mfJn9LBNyMQZ_j+6sr+smmOeqF=tvUe0cQ@mail.gmail.com>
Subject: [RESEND RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

There are many fields in `struct mv64xxx_i2c_data` with `u32` type
despite this not being the correct type for those fields.

Change the types to accurately reflect what is being kept in each field.

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index cfc16909fba3..bb048e655be7 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -83,7 +83,7 @@
 #define        MV64XXX_I2C_BRIDGE_STATUS_ERROR                 BIT(0)

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
        struct i2c_msg          *msgs;
        int                     num_msgs;
        int                     irq;
-       u32                     state;
-       u32                     action;
-       u32                     aborting;
+       enum mv64xxx_i2c_state  state;
+       enum mv64xxx_i2c_action action;
+       bool                    aborting;
        u32                     cntl_bits;
        void __iomem            *reg_base;
        struct mv64xxx_i2c_regs reg_offsets;
-       u32                     addr1;
-       u32                     addr2;
-       u32                     bytes_left;
-       u32                     byte_posn;
-       u32                     send_stop;
-       u32                     block;
+       u8                      addr1;
+       u8                      addr2;
+       size_t                  bytes_left;
+       size_t                  byte_posn;
+       bool                    send_stop;
+       bool                    block;
        int                     rc;
-       u32                     freq_m;
-       u32                     freq_n;
+       u8                      freq_m;
+       u8                      freq_n;
        struct clk              *clk;
        struct clk              *reg_clk;
        wait_queue_head_t       waitq;
--
2.43.2

