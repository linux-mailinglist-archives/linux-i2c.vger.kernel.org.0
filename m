Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48C622DBD8
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 06:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgGZEZ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 00:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgGZEZ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 00:25:26 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D8DC0619D2
        for <linux-i2c@vger.kernel.org>; Sat, 25 Jul 2020 21:25:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id w2so7525529pgg.10
        for <linux-i2c@vger.kernel.org>; Sat, 25 Jul 2020 21:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:date:subject:message-id
         :to;
        bh=s9hRPxuMkDeF4iBSMQkvKaHU8SyTlm3fCjHkDhJd+O8=;
        b=Oo6TlwUlMaeqb/GYGkI2b0aMyQPKxqhCXxaHIL4fWoRo4G0bemdvFOh2IySbwukops
         QLF8LLTQZrBuy+bOHsrgORa3BMPTUB8kLrNkzRWs3gaI3PELtxzP2Znnb4LKQcRP8nSz
         ul2LLiUZjIeJv+es2NlFC+6xnSimOioHMXeclUVEKPPuXb5S09dSUrQ3LjsARuV0GS5B
         Zn2+fZTva55+fjrghgaLLPsXCIOswqfjahDlcQG8qNw2WP2dYGUCBDgp8DS6b/y/lcLf
         EOhn0tytWkmGuUJ6iHCJpxIzjxHIjSAJNPMENS/q1j5DjAHhDxNXuEWMvP/P7Xx5zumE
         gExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
         :subject:message-id:to;
        bh=s9hRPxuMkDeF4iBSMQkvKaHU8SyTlm3fCjHkDhJd+O8=;
        b=FFs+dhsRlMhBHeZqhkcGBKZDgyeEhMdg5XWtXc6KU0cx6wVKyGh79wPUCcZth6OvHd
         WV4+3omedXlbqWK/mqf4gFWnFlXb7HQHuopzodU6oL+Fy6qI1RGtBK5d3Aen2JqPkQ0x
         eRsixigTL/eMKu4HOc9HskwFWs0zKg0Lu+O6JshGIqHepx8AfsSua9LmXx3H9ttWVmAE
         gub0HIAamDem/1uZ8d6AZdzGM7wQ/fVlG8/lJtKIa+Nstox+kkDG5tDi39ipQK74DZU0
         eNIXmvm2vhqsR8rkhQ1rsJPqAkqpn3F38GENK2R/Q7rSD/E7a2PSVVT0NBpuvfE+RRaB
         vAzw==
X-Gm-Message-State: AOAM5300dDmQu8Ez2MIOP6MaAIdKZoRx1opQY+WXPCh1+5UgHuSZFl0j
        hP5czkjYaKaRqY+uWWkMiiXbopdNdW8=
X-Google-Smtp-Source: ABdhPJw9bmBThxcBn0eh5opBIaWmunf23/a72YD0eBVkcrE7JUrM05ytHYZbV3JNysZY6/2mUxWAzQ==
X-Received: by 2002:a63:8942:: with SMTP id v63mr14739709pgd.223.1595737525635;
        Sat, 25 Jul 2020 21:25:25 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id a30sm3601989pfr.29.2020.07.25.21.25.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2020 21:25:25 -0700 (PDT)
From:   Daniel Stodden <daniel.stodden@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Date:   Sat, 25 Jul 2020 21:25:24 -0700
Subject: i2c block reads > 32 bytes
Message-Id: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
To:     linux-i2c@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi.

I=E2=80=99ve been looking at a PMBus chip lately.

Publicly available PMBus revisions appear to be based on SMBus 2.0, but =
with relaxed constraints regarding block read/write length:=20
255 bytes, not 32. [1]

Contrasting I2C_SMBUS_BLOCK_MAX=3D32, obviously. Similarly, Smbus 3.1 =
appears to have removed the 32-byte limit=20
for block read, block write, and block-write block-read process call. =
[2]

Now, I'm working with a proprietary i2c adapter. The circuit would =
likewise support transfer sizes way beyond 32 bytes.
And the platform I=E2=80=99m working on has a TI UCD90320 power =
sequencer, which is using PMBus limits

There are workarounds in place, but I don=E2=80=99t find them very =
attractive, compared to a more supportive I2C_RDWR
ioctl. I=E2=80=99m fully aware that I2C_SMBUS_BLOCK_MAX=3D32 is =
basically set in stone. But I could imagine I2C_RDWR growing=20
to support newer Smbus protocols. My question would be whether this has =
been considered already.

Recap: the problem with the current i2c-core is that i2cdev_ioctl_rdwr =
is passing msg[i].len in a way which makes it impossible
for adapters to execute block reads greater 32: kernel msg[i].len =
isn=E2=80=99t user msg[i].len, but set to the number of extra bytes =
initially, so
the adapter driver is left with assurance that 32 bytes buffer space =
available, not how much, if more. I suppose this is intentional.

Also, I suspect I=E2=80=99m not tellying anyone in this forum anything =
new. Bear with me, I=E2=80=99ve made an attempt to find older =
discussions.
But didn=E2=80=99t see anything later than the exchange leading to the =
current handling of I2C_M_RECV_LEN.

Thanks,
Daniel

[1] =
https://pmbus.org/Assets/PDFS/Public/PMBus_Specification_Part_II_Rev_1-1_2=
0070205.pdf
[2] http://smbus.org/specs/SMBus_3_1_20180319.pdf
[3] https://marc.info/?l=3Dlinux-i2c&m=3D133361075928680&w=3D2=
