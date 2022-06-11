Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288ED54730E
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jun 2022 11:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbiFKJIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Jun 2022 05:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbiFKJIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Jun 2022 05:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DFC526543
        for <linux-i2c@vger.kernel.org>; Sat, 11 Jun 2022 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654938514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=UKTdrjoM1pjQHQQSRU9hrwU6jgT1aB3YmvQFYukRtuc=;
        b=cvXw+J3JoPX61ARhbQsPYPKlZUymDqSvr1+7pjV5Mc9VD6STfK+OkePXuJADCKtRw7U7Rv
        kIGZNoHDdIfzYebicvhMatpZdhJD5ZaPxnHbHdjis8DKiuOCVDZ1LEJvfONDm4GcnG1cjt
        7OpmrdtPO3VrQOxXwPsTpIBIjLYAPhg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-SpbS1qAQMvaRAwc7ML5m5A-1; Sat, 11 Jun 2022 05:08:32 -0400
X-MC-Unique: SpbS1qAQMvaRAwc7ML5m5A-1
Received: by mail-pg1-f199.google.com with SMTP id y63-20020a638a42000000b003fd47b6f280so745334pgd.12
        for <linux-i2c@vger.kernel.org>; Sat, 11 Jun 2022 02:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UKTdrjoM1pjQHQQSRU9hrwU6jgT1aB3YmvQFYukRtuc=;
        b=ub/w182/0bDIWpZVUhKTO1Iy6M3sF0QRjB3Kf0bFzDUw+lZRkAOGuB/aqcWUOy5eIZ
         DnU/S6oke/AA6vpm3vgLbwUDK/XhUvCzLmcGrbgvH8DTZ0ghcw/Sn5ro3HOcD3EK12xb
         fCnGmocnaM1GyznI+o0Aa7ekb7SCSaDR7XYlK3vkyPxCIVYcaCXAqdFU6eDfXm3s3Dp5
         OvrkZMeQlv9H/wGZc9eYBpr8D6Jjcyu5mUHpUQyG/IPUa/btOZldW0bC4zwwM2WIUCfv
         tkdzwVEDJoEIb6pmoOTPpYGJOUOh6iZqb8t9sf0MyIBXAqlrVrbZfmltVAyOiTOH+K/n
         /0qw==
X-Gm-Message-State: AOAM531VCYttPdMiCFht2jPoCcsNRNr3OfCebdLflxFNTYFjd/ohATsA
        dpqrQg+Awz2JUdC3hGkWq1JKJgxKrcVnrUzWlirGdkHNDSCLgluY9R5XBhL3ZcidF6mFoBLDqTa
        0C5IpLM/56IYyY6PWqI9u/P1NTcqZz1nfbKrY
X-Received: by 2002:a17:902:db0a:b0:165:1299:29ea with SMTP id m10-20020a170902db0a00b00165129929eamr49040917plx.15.1654938511415;
        Sat, 11 Jun 2022 02:08:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz8fuSsHqJa4tI3OQEoKeowKsTwsYKk7RHk266hdc59BkhjgBZj3iRVkBb7FPGcSJgc17vuMVV43vPsOpZItk=
X-Received: by 2002:a17:902:db0a:b0:165:1299:29ea with SMTP id
 m10-20020a170902db0a00b00165129929eamr49040900plx.15.1654938511081; Sat, 11
 Jun 2022 02:08:31 -0700 (PDT)
MIME-Version: 1.0
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Sat, 11 Jun 2022 17:08:20 +0800
Message-ID: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
Subject: [bug report] kmemleak from driver i2c_piix4
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello

I found this kmemleak from dmesg, pls help check it, thanks.

unreferenced object 0xffff8882be7fa500 (size 64):
  comm "systemd-udevd", pid 851, jiffies 4294724190 (age 1880.031s)
  hex dump (first 32 bytes):
    00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
    20 95 85 c0 ff ff ff ff 00 02 40 80 00 00 00 00   .........@.....
  backtrace:
    [<00000000ee7a7c0d>] __request_region+0x4f/0xc0
    [<000000000a0d9a20>] piix4_sb800_region_request+0x69/0x150 [i2c_piix4]
    [<00000000bbbc5f63>] piix4_setup_sb800.constprop.0+0xfd/0x4a0 [i2c_piix4]
    [<0000000060da9710>] piix4_probe+0x111/0x780 [i2c_piix4]
    [<0000000061a2fccd>] local_pci_probe+0xdf/0x170
    [<00000000f879d262>] pci_call_probe+0x15f/0x4b0
    [<00000000b1b4235f>] pci_device_probe+0xee/0x230
    [<000000007b0612f3>] really_probe+0x3d7/0xa10
    [<0000000016a94cde>] __driver_probe_device+0x2ab/0x460
    [<00000000fc08f31f>] driver_probe_device+0x49/0x120
    [<00000000c7600ea6>] __driver_attach+0x1c1/0x420
    [<00000000d075fad5>] bus_for_each_dev+0x121/0x1a0
    [<000000003a0c2b72>] bus_add_driver+0x39f/0x570
    [<00000000389c6619>] driver_register+0x20f/0x390
    [<00000000e1871c0e>] do_one_initcall+0xfc/0x560
    [<00000000899e6968>] do_init_module+0x190/0x620
unreferenced object 0xffff8882be7fab80 (size 64):
  comm "systemd-udevd", pid 851, jiffies 4294724195 (age 1880.026s)
  hex dump (first 32 bytes):
    00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
    20 95 85 c0 ff ff ff ff 00 02 40 80 00 00 00 00   .........@.....
  backtrace:
    [<00000000ee7a7c0d>] __request_region+0x4f/0xc0
    [<000000000a0d9a20>] piix4_sb800_region_request+0x69/0x150 [i2c_piix4]
    [<00000000bbbc5f63>] piix4_setup_sb800.constprop.0+0xfd/0x4a0 [i2c_piix4]
    [<00000000ef955e5e>] piix4_probe+0x38c/0x780 [i2c_piix4]
    [<0000000061a2fccd>] local_pci_probe+0xdf/0x170
    [<00000000f879d262>] pci_call_probe+0x15f/0x4b0
    [<00000000b1b4235f>] pci_device_probe+0xee/0x230
    [<000000007b0612f3>] really_probe+0x3d7/0xa10
    [<0000000016a94cde>] __driver_probe_device+0x2ab/0x460
    [<00000000fc08f31f>] driver_probe_device+0x49/0x120
    [<00000000c7600ea6>] __driver_attach+0x1c1/0x420
    [<00000000d075fad5>] bus_for_each_dev+0x121/0x1a0
    [<000000003a0c2b72>] bus_add_driver+0x39f/0x570
    [<00000000389c6619>] driver_register+0x20f/0x390
    [<00000000e1871c0e>] do_one_initcall+0xfc/0x560
    [<00000000899e6968>] do_init_module+0x190/0x620

-- 
Best Regards,
  Yi Zhang

