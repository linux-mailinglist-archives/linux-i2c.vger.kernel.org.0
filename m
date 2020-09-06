Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F1B25EDE4
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 15:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgIFNBp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 09:01:45 -0400
Received: from eu-shark2.inbox.eu ([195.216.236.82]:55004 "EHLO
        eu-shark2.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIFNA7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 09:00:59 -0400
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
        by eu-shark2-out.inbox.eu (Postfix) with ESMTP id AF5E1334677;
        Sun,  6 Sep 2020 16:00:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1599397253; bh=id2FYQ/su5IaCZ4nBxBdcSkTcyKP5zQWzkB81aFhy+U=;
        h=Date:From:To:Cc:Subject;
        b=rEt0pDLP6b6KEHL0AE4YJ7JZ+NWGGs3NKKPVAUaqXZAXCgSKJHzbw8mkdF6tCByxg
         DhH7FrKuUS+Q0xE10BrLMSQhwrASfxQhNBVLJpwWFQt+cMWCxxNMRLoQF3yAAysbGB
         MwcCSIXz3PjjyPXunC+WytZ6AgskzRzEgV6pbZ5w=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 92DE4334675;
        Sun,  6 Sep 2020 16:00:53 +0300 (EEST)
Received: from hp15 (unknown [185.176.221.195])
        (Authenticated sender: arzamas-16@mail.ee)
        by mail.inbox.eu (Postfix) with ESMTPA id 006C21BE072A;
        Sun,  6 Sep 2020 16:00:52 +0300 (EEST)
Date:   Sun, 6 Sep 2020 16:00:47 +0300
From:   Boris Lysov <arzamas-16@mail.ee>
To:     linux-i2c@vger.kernel.org
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com
Subject: [RFC] i2c: i2c-mt65xx and DMA on MT6577 (compatibility issue)
Message-ID: <20200906160047.7c5fb42f@hp15>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: OK
X-ESPOL: 885mlYJLBD+jjECjQXrABA8ys1k6UZGD55TE3V0G3GeYQiOHYg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I ran into the issue with using i2c-mt65xx driver on MT6577 hardware.
Device tree documentation for the driver says "reg" property requires 2 add=
resses:
> reg: physical base address of the controller and dma base
Physical base address for MT6577 is 0xC1012000, but AFAIK MT6577 does not h=
ave
a DMA base dedicated especially to I2C.

What value has to be used as DMA base on MT6577?

For the sake of example, I did my own research and checked other SoC listed=
 as
compatible in dt-binding doc. I compared the source code of Linux kernels f=
or
devices based on MT6589 and MT6577. See example below.

MT6589, Lenovo A820: https://github.com/jawad6233/Lenovo_A820_Kernel
There are IRQ IDs defined for I2C DMA:
mediatek/platform/mt6589/kernel/core/include/mach/mt_irq.h (line 47)
> #define MT_DMA_I2C1_ID                      (GIC_PRIVATE_SIGNALS + 62)
> #define MT_DMA_I2C2_ID                      (GIC_PRIVATE_SIGNALS + 63)
> #define MT_DMA_I2C3_ID                      (GIC_PRIVATE_SIGNALS + 64)
> #define MT_DMA_I2C4_ID                      (GIC_PRIVATE_SIGNALS + 65)
> #define MT_DMA_I2C5_ID                      (GIC_PRIVATE_SIGNALS + 66)
> #define MT_DMA_I2C6_ID                      (GIC_PRIVATE_SIGNALS + 67)
> #define MT_DMA_I2C7_ID                      (GIC_PRIVATE_SIGNALS + 68)
There are DMA address calculations for various I2C busses:
mediatek/platform/mt6589/kernel/drivers/i2c/i2c.c (line 1135)
> i2c->pdmabase =3D AP_DMA_BASE + 0x300 + (0x80*(i2c->id));

MT6577, ZTE v970: https://github.com/dragonpt/Kernel_3.4.67_KK_ZTE_v970
There are no IRQ IDs defined for I2C DMA:
mediatek/platform/mt6577/kernel/core/include/mach/mt_irq.h
=46rom line 80 down to line 92 there are DMA addresses for various subsystems=
 except I2C.
And there are no DMA address calculaltions either:
mediatek/platform/mt6577/kernel/drivers/i2c/i2c.c

Please point me to DMA base I should use on MT6577.
Thanks.
