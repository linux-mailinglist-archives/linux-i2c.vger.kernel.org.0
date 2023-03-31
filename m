Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2956D28B6
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 21:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjCaTed (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 15:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjCaTec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 15:34:32 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F49A2707
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 12:34:31 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id cu36so20068137vsb.7
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680291270; x=1682883270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5aI4zIcRoRLxHWt+SS9DifZOEmMBwiP2WMG4ZM+Us0=;
        b=GBvj2VVzqcz8cM1eZWgTv9CGJbCh3zsVEDpjDHXkTESlN0fjtf99vxFgjC7OHKg3xK
         H4JCfx5akPv1CZRSefFIb7I885BGidHlru/Ddntd6dfR7S1DLZVhd5wIHsq4TSG446sp
         RhyGidbX74IyLJo3hc79hGmAzBWGNfFt6e4do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680291270; x=1682883270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5aI4zIcRoRLxHWt+SS9DifZOEmMBwiP2WMG4ZM+Us0=;
        b=1jUdRvtLnDZMurejOoEi6En8EAnb/nqpYLnIzQ6/rAjlImf5Dj1iKxOdXLZWzqqRRe
         CqCoVjSEdNQJX3/xB5Xj2dLQycGgXzjW4ObfJ/KNN2lh1tYNmM9EmZqBOC8iRa3xnJHW
         KXIC6S+WVvyxRRtC3HXTiu181GoWv0yVqtF4pWnZYTxA6Q4waOGGJOBiv57ivk88ox3C
         F1yaGzICGknapVjEdQWDFmF4qAwV9JznNBwR18l3meTdjCYADBQPamubw8lTgBtaIvRp
         Ike+oSndgdWbwXf6R6EMZdsFCydYCpHhKbgK+l4L71hRqzS0Y31kuJ9rQkZk9HvK65Ux
         ZKrg==
X-Gm-Message-State: AAQBX9dnLxJxcF5pQcpMHyeo0Zift+W6M9cbj0ErDVXWNRCc5d5yEylq
        ZVkmgpNJXnwjcy7wtEnRmoa2MYOsA6iGycLBwYvZ1w==
X-Google-Smtp-Source: AKy350avAB5zM9H9xCzxvaea8vrZmf27YUrlGiTRyv7e4+dWXsw3Sz6xg7dkenWal9cIF2zXy/xEIE/sEnOmr8Fg7YY=
X-Received: by 2002:a67:e1c4:0:b0:427:2159:370f with SMTP id
 p4-20020a67e1c4000000b004272159370fmr2538299vsl.3.1680291270429; Fri, 31 Mar
 2023 12:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230329220753.7741-1-mario.limonciello@amd.com>
In-Reply-To: <20230329220753.7741-1-mario.limonciello@amd.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Fri, 31 Mar 2023 13:34:19 -0600
Message-ID: <CANg-bXDsYffoYz+VL9hWkhOAyXKXDDLmB1rAvyahf7GCGibfVg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Use CCP driver to handle PSP I2C arbitration
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        Felix Held <Felix.Held@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tested-by: Mark Hasemeyer <markhas@chromium.org>
