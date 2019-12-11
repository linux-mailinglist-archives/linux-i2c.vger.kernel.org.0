Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D3511A9F9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 12:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfLKLga (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 06:36:30 -0500
Received: from mail-yb1-f180.google.com ([209.85.219.180]:46283 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbfLKLga (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Dec 2019 06:36:30 -0500
Received: by mail-yb1-f180.google.com with SMTP id v15so8865051ybp.13
        for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2019 03:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wiN6b08UYgLplDJgl7dzjPf5zJQxk21YE2KX7JAFuZM=;
        b=GCSF+vs9puFNrNjC3MwkZJOp/g6WeEpPh3qtPJ9hioMpXLaH7Qcr5oTG71ntelz741
         oPtIiPbDZGuzzSUg7o5NtOUOFiqOrc6B6l7FQOZuMZHjCh0wj+OYFk6qQqY7VPLlHqhL
         vfC/YOqCqHuRi6nqrH8y+topSlzFsTRXsHxCQnJ78oTfIgLfb5mVt0Lycu+ZMp6/4GLk
         nQ7f3NcvMnoKMXjPK+Tt/SDKyQLx/EtZOlxuybHTNABHs8J6PKC2gkNNQfIf8/OVJ2gD
         6iNNSg93SDoNDBAT1yRbVKQluFfsDmZYF/AmwBIpcY0gQYZzNZmolranPW9dEfQIDs45
         BJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wiN6b08UYgLplDJgl7dzjPf5zJQxk21YE2KX7JAFuZM=;
        b=Mo8cJVCW5+Corbrs+MMigfsczrRmPiTrFrmdjlrPs0NUfSzEZ7AitiPjytgu6MyQhD
         1AG8xHStsqO2pexkYQ4nOL/iy6mjErq1gtLaFA7/BvBi92rlcaiXuzHyiRP4XDsaESuc
         uTDnuHbbzOn9I36cIWGj7u9egDkUmBJhefgrkPUDHnLfXGyS9aNEomMP/6EBjgyc6GfG
         CQO7xuiujNJlLva0E2A9E5irygZJvYmzpASyKSz2mKi0KnO7F9c8o8vT12oeQctKOFNR
         l8oMcbhMi+1XEugfGzJnsWntYphaGm03HTw/uLUCC+HuXzVbemdKX1aGIbostwn5p4Xz
         Elrw==
X-Gm-Message-State: APjAAAU1iw1QZ6XCir0N9Kil5y1TxoFjLBor9U10XVZcYBk+JqzrvFED
        LHbFYjFy1Il6EBQF71dVxlxo/n4zYyQXl0GYalb1iynkmcs=
X-Google-Smtp-Source: APXvYqw22HbI4wqjFWJs8yzLWgEg+B+wtDXxFGrcr5HL+iI8U53aApQu+YF/WJQhVkLUdqA0N183XN0llLGoV418XKQ=
X-Received: by 2002:a25:b4e:: with SMTP id 75mr2162510ybl.482.1576064188995;
 Wed, 11 Dec 2019 03:36:28 -0800 (PST)
MIME-Version: 1.0
From:   Manish Raturi <raturi.manish@gmail.com>
Date:   Wed, 11 Dec 2019 17:06:17 +0530
Message-ID: <CAHn-FMw9_6DKM++wJCxYAgr+ncT5KKuGJrrf83h2m4FVTKYs6g@mail.gmail.com>
Subject: Smbus driver failure
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,


We are using Linux kernel 4.8 from Windriver. We are facing the issue
with i801 smbus driver which is part of the Linux kernel. In our
system, we have connected a MUX to this smbus controller. When we
reboot the box for 300-400 times in one of the reboot we see the issue
of transaction timeout from the driver. Below are the logs which we
see


2019-11-28T02:52:04.904527-08:00  kernel: pcie_pme
0000:00:1c.0:pcie001: service driver pcie_pme loaded

2019-11-28T02:52:19.609747-08:00  kernel: i801_smbus 0000:00:1f.3:
Timeout waiting for interrupt!

2019-11-28T02:52:19.609760-08:00  kernel: i801_smbus 0000:00:1f.3:
Transaction timeout

2019-11-28T02:52:19.611932-08:00  kernel: i801_smbus 0000:00:1f.3:
Failed terminating the transaction

2019-11-28T02:52:19.611943-08:00 kernel: i801_smbus 0000:00:1f.3:
Transaction failed

2019-11-28T02:52:19.611944-08:00  kernel: i801_smbus 0000:00:1f.3:
SMBus is busy, can't use it!

2019-11-28T02:52:19.612929-08:00  kernel: i801_smbus 0000:00:1f.3:
SMBus is busy, can't use it!





When we connected the i2c analyzer we found that before we get the
above failure the response from the slave was correct. But still we
see the timeout issue.



I suspect that when the transaction gets complete the PCISTS register
3rd INTR bit will be set and this will call i801_isr, somehow in the
failure case we didn't get the interrupt or the interrupt came after
the timeout.



Does anybody else has seen this issue earlier?





lspci output:

~# lspci -vvxs 00:1f.3

00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family
SMBus Controller (rev 05)

        Subsystem: Intel Corporation 8 Series/C220 Series Chipset
Family SMBus Controller

        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-

        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

        Interrupt: pin C routed to IRQ 18

        NUMA node: 0

        Region 0: Memory at 183fff010000 (64-bit, non-prefetchable) [size=256]

        Region 4: I/O ports at 3000 [size=32]

        Kernel driver in use: i801_smbus

        Kernel modules: i2c_i801

00: 86 80 22 8c 03 00 80 02 05 00 05 0c 00 00 00 00

10: 04 00 01 ff 3f 18 00 00 00 00 00 00 00 00 00 00

20: 01 30 00 00 00 00 00 00 00 00 00 00 86 80 22 8c

30: 00 00 00 00 00 00 00 00 00 00 00 00 ff 03 00 00

Thanks & Regards
