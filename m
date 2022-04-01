Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B8D4EE556
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Apr 2022 02:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243138AbiDAA3C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Mar 2022 20:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242832AbiDAA3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Mar 2022 20:29:01 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAA923FF00
        for <linux-i2c@vger.kernel.org>; Thu, 31 Mar 2022 17:27:12 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2d11b6259adso11559047b3.19
        for <linux-i2c@vger.kernel.org>; Thu, 31 Mar 2022 17:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ajRe3xml6x6TIHxlNyRSouJyjrQRi/5ANmvvr78T1RA=;
        b=XfEzhDsPaKMplT2gcU82amGS+tWMOKVhIV/IP3TgmzuwF9EnVaWO/5T9GVdFCvZC2e
         sK/XQqCaDq78CdX8XqxI9ig275iDHA17rLmnx4d5P2cNCl5gYlHlxkXegCSh5NRNRCYa
         GNkcTY5fDZnzRejLhVqDVV3rfvGHu9tA4oEnrIa86IT9JZ13w47JEoU96r7DPX9X7pRH
         /nwjIR3pFmdnTHnlf3Ri+DiLjdPbdW198cjVxdZ4719H5o0HY2kcDuO9zzZgXX7J4RA8
         EOi/Gn+IF/7/GUQFgCYofi6C5lB886/dVB/9RPzDaSUr4mNA1MUQr1h7EBBbOI0cs9qS
         K2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ajRe3xml6x6TIHxlNyRSouJyjrQRi/5ANmvvr78T1RA=;
        b=mxKSa9sYD43YLPBuLQODKBoHl9e3oSyhEZW2aSONL5AAPk6qE9kT+2Ifq0u808XtI+
         kV/d9Z8m3Tp7fYB4cPUHcikZjDGmVgeJvWO25ve/xMTMjKoorq0ughgRK5KK7d7oKij4
         ZVe4OlcYYyJoXbBEx4Nr9dDxFywnx/NW2QVtvxcN5JXSkhoMbbPnjziKS6yhAfexNQqY
         +2T8y+/Of8jRtlTS+Zy/CJa53IL5L/4vYScrZzRSdlD2WJIEM2qc6Z1d+xeyKnlHy6m9
         0Ovx/DJ1pKhOCGXwebbXYElmFLvRAd/ucdzJoJkucc05uIr193cWfl+sYIQq2tsi5ZFY
         Nd1g==
X-Gm-Message-State: AOAM533H63DNYWs1VYHCCUrJZCKrOfDpN5pZZ0qNHh4LlLpCG6vZD4X7
        0O1DJFNbb2KpTrZkslq63+DTkJxQJZxeP63vTfWQmTRqaSAtyUjUa3TnAPe0n7KhFgHOWigJH0x
        yPaklsIhOALZ2eyRGrz8Zn3XvZatJ1eCnN42JyRlK2+JKfV5nZk0eAwm1uNUD1XeFIAMd
X-Google-Smtp-Source: ABdhPJwKAM9KrL/ylYBQgAeHo7R6yNx8SLVIk6ATj14VdBL8QxwdOcBKu0pnz0ACZMiZaRma56CNvdQ1V3dA
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:e046:decd:d8b3:41f0])
 (user=suichen job=sendgmr) by 2002:a5b:801:0:b0:633:eba2:8414 with SMTP id
 x1-20020a5b0801000000b00633eba28414mr6623672ybp.119.1648772831655; Thu, 31
 Mar 2022 17:27:11 -0700 (PDT)
Date:   Thu, 31 Mar 2022 17:21:59 -0700
Message-Id: <20220401002200.27584-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [RFC Patch v4 0/1] i2c statistics as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com
Cc:     Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change renames the I2C debug counters as suggested, and moves their
processing into the i2c core:
- bus_errors
- transfers
- nacks
- recovery_successes
- recovery_failures
- timeouts

Did some brief tests with a few test programs that saves/replays I2C
trace by reading hwmon sensors. The test program and hardware run in
QEMU. The test programs are located at
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527

(A normal read)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
264
root@gsj:/tmp# ./i2c_bmk_bmc  0
idx=0
Processing 1 inputs
/sys/class/hwmon/hwmon0/temp1_input
(../../devices/platform/ahb/ahb:apb/f0081000.i2c/i2c-1/1-005c/hwmon/hwmon0):
0
[FindTraceEntries] t0=391.000000 t1=393.000000
Found 4 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
 i2c_result: i2c-1 n=2 ret=2
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

(Read from an inexistent address, NACK)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
6
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

root@gsj:/tmp# cat i2c_trace.txt
 i2c_write: i2c-1 #0 a=0ff f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=0ff f=0001 l=2
root@gsj:/tmp# ./i2c_replay_bmc i2c_trace.txt
(program runs and finishes with 6 errors)

root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
12
root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
265

The program makes 2 attempts, performing 3 I2C operations at each
attempt, which translates to the 6 nack events.

We will do more testing.

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 32 ++++++++++++-
 drivers/i2c/i2c-dev.c       | 94 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 26 ++++++++++
 3 files changed, 151 insertions(+), 1 deletion(-)

-- 
2.35.1.1094.g7c7d902a7c-goog

