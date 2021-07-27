Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFFE3D6CB3
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 05:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhG0Cs2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 22:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbhG0Cs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jul 2021 22:48:28 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E32C061757
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 20:28:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id p5so8317972wro.7
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 20:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorremedies-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=2bNmzYQg8QnqRRqZW4R559oGTAVK4bu+4v+fMAugFco=;
        b=EOPirYMe6Q6w4pNO3IzXVTcjIxkQZ/GXWnYDx/P7keaNztEUFsZVTyZOrI+jgLKO+E
         zAQIRM7OkQ4hGVGb19i0YCJp9mREv7eVaF+OLuDlh/NMJqdYJoyXq5byJRpzwexmVBm2
         U/WDaAhq8suUgHMun/TBUfMqzgKfW728Vf/71xP+WwygGjtHlkTfrZqVCFVomYZnWtGu
         jyDSQ7a1xQE+TX0YpUmVJh13t8kR87lvI+sis8h7I5UykYbZsoo7S5ifcq0SRpAA9LDj
         HH85nL6qEN80LpYYPPKYKg3z8C8ZNebuQ8Axk+jw+fwWdJvJuGaLxQ/7dDBDeR8rn7Ic
         esiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2bNmzYQg8QnqRRqZW4R559oGTAVK4bu+4v+fMAugFco=;
        b=NXwgkxdKQ+9ynG4lFCZNBrI+MHAVup2925B+uOL7GphecSY+2Y2RJSiZHCusfgq9mt
         C8NYf+Z2v0MgbT4oGZ62Z6NScBymJ2Oj6HUZlSjYknrZWb2F/QmxZ8C1FqF7EfCWkoPc
         08zLBqwGH6WAqGUjdpi0kyU8NyAVqAG3EI7Y7v2W4VKtfLiCUy28Ycj9aJkG9BCM5tp4
         dx92t/NM3DwLT8zQbUha5huuFYKH0w3ui7daTo+62NS+0jWsYZYgME5zxbKint0dRui0
         huBQw1ma+TPVyTfUNYi+nkqNcx8neez1wbBDCu+FMUrCX4x50cO3d14Tr1hF5JiDygfK
         FQbQ==
X-Gm-Message-State: AOAM5313S4oY9am84aJyuh/zYJw1+NphnwviR1JXXs4RgGTg5wQw+oxf
        zIsuMB+w8A8eCg112gsk/n7C33AY67REgOFeVXlT7mmtPvZ+IUKR
X-Google-Smtp-Source: ABdhPJxCPsUyhPwhdn3LHbIVfOibe4dC0vCoaojfUYNnhyGpSUwun7rywv8Tal7ycPW0WU6s1i0TYVIP0yhd771wiXo=
X-Received: by 2002:a5d:5642:: with SMTP id j2mr22160478wrw.65.1627356534054;
 Mon, 26 Jul 2021 20:28:54 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Murphy <lists@colorremedies.com>
Date:   Mon, 26 Jul 2021 21:28:38 -0600
Message-ID: <CAJCQCtTB+KW596A1Q+Ds6u9uvUrqeOSmer6qKv7g+xRYijGS3A@mail.gmail.com>
Subject: kernel 5.14, i801_smbus errors during early boot
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Lenovo Thinkpad X1 Carbon 7th gen
kernel 5.14.0-0.rc3.29.fc35.x86_64+debug

These errors happen with kernels 5.11+ through 5.14-rc3. I haven't
tested older kernels.

[    4.138577] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[    4.141533] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    4.141600] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
*[    4.349174] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[    4.349178] i801_smbus 0000:00:1f.4: Transaction timeout
*[    4.352052] i801_smbus 0000:00:1f.4: Failed terminating the transaction
*[    4.352133] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!

* = dmesg paints these messages in red text

Should I file a bug somewhere? Where and what information to include?

Thanks,

-- 
Chris Murphy
