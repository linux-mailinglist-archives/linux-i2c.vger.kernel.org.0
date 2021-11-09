Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D3D44B91D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 23:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235437AbhKIXAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 18:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236673AbhKIXAf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 18:00:35 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C72C04FD85
        for <linux-i2c@vger.kernel.org>; Tue,  9 Nov 2021 14:54:04 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id b126-20020a251b84000000b005bd8aca71a2so1029996ybb.4
        for <linux-i2c@vger.kernel.org>; Tue, 09 Nov 2021 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=fqkBKrDgG+U2J0jLPhfOG5/umxYft29Uz1Bp7bFqlU4=;
        b=gaizNiw45AQlsLUXXmDt2Z841rK7YK6dEfm5VUXvm3abRCI+G8ZqrXQWuNbZFwSTmh
         XDzZI4SMXh1Kl1WuBipnZdUMW5smsEdFRI30aJdHi4uxTjC51z/SGOAdP3IDilh5sA6s
         /sSmu2/cpqoRmeJbNXVj0ei5YxIaGqfnnBf6LzmJqATWgWiIW0Xra422ZhbB2T5p60li
         5XlCkM7OAc8IKhtaC9Kb+KTV20K8CJaIJEenVStxz2lj1egMVnF1gWjvufv0elFOFJm6
         vQmvqmQak8AO9ZWg2dxaMsYd7YJHpDNagF8ZXUXIP8LumSzCYBbzUn5cgxHU9PfXEk0+
         9RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=fqkBKrDgG+U2J0jLPhfOG5/umxYft29Uz1Bp7bFqlU4=;
        b=S2nEJOFdfIq0frRKh5Sd2PpY8ZmQSoJAX7BxQyUg5Okk52vcF67CevNKKz6qZEF6mZ
         3MdcGBwNckLSJ50s7rwIeN44LkbefHsHso3ajL10nJxAwxmcnDX1SiBs7mSdr9Gw7rB2
         BwNEIHX/va9Er0dYq6MD94kKyKvEfCYHsoXzkDsrfewyA7/LQOxoLjeUIOsKnfkDstRx
         tW/A+Rps2Jne1xTckO5v9YicrVUtz2AJVtrjyzQmM+SfxIqF+MmI33vN2bPW1K0ghc+e
         utnnplkqUXOlGhEE+1aRjy8ItC0yjvcUGBnYFYaBU9I0H27X0C/EuYwaCczQRnOB3brh
         h7Rg==
X-Gm-Message-State: AOAM531ysGR5+XT7lAvLvxq9eLauHahk1w82x9YhNX/5J7QQU61uu9Td
        kjjtU36Yo2Oa2f48BY1etN0YaY2X13q8
X-Google-Smtp-Source: ABdhPJzNKPj7oPovvEeYQf8vpEbvDToEAPKuadIbnxVFDOySdOXin+j0m8TstBdNk2fD9endANDJ4D0MzBGV
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:7559:12f5:de29:c918])
 (user=suichen job=sendgmr) by 2002:a25:e6c5:: with SMTP id
 d188mr12102876ybh.217.1636498443089; Tue, 09 Nov 2021 14:54:03 -0800 (PST)
Date:   Tue,  9 Nov 2021 14:53:19 -0800
Message-Id: <20211109225321.618688-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [RFC Patch Resend 0/2] I2C statistics as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Sui Chen <suichen@google.com>,
        OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Tali Perry <tali.perry1@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add I2C statistics such as Bus Error counts and NACK counts as sysfs
attributes.

I2C statistics such as bus error counts and NACK counts, are
implemented in many I2C controllers.

Some drivers already populate the counters in debugfs. Having those
statistics in sysfs can enable for a unified definition across various
I2C drivers, make the statistics more ABI-stable.

Overall the patch works in the following way:
1) A sysfs directory for I2C statistics is created for an i2c_adapter.
2) Each specific I2C driver can optionally instantiate each of the
statistics individually.

Test Process:
1. Clone the OpenBMC repository
2. `devtool modify`and apply patch to the linux-nuvoton recipe
3. Build image for quanta-gsj
4. Build QEMU
5. Run the image-bmc image in QEMU

Results:
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# ls
ber_cnt       i2c_speed     nack_cnt      rec_fail_cnt  rec_succ_cnt
timeout_cnt
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# cat *
0
100000
0
0
0
0

Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

 drivers/i2c/busses/i2c-npcm7xx.c |  8 +++
 drivers/i2c/i2c-core-base.c      |  2 +
 drivers/i2c/i2c-dev.c            | 98 ++++++++++++++++++++++++++++++++
 include/linux/i2c.h              | 26 +++++++++
 4 files changed, 134 insertions(+)

(Previously sent to linux-i2c, resending to linux-kernel with
CCed correspondents)

CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
CC: linux-i2c <linux-i2c@vger.kernel.org>
CC: linux-kernel <linux-kernel@vger.kernel.org>
CC: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>
CC: Tali Perry <tali.perry1@gmail.com>
CC: Benjamin Fair <benjaminfair@google.com>
CC: Josh Lehan <krellan@google.com>


-- 
2.34.0.rc0.344.g81b53c2807-goog

