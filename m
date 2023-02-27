Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359516A4FA4
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 00:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjB0X1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 18:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjB0X1W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 18:27:22 -0500
Received: from a.mx.backsla.sh (woi4u.backsla.sh [213.239.218.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F6B21299
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 15:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=backsla.sh;
        s=submission; t=1677540439;
        bh=Y5mQqGV6qNaCwiXX4qLXmXQlDKgjBjVwSJRurTUERS0=;
        h=From:Date:Subject:To:From;
        b=b29maHIqvSloQ3cQXSDtCcYp8Di9dj7FxVoQec5gPn6V5X+ct5aHzb7As8msN2jPN
         tB6jUcSSqldD4cdqZKYer4ZwahSeFmoNTJI3wU8tFuj7g1JWhzUjx9zKLKax7CEcof
         QXu78vYmghUgzgkGd9Gu53PE2nm5GtU546oX5JGU=
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
        by miranda.backsla.sh (Postfix) with ESMTPSA id EE8BBD300A2
        for <linux-i2c@vger.kernel.org>; Tue, 28 Feb 2023 00:27:19 +0100 (CET)
Received: by mail-wm1-f45.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso3695953wmq.1
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 15:27:19 -0800 (PST)
X-Gm-Message-State: AO0yUKWemLJiF4A8v+903X9YW69T93wXO0Wm/fZoMX+vZq4gLab/uxIJ
        52DkaaATOYrmiWZuj2/iSilHdI1YC1JfFuSyj0o=
X-Google-Smtp-Source: AK7set+Fh8n+Vble5L+w/r32e4AiiqRJ9YtkoU55RNPtk8okeDZKwlnvUHvM5RvHMrFeZBii937eM+l3IKSWXw3E3+o=
X-Received: by 2002:a05:600c:54ce:b0:3df:97de:8baf with SMTP id
 iw14-20020a05600c54ce00b003df97de8bafmr228204wmb.8.1677540439641; Mon, 27 Feb
 2023 15:27:19 -0800 (PST)
MIME-Version: 1.0
From:   Robert Siemer <Robert.Siemer-lists@backsla.sh>
Date:   Tue, 28 Feb 2023 00:27:03 +0100
X-Gmail-Original-Message-ID: <CAERis3zY_ix9r2baeE0Or46oceVOc-W675+gDbk-wfSLVCkg=g@mail.gmail.com>
Message-ID: <CAERis3zY_ix9r2baeE0Or46oceVOc-W675+gDbk-wfSLVCkg=g@mail.gmail.com>
Subject: i2c-dev hogs CPU
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello everyone,

There seems to be something busy-waiting or inappropriately
busy-polling somewhere below /dev/i2c-*

I use i2c-dev to fast control and react to changes in monitors over
their i2c connection. And despite it being peanuts data-wise it brings
the CPU to its limits.

I wrote this simple python script to expose this (below). On my setup
it pulls in 4.5kB/s of data over i2c and brings a core of some 3.3 GHz
CPU to 100%. And not just the number, its fan starts speeding up as
well.

While I have this i2c bus offered via the radeon driver which seems to
use i2c_algo_bit, a friend has the same issue even over this simulated
i2c bus from the amdgpu driver for a DisplayPort monitor (I use
HDMI/DVI).

Any input on how to isolate this problem or even remove it?

Thx,
Robert

PD: pls keep me in Cc:

#!/usr/bin/env python3
#
# script.py <bus-number> <slave-addr>
# I use it on any monitor bus with addr 0x37 or 0x50

import fcntl
import os
import sys
import time

i = os.open(f'/dev/i2c-{sys.argv[1]}', os.O_RDWR)
fcntl.ioctl(i, 0x703, int(sys.argv[2], 0))  # CPP macro: I2C_SLAVE = 0x703
while True:
    start = time.time()
    b = os.read(i, 1024)
    duration = time.time() - start
    print(len(b), 'Bytes,', len(b) / 1024 / duration, 'kBytes/s')
