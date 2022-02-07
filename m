Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E864AC9DA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 20:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbiBGTr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 14:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236777AbiBGTpf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 14:45:35 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470AAC0401E0
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 11:45:35 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id d8so12291251qvv.2
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 11:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=DMauDMc5TSXIXiB8XhKeO+orLbY/vKJu7K/SYnFChG8=;
        b=GWblUf9RSFdaoJNJI+86wq8qtFBAeGNZJNH9OuK30xYa9mAD1Cjn5pIdKc0qtz+yTM
         UQuuAJIIuoglIHelnNAOSGc7+jwabn0jE0WIXHCeVcpSmxQkLUgwJ+sSjPQyDPoXXtN/
         WHkl6qYeJQiCAhDTU//ne/Sf/Hp+IIMV48sbvtpXimMD3hXL0Ep8C9FBupqhTLQkDExE
         Akmi6VJCxTpvwgmbUdtEO3owu5iXwabHd6/j4kRbNa6qWr4ZxOmCdJnnEURlDSb/A8JI
         AZQqR/No441YEIAFZbs8GW4sR8qJWgz4A2mISjUvcwV9xwP/kHn1DcHN0lcXI6xr/kJu
         5S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=DMauDMc5TSXIXiB8XhKeO+orLbY/vKJu7K/SYnFChG8=;
        b=CIndOd6OmQgOYCSzZ5eP3gKmIXUoOlsD/O170S+93pXH/gaTFdD2dMMYQCYq5+0xd7
         BKfearSBXpsFVR3Ry+v9LiMvdalpK2fg39w4+qd1Fjq2Ql1oWO2MmF/g06mM+G6IvLGQ
         ZHbI1EPk/AKrCEbJYT43AmGTxp8D9iAUNi43ANrskqPw7fX0yLpDK5zHq+EQpuuArnMu
         wLCuIj6Qmwgkq2JH3qcFgIgkbVFbNhhSjRT3+5IDFsyZEKB0Z/Xj5WsxeThbq2gf+kBe
         9ubNWqpiOXhulQ2XQTmv9pB71yrdE+egNhg8S34PcF1g1690TkAVF6iHjlw/L4FBuvle
         gNdg==
X-Gm-Message-State: AOAM530tLnkNDvm4uvZhwMxO7kFc25ZLObhyTKIBfDw4O+sFAjeWZhFR
        xXHn2CmgGuF81TBymT4RDq/pMp22QFbDRQ==
X-Google-Smtp-Source: ABdhPJyHXSRyqeE9rPO314F+wi7vAMCZfgkO3Rzrn16A7k49KyA93HmQy50W1xvPPvzZlpa6MaZe0g==
X-Received: by 2002:ad4:576e:: with SMTP id r14mr879870qvx.47.1644263134228;
        Mon, 07 Feb 2022 11:45:34 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id bi11sm5580026qkb.18.2022.02.07.11.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 11:45:32 -0800 (PST)
Date:   Mon, 7 Feb 2022 11:45:21 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Derek Basehore <dbasehore@chromium.org>
cc:     Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: 5.17-rc regression: X1 Carbon touchpad not resumed
Message-ID: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

5.17-rc[1-3] on Lenovo ThinkPad X1 Carbon 5th gen: when lid closed
and opened and system resumed, the touchpad cursor cannot be moved.

Some dmesg from bootup:
[    2.211061] rmi4_smbus 6-002c: registering SMbus-connected sensor
[    2.263809] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    2.291782] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3289-002, fw id: 2492434
[    2.371377] input: Synaptics TM3289-002 as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input8
[    2.380820] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
...
[    2.725471] input: PS/2 Generic Mouse as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/rmi4-00.fn03/serio2/input/input9

Some dmesg from resume:
[   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
[   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed to read current IRQ mask.
[   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
[   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
[   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
[   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
[   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6

Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
("i2c: enable async suspend/resume on i2c client devices")
and reverting that fixes it for me.

Hugh
