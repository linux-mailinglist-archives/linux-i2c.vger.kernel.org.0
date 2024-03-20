Return-Path: <linux-i2c+bounces-2417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729B880925
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 02:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0EE028445D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084FAA95E;
	Wed, 20 Mar 2024 01:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="mIrlVoSd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710D8F5A
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 01:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898863; cv=none; b=ILluOCeupYS/lG4TqT9E6rGFxXIbr8CtRKQm20h1XdSHN6NOv7IEwEWGhlv42zbuIIciaBiWO8nZgKMvoXAFgCSoA0TELCFsYSTKB/UTy6DIloJALjWQnf9FFTNbRCzQJU4HrlHzgjoApC5UB9IUIoKSmM9/GHJ99o4yDnrRnqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898863; c=relaxed/simple;
	bh=bQ0po2DVBNuqocv/+6T7JzlVaV/yk5Nv6pHDeE2NkiE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ZkFDUoN5131OIYEjA31M7XmKLFrrvBpDGfrSi3SoT0bICxmd39x4jsp5reEULK1CuHm4aCo/2I0EqpcabwzHjkPpkzyaUQsuvPhcNJsroT70APMW5ie7Pl9e8ofCDUbGcHJZuU8LO0zDJF4By8ZXg7zwOvYsNBR3yGa5wmESONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=mIrlVoSd; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c897ac777aso140999139f.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710898861; x=1711503661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lqTTeu70Rhb3yt+ddX2qWBVOcmCNDQFJSvun7EAf10=;
        b=mIrlVoSdeSIG8nl3+yYYslq59HKJQZCe5WPkHSqSSv2jRcGtvYSU+NmCCK9xff5yVD
         0ij44GD+qJHU3JtO5Z5njvllHDw3LfIGNP8YoXDeQYNr6QuoMpFl/Ssm/JahSUJa3DZG
         gmJk3KlFbi/hmhi23aoSwCxVb4VYsiD1OVgNL07xzT6EWfcbo0aeQZwAYU6Yoxn6UIIJ
         O16jSnaeyuWDy4mRW1ATUUo4dw9Y+g7+xh3AXkIcqxk3EvfcRe6GRMtRITBoBXZPdFx8
         sbM7s5ishmlMPg6dSJuHLIaYVlVF+p/dAjqyyHs8FVmJ27QbK2XXmsWlTEyy+p1A2y6S
         pSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710898861; x=1711503661;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lqTTeu70Rhb3yt+ddX2qWBVOcmCNDQFJSvun7EAf10=;
        b=u+Z5fbLuabqEpwggvPMAGAlh+9B4s+5MYzJZXIVHI6kntvOCTqUGPAljxlzKgNYFnL
         zD/bUz6zkfe71H/YwzLOaOlCAJQnseQimPMdqUsWlYff0XLa7jgNIhIdfn8PfyDYrQ1D
         oBRbahZvYwxCLRpe9Vuffez6uUtepLuXe8Ki+0P82kDo53g+/GgGSiRlKn/cmmgmmWyc
         aPqk1g1504400Kq/5FtMBbGyPKTGXu5R36zLPpV0t3zxHT8uuaCLvLOxXx4dWLXMBZ0s
         jAh8npzgoj6pL4XoRwyQawqt/KMxGaAr1XlfS5QDqeRIWgYyMcGsBz3RbH9JXJMzkbZl
         dboQ==
X-Gm-Message-State: AOJu0YzPlvDxGnVe6DrqG9cDLBVdLWvtUWtslot1Li/Z/s1zTEflv9Lj
	xzObE+FRyKFflKYqJAMiVstL7tHcuSXdnRNOQR1tYRFHh2dKrtFTvFKNMHAnSUmPe0kUWAnhyjC
	Gkbs=
X-Google-Smtp-Source: AGHT+IFXJTv7mzmrdW4Qn7wZJddJo94O9faxOHExq3t8uNKkxZHnlGuRAc3hn5YJLCVQqvyXiGhmrQ==
X-Received: by 2002:a5d:9619:0:b0:7c8:60a6:5bda with SMTP id w25-20020a5d9619000000b007c860a65bdamr4653730iol.17.1710898861395;
        Tue, 19 Mar 2024 18:41:01 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id y19-20020a6bc813000000b007cc028ce258sm2632845iof.36.2024.03.19.18.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:41:00 -0700 (PDT)
Message-ID: <7bde2b76-ff6e-4cf4-9c23-7b831631ce09@turingpi.com>
Date: Tue, 19 Mar 2024 19:41:00 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <sam@turingpi.com>
Subject: [RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

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

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c 
b/drivers/i2c/busses/i2c-mv64xxx.c
index fd8403b07fa6..cfc16909fba3 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -753,6 +753,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, 
struct i2c_msg msgs[], int num)
  {
  	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
  	int rc, ret = num;
+	u32 status;
   	rc = pm_runtime_resume_and_get(&adap->dev);
  	if (rc)
@@ -762,6 +763,11 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, 
struct i2c_msg msgs[], int num)
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

