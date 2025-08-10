Return-Path: <linux-i2c+bounces-12222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4AB1FCC0
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 00:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3362B4E047D
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 22:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273EF208961;
	Sun, 10 Aug 2025 22:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpT1zlRW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CD19C560
	for <linux-i2c@vger.kernel.org>; Sun, 10 Aug 2025 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754865159; cv=none; b=j8Lvcyh6NGQHOaVhHnlYC7gv3XO9vuFeWMs5lrh/RV/feAcdhhPG8pR1bgNQawUMJV/b+WRx+utNVON52Ahpn5y1Tfz2ZSrfMhp/5Ij9ZPA3OkyLnIj8WJPUwad+HPdb5yhYStadSNBv4/vLvGkb4kxPcak3/eDZaOUs28fmcUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754865159; c=relaxed/simple;
	bh=A9FV1U7CIAy2NMAbPMRyp4dSSbe66HlO+3+lB1waQDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QvpYUf3I9FzXlD1JWDbppFM1xV7/FbKbNBewaWxFJY3Pkv0RGJehobSEE8lemgvqM+Fznwc4tzfgFa5Q1SxB/NM3X2OVMElJRfuZ+ISRtZvrD/9ywFSNElmgGVSlKfQdj3gCqtfTh0tlgIp99rK8WVAMJDAZ/pk20aW2tfrzgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpT1zlRW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dJb7rUsTB9SkaGqYqp/qaoDTrI+nSvgfo1YbIvP11Sw=;
	b=HpT1zlRWbCwIgCzW1yFez6cFBBjOL6CszpaOQyZoruyzjPtfO09oxp11SIoV6EdGv/6ae4
	uglYQhFaBDt+Apb502b9iCFprm/hRF1yM7snn4Fjt9koKToKXVNJwthj0cQy/xUMNa7e5g
	4HTMLBcXndJ+uqvr0YckZGy2tAftD9g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-bWSQbdMfM_ei_NGscXsdug-1; Sun, 10 Aug 2025 18:32:36 -0400
X-MC-Unique: bWSQbdMfM_ei_NGscXsdug-1
X-Mimecast-MFC-AGG-ID: bWSQbdMfM_ei_NGscXsdug_1754865155
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e7ffcbce3bso1226286185a.0
        for <linux-i2c@vger.kernel.org>; Sun, 10 Aug 2025 15:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865155; x=1755469955;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJb7rUsTB9SkaGqYqp/qaoDTrI+nSvgfo1YbIvP11Sw=;
        b=aeao9QjY/f9bc3a37mvdpWTTAGOJVoyzSQVofVcmpp7V/NwpaDxxyo5YbR/i2L+mhO
         ca1d7QMp/NtoI5R7x+2VoRSxqtiLYC4beoaKbXQRY8DuI49qjy1OI23SVWFYggbhcoJi
         UCESb5p0T5XP+U02wDSJfQiKnMyFGOYKZag3uismo3Hl6u/ZvAaowFl/XweUEfwswHkD
         wwDnu/YdzNjCXyoRfTr+yd3W70TmNpJWHaasMGfywYBvgeOFulqq13H9F004rHb7Lrq+
         qhDN2JKlW/FiA4CwCj09V/VeHkj+I0hEViWOE2+aSif8UUDnIhb/AS/CUGyxC+FWiLoR
         4EdA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Z8B7OMdQ/EBj8tWKHX4l0OoReG90I9vspvVplhsud09ixgeN2Iq8gMCbn1yH67rVy8HLuthsk0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa7rq8E9QnsR/92HPenQcSbovmd0IDQcRLPYx0ema4FC/nUYq+
	5sjtRJ1pMkngfQf1BeVJl83HcD4t7PFg0dKVUPbSnbVDaJCbaEVkUIZzRrK+8nuXVgxwcW5IHgR
	Ra0CWAiBWrW9zpOxSFcpD4mgF/3sfxiheDA5EAdZAE8qjgEsDS9jFhNtoOn2y5w==
X-Gm-Gg: ASbGncvuhph9aHdR0dnjiNMxf3kHuqSonjBysij+rKAoxMXsnaTITbAor+Os1/ozcFB
	k3snT2I/0uPxHCXBwL43ICMlhLOyN1HD6sPoxzjbQKHivstpRHJuVUnwgFZ6WLfqmEMYLdL+tMu
	IYRLB3RVawPXgU+5eiJzpq3QBZpQOdpBrDyIBcO8amW8RyTGttWIDXhpPnvadUuxA848AvcoMBs
	adR2lPCdMQ6A5bhGlNhsxShfOpEDrE4G9l8aJp1lRpSxBw3Va1/wtcmfcFefAbICfH01t1iHcV4
	fODckM1uEr2WcUsoz/fn/qS+4/pBSDsywYcHdTAhafpYXszw9ZhEaMg6qSWgu89k8lvV3MSvTUM
	ctMTo5g==
X-Received: by 2002:a05:620a:3703:b0:7e8:38ca:c499 with SMTP id af79cd13be357-7e838cac80fmr1065027985a.25.1754865155267;
        Sun, 10 Aug 2025 15:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSoqXWkVNdaecquXdS5RU3KxC5LuRgDn6mt5MAfNv86tnPuYxMv4lQllMkbIfhq0YBrZt9fw==
X-Received: by 2002:a05:620a:3703:b0:7e8:38ca:c499 with SMTP id af79cd13be357-7e838cac80fmr1065025585a.25.1754865154831;
        Sun, 10 Aug 2025 15:32:34 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e8040a9154sm966989685a.70.2025.08.10.15.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:32:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:32:18 -0400
Subject: [PATCH] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
X-B4-Tracking: v=1; b=H4sIAPEdmWgC/x3MQQqAIBBA0avIrBtIRaKuEi1Ex5qNxVgRhHdPW
 r7F/y8UEqYCk3pB6ObCe27QnYKw+bwScmwG0xvXD2ZENgFlv3JE8SehtoO1ziedfIQWHUKJn38
 4L7V+otXBD2AAAAA=
X-Change-ID: 20250729-i2c-round-rate-137335af1fad
To: Andi Shyti <andi.shyti@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865151; l=5778;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=A9FV1U7CIAy2NMAbPMRyp4dSSbe66HlO+3+lB1waQDc=;
 b=/yTjwc3Hxiz4RhGMiIAb0N96c39PAyq5ltU0bkKcG+K4lHu3Hjn8KL9T1K+zvEXEwQTGuSUPS
 BGS1TacP1ylAqIILUY1oeqj6YDPbvJxC1+0OF/qIqCZOc1U51EKur87
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
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
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-i2c-round-rate-137335af1fad

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


