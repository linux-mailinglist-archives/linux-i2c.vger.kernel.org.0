Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045E464B81C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 16:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235998AbiLMPK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 10:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbiLMPKQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 10:10:16 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2628D5FCC
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 07:10:13 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id a16so18126255edb.9
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyLx1VEox9TK82M7WluU2orGwyoAS17PD8gbkH1/ebo=;
        b=H5mYasErDPvFeyI1U99p0dShmX4Z9px12caVBozHtDVORuEbZWk+fm3X3YuW9WQYB/
         tXUUnXE6hinBNdDg6F5yB6f6ROkbi/SB8JeGvHfhWkgo1dYyH37WEy5+KbAs3vBw11N5
         xPS36eaKvCq5RGJ+YBHmnRzzP8yXEDfCpQoBhIZiMZ1iRGIUxU9l2AVS2NGzdEwScXoo
         v3itPKEECx1ntsLdLnqwQPUVY2ZKvitK/U3pl4eqpq36rmDal0eAdK2jkylTUed/fVy/
         FT/KUjwvrvYJvtaiQcKlyxeAjov3qE42SGx/2r4erOhDYGj5wMdDb4W9O4didHgVTWMD
         IV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UyLx1VEox9TK82M7WluU2orGwyoAS17PD8gbkH1/ebo=;
        b=B9WjFkC3GERQX11QWFQlRB1hFNw0xda0xlHaWu4ptF0yDeOErTBlsow949F0m6ks2q
         E6quSzsx/kZXoq4LbC8T/AqU4G7VPDH+gTGQbGyd2xEDMZy3h66UPagUPQCnFdtS1vpU
         eFgwh8mzNzLWJdXQodZ1Jd6O0Alyn/Cp/p1WDInsWNRLlwuQz5phBEBICZ5ACWVYvylR
         /oIh3mwXvaYaz6hdiIMEO6+P4p3Eae2onmyYZxCrwV+5t266HNQ2DGtQlbcMXuSXaS8Z
         EXmIKBJapcmZhhyqWxXAhTlMY3pUOZgxbvBJLweno+xF1jutMxMSU3H8HVw/oHy7e/oS
         56lQ==
X-Gm-Message-State: ANoB5pmQZKRx9xnucghreYVT1VsMF4JHtHQ1OSmo9Q+C7bnQOwF6d56/
        xZmwCtGsxhZ1KfwEJeyyhS83z4Esv1GLHBttp2Y=
X-Google-Smtp-Source: AA0mqf51WjOfzPuD7w90vfjdlhl21ZMg+wy41vV9dE9JjFaEI/6myAwL+tMc0jJVDz1WXCsGpyJpeQ==
X-Received: by 2002:a50:ec8d:0:b0:46c:a3c1:2057 with SMTP id e13-20020a50ec8d000000b0046ca3c12057mr17491633edr.29.1670944211735;
        Tue, 13 Dec 2022 07:10:11 -0800 (PST)
Received: from [10.115.254.166] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090640c900b0077205dd15basm4643738ejk.66.2022.12.13.07.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 07:10:11 -0800 (PST)
Message-ID: <4cab66eb-dcc7-0109-c18c-3bcadda77554@sigma-star.at>
Date:   Tue, 13 Dec 2022 16:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.de, hkallweit1@gmail.com, marcan@marcan.st,
        wsa@kernel.org
From:   David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Friendly ping. Are there still plans to get this merged? Any unresolved issues?

I tested this on an Intel Atom E3827 based embedded board.

I also get this line in the kernel log and everything seems to work as expected:
[   13.095291] i801_smbus 0000:00:1f.3: SMBus controller is shared with ACPI AML. This seems safe so far.

Tested with an application that accesses custom I2C hardware attached to the SMBus.

Tested-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

