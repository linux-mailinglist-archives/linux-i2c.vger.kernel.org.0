Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDFB6C20F8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 20:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjCTTMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 15:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjCTTL7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 15:11:59 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8132228EB0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Mar 2023 12:04:30 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id j6so6989262ilr.7
        for <linux-i2c@vger.kernel.org>; Mon, 20 Mar 2023 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679339054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y1lhyT5n3wfQWF4DTLUL5NVCSEguRHcZuiRjGDyTqU=;
        b=aLl4yhrjpBNSc52hXWEDlw8bCsCQ4Uu1rYanh2yAuA2mW8mR9Msiz2s6mhcGeADaF7
         hQ1vWDJIvtRIUhWT8CEOc7UTby+iQOlZaNBCwKn6gJeHRktpVaxB7MC/f8dbGnIp3cDG
         p+DAzgPQUlbt97S5YEk2CkDUMuQuQhDSKZRhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679339054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y1lhyT5n3wfQWF4DTLUL5NVCSEguRHcZuiRjGDyTqU=;
        b=vMkyYRQrSF2c7jHWGtaLpPIAHCYfQNsz5ZXmIOKkfu1OSsihC0MLhX+aq9Qz36TcH/
         gmDtp4gbEjLMGOzHseAsmWXhsnKeaac+df+k/MOW6IJtOf/dBOwXaCZXPNNXfdLxAw/P
         m77ydrCnVtGJ0PV0XEK4SfN8K0bRUGh+k1fIphZ58ra8GdVrkH7G2HmmmZUov1LQwht+
         93lx0QPyIVYyuHuzCpjTu27wIhKhiJ4ZzjSk7peBfrIDD5vEkycDpB2pH4JTV2matA1D
         QWj4sNvTp1E5s7wAZxHkI4ezHl/3MxSsreQAKfSLdr4xji9c0dVsKsxq9kG3nFqJorgQ
         HiJw==
X-Gm-Message-State: AO0yUKWRztgziAISGP+gup7V4xQrVVtZ+WvXyHEaHGXlH0UUFM5YE3ds
        3dhJR3Tos31H7I7besp7USsOQQ==
X-Google-Smtp-Source: AK7set8U9751Q87rUuTdX/gcMlkl5zWkrFWSy64frKlB2tPdpCN7Lso+LMO9uWPzV+QKyi+xiJHwjg==
X-Received: by 2002:a05:6e02:1a83:b0:315:6f9d:e75 with SMTP id k3-20020a056e021a8300b003156f9d0e75mr5781951ilv.7.1679339054691;
        Mon, 20 Mar 2023 12:04:14 -0700 (PDT)
Received: from markhas1.roam.corp.google.com (71-218-36-105.hlrn.qwest.net. [71.218.36.105])
        by smtp.gmail.com with ESMTPSA id y10-20020a927d0a000000b003179b81610csm2955829ilc.17.2023.03.20.12.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 12:04:14 -0700 (PDT)
From:   Mark Hasemeyer <markhas@chromium.org>
To:     mario.limonciello@amd.com
Cc:     Felix.Held@amd.com, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, andriy.shevchenko@linux.intel.com,
        gjb@semihalf.com, herbert@gondor.apana.org.au,
        jarkko.nikula@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com
Subject: [PATCH v4 8/8] i2c: designware: Add doorbell support for Skyrim
Date:   Mon, 20 Mar 2023 13:04:07 -0600
Message-Id: <20230320190407.51252-1-markhas@chromium.org>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
In-Reply-To: <20230310211954.2490-9-mario.limonciello@amd.com>
References: <20230310211954.2490-9-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Should this function retry acquiring the I2C bus while it is busy?  Similar to
how the cezanne variant works. Also wondering if the function should be named
psp_send_i2c_req_mendocino for consistency.

