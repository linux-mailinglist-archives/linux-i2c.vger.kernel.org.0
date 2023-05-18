Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E781C707EFF
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 13:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjERLPh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 07:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjERLPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 07:15:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65E0B8;
        Thu, 18 May 2023 04:15:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1b2so3034508a12.3;
        Thu, 18 May 2023 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684408534; x=1687000534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vurKMc/YYUUVzVXRRGSKlq0dOEViCUdOrU3bCkWvudc=;
        b=LN+h7cb/nb0qiowQAIxQ7xI9Ql/JJl7xtJkMwlLkMQ910mYH8m8Brox5PwyRnbSxfB
         5+lnat8wwGw0RzEHwcTza0xxVhxxHw8q6kVVze9lUMrbAVFC8/aBAY9nIa5qYFEFUop3
         fXERp8YrhlnfMY+1DjtzVpifKAyPQCvGbwqqOTLNZT+H3beOGi6mxIbF/8va+8xk/SFj
         9jSsXsoUp4WldbChB2x4425bJhc6XkioOur+ciFdghtzUGAjobxmsRTBzJ4eza8Dk7S/
         e3VCyFku6YZyNwbYoeuNv5Q/YfbB7pLJbYJrzpR1zoQD+esapujWGlbrbwUGe/K+ZNcG
         rRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684408534; x=1687000534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vurKMc/YYUUVzVXRRGSKlq0dOEViCUdOrU3bCkWvudc=;
        b=GPDt6/F3YePFotVxESoztven1tKBfZ79pvBEpdHTWhoraV0FuzrFZtqdoVayf8K3MM
         OF9u7Y79V0HBirW4et1rzRIHrMmgmkuGgcJc3UJlXRiUd2y0sftXoVXlD+n8A0e24kbA
         RSgA2U8YJ7KEd4oT/dBBJu10uf+jnW1ei88B0yBek9TdOHtfYREoavVAp0gjc6X7xVH6
         tduLD7/NIN/HEWans2Qk9DJA0cRv6BP+WRxgWjmtQR2bS+xnbcP9sTPniVR8DiDRc7xK
         wDqvTS2xAqqdC30H4N7S6LhQiETkpv4d+YBxqrRrLQdK8xWzmMH9LT7AM+8MuHGCb+sG
         NHTQ==
X-Gm-Message-State: AC+VfDxXY8lOdf+eYtIL3mxS+BoX+IcVx9ItsMkblBCPN4kciVhdaTy9
        NBrT4LKoLz9lyEt17GGLwu871ZLY+P2fsztENH4=
X-Google-Smtp-Source: ACHHUZ6LQIkFPtBuZ0OyrS0HcgDd5vy9Wd9TjPUnd3b977BjmOzsfKRTH3S3mxrsqyBgZR7aECDlwm1IozoHKr5kRuo=
X-Received: by 2002:a50:fb9a:0:b0:50c:3dc:2262 with SMTP id
 e26-20020a50fb9a000000b0050c03dc2262mr4443211edq.39.1684408533952; Thu, 18
 May 2023 04:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com> <20230518094340.GC404509@google.com>
In-Reply-To: <20230518094340.GC404509@google.com>
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Thu, 18 May 2023 13:15:22 +0200
Message-ID: <CAJpcXm6p4xL8XGfxbfKf8sXd6Qh8euO5FiWqhzqiLbaeYpe85g@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] mfd: tps6586x: use devm-based power off handler
To:     Lee Jones <lee@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 May 2023 at 11:43, Lee Jones <lee@kernel.org> wrote:
> Do the 2 MFD patches depend on the others?

They depend on 3/5, which is an extension to [1] and makes the
respective device available to its sys-off handler.

1/5 and 2/5 avoid a warning which is shown if the handler is called from
an emergency restart (e.g. panic()). The reason behind it is that the
i2c transfer currently doesn't recognize that it should be atomic in
this phase and utilizes the DMA instead, which schedules out while
waiting for completion ("Voluntary context switch within RCU read-side
critical section!").

[1] https://lore.kernel.org/lkml/20220509233235.995021-4-dmitry.osipenko@collabora.com/
