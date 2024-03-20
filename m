Return-Path: <linux-i2c+bounces-2416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78007880923
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 02:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 872BB284469
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04F37489;
	Wed, 20 Mar 2024 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="Y6EvZAtu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC56FC3
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898855; cv=none; b=QQfdFS2Gor2IlFRVp2IKW+j0+6ZaLnzMSjkGXUJxcdznSlEIa79hpqUJgGzoMVCbDP9r6i/gJnB6A2IjF/EZIyFlJj1bi3Pmig1R8oYnvl5QLRdmzjuYNjkqFODK1fbSU70wzbFIIbiH9uwgurcw4u1ovWE0MKNC4h9E86/JrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898855; c=relaxed/simple;
	bh=AlHcQ5+OyNrhln8qRSjk1bvDpkqkBiYYbwAB6xqt4+U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=V2Nfq/Pr34pUktfTRomaPTa6vAtEz77sdS0IE9UU/7dIW14GX42nurfo0B9G7U1Qfu+vhEX0uw/taaY1luO2ICN/UR6NtBHj8BKmX/eENt3ybmqeVzedU3CRKt/mT0M+y8Hc4llUxewU0Qh/RicYI3I9pNrUPNmS0i6ziT8BDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=Y6EvZAtu; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c810b04bc0so195566139f.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710898853; x=1711503653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YVlKZDiXpSh6l4wtgrXlbABB0JfIVAjBVE3CFruQCI=;
        b=Y6EvZAtu3TE26tuqf9EQ5/wxvnnzeK2qHoHHD0Jg0plTjK3e+SqRUct7pn8FQvw60e
         BtPZnJRyDj0cZGVMCYmt8lF/3YoUs0KT76fMQWCBSzAYu8BH6vBq3lSMu4wMQYw7TFZ+
         rt5gFf9Omm2/z4OK4RjMA1gIjLmcPUcgAo5UG0EONWdqnOqEyCUtkeEmZ3viYaD3Ie7G
         xElTleJnNjz/lDQcqzyMhHt9gdpV4+FGffRTyz7jnkB9T575fO4THgyKkjSRtJORFNIq
         gVWgKWACVqIybtCyYXrBpNjLGS3cV/CO7eIRy77ZIMOB1Awf7jJxS3aRxwvwfvhMsVfS
         9Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710898853; x=1711503653;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5YVlKZDiXpSh6l4wtgrXlbABB0JfIVAjBVE3CFruQCI=;
        b=rRB3GgwXz2Ol83dVEJgyHVftkwOujgSao3VUw4NTBGuUoglwnfQwPPsjSjM+H4FhYA
         HEYhVLfEBkmrixVSci7hEFTYWuOxsTYoIIa089UMPNITB1JnbOBjcmxId06pR65NWAFP
         9bXJZott4PdnmppWA1xTl7rFj3hi1WLCQcutYql1aVM4K6rj+QyIgtHpmPt/4PCTdO3x
         EGdqqnmt/9/4QgOA/9gkIbGv/mWDPf2yIw9tg13W/F+rYz/JNiGO3xdwxF9hO5mpp9Se
         HaJPatP7lrpXf3gRigihZADxGTcpDHTkGsCEWNKkYnL1XJGfW4R/DChnvGa3PHhqCAAf
         sKaw==
X-Gm-Message-State: AOJu0Yy74ESbkFsSZ6GomwQMvnMUx+suvb5BVlg8TQJIoVEHmlM04k8P
	6PGEq7H9USZWyDjPhTvXVxPFuHB4Fxgj1OgYaMZrOZDY/3TZkurevHqKERijp4M=
X-Google-Smtp-Source: AGHT+IE0gka+wC4g9ifWqSH4OvfxJGVy/J4/EkRnW4cguiAdgs8KpHZvDRqrB/guUApTlbZ1QKSdfw==
X-Received: by 2002:a5e:9516:0:b0:7ce:ed26:2216 with SMTP id r22-20020a5e9516000000b007ceed262216mr4885710ioj.12.1710898853072;
        Tue, 19 Mar 2024 18:40:53 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id y19-20020a6bc813000000b007cc028ce258sm2632845iof.36.2024.03.19.18.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:40:52 -0700 (PDT)
Message-ID: <7d56dc43-2cc8-4801-86f2-17fe483fd711@turingpi.com>
Date: Tue, 19 Mar 2024 19:40:51 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <sam@turingpi.com>
Subject: [RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Salutations, Linux I2C team!

I am working with an Allwinner T113-s3 based board; the internal I2C bus of
which has a Realtek RTL8370MB-CG Ethernet switch coexisting with other I2C
devices. The RTL8370MB-CG deviates from "conventional" I2C read operations
in that it expects the hardware register after the addr+read byte before it
turns around the bus to send the value. For this reason, the `realtek-smi`
driver currently implements the protocol via bit-banging. However, I am 
in the
process of developing a separate patch series to promote this driver to a
"full" I2C driver, leveraging I2C_M_NOSTART to support this odd read 
operation.

In anticipation of that, I am preparing this series comprising five 
patches to
improve the functionality and reliability of the I2C adapter enough to 
support
this kind of device. I have heavily tested these changes on the 
Allwinner-style
mv64xxx core, but not the Marvell-style, and have not been able to test 
10-bit
addressing. I would greatly appreciate if anyone here could test this 
series,
especially on non-Allwinner boards and/or boards with 10-bit devices.

I'm a bit skeptical of using I2C_M_NOSTART for this purpose. The driver does
not (and cannot) support "just any" use of I2C_M_NOSTART, so it may be
inappropriate to claim the I2C_FUNC_NOSTART capability. On the other hand, I
searched high and low and couldn't find any use of I2C_M_NOSTART that
*wouldn't* be supported by this change, so this could very well be 
exactly what
clients understand I2C_FUNC_NOSTART to mean. Given that the alternative 
would
be inventing a new flag ("I2C_M_READEXTRA"?) and figuring out how to supply
input bytes and output bytes in the same i2c_msg, I opted for the NOSTART
route instead.

I look forward to any feedback, bug reports, test results, questions, 
concerns,
commentary, or discussion that you can offer!

Best regards,
Sam

Sam Edwards (5):
   i2c: mv64xxx: Clear bus errors before transfer
   i2c: mv64xxx: Clean up the private data struct
   i2c: mv64xxx: Refactor FSM
   i2c: mv64xxx: Allow continuing after read
   i2c: mv64xxx: Implement I2C_FUNC_NOSTART

  drivers/i2c/busses/i2c-mv64xxx.c | 430 ++++++++++++++++++++++---------
  1 file changed, 302 insertions(+), 128 deletions(-)

-- 
2.43.2

