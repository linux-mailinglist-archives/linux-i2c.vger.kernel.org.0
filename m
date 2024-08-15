Return-Path: <linux-i2c+bounces-5422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E4952DDF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CEAD286117
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EBE17ADE0;
	Thu, 15 Aug 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XkgTJJav"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C8146A6D
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723785; cv=none; b=U1+7ClMZXsKzX1lCN3FgQHgUtwJOZsrNE8+OwB4VN0cFRXAgDyV3vCAPOeNcH3gm8I+28k/irpLzHsTznpeDGePws00xmzrMR7+uqFT/7/g2yP1ViPq6mSxTOD4UctIU6BwzH0Rjf5qw8ujfCzLigRpdaKYDLGIqT8gX6eyQIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723785; c=relaxed/simple;
	bh=Shs6RSJSIFnCtEluvPdGT10WMpbOHytU5oRiHPZ4wnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qAUdYTpnYP53/7qlpESEVvBbSLN7uT70UL/asaO6RqUmT0fSbcKymqI4Tmi+wIvRK63W15DTfmHLck56IZdqIC3qhphqhreehHF+X+SkUer82hWSmRn1wH0ND93R2kX+qFO2XPZb0375yiazrHmFk10nDqRFT96lOAt492lhT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XkgTJJav; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=PMyeN85IaHVVEX
	XyFNaJinZ736PaXNL2fo7UzY/qfWY=; b=XkgTJJavST4uZvjwIG35a6jTqg7XI0
	bWYteBhHZTRyFWS9ZjGcVCQaaKHBR5YR6yZhMB2yO0NX9g/oNYk1GWwll7zrAhvD
	L1nciKltSypJkkg6RlWaR7YWr3JGYNff4pRSTg2WBSHuj4obsIouJ3AIxLqeVXpY
	7SpioNHh4FJqOtU7pn6ZWA3tooVO1u9elY4CVkEFEFNCJ4OsfVwRKdzkstxfGemD
	1VWfbwyZ0IEDXmPSL5ye8CIO9vrK7h3/AaiNfFhxN+AY40bJi0ENW72Jp9M+R5My
	rWOr8HOB7j7d8KGiUhOQS0s3AIBwSD8XunaX6K5Py/SsiZpjhPXMhbxw==
Received: (qmail 2281958 invoked from network); 15 Aug 2024 14:09:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 14:09:37 +0200
X-UD-Smtp-Session: l3s3148p1@euRxt7cf5NBehhrc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
Date: Thu, 15 Aug 2024 14:09:32 +0200
Message-ID: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"smbus_alert" is currently listed as an interrupt for targets. This is
wrong, it is an interrupt for the controller. The mistake (mea culpa!)
was already in the originating "i2c.txt" file in the Linux Kernel. Time
to fix it. Make small changes to descriptions to use inclusive language
while we are here.

Sadly, not tested with 'dt-doc-validate'. I tried to install my local
dtschema repo with

 $ ~/.venv/bin/pip3 install -e .

and got:

 error: Multiple top-level packages discovered in a flat-layout: ['patches', 'dtschema'].

I am afraid I am not enough of a Python guy to fix this on my own.

Looking forward to comments...


Wolfram Sang (3):
  schemas: i2c: reword descriptions for inclusive language
  schemas: i2c: clean up interrupt descriptions for I2C targets
  schemas: i2c: add generic interrupt name for I2C controllers

 dtschema/schemas/i2c/i2c-controller.yaml | 36 +++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

-- 
2.43.0


