Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B816C527A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 18:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjCVRcc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 13:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCVRcb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 13:32:31 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B90C59415
        for <linux-i2c@vger.kernel.org>; Wed, 22 Mar 2023 10:32:30 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id h15so5638231vsh.0
        for <linux-i2c@vger.kernel.org>; Wed, 22 Mar 2023 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679506349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZOSOo/wFtyltX/eswYULH+hN/Oi2WaK2A4o5DDLI7c=;
        b=ksv5HVJQuWJjwP9EGqGCRj0xp2ku2Fdcd1pinrlC5N/yriKKn5LaXTkjL7esHxcQ2C
         P7NmuR3Z+4WaEc2SWkCvVJjVsZkT5e6qpuinefPUKRjeVVA+AlDglh8goeYBjgESBiYf
         uKTzK0ypuLrdrbdTdRYzVTNOR9l4NCnda8Roc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZOSOo/wFtyltX/eswYULH+hN/Oi2WaK2A4o5DDLI7c=;
        b=C/BkDh2P93xs+GREXzfGfDPs3ptfBEtihx9pEJCulwD5Q+E/1HSLFm/TKAkEJ3Rjav
         /10RogPU1R0JoBJrApkk4p4LSCXQKLuiMfCCqKHAh0nCBawDqH8rgivSouobcNIAEJ8d
         QLudmm4mZ+HVbGPT2SI5lIozlE3aOJLcttmNifjxJb8Q17J0A7dp2/7eCzo7MpikZ28O
         9xfo/5HwL2fRSXbAiiH23usIygaq5bf0HGMKUX96pKLarHgrDGmuu9A9/nYHph//uFSW
         ue8GWoGf350gGea2AMPaeKeKvKf16i1/0trW2kE2gmQCIce0hEW5TzhQcMKU2Z38GlHZ
         otHg==
X-Gm-Message-State: AO0yUKWWeZTyZeqUXlNfwIzULgc8bz4s0pEDXauv/roEAvedDF/Fb1m0
        GjwSLcX14EpU0WybO3k7PLFY3RqzbuV+phFniaRznA==
X-Google-Smtp-Source: AK7set8wOK9GFMrgIhi2HWlH2N3N14Glxkdpjg7VA4KlNIgfBG4tEza8mrfXsF7sJozXFCS021xanpgz7psDffZl0as=
X-Received: by 2002:a67:c108:0:b0:416:f1ea:1001 with SMTP id
 d8-20020a67c108000000b00416f1ea1001mr122085vsj.5.1679506349520; Wed, 22 Mar
 2023 10:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230321212822.5714-1-mario.limonciello@amd.com>
 <20230321212822.5714-4-mario.limonciello@amd.com> <CANg-bXANgkrF4T4X_VgeVejA2wH3GrUiFORyRC4AZfgYrE+7DQ@mail.gmail.com>
 <a9993ba0-ddfb-5ed3-c997-e9eea797cfc3@amd.com>
In-Reply-To: <a9993ba0-ddfb-5ed3-c997-e9eea797cfc3@amd.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Wed, 22 Mar 2023 11:32:18 -0600
Message-ID: <CANg-bXCWTM6EMZ_4=B1Phv3DbR8ctXnak1da64j=yji3F2YU-g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c: designware: Add doorbell support for Mendocino
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> So either psp_send_platform_access_msg should return 0 for that case
> (expecting caller to investigate more closely) or psp_send_check_i2c_req
> needs to special case -EIO for more investigation.
>
> I lean upon the latter unless you have a strong opinion.

I'm ok with either, but if you go with the latter, the documentation
will need to be updated in psp_send_check_i2c_req as it states that
-EIO is used for basic mailbox comm errors.

> I would expect ToT should run fine on Skyrim.  I'll adjust as you suggested
> if you can please test it.

Sure! I can test the next version you send out.
