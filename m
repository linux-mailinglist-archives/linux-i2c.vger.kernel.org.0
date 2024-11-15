Return-Path: <linux-i2c+bounces-8001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5534B9CD644
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 05:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEBE11F22474
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 04:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD9C173357;
	Fri, 15 Nov 2024 04:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4j7+AppQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A136156C6C
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 04:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731645812; cv=none; b=YbpLsiPdEpVPFNt6bH7mVnlNF5alAyQtHAw/ZT/l7LzCVIgu/XJM9CPCzyeXL98Fah1vM+fZtfrKkcdIo4tB/iBRYXyFfO0VorEtVv/jc+ilKQVOHeyubVn6kCrLQGnUA9UmXPKe+nsy0no65vkXzy4+j9/UZimDhbsnfmI9y0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731645812; c=relaxed/simple;
	bh=Eb8fbw9GSmaI50VtSRzTOM9uZerZsPdO3Ji/RvA9dqo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hGXp9HxFvdcSkfyyu9Qjlb72Hj7BD/7O5Vx7R+stiePAlfPKgsXoDzwIWcr1VxcCQHQQmmUNcM/Bm4pltwxa8eqiw30B5Ur7ooCiwg3W/tWDhzq73vyNYFaNH4TWzmJc/a50TAcI5On9IDWl5lUbdZWrSMpJZmLz2xZnsNCCLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--brendanhiggins.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4j7+AppQ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--brendanhiggins.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea8a5e862eso17078757b3.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 20:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731645810; x=1732250610; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SWTmFeTgm2VLDhjQCMJox51wxvKAPwETC9oW5QsHWQ8=;
        b=4j7+AppQ41RQnSzcFQvq1Lj4J+1Y75wwuXb1iuMrhKtxA8RYq5CqAAVUo8TKD+g1Ku
         OFmODR85ko/v5BEquB2qUVLCsvqSgktM1gG2BrwjORKx58En5PuR7i0fRoP7BIYbeZAt
         yeCQ1THncC4sx47/wDmlXM6vmMfwjhxUwx7UomJ+VlVAPvdH9fo0d9ayV3avm6HbLcKR
         z0XxpdTx4hzDZJ7JsBD1GXEsqDiL/U5mujjWnLkaPlHHImul5nio6SC4hp4xvDcAr28K
         V56lm/zXg+V5DVTZ7V/THNRbrtzCidqCUvuaWqYY0tJ8sffMc4fcbiUBflkoJWXLv6dt
         g7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731645810; x=1732250610;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWTmFeTgm2VLDhjQCMJox51wxvKAPwETC9oW5QsHWQ8=;
        b=sAQ0U/z0y6JSlR8qt6/qNkOM4X82VrCiPgpeB7aWyMrNq8Qzt5HE3x8jshzbf+gx+l
         PoQtpYYLCqUBRWXH52vmCm3/l7MZhzEw2xUkUFRYYeqfPQeT5K4HD21bnEEVVDUAasJZ
         XL+Z7ejXkQBR1ODfiBzD+GIjbE1msnWls1LlAbwi021XjW0iribzcdQBpXhqMuUmXtud
         7ozdfQzbjdG/XLP8HjdsamPL27glQqone2j/oVHskIBBGPNZx0gViAwUp0gNbUe9hmdT
         AzGAICTzEdWjMD15Sh2MR8zD5mEDxXMbNN7YblFDE0Zn3oA+zzcq9eJWBSdsm9d3Qf+s
         o+7w==
X-Gm-Message-State: AOJu0YzoD9YmJFIxmQpCwHTZy7gntbtVH+y3LeaIfVbcf7RqKJqfqpco
	BCW1OZokjRUhIhvHbvItaCirJ0GgTreBGyHR8cBUYIZ620aLvpZ911YFUmk+ibwBzaWM0pR14v/
	lmXmIDF3beriWqXvaz8X0GUqldcRQJHM1HQ==
X-Google-Smtp-Source: AGHT+IEJ4NE2/XuDDDNAEKvda+FMnKUt6iMnc1swX3o47JMptB20Xn++7Qkq+lJu0qkPYYpm82OXCWt2SDYG5Lf2Rsq/yA==
X-Received: from brendan-cloud.c.googlers.com ([fda3:e722:ac3:cc00:141:be02:ac12:7acb])
 (user=brendanhiggins job=sendgmr) by 2002:a05:690c:fca:b0:6ec:b10d:5745 with
 SMTP id 00721157ae682-6ee55017265mr1428467b3.3.1731645810171; Thu, 14 Nov
 2024 20:43:30 -0800 (PST)
Date: Fri, 15 Nov 2024 04:43:03 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115044303.50877-1-brendanhiggins@google.com>
Subject: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from Brendan
 to Ryan
From: Brendan Higgins <brendanhiggins@google.com>
To: tommy_huang@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, andrew@codeconstruct.com.au, wsa@kernel.org, 
	ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	BMC-SW@aspeedtech.com, brendan.higgins@linux.dev, 
	Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed entry
and replace with Ryan Chen <ryan_chen@aspeedtech.com>.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
I am leaving Google and am going through and cleaning up my @google.com
address in the relevant places. I was just going to remove myself from
the ASPEED I2C DRIVER since I haven't been paying attention to it, but
then I saw Ryan is adding a file for the I2C functions on 2600, which
made my think: Should I replace myself with Ryan as the maintainer?

I see that I am the only person actually listed as the maintainer at the
moment, and I don't want to leave this in an unmaintained state. What
does everyone think? Are we cool with Ryan as the new maintainer?
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94e..e7fba34947f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2195,7 +2195,7 @@ F:	drivers/mmc/host/usdhi6rol0.c
 F:	drivers/pinctrl/pinctrl-artpec*
 
 ARM/ASPEED I2C DRIVER
-M:	Brendan Higgins <brendanhiggins@google.com>
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
 R:	Joel Stanley <joel@jms.id.au>
 L:	linux-i2c@vger.kernel.org

base-commit: cfaaa7d010d1fc58f9717fcc8591201e741d2d49
-- 
2.47.0.338.g60cca15819-goog


