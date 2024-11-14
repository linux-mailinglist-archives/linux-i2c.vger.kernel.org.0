Return-Path: <linux-i2c+bounces-7997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C519C90EE
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 18:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8110DB45DBF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF3818A930;
	Thu, 14 Nov 2024 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFTdvLwO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39E189F3C;
	Thu, 14 Nov 2024 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731603012; cv=none; b=rV5fGxJ5/zUd3DNwuPybOY7k1s3ggV8Uk1ouC3ughoTl3+lUc6/DGgcaYADxPlpNYpDEmJhZx/tA3rHsEzkO49va8OpMj3z14IsiPgNVzGhmGeyo5umKlqF2dDbWQffH3EHfaLUKx2WQuDyP2NSuIS5LdNyT2XbdxDIJhk3k/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731603012; c=relaxed/simple;
	bh=Ub1te92EUjR3KKO91jYzVthuH+ro/ejxDQT2LL/DeoQ=;
	h=From:Message-ID:Subject:To:Cc:Date:Content-Type:MIME-Version; b=rGZCn9wPB7CSfTLc9yxMTEszdSBv1bhrBqRtEQXWho3JloshHiIulO8+BgarkRubxSB4NGfnT1Dd2VIAjbTBKaR8gyseaRz0W2sbPp5ipgnssUiacfHpUdA3fyPr0eB+b9eUwJxbi3SNZXGUIq1e9K6HQx2s/r1H4WnFQ/R2BxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFTdvLwO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cf8593ca4bso570173a12.1;
        Thu, 14 Nov 2024 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731603009; x=1732207809; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ILtapZECsvODEytONKExRHUU53rGzXL43ZOeVl85mJc=;
        b=EFTdvLwOUXk0C3etC1uPsg/upmtXzxyvQ1LV9L1+7DQhUFGL5mJ53dKF9V/tQesgE6
         j3HF66utn3KEk+i/MmmvX655UONfwMQmJGAWfTdC5qmOFDf75kZUvzBmQeZH4ecitMcN
         JlW2dXclfpLF1Xq9k1RIADW2Ow3wer96vhMsPzs94zdsaQPqg8h4PGop30nN01p/cExu
         4DEuO8FJTax07SrJzgqVXLVMc5wXWlUrhi13NNt1OZmL6zexMq6TOO0EzRwYkDhWGYvg
         ikWrdFKgdvrboKVLqyurKpcUypQ+s53nM08YdsJBjCniZn68Gi2h3lQUXqk2V5O5vG9B
         bPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731603009; x=1732207809;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :subject:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtapZECsvODEytONKExRHUU53rGzXL43ZOeVl85mJc=;
        b=diDy9RKsW6WxfGHIZFQJliS3D/cfmZvosFQlgJcJKunkRZYszw/Vsm2IW7DOZOE2LM
         q4wQ3at7bovgUML9FvpmQmsmRXwHtSEw03FoohI71FGKs4ZuNgi+zMLxssFiDO7jc0Sf
         xhqmrnRQewYfAnPgtGXhLiSt2XDeVaPDs1jRNwf0JdjRawpiOmqavMKJVlgQxQ4a88wW
         2olXieEK+BOSm2VmHVChQxu+MKURm/T/f9FMZOYiP595nVKg7kpfHvQr+jXCjjKuqocD
         IkrSabIDylNZhcPnP+OsBsB44buHI6HwFBcLexTu8w6cinc5uQgVfKXwzyLg0g4SLZmc
         gnIw==
X-Forwarded-Encrypted: i=1; AJvYcCUKtuAyt2NsWKpRwj5rMyYiKfIueAgPcc2chtF/lT/YaUgrcYXB3JNL7en1nBhoxZT3pVZ70oNO5CRBsj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9TBkpo/Du+kIo7orJxllalFN3juOUX+sD6XlT+9kbM5UHkbU
	l+BJNmxjJabpKjqMpBxtqYNFP6ui3VpRPvKSl4vABcbfnu65MOKajCBn9QrCJ+Y=
X-Google-Smtp-Source: AGHT+IFjXtHbzJ4huqBidQnrOtxCNVNIDJqBKNtDTw1ffM4pLAYGpURs5/jw+75nUZtQENK1095tKw==
X-Received: by 2002:a05:6402:d06:b0:5ce:d028:e11 with SMTP id 4fb4d7f45d1cf-5cf77ea3808mr2308434a12.17.1731603008752;
        Thu, 14 Nov 2024 08:50:08 -0800 (PST)
Received: from [10.0.2.15] (23-152-178-143.ftth.glasoperator.nl. [143.178.152.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb3579sm729724a12.37.2024.11.14.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:50:08 -0800 (PST)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
X-Google-Original-From: Liam Zuiderhoek <Zuiderhoekl@gmail.com>
Message-ID: <2494788d943ed75741e6671e615f9e3c31cdc2ea.camel@gmail.com>
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2024 17:50:06 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From 214adebf7cf37be941f208124fac9ea6bec0f1d2 Mon Sep 17 00:00:00 2001
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Date: Tue, 22 Oct 2024 20:46:59 +0200
Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue

Fixing a coding style issue.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..6829def15933 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+				I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
=20
--=20
2.43.0



