Return-Path: <linux-i2c+bounces-13593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B3BE4799
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 18:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6348B4E3D7E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 16:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B53B32D0E9;
	Thu, 16 Oct 2025 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7LMmMj8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6351A32D0D9
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630908; cv=none; b=eWm+M3zWVjjVh3tKwPfNun35On+Qt9Ci3ys1G2aDW5kanSDSKPkXObB352tn4e+w1dsuy/pKySygpH2cXjlJcIbqhjtxEFTAMGBQK2Ufxvob8cxUsXGWTWpw73jlbejxu1Ba4oLBFEGRo/PFjSOvQv5rQsnAvEoCCC0gAygn7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630908; c=relaxed/simple;
	bh=1W6726b6s8hC+gJBj2Ljp1SG20lHiAdl2ClI15dwHqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SDwptaYp2XeNZZ3FacTVb5diyG4O0XifcXQBuVeCIPOTDSJlLl38YkzkG10+9eq2rjXdddD9bAIBYVCu7LK6fGQ3LgOINyOEGmblznvnsuYF+HrgPRiGFvWFsMhU8Ywoj8vh8qvPhUzOavPjdh0RO08kvLMfZWfoGRTH5ixNx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7LMmMj8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760630906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
	b=H7LMmMj8I7FKPJm9ivEdCsGf9NvqhyyRkq9WuyvTgD/rRYRJIJKlX/k7CRKT9DvjkdvTcF
	3Wib+uH+RMagJw6n8VZtZ0sU9M26wJIXfBypJRQoqWtjGcpZ4gVUJ4zjPlpvbd2iiEm97U
	ncc9Ut+Psc/jBA5zVdfQpWb2MGkBCUU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-RtfP3ewGNyK4OEZ1TWh4Zg-1; Thu, 16 Oct 2025 12:08:24 -0400
X-MC-Unique: RtfP3ewGNyK4OEZ1TWh4Zg-1
X-Mimecast-MFC-AGG-ID: RtfP3ewGNyK4OEZ1TWh4Zg_1760630904
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1558a74aso39712516d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630904; x=1761235704;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
        b=iWXRWX/+nZvveoyw5yhNYaZEg+J/5W3j9DlLWQskVGhfhSslIRD99Ap5PeohAAG9p5
         EzuJc+eJ8CuvVDeWmksAX7wD/2bB1ZjeMSIPsBN1PFkTKQmhSd+G3ZLMxFnztUzOnkyo
         ctZdlYEiQBowqcEW9C7o+8l15Pd8EANV3/sMuXi2aiu1WxhwMn1y/K2PxfYg8XEeb+zB
         aGfbQTISbXQ3FDODAH2MMwrth69uHfSjOUI3DeHdHCWsVNrVhw5PTx74Ph0Hzo15tbRU
         sTNiXj93v8OupiMo6Ws+7CPoHc3jKUhJtT9a5f0TS69sEqXwWELxvw4uk4JyI9yCCkuy
         aJEA==
X-Gm-Message-State: AOJu0Yz61PA8Qvs/ew/OY7ZjXJdVYG5nLCCeggjpsnN16SxdHzpkqE61
	s7z6WAR6OFsOwC95ozBLESLxkTQRk5NukBDn1tDp9lBwCfPYwopvFE2RUUaJ74vvUpSQvAIm24j
	PBsNu6FEl+FWcfuEuKL7CXjQzCkNzkdTkXcm0IukUpPdhWbJ4jxUc9EIPPqzIaA==
X-Gm-Gg: ASbGncso2UAPcPnSAMOsDmPp/HCsnkl/ZzlYIOn40D7GhcfI599iLpsmUH//z8U4o41
	XE3RmGfykRQ5mZBKtdkfAKgGN3qgYSKfeyGRMM0RyyPwRo5ySBbJoUyWdd+qhalliyj7de2TQ2i
	UhEGxwUFFdVKdw0Y7fOjU4BPxlg+8QOs4Z2X4ab244k8twu+6vHr25m/9R6P8A26Fs8/Qva9Ww+
	20YHlQ9JVbC7Mv+XYZ6jAdq64WVD4xuR9fnPEVYWToKBA8BbUHL3+duhkavA7a+vJD99u+ochtL
	nzo34Cnehc2CLkQ9/PrtK3/Gn0QA6UZowAnc68203UBIZAkZyA2oCYAYX2JmOju5TMus07A53BQ
	oneC9UELeciYhedEOQNFn98id95RiUhoPRZbTWvh4E6YIgSBAq691Qd71I26W8MtUDzc0vw==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9077241cf.79.1760630904302;
        Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZrwo8eKunqrW1ZX26p0P/KX7TpXb/FgnwTi4CXt26VbUSEz89WMw80Ziq/vE1CwQ6xEdig==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9076761cf.79.1760630903879;
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e89e723033sm778991cf.36.2025.10.16.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:08:12 -0400
Subject: [PATCH RESEND] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-i2c-round-rate-resend-v1-1-96dd1d725e8f@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGsY8WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mz3UyjZN2i/NK8FN2ixJJU3aLU4lQg2yAx1cg8xTzN3NTIUgmot6A
 oNS2zAmxutFKQa7Crn4tSbG0tAIG/XihvAAAA
X-Change-ID: 20251016-i2c-round-rate-resend-0ae27d7f7529
To: Andi Shyti <andi.shyti@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1W6726b6s8hC+gJBj2Ljp1SG20lHiAdl2ClI15dwHqQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SpRdj7zNMjvRJearcyn3jvcCybGbvzCpT/zf80RFZ
 bakgINVRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABdxZvgf2ty/NiPw2Wmf3y+k
 wjw/Sgh1SvIc3c68oL70Vk3QcZubjAx9KQfdhaLOvZ/5oe8Kx7O0/wkzcubZlK+NmSm+fW6363Z
 eAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
My original posting received no feedback.
https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/
---
 drivers/i2c/busses/i2c-bcm2835.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 8554e790f8e36c5a1cf56c0aab8556b377f2bbdf..0d7e2654a534e92a529f27fdc049812359678522 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -137,12 +137,14 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_bcm2835_i2c_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	u32 divider = clk_bcm2835_i2c_calc_divider(rate, *parent_rate);
+	u32 divider = clk_bcm2835_i2c_calc_divider(req->rate, req->best_parent_rate);
 
-	return DIV_ROUND_UP(*parent_rate, divider);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
@@ -156,7 +158,7 @@ static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
 
 static const struct clk_ops clk_bcm2835_i2c_ops = {
 	.set_rate = clk_bcm2835_i2c_set_rate,
-	.round_rate = clk_bcm2835_i2c_round_rate,
+	.determine_rate = clk_bcm2835_i2c_determine_rate,
 	.recalc_rate = clk_bcm2835_i2c_recalc_rate,
 };
 

---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251016-i2c-round-rate-resend-0ae27d7f7529

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


