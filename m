Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9EB41A323
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 00:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237597AbhI0Wg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 18:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237575AbhI0Wg6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 18:36:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49959C061575
        for <linux-i2c@vger.kernel.org>; Mon, 27 Sep 2021 15:35:20 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e15so84225915lfr.10
        for <linux-i2c@vger.kernel.org>; Mon, 27 Sep 2021 15:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=1hwxx7NWj9BAa+v8SAhWzhBWt6N/dK6ljgEuWYMaCm0=;
        b=Za4wER8HSldod43WhowBzn5u4lhKbXEQE5pcS2NGZ6Ub4sXj2UsZDKHH3PaF+mdc2E
         8BNUnSWZNJI+V3DuT1UChVcdBU0Qk2aFhcp4wuE5Ea/F9oNHznam6KraPWduTQ5TESLo
         15w150tJ6LXpF8aYnztUUhCl6JYmbmfPnI8CwdQ93Xi85LKitsg2s8DNDb6vbT0sxkxU
         J8MZAMHEm2nhxCaGhesvzxQTtHr98Mi0WsjXKcthB6odv/6baIezKMn2+6a7aYvTIDd1
         A5VS8utvAJ2XMVb4R/5QiLk6+Ru4D62b9E5ZWeaULzw7EhOgbL9cAdhKS6488Ytd/pke
         t0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=1hwxx7NWj9BAa+v8SAhWzhBWt6N/dK6ljgEuWYMaCm0=;
        b=aP+KNsp2TbK9+CZoGoJ41bo+rMckWgmvvaCJvGrnDuH+dCpxIOuAmxVOxanSdxNQZa
         DEB50trS/rLS5akeouCZr0v5lHjIAu0CBeny2wilB8T2JEdwJKkNhL7CDDy723RPWnpj
         TP9vM5v/bqqjajtOuhTbxFmp6ufaNTg+wefeJWbZ4hhR9lcffghOOJFLuGgdLih1fTj9
         BZKsbXcLQPMDY8VkZCJI67+EKQFIcMcshFRE52jEnTxBvv+Li/hBUzzjLxJ5HXombqDP
         yiTo6YhfuBxeG/c5kO0T1U71pq07+FD607hTLr/hQEgpqwBqyrp43YRgw0VLOX3NDWPO
         zPMQ==
X-Gm-Message-State: AOAM532w+cfAjfhTPYURobzuo7QhtHxhqIkWyp7kGG8j9/SveT03b7ut
        8n1ONoyIJMegIXeURz1mQ+2Ra3ZGQxcIW6fP5qg/vqN61wsnzQ==
X-Google-Smtp-Source: ABdhPJwkD67KMdAz5KbnxdwcVieeULr1TDchTDg1SXfK1yYSwMNUVXkwEeaPeoZdaGGZB0UDvHphTRC/7avNan7V3ek=
X-Received: by 2002:a05:6512:1154:: with SMTP id m20mr2219287lfg.382.1632782118173;
 Mon, 27 Sep 2021 15:35:18 -0700 (PDT)
MIME-Version: 1.0
From:   Sui Chen <suichen@google.com>
Date:   Mon, 27 Sep 2021 15:35:06 -0700
Message-ID: <CAJOps0vipcL=Cx_hbssihjt_V3OTseudpN_R87XKQrO0-gpaxw@mail.gmail.com>
Subject: Add I2C statistics (bus error, NACK counts, etc) as sysfs attributes
To:     linux-i2c@vger.kernel.org
Cc:     suichen6@gmail.com, John Broadbent <jebr@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Ed Tanous <edtanous@google.com>,
        Josh Lehan <krellan@google.com>,
        Peter Lundgren <peterlundgren@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello, linux-i2c mailing list,

We would like to know your comments on exporting I2C statistics
including bus error count and NACK counts as sysfs attributes,
similarly to [1].

We have been using the error counters exported to the debugfs by I2C
bus drivers such as [2]. It might so happen that when other types of
I2C bus drivers start to export those counters to debugfs, they might
use different naming schemes so that that the daemon collecting I2C
counters on a large number of machines would need to parse those
counters using different ways for different bus drivers.
We think it might be good to have a more stable way and naming scheme
for the different bus drivers to report those error counts, perhaps a
fields in i2c_adapter that are exported as sysfs attributes?

Please let us know if there are any problems in this plan.

Thanks!

[1]: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
[2]: https://elixir.bootlin.com/linux/v5.14.8/source/drivers/i2c/busses/i2c-npcm7xx.c#L1540
