Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF1E63C8DF
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 20:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbiK2T7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 14:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237139AbiK2T7s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 14:59:48 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E9C27B23
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 11:59:47 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id vp12so35175437ejc.8
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=kQxcAfqHvb58Fq+PQCA/QJ7nldqCgA1cZrTr8CezUG8TbyQhMhIBIEvl1YdQHGLvY8
         iX26a4ghJKsn2QidgBhSJu2aC/biwcSa3OtaRp/FGqhCcW/VqTy2TdLSY7tB3ih2IOQb
         PGbjSS1AVDj/Whbr7dc2T3QcOW+dGU2vCoC6pO3rAyETIe3zLXh3BLuns9IcMnWnvKDc
         ISyzXgZKjmwwVilaGSc0p4ZOOJAUKHh31VGpcRW0iB48DuvSOi75utW0ZAi5b0JTJEJp
         KR0KwduSlImaQs5D/7Yin2NkSxFijKPfCGunzNXE1GYsoDK08iKmWiRSNWY63hR8aFHo
         Px8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=75DxvIHmqw03UuI12PFmlQAq5ANpPJY9MLcOOacGrlPJ2JguokZSXiAPckB4FOYXyW
         mSvb/P4Vhi8HiNLaFD9pWt9Ltn5iTjQmKvriiR3tw79DVIL6VXj4W+4GV/FTSclo+nu2
         0qRPF0gr1gOsBpzsfUiTqP8y0zldc2K2cWb7cIJD9K3/lGUr4ujKwE71xf5np3q5c4Y6
         pl8LjYX1bQr7voj4UwhUAoY2L4sRgbGsfAf/0NeKlXYXaQslUiqgqaFtkCvEJIsNkXzm
         EgXP35WxD2zQsqP61FNVUVmYT4cEMrneGMA0B8eFpD56e7GmhB29TfTYj8IDYpVqIeZv
         zoRA==
X-Gm-Message-State: ANoB5pkbk7TLTiXvzeaK5pg4PMR/Xx+yZIfKxzDrE/yx0l7hw0SznJOV
        R42MKGQTaNy9yS/O3uXVGKMdFKe3JERKJOxcxMA=
X-Google-Smtp-Source: AA0mqf4pYzWDuEEFN7SJagouAE2SufEDgwnxXCx3VCMNklx2jS/4jVkrU69gyz2n6nocQ7FgvvrpxhQsAMnyTQbXxtc=
X-Received: by 2002:a17:906:a107:b0:77f:9082:73c7 with SMTP id
 t7-20020a170906a10700b0077f908273c7mr32670943ejy.517.1669751986329; Tue, 29
 Nov 2022 11:59:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:9f02:b0:7b2:71f8:d968 with HTTP; Tue, 29 Nov 2022
 11:59:45 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <kojofofone00@gmail.com>
Date:   Tue, 29 Nov 2022 19:59:45 +0000
Message-ID: <CA+5DqwAsXYad_=4NQ3EJhQ1TOKUbCkSh89_qwiJ3t-QESmAL1A@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
