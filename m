Return-Path: <linux-i2c+bounces-2423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE92880A4A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 082EDB21B99
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 04:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB1C14010;
	Wed, 20 Mar 2024 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="jW35wPlH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808A14007
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710908420; cv=none; b=H3YcB8G0V4eNiTCnAN87DbDkjZsgUXVbTmr0LHfDMn9mqKQpEN/H+rnNCttnpM/NzLSt8suTV4+nQbjB2UBs5hQP9Dy//4RT/IjjUnEe7kjcZHz6R8b+/MazE6UpioIspRRTKK4SykDUUC+onOopY5RBigpe8ymwEUlMyhuYlmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710908420; c=relaxed/simple;
	bh=H/oWAmb3qdH6GqOGd7i1JdAe4XTSZAqLaJD9s7aHPtk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ue+4c7onulOaIdMcmkHfw24UeFgxK7aupIA57xjfBSntuYb3a73O7bmGv7PJnn7hFbL7Vm2UuK4a4wDXU4ro7wyxiVChjH8k28nZQ/o9RDLa+xvbdqrRXehk782Ztt+z8ikiK1JLNTgyOPOQdYwiAlMO1jmBq3FbTlXMMholzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=jW35wPlH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6c0098328so5164176b3a.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 21:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710908418; x=1711513218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x/ne4R6QNYBHc5s1C1wG8NSPymgeCplkIkbc0sb+CmI=;
        b=jW35wPlHXg3qlupWIcHLVQjTLb6Vz+uFu8/YqZrbFSYh0rq7qTfBFO3tYiDxLZSqYN
         nYMzj8lBwk8KWhFB280YimQ9i35wxHBj2kfE3PG31VsRi9C38y4JqlUVq3uzA5uOM2f6
         hjLZon7MlgTRXyInBNZEBFeDuQ0rMFq6eyIlo1wJpg1VHPDt1q2ZOu3qGQADw/XJjut1
         KDCQ0EPQ9F1uHw60tZKYEC8NzDE2fB5WEkNK1AeyeXqxtkW3yX7NCmVMSkkxn4vV5Ofv
         EpEGdvCmgycDYAprthqMPOALOp1XPDjEEb/Od2fQ9ISiuEY7lFBPUVW0vJl1nEhD5qQy
         QUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710908418; x=1711513218;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/ne4R6QNYBHc5s1C1wG8NSPymgeCplkIkbc0sb+CmI=;
        b=GhnXpnWE+IXvyNN4+iteCLgvq8u8TWMigVOLaKeVFo5sH4FRECeyPw7IoLoYgagbpB
         uVLTTkFvz44hw1dyVdOCcWznHoTkai9qO2M+pyeyBTUGmPMVo7P3qRWJU4bWHcnskGFw
         uL2y8T6FgivbnhQ5wV5ARB6AmeBDLZPD34WUOCU3RyjxPY2cUosS9MDLwFut8s3GBRF5
         E37iJ8Ftbinxro18LEHGAVgC/LfshmLrgAi+EmWi202SW+wnyu38Oglm1/iuvazYGOXZ
         EFWZnojdBHYeEx9fZw1+K+T4Zndy9wlxhoXEVL/9d09X1gGsUgyUAD+C3lorx6El6FI6
         JCNw==
X-Gm-Message-State: AOJu0YziYq87YA63e6ZsT7Tc2r69lAj8zaZlnkTf44110Jlj0/JCinAJ
	O1UkrPzsBv1qYqOtmBj0mzMcDCYqg5T7vO+84uUOeTjdz+CMbbiogO70bx7j+cx97rBs19N+OyG
	6IAJnpxsC18GirnF15H2hAcsyHbDXJE+xlaDKc8McED2U7KCpXmY=
X-Google-Smtp-Source: AGHT+IHff6ZCZ3a77kNIs1sj3YhQ2PuSoZWxg+6jNDPEOpMuOBgzBIEK6UEkagTBVQCJexujrskf7gcN6CxbhnGJtxg=
X-Received: by 2002:a05:6a20:7351:b0:1a3:6833:1ccb with SMTP id
 v17-20020a056a20735100b001a368331ccbmr1039918pzc.40.1710908418227; Tue, 19
 Mar 2024 21:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sam Edwards <sam@turingpi.com>
Date: Tue, 19 Mar 2024 22:20:07 -0600
Message-ID: <CAF8uH3tRCACX23CyA=M+AYq4YRsf3P97eL=0k8Rdg1UACREY_g@mail.gmail.com>
Subject: [RESEND RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
@@ -753,6 +753,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap,
struct i2c_msg msgs[], int num)
 {
        struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
        int rc, ret = num;
+       u32 status;

        rc = pm_runtime_resume_and_get(&adap->dev);
        if (rc)
@@ -762,6 +763,11 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap,
struct i2c_msg msgs[], int num)
        drv_data->msgs = msgs;
        drv_data->num_msgs = num;

+       /* Calm down the hardware if it was upset by a bus glitch while idle */
+       status = readl(drv_data->reg_base + drv_data->reg_offsets.status);
+       if (status == MV64XXX_I2C_STATUS_BUS_ERR)
+               mv64xxx_i2c_hw_init(drv_data);
+
        if (mv64xxx_i2c_can_offload(drv_data) && !drv_data->atomic)
                rc = mv64xxx_i2c_offload_xfer(drv_data);
        else
--
2.43.2

