Return-Path: <linux-i2c+bounces-2429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73586880AB1
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 06:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FBFB2839A0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CA617576;
	Wed, 20 Mar 2024 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYly9WZP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D781428E;
	Wed, 20 Mar 2024 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710912925; cv=none; b=S79FeBfjLRkvwuUK+0Cep55D7mQVA5jZtX49hIy0XzB9fVgC+Xv6Xh6EfCZYNQfwVIDgU1jHHJ04m3Jk+piPIWHBooXF0FghC2QZH+ogqsmIbcEs3ltG+HjReN01JmDkXJcdNIJ03348JiEQ2R9KAmvHs3U/EZT+8TSmkrDqwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710912925; c=relaxed/simple;
	bh=ldkBIpP1iQ2aO/IzaLnzxa3HL6kC7m3EDYC2KyM3Mps=;
	h=Message-ID:From:To:Cc:Date:Subject; b=OcqHHE0svn57CoXtvWTmGsZNJQVUNm0v8dP+d8PlK3x/ulfyKUDP9i0FN9M4U7yfYHDFQDYkdjrSECKq+DCHnrFYFxzJWsqR51RhYtgR9VaSyHdhRnpLRwWMVwW+lduHhKA3ORyMj9ZatQ4f08OS4AUhAU36LFJgrRXhThJIwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYly9WZP; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7cc01644f51so178715039f.2;
        Tue, 19 Mar 2024 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912924; x=1711517724; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdzaMW1y8chZwthZH4ERyUEDxEvHFRT3urSQfaKxNec=;
        b=eYly9WZP+FeSBhqspLuJ/REtpPmOc4LWlVOq7Iko7pqHvgCbLC3IQQ5JNCilVh3PCz
         AeerY5qlgqs79KxV7m+UhTqphy+IncdDiaLd+/PuK0djLjWKpoUKEFizznLe2oJFSWW6
         j2CbF3nR7EkP9jZ9Gctf+chwZgTRxZrhvSnCt9B1al4icuCGlP7EUWY9NRYo6Br4G5+4
         UbXEcor30vphyLlMpaCjK8JDAFcxMigDPz5yj8I6GfqzMV7ACjqNGXSI0wRcDTBT0Owb
         uhjeycpld6R6uNdGrdvvkFgrT2499kBHdLUf7o2TbBDXxlZXBuSRrxlSwCNQBXdAwSUS
         M5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912924; x=1711517724;
        h=subject:date:cc:to:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdzaMW1y8chZwthZH4ERyUEDxEvHFRT3urSQfaKxNec=;
        b=eAcFTyFMN3iScvoh5T4ncDt6e/xv0nIrDd4emeomUDb7aFwqiAUoaUnhnp2G9VtSvC
         exi96HMl5bhD+RCkVYVY4w9bEGHIzRHneNgqoXTaA+/sPw6omZHTG+wjNF09YHZDyadA
         Z4eZqD3z4N9nLd+d4JTbZAFM2G+IuKpTz//kRlq8JUe8rIWpo/Nqb5VNF9yc0xt2GiVz
         0AhEgiE8NK7PwMwuzNTvd5/v58X8YfK04BFyUoR5tcneCr/dyiuUcfzy9bJaZN0gRX+z
         XEW2oU2ZWWQgIcH94nudggJfyzWy0UJRk9fV+mTErhPqghbsdh4eD3OF8ynBDdVQBXY4
         5pAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgYpo+iPYHL1Hst50sXAmLRpXT1k/0tUTig4gKdUnCq4GvQ+R5ld6CSDdceMWDG+uNfaWjcPmuWmbVjuEuZTNSzaFV0fo3pfI8Poa/
X-Gm-Message-State: AOJu0YzrBmUPf6rOaG19fTwCe4WlJeJtVK/UvlPYdC0ojjM4lVVcUr7/
	IMJJsuwwAXlez468MiIP7qij87f8v1mv1iwZNmA1GKqZfHk3aZoS
X-Google-Smtp-Source: AGHT+IG9TmyAa6Gnq24FoX6mBn6doGEL9SzpbRHMACexCR5sHZfMAO83l9bHXVdDLtPIjeBOMZYnQQ==
X-Received: by 2002:a5d:984e:0:b0:7cf:15be:6834 with SMTP id p14-20020a5d984e000000b007cf15be6834mr1105012ios.4.1710912923728;
        Tue, 19 Mar 2024 22:35:23 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d9f06000000b007cc6af6686esm1679597iot.30.2024.03.19.22.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:35:23 -0700 (PDT)
Message-ID: <65fa759b.5d0a0220.fe5f7.1fa0@mx.google.com>
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <sam@turingpi.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Mar 2024 16:51:51 -0600
Subject: [RESEND v2 RFC 1/5] i2c: mv64xxx: Clear bus errors before transfer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The MV64XXX hardware can act as either a bus controller or target
device. In order to protect target devices from a glitching bus
(apparently), the core listens on the lines even when idle and moves the
hardware FSM to the "BUS_ERR" state if an invalid transition is
detected. The hardware then does not exit this state until reset.

This feature is actually counterproductive when using the hardware as a
controller (as this driver does): we do not actually *care* what
happened on the bus previously, as long as it's ready for use when the
new transfer starts. However, the controller will remember a previous
glitch and trip up the driver after it attempts to send the start
command. The driver logs and error and resets the controller, recovering
from the BUS_ERR state, but not without erroring back the transfer with
errno EAGAIN. Clients generally do not handle this gracefully.

This is easily fixed by checking for the BUS_ERR condition upfront and
issuing the hardware reset before beginning the transfer. This patch
does NOT also call i2c_recover_bus(): the assumption is that the bus is
fine, just the hardware is upset; if the bus is also in a bad state,
this should not pass silently.

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index fd8403b07fa6..cfc16909fba3 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -753,6 +753,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
 	int rc, ret = num;
+	u32 status;
 
 	rc = pm_runtime_resume_and_get(&adap->dev);
 	if (rc)
@@ -762,6 +763,11 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->msgs = msgs;
 	drv_data->num_msgs = num;
 
+	/* Calm down the hardware if it was upset by a bus glitch while idle */
+	status = readl(drv_data->reg_base + drv_data->reg_offsets.status);
+	if (status == MV64XXX_I2C_STATUS_BUS_ERR)
+		mv64xxx_i2c_hw_init(drv_data);
+
 	if (mv64xxx_i2c_can_offload(drv_data) && !drv_data->atomic)
 		rc = mv64xxx_i2c_offload_xfer(drv_data);
 	else
-- 
2.43.2


