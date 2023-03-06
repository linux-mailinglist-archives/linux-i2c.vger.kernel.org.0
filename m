Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FCC6AC211
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 15:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjCFOAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 09:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjCFOAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 09:00:45 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A935305DD
        for <linux-i2c@vger.kernel.org>; Mon,  6 Mar 2023 06:00:40 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id k23so8139208ybk.13
        for <linux-i2c@vger.kernel.org>; Mon, 06 Mar 2023 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678111240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/Y94Pc8yhv157LBUch/tn3T/6KugP9L4mHMFv2Mi1c=;
        b=vA6tYOcfyoBCdfKlR/1Lr7HvkVd06OiCVrXU4TOnwFiit65IdM0kFbVBLqZW5cMmK+
         A5yUU9Mw/tLMUDAf7NRanaVp4fZU9TqqacCQeyq6sJnEI+FMxoGagywCeMfqEPqOeBlu
         nXZe3GT1ey9hKarOppW/jvJi0wQDqDiDWkgi+zWo3VL53r/o2qQ6XywZjqGNfVs+aziJ
         vFDiFhoPpunDokD6pdrYjro1heNldIyNfmCy5fkj2rW2gZBBy0mMduKlEM3Hcg2IYroD
         KAvVMKy94smfbRsD0o8BkZJR9a+/t+J9dmoQ7IUmtTEfx2oHWkOThNqkknbmyZqubsnk
         Ti0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/Y94Pc8yhv157LBUch/tn3T/6KugP9L4mHMFv2Mi1c=;
        b=BF8HvDqNqBIgNr++bfA+me5lNpH73DcUXmgH6UneBjfUqFXY6bCgKwYeV5q9eLNjko
         IDj/BAhM7T2c2uDniAdhULLH25/c3J2gWfjCK4a7fgGI0dsGOysAiqX950y53Sc6VGfr
         urCyZB9sKtyUhQ3jISbRXbKK3EGrV5T3Qw3JXwNpnueN0Ki1W8sYCT8DBw/UL+GZ6OS8
         j6Uha6ZCNsRHWmQjpJiq4W1pp//CEJY3zNNiivr2e8cPc2bo252v9QLkdItZTcsY0nQc
         m6HS4drz7qsU5q9YT5i0FMMgpJ0mkDRQcvhrb8aAfi97+UgPzDmiN+wwJkjQlkML+T7k
         e+6w==
X-Gm-Message-State: AO0yUKWYzQ+yipxeqJ0FrHceFxi+COpja8A87Qw7pk/PBdrc9thJCoeq
        eAdPW1FPwtdjH3EmHoK8EvYG6kYJlQdhlS6B+CJIzw==
X-Google-Smtp-Source: AK7set/+qd3FzcDCbbQjlLKSyczCieknA6kNFFX6l4uSmFR+66HJ7iMYS6i/ooDX/uospypKCFmfiNndLJj2B5M0Ve0=
X-Received: by 2002:a25:8b8f:0:b0:906:307b:1449 with SMTP id
 j15-20020a258b8f000000b00906307b1449mr6437900ybl.5.1678111239717; Mon, 06 Mar
 2023 06:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20230219183059.1029525-1-xiang.ye@intel.com> <20230219183059.1029525-6-xiang.ye@intel.com>
 <CACRpkdbAve++nA0zwHvOm3fy0t9J9g0fR_FO71TTv=TwM6CJYA@mail.gmail.com> <Y/j7cAQaaCXXYe6s@ye-NUC7i7DNHE>
In-Reply-To: <Y/j7cAQaaCXXYe6s@ye-NUC7i7DNHE>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:00:28 +0100
Message-ID: <CACRpkdbg4zu9-yKy3AEKqxTiNKa-LUO2Lokg3pufT0nBz3ubKg@mail.gmail.com>
Subject: Re: [PATCH 5/5] Documentation: Add ABI doc for attributes of LJCA device
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 24, 2023 at 7:02 PM Ye, Xiang <xiang.ye@intel.com> wrote:
> On Fri, Feb 24, 2023 at 11:53:08AM +0100, Linus Walleij wrote:

> > Is the idea that e.g. fwupdmgr should provide a front-end for this?

> We haven't implemented a front-end in fwupdmgr. dfu-util is used to
> update LJCA firmware manually currently. Maybe we will consider
> implementing this in fwupdmgr later.

It's a matter of process rather than implementation really, but if you can
please communicate upward to the project that if this is to go into
consumer hands (i.e. be used by random people on random laptops)
the firmware update should come via fwupdmgr.

Yours,
Linus Walleij
